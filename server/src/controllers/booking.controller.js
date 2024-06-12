// import {HostelOwner} from '../models/hostelOwner.model';
import {Hostel} from '../models/hostel.model.js';
import {Booking} from '../models/booking.model.js';
import {User} from '../models/booking.model.js';
import {Room} from '../models/booking.model.js';
import {Seat} from '../models/seat.model.js';
import {Notification} from '../models/notification.model.js'
import { asyncHandler } from '../utils/asyncHandler.js';
import { CustomError } from '../utils/ApiError.js'
import { generateAccessAndRefreshToken,generateOTP,generateVerificationToken } from '../utils/MinorMethods.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import {uploadOnCloudinary} from '../utils/cloudinary.js'
import {sendEmail} from '../utils/mail.js'
import {generateBookingConfirmationEmail,generateHostelOwnerNotificationEmail} from '../utils/mailTemplate.js'







// Create a new booking
const createBooking = asyncHandler(async (req, res) => {
    try {
        const { user_id, hostel_id, room_id, seat_id, status } = req.body;
        
        // Validate user, hostel, room IDs
        const user = await User.findById(user_id);
        const hostel = await Hostel.findById(hostel_id);
        const room = await Room.findById(room_id);
        // const seat = await Seat.findById(seat_id);
        
        if (!user || !hostel || !room) {
            return res.status(400).json({ message: 'Invalid user, hostel, room, or bed ID' });
        }
   
          
        if(hostel.packedSeats === hostel.totalSeats){
            return res.return(400).json({ message: 'Seat not avalable'})

        }
        
        //  Creating new Booking 
        const newBooking = new Booking({
            user_id,
            hostel_id,
            room_id,
            seat_id,
            status
        });

  
    // Create new seat
        const newSeat = new Seat({
                room_id,
                hostel_id,
                user_associate: user_id,
            })


            await newBooking.save();
            await newSeat.save();

        // Update the seat id to room
            room.seats.push({ seat_id: newSeat._id });
            await room.save();


// Update the no of packed seat in hostel model
            await Hostel.findByIdAndUpdate(hostel_id,{packedSeats: packedSeats+1})

// Notify to Hostel owner and user through Notification

//For user
const newNotification = await Notification({
                message: `You Booking request been sent successfully to ${hostel.hostelName} `,
                user_id
            })


// For HostelOwner
const newNotificationhostelOwner = await Notification({
    message: `There is new Booking request from ${user.fullName}`,
    user_id: hostel.owner_id
})


// Sending Mail to User about Booking Confirmed

const UserEmailTemplate = generateBookingConfirmationEmail("Booking Confirmed",user.fullName,room.room_number,hostel.hostelName)
const mailBookingNotification = await sendEmail(user.email,"Booking Confirmed",UserEmailTemplate)
        
console.log(mailBookingNotification);
if(!mailBookingNotification){
  throw new CustomError(500,"Internal Server Error");
}
          
// Sending Mail to HostelOwner about new Booking 
const hostelOwner = await User.findByIdAndUpdate(hostel.owner_id);

const HostelOwnerEmailTemplate = generateHostelOwnerNotificationEmail("New Seat Booking",hostelOwner.fullName,user.fullName,room.room_number,hostel.hostelName)
const mailNewBookingNotificationToOwner = await sendEmail(hostelOwner.email,"New Seat Booking",HostelOwnerEmailTemplate)
        
console.log(mailNewBookingNotificationToOwner);
if(!mailNewBookingNotificationToOwner){
  throw new CustomError(500,"Internal Server Error");
}




        res.status(201).json(savedBooking);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}
)








// Accept the booking

const AcceptBooking = asyncHandler(async (req, res) => {
    try {
        const { user_id, hostel_id, room_id, seat_id, status } = req.body;
        
        // Validate user, hostel, room, and bed IDs
        const user = await User.findById(user_id);
        const hostel = await Hostel.findById(hostel_id);
        const room = await Room.findById(room_id);
        const seat = await Seat.findById(seat_id);
        
        if (!user || !hostel || !room || !seat) {
            return res.status(400).json({ message: 'Invalid user, hostel, room ID' });
        }
   
    
        
        const updatedBooking = await Booking.findByIdAndUpdate(
            bookingId,
            { status: newStatus },
            { new: true } // Return the updated document
        );

        if (!updatedBooking) {
            console.log(`Booking with ID ${bookingId} not found.`);
            return null;
        }


            await updatedBooking.save();
            




// Notify to Hostel owner and user through Notification

//For user
const newNotification = await Notification({
                message: `You Booking request been Accepted ${hostel.hostelName} `,
                user_id
            })


// For HostelOwner
const newNotificationhostelOwner = await Notification({
    message: `The Accept request has been send to ${user.fullName}`,
    user_id: hostel.owner_id
})


// Sending Mail to User about Booking Confirmed

const UserEmailTemplate = generateBookingConfirmationEmail("Booking Accepted By Hostel",user.fullName,room.room_number,hostel.hostelName)
const mailBookingNotification = await sendEmail(user.email,"Booking Accepted By Hostel",UserEmailTemplate)
        
console.log(mailBookingNotification);
if(!mailBookingNotification){
  throw new CustomError(500,"Internal Server Error");
}
          
// Sending Mail to HostelOwner about new Booking 
const hostelOwner = await User.findByIdAndUpdate(hostel.owner_id);

const HostelOwnerEmailTemplate = generateHostelOwnerNotificationEmail("New Seat Booking",hostelOwner.fullName,user.fullName,room.room_number,hostel.hostelName)
const mailNewBookingNotificationToOwner = await sendEmail(hostelOwner.email,"New Seat Booking",HostelOwnerEmailTemplate)
        
console.log(mailNewBookingNotificationToOwner);
if(!mailNewBookingNotificationToOwner){
  throw new CustomError(500,"Internal Server Error");
}




        res.status(201).json(savedBooking);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}
)











// Get all bookings
exports.getBookings = async (req, res) => {
    try {
        const bookings = await Booking.find().populate('user_id hostel_id room_id seat_id');
        res.status(200).json(bookings);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get a single booking by ID
exports.getBookingById = async (req, res) => {
    try {
        const booking = await Booking.findById(req.params.id).populate('user_id hostel_id room_id seat_id');
        if (!booking) {
            return res.status(404).json({ message: 'Booking not found' });
        }
        res.status(200).json(booking);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Update a booking by ID
exports.updateBooking = async (req, res) => {
    try {
        const { status } = req.body;
        const updatedBooking = await Booking.findByIdAndUpdate(
            req.params.id,
            { status },
            { new: true }
        );
        if (!updatedBooking) {
            return res.status(404).json({ message: 'Booking not found' });
        }
        res.status(200).json(updatedBooking);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Delete a booking by ID
exports.deleteBooking = async (req, res) => {
    try {
        const deletedBooking = await Booking.findByIdAndDelete(req.params.id);
        if (!deletedBooking) {
            return res.status(404).json({ message: 'Booking not found' });
        }
        res.status(200).json({ message: 'Booking deleted successfully' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};


export {
    createBooking,
    AcceptBooking
}
// import {HostelOwner} from '../models/hostelOwner.model';
import Hostel from '../models/hostel.model.js';
import Booking from '../models/booking.model.js';
import User from '../models/user.model.js';
import Room from '../models/booking.model.js';
import Seat from '../models/seat.model.js';
import Notification from '../models/notification.model.js'
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
        const { username, _id } = req.body;
        const hostel_id = _id;
        // Validate user, hostel, room IDs
        const user = await User.findById(username);
        const hostel = await Hostel.findById(_id);
        // const room = await Room.findById(room_id);
        // const seat = await Seat.findById(seat_id);
        const addedBy = hostel.addedBy
        reqstatus = "pending"
        if (!user || !hostel) {
            return res.status(400).json({ message: 'Invalid user, hostel' });
        }
   
          
        if(hostel.packedSeats === hostel.totalSeats){
            return res.return(400).json({ message: 'Seat not avalable'})

        }
        
        //  Creating new Booking 
        const newBooking = new Booking({
            username,
            hostel_id:_id,
            addedBy,
            status:reqstatus
            
            // room_id,
            // seat_id,
        });

  
    // Create new seat
        const newSeat = new Seat({
                // room_id,
                hostel_id,
                user_associate: user_id,
            })


            await newBooking.save();
            await newSeat.save();

        // Update the seat id to room
            // room.seats.push({ seat_id: newSeat._id });
            // await room.save();


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

// const UserEmailTemplate = generateBookingConfirmationEmail("Booking Confirmed",user.fullName,room.room_number,hostel.hostelName)
const UserEmailTemplate = generateBookingConfirmationEmail("Booking Confirmed",user.fullName,hostel.hostelName)
const mailBookingNotification = await sendEmail(user.email,"Booking Confirmed",UserEmailTemplate)
        
console.log(mailBookingNotification);
if(!mailBookingNotification){
  throw new CustomError(500,"Internal Server Error");
}
          
// Sending Mail to HostelOwner about new Booking 
const hostelOwner = await User.findByIdAndUpdate(hostel.owner_id);

const HostelOwnerEmailTemplate = generateHostelOwnerNotificationEmail("New Seat Booking",hostelOwner.fullName,user.fullName,hostel.hostelName)
// const HostelOwnerEmailTemplate = generateHostelOwnerNotificationEmail("New Seat Booking",hostelOwner.fullName,user.fullName,room.room_number,hostel.hostelName)
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



const getStatus = asyncHandler(async(req,res)=>{
    try {
const hostel_id=req.body.hostel_id
      //  const {  hostel_id,username } = req.body;
     console.log(req.body)
     
        const hostel = await Booking.find({hostel_id:hostel_id,});
        //const hostel_id=_id;
   
        const addedBy=hostel.addedBy;
       console.log(hostel)
   res.status(200).json(hostel)
     
    
    } catch (error) {
        throw new CustomError(500, `Internal server error ${error}`);

    }
//res.send("send")
})


const checkNotification = asyncHandler(async(req,res)=>{
    try {
        const {  username,  } = req.body;
     console.log(req.body)
     const bookings = await Booking.find({addedBy:username});
     //const hostel_id=_id;
     const pendingBookings = bookings.filter(booking => booking.status === "pending");

     if (pendingBookings.length > 0) {
         // Do something with pending bookings, e.g., return them in the response
         console.log(pendingBookings.map(booking => booking.addedBy));
         return res.status(200).json(pendingBookings);
     } else {
         // No pending bookings found
         return res.status(200).json({ message: "No pending bookings found" });
     }
 
    } catch (error) {
        throw new CustomError(500, `Internal server error ${error}`);

    }
//res.send("send")
})




// Get all bookings
const getBookings = async (req, res) => {
    try {
        const bookings = await Booking.find().populate('user_id hostel_id room_id seat_id');
        res.status(200).json(bookings);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get a single booking by ID
const getBookingById = async (req, res) => {
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
const updateBooking = async (req, res) => {
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
const deleteBooking = async (req, res) => {
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




const getMyAcceptedBooking = asyncHandler(async (req, res) => {
    const { username } = req.body;
  
    try {
      // Fetch accepted bookings
      const acceptBookings = await Booking.find({ username: username, status: 'accepted' });
  
      if (acceptBookings.length === 0) {
        return res.status(404).json({ message: 'No accepted bookings found for this user' });
      }
  
      // Extract unique hostel IDs
      const hostelIds = acceptBookings.map(booking => booking.hostel_id);
      const uniqueHostelIds = [...new Set(hostelIds)]; // Remove duplicates if any
  
      // Fetch hostel details for these IDs
      const hostels = await Hostel.find({ _id: { $in: uniqueHostelIds } });
  
      res.status(200).json({ hostels });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Server error' });
    }
  });

export {
    createBooking,
    AcceptBooking,
    getMyAcceptedBooking,
    deleteBooking,
    updateBooking,
    getBookingById,
    getBookings,
    getStatus,
    checkNotification
    
}
//import {HostelOwner} from '../models/hostelOwner.model';
//import {Hostel} from '../models/hostel.model';
//import {Booking} from '../models/booking.model';
import Booking from '../models/booking.model.js'
import { asyncHandler } from '../utils/asyncHandler.js';
//import { CustomError } from '../utils/ApiError.js'
import { generateAccessAndRefreshToken,generateOTP,generateVerificationToken } from '../utils/MinorMethods.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import {uploadOnCloudinary} from '../utils/cloudinary.js'
import {sendEmail} from '../utils/mail.js'
import {generateEmailTemplate} from '../utils/mailTemplate.js'
import jwt from 'jsonwebtoken'
import CustomError from '../utils/ApiError.js';
import Hostel from '../models/recent_hostel_model.js'
import User from '../models/user.model.js'
// import Notify from '../models/notification.model.js'
import {generateBookingConfirmationEmail,generateHostelOwnerNotificationEmail} from '../utils/mailTemplate.js'


const bookingController = asyncHandler(async(req,res)=>{
    try {
        const { username, _id,  } = req.body;
     console.log(req.body)
     
     const hostel = await Hostel.findById(_id);
     const hostel_id=_id;

     const addedBy=hostel.addedBy;
     console.log(hostel.addedBy)
     const newBooking = new Booking({


        hostel_id,
        username,
        
        addedBy,
       
    });
    await newBooking.save();
    res.status(200).json(newBooking)
    } catch (error) {
        throw new CustomError(500, `Internal server error ${error}`);

    }

})



// Accept the booking

const AcceptBooking = asyncHandler(async (req, res) => {
    try {
        
        // const { user_id, hostel_id, room_id, seat_id, status } = req.body;
        const { username, hostel_id } = req.body;
        console.log(username,hostel_id);
        const newStatus = "accepted"
        // Validate user, hostel, room, and bed IDs
        const user = await User.findOne({username});
        const hostel = await Hostel.findById(hostel_id);
        console.log(hostel)
        // const room = await Room.findById(room_id);
        // const seat = await Seat.findById(seat_id);
        const userId = user._id;
        if (!user || !hostel) {
            return res.status(400).json({ message: 'Invalid user or  hostel' });
        }
        
        const updatedBooking = await Booking.findOneAndUpdate(
            { username, hostel_id },
            { $set: { status: newStatus } },
            { new: true } // This option returns the updated document
          );
        

        
        

        if (!updatedBooking) {
            console.log(`Booking request for ${username} not found.`);
            return null;
        }


            await updatedBooking.save();
            




// Notify to Hostel owner and user through Notification

//For user
// const newNotification = await Notify({
//                 message: `You Booking request been Accepted ${hostel.hostelName} `,
//                 userId
//             })


// For HostelOwner
// const newNotificationhostelOwner = await Notify({
//     message: `The Accept request has been send to ${user.fullName}`,
//     user_id: hostel.owner_id
// })

const hostelOwner = await User.find({username:hostel.addedBy});

// Sending Mail to User about Booking Confirmed

const UserEmailTemplate = generateBookingConfirmationEmail("Booking Accepted By Hostel",user.fullName,hostel.hostelName)
const mailBookingNotification = await sendEmail(user.email,"Booking Accepted By Hostel",UserEmailTemplate)
        
console.log(user.fullName);
if(!mailBookingNotification){
  throw new CustomError(500,"Internal Server Error");
}
          
// Sending Mail to HostelOwner about new Booking 
console.log("hello",user,hostelOwner)
console.log(hostelOwner.fullName,user.fullName);
const HostelOwnerEmailTemplate = generateHostelOwnerNotificationEmail("New Seat Booking",hostelOwner.fullName,user.fullName,hostel.hostelName)
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











//send notification
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
const getMyAcceptedBooking = asyncHandler(async (req,res)=>{
    const { username } = req.body;
try {
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


    

    // if (!acceptBookings) {
    //     return res.status(404).json({ message: 'User not found' });
    //   }

    //  res.status(200).json({acceptBookings}) 

})
export {
    bookingController,getStatus,checkNotification,getMyAcceptedBooking,AcceptBooking

}
//export default bookingController;
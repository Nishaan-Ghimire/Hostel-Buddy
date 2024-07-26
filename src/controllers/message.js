import { asyncHandler } from '../utils/asyncHandler.js';
import Message from '../models/message.js';
import { ApiResponse } from '../utils/ApiResponse.js'


const message = asyncHandler(async (req, res) => {
  // sender or reciver id
const {id}=req.body
 // const hosteldetail=
   
  try {
    console.log('...................................................................')
    const message = await Message.find({
      //  sender_id: sender_id,
       // reciever: reciever || sender:reciever
       $or: [
        { sender: id },
        { reciever: id }
    ]

      });

    if (!message) {
      return res.status(404).json(new ApiResponse(404, bookings, "Message Not  Found"));
    }

    res.status(200).json(
   
       new ApiResponse(200, message, "Message  Found"

       )
      );
  } catch (error) {
    res.status(500).json(new ApiResponse(500, null, "Something went wrong"));
  }


})
//add message
const addMessage = asyncHandler(async (req, res) => {
    const {sender_username,reciever_username,message}=req.body
     // const hosteldetail=
       
      try {
        console.log('...................................................................')
        const newMessage = await Message.create({
            
          sender: sender_username,
          reciever: reciever_username ,
          message:message,
               // sender_Name:sender_Name
        });
    
        if (!newMessage) {
          return res.status(404).json({ message: 'Something went wrong' });
        }
    
        res.status(200).json(newMessage);
      } catch (error) {
        res.status(500).json({ message: error.message });
      }
    
    
    })

    export {message,addMessage}
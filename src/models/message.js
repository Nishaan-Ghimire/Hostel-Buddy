// models/Hostel.js
import mongoose from 'mongoose';

// const seatSchema = new mongoose.Schema({
//   seatId: String
// });

// const roomSchema = new mongoose.Schema({
//   roomId: String,
//   seats: [seatSchema]
// });

// const hostelSchema = new mongoose.Schema({
//   hostelId: String,
//   name: String,
//   location: String,
//   rent: Number,
//   isAvailable: Boolean,
//   imageUrl: String, // Added imageUrl field
//   rooms: [roomSchema]
// });

// const Hostel = mongoose.model('Hostel', hostelSchema);

// export default Hostel;



const messageSchema = new mongoose.Schema({
  sender: { type: String, required: true },
  reciever: { type: String, required: true },
 message: { type: String, required: true },
   senderName: { type: String, required: false },
//   lat: { type: Number, required: true },
//   long: { type: Number, required: true },
//   costPerMonth: { type: String, required: true },
//   mobile: { type: String, required: true },
//   photo: { type: String, required: true },
//   description: { type: String, required: true },
//   facilities: { type: String, required: true },
//   roomNo:{type:String},
//   isAvailable: { type: Boolean, default: true}

});
const Message = mongoose.model('Message', messageSchema);
export default Message;
//const Property = mongoose.model('Property', propertySchema);

//module.exports = Property;
import mongoose ,{ model, Schema } from "mongoose";

const BookingSchema = new Schema({
    username: { 
        type: String, 
        ref: 'User', 
        required: true 
    },
    hostel_id: {
         type: String,
          ref: 'Hostel', 
          required: true
         },
    // room_id: { 
    //     type: Schema.Types.ObjectId,
    //      ref: 'Room',
    //       required: true 
    //     },
    // seat_id: { 
    //     type: Schema.Types.ObjectId,
    //      ref: 'Bed',
    //       required: true 
    //     },
    status: { 
        type: String,
         enum: ['pending', 'accepted', 'rejected', 'cancelled'], 
         default: 'pending' 
        },
        addedBy: { 
            type: String, 
            //required: true 
            },
    
  },
    {
        timeseries: true,
    });
  
const Booking = mongoose.model('Booking', BookingSchema);
export default Booking
import mongoose from 'mongoose';

const { Schema } = mongoose;
const BookingSchema = new Schema({
    hostel_id: { 
        type: String, 
        required: true 
    },
    username: {
        type: String, 
        required: true 
         },
    addedBy: { 
        type: String, 
        //required: true 
        },

    status: { 
        type: String,
         enum: ['pending', 'accepted', 'rejected', 'cancelled'], 
         default: 'pending' 
        },
    created_at: { 
        type: Date, 
        default: Date.now 
    },
    updated_at: { 
        type: Date, 
        default: Date.now 
    }
  });
  
  export default mongoose.model('Booking', BookingSchema);
  
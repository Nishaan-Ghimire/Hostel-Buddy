const BookingSchema = new Schema({
    user_id: { 
        type: Schema.Types.ObjectId, 
        ref: 'User', 
        required: true 
    },
    hostel_id: {
         type: Schema.Types.ObjectId,
          ref: 'Hostel', 
          required: true
         },
    room_id: { 
        type: Schema.Types.ObjectId,
         ref: 'Room',
          required: true 
        },
    seat_id: { 
        type: Schema.Types.ObjectId,
         ref: 'Bed',
          required: true 
        },
    status: { 
        type: String,
         enum: ['pending', 'accepted', 'rejected', 'cancelled'], 
         default: 'pending' 
        },
    
  },
    {
        timeseries: true,
    });
  
  module.exports = mongoose.model('Booking', BookingSchema);
  
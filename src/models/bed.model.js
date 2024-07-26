const SeatSchema = new Schema({
    room_id: {
         type: Schema.Types.ObjectId, 
         ref: 'Room', 
         required: true 
        },
    status: { 
        type: String, 
        enum: ['available', 'booked', 'not available'], 
        default: 'available'
     },
    created_at: { type: Date, default: Date.now },
    updated_at: { type: Date, default: Date.now }
  });
  
  module.exports = mongoose.model('Seat', SeatSchema);
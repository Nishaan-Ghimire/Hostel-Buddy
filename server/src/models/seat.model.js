const SeatSchema = new Schema({
    room_id: {
         type: Schema.Types.ObjectId, 
         ref: 'Room', 
         required: true 
        },
   
     user_associate: {
        type: Schema.Types.ObjectId,
        required: true
     },
     hostel_id :{
        type: Schema.Types.ObjectId,
        required: true
     },

  }, {
    timeseries: true,
});
  
  module.exports = mongoose.model('Seat', SeatSchema);
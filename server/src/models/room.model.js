const RoomSchema = new Schema({
  hostel_id: { type: Schema.Types.ObjectId, ref: 'Hostel', required: true },
  room_number: { type: Number, required: true },
  seats: [
    {
      seat_id: { type: Schema.Types.ObjectId, ref: 'Seat' }
    }
  ],


}, {
  timeseries: true,
});

module.exports = mongoose.model('Room', RoomSchema);

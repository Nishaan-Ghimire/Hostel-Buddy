const RoomSchema = new Schema({
    hostel_id: { type: Schema.Types.ObjectId, ref: 'Hostel', required: true },
    room_number: { type: String, required: true },
    beds: [
      {
        bed_id: { type: Schema.Types.ObjectId, ref: 'Bed' }
      }
    ],
    created_at: { type: Date, default: Date.now },
    updated_at: { type: Date, default: Date.now }
  });
  
  module.exports = mongoose.model('Room', RoomSchema);
  
const HostelSchema = new Schema({
    owner_id: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        // required: true
    },

    hostelName: { 
        type: String, 
        required: true 
    },

    address: { 
        type: String, 
        required: true 
    },
    totalRooms: {
        type: Number,
        required: true 
    },
    totalSeats: {
        type: Number,
        required: true
    },
    packedSeats: {
        type: Number,
        required: true
    },
    location: {
        longitude: {
            type: String,
            required: true
             },
             latitude: { 
            type: String,
            required: true
        }
    },
    rooms: [
        {
            room_id: { type: Schema.Types.ObjectId, ref: 'Room' }
        }
    ],
    verified: { 
        type: Boolean, 
        default: false 
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

HostelSchema.index({ location: '2dsphere' });

module.exports = mongoose.model('Hostel', HostelSchema);

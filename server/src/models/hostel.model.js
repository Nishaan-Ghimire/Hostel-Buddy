const HostelSchema = new Schema({
    owner_id: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },

    name: { 
        type: String, 
        required: true 
    },

    address: { 
        type: String, 
        required: true 
    },
    totalRooms: {
        type: Number
    },
    totalSeat: {
        type: Number
    },
    location: {
        type: { type: String,
             default: 'Point' 
            },
        coordinates: { 
            type: [Number], 
            default: [0, 0] 
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

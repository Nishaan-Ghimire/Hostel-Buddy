import mongoose, {Schema} from "mongoose";

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
    oneSitter:{
        type: Number
    },
    twoSitter:{
        type: Number
    },
    threeSitter:{
        type: Number
    },
    fourSitter:{
        type: Number
    },
    fiveSitter:{
        type: Number
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
   
}, {
    timeseries: true,
});

HostelSchema.index({ location: '2dsphere' });
export const Hostel = mongoose.model('Hostel', HostelSchema);

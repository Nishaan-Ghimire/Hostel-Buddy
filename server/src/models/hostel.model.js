import mongoose, {Schema} from "mongoose";


const HostelSchema = new Schema({
    owner_id: {
        type: Schema.Types.ObjectId,
        ref: 'User',
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
    noOfSeater: {
         type: String, 
         required: true 
        },
        city: { 
            type: String, 
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
    costPerMonth: { 
        type: String,
         required: true 
        },
        photo: { 
            type: String, 
            required: true 
        },
        description: { 
            type: String,
             required: true },
        facilities: { type: 
            String, 
            required: true
         },
        roomNo:{
            type:String
        },
        addedBy:{
            type:String
        },
        isAvailable: { 
            type: Boolean, 
            default: true
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
        type: {
            type: String,
            enum: ['Point'],
            default: 'Point'
        },
        coordinates: {
            type: [Number], // [<longitude>, <latitude>]
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
    timestamps: true,
});

HostelSchema.index({ 
    name: 'text', 
    description: 'text', 
    city: 'text',  // Use 'city' instead of 'location'
    facilities: 'text' 
  });

HostelSchema.index({ location: '2dsphere' });
const Hostel = mongoose.model('Hostel', HostelSchema);
export default Hostel
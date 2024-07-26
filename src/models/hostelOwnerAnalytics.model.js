import mongoose, {Schema} from "mongoose";

const analyticsSchema = new mongoose.Schema({
    hostelId: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'Hostel', 
        required: true 
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User', 
    },
    visitDate: {
        type: Date,
        default: Date.now
    }
}, { timestamps: true });

const hostelOwnerAnalytics = mongoose.model('hostelOwnerAnalytics', analyticsSchema);

export default hostelOwnerAnalytics;
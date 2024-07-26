import mongoose, { Schema } from 'mongoose';

const reviewSchema = new Schema({
    user_id: { type:String
        
        //Schema.Types.ObjectId
        , ref: 'User', required: true },
    hostel_id: { type: String
        
        //Schema.Types.ObjectId
        , ref: 'Hostel', required: true },
    star_rating: { type: Number, min: 1, max: 5, required: true },
    comment: { type: String, required: true },
    createdAt: { type: Date, default: Date.now },
});

export default mongoose.model('Review', reviewSchema);
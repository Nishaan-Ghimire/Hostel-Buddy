import mongoose, { Schema } from 'mongoose';

const reviewSchema = new Schema({
    user_id: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    hostel_id: { type: Schema.Types.ObjectId, ref: 'Hostel', required: true },
    star_rating: { type: Number, min: 1, max: 5, required: true },
    comment: { type: String, required: true },
    createdAt: { type: Date, default: Date.now },
});

const Review =  mongoose.model('Review', reviewSchema);

export default Review
import mongoose,{Schema} from 'mongoose'

const analyticsSchema = new Schema({
  userId: {
    type: String,
    required: true,
  },
  action: {
    type: String,
    required: true,
    enum: ['logged in', 'registration', 'vendor logged in', 'vendor registration'],
  },
  date: {
    type: Date,
    default: Date.now,
  },
});

const Analytics = mongoose.model('Analytics', analyticsSchema);


export default Analytics;


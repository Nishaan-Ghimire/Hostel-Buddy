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

















// const mongoose = require('mongoose');

// const analyticsSchema = new mongoose.Schema({
//   totalUserCount: {
//     type: Number,
//     default: 0,
//   },
//   totalVerifiedUserCount: {
//     type: Number,
//     default: 0,
//   },
//   loginCount: {
//     type: Number,
//     default: 0,
//   },
//   TotalLoggedInUsers:{
//     type: Number,
//     default: 0,
//   }
  
// });

// const Analytics = mongoose.model('Analytics', analyticsSchema);

// module.exports = Analytics;

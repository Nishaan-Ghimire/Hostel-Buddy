import mongoose ,{ model, Schema } from "mongoose";

const notificationSchema = new mongoose.Schema({
    message: {
        type: String,
        required: true
    },
  
    isRead: {
        type: Boolean,
        default: false
    },
    user_id: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    }
    
},{
    timeseries: true,
});

const Notification = mongoose.model('Notification', notificationSchema);

export default Notification;
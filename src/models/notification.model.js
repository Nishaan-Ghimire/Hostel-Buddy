const mongoose = require('mongoose');

const notificationSchema = new mongoose.Schema({
    recipientId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        refPath: 'recipientRole' 
    },
    recipientRole: {
        type: String,
        required: true,
        enum: ['user', 'hostel_owner', 'admin']
    },
    message: {
        type: String,
        required: true
    },
    type: {
        type: String,
        enum: ['booking_request', 'booking_confirmation', 'general'],
        required: true
    },
    isRead: {
        type: Boolean,
        default: false
    },
    createdAt: {
        type: Date,
        default: Date.now
    },
    data: {
        type: Map,
        of: mongoose.Schema.Types.Mixed,
        default: {}
    }
});

module.exports = mongoose.model('Notification', notificationSchema);
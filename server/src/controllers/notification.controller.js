const Notification = require('../models/notification.model.js'); 



// Create a new notification
exports.createNotification = async (req, res) => {
    try {
        const notification = new Notification(req.body);
        const savedNotification = await notification.save();
        res.status(201).json(savedNotification);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Get all notifications
exports.getAllNotifications = async (req, res) => {
    try {
        const notifications = await Notification.find();
        res.status(200).json(notifications);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get notifications by recipient role
exports.getNotificationsByRole = async (req, res) => {
    try {
        const { role } = req.params;
        const notifications = await Notification.find({ recipientRole: role });
        res.status(200).json(notifications);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Update notification by ID
exports.updateNotification = async (req, res) => {
    try {
        const { id } = req.params;
        const updatedNotification = await Notification.findByIdAndUpdate(id, req.body, { new: true });
        res.status(200).json(updatedNotification);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

// Delete notification by ID
exports.deleteNotification = async (req, res) => {
    try {
        const { id } = req.params;
        await Notification.findByIdAndDelete(id);
        res.status(204).json({ message: 'Notification deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

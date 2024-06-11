import mongoose from 'mongoose'


// Create a new notification
createNotification = async (message) => {
    try {
        const notification = new Notification(message);
        const savedNotification = await notification.save();
        res.status(201).json(savedNotification);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};



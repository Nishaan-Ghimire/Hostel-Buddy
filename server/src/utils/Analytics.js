
import Analytics from '../models/analytics.model.js'

export const trackEvent = async (userId, action) => {
  try {
    // Create a new event entry
    const newAnalytics = new Analytics({
      userId,
      action,
    });

    // Save the event to the database
    await newAnalytics.save();
    console.log('Event tracked successfully');
  } catch (error) {
    console.error('Error tracking event:', error);
  }
};

export const getActiveUsers = async (startDate, endDate) => {
  try {
    // Count distinct users who performed actions in the given date range
    const activeUsers = await Analytics.aggregate([
      {
        $match: {
          date: { $gte: new Date(startDate), $lt: new Date(endDate) },
        },
      },
      {
        $group: {
          _id: "$userId",
        },
      },
      {
        $count: "totalActiveUsers",
      },
    ]);

    return activeUsers.length > 0 ? activeUsers[0].totalActiveUsers : 0;
  } catch (error) {
    console.error('Error retrieving active users:', error);
    return 0;
  }
};





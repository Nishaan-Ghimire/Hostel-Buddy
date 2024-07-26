// Get the number of active users within a specific date range
import Analytics from "../models/analytics.model.js"
import hostelOwnerAnalytics from "../models/hostelOwnerAnalytics.model.js"
import Booking from "../models/booking.model.js"

export const getActiveUsersInRange = async (startDate, endDate) => {
    try {
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

  export const getBookingsInRange = async (startDate, endDate) => {
    try {
      const bookings = await Booking.aggregate([
        {
          $match: {
            createdAt: { $gte: new Date(startDate), $lt: new Date(endDate) },
          },
        },
        {
          $group: {
            _id: "$user_id",
          },
        },
        {
          $count: "totalBookings",
        },
      ]);
  
      return bookings.length > 0 ? bookings[0].totalBookings : 0;
    } catch (error) {
      console.error('Error retrieving bookings:', error);
      return 0;
    }
  };

// Helper function to get start and end dates for a month
  export const getMonthDateRange = (year, month) => {
    const startDate = new Date(year, month, 1);
    const endDate = new Date(year, month + 1, 1);
    return { startDate, endDate };
  };



  export const getDaysAgo = (date) => {
    const now = new Date();
    const diffTime = Math.abs(now - date);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return `${diffDays} days ago`;
  };
  


  // Log a visit to a hostel by a specific user
export const logVisit = async (userId,hostelId) => {
  try { 
      const analytics = new hostelOwnerAnalytics({ hostelId, userId });
      await analytics.save();
     return true;
  } catch (error) {
      return false;
  }
};


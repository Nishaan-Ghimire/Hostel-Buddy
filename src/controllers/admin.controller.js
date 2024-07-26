import User from '../models/user.model.js';
import { asyncHandler } from '../utils/asyncHandler.js';
import  CustomError  from '../utils/ApiError.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import hostelModel from '../models/recent_hostel_model.js';
import Analytics from '../models/analytics.model.js'
import Booking from '../models/booking.model.js'
import {getActiveUsersInRange,getBookingsInRange,getMonthDateRange,getDaysAgo} from '../utils/analyticsMinorMethods.js'
import  {generateAccessAndRefreshToken}  from '../utils/MinorMethods.js';
import adminNotification from '../models/adminNotification.model.js'

export const getAllVerificationRequest = asyncHandler(async (req, res) => {
  try {
    const users = await User.find({ kyc_status: 'Pending' }).select('-password -refreshToken -accessToken');
    
    if (!users.length) {
      return res.status(404).json({ error: 'No users with pending KYC status found' });
    }
    
    res.json(users);
  } catch (error) {
    console.error('Error retrieving users with pending KYC status:', error);
    res.status(500).json({ error: 'Failed to retrieve users with pending KYC status' });
  }
});



export const verifyHostel = asyncHandler(async(req,res)=>{
    const { user_id } = req.body;
    
    
  try {
    const user = await User.findOne(user_id);
    if(!user){
      res.json(new ApiResponse(200,"This Application doesn't exist"));
    }
    
    const updatedUser = await User.findByIdAndUpdate(user._id,{kyc_status: 'Verified'});

  } catch (error) {
    
    throw new CustomError(500,"Internal Server Error")
  }
})

export const getUsersWithPendingKYC = asyncHandler(async (req, res) => {
  try {
    const users = await User.find({ kyc_status: 'Pending' });
    if (users.length === 0) {
      return res.json(new ApiResponse(200, "No users with pending KYC status found"));
    }
    
    res.json(users);
  } catch (error) {
    console.error('Error retrieving users with pending KYC status:', error);
    throw new CustomError(500, "Internal Server Error");
  }
});




export const allAccounts = asyncHandler(async (req,res)=>{
  try{
    const users = await User.find({});
    return res.json(users)
  }
  catch(error){
    throw new CustomError(500,"Internal Server Error")
  }
  })



export const RecoverAccount = asyncHandler(async (req,res)=>{
  const {user_id, email, password} = req.body;
  try {
    const updatedUser = await User.findByIdAndUpdate(user_id,{password});
    if(!updatedUser){
      res.json(new ApiResponse(200,"User doesn't exist"));
    }
    res.json(new ApiResponse(200,"Successfully Updated"));
  } catch (error) {
    
  }
})





export const user_login_count = asyncHandler(async (req,res) => {
  try {
    const totalUserLogins = await Analytics.countDocuments({ action: 'logged in' });
    return res.json({totalUserLogins});
  } catch (error) {
    console.error('Error retrieving total user logins:', error);
    return res.json({error});
  }
});



export const user_register_count = asyncHandler(async (req,res) => {
  try {
    const totalUserRegistrations = await Analytics.countDocuments({ action: 'registration' });
    return res.json({totalUserRegistrations});
  } catch (error) {
    console.error('Error retrieving total user registrations:', error);
    return 0;
  }
});



export const hostelOwner_login_count = asyncHandler(async (req,res) => {
  try {
    const totalVendorLogins = await Analytics.countDocuments({ action: 'vendor logged in' });
    return res.json({totalVendorLogins});
  } catch (error) {
    console.error('Error retrieving total vendor logins:', error);
    return 0;
  }
});



export const hostelOwner_register_count = asyncHandler(
  async (req,res) => {
    try {
      const totalVendorRegistrations = await Analytics.countDocuments({ action: 'vendor registration' });
      return res.json({totalVendorRegistrations});
    } catch (error) {
      console.error('Error retrieving total vendor registrations:', error);
      return 0;
    }
  }

);
  
// Get the number of weekly active users
export const getWeeklyActiveUsers = asyncHandler(
async (req,res) => {
  const today = new Date();
  const startDate = new Date();
  startDate.setDate(today.getDate() - 7); // 7 days ago

  const endDate = today; // Current date

  const weeklyactiveUsers = await getActiveUsersInRange(startDate, endDate);
  return res.json({'weeklyactiveUsers':weeklyactiveUsers})
});

// Get the number of monthly active users
export const getMonthlyActiveUsers = async () => {
  const today = new Date();
  const startDate = new Date();
  startDate.setMonth(today.getMonth() - 1); // 1 month ago

  const endDate = today; // Current date

  const monthlyactiveUsers = await getActiveUsersInRange(startDate, endDate);
  return res.json({'weeklyactiveUsers':monthlyactiveUsers})
};



export const getAnalyticsDetail = asyncHandler(async (req, res) => {
  try {
    // Get counts for different actions
    const totalUserLogins = await Analytics.countDocuments({ action: 'logged in' });
    const totalUserRegistrations = await Analytics.countDocuments({ action: 'registration' });
    const totalVendorLogins = await Analytics.countDocuments({ action: 'vendor logged in' });
    const totalVendorRegistrations = await Analytics.countDocuments({ action: 'vendor registration' });

    // Calculate weekly and monthly active users
    const today = new Date();

    const startDateWeekly = new Date();
    startDateWeekly.setDate(today.getDate() - 7); // 7 days ago
    const weeklyActiveUsers = await getActiveUsersInRange(startDateWeekly, today);

    const startDateMonthly = new Date();
    startDateMonthly.setMonth(today.getMonth() - 1); // 1 month ago
    const monthlyActiveUsers = await getActiveUsersInRange(startDateMonthly, today);
    const unreadNotificationCount = await adminNotification.countDocuments({ isRead: false });
    // Send response with all metrics
    return res.json({
      totalUserLogins,
      totalUserRegistrations,
      totalVendorLogins,
      totalVendorRegistrations,
      weeklyActiveUsers,
      monthlyActiveUsers,
      unreadNotificationCount
    });
  } catch (error) {
    console.error('Error retrieving metrics:', error);
    return res.status(500).json({ error: 'An error occurred while retrieving metrics' });
  }
});




export const getBookingDetails = asyncHandler(async (req, res) => {
  try {
    const now = new Date();
    const startOfCurrentWeek = new Date(now.setDate(now.getDate() - now.getDay()));
    const startOfLastWeek = new Date(startOfCurrentWeek);
    startOfLastWeek.setDate(startOfLastWeek.getDate() - 7);

    const startOfCurrentMonth = new Date(now.getFullYear(), now.getMonth(), 1);
    const endOfCurrentMonth = new Date(now.getFullYear(), now.getMonth() + 1, 1);

    // Get total bookings
    const totalBookings = await Booking.countDocuments({});

    // Get total bookings last week
    const totalBookingsLastWeek = await getBookingsInRange(startOfLastWeek, startOfCurrentWeek);

    // Get total bookings for the current month
    const totalBookingsCurrentMonth = await getBookingsInRange(startOfCurrentMonth, endOfCurrentMonth);

    // Get total bookings and active users for each month from January to December
    const monthlyBookings = {};
    const monthlyActiveUsers = {};

    for (let month = 0; month < 12; month++) {
      const { startDate, endDate } = getMonthDateRange(now.getFullYear(), month);
      
      const bookings = await getBookingsInRange(startDate, endDate);
      const activeUsers = await getActiveUsersInRange(startDate, endDate);

      const monthName = new Date(startDate).toLocaleString('default', { month: 'long' });
      monthlyBookings[monthName] = bookings;
      monthlyActiveUsers[monthName] = activeUsers;
    }

    // Construct the response
    const response = {
      totalBookings,
      totalBookingsLastWeek,
      totalBookingsCurrentMonth,
      monthlyBookings,
      monthlyActiveUsers,
    };

    res.json(response);
  } catch (error) {
    console.error('Error retrieving booking details:', error);
    res.status(500).json({ error: 'Failed to retrieve booking details' });
  }
});


// Controller to get user details by ID
export const getUserDetailsById = asyncHandler(async (req, res) => {
  try {
    const userId = req.params.id;

    // Fetch user details
    const user = await User.findById(userId).select('-password -refreshToken -accessToken'); // Exclude password, refreshToken, and accessToken from the response

    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    // Fetch booking details
    const bookings = await Booking.find({ user_id: userId });

    // Fetch hostel names for each booking
    const bookingDetails = await Promise.all(
      bookings.map(async (booking) => {
        const hostel = await hostelModel.findById(booking.hostel_id);
        return {
          bookingId: booking._id,
          hostelName: hostel ? hostel.hostelName : 'Unknown',
          dateOfBooking: booking.createdAt // Assuming you have a createdAt field for the booking date
        };
      })
    );

    // Construct the response
    const response = {
      user,
      bookingDetails
    };

    res.json(response);
  } catch (error) {
    console.error('Error retrieving user details:', error);
    res.status(500).json({ error: 'Failed to retrieve user details' });
  }
});




export const adminLoginController = asyncHandler(async (req, res) => {
  try {
      const { email, password } = req.body;

      // Check if email and password are provided
      if (!email || !password) {
          throw new CustomError(409, "All fields are necessary");
      }

      // Find the user by email
      const adminUser = await User.findOne({ email });

      // Check if the user exists
      if (!adminUser) {
          throw new CustomError("User doesn't exist");
      }

     

      // Verify the password
      const isPasswordValid = await adminUser.isPasswordCorrect(password);
      if (!isPasswordValid) {
          throw new CustomError(401, "Incorrect Credentials");
      }


       // Check if the user has the role of "Admin"
       if (adminUser.role !== 'Admin') {
        throw new CustomError(403, "You are not authorized to access this resource");
    }
      // Generate access and refresh tokens
      const { accessToken, refreshToken } = await generateAccessAndRefreshToken(adminUser._id);

      // Select fields to be returned and exclude sensitive information
      const loggedInUser = await User.findById(adminUser._id).select("-password -refreshToken");

      // Define cookie options
      const options = {
          httpOnly: true,
          secure: true
      };

      

      // Return response with tokens and user details
      return res
          .status(200)
          .cookie("accessToken", accessToken, options)
          .cookie("refreshToken", refreshToken, options)
          .json(
              new ApiResponse(
                  200,
                  {
                      user: loggedInUser,
                      accessToken,
                      refreshToken
                  },
                  "Admin logged in successfully"
              )
          );
  } catch (error) {
      console.error('Error during admin login:', error);
      res.status(500).json({ error: error.message });
  }
});


export const getAllNotifications = asyncHandler(async (req, res) => {
  try {
    // Fetch unread notifications with aggregation pipeline
    const notifications = await adminNotification.aggregate([
      {
        $match: { isRead: false } // Only fetch unread notifications
      },
      {
        $lookup: {
          from: 'users',
          localField: 'user_id',
          foreignField: '_id',
          as: 'user'
        }
      },
      {
        $unwind: '$user'
      },
      {
        $project: {
          _id: 1,
          message: 1,
          isRead: 1,
          createdAt: 1,
          user_id: 1,
          user: { username: 1 }
        }
      },
      {
        $addFields: {
          formattedMessage: {
            $concat: ["$user.username", " ", "$message"]
          },
          daysAgo: {
            $let: {
              vars: {
                days: { $floor: { $divide: [{ $subtract: [new Date(), "$createdAt"] }, 1000 * 60 * 60 * 24] } }
              },
              in: {
                $concat: [{ $toString: "$$days" }, " days ago"]
              }
            }
          }
        }
      }
    ]);

    // Mark fetched notifications as read
    await adminNotification.updateMany(
      { _id: { $in: notifications.map(notification => notification._id) } },
      { $set: { isRead: true } }
    );

    return res.status(200).json(new ApiResponse(200, notifications, "Notifications fetched successfully"));
  } catch (error) {
    console.error('Error fetching notifications:', error);
    return res.status(500).json({ error: 'Server error' });
  }
});
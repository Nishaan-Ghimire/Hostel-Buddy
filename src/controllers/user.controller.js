import User from '../models/user.model.js';
import { asyncHandler } from '../utils/asyncHandler.js';
//import { CustomError } from '../utils/ApiError.js'
import { generateAccessAndRefreshToken,generateOTP,generateVerificationToken } from '../utils/MinorMethods.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import {uploadOnCloudinary} from '../utils/cloudinary.js'
import {sendEmail} from '../utils/mail.js'
import {generateEmailTemplate} from '../utils/mailTemplate.js'
import jwt from 'jsonwebtoken'
import CustomError from '../utils/ApiError.js';
import Hostel from '../models/recent_hostel_model.js';
import Booking from '../models/booking.model.js'
import mongoose from "mongoose";
const testEndpoint=asyncHandler(async(req,res)=>{
        res.send("hello world")
})

const registerController = asyncHandler(async (req, res) => {

        try {
               
                const { fullName, dob, username, email, phoneNo, password,
                         college, company,jobStatus,collegelongitude, 
                         collegelatitude,fieldOfProfession,
                        hostelName,pan_card,
                        kyc_doc,role } = req.body;
                if (!fullName || !dob || !username || !email || !phoneNo || !password) {

                        throw new CustomError(409, "All fields are necessary");
                }
              
                if(jobStatus === 'Student'){
                        if(!college){
                                throw new CustomError(409, "All fields are necessary");
                        }
                }
               
                if(jobStatus === 'Working'){
                        if(!company){
                                throw new CustomError(409, "All fields are necessary");
                        }
                }
                
                const exisitingUser = await User.findOne({
                        $or: [{ username }, { email }, { phoneNo }]
                })
                console.log(exisitingUser);
                if (exisitingUser) {
                        res
                                .status(409)
                                .json({ message: "User already exist" })
                        // throw new CustomError(409, "This user already exist")
                } else {

                        console.log(req.body)
const r='User'
        console.log("All fine till here")
                        const newUser = await User.create({
                                fullName,
                                dob,
                                username,
                                email,
                                phoneNo,
                                password,
                                jobStatus,
                                fieldOfProfession,
                                college: {
                                        longitude:collegelongitude,
                                        latitude:collegelatitude
                                    },
                                    hostelName,
                                    pan_card,
                                    kyc_doc
                                ,
                               

                        })
               
        const newUserId = newUser._id;
                        const user = await User.findById(newUser._id).select("-password -refreshToken");

                        if (!user) {
                                throw new CustomError(500, "Something went wrong cannot create user")
                        }

                        return res
                                .status(201)
                                .json(new ApiResponse(201, user, "User registered successfully"))

                }


        } catch (error) {
                throw new CustomError(500, `Internal server error ${error}`);
        }



})





const loginController = asyncHandler(async (req, res) => {
        try {

                const { email, password } = req.body;
                if (!email || !password) {

                        throw new CustomError(409, "All fields are necessary");
                }

                const loginUser = await User.findOne({ email });
                if (!loginUser) {
                        throw new CustomError("User doesn't exist")
                }
                const isPasswordValid = await loginUser.isPasswordCorrect(password);
                if (!isPasswordValid) {
                        throw new CustomError(401, "Incorrect Credentials")
                }
//console.log('user id ...........'+loginUser._id)

                const { accessToken, refreshToken } = await generateAccessAndRefreshToken(loginUser._id);

                const loggedInUser = await User.findById(loginUser._id).select("-password -refreshToken");
console.log("logges"+loggedInUser)
                const options = {
                        httpOnly: true,
                   //     secure: true
                }
                console.log('access,,,'+accessToken)

                return res
                        .status(200)
                        .cookie("accessToken", accessToken, options)
                        .cookie("refreshToken", refreshToken, options)
                        .json(


                                new ApiResponse(
                                        200,
                                        {
                                                user: loggedInUser, accessToken, refreshToken
                                        },
                                        "User logged in Successfully"
                                )
                        )


        } catch (error) {
                console.log({ error });
                res.json({ error })
        }
})


const logoutController = asyncHandler(async (req, res) => {

        await User.findByIdAndUpdate(req.user._id, {
                $set: {
                        refreshToken: 1,
                },
        }, {
                new: true,
        })

        const options = {
                httpOnly: true,
                secure: true,
        }


        return res
                .status(200)
                .clearCookie("accessToken", options)
                .clearCookie("refreshToken", options)
                .json(new ApiResponse(200, {}, "User logged Out"))


});




const changePasswordController = asyncHandler(async (req, res) => {
        const { oldPassword, newPassword } = req.body;
        // Verify Old password
        const user = req.user;
        const userDetail = await User.findById(user._id);
        const ispasswordVerified = await userDetail.isPasswordCorrect(oldPassword);
        if (!ispasswordVerified) {
                throw new CustomError(401, "Password is incorrect");
        }

        userDetail.password = newPassword;
        await userDetail.save({ validateBeforeSave: false });

        return res
                .status(200)
                .json(new ApiResponse(200, {}, "Password Changed successfully"));



})


const getUserDetail = asyncHandler(async (req, res) => {
        const user = req.user;
        return res
                .status(200)
                .json(new ApiResponse(200, user));
})
//

// const getUserByUserName = async (req, res) => {
//         const usernames = req.body.usernames; // Accepting a list of usernames
    
//         if (usernames && Array.isArray(usernames)) {
//             try {
//                 const users = await User.find({ username: { $in: usernames } });
//                 return res
//                     .status(200)
//                     .json(new ApiResponse(200, users, "Users Found"));
//             } catch (error) {
//                 return res
//                     .status(500)
//                     .json(new ApiResponse(500, null, "Internal Server Error"));
//             }
//         }
    
//         return res
//             .status(400)
//             .json(new ApiResponse(400, null, "Invalid input, expected a list of usernames"));
//     };

//Below username method only gives unique like [1,1,1,1]for this only one user so we created this for showReview

const getUserByUserNameWithMayBeSameUserName = async (req, res) => {
        const usernames = req.body.usernames; // Accepting a list of usernames
        console.log('uuu', usernames);
      
        if (usernames && Array.isArray(usernames)) {
          try {
            // Fetch users for the unique usernames
            const uniqueUsernames = [...new Set(usernames)];
            const users = await User.find({ username: { $in: uniqueUsernames } });
      
            // Map the results back to the original usernames list, preserving duplicates
            const usersMap = {};
            users.forEach(user => {
              usersMap[user.username] = user;
            });
      
            // Create the result array based on the original usernames, including duplicates
            const result = usernames.map(username => {
              if (usersMap[username]) {
                // Return a copy of the user object to ensure independent instances
                return { ...usersMap[username]._doc };
              } else {
                return null;
              }
            });
      
            return res
              .status(200)
              .json(new ApiResponse(200, result, "Users Found"));
          } catch (error) {
            console.error('Error fetching users:', error);
            return res
              .status(500)
              .json(new ApiResponse(500, null, "Internal Server Error"));
          }
        }
      
        return res
          .status(400)
          .json(new ApiResponse(400, null, "Invalid input, expected a list of usernames"));
      };

/////////////////////////
const getUserByUserName = async (req, res) => {
        const usernames = req.body.usernames; // Accepting a list of usernames
    console.log('uuu',usernames)
        if (usernames && Array.isArray(usernames)) {
            try {
                // Fetch users for the unique usernames
                const uniqueUsernames = [...new Set(usernames)];
                const users = await User.find({ username: { $in: uniqueUsernames } });
    
                // Map the results back to the original usernames list, preserving duplicates
                const usersMap = {};
                users.forEach(user => {
                    usersMap[user.username] = user;
                });
    
                // Create the result array based on the original usernames, including duplicates
                const result = usernames.map(username => usersMap[username] || null);
    
                return res
                    .status(200)
                    .json(new ApiResponse(200, result, "Users Found"));
            } catch (error) {
                return res
                    .status(500)
                    .json(new ApiResponse(500, null, "Internal Server Error"));
            }
        }
    
        return res
            .status(400)
            .json(new ApiResponse(400, null, "Invalid input, expected a list of usernames"));
    };
// accept or decline booking request 

const requestAction=asyncHandler(async (req,res)=>{
const {isAccepted,id}=req.body;
let objectId;

// if (!mongoose.Types.ObjectId.isValid(id)) {
//         return res.status(400).json({ message: 'Invalid booking ID' });
//       }
objectId = new mongoose.Types.ObjectId(id);

      const filter = { _id: new mongoose.Types.ObjectId(id) };
      const update = { 
        status: isAccepted ? 'accepted' : 'rejected', // Update based on isAccepted value
        updated_at: new Date() // Ensure updated_at field is also updated
      };
    
      try {
        const doc = await Booking.findOneAndUpdate(filter, update, { new: true });
        
        if (!doc) {
          return res.status(404).json({ message: 'Booking not found' });
        }
    
        return res.json(doc);
      } catch (error) {
        return res.status(500).json({ message: 'An error occurred', error: error.message });
      }

})







// const getUserByUserName = async (req, res) => {
//         const username=req.body.username;
//       //  console.log("hello"+u)
        
//      //  console.log(req.body)
//        // const username = req.body.username;
//         //console.log(req.body)

//         if (username) {
//                 const user =await User.findOne({username:username});
//                 return res
//    //     .status(200).json(user);
//         .json(new ApiResponse(200, user, "User Found")); 

//         }
// return res
//         .status(400)
//         .json(new ApiResponse(400, "Something went wrong"));      
// }


const updateAccountDetail = asyncHandler(async(req,res)=>{
        const {email, phoneNo, fullName, dob} = req.body;
        const updateFields = {};

        if(email) updateFields.email = email;
        if(phoneNo) updateFields.phoneNo = phoneNo;
        if(fullName) updateFields.fullName = fullName;
        if(dob) updateFields.dob = dob;


        // Check if there is anything to update
        if(Object.keys(updateFields).length === 0){
                return res.status(400).json(new ApiResponse(400, null, "No details provided to update"));
        }

        const user = await User.findByIdAndUpdate(
                req.user?._id,
                {$set: updateFields },
                {new: true } 
        ).select("-password -refreshToken");

        return res
        .status(201)
        .json(new ApiResponse(200,user,"User details updated successfully"));
})






const uploadProfilePicture = asyncHandler(async (req, res) => {
        const profilePicPath = req?.file?.path;
        if (!profilePicPath) {
                throw new CustomError(400, "File not provided");
        }

        const profilePic = await uploadOnCloudinary(profilePicPath);

        const user = await User.findByIdAndUpdate(req.user?._id, {
                $set: {
                        profileImage: profilePic?.url
                }
        }, {
                new: true
        }).select("-password -refreshToken");

        if (!user) {
                throw new CustomError(500, "Internal Server Error");
        }

        res
                .status(200)
                .json(new ApiResponse(200, user, "Profile Picture Uploaded Successfully"))

})


const getUserDetailInfo = asyncHandler(async (req,res)=>{
        const {jobStatus, college, company, fieldOfProfession} = req.body;

        if(jobStatus === "Student"){
              const user = await User.findByIdAndUpdate(req.user?._id,{
                $set: {
                        jobStatus,
                        college,
                        fieldOfProfession
                } 
              },{new: true}).select("-password -refreshToken");  
        }else if(jobStatus === "Working"){
                const user = await User.findByIdAndUpdate(req.user?._id,{
                        $set: {
                                jobStatus,
                                company,
                                fieldOfProfession
                        } 
                      },{new: true}).select("-password -refreshToken");    
        }  else{
                const user = await User.findByIdAndUpdate(req.user?._id,{
                        $set: {
                                jobStatus,
                                fieldOfProfession
                        } 
                      },{new: true}).select("-password -refreshToken");    
        }


        if (!user) {
                throw new CustomError(500, "Internal Server Error");
        }

        res
                .status(200)
                .json(new ApiResponse(200, user, "Detail Updated Successfully"));

})





const uploadCoverPicture = asyncHandler(async (req, res) => {
        const coverPicPath = req?.file?.path;
        if (!coverPicPath) {
                throw new CustomError(400, "File not provided");
        }

        const coverPic = await uploadOnCloudinary(coverPicPath);

        const user = await User.findByIdAndUpdate(req.user?._id, {
                $set: {
                        coverImage: coverPic?.url
                }
        }, {
                new: true
        }).select("-password -refreshToken");

        if (!user) {
                throw new CustomError(500, "Internal Server Error");
        }

        res
                .status(200)
                .json(new ApiResponse(200, user,"Cover Picture Uploaded Successfully"))

})



const refreshAccessToken = asyncHandler(async (req,res)=>{
        const oldrefreshToken = req.cookies.refreshToken || req.body.refreshToken;
       
        if(!oldrefreshToken){
                throw new CustomError(401,"Unauthorized token");
        }
        try {
        const decodedToken = jwt.verify(oldrefreshToken,process.env.REFRESH_TOKEN_SECRET);
        if(!decodedToken){
                throw new CustomError(401,"Invalid Access Token")
        }
        
        const user = await User.findById(decodedToken._id);
        if(oldrefreshToken !== user.refreshToken){
                console.log("Expired!!")
                throw new CustomError(401,"Refresh Token has expired");
        }

        const options ={
                httpOnly: true,
                secure: true
        }

        const {accessToken, refreshToken} = await generateAccessAndRefreshToken(user._id);

        return res
        .status(200)
        .cookie("accessToken",accessToken,options)
        .cookie("refreshToken",refreshToken,options)
        .json(new ApiResponse(200,
                {
                        accessToken,
                        refreshToken
                },
                "Access Token refreshed"
                
                ))


        } catch (error) {
                throw new CustomError(500,"Internal server error");
        }

        
})



const sendOtp = asyncHandler(async (req,res)=>{
        try {
                const {verificationToken,tokenTimestamp} = generateVerificationToken();
                const {otp,timestamp} = generateOTP(6);
                const user = await User.findByIdAndUpdate(req?.user?._id,{
                $set:{
                        otp,
                        otpTimestamp:timestamp,
                        token:verificationToken,
                        tokenTimestamp
                }
        },{
                new: true
        })
        
        if(!user){
                throw new CustomError(500,"Internal Server Error");
        }
        
        const template = generateEmailTemplate("Verify your account", "Please Enter the following OTP to verify your account. It expires in 5 minutes", user.username,verificationToken,otp);
        
        const mailOtp = await sendEmail(user.email,"Verify your account",template)
        
        console.log(mailOtp);
        if(!mailOtp){
          throw new CustomError(500,"Internal Server Error");
        }
        res
        .status(200)
        .json(new ApiResponse(200,{message:"OTP send successfully"}));
        
        } catch (error) {
              throw new CustomError(500,"Internal Server Error",error)  
        }
})






const verifyOTP = asyncHandler(async(req,res)=>{
        try{
                const {otp} = req.body;
                if(!otp){
                        throw new CustomError(409, "OTP field is necessary");;
                }
                const user = await User.findById(req?.user?._id);
                const OTPStatus = await user.isOTPValid(otp);
                if(!OTPStatus){
                        throw new CustomError(401,"OTP verification failed");
                }
                user.otp = 1;
                user.otpTimestamp = 1;
                user.token = 1;
                user.tokenTimestamp = 1;
                user.verified = true;
                await user.save();

                return res
                .status(200)
                .json(new ApiResponse(200,{message:"User verified Successfully"}));

        
        }catch(error){
                throw new CustomError(500,"Internal Server Error")
        }
})

const verifyToken = asyncHandler(async(req,res)=>{
        const token = req.params.token;
        if(!token){
                throw new CustomError(409, "Token is necessary");
        }
        // console.log("middleware",req.user)
        const user = await User.findById(req.user?._id);
     
        if(!user){
                throw new CustomError(409, "User not found");
        }
        const tokenStatus = await user.isValidToken(token);
        if(!tokenStatus)
        {
                throw new CustomError(401,"Invalid Token");
        }

        user.otp = 1;
        user.otpTimestamp = 1;
        user.token = 1;
        user.tokenTimestamp = 1;
        user.verified = true;
        await user.save();

        return res
        .status(200)
        .json(new ApiResponse(200,{message:"User verified Successfully"}));

})



const data = [
        {
          name: 'Sunshine Apartments',
          type: 'Apartment',
          noOfSeater: '3',
          city: 'New York',
          lat: 40.7128,
          long: -74.0060,
          costPerMonth: '3000',
          mobile: '123-456-7890',
          photo: 'https://cdn.themix.org.uk/uploads/2012/09/youthhostels.jpg',
          description: 'Spacious 3-bedroom apartment in the heart of the city.',
          facilities: 'Gym, Pool, WiFi, Parking',
          roomNo: '101',
          isAvailable: true
        },
        {
          name: 'Green Villa',
          type: 'Villa',
          noOfSeater: '5',
          city: 'Los Angeles',
          lat: 34.0522,
          long: -118.2437,
          costPerMonth: '5000',
          mobile: '098-765-4321',
          photo: 'https://www.hiusa.org/wp-content/uploads/2020/04/sacramento-dorm-hiusa-1000x550-compressor-1-778x446.jpg',
          description: 'Luxurious villa with a private garden and swimming pool.',
          facilities: 'WiFi, Parking, Garden, Pool',
          roomNo: '102',
          isAvailable: false
        },
        {
          name: 'Urban Studio',
          type: 'Studio',
          noOfSeater: '1',
          city: 'San Francisco',
          lat: 37.7749,
          long: -122.4194,
          costPerMonth: '2000',
          mobile: '555-555-5555',
          photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYOlSv4Pht-8mJUNDS8FfcCLPXXkDMAhZV5w&s',
          description: 'Modern studio apartment perfect for singles or couples.',
          facilities: 'WiFi, Gym, Pool',
          roomNo: '103',
          isAvailable: true
        }
      ];


      


///////////////////////
//get suggexted
const getResentlyAdded = asyncHandler(async (req, res) => {
        try {
                // console.log(req)
              const hostels = await Hostel.find({})

                //const hostels = await Hostel.insertMany(data);

                console.log(hostels)
                res.json(hostels);
              } catch (error) {
                console.log(error)
                res.status(500).json({ message: 'Server Error', error });
              }
})
//suggested
const getSuggested = asyncHandler(async (req, res) => {
        try {
                // console.log(req)
                const hostels = await Hostel.find({})

                // const hostels = await Hostel.insertMany(data);
                
                console.log(hostels)
                res.json(hostels);
              } catch (error) {
                res.status(500).json({ message: 'Server Error', error });
              }
})

const addProperty=asyncHandler(async (req,res)=>{
        try {
                const properties = req.body;
                const insertedProperties = await Hostel.insertMany(properties);
                res.status(201).json({

                        'Status':201,
                        'Message':"Property Added Successfully"
                });
              } catch (err) {
                res.status(400).json({ error: err.message });
              }


})


// const propertyDetails= asyncHandler(async (req, res) => {

// try {
//         const i=req.body
//     // const {id,roomNo}=req.body;   
//     // const roomNo=req.body.roomNo;
//    const hosteldetail= "gg"
   
//    //await Hostel.findOne({ roomNo: roomNo });

//    res.status(201).json({'hosteldetail':"jjj"});
// } catch (error) {
//         res.status(400).json({ error: err.message });      
// }

// })
const getAddedProperty = asyncHandler(async(req,res)=>{
        try {
                console.log(req.body)
                const addedBy = req.body.addedBy;
                console.log(addedBy)
                // if(!token){
                //         throw new CustomError(409, "Token is necessary");
                // }
                // console.log("middleware",req.user)
                const user = await Hostel.find({addedBy: addedBy});
             res.status(200).json(user)     
        } catch (error) {
                res.status(400).json({ error: err.message });
        }
       //send notification to user weather accepted or not




})

const checkUserNotification=asyncHandler(async (req,res)=>{

        const { username } = req.body;

        try {
          const bookings = await Booking.find({ username: username, status: 'accepted' });
      
          if (!bookings || bookings.length === 0) {    return res
                .status(400)
                .json(new ApiResponse(404, null, "No Bookings Found "));


            //return res.status(404).json({ message: 'No bookings found for the given username and status' });
          }
          return res
                    .status(200)
                    .json(new ApiResponse(200, bookings, "Booking  Found"));
        //  return res.json(bookings);
        } catch (error) {
                return res
                .status(500)
                .json(new ApiResponse(500, null, "Internal Server Error"));
        //        return res.status(500).json({ message: 'Error finding bookings', error: error.message });
        }

})

export {
        registerController, 
        loginController, 
        logoutController, 
        changePasswordController, 
        getUserDetail,
        updateAccountDetail,
        uploadProfilePicture,
        uploadCoverPicture,
        refreshAccessToken,
        sendOtp,
        verifyOTP,
        verifyToken,
        getResentlyAdded,
        getSuggested,addProperty,getAddedProperty,
        testEndpoint,getUserByUserName,requestAction,checkUserNotification,
        getUserByUserNameWithMayBeSameUserName
        // propertyDetails
        
}

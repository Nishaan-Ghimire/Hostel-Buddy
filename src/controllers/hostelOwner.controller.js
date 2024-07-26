import {User} from '../models/user.model.js';
import {Hostel} from '../models/hostel.model';
import { asyncHandler } from '../utils/asyncHandler.js';
import { CustomError } from '../utils/ApiError.js'
import { generateAccessAndRefreshToken,generateOTP,generateVerificationToken } from '../utils/MinorMethods.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import {uploadOnCloudinary} from '../utils/cloudinary.js'
import {sendEmail} from '../utils/mail.js'
import {generateEmailTemplate} from '../utils/mailTemplate.js'
import jwt from 'jsonwebtoken'
import HostelOwner from '../models/hostelOwner.model.js';
import hostelOwnerAnalytics from '../models/hostelOwnerAnalytics.model.js';

const vendorRegister = asyncHandler(async (req, res) => {

        try {
               
                const { fullName, username, email, phoneNo, password, hostelName, kyc_doc,pan_card,lat, long,profile_img,cover_img } = req.body;
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
                                    }
                                

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



// Get the Major details for registering the hostel owner like Documents and location coordinates
const HostelKYC = asyncHandler(async (req, res) => {
        const { longitude, latitude } = req.body;
        const pan_CardPath = req?.files?.panCard[0]?.path;
        const hostel_certificatePath = req?.files?.hostel_certificate[0]?.path;
    
        // Check if files are provided
        if (!pan_CardPath || !hostel_certificatePath) {
            throw new CustomError(400, "Required documents not provided");
        }
    
        try {
            // Upload documents to Cloudinary
            const panCardUpload = await uploadOnCloudinary(pan_CardPath);
            const hostelCertificateUpload = await uploadOnCloudinary(hostel_certificatePath);
    
            // Update user details
            const user = await User.findByIdAndUpdate(req.user?._id, {
                $set: {
                    kyc_documents: {
                        hostel_certificate: hostelCertificateUpload.url,
                        pan_card: panCardUpload.url,
                    },
                    location_Coordinates: {
                        type: 'Point',
                        coordinates: [longitude, latitude],
                    },
                },
            }, {
                new: true,
                select: '-password -refreshToken',
            });
    
            if (!user) {
                throw new CustomError(500, "Internal Server Error");
            }
    
            res.status(200).json(new ApiResponse(200, user, "Uploaded Successfully"));
        } catch (error) {
            // Handle potential errors
            throw new CustomError(500, error.message);
        }
    });
    


// Here we also have to send the verification request to admin for hostel verification after checking documents


const HostelInformationUpdate = asyncHandler(async (req,res)=>{
        const {totalRooms,totalSeats,packedSeats,address,hostelName,owner_id,longitude,latitude} = req.body;

        if(!totalRooms || !totalSeats || !packedSeats || !address || !hostelName || !owner_id || !longitude || !latitude){
                throw new CustomError(409, "All fields are necessary");
        }
        else{
                const newHostel = await Hostel.create({
                      totalRooms,
                      totalSeats,
                      packedSeats,
                      address,
                      hostelName,
                      owner_id,
                     

                });

                console.log(newHostel._id);
           
                const hostel = await User.findById(newHostel._id);

                if (!hostel) {
                        throw new CustomError(500, "Something went wrong cannot create user")
                }

                return res
                        .status(201)
                        .json(new ApiResponse(201, hostel, "Hostel registered successfully"))

        }

        

})




const loginController = asyncHandler(async (req, res) => {

        try {

                const { email, password } = req.body;
                if (!email || !password) {

                        throw new CustomError(409, "All fields are necessary");
                }

                const loginHostelOwner = await HostelOwner.findOne({ email });
                if (!loginHostelOwner) {
                        throw new CustomError("This Account doesn't exist")
                }
                const isPasswordValid = await loginHostelOwner.isPasswordCorrect(password);
                if (!isPasswordValid) {
                        throw new CustomError(401, "Incorrect Credentials")
                }


                const { accessToken, refreshToken } = await generateAccessAndRefreshTokenForHostelOwner(loginHostelOwner._id);

                const loggedInHostelOwner = await HostelOwner.findById(loginHostelOwner._id).select("-password -refreshToken");

                const options = {
                        httpOnly: true,
                        secure: true
                }
                console.log(accessToken)

                return res
                        .status(200)
                        .cookie("accessToken", accessToken, options)
                        .cookie("refreshToken", refreshToken, options)
                        .json(
                                new ApiResponse(
                                        200,
                                        {
                                                hostelOwner: loginHostelOwner, accessToken, refreshToken
                                        },
                                        "Hostel Owner logged in Successfully"
                                )
                        )


        } catch (error) {
                console.log({ error });
                res.json({ error })
        }
})


const logoutController = asyncHandler(async (req, res) => {

        await HostelOwner.findByIdAndUpdate(req.hostelOwner._id, {
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
        const hostelOwner = req.hostelOwner;
        const hostelOwnerDetail = await HostelOwner.findById(hostelOwner._id);
        const ispasswordVerified = await hostelOwnerDetail.isPasswordCorrect(oldPassword);
        if (!ispasswordVerified) {
                throw new CustomError(401, "Password is incorrect");
        }

        hostelOwnerDetail.password = newPassword;
        await hostelOwnerDetail.save({ validateBeforeSave: false });

        return res
                .status(200)
                .json(new ApiResponse(200, {}, "Password Changed successfully"));



})


const getHostelOwnerDetail = asyncHandler(async (req, res) => {
        const hostelOwner = req.hostelOwner;
        return res
                .status(200)
                .json(new ApiResponse(200, hostelOwner));
})

const HostelOwnerupdateAccountDetail = asyncHandler(async(req,res)=>{
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

        const user = await HostelOwner.findByIdAndUpdate(
                req.hostelOwner?._id,
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

        const hostelOwner = await HostelOwner.findByIdAndUpdate(req.user?._id, {
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





const HostelOwneruploadCoverPicture = asyncHandler(async (req, res) => {
        const coverPicPath = req?.file?.path;
        if (!coverPicPath) {
                throw new CustomError(400, "File not provided");
        }

        const coverPic = await uploadOnCloudinary(coverPicPath);

        const hostelOwner = await User.findByIdAndUpdate(req.hostelOwner?._id, {
                $set: {
                        coverImage: coverPic?.url
                }
        }, {
                new: true
        }).select("-password -refreshToken");

        if (!hostelOwner) {
                throw new CustomError(500, "Internal Server Error");
        }

        res
                .status(200)
                .json(new ApiResponse(200, hostelOwner,"Cover Picture Uploaded Successfully"))

})



const HostelOwnerRefreshAccessToken = asyncHandler(async (req,res)=>{
        const oldrefreshToken = req.cookies.refreshToken || req.body.refreshToken;
       
        if(!oldrefreshToken){
                throw new CustomError(401,"Unauthorized token");
        }
        try {
        const decodedToken = jwt.verify(oldrefreshToken,process.env.REFRESH_TOKEN_SECRET);
        if(!decodedToken){
                throw new CustomError(401,"Invalid Access Token")
        }
        
        const hostelOwner = await HostelOwner.findById(decodedToken._id);
        if(oldrefreshToken !== hostelOwner.refreshToken){
                console.log("Expired!!")
                throw new CustomError(401,"Refresh Token has expired");
        }

        const options ={
                httpOnly: true,
                secure: true
        }

        const {accessToken, refreshToken} = await generateAccessAndRefreshToken(hostelOwner._id);

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



const HostelOwnersendOtp = asyncHandler(async (req,res)=>{
        try {
                const {verificationToken,tokenTimestamp} = generateVerificationToken();
                const {otp,timestamp} = generateOTP(6);
                const hostelOwner = await HostelOwner.findByIdAndUpdate(req?.hostelOwner?._id,{
                $set:{
                        otp,
                        otpTimestamp:timestamp,
                        token:verificationToken,
                        tokenTimestamp
                }
        },{
                new: true
        })
        
        if(!hostelOwner){
                throw new CustomError(500,"Internal Server Error");
        }
        
        const template = generateEmailTemplate("Verify your account", "Please Enter the following OTP to verify your account. It expires in 5 minutes", hostelOwner.fullName,verificationToken,otp);
        
        const mailOtp = await sendEmail(hostelOwner.email,"Verify your account",template)
        
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






const HostelOwnerverifyOTP = asyncHandler(async(req,res)=>{
        try{
                const {otp} = req.body;
                if(!otp){
                        throw new CustomError(409, "OTP field is necessary");;
                }
                const hostelOwner = await HostelOwner.findById(req?.user?._id);
                const OTPStatus = await hostelOwner.isOTPValid(otp);
                if(!OTPStatus){
                        throw new CustomError(401,"OTP verification failed");
                }
                hostelOwner.otp = 1;
                hostelOwner.otpTimestamp = 1;
                hostelOwner.token = 1;
                hostelOwner.tokenTimestamp = 1;
                hostelOwner.verified = true;
                await hostelOwner.save();

                return res
                .status(200)
                .json(new ApiResponse(200,{message:"User verified Successfully"}));

        
        }catch(error){
                throw new CustomError(500,"Internal Server Error")
        }
})

const HostelOwnerverifyToken = asyncHandler(async(req,res)=>{
        const token = req.params.token;
        if(!token){
                throw new CustomError(409, "Token is necessary");
        }
        // console.log("middleware",req.user)
        const user = await HostelOwner.findById(req.user?._id);
     
        if(!hostelOwner){
                throw new CustomError(409, "Account not found");
        }
        const tokenStatus = await hostelOwnerhostelOwner.isValidToken(token);
        if(!tokenStatus)
        {
                throw new CustomError(401,"Invalid Token");
        }

        hostelOwner.otp = 1;
        hostelOwner.otpTimestamp = 1;
        hostelOwner.token = 1;
        hostelOwner.tokenTimestamp = 1;
        hostelOwner.verified = true;
        await hostelOwner.save();

        return res
        .status(200)
        .json(new ApiResponse(200,{message:"Account verified Successfully"}));

})

//
const getAddedProperty = asyncHandler(async(req,res)=>{
        console.log(req.body)
        const usernmae = req.body.usernmae;
        console.log(usernmae)
        // if(!token){
        //         throw new CustomError(409, "Token is necessary");
        // }
        // console.log("middleware",req.user)
        const user = await Hostel.findById({addedBy});
     res.send(user)
        // if(!hostelOwner){
        //         throw new CustomError(409, "Account not found");
        // }
        const tokenStatus = await hostelOwnerhostelOwner.isValidToken(token);
        // if(!tokenStatus)
        // {
        //         throw new CustomError(401,"Invalid Token");
        // }

        // hostelOwner.otp = 1;
        // hostelOwner.otpTimestamp = 1;
        // hostelOwner.token = 1;
        // hostelOwner.tokenTimestamp = 1;
        // hostelOwner.verified = true;
        // await hostelOwner.save();

        // return res
        // .status(200)
        // .json(new ApiResponse(200,{message:"Account verified Successfully"}));

})





export {
        // HostelOwnerPage_1_RegistrationController,
        // HostelOwnerPage_2_RegistrationController,
        // HostelOwnerPage_3_RegistrationController,
        // HostelOwnerloginController,
        // HostelOwnerlogoutController,
        // HostelOwnerchangePasswordController,
        //HostelOwnerchangePasswordController,
        getHostelOwnerDetail,
        HostelOwnerupdateAccountDetail,
       // HostelOwneruploadProfilePicture,
        HostelOwneruploadCoverPicture,
        HostelOwnerRefreshAccessToken,
        HostelOwnersendOtp,
        HostelOwnerverifyOTP,
        HostelOwnerverifyToken,
        getAddedProperty


        }
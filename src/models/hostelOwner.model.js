



// Temporarily Unused File






import mongoose, { Schema } from "mongoose";
import {generateRefreshToken, generateAccessTokenForHostelOwner,generateAccessToken,isPasswordCorrect,preSaveMiddleware,isOTPValid,isValidToken} from '../utils/ModelMethods.js'



const HostelOwnerSchema = new Schema({
    fullName: { 
        type: String, 
        required: true 
    },
    username: {
        type: String,
        required: true
    },
    email: { 
        type: String, 
        required: true, 
        unique: true 
    },
    password: { 
        type: String, 
        required: true 
    },
    phoneNo: {
        type: String,
        required: true
    },
    HostelName: {
        type: String,
        required: true
    },
    kyc_documents: {
      hostel_certificate: { 
        type: String, 
        required: true 
    },
      pan_card: {
         type: String, 
         required: true 
        },  
      other_documents: [String]
    },

    verified: { 
        type: Boolean, default: false },

    created_at: { 
        type: Date, default: Date.now 
    },
    location:{
        longitude: {
            type: String
        },
        latitude: {
            type: String
        },
        
    
    },
    otp: {
        type: String,
    },
    otpTimestamp:{
        type: Date,
    },
    token:{
        type:String,
    },
    tokenTimestamp:{
        type: Date,
    },
    verified:{
        type: Boolean,
        default: false
    },
    profileImage:{
        type: String, //Cloudinary Url
        default: "profile"

    },
    coverImage:{
        type: String, //Cloudinary Url
        default: "cover"

    },
    
  },
  {
    timeseries: true,
} 
);
  

  
HostelOwnerSchema.pre("save",preSaveMiddleware);
HostelOwnerSchema.methods.isPasswordCorrect = isPasswordCorrect;
HostelOwnerSchema.methods.generateAccessToken = generateAccessTokenForHostelOwner;
HostelOwnerSchema.methods.generateRefreshToken = generateRefreshToken;
HostelOwnerSchema.methods.isOTPValid = isOTPValid;
HostelOwnerSchema.methods.isValidToken = isValidToken;
  

  const HostelOwner = mongoose.model('HostelOwner', HostelOwnerSchema);
  export default HostelOwner;
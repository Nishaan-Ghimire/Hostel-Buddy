import mongoose, { Schema } from "mongoose";
// import bcrypt from 'bcrypt';
// import jwt from 'jsonwebtoken';
import {generateRefreshToken, generateAccessToken,isPasswordCorrect,preSaveMiddleware,isOTPValid,isValidToken} from '../utils/ModelMethods.js'
import { Server } from 'socket.io';
const userSchema = new Schema(
    {
        username:{
            type: String,
            required: true,
            unique: true,
            lowercase: true,
            trim: true,
            index: true
        },
        dob:{
            type: String,
            required: true,
        
        },
        phoneNo: {
            type: String,
            required: true
        },

        email: {
            type: String,
            required: true,
            unique: true,
            lowercase: true,
            trim: true,
        },
        fullName: {
            type: String,
            required: true,
            trim:true,
            index: true,
        },
        age:{
            type: Number,
            max: 70,
            min: 12
        },
        jobStatus:{
            type: String,
            enum: ["Student","Working","None"],
        },
        college:{
           longitude:{
            type: String,   
           },
           latitude:{
            type: String,
           }
        },
        company:{
            longitude:{
                type: String,
               },
               latitude:{
                type: String,     
               }
        },
        fieldOfProfession:{
            type: String,
            enum: ["IT","Engineering","Bussiness","Law","Psychology","Medical","Arts","Marketing","Other"]
        },
        profileImage:{
            type: String, //Cloudinary Url
            default: "profile"

        },
        
        password:{
            type: String,
            required: [true,'Password is required'] 
        },

        HostelName: {
            type: String,
              default:""
         
        },

        kyc_documents: {
            hostel_certificate: { 
              type: String, 
                default:""
          },
            pan_card: {
               type: String, 
               default:""
              },  
          
          },
          kyc_status:{
            type: String,
            enum:["Not Applied","Pending","Verified"],
            default: "Not Applied"
          },

        refreshToken:{
            type: String,
        }
        ,
        role:{
            type:String,
            enum:["User","Admin","HostelOwner"],
            default: "User"
        },
        hostel_associated: {
            type: Schema.Types.ObjectId
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
        location_Coordinates: {
            type: {
                type: String, // It can be 'Point' for specific geospatial data
                enum: ['Point'],
               
            },
            coordinates: {
                type: [Number],
            }
        },
        
        hostelOwned:{
            type: String,
        }
    },
    {
        timeseries: true,
    }
)

userSchema.pre("save",preSaveMiddleware);
userSchema.methods.isPasswordCorrect = isPasswordCorrect;
userSchema.methods.generateAccessToken = generateAccessToken;
userSchema.methods.generateRefreshToken = generateRefreshToken;
userSchema.methods.isOTPValid = isOTPValid;
userSchema.methods.isValidToken = isValidToken;

userSchema.index({ Location_Coordinates: '2dsphere' }); // Adding a 2dsphere index

const User = mongoose.model('User',userSchema);
export default User
import User from '../models/user.model.js'
import HostelOwner from '../models/hostelOwner.model.js';
//import {CustomError} from '../utils/ApiError.js'
import { asyncHandler } from "../utils/asyncHandler.js";
import jwt from "jsonwebtoken"

import CustomError from '../utils/ApiError.js';

// Middleware for authorization of User

export const userAuthMiddleware = asyncHandler(async(req,res,next)=>{
   try {
     const  accessToken = req.cookies?.accessToken || req.header("Authorization")?.replace("Bearer ","");
     console.log(accessToken)
     if(!accessToken){
         throw new CustomError(401,"Unauthorized request");
     }
 
     const decodedToken = jwt.verify(accessToken,process.env.ACCESS_TOKEN_SECRET);
     
     const user = await  User.findById(decodedToken?._id).select("-password -refreshToken");
 
     if(!user){
         throw new CustomError(401,"Invalid access token");
     }
 
     req.user = user;
     next()
   } catch (error) {
    throw new CustomError(401,error?.message || "Invalid access token")
   }

 })




// Middleware for authorization of Hostel Owner

 export const hostelOwnerAuthMiddleware = asyncHandler(async(req,res,next)=>{
  try {
    const  accessToken = req.cookies?.accessToken || req.header("Authorization")?.replace("Bearer ","");
    console.log(accessToken)
    if(!accessToken){
        throw new CustomError(401,"Unauthorized request");
    }

    const decodedToken = jwt.verify(accessToken,process.env.ACCESS_TOKEN_SECRET);
    
    const hostelOwner = await  HostelOwner.findById(decodedToken?._id).select("-password -refreshToken");

    if(!hostelOwner){
        throw new CustomError(401,"Invalid access token");
    }

    req.hostelOwner = hostelOwner;
    next()
  } catch (error) {
   throw new CustomError(401,error?.message || "Invalid access token")
  }

})
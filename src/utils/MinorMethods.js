import User from '../models/user.model.js'
// import {HostelOwner} from '../models/hostelOwner.model.js';
import crypto from 'crypto'

import CustomError from './ApiError.js';// const generateAccessAndRefreshTokenForHostelOwner = async (userId) => {
//     try {

//         const hostelOwner = await HostelOwner.findById(userId);
//         const accessToken = await hostelOwner.generateAccessToken();
//         const refreshToken = await hostelOwner.generateRefreshToken();

//         hostelOwner.refreshToken = refreshToken;
//         await user.save({ validateBeforeSave: false });

//         return { accessToken, refreshToken }
//     } catch (error) {
//         throw new ApiError(500, "Something went wrong while generating refresh token");
//     }
// }


const generateAccessAndRefreshToken = async (userId) => {
 
  console.log('............................')
 
  try {

      const user = await User.findById(userId);
      console.log('user'+user)
      const accessToken = await user.generateAccessToken();
      const refreshToken = await user.generateRefreshToken();

      user.refreshToken = refreshToken;
      await user.save({ validateBeforeSave: false });

      return { accessToken, refreshToken }
  } catch (error) {
    console.log(error)
      throw new 
      CustomError(500,"Something went wrong while generating refresh token")
      //ApiError(500, "Something went wrong while generating refresh token");
  }
}



const generateOTP = (length)=>{
  const charset = '0123456789';
  let otp = '';
    if(!length){
    length = 6;
    }
  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * charset.length);
    otp += charset[randomIndex];
  }
 const timestamp = new Date();
  return {otp,timestamp}
}


function generateVerificationToken() {
    const verificationToken = crypto.randomBytes(20).toString('hex');
    const tokenTimestamp = new Date();
    return {verificationToken,tokenTimestamp};
  }


  const generateRandomPassword = () => {
    const length = 12;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";
    let password = "";
    for (let i = 0, n = charset.length; i < length; ++i) {
      password += charset.charAt(Math.floor(Math.random() * n));
    }
    return password;
  };
  

export {
  generateAccessAndRefreshToken,
  generateOTP,
  generateVerificationToken,
  generateRandomPassword
  // generateAccessAndRefreshTokenForHostelOwner
        }
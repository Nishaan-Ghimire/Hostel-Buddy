import User from '../models/user.model.js'
// import {HostelOwner} from '../models/hostelOwner.model.js';
import crypto from 'crypto'


// const generateAccessAndRefreshTokenForHostelOwner = async (userId) => {
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
  try {

      const user = await User.findById(userId);
      const accessToken = await user.generateAccessToken();
      const refreshToken = await user.generateRefreshToken();

      user.refreshToken = refreshToken;
      await user.save({ validateBeforeSave: false });

      return { accessToken, refreshToken }
  } catch (error) {
      throw new ApiError(500, "Something went wrong while generating refresh token");
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

export {
  generateAccessAndRefreshToken,
  generateOTP,
  generateVerificationToken,
  // generateAccessAndRefreshTokenForHostelOwner
        }
import User from '../models/user.model.js';
import { asyncHandler } from '../utils/asyncHandler.js';
import { CustomError } from '../utils/ApiError.js'
import { ApiResponse } from '../utils/ApiResponse.js'
import {User} from '../models/user.model.js'
import hostelModel from '../models/hostel.model.js';


const getAllVerificationRequest = asyncHandler(async (req,res)=>{
  
  try{
    const users = await User.find({});
    if(!users){
      res.json(new ApiResponse(200,"No any new request yet"));
    }

    res.json(users);

  }catch(err)
  {

    throw new CustomError(500,"Internal Server Error")
 
  }


})






const verifyHostel = asyncHandler(async(req,res)=>{
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



const getUserDetail = asyncHandler(async (req,res)=>{
 const {user_id} = req.body;

  try {
const user = await User.findById(user_id);
if(!user)
{
  res.json(new ApiResponse(200,"User doesn't exist"));
}    
if(user.role !== 'HostelOwner'){
  req.json("No any user applied for Hostel Owner");
}

res.json(user);




  } catch (error) {
    throw new CustomError(500,"Internal Server Error")
  }
})




const allAccounts = asyncHandler(async (req,res)=>{
  try{
    const users = await User.find({});
    return res.json(users)
  }
  catch(error){
    throw new CustomError(500,"Internal Server Error")
  }
  })



const RecoverAccount = asyncHandler(async (req,res)=>{
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





const user_login_count = asyncHandler(async (req, res) => {
  const data = await getMatomoData('Events.getCategory', 'week', 'today');
  const loginEvents = data.filter(event => event.label === 'User' && event.action === 'Login in');
  res.json(loginEvents);
});



const user_register_count = asyncHandler(async (req, res) => {
  const data = await getMatomoData('Events.getCategory', 'week', 'today');
  const registrationEvents = data.filter(event => event.label === 'User' && event.action === 'Registration');
  res.json(registrationEvents);
});



const hostelOwner_login_count = asyncHandler(async (req, res) => {
  const data = await getMatomoData('Events.getCategory', 'week', 'today');
  const loginEvents = data.filter(event => event.label === 'Hostel Owner' && event.action === 'Login in');
  res.json(loginEvents);
});



const hostelOwner_register_count = asyncHandler(
  async (req, res) => {
    const data = await getMatomoData('Events.getCategory', 'week', 'today');
    const registrationEvents = data.filter(event => event.label === 'User' && event.action === 'Registration');
    res.json(registrationEvents);
  }

);
  




  module.exports = {
    user_login_count,
    user_register_count,
    hostelOwner_login_count,
    hostelOwner_register_count,
    getAllVerificationRequest,
    verifyHostel,
    RecoverAccount,
    allAccounts,
    getUserDetail

  };
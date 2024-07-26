import { asyncHandler } from '../utils/asyncHandler.js';
import Hostel from '../models/recent_hostel_model.js';


const hostelDetails = asyncHandler(async (req, res) => {
const {id,roomNo}=req.body
 // const hosteldetail=
   
  try {
    console.log('...................................................................')
    const hosteldetail = await Hostel.findOne({
         _id: id,
         roomNo: roomNo });

    if (!hosteldetail) {
      return res.status(404).json({ message: 'Hostel detail not found' });
    }

    res.status(200).json(hosteldetail);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }


})

export default hostelDetails;
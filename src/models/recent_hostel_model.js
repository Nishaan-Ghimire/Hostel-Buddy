// models/Hostel.js
import mongoose from 'mongoose';





const hostelSchema = new mongoose.Schema({
  name: { type: String, required: true },
  type: { type: String, required: true },
  noOfSeater: { type: String, required: true },
  city: { type: String, required: true },
  lat: { type: Number, required: true },
  long: { type: Number, required: true },
  costPerMonth: { type: String, required: true },
  mobile: { type: String, required: true },
  photo: { type: String, required: true },
  description: { type: String, required: true },
  facilities: { type: String, required: true },
  roomNo:{type:String},
  addedBy:{type:String},
  isAvailable: { type: Boolean, default: true}

});
hostelSchema.index({ 
  name: 'text', 
  description: 'text', 
  city: 'text',  // Use 'city' instead of 'location'
  facilities: 'text' 
});
const Hostel = mongoose.model('Hostel', hostelSchema);
export default Hostel;
//const Property = mongoose.model('Property', propertySchema);

//module.exports = Property;
import dotenv from "dotenv";
import { app } from "./app.js";
import connectDB from './db/index.js'
import mongoose from "mongoose";

//import { DB_Name } from "../constants.js";


//console.log(process.env.password)

app.listen(
    process.env.PORT
    //3000
    , () => {
    console.log(`Server running on port ${process.env.PORT}`);
});


mongoose.connect("mongodb://127.0.0.1:27017/hi",{
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(()=>{
console.log("connected")
});
//////////////////////
// const messageSchema = new mongoose.Schema({
//     senderId: String,
//     receiverId: String,
//     message: String,
//     senderName: String,
//     timestamp: { type: Date, default: Date.now }
//   });
  
//   const Message = mongoose.model('Message', messageSchema);
  






/////////////////////////////////////////////
// dotenv.config(
//     //{
//   //  path: './env'
// //}
// )
// console.log("port "+process.env.PORT)
// connectDB().then(
//     ()=>{
//         app.on('error',(err)=>{
//             console.log("Internal Server Error",err);
//             throw err;
//         })
//         app.listen(process.env.PORT || 8000,()=>{
//             console.log(`Server is Listening at port ${process.env.PORT}`);
//         })
//     }
// ).catch(
//     (err)=>{
//         console.log("Mongodb Connection failed : ",err)
//     }
// );
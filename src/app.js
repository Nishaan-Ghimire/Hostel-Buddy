import express from 'express';
import cors from 'cors'
import cookieParser from 'cookie-parser';
import http from 'http';
import { Server } from 'socket.io'
//const  Server  = import('socket.io');
import Message from './models/message.js'
const app = express();
//const server = http.createServer(app);
//const io = new Server(server);
/////////////////////////////////////////socket 
// io.on('connection', (socket) => {
//   console.log('A user connected');

//   socket.on('sendMessage', async (data) => {
//     const { senderId, receiverId, message, senderName } = data;
//     const newMessage = new Message({ senderId, receiverId, message, senderName });
//     await newMessage.save();

//     io.emit('receiveMessage', newMessage);
//   });

//   socket.on('disconnect', () => {
//     console.log('A user disconnected');
//   });
// });

// server.listen(4000, () => {
//   console.log('Server is running on port 3000');
// });


app.get('/test',(req,res)=>{

  res.send("ok")
})

//////////////////////////////////////////////////////////
// CORS configuration
app.use(cors(
  {
    origin: process.env.CORS_ORIGIN,
    credentials: true
  }
))

// Json Parser configuration
app.use(express.json({
    limit: "16kb"
}))

// URL encoding configuration
app.use(express.urlencoded({
    extended: true,
    limit: "16kb"
}))


// For Static files configuration
app.use(express.static("public"))

// Setting up cookie parser
app.use(cookieParser());



// importing Routes
import userRoutes from './routes/user.routes.js'
import adminRoutes from './routes/admin.routes.js'
//import review from '../src/routes/review.js'
//import vendorRoute from './routes/hostelOwner.routes.js'
 //import {vendorRoute} from './routes/hostelOwner.routes.js'
 import Utils from './routes/util_routes.js'
// Setting the routes
app.use('/v1/users/',userRoutes);
//app.use('/v1/vendor/',vendorRoute)
// app.use('/v1/vendor/',vendorRoutes);
app.use('/v1/utils/',Utils);
app.use('/v1/admin/',adminRoutes)
//app.use('/v1/review/',review);
export { app }



import express from 'express';
import cors from 'cors'
import cookieParser from 'cookie-parser';

const app = express();

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
import searchRoutes from './routes/search.routes.js'
import vendorRoutes from './routes/hostelOwner.routes.js'
import Review from './routes/review.routes.js'
import Utils from './routes/utils.routes.js'

// Setting the routes
app.use('/v1/users/',userRoutes);
app.use('/v1/search/',searchRoutes);
app.use('/v1/vendor/',vendorRoutes);
app.use('/v1/review/',Review);
app.use('/v1/utils/',Utils);


export { app }



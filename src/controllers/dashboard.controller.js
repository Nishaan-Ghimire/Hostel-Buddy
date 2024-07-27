
import axios from "axios";
import Hostel from '../models/recent_hostel_model.js'
import mongoose from 'mongoose'
import Review from '../models/review-model.js'
import User from '../models/user.model.js'


export const getPopularHostels = async (req,res) => {
    try {
        const hostels = await Review.aggregate([
            {
                $group: {
                    _id: "$hostel_id",
                    avgRating: { $avg: "$star_rating" },
                    numRatings: { $sum: 1 }
                }
            },
            {
                $lookup: {
                    from: "hostels",
                    localField: "_id",
                    foreignField: "_id",
                    as: "hostelDetails"
                }
            },
            { $unwind: "$hostelDetails" },
            {
                $project: {
                    _id: 1,
                    avgRating: 1,
                    numRatings: 1,
                    hostelName: "$hostelDetails.hostelName",
                    address: "$hostelDetails.address",
                    totalRooms: "$hostelDetails.totalRooms",
                    totalSeats: "$hostelDetails.totalSeats",
                    packedSeats: "$hostelDetails.packedSeats",
                    location: "$hostelDetails.location"
                }
            },
            {
                $sort: {
                    avgRating: -1,
                    numRatings: -1
                }
            },
            { $limit: 10 } // Change the number to however many recommendations you want
        ]);

        console.log(hostels);
        return res.json(hostels);
    } catch (err) {
        console.error(err);
        throw err;
    }
};

export const getrecommendation = async (req, res) => {
    const userName = req.params.userName;
    console.log(userName)
    try {
        const user = await User.findOne({username:userName});
        // console.log(user)
        const userId = user._id;
        console.log(user._id)
        const gender = user.gender;
        console.log(gender)
        // Make a GET request to your Flask app
        const response = await axios.get(`http://143.110.246.160:5000/recommend?user_id=${userId}`);
        // const data = JSON.parse(response.data);
        console.log(response)
         // Extract hostel IDs from the recommendations
        //  const hostelIds = data.recommendations;
		// console.log(hostelIds)
         // Fetch hostel data from MongoDB
        //  const hostells = await Hostel.find({
        //     $and: [
        //       {
        //         _id: { $in: hostelIds.map(id => new mongoose.Types.ObjectId(id)) }
        //       },
        //       {
        //         hostelType: gender 
        //       }
        //     ]
        //   });

          const hostels = await Hostel.find({type: gender}
            
          );
 	console.log(hostels)
         // Send the hostel data as JSON
         return res.json(hostels);




        // Send the response as JSON
        // res.json(data);
    } catch (error) {
        console.error('Error fetching recommendations:', error.message);
        res.status(500).json({ error: 'Failed to fetch recommendations' });
    }
}






export const nearByHostels = async (req, res) => {
  
    const { latitude, longitude } = req.body;

    if (!latitude || !longitude) {
        return res.status(400).json({ error: 'Latitude and longitude are required' });
    }

    try {
        // Convert latitude and longitude to numbers
        const lat = parseFloat(latitude);
        const lon = parseFloat(longitude);

        // Fetch nearest hostels from MongoDB with geospatial query
        const hostels = await Hostel.aggregate([
            {
                $geoNear: {
                    near: {
                        type: "Point",
                        coordinates: [lon, lat]
                    },
                    distanceField: "distance",
                    spherical: true,
                    query: {
                        // Add any additional query conditions if needed
                    }
                }
            },
            {
                $limit: 10
            }
        ]);

        // Send the hostel data as JSON
        return res.json(hostels);
    } catch (error) {
        console.error('Error fetching nearby hostels:', error.message);
        return res.status(500).json({ error: 'Failed to fetch nearby hostels' });
    }
}

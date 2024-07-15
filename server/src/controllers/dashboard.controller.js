export const getPopularHostels = async () => {
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
        return hostels;
    } catch (err) {
        console.error(err);
        throw err;
    }
};
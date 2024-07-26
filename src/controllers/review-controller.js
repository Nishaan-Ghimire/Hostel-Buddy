import Review from '../models/review-model.js';

// Controller function to create a new review


//export 
const createReview = async (req, res) => {
    console.log("hello")
    const { user_id, hostel_id, star_rating, comment } = req.body;

console.log(req.body)
    if (!user_id || !hostel_id || !star_rating || !comment) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    
    if (star_rating < 1 || star_rating > 5) {
        return res.status(400).json({ message: 'Star rating must be between 1 and 5' });
    }

    try {
        const newReview = new Review({ user_id, hostel_id, star_rating, comment });
        await newReview.save();
        res.status(201).json({ message: 'Review created successfully', review: newReview });
    } catch (error) {
        console.error('Error creating review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};

// Controller function to get all reviews for a specific hostel
//export 
const getReviewsByHostel = async (req, res) => {
    
    const { hostel_id } = 
    
    req.params;
    console.log(hostel_id)

    try {

        const reviews = await Review.find({ hostel_id })
     //   .populate('user_id', 'user_id');
        
        res.status(200).json(reviews);
    } catch (error) {
        console.error('Error fetching reviews:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};



// Controller function to update a review
//export 
const updateReview = async (req, res) => {
    const { review_id } = req.params;
    const { star_rating, comment } = req.body;

    if (!star_rating || !comment) {
        return res.status(400).json({ message: 'Star rating and comment are required' });
    }

    if (star_rating < 1 || star_rating > 5) {
        return res.status(400).json({ message: 'Star rating must be between 1 and 5' });
    }

    try {
        const review = await Review.findById(review_id);
        if (!review) {
            return res.status(404).json({ message: 'Review not found' });
        }

        review.star_rating = star_rating;
        review.comment = comment;
        await review.save();

        res.status(200).json({ message: 'Review updated successfully', review });
    } catch (error) {
        console.error('Error updating review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};
export {createReview,getReviewsByHostel,updateReview}
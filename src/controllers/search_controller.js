import { asyncHandler } from '../utils/asyncHandler.js';

import SearchHistory from '../models/searchHistory.js';
import Hostel from '../models/recent_hostel_model.js';
// Import the SearchHistory model
import mongoose from 'mongoose';
const SearchController = asyncHandler(async (req, res) => {
    try {
        const squery  = req.body.squery;
        console.log(req.body)
        if (!squery) {
            return res.status(400).json({ message: 'Query parameter is required' });
        }

        // Create a new search history entry
        const searchHistory = new SearchHistory({
            user_id:new mongoose.Types.ObjectId(1),
            //req.user._id, // Assuming user ID is available in req.user
            search_query: squery
        });
        await searchHistory.save();

        // Perform the search
        const results = await 
        
        Hostel.find({ $text: { $search: squery } })
        //     { $text: { $search: squery } },
        //     { score: { $meta: 'textScore' } }
        // ).sort({ score: { $meta: 'textScore' } });
console.log('hos3',results)
        res.json(results);
    } catch (error) {
        console.error('Search error:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

export { SearchController };
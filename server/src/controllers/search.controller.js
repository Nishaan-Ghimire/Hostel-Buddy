import { asyncHandler } from '../utils/asyncHandler.js';


const SearchHistory = require('../models/searchHistory.model.js'); // Import the SearchHistory model

const SearchController = asyncHandler(async (req, res) => {
    try {
        const { query } = req.query;
        if (!query) {
            return res.status(400).json({ message: 'Query parameter is required' });
        }

        // Create a new search history entry
        const searchHistory = new SearchHistory({
            user_id: req.user._id, // Assuming user ID is available in req.user
            search_query: query
        });
        await searchHistory.save();

        // Perform the search
        const results = await Hostel.find(
            { $text: { $search: query } },
            { score: { $meta: 'textScore' } }
        ).sort({ score: { $meta: 'textScore' } });

        res.json(results);
    } catch (error) {
        console.error('Search error:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

export { SearchController };

import mongoose from "mongoose";

const searchHistorySchema = new mongoose.Schema({
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    search_query: { type: String, required: true },
    timestamp: { type: Date, default: Date.now }
});
const SearchHistory = mongoose.model('SearchHistory', searchHistorySchema);

export default SearchHistory
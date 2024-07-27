import hostelOwnerAnalytics from "../models/hostelOwnerAnalytics.model.js";
import Hostel from "../models/recent_hostel_model.js"
import mongoose from "mongoose";

// Get analytics data for a specific hostel
export const getHostelAnalytics = async (req, res) => {
    try {
        const { hostelId } = req.body;
        console.log(hostelId)
        const hostel = await Hostel.findById(hostelId)
        console.log(hostel)
        if (!hostel) {
            return res.status(400).json({ message: 'Invalid hostel ID.' });
        }

        // Total visits
        const totalVisits = await hostelOwnerAnalytics.countDocuments({ hostelId });

        // Total visits in the last week
        const lastWeek = new Date();
        lastWeek.setDate(lastWeek.getDate() - 7);
        const visitsLastWeek = await hostelOwnerAnalytics.countDocuments({
            hostelId,
            visitDate: { $gte: lastWeek }
        });

        // Total visits in the last month
        const lastMonth = new Date();
        lastMonth.setMonth(lastMonth.getMonth() - 1);
        const visitsLastMonth = await hostelOwnerAnalytics.countDocuments({
            hostelId,
            visitDate: { $gte: lastMonth }
        });

        // Total visits in the previous three months
        const lastThreeMonths = new Date();
        lastThreeMonths.setMonth(lastThreeMonths.getMonth() - 3);
        const visitsLastThreeMonths = await hostelOwnerAnalytics.countDocuments({
            hostelId,
            visitDate: { $gte: lastThreeMonths }
        });

        // Total visits in the three months before the last three months
        const sixMonthsAgo = new Date();
        sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);
        const visitsPreviousThreeMonths = await hostelOwnerAnalytics.countDocuments({
            hostelId,
            visitDate: { $gte: sixMonthsAgo, $lt: lastThreeMonths }
        });

        // Calculate the increase/decrease in visits over the last three months
        const visitDifference = visitsLastThreeMonths - visitsPreviousThreeMonths;
        const percentageChange = visitsPreviousThreeMonths === 0 ? 0 : (visitDifference / visitsPreviousThreeMonths) * 100;

        res.status(200).json({
            message: 'Hostel analytics retrieved successfully',
            totalVisits,
            visitsLastWeek,
            visitsLastMonth,
            percentageChange
        });
    } catch (error) {
        res.status(500).json({ message: 'An error occurred', error });
    }
};

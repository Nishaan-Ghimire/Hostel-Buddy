import { Router } from 'express';
import {
    user_login_count,
    user_register_count,
    hostelOwner_login_count,
    hostelOwner_register_count,
    getAllVerificationRequest,
    verifyHostel,
    RecoverAccount,
    allAccounts,
    getUsersWithPendingKYC,
    getAnalyticsDetail,
    getBookingDetails,
    getUserDetailsById,
    adminLoginController,
    getAllNotifications
} from '../controllers/admin.controller.js';
import {userAccessControl} from '../middlewares/accessControl.middleware.js'

const router = Router();

// Define the routes and associate them with the controller functions
router.get('/analytics/user-logins',userAccessControl, user_login_count);
router.get('/analytics/user-registrations',userAccessControl, user_register_count);
router.get('/analytics/hostel-owner-logins',userAccessControl, hostelOwner_login_count);
router.get('/analytics/hostel-owner-registrations',userAccessControl, hostelOwner_register_count);
router.get('/analytics/details',userAccessControl, getAnalyticsDetail);
router.get('/analytics/booking-details',userAccessControl, getBookingDetails);

// Additional routes based on the other functions
router.get('/verification-requests',userAccessControl, getAllVerificationRequest);
router.post('/verify-hostel/:id',userAccessControl, verifyHostel);
router.post('/recover-account',userAccessControl, RecoverAccount);
router.get('/accounts',userAccessControl, allAccounts);
router.get('/user-detail/:id',userAccessControl, getUserDetailsById);
router.get('/pendingkyc',userAccessControl, getUsersWithPendingKYC);
router.get('/notifications',userAccessControl, getAllNotifications);
router.post('/login',adminLoginController);

export default router;

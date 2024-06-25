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
    getUserDetail
} from '../controllers/admin.controller.js';

const router = Router();

// Define the routes and associate them with the controller functions
router.get('/analytics/user-logins', user_login_count);
router.get('/analytics/user-registrations', user_register_count);
router.get('/analytics/hostel-owner-logins', hostelOwner_login_count);
router.get('/analytics/hostel-owner-registrations', hostelOwner_register_count);

// Additional routes based on the other functions
router.get('/verification-requests', getAllVerificationRequest);
router.post('/verify-hostel/:id', verifyHostel);
router.post('/recover-account', RecoverAccount);
router.get('/accounts', allAccounts);
router.get('/user-detail/:id', getUserDetail);

export default router;

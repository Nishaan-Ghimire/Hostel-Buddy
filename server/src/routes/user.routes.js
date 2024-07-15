import {Router} from 'express'
import {upload} from '../middlewares/multer.middleware.js'
import {  registerController, 
    loginController, 
    logoutController, 
    changePasswordController, 
    getUserDetail,
    updateAccountDetail,
    uploadProfilePicture,
    refreshAccessToken,
    sendOtp,
    verifyOTP,
    verifyToken,
    uploadCoverPicture } from '../controllers/user.controller.js';
import {userAuthMiddleware} from '../middlewares/auth.middleware.js'

import {getPopularHostels} from '../controllers/dashboard.controller.js'

const router = Router();


router.route('/register').post(registerController); // Done
router.route('/login').post(loginController); // Done
router.route('/refreshToken').patch(refreshAccessToken); // Done

// Secured Routed (permission level user)
router.route('/logout').post(userAuthMiddleware,logoutController) // Done
router.route('/sendOTP').post(userAuthMiddleware,sendOtp); // Done
router.route('/verifyOTP').post(userAuthMiddleware,verifyOTP); //Done


router.route('/verify/:token').get(userAuthMiddleware,verifyToken); //Done


router.route('/getUser').get(userAuthMiddleware,getUserDetail); // Done
router.route('/changePassword').patch(userAuthMiddleware,changePasswordController); //Done
router.route('/updateAccountDetail').patch(userAuthMiddleware,updateAccountDetail); // Done
router.route('/uploadProfileImage').patch(userAuthMiddleware,upload.single('profilePic'),uploadProfilePicture);
// router.route('/uploadCoverImage').patch(userAuthMiddleware,upload.single('coverPic'),uploadCoverPicture);



router.route('/dashboard').get(getPopularHostels);



export default router;
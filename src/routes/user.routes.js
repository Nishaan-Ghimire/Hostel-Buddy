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
    uploadCoverPicture,getResentlyAdded,getSuggested,addProperty,getAddedProperty,
    testEndpoint,getUserByUserName,requestAction,checkUserNotification,getUserByUserNameWithMayBeSameUserName
    //testEndpoint
    //,propertyDetails
 } from '../controllers/user.controller.js';
import {userAuthMiddleware} from '../middlewares/auth.middleware.js'
//import {bookingController} from '../controllers/booking.controller.js';
import {bookingController,checkNotification,getStatus,getMyAcceptedBooking} from '../controllers/booking.controller.js';
import hostelDetails from '../controllers/hostel_detail.js'

import {message,addMessage} from '../controllers/message.js';
import { SearchController } from '../controllers/search_controller.js';
import { createReview, getReviewsByHostel,updateReview } from '../controllers/review-controller.js';
const router = Router();

// router.route('test').get((async (req, res) =>{
//     console.log("ok")
// }))
router.route('/at').get(testEndpoint)
router.route('/register').post(registerController); // Done
router.route('/login').post(loginController); // Done
router.route('/refreshToken').patch(refreshAccessToken); //Done
router.route('/getRecentProperty').get(getResentlyAdded)
router.route('/getSuggestedProperty').get(getSuggested)

router.route('/addProperty').post(addProperty)
router.route('/propertyDetail',).post(hostelDetails)

router.route('/message').post(message)
router.route('/addMessage').post(addMessage)
//router.route('/propertDetail').post(propertyDetails)

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
router.route('/bookHostel').post(bookingController);
router.route('/search').post(SearchController)
router.route('/getAddedProperty').post(getAddedProperty); 
router.route('/getStatus').post(getStatus); 
router.route('/checkNotification').post(checkNotification); 
router.route('/getUserByUserName').post(getUserByUserName); 
router.route('/requestAction').post(requestAction); 
router.route('/checkUserNotification').post(checkUserNotification); 
router.route('/hel').post(async (req, res) =>{
res.send("kk")
})
//router.route('tes').get()
router.route('/getReview/:hostel_id').get(getReviewsByHostel); 
router.route('/createReview').post(createReview); 
router.route('/updateReview').post(updateReview); 
router.route('/getMyAcceptedBooking').post(getMyAcceptedBooking)
router.route('/getUserByUserNameWithMayBeSameUserName').post(getUserByUserNameWithMayBeSameUserName)

export default router;
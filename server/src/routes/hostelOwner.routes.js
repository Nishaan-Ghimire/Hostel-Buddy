import { Router } from 'express'
import { upload } from '../middlewares/multer.middleware.js'
import {
    HostelKYC,
    vendorRegister,
    loginController,
    logoutController,
    changePasswordController,
    getHostelOwnerDetail,
    HostelOwnerupdateAccountDetail,
    uploadProfilePicture,
    HostelOwneruploadCoverPicture,
    HostelOwnerRefreshAccessToken,
    HostelOwnersendOtp,
    HostelOwnerverifyOTP,
    HostelOwnerverifyToken,
    getUserDetailInfo,
    hostelDetails,
    
} from '../controllers/hostelOwner.controller.js';
import { hostelOwnerAuthMiddleware } from '../middlewares/auth.middleware.js'
import {getHostelAnalytics } from "../controllers/hostelOwnerAnalytics.js"
const router = Router();


router.route('/register/1').post(vendorRegister);
router.route('/register/2').post(HostelKYC,
    upload.fields(
        [
            {
                name: "panCard",
                maxCount: 1

            },
            {
                name: "hostel_certificate",
                maxCount: 1
            }]
    ));

router.route('/login').post(loginController);
router.route('/refreshToken').patch(HostelOwnerRefreshAccessToken);

// Secured Routed (permission level hostel owner)
router.route('/logout').post(hostelOwnerAuthMiddleware, logoutController)
router.route('/sendOTP').post(hostelOwnerAuthMiddleware, HostelOwnersendOtp);
router.route('/verifyOTP').post(hostelOwnerAuthMiddleware, HostelOwnerverifyOTP);


router.route('/verify/:token').get(hostelOwnerAuthMiddleware, HostelOwnerverifyToken);


router.route('/getUser').get(hostelOwnerAuthMiddleware, getHostelOwnerDetail);
router.route('/changePassword').patch(hostelOwnerAuthMiddleware, changePasswordController);
router.route('/updateAccountDetail').patch(hostelOwnerAuthMiddleware, HostelOwnerupdateAccountDetail);
router.route('/uploadProfileImage').patch(hostelOwnerAuthMiddleware, upload.single('profilePic'), uploadProfilePicture);
router.route('/uploadCoverImage').patch(hostelOwnerAuthMiddleware, upload.single('coverPic'), HostelOwneruploadCoverPicture);
router.route('/propertyDetail',).post(hostelDetails);
router.route('/getHostelAnalytics',).get(getHostelAnalytics);



export default router;
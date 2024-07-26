import {Router} from 'express'
import {upload} from '../middlewares/multer.middleware.js'
import {        
    HostelOwnerPage_1_RegistrationController,
    HostelOwnerPage_2_RegistrationController,
    HostelOwnerPage_3_RegistrationController,
    HostelOwnerloginController,
    HostelOwnerlogoutController,
    HostelOwnerchangePasswordController,
  //  HostelOwnerchangePasswordController,
    getHostelOwnerDetail,
    HostelOwnerupdateAccountDetail,
    HostelOwneruploadProfilePicture,
    HostelOwneruploadCoverPicture,
    HostelOwnerRefreshAccessToken,
    HostelOwnersendOtp,
    HostelOwnerverifyOTP,
    HostelOwnerverifyToken,getAddedProperty } from '../controllers/hostelOwner.controller.js';
import {hostelOwnerAuthMiddleware} from '../middlewares/auth.middleware.js'
const router = Router();


router.route('/register/1').post(HostelOwnerPage_1_RegistrationController); 
router.route('/register/2').post(HostelOwnerPage_2_RegistrationController, 
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
router.route('/register/3').post(HostelOwnerPage_3_RegistrationController); 

router.route('/login').post(HostelOwnerloginController); 
router.route('/refreshToken').patch(HostelOwnerRefreshAccessToken); 

// Secured Routed (permission level hostel owner)
router.route('/logout').post(hostelOwnerAuthMiddleware,HostelOwnerlogoutController) 
router.route('/sendOTP').post(hostelOwnerAuthMiddleware,HostelOwnersendOtp); 
router.route('/verifyOTP').post(hostelOwnerAuthMiddleware,HostelOwnerverifyOTP); 


router.route('/verify/:token').get(hostelOwnerAuthMiddleware,HostelOwnerverifyToken); 


router.route('/getUser').get(hostelOwnerAuthMiddleware,getHostelOwnerDetail); 
//router.route('/changePassword').patch(hostelOwnerAuthMiddleware,HostelOwnerchangePasswordController); 
router.route('/updateAccountDetail').patch(hostelOwnerAuthMiddleware,HostelOwnerupdateAccountDetail); 
router.route('/uploadProfileImage').patch(hostelOwnerAuthMiddleware,upload.single('profilePic'),HostelOwneruploadProfilePicture);
router.route('/uploadCoverImage').patch(hostelOwnerAuthMiddleware,upload.single('coverPic'),HostelOwneruploadCoverPicture);

router.route('/getAddedProperty').post(getAddedProperty); 

export default router;
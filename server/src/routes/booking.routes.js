import { Router } from 'express';
import {
    createBooking,
    AcceptBooking,
    getMyAcceptedBooking
} from '../controllers/booking.controller.js'

const router = Router();


router.post('/create',createBooking);
router.put('/accept',AcceptBooking);
router.get('/acceptedRequests',getMyAcceptedBooking);







export default router;
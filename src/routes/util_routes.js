import { Router } from 'express';
import { getBanner } from '../controllers/baneer_controller.js';

const router = Router();

// Route to serve image files
router.get('/media/:imageName', getBanner);

export default router;
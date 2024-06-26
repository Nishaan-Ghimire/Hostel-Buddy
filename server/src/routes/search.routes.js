import {Router} from 'express'
import { SearchController } from '../controllers/search.controller.js';

const router = Router();
router.route('/register').post(SearchController); // Done


export default router;
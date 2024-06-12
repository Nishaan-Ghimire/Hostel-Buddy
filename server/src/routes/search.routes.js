import {Router} from 'express'
import { SearchController } from '../controllers/search.controller.js';


router.route('/register').post(SearchController); // Done


export default router;
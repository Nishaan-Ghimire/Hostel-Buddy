import axios from 'axios'


const MATOMO_SITE_ID = process.env.MATOMO_SITE_ID; // Your Matomo site ID
const MATOMO_TRACKER_URL = process.env.MATOMO_TRACKER_URL; // Your Matomo tracking URL




async function trackEvent(userId, category, action, name = '', value = '') {
    try {
      const response = await axios.get(MATOMO_TRACKER_URL, {
        params: {
          idsite: MATOMO_SITE_ID,
          rec: 1,
          uid: userId,
          e_c: category,
          e_a: action,
          e_n: name,
          e_v: value,
          _id: userId,
          rand: Math.random(),
        },
      });
      console.log('Event tracked successfully:', response.data);
    } catch (error) {
      console.error('Error tracking event:', error);
    }
  }


// Function to get Matomo data
async function getMatomoData(method, period, date) {
    try {
      const response = await axios.get(MATOMO_API_URL, {
        params: {
          module: 'API',
          method: method,
          idSite: MATOMO_SITE_ID,
          period: period,
          date: date,
          format: 'json',
          token_auth: MATOMO_TOKEN,
        },
      });
      return response.data;
    } catch (error) {
      console.error('Error fetching Matomo data:', error);
      return null;
    }
  }



  export {trackEvent,getMatomoData}
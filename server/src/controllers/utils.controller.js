import path from 'path';

// Hardcoded list of hostel image URLs
const hostelImages = [
    'https://images.unsplash.com/photo-1570129477492-45c003edd2be',
    'https://images.unsplash.com/photo-1558180078-6585db788232',
    'https://images.unsplash.com/photo-1505678261036-a3fcc5e884ee',
    'https://images.unsplash.com/photo-1551218808-94e220e084d2',
    'https://images.unsplash.com/photo-1560347876-aeef00ee58a1'
  ];
  export const getBanner = async (req, res) => {
    res.json({
      success: true,
      images: hostelImages
    });
  }


// Function to get the banner image
export const getMedia = (req, res) => {
    const imagePath = path.join(__dirname, '..', '..', 'media', 'banner.png');

    res.sendFile(imagePath, err => {
        if (err) {
            console.error('Error sending file:', err);
            res.status(404).json({ message: 'Image not found' });
        }
    });
};




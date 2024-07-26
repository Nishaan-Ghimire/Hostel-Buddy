import path from 'path';

// Function to get the banner image
export const getBanner = (req, res) => {
    const imagePath = path.join(__dirname, '..', '..', 'media', 'banner.png');

    
    res.sendFile(imagePath, err => {
        if (err) {
            console.error('Error sending file:', err);
            res.status(404).json({ message: 'Image not found' });
        }
    });
};
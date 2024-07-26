mongoose.set('strictQuery', false);

mongoose.connect('mongodb://127.0.0.1:27017/hostel', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => {
  console.log('Connected to MongoDB');
}).catch(err => {
  console.error('Error connecting to MongoDB:', err);
});
//const collection = database.collection('mhostel');
////////////////////////////////////


const hostelSchema = new mongoose.Schema({
    name: String,
    description: String,
    location: String,
    amenities: [String]
  });
  hostelSchema.index({ 
    name: 'text', 
    description: 'text', 
    location: 'text', 
    amenities: 'text' 
  });
  const Hostel = mongoose.model('Hostel', hostelSchema);


// Function to insert sample data
async function insertSampleData() {
    const sampleHostels = [
      {
        name: 'Kathmandu Backpackers',
        description: 'A great place with free Wi-Fi and breakfast.',
        location: 'Kathmandu',
        amenities: ['Wi-Fi', 'Breakfast']
      },
      {
        name: 'Butwal Paradise',
        description: 'Comfortable stay with scenic views.',
        location: 'Butwal',
        amenities: ['Wi-Fi', 'Breakfast', 'Parking']
      },
      {
        name: 'Ilam Buddy',
        description: 'Comfortable stay with scenic views.',
        location: 'Illam',
        amenities: ['Wi-Fi', 'Breakfast', 'Parking']
      },
      {
        name: 'Dhangadhi Rockers',
        description: 'Comfortable stay with scenic views.',
        location: 'Dhangadhi',
        amenities: ['Wi-Fi', 'Breakfast', 'Parking']
      },
      {
        name: 'Janakpur Paradise',
        description: 'Comfortable stay with scenic views.',
        location: 'Janakpur',
        amenities: ['Wi-Fi', 'Breakfast', 'Parking']
      },
      // Add more sample hostels as needed
    ];
  
    await Hostel.insertMany(sampleHostels);
    console.log('Sample data inserted successfully.');
  }
  
  // Function to perform search
  async function searchHostels(query) {
    const results = await Hostel.find({ $text: { $search: query } });
    console.log('Search results:', results);
  }
  
  // Example usage
  (async () => {
    await insertSampleData()
    await searchHostels('Kathmandu');
  })();
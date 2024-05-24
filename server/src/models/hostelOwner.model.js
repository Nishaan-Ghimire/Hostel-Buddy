const HostelOwnerSchema = new Schema({
    name: { 
        type: String, 
        required: true 
    },
    email: { 
        type: String, 
        required: true, 
        unique: true 
    },
    password: { 
        type: String, 
        required: true 
    },
    
    kyc_documents: {
      id_proof: { type: String, 
        required: true 
    },
      address_proof: {
         type: String, 
         required: true 
        },
      other_documents: [String]
    },

    verified: { 
        type: Boolean, default: false },

    created_at: { 
        type: Date, default: Date.now 
    },

    updated_at: { 
        type: Date, default: Date.now 
    }
  });
  
  module.exports = mongoose.model('HostelOwner', HostelOwnerSchema);
  

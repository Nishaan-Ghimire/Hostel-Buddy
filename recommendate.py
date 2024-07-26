from pymongo import MongoClient
import pandas as pd
import numpy as np
from bson import ObjectId
from sklearn.metrics.pairwise import cosine_similarity
from flask import Flask, request, jsonify
import json

client = MongoClient('mongodb://localhost:27017/')
db = client['HostelBuddy']  
print(client)

users_collection = db['users']
users = list(users_collection.find({}))


users_collection = db['users']
reviews_collection = db['reviews']
hostels_collection = db['hostels']
users_list = list(users_collection.find({}))
reviews_list = list(reviews_collection.find({}))
hostels_list = list(hostels_collection.find({}))
users = pd.DataFrame(users_list)
reviews = pd.DataFrame(reviews_list)
hostels = pd.DataFrame(hostels_list)
# print(hostels['_id'])
# print(reviews['_id'])
print("Reviews Id:")
print(reviews['_id'])
users.rename(columns={'_id':'user_id'},inplace=True)
hostels.rename(columns={'_id':'hostel_id'},inplace=True)

users_with_review = reviews.merge(users,on='user_id')

users_with_review_and_hostel = users_with_review.merge(hostels,on='hostel_id')


pt = users_with_review.pivot_table(index='hostel_id',columns='user_id',values='star_rating')

pt.fillna(0,inplace=True)

similarity_score = cosine_similarity(pt)


def recommend(user_id):
    # Check if the user_id is in the columns of the pivot table
    user_id = ObjectId(user_id)
    if user_id not in pt.columns:
        print(f"User ID '{user_id}' not found in the pivot table columns.")
        ptUser = pt.columns[0] 
        print("This is pivot column user : ")
        print(type(ptUser))
        return
    
    # Check if the user_id is in the index of the similarity score matrix
    user_index = np.where(pt.columns == user_id)[0]
    if len(user_index) == 0:
        print(f"User ID '{user_id}' not found in the similarity score index.")
        print(user_index)
        return
    
    index = user_index[0]
    similar_items = sorted(list(enumerate(similarity_score[index])), key=lambda x: x[1], reverse=True)[1:10]
    
    recommendations = []
    print(f"Recommendations for user ID '{user_id}':")
    for i in similar_items:
        recommendations.append(str(pt.index[i[0]]))
        print(str(pt.index[i[0]]))
        
    return json.dumps({"recommendations":recommendations})
    #return recommendations




app = Flask(__name__)


@app.route('/recommend', methods=['GET'])
def get_recommendations():
    user_id = request.args.get('user_id')
   # recommendations = recommend('6686d188c5b0f9a9e195db4c')
    recommendations = recommend(user_id)
    return jsonify(recommendations)

if __name__ == '__main__':
    app.run(debug=True)






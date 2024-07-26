from rest_framework.response import Response
from rest_framework.decorators import api_view
# from recommendationSystem import recommend


from pymongo import MongoClient
import pandas as pd
import numpy as np
from bson import ObjectId
from sklearn.metrics.pairwise import cosine_similarity
from celery import shared_task
from celery.result import AsyncResult
from .tasks import recommend  # Import your Celery task




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


users.rename(columns={'_id':'user_id'},inplace=True)
hostels.rename(columns={'_id':'hostel_id'},inplace=True)

users_with_review = reviews.merge(users,on='user_id')

users_with_review_and_hostel = users_with_review.merge(hostels,on='hostel_id')


pt = users_with_review.pivot_table(index='hostel_id',columns='user_id',values='star_rating')

pt.fillna(0,inplace=True)

similarity_score = cosine_similarity(pt)








@api_view(['GET'])
def getRecommendation(request):  
    myresponse = recommend.delay('6686d188c5b0f9a9e195db4c')
    return Response(myresponse)
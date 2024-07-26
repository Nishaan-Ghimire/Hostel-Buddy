from celery import shared_task

@shared_task
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
    
    print(f"Recommendations for user ID '{user_id}':")
    for i in similar_items:
        print(pt.index[i[0]])
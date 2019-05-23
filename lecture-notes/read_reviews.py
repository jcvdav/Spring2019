import pandas as pd
import numpy as np
import json
import pickle

## read train_business.json 
with open('train_business.json') as json_file:      
    data_business = json_file.readlines()
    data_business = list(map(json.loads, data_business)) 

## pick 100 businesses at random
train_business = [data_business[index] for index \
                  in np.random.randint(0, len(data_business), size=100)]

## read train_business.json 
with open('review.json') as json_file:      
    data_review = json_file.readlines()
    data_review = list(map(json.loads, data_review)) 
    
len(data_review) 

business100 = [business["business_id"] for business in train_business]

# add to train_review if the business_id is found in business100
train_review = [review for review in data_review \
                if review['business_id'] in business100]

pickle.dump(train_review, open('train_review.pkl','wb'))
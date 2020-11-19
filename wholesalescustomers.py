import numpy as np 
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt 
from scipy import stats 

#%%
#load data 

wholesalecustomers = pd.read_csv ('data/wholesalecustomers.csv')


# %%
#Explore data 

wholesalecustomers.info()
#%%#
wholesalecustomers.shape
#%%#
wholesalecustomers.head()

#%%#
wholesalecustomers.tail()
# %%
#check if there is missing values 
wholesalecustomers.isnull().sum()
# %%
#change channel  and region into factors 
wholesalecustomers['Channel']= wholesalecustomers['Channel'].astype('category')
wholesalecustomers['Region']= wholesalecustomers['Region'].astype('category')
# %%
#change the channel 1 and 2 into Horeca and Retail
#change the region 1,2 and 3 into lisbon, porto and  other region

wholesalecustomers ['Channel']= wholesalecustomers['Channel'].map ({1:'Horeca', 2: 'Retail'})
wholesalecustomers ['Region'].replace ([1,2,3],['Lisbon', 'Porto', 'Other_Region'], inplace=True)


#%%
wholesalecustomers.describe()


# %%


#### **see the proportion of 2 channels  Horica and Retail in the Data:** 



#%%
 


  

# %%


# %%

  
import numpy as np
import pandas as pd 
import seaborn as sns  
from scipy import stats 
import matplotlib.pyplot as plt 
#%%
wholesalecustomers = pd.read_csv ('data/wholesalecustomers.csv')


#%%
#Examine the data 

wholesalecustomers.info
#%%

wholesalecustomers.shape
#%%
wholesalecustomers.columns

#%%
#Check if there is any missing value 
wholesalecustomers.isnull().sum()

#there is no any missing values 

#%%
#Summarise Data 
wholesalecustomers.describe()


#%% #change channel and region into category 

wholesalecustomers['Channel'] = wholesalecustomers['Channel'].astype('category')
wholesalecustomers['Region'] = wholesalecustomers['Region'].astype('category')

#%%
#change the Channel 1 and 2 into Horeca and Retail 
#Change the Region 1,2 and 3 into Lisbon,Porto and Other Region 
wholesalecustomers['Channel'] = wholesalecustomers['Channel'].map({1:'Horeca', 2:'Retail'})
wholesalecustomers['Region'].replace([1,2,3],['Lisbon','Porto','other_Region'],inplace=True)

# %% 
#Explore the first data row 
wholesalecustomers.head()


# %%
#Explore the last data rows 

wholesalecustomers.tail()
# %%
 #count Channel and Region members 
wholesalecustomers ["Channel"].value_counts()
wholesalecustomers ["Region"].value_counts()



#%%
#plot wholesalecustomers
wholesalecustomers_p= sns.pairplot(wholesalecustomers)

# %%
#plot 
sns.set_style("whitegrid");
sns.pairplot(wholesalecustomers, hue="Region", size=3);
plt.show()



# %%







# %%

#what the total cost for every product in Horeca Channel? 


# %%
#what the max and min cost in Chanel Retail?


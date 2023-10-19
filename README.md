# Boat-Listing-Analysis

Analysis : 

Hello everyone,
After searching on numerous websites I selected a boat sales data set from Kaggle as base of my week 4 Project. It contains data about different types of boat ,listed price ,location listed, dimensions and view on website in last 7 days . The Purpose of the dataset is to produce weekly newspaper summary to help boat sellers by analysing trend of last week . 

here is a link of dataset : [https://www.kaggle.com/datasets/karthikbhandary2/boat-sales/data](url)

I am aiming to find answer of following 3 questions :  

	1. Analyzing country wise trend for buyers interested in boats.
	2. Identifying characteristics of most viewed boats .
	3. Discover search trends for different type of boats .
  
My Approach : 
I will start my analysis from cleaning data and focused on cleaning location section as well as using relevant method to fill null values present in data set Followed by data pre-processing .I will aim to create 3 different instances of the data set to answer my 3 questions .Lastly. I will make appropriate visualizations to support my analysis.

Results :

Q1 : Analyze country-wise trends for boat listing and values. 
My findings : 
To answer this question I expand the data and create a new data frame that include necessary data to support my research. Then I plotted numerous visualizations some of which tells story are describe below .

<img width="925" alt="image" src="https://github.com/Dhruv-88/Boat-Listing-Analysis-/assets/119725703/33d1462f-5db8-4814-b680-474818c8b750">

The first visualization above clearly indicates that the majority of boats listed on the website fall within the price range of 0-20,000 USD, with a few outliers priced around 300,000 USD. In the next graph, I explore the average listing prices for boats in different countries and the quantity of boats listed in each. My analysis reveal that countries such as Greece, Malta, Turkey, and Denmark have fewer listings, yet they boast significantly higher average prices compared to countries like Germany, Switzerland, the Netherlands, and France, which have a higher number of listings. To verify my findings I plotted two more graphs that revels real reason for country having higer prices.

<img width="912" alt="image" src="https://github.com/Dhruv-88/Boat-Listing-Analysis-/assets/119725703/dbd2f6c6-380e-40b1-bf1b-16e20361cc03">

The above graphs are inspired by the previous visualization, which highlights the countries with the highest and lowest average boat prices. A closer investigation, as depicted in the first graph, reveals that the high average prices are often attributed to a limited number of listings.

	• The initial graph showcases the quantity of boats listed in various categories across different countries. It is evident that Switzerland, Italy, and Germany offer a wide range of listings, primarily featuring newer boats.
	• The subsequent graph aims to analyse the average prices for each category. It is apparent that when there are only a few listings in a particular category, the average price tends to be higher. To gain a more accurate understanding, it is essential to compare categories with a sufficient number of listings. This is illustrated by comparing the Motor Yacht prices for Italy and Denmark. In Denmark, with a limited number of Yacht listings, the average price is notably high. In contrast, Italy, with a more extensive selection of Yachts, exhibits a lower average price.From two graph we can choose which country could be best if we want to find deals for any particular boat type.

 Q2 : Analyze the pattern of views for the listed with respect to boat type and average price listed . 
To find answers of this question I plotted below 2 graphs.

<img width="944" alt="image" src="https://github.com/Dhruv-88/Boat-Listing-Analysis-/assets/119725703/ecf12b90-9841-4724-9087-fe56ff8fda83">

	• The initial visualization clearly highlights that, a distinct pattern emerges as it reveals notably high average prices for Motor Yachts and Flybridges. An additional noteworthy trend is the substantial presence of used boats in the listings.
In the following graph, it is evident that the majority of views are focused on boats listed for less than 50,000 USD.



After analysing the provided dataset, the following conclusions can be drawn:
1. The majority of listed boats are priced below 200,000 USD.
2. Countries such as France, Germany, Denmark, Switzerland, and Turkey exhibit a significant number of listings in each boat category.
3. It's apparent that most individuals are searching for boats priced below 200,000 USD, and there is a preference for searching for used boats.
4. Motor Yachts and Flemings are among the most expensive boat types, while Ketches, Launches, and Passenger Boats are relatively more affordable.


[Patel_Project4.pptx](https://github.com/Dhruv-88/Boat-Listing-Analysis-/files/13044362/Patel_Project4.pptx)

# Hotel_-Database





For this project the stakeholders have asked us three questions,
1.	Is Revenue Growing by year
2.	Should parking lot be expanded.
3.	What trends/ insights are present in the data
Process
Joined the three year(2018, 2019, 2020)  hotel data set using union to arrive at one data set

In the data, we don’t have a clear revenue column, based on my understanding of an hotel business, revenue will be generated based on the number of days passed by visitors and the charge amount per room. 
Standing on the above premise, Stay in weekend night stay in week nights were identified as the number od days passed by visitors while adr was identified as the charge out per room

To also get the revenue after discount was , we get the discount given by market segment from the market segment table and deduct it from the charge calculated(i.e ( Stay in weekend night +stay in week nights) adr

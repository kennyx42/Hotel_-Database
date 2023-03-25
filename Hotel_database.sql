
--Joined the three year(2018, 2019, 2020)  hotel data set using union to arrive at one data set

Select* from dbo.[2018]
UNION
Select* from dbo.[2019]
UNION
Select* from dbo.[2020]


---Question1
--- Is Revenue growing by year?

with hotel_comb as (
Select * from dbo.[2018]
UNION
Select * from dbo.[2019]
UNION
Select * from dbo.[2020]
)
-- Using charge and arrival_date_year to get revenue by year

Select arrival_date_year as year, hotel, round(sum((stays_in_weekend_nights + stays_in_week_nights)*adr),2) as charge from hotel_comb
group by arrival_date_year,hotel
order by arrival_date_year;


-- Revenue calculation considering discount given to customer based off on market_segmnet

with hotel_comb as (
Select * from dbo.[2018]
UNION
Select * from dbo.[2019]
UNION
Select * from dbo.[2020]
),
cal as (
Select *,arrival_date_year as year,  (stays_in_weekend_nights + stays_in_week_nights)*adr as charge from hotel_comb
)
select year,hotel, round(sum((charge-(charge*Discount))),-1) as dsicounted_revenue from cal c
join dbo.Market_segment ms
on c.market_segment= ms.market_segment
Group by year, hotel
order by year,hotel


with hotel_comb as (
Select * from dbo.[2018]
UNION
Select * from dbo.[2019]
UNION
Select * from dbo.[2020]
)
select * from hotel_comb h
left join dbo.Market_segment ms
on h.market_segment= ms.market_segment
left join dbo.Meal_cost mc
on h.meal = mc.meal
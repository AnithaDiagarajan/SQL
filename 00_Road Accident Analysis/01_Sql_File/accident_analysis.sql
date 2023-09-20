select * from road_accident

select sum(number_of_casualties) as CY_Casualties
from road_accident
where year(accident_date)='2022'

select count (distinct accident_index) as CY_Accidents
from road_accident 
where year (accident_date) = '2022'

select sum(number_of_casualties) as CY_Fatal_Casualties
from road_accident
where accident_severity = 'Fatal' and  year (accident_date) = '2022'

Select sum (number_of_casualties) as CY_Serious_Casualties
From road_accident
Where accident_severity = 'Serious' and year (accident_date) = '2022'

Select sum (number_of_casualties) as CY_Slight_Casualties
From road_accident
Where accident_severity = 'Slight' and year (accident_date) = '2022'


select sum(number_of_casualties) as Fatal_Casualties
from road_accident
where accident_severity = 'Fatal' 



select sum(number_of_casualties) as Serious_Casualties
from road_accident
where accident_severity = 'Serious' 


Select sum (number_of_casualties) as Slight_Casualties
From road_accident
Where accident_severity = 'Slight' 

select cast(sum(number_of_casualties) as decimal(10,2))*100 / 
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident) as Fatal_PCT
from road_accident
where accident_severity ='Fatal'

Select cast (sum (number_of_casualties) as decimal (10, 2))*100 / 
(Select cast (sum (number_of_casualties) as decimal (10, 2)) from road_accident) as Serious_PCT
From road_accident
Where accident_severity ='Serious'

Select cast (sum (number_of_casualties) as decimal (10, 2))*100 / 
(Select cast (sum (number_of_casualties) as decimal (10, 2)) from road_accident) as Slight_PCT
From road_accident
Where accident_severity ='Slight'

select
case when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
     when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
	 when vehicle_type in ('Motorcycle 125cc and under','Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc','Pedal cycle') then 'Bike'
	 when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8- 16 passenger seats)') then 'Bus'
	 when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van/ Goods 3.5 tonnes mgw or under') then 'Van'
	 else 'Other' end as vehicle_group,
	 sum(number_of_casualties) as CY_Casualties from road_accident 
	 where year(accident_date) = '2022'
	 group by
	 case when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
     when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
	 when vehicle_type in ('Motorcycle 125cc and under','Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc','Pedal cycle') then 'Bike'
	 when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8- 16 passenger seats)') then 'Bus'
	 when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van/ Goods 3.5 tonnes mgw or under') then 'Van'
	 else 'Other' end


	 select datename(MONTH, accident_date) AS Month_Name, sum(number_of_casualties) AS CY_Casualties
	 from road_accident 
	 where year(accident_date) = '2022' 
	 group by datename(MONTH, accident_date)

	  select datename(MONTH, accident_date) AS Month_Name, sum(number_of_casualties) AS PY_Casualties
	 from road_accident 
	 where year(accident_date) = '2021' 
	 group by datename(MONTH, accident_date)


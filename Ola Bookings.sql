create database [Ola Bookings]
use [Ola Bookings]


-------------------------------------------------------------------------------------
create view bookings as
select * from [Ola-Cab-Bookings-Kolkata];
select * from bookings;

--------------------------------------------------------------------------------------
--Retrieve all successful bookings.
create view Successful_Bookings as
select * from bookings where Booking_Status = 'success';
select * from Successful_Bookings;

----------------------------------------------------------------------------------------
--Find the average ride distance for each vehicle type.
create view Avg_Ride_Distance_by_VehicleType as
select vehicle_type, avg(ride_distance) [Avg Ride Distance] from bookings
group by vehicle_type;
select * from Avg_Ride_Distance_by_VehicleType;

----------------------------------------------------------------------------------------
--Get the total number of cancelled rides by customers.
create view Cancelled_Rides_by_Customers as
select count(*) [No. of cancelled rides by customer] from bookings where booking_status = 'cancelled by customer';
select * from Cancelled_Rides_by_Customers;

-----------------------------------------------------------------------------------------
--List the top 5 customers who booked the highest number of rides.
create view Top_5_Customers as
select top(5) customer_id, count(booking_id) [No. of rides booked] from bookings
group by customer_id
order by [No. of rides booked] desc;
select * from Top_5_Customers;

------------------------------------------------------------------------------------------
--Get the number of rides cancelled by drivers due to personal and car-related issues.
create view [No. of rides cancelled by drivers due to Personal & Car related issues] as
select count(*) [No. of rides cancelled by drivers] from bookings
where Cancelled_Rides_by_Driver = 'Personal & Car related issues';
select * from [No. of rides cancelled by drivers due to Personal & Car related issues];

---------------------------------------------------------------------------------------------
--Find the maximum and minimum driver ratings for Prime Sedan bookings.
create view Max_Min_Driver_Ratings as
select max(Driver_Ratings) [Max. Driver Ratings],
min(Driver_Ratings) [Min. Driver Ratings]
from bookings
where vehicle_type = 'Prime Sedan';
select * from Max_Min_Driver_Ratings;

-----------------------------------------------------------------------------------------------
--Retrieve all rides where payment was made using UPI.
create view UPI_Payment as
select * from bookings where payment_method = 'UPI';
select * from UPI_Payment;

-----------------------------------------------------------------------------------------------
--Find the average customer rating per vehicle type.
create view avg_CR_per_vehicle_type as
select vehicle_type, avg(customer_ratings) [Avg customer rating] from bookings
group by vehicle_type;
select * from avg_CR_per_vehicle_type;

-----------------------------------------------------------------------------------------------
--Calculate the total booking value of rides completed successfully.
create view [Total Successful Booking Value] as
select sum(booking_value) [Total Successful Booking Value] from bookings 
where booking_status = 'Success' and Incomplete_Rides = 'No';
select * from [Total Successful Booking Value];

------------------------------------------------------------------------------------------------
--List all incomplete rides along with the reason.
create view All_Incomplete_Rides as
select booking_id, incomplete_rides_reason from bookings
where incomplete_rides = 'Yes';
select * from All_Incomplete_Rides;

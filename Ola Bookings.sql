create database [Ola Bookings]
use [Ola Bookings]

create view bookings as
select * from [dbo].[Ola-Cab-Bookings-Kolkata]

select * from bookings

select * from bookings where Vehicle_Type like 'Bike'
select count(*) from bookings where Vehicle_Type like 'Bike'
select * from bookings where booking_status = 'cancelled by customer'
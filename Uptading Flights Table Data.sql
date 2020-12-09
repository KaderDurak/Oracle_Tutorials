/* CREATE TABLE*/

create table flights ( 
  flight_id                integer not null primary key, 
  flight_number            varchar2(6) not null, 
  departure_airport_code   varchar2(3) not null, 
  destination_airport_code varchar2(3) not null, 
  departure_datetime       timestamp with time zone not null, 
  flight_duration          interval day to second(0) not null, 
  operating_carrier_code   varchar2(2) not null 
) partition by range (departure_airport_code) ( 
  partition pA_E values less than ('F'), 
  partition pF_J values less than ('K'), 
  partition pK_O values less than ('P'), 
  partition pP_T values less than ('U'), 
  partition pU_Z values less than ('a') 
);

/*INSERT DATA INTO TABLE*/

insert into flights  
values (1, 'BA123', 'LHR', 'JFK', timestamp'2015-01-01 10:00:00 -00:00', interval '5' hour, 'BA');
insert into flights  
values (2, 'BA123', 'LHR', 'JFK', timestamp'2015-01-02 10:00:00 -00:00', interval '5' hour, 'BA');
insert into flights  
values (3, 'AA567', 'LHR', 'JFK', timestamp'2015-01-01 13:00:00 -00:00', interval '6' hour, 'AA');
insert into flights  
values (4, 'BA124', 'JFK', 'LHR', timestamp'2015-01-01 22:00:00 -05:00', interval '5' hour, 'BA');
insert into flights  
values (5, 'BA124', 'JFK', 'LHR', timestamp'2015-01-02 22:00:00 -05:00', interval '5' hour, 'BA');
insert into flights  
values (6, 'AA567', 'JFK', 'LHR', timestamp'2015-01-01 20:00:00 -05:00', interval '6' hour, 'AA');
insert into flights  
values (7, 'AA987', 'JFK', 'SFO', timestamp'2015-01-02 12:00:00 -05:00', interval '4' hour, 'AA');

commit;

/* UPTADE ROW*/

update flights set flight_number = 'AA986'  where  flight_id = 7;

select * from flights;

/*UPTADE COLUMN*/

update flights 
set    flight_duration = flight_duration + interval '30' minute 
where  flight_id = 7;

select * from flights;


/* UPTADE MULTIPLE COLUMN IN A ROW*/

update flights 
set    flight_number = 'BA986', flight_duration = interval '5' hour, operating_carrier_code = 'BA' 
where  flight_id = 7;

select * from flights;

/* UPTADE USING CORRELATED SUBQUERRY*/


update flights f1 
set    f1.flight_duration = f1.flight_duration + interval '30' minute 
where  f1.flight_id in (select f2.flight_id  
                        from   flights f2 
                        where  f2.operating_carrier_code = 'BA');
                        
select * from flights;

/* CORRELATED UPTADE

 For all flights with OPERATING_CARRIER_CODE='BA' that depart on 1 Jan 2015 , it appends zero to the flight number and sets the flight duration to the duration of the AA flight on the same day and same route. It also sets the departure times for these flights to 11AM GMT.*/


update flights f1 
set    f1.departure_datetime = timestamp'2015-01-01 11:00:00 -00:00', 
       (f1.flight_number, f1.flight_duration) = ( 
          select f2.flight_number || '0', f2.flight_duration 
          from   flights f2 
          where  f2.departure_airport_code = f1.departure_airport_code 
          and    f2.destination_airport_code = f1.destination_airport_code 
          and    trunc(f2.departure_datetime) = trunc(f2.departure_datetime) 
          and    f2.operating_carrier_code = 'AA' 
        ) 
where  f1.operating_carrier_code = 'BA' 
and    trunc(f1.departure_datetime) = date'2015-01-01';

select * from flights;















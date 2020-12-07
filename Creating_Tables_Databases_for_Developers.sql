3. Try It!
Complete the following statement to create a table to store the following details about bricks:

Colour
Shape
Use the data type varchar2(10) for both columns.

create table bricks (
  /*TODO*/
  colour varchar2(10),
  shape varchar2(10)
);

select table_name
from   user_tables
where  table_name = 'BRICKS';


6. Try It!
Complete the following statement to create the index-organized table bricks_iot:

create table bricks_iot (
  bricks_id integer primary key,
 /*TODO*/
  iot_type varchar2(100))
  organization index;

select table_name, iot_type
from   user_tables
where  table_name = 'BRICKS_IOT';


10. Try It!
Complete the following statement to create a hash-partitioned table. This should be partitioned on brick_id and have 8 partitions:

create table bricks_hash (
  brick_id integer
) partition by /*TODO*/hash(brick_id) partition 8;

select table_name, partitioned 
from   user_tables
where  table_name = 'BRICKS_HASH';

13. Try It!
Complete the following statement to drop the toys table:

drop table /*TODO*/ toys;

select table_name
from   user_tables
where  table_name = 'TOYS';






/*
5. Try It!
Complete the query below to:

Inner join toys and bricks
Where the toy_id is greater than the brick_id*/

select * 
from   toys
inner join   bricks
/* TODO */
on toy_id>brick_id;


/*8. Try It!
Complete the query below to return:

All the rows from bricks
Any rows in toys with toy_id equal to the brick_id and the toy_colour is blue*/

select * 
from   toys
left   join bricks
on     toy_id = brick_id
and    brick_colour = 'blue' and toy_colour='blue';


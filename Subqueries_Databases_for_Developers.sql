3. Try it!
Complete the query below, using an inline view to find the min and max brick_id for each colour of brick:

select * from (
  select colour,min(brick_id), max(brick_id)
  from   bricks
  group  by colour
) brick_counts

7. Try it!
Complete the subquery to find all the rows in bricks with a colour where colours.minimum_bricks_needed = 2:

select * from bricks b
where b.colour in (select colour_name from colours
where colours.minimum_bricks_needed = 2);

9.Try it!
Complete the scalar subquery below to find the minimum brick_id for each colour:

select c.colour_name, (
select min(brick_id) 
         from   bricks b
         where  b.colour = c.colour_name
         group  by b.colour
       ) min_brick_id
from   colours c
where  c.colour_name is not null;

14. Try it!
Complete the following with clause to count how many rows there are in colours:

with colour_count as ( 
    select count(*)  from colours
)
  select * from colour_count;
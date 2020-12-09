/*3. Try it!

Insert this incomplete query the editor. Complete it to find the row where the times_lost is null ('Blue Brick'):*/

select *
from   toys
where  times_lost is null;

/*7. Try it!
Complete the following query to find all the rows where times_lost is less than 5 or null:*/

/*with nvl/*

select *
from   toys
where  nvl ( times_lost,0)<5;

/*with coalesce*/
select *
from   toys
where  coalesce ( times_lost,0)<5;


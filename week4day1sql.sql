-- 1. How many actors are there with the last name Wahlberg? Answer is: 2
select first_name, last_name
from actor
where last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99? Answer is: 5,607 total results
select amount
from payment
where amount between 3.99 and 5.99;


-- 3. What film does the store have the most of? (Search in inventory): Theres 72 films the store has the most copies of. See list below
select film_id, COUNT(*) as category_count
from inventory
group by film_id
order by category_count desc 
limit 72;


-- 4. How many customers have the last name "William"? answer is: 0
select COUNT(last_name)
from customer 
where last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals? Answer is: Staff_id (1) with 8,040 rentals
select staff_id, COUNT(*) as category_count
from rental
group by staff_id 
order by category_count desc;



-- 6. How many different districts are there? Answer is: 378 total different districts
select district, COUNT(*) as category_count
from address
group by district
order by category_count desc;


-- 7. What film has the most actors in it? (use film_actor table and get film_id). Answer is: Film_id (508) with 15 actors in it
select film_id, COUNT(*) as category_count
from film_actor
group by film_id
order by category_count desc;



-- 8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- there are 21 total customers with last name ending in 'es'
select COUNT(distinct last_name) 
from customer
where last_name like '%es'; -- like looks for similar results. % tells the query to look at the end of last name for characters like 'es' 


-- 9. How many payment amounts (4.99 5.99 etc) had a number of rentals above 2250 for customers with ids between 380 and 430?
-- Answer is: 0 rentals above 2250 with customer ids 380-430
select amount, rental_count
from ( 
	select amount, COUNT(*) as rental_count
	from payment
	where customer_id between 380 and 430
	group by amount) as subquery
WHERE rental_count > 2250; --i 100% had to outsource to figure this out. But i now know what a subquery looks like. Y'all be sneaky af


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies in total?
-- Answer is: 5 rating categroies. The rating with the most movies in total is PG-13 with 223 total movies.
select rating, COUNT(*) AS category_count
from film
group by rating 
order by category_count desc;

use sakila;
#1. Display all available tables in the Sakila database.
show full tables;

select count(*) from film;
SELECT COUNT(*) FROM film_text;

#2. Retrieve all the data from the tables `actor`, `film` and `customer`.

select * from sakila.actor;
select * from sakila.film;
select * from sakila.customer;

select * from sakila.actor, sakila.film, sakila.customer;

/*Retrieve the following columns from their respective tables:
	- 3.1 Titles of all films from the `film` table
	- 3.2 List of languages used in films, with the column aliased as `language` from the `language` table
	- 3.3 List of first names of all employees from the `staff` table*/

select title from film;
select a.title,l.name
from sakila.film a,
sakila.language l
where a.language_id = l.language_id;

select title "Film",name as 'Language'
from sakila.film f inner join sakila.language l on f.language_id = l.language_id;

select s.first_name
from sakila.staff s;

# Retrieve unique release years.

select distinct release_year from film;

/*Counting records for database insights:

5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.*/

select count(store_id) from sakila.store;
select count(staff_id) from sakila.staff;
select count(f.staff_id) from sakila.store s inner join sakila. f on s.store_id = f.store_id;

select film
from film f inner join inventory i on f.film_id = i.film_id
inner join rental r on r.inventory_id = i.inventory_id;

SELECT
    (SELECT COUNT(*) 
     FROM inventory) AS films_lavailable_for_rent,
    (SELECT COUNT(DISTINCT inventory_id)  
     FROM rental) AS films_rented;
	
select count(distinct last_name) from actor;

/*6. Retrieve the 10 longest films.
7.  Use filtering techniques in order to:
	- 7.1 Retrieve all actors with the first name "SCARLETT".*/
    
SELECT MAX(length) FROM film;

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;
SELECT *
FROM actor
WHERE first_name = 'SCARLETT';

SELECT first_name 
FROM actor
WHERE first_name  = "SCARLETT";

/*BONUS: 
	- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
	
		- *Hint: use `LIKE` operator. [More information here.](https://www.w3schools.com/sql/sql_like.asp)*
	- 7.3 Determine the number of films that include Behind the Scenes content */

SELECT * 
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

SELECT COUNT(*)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';


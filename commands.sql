select* from rental ;
select* from film_category ;
select* from customer ;
select * from staff;
/*1.Write a query to retrieve the details of all films in the database, 
including the title, description, release year, and rental rate.*/
select film_id,description,release_year,rental_rate from sakila.film;

/*2.Create a query to display the top 10 customers who have rented the most films,
 showing their customer ID, first name, last name, and the total number of films rented.*/
select c.customer_id, c.first_name,c.last_name,count(r.rental_id) as total_rentals 
from customer as c join rental as r on c.customer_id =r.customer_id  
group by customer_id order by total_rentals desc limit 10;

/*3.Write a query to find the average rental duration (in days) for each film category, including the category name and the average duration.*/
SELECT  c.name AS category_name, AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_duration
FROM film_category AS fc
JOIN film AS f ON fc.film_id = f.film_id
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY fc.category_id, c.name;

/*4.What are the top 5 categories of films in terms of number of films and how many films are there in these categories? */
select c.name ,count(film_id) as nofilims from category 
as c join film_category as fc on c.category_id=fc.category_id 
group by name order by nofilims desc limit 5;

/*5.What are the five most popular films to rent?*/

select f.title,count(rental_id) as num from film as f
 join inventory as i on f.film_id=i.film_id
 join rental as r on i.inventory_id=r.inventory_id group by title order by num desc limit 5;
 
 /*6.Which are the 5 most popular actors? (In terms of being in the films most rented) */
 
 select CONCAT(a.first_name,'',a.last_name) as name, count(r.rental_id) as rentalcount
 from actor a join film_actor fa on a.actor_id=fa.actor_id
 join inventory i on fa.film_id =i.film_id
 join rental r on i.inventory_id=r.inventory_id group by name order by rentalcount desc limit 5;
 
 /*7.Create a report containing the number of films rented, number of unique customers and amount of revenue broken down by month and year.*/
 select count(r.rental_id) as filimsrented,count(distinct(r.customer_id)) ,sum(p.amount),
 date_format(r.rental_date,'%Y-%M') as rentaldate from rental r
 join payment p on r.customer_id=p.customer_id
  group by rentaldate
  ORDER by rentaldate;
  
  /*8.Write a query to retrieve the details of all films that have not been rented yet, including the title, description, and rental rate.*/
  
 select f.title,f.description,f.rental_rate from film f
  left join inventory i on f.film_id=i.film_id
 left join rental r on i.inventory_id=r.inventory_id
 where r.rental_id is null;
 
 /*9Write a query to display the rental history of a specific customer, 
 including the rental ID, rental date, return date, and film title, for customer ID 25.*/
 
 select r.rental_date,r.rental_id,r.customer_id,f.title from rental r
 join inventory i on r.inventory_id=i.inventory_id
 join film f on i.film_id=f.film_id
 where r.customer_id=25;
 
 /*10Retrieve the top 3 customers who have rented films from at least 3 different film categories.
 Include their customer ID, first name, last name, and the count of distinct film categories rented.*/
 select c.customer_id,c.first_name,c.last_name,count(distinct(fc.category_id)) as category
 FROM
    customer AS c
    JOIN rental AS r ON c.customer_id = r.customer_id
    JOIN inventory AS i ON r.inventory_id = i.inventory_id
    JOIN film AS f ON i.film_id = f.film_id
    JOIN film_category AS fc ON f.film_id = fc.film_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(DISTINCT fc.category_id) >= 3
ORDER BY
    category DESC
LIMIT 3;

/*11.Calculate the total revenue generated by each staff member, including their staff ID, first name, last name, and the total amount spent by customers they have served.
 Consider only completed rentals (where return date is not null).*/
select s.staff_id,s.first_name,s.last_name,sum(p.amount) as revenue from staff s 
join payment p on s.staff_id=p.staff_id
join rental r on p.rental_id=r.rental_id
where return_date is not null
group by staff_id ;
/*12.Find the customers who have returned films after the due date for more than 5 times.
 Display their customer ID, first name, last name, and the count of late returns.*/
 
select c.customer_id,c.first_name,c.last_name,count(*) as rentalrates
FROM 
    customer AS c
    JOIN rental AS r ON c.customer_id = r.customer_id
    JOIN payment AS p ON r.rental_id = p.rental_id
WHERE 
    p.amount < r.rental_rate
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
HAVING 
    COUNT(*) > 5;



 


 
 
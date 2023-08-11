/* EJERCICIO 1 */

SELECT customer.last_name, customer.email, address.address FROM sakila.customer
JOIN sakila.address ON address.address_id = customer.address_id
JOIN sakila.city ON city.city_id = address.city_id
WHERE city.city_id = 312;

/* EJERCICIO 2 */

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name 
FROM sakila.film
JOIN sakila.film_category ON film_category.film_id = film.film_id
JOIN sakila.category ON category.category_id = film_category.category_id
WHERE category.name = "Comedy";

/* EJERCICIO 3 */

SELECT actor.actor_id, actor.first_name, actor.last_name, film.title, film.description, film.release_year
FROM sakila.film
JOIN sakila.film_actor ON film_actor.film_id = film.film_id
JOIN sakila.actor ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 5;

/* EJERCICIO 4 */

SELECT store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address  FROM sakila.customer
JOIN sakila.store ON store.store_id = customer.store_id
JOIN sakila.address ON address.address_id = customer.address_id
JOIN sakila.city ON city.city_id = address.city_id
WHERE store.store_id = 1 AND city.city_id IN (1, 42, 312, 459);

/* EJERCICIO 5 */

SELECT film.title, film.description, film.release_year, film.rating, film.special_features FROM sakila.film
JOIN sakila.film_actor ON film.film_id = film_actor.film_id
WHERE film.rating = "G" AND film.special_features LIKE "%behind the scenes%" AND film_actor.actor_id = 15;

/* EJERCICIO 6 */

SELECT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name FROM sakila.film_actor
JOIN sakila.film ON film.film_id = film_actor.film_id
JOIN sakila.actor ON actor.actor_id = film_actor.actor_id
WHERE film.film_id = 369;

/* EJERCICIO 7 */

SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name FROM sakila.film
JOIN sakila.film_category ON film.film_id = film_category.film_id
JOIN sakila.category ON category.category_id = 7
WHERE film_category.category_id = 7 AND film.rental_rate = 2.99;

/* EJERCICIO 8 */

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, actor.first_name, actor.last_name FROM sakila.film
JOIN sakila.film_actor ON film_actor.film_id = film.film_id
JOIN sakila.actor ON  actor.actor_id = film_actor.actor_id
JOIN sakila.film_category ON film_category.film_id = film.film_id
WHERE actor.first_name = "SANDRA" AND actor.last_name = "KILMER" AND film_category.category_id = 1;
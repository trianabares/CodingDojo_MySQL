/* EJERCICIO 1*/

SELECT monthname("2012/03/01") AS mes, SUM(billing.amount) AS ganancia FROM billing
WHERE billing.charged_datetime >= "2012/03/01" AND billing.charged_datetime < '2012/04/01';

/* EJERCICIO 2*/

SELECT clients.client_id, SUM(billing.amount) AS ganancia FROM clients
JOIN billing ON clients.client_id = billing.client_id 
WHERE clients.client_id = 2;

/* EJERCICIO 3*/

SELECT sites.domain_name, clients.client_id FROM clients
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 10;

/* EJERCICIO 4-1*/

SELECT clients.client_id, COUNT(sites.site_id) AS sites_created, monthname(sites.created_datetime) AS 'month', YEAR(sites.created_datetime) AS 'year'
FROM clients
JOIN sites ON clients.client_id = sites.client_id AND clients.client_id = 1
GROUP BY monthname(sites.created_datetime) , YEAR(sites.created_datetime)
ORDER BY monthname(sites.created_datetime) ASC;

/* EJERCICIO 4-2*/

SELECT  clients.client_id, COUNT(sites.site_id) AS sites_created, monthname(sites.created_datetime) AS 'month', YEAR(sites.created_datetime) AS 'year'
FROM clients
JOIN sites ON clients.client_id = sites.client_id AND clients.client_id = 20
GROUP BY monthname(sites.created_datetime), YEAR(sites.created_datetime)
ORDER BY monthname(sites.created_datetime) ASC;

/* EJERCICIO 5 */

SELECT sites.domain_name, COUNT(leads.leads_id) AS number_of_leads FROM sites
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime >= "2011-01-01" AND leads.registered_datetime < "2011-02-16"
GROUP BY sites.site_id, sites.domain_name;

/* EJERCICIO 6*/

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS 'client_name', COUNT(leads.leads_id) AS 'number_of_leads'
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
AND leads.registered_datetime >= "2011-01-012"
AND leads.registered_datetime <= "2011-12-31"
GROUP BY clients.client_id
ORDER BY '# of leads' DESC;

/* EJERCICIO 7*/

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS 'client name',  COUNT(leads.leads_id) AS '# of leads', monthname(leads.registered_datetime) AS 'month'
FROM  clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
AND leads.registered_datetime >= '2011-01-01'
AND leads.registered_datetime < '2011-07-01'
GROUP BY clients.client_id , monthname(leads.registered_datetime)
ORDER BY '# of leads' DESC;

/* EJERCICIO 8 */

SELECT c.client_id, c.first_name, c.last_name, s.site_id, s.domain_name, COUNT(l.leads_id) AS total_leads
FROM clients AS c 
LEFT JOIN sites AS s ON c.client_id = s.client_id
LEFT JOIN leads AS l ON s.site_id = l.site_id
WHERE l.registered_datetime >= "2011-01-01" AND l.registered_datetime < "2012-01-01"
GROUP BY c.client_id, s.site_id;

/* EJERCICIO 9 */

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS 'client_name', SUM(b.amount) AS total_income, monthname(b.charged_datetime) AS month, YEAR(b.charged_datetime) AS year
FROM billing AS b
JOIN clients ON b.client_id = clients.client_id
GROUP BY year, month, b.client_id;

/* EJERCICIO 10*/

SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name) AS 'client_name', GROUP_CONCAT(' ', sites.domain_name) AS 'sites'
FROM clients
JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;
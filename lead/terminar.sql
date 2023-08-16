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

/* EJERCICIO 5*/

SELECT COUNT(leads.leads_id), sites.domain_name, leads.registered_datetime FROM sites
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime >= "2011-01-01"
AND leads.registered_datetime <= "2011-02-15";

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

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS 'client name',  COUNT(leads.leads_id) AS '# of leads', MONTH(leads.registered_datetime) AS 'month'
FROM  clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
AND leads.registered_datetime >= '2011-01-01'
AND leads.registered_datetime < '2011-07-01'
GROUP BY clients.client_id , MONTH(leads.registered_datetime)
ORDER BY '# of leads' DESC;

/* EJERCICIO 8*/

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id)
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
GROUP BY sites.domain_name;

SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name) AS 'client name', sites.domain_name, COUNT(leads.leads_id) AS '# of leads'
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
AND leads.registered_datetime >= '2011-01-01'
AND leads.registered_datetime <= '2011-12-31'
GROUP BY sites.domain_name
ORDER BY clients.client_id ASC;

/* EJERCICIO 9*/

SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name) AS 'client_name', SUM(billing.amount) AS revenue, MONTH(billing.charged_datetime) AS 'month', YEAR(billing.charged_datetime) AS 'year'
FROM clients
JOIN billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id , MONTH(billing.charged_datetime)
ORDER BY clients.client_id ASC , MONTH(billing.charged_datetime) ASC , YEAR(billing.charged_datetime) ASC;

/* EJERCICIO 10*/

SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name) AS 'client_name', GROUP_CONCAT(' ', sites.domain_name) AS 'sites'
FROM clients
JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;
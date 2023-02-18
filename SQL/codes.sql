SQL

SELECT
  name AS trackName,
  ROUND(milliseconds / 60000.0, 2) AS minutes,
  ROUND(bytes/ (1024*1024.0), 4)   AS mb
FROM tracks;


-- subquery >> It will run inner first
	-- outer query
SELECT 
				AVG(mb) AS avg_mb,
        SUM(mb) AS sum_mb,
        COUNT(mb) AS n_mb,
        COUNT(*)  AS n_row,
        MIN(mb) AS min_mb,
        MAX(mb) AS max_mb
FROM (
	-- inner query
	SELECT 
        bytes/ (1024*1024.0) AS mb
	FROM tracks
) AS sub;


-- subquery >> write version 1
WITH sub AS (
	SELECT * FROM customers
	WHERE UPPER(country) = 'USA'
)

SELECT 
	firstname, 
    state, 
    country, 
    email
FROM sub
WHERE state IN ('NY', 'CA');

-- version 2 >> the last line id differrent but the result/performance is the same
SELECT 
	firstname, 
    state, 
    country, 
    email
FROM (
	SELECT * FROM customers
	WHERE UPPER(country) = 'USA'
) AS sub
WHERE state = 'NY' OR state = 'CA';


-- STRFTIME >> change formate date
-- SQL doesn't concept about time/date so it contain the date as TEXT(string)
--- invoice_y2010 is query 1
WITH invoice_y2010 AS (
		SELECT -- factInvoices
      invoicedate,
      STRFTIME('%Y%m', invoicedate) AS monthID,
      customerid, -- key
      total
    FROM invoices
    WHERE  STRFTIME('%Y', invoicedate) = '2010'
--- usa_customer is query 2
), usa_customers AS ( -- dimCustomers
		SELECT 
			customerid, -- key
			firstname, 
			lastname 
		FROM customers 
		WHERE country = 'USA'
)
-- write version 1
SELECT 
		u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY u.customerid, u.firstname, u.lastname
ORDER BY SUM(i.total) DESC -- descending high to low

-- write version 2 same result
SELECT 
		u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY 1,2,3
ORDER BY 4 DESC -- descending high to low


-- receive business require from boss then transfer it to query
-- Question : Can you show the revenue in sep 2022?

SELECT 
	segment, 
	SUM(revenue) AS total_revenue
FROM revenue_table
WHERE monthid = '202009'
GROUP BY segment
ORDER BY SUM(revenue) DESC -- descending high to low
LIMIT 3; -- limit only 3 


-- Clean Null value with CASE WHEN 
-- definition 
---WHEN company is null
---THEN 'End customer' >> the customers buy item by themself
---ELSE 'Corporate' 
--- END AS 'Segment'
SELECT 
		firstname, 
    company,
    COALESCE(company, 'End Customer') AS clean_company,
    CASE
	    	WHEN company IS NULL THEN 'Customer'
        ELSE 'Corporate'
    END AS segment
FROM customers;


-- Join 4 tables and use COUNT n_track
SELECT 
	genre_name,
	COUNT(*) AS n_tracks
FROM (
	SELECT
		ar.name AS artist_name,
		al.title,
		tr.name AS track_name,
		tr.milliseconds,
		tr.bytes,
		ge.name AS genre_name
	FROM artists ar -- join table 
	JOIN albums  al ON ar.artistid = al.artistid
	JOIN tracks  tr ON tr.albumid  = al.albumid
	JOIN genres  ge ON ge.genreid  = tr.genreid
	WHERE ge.name <> 'Jazz' -- Boss said no need JAZZ song. We should put it inside inner subquery cuz WHERE will run before GROUP BY & HAVING
	-- Make the data smaller then it will run faster.
) AS sub
GROUP BY genre_name
-- genre songs more than 100
-- HAVING will happen after GROUP BY uses for filter group// write same as WHERE
HAVING COUNT(*) > 100  
ORDER BY COUNT(*) DESC


-- View table for user that can use/edit data without affecting the actual database or drop(delete) data by accident.
-- If we still have this query then we can drop it and run it afgain to get data back.
--  or Artist release the new sonds or albums VIEW >> Full table will update automatically based on underline data(JOIN...).
CREATE VIEW full_table AS
	SELECT
		ar.name AS artist_name,
		al.title,
		tr.name AS track_name,
		tr.milliseconds,
		tr.bytes,
	        ge.name AS genre_name
	FROM artists ar 
		JOIN albums  al ON ar.artistid = al.artistid
		JOIN tracks  tr ON tr.albumid  = al.albumid
		JOIN genres  ge ON ge.genreid  = tr.genreid;
-- If we create the table with CREATE it will never update(Permernent)
CREATE VIEW us_uk_customers AS 
  SELECT * FROM customers 
  WHERE country = 'USA'
  UNION -- remove duplicates
  SELECT * FROM customers 
  WHERE country = 'United Kingdom';
  
SELECT COUNT(*) FROM us_uk_customers;

-- CTE is a tense table, VIEW is a virtual table, CREATE table is a physical table

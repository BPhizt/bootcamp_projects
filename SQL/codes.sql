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

SELECT 
		u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY u.customerid, u.firstname, u.lastname
ORDER BY SUM(i.total) DESC -- descending high to low

SELECT 
		u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY 1,2,3
ORDER BY 4 DESC -- descending high to low


-- Restaurant owner by Blue >> creat 5 tables
-- (you can sum)Fact is store observations or events, and can be sales order, stock balances, exchange rates, temperatures.
-- Dimension is describe business entities.

-- Example
/* CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date TEXT,
  amount REAL
);

INSERT INTO orders VALUES
  (1, '2023-02-18', 120.35),
  (2, '2023-02-18', 330.95),
  (3, '2023-02-18', 456.78);
  
-- Right now mod is list we will change it to make it easier to view
-- manipulate column and header

/* .mode markdown */ -- build kinda line for the table
.mode column  -- split column
.header on -- add header above column
/* .mode list */ -- turn to be default

SELECT * FROM orders; */

-- Restaurant owner by Blue >> creat 5 tables
-- 1 x fact, 4 x dimension
-- how to add foreign key
-- write SQL 3 queries analyze data
-- 1 x sub query and WITH clause

-- Table 1 dimCoffees
CREATE TABLE dimCoffees (
    coffee_id INT PRIMARY KEY,
    coffee TEXT,
    price REAL
);

INSERT INTO dimCoffees VALUES
    (1, 'Blue Latte signature', 14.50),
    (2, 'Wow cocoa', 17.50),
    (3, 'Opps americano', 12.45),
    (4, 'Kapo capu', 16.50),
    (5, 'Matcha macha', 15.50);
    
--- Table 2 Sweet
CREATE TABLE sweets (
    sweet_id INT PRIMARY KEY,
    sweet_name TEXT
);

INSERT INTO sweets VALUES
    (1, 'brown sugar'),
    (2, 'maple syrup'),
    (3, 'caramel'),
    (4, 'honey'),
    (5, 'chocolate');


-- Table 3 combine_sweet_coffees
-- which combination is the best seller?
CREATE TABLE combine_sweet_coffees(
    coffee_id INT,
    sweet_id INT
);

INSERT INTO combine_sweet_coffees VALUES
    (1, 1), (1, 4), (1, 4), (5,5), 
    (2, 1), (2, 2), (3, 4), (5,2),
    (3, 3), (3, 3), (1, 4), (5,1),
    (4, 1), (4, 3), (4, 5), (5,5),
    (3, 3), (1, 4), (5, 5), (5,3); 
    
-- Table 4 dimCustomers
CREATE TABLE dimCustomers (
    customer_id INT PRIMARY KEY,
    first_name TAXT,
    last_name TEXT,
    phone TAXT
);

INSERT INTO dimCustomers VALUES
    (1, 'Parley', 'Iamdog', '770-123-1234'),
    (2, 'Forrest', 'Tuttle', '404-404-4444'),
    (3, 'Nira', 'Blue', '770-777-8888'),
    (4, 'Marry', 'Lalaland', '888-99-1010'),
    (5, 'Jackson', 'Wang', '800-900-2023'),
    (6, 'Lisa', 'Blackpink', '100-200-2023')
   ;

/* SELECT  * FROM dimCustomers; */


--Table 5 Location
CREATE TABLE dimLocations (
    location_id INT PRIMARY KEY,
    location TEXT
);

INSERT INTO dimLocations VALUES 
    (1, 'Atlanta'),
    (2, 'Queens'),
    (3, 'LA'),
    (4, 'Seattle'),
    (5, 'Khonkaen');

--Table 5 dimpayments
CREATE TABLE paymants (
  payment_id INT PRIMARY KEY,
  payment_method TEXT,
  rate_charge REAL
);
INSERT INTO payments VALUES
  (1, 'CASH', 0),
  (2,'CREDIT CARD', 0.3),
  (3, 'Scan_Apple watch', 0.1),
  (4, 'PROMOTION_CODE', (-0.2))

-- Table 7 factOrders
CREATE TABLE factOrders (
    order_id INT PRIMARY KEY,
    coffee_id INT,
    sweet_id INT,
    customer_id INT,
    payment_id INT,
    order_date TEXT,
  
    FOREIGN KEY (coffee_id) REFERENCES dimCoffees (coffee_id),
    FOREIGN KEY (sweet_id)  REFERENCES dimCustomers (sweet_id),
    FOREIGN KEY (location_id) REFERENCES dimLocations (location_id),
    FOREIGN KEY (payment_id) REFERENCES dimCoffees (payment_id)
);
INSERT INTO factOrders VALUES
(1, 2, 3, 6, '2023-02-14',2),
(2, 2, 3, 6, '2023-02-04',4),
(3, 2, 3, 6, '2023-02-12',4),
(4, 2, 3, 6, '2023-02-10',2),
(5, 2, 3, 6, '2023-01-08',1),
(6, 2, 3, 6, '2023-01-02',3),
(7, 2, 3, 6, '2023-01-31',1),
(8, 2, 3, 6, '2023-01-01',3);

.mode markdown
.header on

-- Query 1 summary
SELECT 
    Ord.order_id,
    Ord.order_date,
    Cof.coffees_id,
    Cof.price || ' $' AS price,
    Cus.first_name || ' ' || Cus.last_name AS customer,
    Loc.location
   
FROM factOrders AS Ord
JOIN dimCoffees AS Cof ON Ord.coffee_id = Cof.coffee_id
JOIN dimCustomers  AS Cus ON Ord.customer_id  = Cus.customer_id 
JOIN dimLocations  AS Loc ON Ord.location_id  = Loc.location_id
;


-- Query 2 best seller 3 coffee
SELECT 
  Cof.coffee,
  COUNT(*) AS n_coffee
  
 FROM factOrders AS Ord
  JOIN dimCoffees AS Cof ON Ord.coffee_id = Cof.coffee_id
  JOIN dimCustomers  AS Cus ON Ord.customer_id  = Cus.customer_id 
  JOIN dimLocations  AS Loc ON Ord.location_id  = Loc.location_id
  
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 3 ;
 
 -- continuous -- 


























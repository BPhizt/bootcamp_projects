
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
/*CREATE TABLE combine_sweet_coffees(
    coffee_id INT,
    sweet_id INT
);

INSERT INTO combine_sweet_coffees VALUES
    (1, 1), (1, 4), (1, 5), 
    (2, 1), (2, 2), (2, 4), 
    (3, 1), (3, 3), (3, 4), 
    (4, 1), (4, 3), (4, 5), 
    (5, 2), (5, 3), (5, 5); */
    
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





SELECT  * FROM dimCustomers;
















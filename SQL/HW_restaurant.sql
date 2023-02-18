
-- Restaurant owner by Blue >> creat 5 tables
-- 1 x fact, 4 x dimension
-- how to add foreign key
-- write SQL 3 queries analyze data
-- 1 x sub query and WITH clause
CREATE TABLE orders (
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

SELECT * FROM orders;

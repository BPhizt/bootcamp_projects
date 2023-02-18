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

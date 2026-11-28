/*
Question 1.3 | Topic 1: Filtering and sorting | Level 1-2
Database: RetailDB

Scenario:
The marketing team is choosing cities for a local event. They want a
list of the cities where their Corporate or Wholesale customers live,
counting only customers who signed up before 2023-01-01 and whose
city is on record. Each city should appear once, however many
customers live there.

Task:
Return each distinct city where at least one such customer lives.

Expected output:
City - city name
Sort by: City (A to Z)

Self-check (run before pasting):
- Your result must contain no repeated city names and no NULL.
- Run your filters again without DISTINCT, and count the rows. That
  number is at least as large as the number of cities in your result.
  Explain in one sentence why it can be larger.
*/

-- Grain: one row per city

-- Your query here
SELECT DISTINCT City FROM dbo.Customers
WHERE (Segment = 'Wholesale' OR Segment = 'Corporate') AND 
(SignupDate < '2023-01-01') AND (City IS NOT NULL)
ORDER BY City

/* 
Output:
Bengaluru
Berlin
Delhi
London
Mumbai
New York
Pune
Toronto
*/

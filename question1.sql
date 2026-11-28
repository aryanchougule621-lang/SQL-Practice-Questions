/*
Question 1.1 | Topic 1: Filtering and sorting | Level 1
Database: RetailDB

Scenario:
The merchandising team is building a "gift under a budget" page. They
want products from the Books and Toys categories that are still on
sale and cost between 100 and 300 (both ends included).

Task:
Return all active products (IsActive = 1) in the categories Books or
Toys whose UnitPrice is between 100 and 300 (inclusive).

Expected output:
ProductID   - product ID
ProductName - product name
Category    - product category
UnitPrice   - unit price
Sort by: UnitPrice (highest first), then ProductID

Self-check (run before pasting):
- Run MIN(UnitPrice), MAX(UnitPrice) and COUNT(DISTINCT Category) on
  your own result. The first two must be inside 100 to 300, and the
  third must be 2 or less.
*/

-- Grain: one row per product id

-- Your query here

SELECT 
ProductID,
ProductName,
Category,
UnitPrice 
FROM dbo.Products
WHERE (Category = 'Books' OR Category = 'Toys') AND IsActive = 1 AND 
(UnitPrice between 100  and 300)
ORDER BY UnitPrice DESC, ProductID

  
  /* Output:
95	Puzzle Basic 95	Toys	290.99
62	Novel Pro 62	Books	281.99
7	Puzzle Pro 7	Toys	266.99
78	Novel Max 78	Books	199.99
23	Puzzle Max 23	Toys	184.99
94	Novel Lite 94	Books	117.99
39	Puzzle Lite 39	Toys	102.99
*/

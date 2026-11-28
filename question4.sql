/*
Question 1.4 | Topic 1: Filtering and sorting | Level 2
Database: RetailDB

Scenario:
Procurement is planning a clearance sale. They want the cheapest
products that are not books or toys, whose name contains 'Lite' or
'Basic', and that have not been discontinued. Products with no
category on record are not books or toys, so they must be included.

Task:
Return the 8 cheapest products that meet all of these:
- category is not 'Books' and not 'Toys' (a missing category counts as
  "not Books or Toys", so those products are included)
- product name contains the word 'Lite' or the word 'Basic'
- not discontinued (DiscontinuedDate is NULL)

Expected output:
ProductID   - product ID
ProductName - product name
Category    - product category (may be NULL)
UnitPrice   - unit price
Sort by: UnitPrice (lowest first), then ProductID

Self-check (run before pasting):
- Your result must have exactly 8 rows.
- Remove TOP and run it again. Does the longer list contain any row
  with a NULL Category? Run
  SELECT COUNT(*) FROM dbo.Products WHERE Category IS NULL
  and explain in one sentence why those rows are in or out of your list.
*/

-- Grain: one row per productid

-- Your query here
SELECT TOP 8 
ProductID,
ProductName,
Category,
UnitPrice
FROM dbo.Products
WHERE (Category NOT IN ('Books','Toys') OR Category IS NULL) AND 
(ProductName LIKE '%Basic%' OR ProductName LIKE '%Lite%') AND
DiscontinuedDate is NULL
ORDER BY UnitPrice, ProductID

/* Output:
44	Racket Lite 44	Sports	17.99
50	Notebook Basic 50	Office Supplies	105.99
34	Notebook Lite 34	Office Supplies	187.99
89	Chair Lite 89	Furniture	202.99
100	Racket Basic 100	Sports	205.99
29	Mixer Lite 29	NULL	272.99
40	Gadget Basic 40	Electronics	275.99
84	Racket Lite 84	Sports	287.99
*/

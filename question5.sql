/*
Question M1.1 (revised) | Mixed Set 1 (Topic 1) | Level 2-3
Database: RetailDB

Scenario:
Operations wants to chase late shipments. They want Online and Phone
orders from 2025 that have not been shipped yet and were not
cancelled.

Task:
Return the 10 oldest orders that meet all of these:
- placed in 2025 (from 2025-01-01 up to the end of 2025)
- Channel is 'Online' or 'Phone'
- no ShipDate on record
- Status is not 'Cancelled'

Expected output:
OrderID    - order ID
CustomerID - customer ID
OrderDate  - order date
Status     - order status
Channel    - sales channel
Sort by: OrderDate (oldest first), then OrderID

Self-check (run before pasting):
- Every row must have a NULL ShipDate, a Channel of Online or Phone,
  a Status other than Cancelled, and an OrderDate inside 2025.
- Remove TOP, count the rows of the longer list (call it N), and check
  that your result has the smaller of 10 and N rows.
*/

-- Grain: one row per OrderID

-- Your query here
SELECT TOP 10
OrderID,
CustomerID,
OrderDate,
[Status],
Channel
FROM dbo.Orders
WHERE (OrderDate BETWEEN '2025-01-01' AND '2025-12-31') AND 
(Channel = 'Online' OR channel = 'Phone') AND
ShipDate IS NULL AND
[Status] <> 'Cancelled'
ORDER BY OrderDate, OrderID
/*
Output:
156	109	2025-01-07	Pending	Online
36	109	2025-04-22	Pending	Online
86	39	2025-04-27	Pending	Online
136	89	2025-06-16	Pending	Online
186	19	2025-08-05	Pending	Online
16	89	2025-08-15	Pending	Online
66	19	2025-10-04	Pending	Online
116	69	2025-11-23	Pending	Online
*/

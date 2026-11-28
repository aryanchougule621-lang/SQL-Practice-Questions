/*
Question 1.2 | Topic 1: Filtering and sorting | Level 1-2
Database: RetailDB

Scenario:
HR is preparing a welcome-back mailing for recently hired staff whose
last names start with the letter S. The mailing can only go to
employees who are still working at the company and have an email
address on file.

Task:
Return the 5 most recently hired employees who meet all of these:
- last name starts with 'S'
- hired on or after 2022-01-01
- still working at the company (no termination date)
- have an email address on file

Expected output:
EmployeeID - employee ID
FirstName  - first name
LastName   - last name
Email      - email address
HireDate   - hire date
Sort by: HireDate (newest first), then EmployeeID

Self-check (run before pasting):
- Your result must have exactly 5 rows.
- Remove the TOP once and run the query again. Check that your 5 rows
  are the first 5 rows of that longer list.
*/

-- Grain: one row per EmployeeId

-- Your query here
SELECT top 5
EmployeeID,
FirstName,
LastName,
Email,
HireDate
FROM dbo.Employees
where (LastName LIKE 'S%' AND HireDate >= '2022-01-01') AND 
(TerminationDate IS NULL AND Email IS not null)
ORDER BY HireDate DESC, EmployeeID
/*
Output:
54	Siddharth	Singh	siddharth.singh54@retailco.com	2026-05-23
33	Meera	Shah	meera.shah33@retailco.com	2024-11-06
60	Aarav	Sharma	aarav.sharma60@retailco.com	2024-10-18
34	Siddharth	Singh	siddharth.singh34@retailco.com	2024-08-01
40	Aarav	Sharma	aarav.sharma40@retailco.com	2022-12-28
*/

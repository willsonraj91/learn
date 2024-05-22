
--ORDER BY 

SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;


SELECT FirstName, LastName, Age
FROM Employees
ORDER BY Age DESC, LastName ASC;

--GROUP BY

SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;


SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;


--HAVING

SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING condition;


SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 10;


--UNION

SELECT column1, column2, ...
FROM table1
UNION
SELECT column1, column2, ...
FROM table2;


SELECT FirstName, LastName, Age
FROM Employees
WHERE Age > 30
UNION
SELECT FirstName, LastName, Age
FROM RetiredEmployees
WHERE Age > 60;


--COMBINING CLAUSES

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
WHERE Age > 25
GROUP BY Department
HAVING COUNT(*) > 5
ORDER BY EmployeeCount DESC;

	

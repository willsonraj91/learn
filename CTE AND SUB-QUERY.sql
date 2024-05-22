--CTE

CREATE TABLE Sales (
    SalesPerson VARCHAR(50),
    Region VARCHAR(50),
    TotalSales DECIMAL(10, 2)
);

INSERT INTO Sales (SalesPerson, Region, TotalSales) VALUES
('John Doe', 'North', 10000.50),
('Jane Smith', 'South', 15000.75),
('John Doe', 'South', 7500.30),
('Jane Smith', 'North', 20000.90);


WITH SalesSummary AS (
    SELECT
        SalesPerson,
        SUM(TotalSales) AS TotalSales
    FROM Sales
    GROUP BY SalesPerson
)
SELECT
    SalesPerson,
    TotalSales
FROM SalesSummary;


--Subqueries

SELECT AVG(TotalSales) FROM Sales;

SELECT
    SalesPerson,
    SUM(TotalSales) AS TotalSales
FROM Sales
GROUP BY SalesPerson
HAVING SUM(TotalSales) > (SELECT AVG(TotalSales) FROM Sales);


--COMBINE CTE and SUBQUERIES

WITH RegionSales AS (
    SELECT
        Region,
        SUM(TotalSales) AS TotalRegionSales
    FROM Sales
    GROUP BY Region
)
SELECT
    SalesPerson,
    TotalSales
FROM Sales
WHERE Region IN (
    SELECT Region
    FROM RegionSales
    WHERE TotalRegionSales > (SELECT AVG(TotalSales) FROM Sales)
);

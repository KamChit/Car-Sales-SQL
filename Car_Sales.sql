

create database car_sales
use car_sales

CREATE TABLE car_sales (
    Manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Engine_size DECIMAL(3,1),
    Fuel_type VARCHAR(20),
    Year_of_manufacture INT,
    Mileage INT,
    Price DECIMAL(10,2)

/* View Data */
SELECT Manufacturer, Model, Year_of_manufacture, Price 
FROM car_sales_data;

/*Ford */
SELECT  Model, Year_of_manufacture, Price
From car_sales_data
Where Manufacturer = 'Ford'
Order by Year_of_manufacture ASC;

--AVERAGE SALES of Car Model 

SELECT Manufacturer, Model, AVG(Price) AS AvgPrice
FROM car_sales_data
GROUP BY Manufacturer, Model
ORDER BY Manufacturer, AvgPrice DESC;


-- See all distinct manufacturers
SELECT DISTINCT Manufacturer
FROM car_sales_data;

-- Count total cars by manufacturer
SELECT Manufacturer, COUNT(*) AS Cars_Available
FROM car_sales_data
GROUP BY Manufacturer
ORDER BY Cars_Available DESC;

-- Top 5 most expensive cars
SELECT TOP 5 Manufacturer, Model, Price
FROM car_sales_data
ORDER BY Price DESC

-- Which fuel type has the highest average price?
SELECT Fuel_type, AVG(Price) AS AvgPrice
FROM car_sales_data
GROUP BY Fuel_type
ORDER BY AvgPrice DESC;

-- Mileage impact on price
SELECT Manufacturer, AVG(Mileage) AS AvgMileage, AVG(Price) AS AvgPrice
FROM car_sales_data
GROUP BY Manufacturer
ORDER BY AvgPrice DESC;

--Total Sales per Model
SELECT Manufacturer, Model, SUM(Price) AS TotalRevenue
FROM car_sales_data
GROUP BY Manufacturer, Model
ORDER BY TotalRevenue DESC

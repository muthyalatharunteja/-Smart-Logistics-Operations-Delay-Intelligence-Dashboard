CREATE DATABASE logistics_project;
USE logistics_project;
CREATE TABLE logistics (
    Timestamp DATETIME,
    Date DATE,
    Time TIME,
    Asset_ID VARCHAR(20),
    Month_Number INT,
    Month_Name VARCHAR(10),
    Hours INT,
    Latitude FLOAT,
    Longitude FLOAT,
    Inventory_Level INT,
    Shipment_Status VARCHAR(20),
    Temperature FLOAT,
    Humidity FLOAT,
    Traffic_Status VARCHAR(20),
    Waiting_Time INT,
    User_Transaction_Amount INT,
    User_Purchase_Frequency INT,
    Logistics_Delay_Reason VARCHAR(50),
    Asset_Utilization FLOAT,
    Demand_Forecast INT,
    Logistics_Delay INT
);

SELECT COUNT(*) FROM logistics;

-- Logistics delay %
SELECT 
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays,
    ROUND(SUM(Logistics_Delay)*100.0/COUNT(*),2) AS delay_percentage
FROM logistics;

-- Traffic Impact Logistics delay % 
SELECT 
    Traffic_Status,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays,
    ROUND(SUM(Logistics_Delay)*100.0/COUNT(*),2) AS delay_percentage
FROM logistics
GROUP BY Traffic_Status
ORDER BY delay_percentage DESC;


-- Logistics delaY REASON
SELECT 
    Logistics_Delay_Reason,
    COUNT(*) AS count
FROM logistics
WHERE Logistics_Delay = 1
GROUP BY Logistics_Delay_Reason
ORDER BY count DESC;

-- TIME ANALYSIS LOGISTIC DELAY % BY HOURS
SELECT 
    Hours,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays,
    ROUND(SUM(Logistics_Delay)*100.0/COUNT(*),2) AS delay_percentage
FROM logistics
GROUP BY Hours
ORDER BY delay_percentage DESC;


-- WORST PERFORMANCE OF TRUCKS CAUSES DELAY
SELECT 
    Asset_ID,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays,
    ROUND(SUM(Logistics_Delay)*100.0/COUNT(*),2) AS delay_percentage
FROM logistics
GROUP BY Asset_ID
ORDER BY delay_percentage DESC;

-- INVENTORY VS DELAY 
SELECT 
    CASE 
        WHEN Inventory_Level < 200 THEN 'Low'
        WHEN Inventory_Level BETWEEN 200 AND 400 THEN 'Medium'
        ELSE 'High'
    END AS inventory_category,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays,
    ROUND(SUM(Logistics_Delay)*100.0/COUNT(*),2) AS delay_percentage
FROM logistics
GROUP BY inventory_category;

-- WEATHER IMPACT TEMP+HUMIDITY
SELECT 
    ROUND(Temperature) AS temp_range,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays
FROM logistics
GROUP BY temp_range
ORDER BY temp_range;


-- CUSTOMER BEHAVIOR IMPACT
SELECT 
    User_Purchase_Frequency,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays
FROM logistics
GROUP BY User_Purchase_Frequency
ORDER BY User_Purchase_Frequency;

-- UTILIZATION VS DELAY 
SELECT 
    ROUND(Asset_Utilization,0) AS utilization,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays
FROM logistics
GROUP BY utilization
ORDER BY utilization;


-- DEMAND VS DELAYS
SELECT 
    Demand_Forecast,
    COUNT(*) AS total,
    SUM(Logistics_Delay) AS delays
FROM logistics
GROUP BY Demand_Forecast
ORDER BY Demand_Forecast;

SELECT *FROM logistics;
-- I have chosen the marketing dataset as I believe this would be of great interest to me. 
-- I have worked in marketing for 15years
-- This would enable me to expand marketing skills further and apply data analytical skills.

-- 1.
-- First I need to understand the information and columns that the data is showing.

SELECT * FROM sql_hr.marketing_campaign;

-- 2. 
-- Total Average of website visits 
SELECT AVG(NumWebVisitsMonth) 
AS 'Average web visits' 
from sql_hr.marketing_campaign;

-- 3. 
-- I want to find the marital status of the customer base
-- I have identified the marital statuses that are available 
SELECT * FROM sql_hr.marketing_campaign
GROUP BY Marital_Status;

-- Which customers are single 
SELECT * FROM sql_hr.marketing_campaign
WHERE Marital_Status LIKE '%Single%';

-- Which customers are married 
SELECT * FROM sql_hr.marketing_campaign
WHERE Marital_Status LIKE '%Married%';

-- Which customers are together
SELECT * FROM sql_hr.marketing_campaign
WHERE Marital_Status LIKE '%Together%';

-- Which customers are Divorced
SELECT * FROM sql_hr.marketing_campaign
WHERE Marital_Status LIKE '%Divorced%';

-- Sum of each campaign to identify which campaign was the most succesful 
SELECT SUM(AcceptedCmp1)  
from sql_hr.marketing_campaign;

SELECT SUM(AcceptedCmp2)  
from sql_hr.marketing_campaign;

SELECT SUM(AcceptedCmp3)  
from sql_hr.marketing_campaign;

SELECT SUM(AcceptedCmp4)  
from sql_hr.marketing_campaign;

SELECT SUM(AcceptedCmp5)  
from sql_hr.marketing_campaign;

-- Calculating the age of customers and arranging them in descending order
-- This would then allow me to identify the lowest aged customer and the highest
SELECT ID, 
year (curdate())-Year_Birth
from sql_hr.marketing_campaign
ORDER BY Year_Birth DESC;

-- Group by age range using new field created 

SELECT  SUM(CASE WHEN year (curdate())-Year_Birth BETWEEN 26 AND 50 THEN 1 ELSE 0 END) AS '26-50',
		SUM(CASE WHEN year (curdate())-Year_Birth BETWEEN 51 AND 75 THEN 1 ELSE 0 END) AS '51-75',
		SUM(CASE WHEN year (curdate())-Year_Birth BETWEEN 76 AND 129 THEN 1 ELSE 0 END) AS '76-12'
FROM sql_hr.marketing_campaign

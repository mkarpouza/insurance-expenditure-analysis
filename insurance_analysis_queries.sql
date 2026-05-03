-- Insurance Expenditure Analysis (Greece, 2008-2020)
-- Author: Maria Karpouza
-- Tools: SQL
-- Dataset: Household expenditure insurance by year, segment and insurance type


-- 1. Total number of records
SELECT COUNT(*)
FROM insurance_expenditure_greece_2008_2020;

-- 2. Available years
SELECT DISTINCT year 
FROM insurance_expenditure_greece_2008_2020;

-- Available insurance types
SELECT DISTINCT insurance_type 
FROM insurance_expenditure_greece_2008_2020;

-- Available segmentation categories
SELECT DISTINCT category_type 
FROM insurance_expenditure_greece_2008_2020;

-- 3. Average insurance expenditure per year
SELECT 
    year, 
    AVG(insurance_expenditure) AS avg_expenditure
FROM insurance_expenditure_greece_2008_2020 
GROUP BY year;

-- 4. Average insurance expenditure by insurance type and year
SELECT 
    year, 
    insurance_type, 
    AVG(insurance_expenditure) AS avg_expenditure 
FROM insurance_expenditure_greece_2008_2020 
GROUP BY year, insurance_type 
ORDER BY year, avg_expenditure DESC;

-- 5. Urban vs Rural comparison
SELECT 
    year, 
    segment, 
    insurance_type, 
    AVG(insurance_expenditure) AS avg_expenditure 
FROM insurance_expenditure_greece_2008_2020 
WHERE category_type = 'area' 
GROUP BY year, segment, insurance_type 
ORDER BY year, insurance_type, avg_expenditure DESC;

-- 6. Spending class segmentation
SELECT 
    year, 
    segment, 
    insurance_type, 
    AVG(insurance_expenditure) AS avg_expenditure 
FROM insurance_expenditure_greece_2008_2020 
WHERE category_type = 'spending_class' 
GROUP BY year, segment, insurance_type 
ORDER BY year, insurance_type, avg_expenditure DESC;

-- 7. Occupation analysis 
SELECT 
    year, 
    segment, 
    insurance_type, 
    AVG(insurance_expenditure) AS avg_expenditure 
FROM insurance_expenditure_greece_2008_2020 
WHERE category_type = 'occupation' 
GROUP BY year, segment, insurance_type 
ORDER BY year, insurance_type, avg_expenditure DESC;

-- 8. Regional analysis (2014 vs 2020)
SELECT 
    segment AS region, 
    year, 
    AVG(insurance_expenditure) AS avg_expenditure 
FROM insurance_expenditure_greece_2008_2020 
WHERE category_type = 'region' 
GROUP BY segment, year 
ORDER BY segment, year;






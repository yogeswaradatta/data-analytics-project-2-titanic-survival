# How does age group (Child, Adult, Senior) impact the likelihood of survival?
use train;
SELECT 
    CASE 
        WHEN Age < 12 THEN 'Child'
        WHEN Age BETWEEN 12 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup,
    COUNT(*) AS total,
    ROUND(AVG(Survived)*100,2) AS survival_rate
FROM train
GROUP BY AgeGroup;

#----------------------------------------
# How do age group and passenger class together influence survival rates?
WITH age_data AS (
    SELECT *,
        CASE 
            WHEN Age < 12 THEN 'Child'
            WHEN Age BETWEEN 12 AND 60 THEN 'Adult'
            ELSE 'Senior'
        END AS AgeGroup
    FROM train
)
SELECT AgeGroup, Pclass,
       ROUND(AVG(Survived)*100,2) AS survival_rate
FROM age_data
GROUP BY AgeGroup, Pclass;

#-----------------------------------------------
# How does fare category (Low, Medium, High) impact the likelihood of survival?
SELECT 
    CASE 
        WHEN Fare < 10 THEN 'Low'
        WHEN Fare BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'High'
    END AS FareGroup,
    COUNT(*) AS total,
    ROUND(AVG(Survived)*100,2) AS survival_rate
FROM train
GROUP BY FareGroup;

#----------------------------------------------------
# How do fare category and gender combined affect passenger survival chances?
WITH fare_data AS (
    SELECT *,
        CASE 
            WHEN Fare < 10 THEN 'Low'
            WHEN Fare BETWEEN 10 AND 50 THEN 'Medium'
            ELSE 'High'
        END AS FareGroup
    FROM train
)
SELECT Sex, FareGroup,
       ROUND(AVG(Survived)*100,2) AS survival_rate
FROM fare_data
GROUP BY Sex, FareGroup;

#-----------------------------------------------------
# How do gender, passenger class, age group, fare category, and family type collectively influence survival rates?
WITH base_data AS (
    SELECT *,
        CASE 
            WHEN Age < 12 THEN 'Child'
            WHEN Age BETWEEN 12 AND 60 THEN 'Adult'
            ELSE 'Senior'
        END AS AgeGroup,
        CASE 
            WHEN Fare < 10 THEN 'Low'
            WHEN Fare BETWEEN 10 AND 50 THEN 'Medium'
            ELSE 'High'
        END AS FareGroup
    FROM train
)
SELECT Sex, Pclass, AgeGroup, FareGroup, FamilyType,
       ROUND(AVG(Survived)*100,2) AS survival_rate
FROM base_data
GROUP BY Sex, Pclass, AgeGroup, FareGroup, FamilyType
ORDER BY survival_rate DESC;

#-----------------------------------------------------
# How does the risk of death vary across different gender and passenger class segments?
WITH base_data AS (
    SELECT *,
        CASE 
            WHEN Age < 12 THEN 'Child'
            WHEN Age BETWEEN 12 AND 60 THEN 'Adult'
            ELSE 'Senior'
        END AS AgeGroup,
        CASE 
            WHEN Fare < 10 THEN 'Low'
            WHEN Fare BETWEEN 10 AND 50 THEN 'Medium'
            ELSE 'High'
        END AS FareGroup
    FROM train
)
SELECT Sex, Pclass,
       ROUND((1 - AVG(Survived))*100,2) AS death_rate
FROM base_data
GROUP BY Sex, Pclass
ORDER BY death_rate DESC;
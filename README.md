This project analyzes passenger data to understand how demographic, socioeconomic, and travel-related factors influenced survival outcomes. The analysis is fully data-driven, with no predictive modeling, focusing on uncovering patterns using SQL and Power BI.

**Business Problem**

Not all passengers had equal chances of survival. Factors such as gender, passenger class, age, fare, and family structure influenced outcomes, but the key drivers and high-risk groups were unclear.

**Key Questions**

How does risk of death vary by gender and class?

How do multiple factors (age, fare, family, class, gender) influence survival?

What is the impact of fare category and age group on survival?

Which passenger segments are most vulnerable?

**Data Cleaning & Transformation**

Handled missing values:

Age → Median (grouped by Sex & Class)

Embarked → Mode

Cabin → “No Data”

**Standardized categories:**

Pclass → First/Second/Third Class

Embarked → Full location names

**Feature Engineering:**

Created FamilyType (Alone, Small, Large)

Removed irrelevant column: PassengerId

Loaded cleaned data into MySQL database

**Data Pipeline**

CSV → Python (Pandas) → Data Cleaning → MySQL → Power BI

**Analysis Approach**

Used SQL for segmentation and aggregation

**Created:**

Age Groups (Child, Adult, Senior)

Fare Categories (Low, Medium, High)

**Key Insights**
**Survival Patterns**

Overall Survival Rate: 38.38%

Females: 74.2% vs Males: 18.89%

Gender is the strongest factor influencing survival.

**Passenger Class Impact**

First Class → Highest survival (~63%)

Third Class → Lowest survival (~24%)

Socioeconomic status significantly affects survival.

**Age Impact**

Children → Highest survival (~54%)

Seniors → Lowest survival (~23%)

Younger passengers had better outcomes.

**Family Impact**

Small Families → Highest survival (~57%)

Large Families → Lowest (~16%)

Group size affects mobility and survival chances.

**High-Risk Segments**

Male passengers

Third-class travelers

Large families

Elderly individuals

Dashboard Features (Power BI)

KPI Cards (Survival Rate, Passenger Count, Avg Age, Avg Fare)

Bar Charts (Class, Gender, Fare Impact)

Heatmaps (Age vs Class)

Interactive slicers (Gender, Embarked, Family Type)

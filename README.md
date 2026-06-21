# Goodcabs Analysis

> **Domain:** Transportation & Mobility | **Function:** Operations | **Role:** Data Analyst

## Table of Contents
- [Project Overview](#project-overview)  
- [Business Context](#business-context)
- [Objective](#objective)
- [Business Questions Addressed](#business-questions-addressed)
- [Data Model](#data-model)
- [Key Metrics Calculated](#key-metrics-calculated)
- [Tools Used](#tools-used)
- [Dashboard Pages](#dashboard-pages)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Deliverables](#deliverables)
- [Project Outcome](#project-outcome)


## Project Overview
This project was developed as part of the Codebasics Resume Project Challenge. I played the role of Peter Pandey, a data analyst at **Goodcabs** - a fictional cab service company operating in 10 Tier-2 cities across India.

The challenge was to analyze the company's performance across key metrics (trip volume, passenger satisfaction, repeat passenger rate, trip distribution) and provide data-driven recommendations to the Chief of Operations, Bruce Haryali.

## Business Context
Goodcabs, established two years ago, has built a strong presence in Tier-2 cities by supporting local drivers while ensuring quality passenger service. With ambitious 2024 performance targets, the management needed a comprehensive analysis to identify growth opportunities and operational bottlenecks.

## Objective
The objective of this project is to:

- Evaluate company performance across key business metrics.
- Measure progress against 2024 operational targets.
- Analyze passenger behavior and trip distribution.
- Understand city-level performance variations.
- Generate insights for management decision-making.
- Answer both primary and secondary business questions.
- Address ad-hoc SQL reporting requests.
- Build an interactive dashboard for stakeholders.

## Business Questions Addressed

### Primary Analysis
1. Top and Bottom Performing Cities
2. Average Fare per Trip by City
3. Average Ratings by City and Passenger Type
4. Peak and Low Demand Months by City
5. Weekend vs. Weekday Trip Demand by City
6. Repeat Passenger Frequency and City Contribution Analysis
7. Monthly Target Achievement Analysis for Key Metrics
8. Highest and Lowest Repeat Passenger Rate (RPR%) by City and Month

### Secondary Analysis
The second phase dives deeper into "Why do Lucknow and Surat have the highest retention despite having some of the lowest driver ratings?"

Research Questions:
1. Does driver rating influence retention?
2. Does fare influence retention?
3. Does trip distance influence retention?
4. Comparative Analysis: Low vs High Retention Cities

Techniques:
- Exploratory Data Analysis
- Correlation Analysis
- Hypothesis Testing
- Regression Analysis

### Ad-Hoc SQL Requests
Additional SQL-based reports were created to answer management-specific business questions mentioned in the provided document.

## Dataset 

This project uses two relational databases, **`trips_db`** and **`targets_db`**, which contain operational and business performance data for **Goodcabs**, a cab service operating across multiple tier-2 cities. Together, these datasets enable comprehensive analysis of trip demand, passenger behavior, customer satisfaction, repeat usage patterns, and target achievement across cities and time periods.

#### 1. trips_db

The `trips_db` database contains both **transaction-level** and **aggregated** information related to trips and passengers. It supports detailed analysis of travel patterns, passenger segmentation, city-wise performance, and customer retention trends.

**Key Tables:**

| Table Name | Description |
|------------|-------------|
| `dim_city` | Stores city identifiers and city names for location-based analysis. |
| `dim_date` | Provides date attributes such as month and day type (weekday/weekend) for time-based analysis. |
| `fact_trips` | Contains detailed trip-level records including distance traveled, fare amount, passenger type, and customer ratings. |
| `fact_passenger_summary` | Monthly aggregated passenger statistics including total, new, and repeat passengers. |
| `dim_repeat_trip_distribution` | Monthly distribution of repeat passengers categorized by the number of trips taken. |

This database enables analysis of trip volumes, revenue trends, passenger acquisition, customer retention, travel behavior, and service quality across cities and time periods.

#### 2. targets_db
The `targets_db` database contains monthly business targets established by Goodcabs for each operational city. These targets serve as benchmarks for measuring performance and growth.

**Key Tables:**

| Table Name | Description |
|------------|-------------|
| `monthly_target_trips` | Monthly trip volume targets for each city. |
| `monthly_target_new_passengers` | Monthly new passenger acquisition targets for each city. |
| `city_target_passenger_rating` | Target average passenger ratings used to monitor customer satisfaction. |

This database supports performance evaluation by comparing actual results against predefined business goals.

## Data Model
The dataset follows a star-schema design where fact_trips serves as the primary fact table containing trip-level information such as fare amount, distance traveled, passenger ratings, and driver ratings.
![Upload](images\data_model.png)

## Key Metrics Calculated
### Operational Metrics
- Total Trips
- City-wise Trip Share
- Average Fare per Trip
- Average Trips per Passenger

### Passenger Metrics
- Total Passengers
- New Passengers
- Repeat Passengers
- Repeat Passenger Rate
- Passenger Retention %

### Customer Experience Metrics
- Average Passenger Rating
- Average Driver Rating

### Performance Metrics
- Target Achievement %
- Monthly Growth
- City Ranking

## Tools Used

| Tool | Purpose |
|--------|---------|
| SQL | Data Extraction & Reporting |
| Power BI | Primary Analysis |
| Excel | Data Validation |
| Python | Secondary Analysis |
| Canva | Final Presentation |

## Dashboard Pages
### Executive Summary
![Upload](images\executive_summary_dashboard.png)

### City Performance Dashboard
![Upload](images\city_wise_performance_dashboard.png)

## Key Insights
### Customer Retention Insights

- Surat and Lucknow recorded the highest **Repeat Passenger Rates (RPR)** despite having some of the lowest driver ratings, suggesting that customer retention is influenced by factors beyond service quality alone.
- Statistical analysis revealed a significant negative correlation between **Average Fare** and **Repeat Passenger Rate** (*r = -0.654, p = 0.040*), indicating that lower fares are associated with higher customer retention.
- **Driver Rating** also showed a significant relationship with retention (*r = -0.756, p = 0.011*), but the direction of the relationship contradicted common expectations, highlighting the need to investigate additional behavioral factors.
- **Trip Distance** exhibited a moderate negative relationship with retention (*r = -0.599*), although the relationship was not statistically significant at the 95% confidence level.

### Customer Behavior Insights

- More than **58% of repeat passengers** in Surat and Lucknow completed **over five trips per month**, compared to only **14–16%** in Jaipur and Mysore.
- High-retention cities were characterized by:
  - Shorter trip distances
  - Lower fares
  - A larger share of frequent riders
- These findings suggest that habitual usage is a key driver of customer loyalty.
- Most repeat passengers across cities completed **2–3 trips per month**, while high-frequency riders (**9+ trips**) represented only a small portion of the customer base.

### Demand Pattern Insights

- Jaipur was the only city where **weekend trips significantly exceeded weekday trips**, indicating a unique demand pattern compared to other cities.
- Lucknow generated the highest **weekday trip volume**, highlighting strong recurring demand throughout the workweek.
- Cities with stronger weekday demand generally exhibited higher retention levels than cities heavily dependent on weekend demand.

### Operational Performance Insights

- Jaipur and Mysore consistently exceeded monthly trip targets, indicating strong demand and potential opportunities for target recalibration.
- Vadodara failed to achieve trip targets in every month of the analysis period, signaling a need for operational and demand-side investigation.
- June emerged as the weakest month overall, with only a few cities exceeding their monthly trip targets.

### Strategic Business Insights

- Customer retention appears to be driven more by:
  - Affordability
  - Ride frequency
  - Recurring travel needs
  than by driver ratings alone.
- Increasing ride frequency may have a greater impact on retention than focusing exclusively on customer satisfaction metrics.
- Cities should be managed using differentiated strategies, as customer behavior, retention patterns, and demand drivers vary significantly across markets.

## Recommendations
- Focus on increasing ride frequency in low-retention cities such as **Jaipur** and **Mysore** through loyalty programs, ride bundles, and commuter-focused offers.
- Replicate successful retention strategies from **Surat** and **Lucknow**, where high customer retention is supported by frequent usage, lower fares, and strong weekday demand.
- Introduce pricing initiatives such as:
  - Subscription plans
  - Discounted ride packages
  - Repeat-user incentives  
  to encourage customer loyalty.
- Shift performance monitoring beyond customer ratings by incorporating retention metrics such as:
  - Repeat Passenger Rate (RPR)
  - Ride frequency
  - Repeat customer share
- Strengthen weekday demand in weekend-dominated cities through partnerships with offices, colleges, and local businesses to promote recurring travel behavior.
- Reassess trip targets for consistently overperforming cities such as **Jaipur** and **Mysore** to better align targets with actual demand potential.
- Conduct a detailed operational review of **Vadodara**, which consistently failed to achieve monthly trip targets, to identify demand-side or supply-side challenges.
- Segment cities based on retention patterns and customer behavior rather than applying a one-size-fits-all growth strategy.
- Prioritize initiatives that convert occasional riders into frequent users, as ride frequency emerged as the strongest differentiator between high-retention and low-retention cities.
- Develop city-specific retention strategies focused on:
  - Affordability
  - Convenience
  - Recurring travel needs


## Deliverables
- SQL Scripts
- Power BI Dashboard
- Presentation Deck
- Business Insights Report
- Recommendations for Management

## Project Outcome
This analysis provides Goodcabs leadership with a comprehensive understanding of operational performance, passenger behavior, and growth opportunities, enabling data-driven decision-making for achieving 2024 business objectives.



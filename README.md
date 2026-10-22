# U.S. Hospital Cost & Financial Sustainability Analytics (2011–2020)

## Project Overview

How do hospital costs, profitability, and uncompensated care change over time, and how do these patterns differ by hospital size and location?

This project analyzes U.S. hospital financial data from 2011 to 2020 using SQL, Python, and Tableau. The analysis examines operating cost trends, uncompensated care, net income, and financial performance across hospital bed-capacity tiers.

The goal is to identify patterns in hospital financial sustainability and translate the findings into insights relevant to healthcare analysts and financial decision-makers.

## Key Findings

- **Hospital size affects profit per bed efficiency.** Large hospitals with 400 or more beds showed much higher jumps in profit from 2011 to 2020 compared to medium-tier and small-tier hospitals, showcasing that a significantly higher number of beds tends to drive average net income higher with much higher percentage jumps.
- **Uncompensated care** Texas is the state with the highest uncompensated care across the decade, while states with significantly smaller populations such as Alaska and Rhode Island tend to have the least uncompensated care. Delaware, over 10 years, consistently has one of the highest average amounts of net income compared to Alaska, which is consistently losing on average 30 million dollars for every year reported.
-- **Outlier Payments and Hospital Financial Performance:** Several California hospitals recorded substantial outlier payments for discharges during the analyzed period. In 2018, Ronald Reagan UCLA reported approximately $58.1 million in outlier payments, while UCSF Medical Center reported $50.8 million. Both hospitals also reported negative net income that year. These results highlight the importance of examining supplemental payments alongside hospital profitability when evaluating financial performance.
- **cost inflation** A graph reveals that 2 major time periods show a significant amount of inflation in a single year: 2019 to 2020 and 2013 to 2014. 

*These findings reflect patterns identified in the analyzed dataset. The Tableau dashboard provides additional context through filters and facility-level comparisons.*

## Interactive Tableau Dashboard

[**Explore the Hospital Cost Analytics Dashboard**](https://public.tableau.com/app/profile/ansh.chellani/viz/Hospital-Cost-Longitudinal-Analytics/Dashboard1)

The dashboard brings together four areas of analysis and allows users to explore results by state, year, and hospital bed-capacity tier.

### Analytical Areas

1. **Longitudinal Cost Trends**  
   Examine operating expenditure changes over time and compare year-over-year cost growth.

2. **Uncompensated Care and Net Income**  
   Explore the relationship between charity care burdens and hospital profitability.

3. **Hospital Size and Financial Performance**  
   Compare financial trends across bed-capacity tiers to investigate differences in scale and performance.

4. **Financially Stressed Hospitals**  
   Identify facilities reporting large operating deficits and examine the role of supplemental reimbursements in their financial results.

## Tools & Technical Skills

- **SQL:** Financial data analysis, aggregations, and year-over-year comparisons
- **Python:** Data preparation and analytical workflows
- **Tableau:** Interactive dashboard development and financial data visualization

## Business Implications

The findings suggest several areas for further investigation by healthcare organizations and policymakers:

- **Operating cost management:** Hospitals experiencing unusually high cost growth could investigate supply chain expenses, administrative overhead, and other major operating cost categories.
- **Uncompensated care funding:** Policymakers could use state-level comparisons to examine whether financial assistance is aligned with the needs of hospitals providing substantial uncompensated care.
- **Operational collaboration:** Smaller and mid-sized hospitals could evaluate shared administrative services and regional purchasing arrangements as potential ways to manage costs.

These are potential strategies informed by the analysis, not proven outcomes of the project.

## Repository Structure

```text
hospital-cost-analytics/
├── data/        # Cleaned analytical dataset extracts
├── sql/         # Analytical SQL queries and views
├── dashboard/   # Tableau workbook exports and visual assets
└── README.md    # Project documentation
```

## Project Objective

This project demonstrates how healthcare financial data can be organized, analyzed, and visualized to investigate cost trends, profitability, and financial sustainability across hospitals.


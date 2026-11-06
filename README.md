# U.S. hospital costs and financial performance, 2011–2020

How often did a hospital’s total costs rise by more than 20% in one year? I used Python to load annual financial reports into PostgreSQL and SQL to compare each hospital with its own prior year. I also built a Tableau dashboard to explore how net income and uncompensated care varied across hospitals and states.

[Explore the Tableau dashboard](https://public.tableau.com/app/profile/ansh.chellani/viz/Hospital-Cost-Longitudinal-Analytics/Dashboard1) · [View the year-over-year cost query](sql%20scripts/annual_cost_comparisons.sql)

## Findings

- **Annual cost growth.** Reported total costs rose more than 20% in 1,678 of 49,753 eligible hospital-year comparisons (3.37%). The highest share occurred from 2019 to 2020, when 252 of 5,497 comparisons (4.58%) crossed that threshold.
- **Hospital size and net income.** In 2020, average reported net income was $2.3 million for hospitals with fewer than 100 beds, $25.1 million for those with 100–399 beds, and $121.3 million for those with at least 400 beds. These dollar amounts describe earnings at different scales. Comparing profitability would also require a measure such as net income as a share of revenue.
- **Uncompensated care.** Texas hospitals reported $58.1 billion in uncompensated care over the decade, the largest state total in the dataset after counting each report once. To compare the burden on hospitals across states, a useful next step would be to calculate uncompensated care as a share of hospital expenses.
- **Outlier payments.** In 2018, Ronald Reagan UCLA reported $58.1 million in outlier payments and a net loss of $7.4 million. UCSF Medical Center reported $50.8 million in outlier payments and a net loss of $57.5 million. Both hospitals received these payments in a year when their total expenses exceeded their income.

## How the annual comparison works

The unit is one hospital observed across two consecutive reporting years. The query removes duplicate reports, including repeated 2013 records in the merged file. It matches hospitals by provider ID and requires one report in each year, two back-to-back fiscal periods of 364–366 days, a positive prior-year cost, and a recorded current-year cost.

The percentage measures growth in reported spending. Changes in prices, patient volume, or the mix of services could each affect a hospital’s total. The reports alone cannot separate those effects.

## Data and code

- [Annual source files](raw_data/) and [merged dataset](merged_data/hospital_costs_master.csv)
- [Python loader](python_merge_script/load_hospitals.py) — standardizes column names, adds the reporting year, and loads the files into PostgreSQL. Set the CSV folder and database connection for your machine before running it.
- [Annual cost comparisons](sql%20scripts/annual_cost_comparisons.sql) — run against the populated `hospital_costs_master` table to reproduce the annual counts and overall percentage.
- [Other financial queries](sql%20scripts/hospital_project.sql) and [visualization workbooks](visualizations/) — explore state totals, bed-capacity groups, and outlier payments. For the cost-growth percentages above, use the annual comparison query.

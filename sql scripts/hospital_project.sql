-- shows each hospitals' cost inflation depending on the previous years values by utilizing a window function to feth previous years' total costs. 
-- BIG EXCEPTION: 2011 is the year the data starts, and therefore that is why the previous year costs and the cost inflation percentage for any hospital with the year 2011 is null
SELECT 
    hospital_name,
    state_code,
    report_year,
    total_costs,
    LAG(total_costs, 1) OVER (PARTITION BY provider_ccn ORDER BY report_year) AS prev_year_costs,
    ROUND(
        ((total_costs - LAG(total_costs, 1) OVER (PARTITION BY provider_ccn ORDER BY report_year)) 
        / NULLIF(LAG(total_costs, 1) OVER (PARTITION BY provider_ccn ORDER BY report_year), 0) * 100)::numeric, 2
    ) AS cost_inflation_pct
FROM hospital_costs_master
WHERE total_costs IS NOT NULL;



--comparing  care burdens against profitability over a 10-year timeline.
SELECT 
    state_code,
    report_year,
    COUNT(provider_ccn) AS reporting_hospitals,
    SUM(cost_of_charity_care) AS total_charity_care,
    SUM(cost_of_uncompensated_care) AS total_uncompensated_care,
    AVG(net_income) AS avg_net_income
FROM hospital_costs_master
GROUP BY state_code, report_year
ORDER BY state_code, report_year;



-- bed capacity vs profitabiliy efficiency
SELECT 
    CASE 
        WHEN number_of_beds < 100 THEN 'Small (<100 beds)'
        WHEN number_of_beds BETWEEN 100 AND 399 THEN 'Medium (100-399 beds)'
        ELSE 'Large (400+ beds)'
    END AS hospital_tier,
    report_year,
    COUNT(*) AS hospital_count,
    AVG(net_income) AS avg_net_income,
    AVG(cost_to_charge_ratio) AS avg_cost_to_charge_ratio
FROM hospital_costs_master
WHERE number_of_beds IS NOT NULL
GROUP BY hospital_tier, report_year
ORDER BY report_year, hospital_tier;

-- Safety-Net Outlier Dependency
SELECT 
    provider_ccn,
    hospital_name,
    city,
    state_code,
    report_year,
    net_income,
    outlier_payments_for_discharges
FROM hospital_costs_master
WHERE net_income < 0 
  AND outlier_payments_for_discharges > 0
ORDER BY outlier_payments_for_discharges DESC
LIMIT 25;
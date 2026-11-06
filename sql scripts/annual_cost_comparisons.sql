-- Run in PostgreSQL after loading hospital_costs_master.
CREATE OR REPLACE TEMP VIEW annual_cost_comparisons AS
WITH reports AS (
    SELECT DISTINCT rpt_rec_num, provider_ccn, report_year,
           fiscal_year_begin_date::date AS start_date,
           fiscal_year_end_date::date AS end_date, total_costs::numeric AS costs
    FROM hospital_costs_master
    WHERE provider_ccn IS NOT NULL AND report_year BETWEEN 2011 AND 2020
), annual AS (
    SELECT *, COUNT(*) OVER (PARTITION BY provider_ccn, report_year) AS report_count
    FROM reports
)
SELECT c.provider_ccn, c.report_year, c.costs, p.costs AS prior_costs,
       c.costs > 1.20 * p.costs AS grew_over_20_pct
FROM annual c JOIN annual p
  ON c.provider_ccn = p.provider_ccn AND c.report_year = p.report_year + 1
 AND c.start_date = p.end_date + 1
WHERE c.report_count = 1 AND p.report_count = 1
  AND c.end_date - c.start_date + 1 BETWEEN 364 AND 366
  AND p.end_date - p.start_date + 1 BETWEEN 364 AND 366
  AND c.costs IS NOT NULL AND p.costs > 0;

SELECT report_year, COUNT(*) AS comparisons,
       COUNT(*) FILTER (WHERE grew_over_20_pct) AS above_threshold,
       ROUND(100.0 * COUNT(*) FILTER (WHERE grew_over_20_pct) / COUNT(*), 2) AS pct
FROM annual_cost_comparisons
GROUP BY GROUPING SETS ((report_year), ())
ORDER BY report_year NULLS LAST;

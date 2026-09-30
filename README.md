# 🏥 U.S. Hospital Cost & Financial Sustainability Analytics (2011–2020)

## 📌 Project Overview
This project delivers an in-depth financial and economic analysis of decadal hospital records (2011–2020) to evaluate structural cost inflation, uncompensated care absorption, and institutional profitability across the U.S. healthcare sector. The analysis bridges raw financial data ingestion, multi-table database modeling, and interactive visualization to deliver actionable insights for healthcare analysts and financial stakeholders.

---

## 📊 Executive Summary & Key Findings
* **Scale and Profitability Divergence:** Large-tier health systems ($400+$ beds) leverage economies of scale to steadily compound net income over the decade, whereas community and small-tier facilities operate under tight, volatile margins.
* **Geographic Care Burdens:** High-population states like Texas and California absorb billions in uncompensated and charity care, creating localized financial strain that requires strategic subsidy management.
* **Cost Inflation Outliers:** While baseline operating cost inflation remains stable year-over-year, a distinct tier of outlier facilities experience runaway cost spikes exceeding 20% annually.
* **Safety-Net Vulnerability:** Major academic and safety-net institutions absorb tens of millions in operating deficits, highlighting heavy reliance on supplemental outlier reimbursements to maintain operations.

---

## 📈 Interactive Dashboard & Visualizations
The interactive Tableau dashboard integrates all analytical pillars into a single dynamic interface, enabling stakeholders to filter by state, year, and bed capacity tier.

* **[(https://public.tableau.com/app/profile/ansh.chellani/viz/Hospital-Cost-Longitudinal-Analytics/Dashboard1)]** 

### Analytical Pillars Covered:
1. **Longitudinal Cost Inflation Trend:** Multi-year percentage tracking of operational expenditure changes across facilities.
2. **Uncompensated Care vs. Net Income:** Scatter analysis mapping charity care burdens against bottom-line profitability.
3. **Bed Capacity vs. Efficiency:** Comparative trend lines evaluating financial scaling advantages across hospital tiers.
4. **Safety-Net Outlier Dependency:** Ranked breakdown of high-deficit facilities and their reliance on federal reimbursements.

---

## 💡 Strategic Recommendations
* **Optimize Supply Chain & Administrative Overhead:** Mid- and small-tier community hospitals should evaluate group purchasing organizations (GPOs) to curb the runaway cost inflation impacting baseline operations.
* **Strategic Subsidy Allocation:** State healthcare policy bodies should re-evaluate uncompensated care pool distributions to better support safety-net hospitals absorbing high volumes of unpaid debt in states like Texas and California.
* **Scale-Driven Efficiency Models:** Medium-tier facilities should explore regional network integrations or shared administrative services to replicate the financial compounding observed in large-tier health systems.

---

## 📁 Repository Structure
```text
hospital-cost-analytics/
│
├── data/                  # Cleaned analytical dataset extracts
├── sql/                   # Analytical SQL queries and views
├── dashboard/             # Tableau workbook exports and visual assets
└── README.md              # Project documentation and findings

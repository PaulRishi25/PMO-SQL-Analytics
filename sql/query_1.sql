SELECT
  f.Client,
  ROUND(SUM(f.Revenue_Euro),0)    AS Total_Revenue,
  ROUND(SUM(f.Cost_Euro),0)       AS Total_Cost,
  ROUND(SUM(f.Profit_Euro),0)     AS Total_Profit,
  ROUND(AVG(f.Margin_Percent),1)  AS Avg_Margin_Pct
FROM financials f
GROUP BY f.Client
ORDER BY Total_Revenue DESC;
SELECT
  f.ProjectID,
  p.ProjectName,
  f.Client,
  p.Office_Location,
  p.Project_Manager,
  ROUND(f.Revenue_Euro,0)  AS Revenue,
  ROUND(f.Profit_Euro,0)   AS Profit,
  ROUND(f.Margin_Percent,1) AS Margin_Pct
FROM financials f
JOIN projects p ON f.ProjectID = p.ProjectID
ORDER BY f.Margin_Percent DESC
LIMIT 10;
SELECT
  p.Project_Manager,
  p.Program_Manager,
  COUNT(p.ProjectID)              AS Projects_Managed,
  ROUND(SUM(f.Revenue_Euro),0)    AS Total_Revenue,
  ROUND(AVG(f.Margin_Percent),1)  AS Avg_Margin_Pct,
  ROUND(AVG(r.Utilization_Percent),1) AS Avg_Utilisation
FROM projects p
JOIN financials  f ON p.ProjectID = f.ProjectID
JOIN resources   r ON p.ProjectID = r.ProjectID
GROUP BY p.Project_Manager, p.Program_Manager
ORDER BY Total_Revenue DESC;
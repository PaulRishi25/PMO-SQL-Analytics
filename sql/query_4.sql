SELECT
  r.Role,
  ROUND(SUM(t.Hours),1)             AS Total_Hours,
  ROUND(SUM(CASE WHEN t.Billable='Y' THEN t.Hours ELSE 0 END),1) AS Billable_Hours,
  ROUND(SUM(CASE WHEN t.Billable='N' THEN t.Hours ELSE 0 END),1) AS NonBillable_Hours,
  ROUND(100.0*SUM(CASE WHEN t.Billable='Y' THEN t.Hours ELSE 0 END)/SUM(t.Hours),1) AS Billable_Pct
FROM timesheets t
JOIN resources r ON t.ResourceID = r.ResourceID
GROUP BY r.Role
ORDER BY Billable_Pct DESC;
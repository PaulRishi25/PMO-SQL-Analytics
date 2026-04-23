SELECT
  rk.Office_Location,
  COUNT(*)                          AS Total_Risks,
  SUM(CASE WHEN rk.Severity='Critical' THEN 1 ELSE 0 END) AS Critical,
  SUM(CASE WHEN rk.Severity='High'     THEN 1 ELSE 0 END) AS High,
  ROUND(AVG(rk.Probability_Percent),1) AS Avg_Probability,
  ROUND(AVG(rk.Impact_Score),2)        AS Avg_Impact
FROM risks rk
GROUP BY rk.Office_Location
ORDER BY Critical DESC;
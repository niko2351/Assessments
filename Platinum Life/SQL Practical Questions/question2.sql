SELECT SUM(CASE WHEN S >= 0 THEN S ELSE 0 END) AS Positives, SUM(CASE WHEN S < 0 THEN  S ELSE 0 END) AS Negatives
FROM Numbers;
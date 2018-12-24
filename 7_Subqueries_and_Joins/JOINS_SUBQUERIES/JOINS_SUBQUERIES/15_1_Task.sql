USE Geography

SELECT ContinentCode, CurrencyCode, Usage FROM
(
SELECT ContinentCode, 
CurrencyCode, 
COUNT(c.CountryCode) AS Usage, 
DENSE_RANK()OVER(PARTITION BY ContinentCode ORDER BY COUNT(c.CountryCode) DESC) AS Ranking
FROM Countries as c

GROUP BY ContinentCode, CurrencyCode

HAVING COUNT(c.CountryCode) > 1
) AS c

WHERE [Ranking] = 1

ORDER BY ContinentCode


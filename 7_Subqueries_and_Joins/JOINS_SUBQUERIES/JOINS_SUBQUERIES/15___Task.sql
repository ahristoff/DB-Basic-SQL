USE Geography


SELECT G.ContinentCode, G.CurrencyCode, G.Usage FROM
(
SELECT ContinentCode, CurrencyCode, COUNT(c.CountryCode) AS Usage from Countries AS c

GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(c.CountryCode) > 1
) AS G

JOIN 

(
SELECT F.ContinentCode,  MAX(Usage) AS Maximum FROM (
SELECT ContinentCode, CurrencyCode, COUNT(c.CountryCode) AS Usage from Countries AS c
GROUP BY ContinentCode, CurrencyCode) AS F
GROUP BY F.ContinentCode
) AS D

ON G.ContinentCode = D.ContinentCode AND D.Maximum = G.Usage










--select ContinentCode, CurrencyCode, df from
--(
--select
-- co.ContinentCode as ContinentCode, 
-- cu.CurrencyCode as CurrencyCode, 
-- count(cu.CurrencyCode) as df,
-- dense_rank() over (Partition By co.ContinentCode order by count(cu.CurrencyCode)desc) as ran
-- from countries as c
--join Continents as co on co.ContinentCode = c.ContinentCode
--join Currencies as cu on cu.CurrencyCode = c.CurrencyCode

--group by co.ContinentCode, cu.CurrencyCode

--having count(cu.CurrencyCode) >1
--) as gh

--where ran =1



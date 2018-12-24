USE Geography


SELECT 
A.Country, 
A.[Highest Peak Name],
CASE
WHEN B.MaxElevation IS NULL THEN 0
ELSE B.MaxElevation
END AS MaxElevation,
A.Mountain FROM
(
SELECT c.CountryName AS Country,
CASE
WHEN p.PeakName IS NULL THEN '(no highest peak)'
ELSE p.PeakName
END AS [Highest Peak Name],
CASE
WHEN p.Elevation IS NULL THEN 0
ELSE p.Elevation
END AS [Highest Peak Elevation],
CASE
WHEN m.MountainRange IS NULL THEN '(no mountain)'
ELSE m.MountainRange
END AS Mountain
FROM Mountains AS m FULL JOIN Peaks AS p

ON p.MountainId=m.Id
FULL JOIN MountainsCountries AS mc
ON mc.MountainId = m.Id
FULL JOIN Countries AS c
ON mc.CountryCode = c.CountryCode
WHERE c.CountryName is not NULL
) as A

FULL JOIN

(
SELECT c.CountryName, MAX(p.Elevation) AS MaxElevation FROM Mountains as m
FULL JOIN Peaks AS p               ON p.MountainId=m.Id
FULL JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
FULL JOIN Countries AS c           ON mc.CountryCode = c.CountryCode

WHERE c.CountryName is not NULL 
GROUP BY c.CountryName
Having MAX(p.Elevation) IS NOT NULL
) AS B

ON A.Country = B.CountryName AND A.[Highest Peak Elevation]=B.MaxElevation

WHERE (A.[Highest Peak Name] != '(no highest peak)' AND MaxElevation != 0) 
OR (A.[Mountain] = '(no mountain)' AND MaxElevation IS NULL)


ORDER BY A.Country, A.[Highest Peak Name]
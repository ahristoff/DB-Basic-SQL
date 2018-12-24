USE Geography

SELECT 
Country, 
[Highest Peak Name],
CASE
WHEN [Highest Peak Elevation] IS NULL THEN 0
ELSE [Highest Peak Elevation]
END AS MaxElevation,
A.Mountain FROM

(
SELECT c.CountryName AS Country,
ISNULL(PeakName, '(no highest peak)') AS [Highest Peak Name],
--CASE
--WHEN p.PeakName IS NULL THEN '(no highest peak)'
--ELSE p.PeakName
--END AS [Highest Peak Name],
ISNULL(p.Elevation,0) AS [Highest Peak Elevation],
--CASE
--WHEN p.Elevation IS NULL THEN 0
--ELSE p.Elevation
--END AS [Highest Peak Elevation],
ISNULL(m.MountainRange, '(no mountain)') AS Mountain,
--CASE
--WHEN m.MountainRange IS NULL THEN '(no mountain)'
--ELSE m.MountainRange
--END AS Mountain,
DENSE_RANK() OVER(PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS [Ranking]
FROM Mountains AS m 

FULL JOIN Peaks AS p ON p.MountainId=m.Id
FULL JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
FULL JOIN Countries AS c ON mc.CountryCode = c.CountryCode

WHERE c.CountryName is not NULL -- poiaviava se ot FULL JOIN
) as A

WHERE [Ranking] = 1

--select * from Countries

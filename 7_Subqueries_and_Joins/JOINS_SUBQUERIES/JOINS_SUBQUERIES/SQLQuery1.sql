USE Geography

SELECT TOP 5 
	   hpc.CountryName AS Country,
	   ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
	   ISNULL(p.Elevation, 0) AS [Highest Peak Elevation],
	   ISNULL(m.MountainRange, '(no mountain)') AS Mountain FROM
(SELECT CountryName,
       ISNULL(CAST(MAX(p.Elevation) AS VARCHAR(20)), '(no highest peak)') AS HighestPeakElevation
FROM Mountains AS m
	
FULL JOIN Peaks AS p
ON p.MountainId=m.Id

FULL JOIN MountainsCountries AS mc
ON mc.MountainId = m.Id

FULL JOIN Countries AS c
ON mc.CountryCode = c.CountryCode
GROUP BY CountryName) AS hpc

FULL JOIN MountainsCountries mc
ON mc.CountryCode = (SELECT CountryCode FROM Countries WHERE CountryName = hpc.CountryName)

FULL JOIN Mountains m
ON m.Id = mc.MountainId

FULL JOIN Peaks p
ON p.MountainId = m.Id

WHERE ISNULL(CAST(p.Elevation AS VARCHAR(50)), '(no highest peak)') = hpc.HighestPeakElevation
ORDER BY Country, Mountain

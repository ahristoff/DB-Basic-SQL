USE Geography

SELECT CountryCode,COUNT( MountainId) AS MountainRange FROM MountainsCountries
WHERE CountryCode IN ('BG','RU','US')
GROUP BY CountryCode









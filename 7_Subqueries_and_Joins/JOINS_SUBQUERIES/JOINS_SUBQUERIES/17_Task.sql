USE Geography

SELECT TOP(5) * FROM
 (
SELECT c.CountryName, MAX(p.Elevation) AS HighestPeakElevation, MAX(r.Length) AS LongestRiverLength 
FROM Countries AS c
FULL JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
FULL JOIN Peaks AS p ON p.MountainId = mc.MountainId
FULL JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
FULL JOIN Rivers AS r ON cr.RiverId = r.Id

WHERE c.CountryName IS NOT NULL

GROUP BY CountryName
) AS T1


ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName


---------------------------------------------------------------------------------


SELECT TOP(5) 
c.CountryName, 
MAX(p.Elevation) AS HighestPeakElevation, 
MAX(r.Length) AS LongestRiverLength 
FROM Countries AS c
FULL JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
FULL JOIN Peaks AS p ON p.MountainId = mc.MountainId
FULL JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
FULL JOIN Rivers AS r ON cr.RiverId = r.Id

WHERE c.CountryName IS NOT NULL

GROUP BY CountryName

ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName

------------------------------------------------------------------------------

select TOP(5) CountryName, HighestPeakElevation ,LongestRiverLength from
(
select c.CountryName as CountryName,
p.Elevation as HighestPeakElevation,
DENSE_RANK() over(PARTITION BY c.CountryName order by p.Elevation desc) as ranM, 
r.Length as LongestRiverLength,
DENSE_RANK() over(PARTITION BY c.CountryName order by r.Length desc) as ranR
from Countries as c
full join CountriesRivers as cr on cr.CountryCode = c.CountryCode
full join Rivers as r on r.Id = cr.RiverId
full join MountainsCountries as mc on mc.CountryCode = c.CountryCode
full join Peaks as p on p.MountainId =mc.MountainId

where (c.CountryName is not null) 
and (p.Elevation is not null) 
--and (r.Length is not null)

group by c.CountryName, p.Elevation, r.Length

) as df
where ranM = 1 AND ranR = 1

ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName



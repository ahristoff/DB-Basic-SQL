USE Geography

SELECT TOP(5) c.CountryName, r.RiverName 
FROM Rivers AS r
FULL OUTER JOIN CountriesRivers AS cr ON r.Id =cr.RiverId
FULL OUTER JOIN Countries AS c ON cr.CountryCode = c.CountryCode

WHERE ContinentCode = 'AF'

ORDER BY CountryName




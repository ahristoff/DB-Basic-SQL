USE Geography
SELECT COUNT(CountryName) FROM
(
SELECT c.CountryName, m.MountainRange 
FROM Countries AS c
FULL JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
FULL JOIN Mountains AS m ON m.Id = mc.MountainId

WHERE m.MountainRange IS NULL
) AS CountryCode




select count(co.CountryCode) from Countries as co
full join MountainsCountries as mc on mc.CountryCode = co.CountryCode
full join Mountains as m on m.Id = mc.MountainId

where m.Id is null
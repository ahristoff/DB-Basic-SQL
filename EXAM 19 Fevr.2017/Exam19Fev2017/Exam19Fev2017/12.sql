USE Bakery

SELECT cu.FirstName, cu.Age, cu.PhoneNumber FROM Customers AS cu
JOIN Countries AS co ON cu.CountryId = co.Id
WHERE (cu.Age >= 21 AND FirstName LIKE '%an%')
OR(Right(PhoneNumber,2)=38 AND co.Name <>'Greece')
ORDER BY cu.FirstName, cu.Age DESC
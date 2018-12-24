USE Bakery

SELECT p.Name AS ProductName, f.Rate AS ProductAverageRate, d.Name AS DistributorName, co.Name AS DistributorCountry    FROM Feedbacks AS f
JOIN Products AS p ON p.Id = f.ProductId
JOIN Customers AS cu ON cu.Id = f.CustomerId
JOIN Countries AS co ON co.Id = cu.CountryId
JOIN Distributors AS d ON d.CountryId = co.Id
JOIN Ingredients AS i ON i.DistributorId = d.Id

group by p.Name, f.Rate, d.Name, co.Name, p.Id
HAVING COUNT(i.Id) = 1
ORDER BY p.Id




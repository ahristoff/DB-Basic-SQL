USE Bakery

SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName, c.PhoneNumber, c.Gender
FROM Feedbacks AS f 
FULL JOIN Customers AS c ON f.CustomerId = c.Id
GROUP BY c.Gender,c.Id, CONCAT(c.FirstName,' ',c.LastName),c.PhoneNumber
HAVING COUNT(f.Id) = 0
ORDER BY c.Id



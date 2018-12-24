use Bakery

SELECT TOP(15) i.Name, i.Description, c.Name FROM Ingredients AS i
JOIN Countries AS c ON i.OriginCountryId = c.Id
WHERE c.Name IN('Bulgaria', 'Greece')
order by i.Name, c.Name
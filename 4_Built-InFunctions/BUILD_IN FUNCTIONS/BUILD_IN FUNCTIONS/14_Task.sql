USE Diablo

 SELECT Username, IPAddress FROM Users
  WHERE IPAddress LIKE '___.1%.%.___'
 ORDER BY Username
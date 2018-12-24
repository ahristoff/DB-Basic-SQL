Use SoftUni
SELECT FirstName+' '+MiddleName+' '+ LastName AS FullName FROM Employees 
 WHERE (Salary = 25000 OR Salary=14000 Or Salary = 12500 OR Salary=23600)

 SELECT CONCAT(FirstName,' ',MiddleName,' ',LastName) AS [FullName] FROM Employees
 WHERE Salary IN(25000,14000,12500,23600)
 

use Bakery

select f.ProductId, 
CONCAT(c.FirstName, ' ', c.LastName)as CustomerName, 
f.Description
from Customers as c
join Feedbacks as f on f.CustomerId = c.Id

--group by f.ProductId, CONCAT(c.FirstName, ' ', c.LastName), f.Description,f.Id
--having COUNT(f.Id) >=3 
-->> ne viarno zashtoto -> kadeto feedbacks>=3 bez da se utochniava za kakvo

where c.Id in 
(
select c.id 
from Feedbacks as f 
join Customers as c on c.Id = f.CustomerId 

group by c.Id having 

count(f.Id)>=3
)
--kadeto customerite imat poveche ot 3 feedbaks 

order by f.ProductId, CustomerName, f.Id










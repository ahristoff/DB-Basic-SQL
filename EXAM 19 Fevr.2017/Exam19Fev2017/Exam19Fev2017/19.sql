USE Bakery

GO

CREATE TRIGGER tr_DelTrig ON Products 
INSTEAD OF DELETE --TRIAT SE RELAZIITE KUM TABL.Products(-vrazki ima v tabl.Feedback i ProductIngridients
 
AS
BEGIN

	DECLARE @productId INT = (SELECT Id FROM deleted)

	DELETE FROM Feedbacks
	WHERE ProductId = @productId

	DELETE FROM ProductsIngredients
	WHERE ProductId = @productId

	DELETE FROM Products
	WHERE Products.Id = @productId

END
----------------------------------------------------------------
DELETE FROM Products WHERE Id = 7
--proverka 
SELECT * FROM Products ORDER BY Id
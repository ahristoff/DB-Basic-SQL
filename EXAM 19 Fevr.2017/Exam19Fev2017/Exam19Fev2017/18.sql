USE Bakery

GO

CREATE PROCEDURE usp_SendFeedback(@customerId INT, @productId INT, 
@rate DECIMAL(8, 6), @description VARCHAR(max))
AS
BEGIN
	DECLARE @CustomerFeedbackCount INT  = 
	(SELECT COUNT(Id) FROM dbo.Feedbacks AS f
	WHERE F.CustomerId = @customerId)
	IF(@CustomerFeedbackCount >= 3)
		BEGIN
			RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1)		
		END

	ELSE
		BEGIN
			INSERT INTO Feedbacks(CustomerId, ProductId, Rate, Description)
			VALUES(@customerId, @productId, @rate, @description)
		END
END

GO

SELECT * FROM Feedbacks
ORDER BY CustomerId

EXEC usp_SendFeedback 1, 5, 7.50, 'Average experience';
SELECT COUNT(*) FROM Feedbacks WHERE CustomerId = 1 AND ProductId = 5;




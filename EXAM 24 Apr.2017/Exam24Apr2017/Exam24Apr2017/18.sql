USE WMS
go

CREATE PROC usp_PlaceOrder @JobId INT, @SerialNumber VARCHAR(50), @Quantity INT
AS
BEGIN
	DECLARE @JobStatus VARCHAR(11) = (SELECT Status FROM Jobs WHERE JobId = @JobId)
	
	IF(@Quantity <= 0)
		BEGIN
			RAISERROR('Part quantity must be more than zero!',16,1)
			RETURN
		END

		DECLARE @JobIdS INT = (SELECT JobId FROM Jobs WHERE JobId = @JobId)

	IF(@JobIdS IS NULL )
		BEGIN
			RAISERROR('Job not found!',16 ,1)
			RETURN
		END

	IF(@JobStatus = 'Finished')
		BEGIN
			RAISERROR('This job is not active!',16,1)
			RETURN
		END

	DECLARE @PartId INT = (SELECT PartId FROM Parts WHERE SerialNumber = @SerialNumber)
	IF(@PartId IS NULL )
		BEGIN
			RAISERROR('Part not found!',16 ,1)
			RETURN
		END

		--A - order does not exist -> create new order
		--B - order exist, part does not exist in it -> add part to order
		--C - order exist, part exist -> increase part quantity in order

		--A
		DECLARE @OrderId INT = (SELECT o.OrderId FROM Orders AS o
		JOIN OrderParts AS op ON op.OrderId = o.OrderId
		JOIN Parts AS p ON p.PartId = op.PartId
		where JobId =@JobId AND p.PartId = @PartId)

		IF(@OrderId IS NULL)
			BEGIN
				INSERT INTO Orders(JobId, IssueDate) VALUES (@JobId , NULL)

				INSERT INTO OrderParts(PartId, OrderId, Quantity) VALUES (@PartId, IDENT_CURRENT('Orders'), @Quantity)

			END

			ELSE
				BEGIN
				DECLARE @PartExistInOrder INT = 
				(SELECT @@ROWCOUNT FROM OrderParts
				WHERE OrderId = @OrderId And PartId = @PartId)

				IF (@PartExistInOrder IS NULL)
					BEGIN 
						--B
				INSERT INTO OrderParts(PartId, OrderId, Quantity) VALUES (@PartId, @OrderId, @Quantity)	
					END
				ELSE 
					BEGIN
					--C
						UPDATE OrderParts
						SET Quantity+= @Quantity
						WHERE OrderId =@OrderId AND PartId = @PartId
					END

				END
	

END
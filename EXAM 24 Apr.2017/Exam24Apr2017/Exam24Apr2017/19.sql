use WMS

--go

--create TRIGGER tr_OrderDelivered ON Orders
--FOR UPDATE
--AS
--BEGIN
--	DECLARE @OldStatus BIT = (SELECT Delivered FROM deleted)
--	DECLARE @NewStatus BIT = (SELECT Delivered FROM inserted)

--	IF(@OldStatus = 0 AND @NewStatus = 1)
--		BEGIN
--			UPDATE Parts
--			SET StockQty += op.Quantity
--			From Parts AS p
--			JOIN OrderParts AS op ON op.PartId = p.PartId
--			JOIN Orders AS o ON o.OrderId = op.OrderId
--			JOIN inserted AS i ON i.OrderId = o.OrderId
--			JOIN deleted AS d ON d.OrderId = o.OrderId

--			--WHERE d.Delivered = 0 AND i.Delivered = 1

--		END
	
--END


--UPDATE Orders
--SET Delivered = 1
--WHERE OrderId = 21

------------------------------------------------------------------------

GO

create TRIGGER tr_OrderDelivered1 ON Orders
FOR UPDATE
AS
BEGIN
			UPDATE Parts
			SET StockQty += op.Quantity
			From Parts AS p
			JOIN OrderParts AS op ON op.PartId = p.PartId
			JOIN Orders AS o ON o.OrderId = op.OrderId
			JOIN inserted AS i ON i.OrderId = o.OrderId
			JOIN deleted AS d ON d.OrderId = o.OrderId
			
			WHERE d.Delivered = 0 AND i.Delivered = 1

END

UPDATE Orders
SET Delivered = 1
WHERE OrderId = 21


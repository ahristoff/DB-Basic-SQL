USE Hotel

Select TaxRate From Payments
UPDATE Payments SET TaxRate = TaxRate - 0.03*TaxRate
SELECT TaxRate From Payments

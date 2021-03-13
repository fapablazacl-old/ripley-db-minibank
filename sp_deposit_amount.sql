
CREATE OR REPLACE PROCEDURE sp_deposit_amount (
	destination_rut int,
	desired_amount int
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE accounts SET balance = balance + desired_amount WHERE rut=destination_rut;

	INSERT INTO movements (rut, amount, "type")
	VALUES (destination_rut, desired_amount, 'd');
END; $$

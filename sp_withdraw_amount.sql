
CREATE OR REPLACE PROCEDURE sp_withdraw_amount (
	destination_rut int,
	desired_amount int
)
LANGUAGE plpgsql
AS $$
DECLARE
	temp_balance int;
BEGIN
	temp_balance := (SELECT balance - desired_amount FROM accounts WHERE rut=destination_rut);

	IF (temp_balance < 0) THEN
		RAISE EXCEPTION 'No hay fondos suficientes en la cuenta para realizar la operacion'; 
	END IF;
	
	UPDATE accounts SET balance = balance - desired_amount WHERE rut=destination_rut;

	INSERT INTO movements (rut, amount, "type")
	VALUES (destination_rut, -desired_amount, 'w');
END; $$

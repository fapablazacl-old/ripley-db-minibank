
CREATE OR REPLACE PROCEDURE sp_login_user(
    pRut INT,
    pPassword varchar(10)
)
RETURNS boolean
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        SELECT COUNT(*)::INT FROM users WHERE rut=pRut AND password=pPassword
    );
END; $$

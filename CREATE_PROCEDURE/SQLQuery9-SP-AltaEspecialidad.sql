
SELECT * FROM Especialidad

EXEC ALTA_Especialidad 'UROLOGO'

ALTER PROC ALTA_Especialidad(
			@especialidad varchar(30)
			)
AS
SET NOCOUNT ON

IF NOT EXISTS (SELECT TOP 1 especialidad FROM Especialidad WHERE especialidad=@especialidad)
BEGIN
	INSERT INTO Especialidad (especialidad)
	            VALUES(@especialidad)
	PRINT 'Especialidad agregada'
	RETURN
END

ELSE
BEGIN
	PRINT 'La especialidad ya se encuentra agregada'
	RETURN
END

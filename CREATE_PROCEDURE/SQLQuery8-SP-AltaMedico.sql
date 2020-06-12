
EXEC ALTA_Medico 'Rom','Zuela',1,'Médico residente'

ALTER PROC ALTA_Medico(
			@nombre varchar(50),
			@apellido varchar(50),
			@idEspecialidad int,
			@descripcion varchar(50)
			)

AS

SET NOCOUNT ON

IF NOT EXISTS(SELECT TOP 1 idmedico FROM Medico WHERE nombre=@nombre and apellido=@apellido)
BEGIN
	INSERT INTO Medico(nombre,apellido)
		   VALUES(@nombre,@apellido)

	DECLARE @auxIdMedico int
	SET @auxIdmedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad(idMedico,idEspecialidad,descripcion)
		   VALUES(@auxIdMedico,@idEspecialidad,@descripcion)

	PRINT 'El médico se agrego correctamente'
	RETURN
END

ELSE
BEGIN
	PRINT 'El medico ya se encuentra agregado'
END
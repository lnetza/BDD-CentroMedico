/*
Estado 0 Pendiente
Estado 1 Realizado
Estado 2 Cancelado
*/

EXEC ALTA_Turno '20200611 07:50',8,5,'Debe estar en ayunas el paciente'

ALTER PROC ALTA_Turno(
			@fecha char(14),--20200611 12:00
			@idpaciente paciente,
			@idmedico medico,
			@observacion observacion=''
			)
AS
--Para que no muestre el mensaje "(1 row(s) affected)"
SET NOCOUNT ON

IF NOT EXISTS (SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno (fechaTurno,estado,observacion)
	VALUES (@fecha,0,@observacion)

	DECLARE @auxIdturno turno
	--SE AGREGA EL ULTIMO ID INSERTADO EN LA TABLA TURNO; SE OBTIENE CON LA VARIABLE DE SISTEMA @@IDENTITY
	SET @auxIdturno = @@IDENTITY

	INSERT INTO TurnoPaciente(idturno,idPaciente,idMedico)
	VALUES (@auxIdturno,@idpaciente,@idmedico)

	PRINT 'El turno se agrego correctamente'

	
END

ELSE
BEGIN
	PRINT 'El truno ya existe'
END
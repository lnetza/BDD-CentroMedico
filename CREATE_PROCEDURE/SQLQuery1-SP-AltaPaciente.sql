
--ALTER: Modifica le STORE
--CREATE: crea el STORE 
--EXEC: ejecuta el store

EXEC ALTA_Paciente '23256991','German','Jimenez','20200611','Puerta de Metal','MX','3324568790','mockers@gmail.com','datos ficticios'


ALTER proc ALTA_Paciente(
			@dni varchar(20),
			@nombre varchar(50),
			@apellido varchar(50),
			@fNacimiento varchar(8),
			@domicilio varchar(50),
			@idPais char(3),
			@telefono varchar(20)='',
			@email varchar(30),
			@observacion varchar(100)='' 
			)

as

IF NOT EXISTS(SELECT * FROM Paciente WHERE dni=@dni)
BEGIN
	INSERT INTO Paciente (dni,nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)
	VALUES (@dni,@nombre,@apellido,@fNacimiento,@domicilio,@idPais,@telefono,@email,@observacion)
	PRINT 'El paciente se agrego correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El paciente ya existe'
	RETURN
END
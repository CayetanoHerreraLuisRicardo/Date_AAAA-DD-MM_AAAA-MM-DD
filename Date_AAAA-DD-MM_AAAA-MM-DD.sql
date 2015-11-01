CREATE FUNCTION [dbo].[fnStrFechaFormato]
(	
	@Cadena VARCHAR(30)
)
	RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @FechaFormato VARCHAR(20)
	DECLARE @SubCadena varchar(7)
	DECLARE @PosGuion int
	DECLARE @Anio varchar (4)
	DECLARE @Mes varchar (2)
	DECLARE @Dia varchar (2)
	SET @PosGuion	=	0
	SET @Anio		=	''

	WHILE  LEN(@Cadena)> 0
	BEGIN
		SET @PosGuion = CHARINDEX('-', @Cadena )
		IF ( @PosGuion=0 )
		BEGIN
			SET @SubCadena = @Cadena
			SET @Cadena = ''
		END
		ELSE
		BEGIN
			SET @SubCadena = SUBSTRING( @Cadena , 1  , @PosGuion-1)
			SET @Cadena = SUBSTRING( @Cadena , @PosGuion + 1 , LEN(@Cadena))
			IF(@Anio='')	SET @Anio =	@SubCadena
			SET @Mes =	@SubCadena
			SET @Dia =	@Cadena
		END 
	END
	SET @FechaFormato=@Anio+'-'+@Dia+'-'+@Mes
	RETURN @FechaFormato
END

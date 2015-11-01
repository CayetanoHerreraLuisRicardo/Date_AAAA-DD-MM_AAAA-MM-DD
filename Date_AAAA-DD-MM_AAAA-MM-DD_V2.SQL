	DECLARE @FechaFormato VARCHAR(30)
	DECLARE @SubCadena VARCHAR(30)
	DECLARE @PosGuion INT
	DECLARE @PosEsp INT
	DECLARE @Anio VARCHAR (4)
	DECLARE @Mes VARCHAR (2)
	DECLARE @Dia VARCHAR (2)
	DECLARE @Hora VARCHAR (1000)
	DECLARE @Cadena VARCHAR(30) 
	DECLARE @Cadena2 VARCHAR(30)
	SET @Cadena= '2012-06-14 23:02:22.630'
	SET @Cadena2= @Cadena
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
	SET @PosEsp=0
	SET @SubCadena=''
	SET @Hora=''
	WHILE  LEN(@Cadena2)> 0
	BEGIN
		SET @PosEsp = CHARINDEX(' ', @Cadena2 )
		IF ( @PosEsp=0 )
		BEGIN
			SET @SubCadena = @Cadena2
			SET @Cadena2 = ''
		END
		ELSE
		BEGIN
			SET @Cadena2 = SUBSTRING( @Cadena2 , @PosEsp + 1 , LEN(@Cadena2))
			SET @Hora +=@Cadena2
		END
	END
	SET @FechaFormato= @Anio+'-'+@Dia+'-'+@Mes+' '+@Hora
	PRINT @FechaFormato

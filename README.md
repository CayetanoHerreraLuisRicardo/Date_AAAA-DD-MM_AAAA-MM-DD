# Date_AAAA-DD-MM_AAAA-MM-DD
FUNCION QUE TE RECIBA UN PARAMETRO DE TIPO VARCHAR CON FORMATO 'AAAA-MM-DD'  Y TE RETORNE EL FORMATO CORRECTO 
O QUE EL SERVIDOR INTERPRETE COMO TAL  'AAAA-DD-MM'

DECLARE @FORMATOAAAMMDD VARCHAR (10)

SET @FORMATOAAAMMDD= '2012-06-14 23:02:22.630'

DECLARE @FORMATOAAADDMM VARCHAR (10)

SET @FORMATOAAADDMM= dbo.fnStrFechaFormato(@FORMATOAAAMMDD)

PRINT @FORMATOAAADDMM



-- ###   WINDOW FUNCTIONS (FUN��ES DE JANELA)   ###
-- ################################################

--       C�LCULO DE ACUMULADO NO SQL SERVER      --



-- 1. CONTEXTUALIZA��O
-- Window Functions s�o func�es especiais que nos permitem criar c�lculos mais avan�ados no SQL,
-- como:

-- a) Acumulado no tempo
-- b) M�dia m�vel
-- c) Deslocamento
-- d) Ranking
-- e) MoM (Month over Month) e YoY (Year over Year)

-- Nesta aula, vamos aprender a fazer um c�lculo de acumulado no tempo.

-- 2. SINTAXE
-- Utilizamos a seguinte sintaxe para fazer um c�lculo de acumulado:
/*

SELECT
	coluna1,
	coluna2,
	coluna3,
	SUM(coluna1) OVER(ORDER BY coluna2 ROWS BETWEEN linha1 AND linha2) AS acumulado
FROM
	tabela
ORDER BY coluna2



Onde:

coluna1: � a coluna que tem os valores que queremos somar
coluna2: � a coluna de datas para que a fun��o entenda que se trata de um acumulado no tempo
linha1: a partir de qual linha queremos fazer o acumulado
linha2: at� qual linha queremos fazer o acumulado

*/



CREATE DATABASE Teste;

CREATE TABLE Resultado(
Data_Fechamento DATETIME,
Faturamento_MM FLOAT);


INSERT INTO Resultado(Data_Fechamento, Faturamento_MM)
VALUES
	('01/01/2020', 8),
	('01/02/2020', 10),
	('01/03/2020', 6),
	('01/04/2020', 9),
	('01/05/2020', 5),
	('01/06/2020', 4),
	('01/07/2020', 7),
	('01/08/2020', 11),
	('01/09/2020', 9),
	('01/10/2020', 12),
	('01/11/2020', 11),
	('01/12/2020', 10);

SELECT * FROM Resultado;

-- Resolu��o:

SELECT
	Data_Fechamento,
	Faturamento_MM,
	SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Acumulado
FROM Resultado
ORDER BY Data_Fechamento;


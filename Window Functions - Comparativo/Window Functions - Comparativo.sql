
-- ###   WINDOW FUNCTIONS (FUN��ES DE JANELA)   ###
-- ################################################

--       C�LCULO DE COMPARATIVO NO SQL SERVER      --


-- 1. CONTEXTUALIZA��O
-- Window Functions s�o func�es especiais que nos permitem criar c�lculos mais avan�ados no SQL,
-- como:

-- a) Acumulado no tempo
-- b) M�dia m�vel
-- c) Deslocamento
-- d) Ranking
-- e) Comparativos: MoM (Month over Month) e YoY (Year over Year)

-- Nesta aula, vamos aprender a fazer um c�lculo de COMPARATIVO no tempo.

-- 2. SINTAXE
-- Utilizamos a seguinte sintaxe para fazer um c�lculo de comparativo:
/*

SELECT
	coluna1,
	coluna2,
	coluna3,
	LAG(coluna1, deslocamento, padrao) OVER(ORDER BY coluna2)
FROM
	tabela
ORDER BY coluna2



Onde:

coluna1: � a coluna que tem os valores que queremos comparar
coluna2: � a coluna de datas para que a fun��o entenda que se trata de um comparativo no tempo
deslocamento: quantas linhas pra tr�s ou pra frente queremos deslocar
padrao: valor padr�o se ele desloca pra tr�s e n�o encontra nada

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


-- Qual � a varia��o MoM de faturamento? Obs: Considere o faturamento de dez/2019 como sendo 5 (milh�es).
-- Resolu��o:

SELECT
	Data_Fechamento,
	Faturamento_MM,
	LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) AS mes_anterior,
	ROUND(Faturamento_MM/LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) - 1, 2) 'VAR. % MoM'
FROM
	Resultado
ORDER BY Data_Fechamento;

-- ###   WINDOW FUNCTIONS (FUNÇÕES DE JANELA)   ###
-- ################################################

--       CÁLCULO DE COMPARATIVO NO SQL SERVER      --


-- 1. CONTEXTUALIZAÇÃO
-- Window Functions são funcões especiais que nos permitem criar cálculos mais avançados no SQL,
-- como:

-- a) Acumulado no tempo
-- b) Média móvel
-- c) Deslocamento
-- d) Ranking
-- e) Comparativos: MoM (Month over Month) e YoY (Year over Year)

-- Nesta aula, vamos aprender a fazer um cálculo de COMPARATIVO no tempo.

-- 2. SINTAXE
-- Utilizamos a seguinte sintaxe para fazer um cálculo de comparativo:
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

coluna1: é a coluna que tem os valores que queremos comparar
coluna2: é a coluna de datas para que a função entenda que se trata de um comparativo no tempo
deslocamento: quantas linhas pra trás ou pra frente queremos deslocar
padrao: valor padrão se ele desloca pra trás e não encontra nada

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


-- Qual é a variação MoM de faturamento? Obs: Considere o faturamento de dez/2019 como sendo 5 (milhões).
-- Resolução:

SELECT
	Data_Fechamento,
	Faturamento_MM,
	LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) AS mes_anterior,
	ROUND(Faturamento_MM/LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) - 1, 2) 'VAR. % MoM'
FROM
	Resultado
ORDER BY Data_Fechamento;
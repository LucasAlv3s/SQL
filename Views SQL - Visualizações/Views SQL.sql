-- ##########     CRIANDO VIEWS NO SQL       ##########

-- Selecione a tabela DimCustomer do Banco de Dados

SELECT * FROM DimCustomer




-- Selecione apenas os clientes do tipo 'Person'

SELECT * FROM DimCustomer
WHERE CustomerType = 'Person'














/*
- O QUE � UMA VIEW?

Uma View (ou traduzindo, uma exibi��o), � uma tabela virtual criada a partir de uma consulta a uma ou mais tabelas (ou at� mesmo de outras views) no banco de dados.


- CRIANDO, ALTERANDO E EXCLUINDO VIEWS

Quando falamos em Views, existem 3 a��es envolvidas:

1.	Cria��o de uma View
2.	Altera��o de uma View
3.	Exclus�o de uma View

Para cada uma dessas a��es, temos um comando associado:
1.	CREATE VIEW
2.	ALTER VIEW
3.	DROP VIEW


*/


-- CREATE VIEW: CRIE UMA VIEW PARA ARMAZENAR APENAS OS CLIENTES DO TIPO 'PERSON'

CREATE VIEW vwExemplo AS
SELECT * FROM DimCustomer
WHERE CustomerType = 'Person'

SELECT * FROM vwExemplo










-- ALTER VIEW: ALTERE A VIEW CRIADA PARA INCLUIR OS CLIENTES DO TIPO 'COMPANY'.

CREATE OR ALTER VIEW vwExemplo AS
SELECT * FROM DimCustomer
WHERE CustomerType = 'Company'

SELECT * FROM vwExemplo








-- DROP VIEW: EXCLUA A VIEW CRIADA


DROP VIEW vwExemplo







/*
- POR QUE CRIAR UMA VIEW?

1.	Reutiliza��o: Sempre que necess�rio, podemos consultar aquela View, pois ela fica armazenada no sistema.

2.	Seguran�a: Ao criar uma View, estamos ocultando linhas ou colunas da tabela original do banco de dados. Desta forma, apenas algumas informa��es relevantes ser�o visualizadas na View.

3.	Simplifica��o: Quando criamos Views, estamos poupando o tempo de recriar v�rios SELECTs, o que aumenta a produtividade.
*/
-- ##########     CRIANDO VIEWS NO SQL       ##########

-- Selecione a tabela DimCustomer do Banco de Dados

SELECT * FROM DimCustomer




-- Selecione apenas os clientes do tipo 'Person'

SELECT * FROM DimCustomer
WHERE CustomerType = 'Person'














/*
- O QUE É UMA VIEW?

Uma View (ou traduzindo, uma exibição), é uma tabela virtual criada a partir de uma consulta a uma ou mais tabelas (ou até mesmo de outras views) no banco de dados.


- CRIANDO, ALTERANDO E EXCLUINDO VIEWS

Quando falamos em Views, existem 3 ações envolvidas:

1.	Criação de uma View
2.	Alteração de uma View
3.	Exclusão de uma View

Para cada uma dessas ações, temos um comando associado:
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

1.	Reutilização: Sempre que necessário, podemos consultar aquela View, pois ela fica armazenada no sistema.

2.	Segurança: Ao criar uma View, estamos ocultando linhas ou colunas da tabela original do banco de dados. Desta forma, apenas algumas informações relevantes serão visualizadas na View.

3.	Simplificação: Quando criamos Views, estamos poupando o tempo de recriar vários SELECTs, o que aumenta a produtividade.
*/
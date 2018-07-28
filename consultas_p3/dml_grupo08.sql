/* 01. Crie uma view que lista os clientes (ID_CLIENTE, NOME) que
compraram produtos com desconto superior a 20% e são do
sexo feminino.*/
CREATE OR REPLACE VIEW PROD_DESCONTO
AS SELECT c.ID_CLIENTE, c.NOME
FROM CLIENTE c, ITENS_VENDA i, PRODUTO p
WHERE i.ID_PROD = p.ID_PROD AND i.DESCONTO > 20 AND c.SEXO = 'F';


/*02. Liste as matrículas dos supervisores dos empregados que
venderam produtos da categoria 'Higiene' no mês de maio de
2018.*/
SELECT DISTINCT e.SUPERVISOR
FROM EMPREGADO e, VENDA v, ITENS_VENDA i, PRODUTO p, CATEGORIA c
WHERE v.MATRICULA = e.MATRICULA AND TO_CHAR(DT_VENDA, 'YYYY') = 2018 AND TO_CHAR(DT_VENDA, 'MM') = 05 AND i.ID_VENDA = v.ID_VENDA AND i.ID_PROD = p.ID_PROD AND c.NOME = 'Higiene' AND p.ID_CATEGORIA = c.ID_CATEGORIA;

/*03. Mostre o(s) nome(s) do(s) fornecedor(s) do(s) produto(s) mais
vendido(s) (produtos que estão em mais vendas)*/


/*04. Crie uma view que mostra o nome da transportadora e o volume
em dinheiro acumulado de frete para produtos entregues no
mês de abril de 2018.*/


/*05. Crie uma view que mostra o nome da categoria e o total em
dinheiro dos produtos por categoria, com data de validade até
12/07/2018.*/


/*06. Mostre o cliente feminino que mais comprou e o cliente
masculino que menos comprou(ID_CLIENTE, ENDEREÇO,
SEXO)*/


/*07. Liste os dependentes nascidos no ano de 2005 que possuem
“Silva” como sobrenome*/


/*08. Quais produtos não foram vendidos nos anos de 2015 e 2016*/
SELECT p.NOME
FROM PRODUTO p, VENDA v, ITENS_VENDA i
WHERE i.ID_VENDA = v.ID_VENDA AND p.ID_PROD = i.ID_PROD AND TO_CHAR(v.DT_VENDA, 'YYYY') != '2015' AND TO_CHAR(v.DT_VENDA, 'YYYY') != '2016';

/*09. Mostre o total gasto por pessoas que moram no bairro da Prata
com produtos da categoria 'Utensílios'. (ID_CLIENTE,
TOTAL_GASTO)*/


/*10. Mostre as matrículas, nomes, funções e salários dos
empregados que ganham acima da média.*/


/*11. Crie um trigger que toda vez que o total de uma venda inserida
for superior a R$300,00 coloca o frete daquela venda como
gratuito.*/


/*12. Crie um trigger para toda vez que a data de entrega for
atualizada, se a mesma ultrapassar 30 dias da data da venda,
inserir um bônus do valor do frete no cliente que fez a compra.*/


/*13. Crie uma visão que mostra o nome do produto e o nome do seu
fornecedor para todos os produtos descontinuados, mesmo que
não tenham fornecedor associado (null no campo id_forn da
tabela Produto).*/
CREATE OR REPLACE VIEW PROD_DESCONTINUADO
AS SELECT p.nome, f.nome as nomeFornecedor
	       FROM PRODUTO p, FORNECEDOR f
	       WHERE p.DESCONTINUADO = 'S' and p.ID_FORN = f.ID_FORN ;

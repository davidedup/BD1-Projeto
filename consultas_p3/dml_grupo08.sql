/* 01. Crie uma view que lista os clientes (ID_CLIENTE, NOME) que
compraram produtos com desconto superior a 20% e são do
sexo feminino.*/
CREATE OR REPLACE VIEW PROD_DESCONTO
AS SELECT DISTINCT c.ID_CLIENTE, c.NOME
FROM CLIENTE c, ITENS_VENDA i, PRODUTO p
WHERE i.ID_PROD = p.ID_PROD AND i.DESCONTO > 0.2 AND c.SEXO = 'F';


/*02. Liste as matrículas dos supervisores dos empregados que
venderam produtos da categoria 'Higiene' no mês de maio de
2018.*/
SELECT DISTINCT e.SUPERVISOR
FROM EMPREGADO e, VENDA v, ITENS_VENDA i, PRODUTO p, CATEGORIA c
WHERE v.MATRICULA = e.MATRICULA AND TO_CHAR(DT_VENDA, 'YYYY') = 2018 AND TO_CHAR(DT_VENDA, 'MM') = 05 AND i.ID_VENDA = v.ID_VENDA AND i.ID_PROD = p.ID_PROD AND c.NOME = 'Higiene' AND p.ID_CATEGORIA = c.ID_CATEGORIA;

/*03. Mostre o(s) nome(s) do(s) fornecedor(s) do(s) produto(s) mais
vendido(s) (produtos que estão em mais vendas)*/
SELECT DISTINCT f.NOME
FROM
    FORNECEDOR f,
    PRODUTO p,
    (SELECT ID_PROD
     FROM (SELECT ID_PROD, COUNT(*) AS QTD_OCORRENCIAS FROM ITENS_VENDA GROUP BY ID_PROD)
     WHERE QTD_OCORRENCIAS = (SELECT MAX(QTD_OCORRENCIAS) FROM (SELECT ID_PROD, COUNT(*) AS QTD_OCORRENCIAS FROM ITENS_VENDA GROUP BY ID_PROD))) i
WHERE i.ID_PROD = p.ID_PROD AND p.ID_FORN = f.ID_FORN;

/*04. Crie uma view que mostra o nome da transportadora e o volume
em dinheiro acumulado de frete para produtos entregues no
mês de abril de 2018.*/

CREATE OR REPLACE VIEW TOTALFRETEABRIL(FNOME, FFRETE)
AS SELECT T.NOME, sum(V.FRETE)
FROM VENDA V, TRANSPORTADORA T
WHERE V.ID_TRANSP = T.ID_TRANSP  AND (EXTRACT(MONTH FROM V.DT_ENTREGA)) = 04 AND (EXTRACT(YEAR FROM V.DT_ENTREGA)) = 2018 GROUP BY T.NOME, T.ID_TRANSP;

/*05. Crie uma view que mostra o nome da categoria e o total em
dinheiro dos produtos por categoria, com data de validade até
12/07/2018.*/
CREATE OR REPLACE VIEW CATEGORIA_TOTAL(NOME, TOTAL_DINHEIRO)
AS SELECT c.NOME, SUM(i.QUANTIDADE * i.PRECO_UNITARIO * (1 - i.DESCONTO))
FROM CATEGORIA c, PRODUTO p, ITENS_VENDA i
WHERE p.DT_VALIDADE <= TO_DATE('2018-07-12', 'YYYY-MM-DD') AND i.ID_PROD = p.ID_PROD AND p.ID_CATEGORIA = c.ID_CATEGORIA
GROUP BY c.NOME;

/*06. Mostre o cliente feminino que mais comprou e o cliente
masculino que menos comprou(ID_CLIENTE, ENDEREÇO,
SEXO)*/
SELECT * FROM
	(   
	SELECT c.NOME, c.ID_CLIENTE, c.SEXO, c.END_RUA, c.END_NUM, c.END_BAIRRO, c.END_CIDADE, c.END_ESTADO, c.END_PAIS, c.END_CEP
	FROM VENDA v, CLIENTE c 
	WHERE v.ID_CLIENTE = c.ID_CLIENTE and c.SEXO = 'F'
	GROUP BY c.NOME, c.ID_CLIENTE, c.SEXO, c.END_RUA, c.END_NUM, c.END_BAIRRO, c.END_CIDADE, c.END_ESTADO, c.END_PAIS, c.END_CEP 
	ORDER BY COUNT(v.ID_CLIENTE) DESC
	)
WHERE ROWNUM = 1
UNION
SELECT * FROM
	(   
	SELECT c.NOME, c.ID_CLIENTE, c.SEXO, c.END_RUA, c.END_NUM, c.END_BAIRRO, c.END_CIDADE, c.END_ESTADO, c.END_PAIS, c.END_CEP
	FROM VENDA v, CLIENTE c 
	WHERE v.ID_CLIENTE = c.ID_CLIENTE and c.SEXO = 'M'
	GROUP BY c.NOME, c.ID_CLIENTE, c.SEXO, c.END_RUA, c.END_NUM, c.END_BAIRRO, c.END_CIDADE, c.END_ESTADO, c.END_PAIS, c.END_CEP 
	ORDER BY COUNT(v.ID_CLIENTE)
	)
WHERE ROWNUM = 1;


/*07. Liste os dependentes nascidos no ano de 2005 que possuem
“Silva” como sobrenome*/
SELECT d.*
FROM CLIENTE c, DEPENDENTE d
WHERE c.ID_CLIENTE = d.ID_CLIENTE AND TO_CHAR(d.DT_NASC, 'YYYY') = 2005 AND (d.NOME LIKE '% Silva' OR d.NOME LIKE '% Silva %');

/*08. Quais produtos não foram vendidos nos anos de 2015 e 2016*/
SELECT *
FROM PRODUTO
MINUS
SELECT p.*
FROM PRODUTO p, ITENS_VENDA i, VENDA v
WHERE v.ID_VENDA = i.ID_VENDA AND i.ID_PROD = p.ID_PROD AND (TO_CHAR(v.DT_VENDA, 'YYYY') = 2015 OR TO_CHAR(v.DT_VENDA, 'YYYY') = 2016);


/*09. Mostre o total gasto por pessoas que moram no bairro da Prata
com produtos da categoria 'Utensílios'. (ID_CLIENTE,
TOTAL_GASTO)*/
SELECT c.ID_CLIENTE, SUM((v.FRETE + ((i.PRECO_UNITARIO * i.QUANTIDADE) * (1 - i.DESCONTO)))) AS TOTAL_GASTO
FROM CLIENTE c, VENDA v, ITENS_VENDA i, PRODUTO p, CATEGORIA cat
WHERE c.END_BAIRRO = 'Prata'
    AND c.ID_CLIENTE = v.ID_CLIENTE
    AND v.ID_VENDA = i.ID_VENDA
    AND i.ID_PROD = p.ID_PROD
    AND p.ID_CATEGORIA = cat.ID_CATEGORIA
    AND cat.NOME = 'Utensílios'
GROUP BY c.ID_CLIENTE;

/*10. Mostre as matrículas, nomes, funções e salários dos
empregados que ganham acima da média.*/

SELECT MATRICULA, NOME, FUNCAO, SALARIO
FROM EMPREGADO
WHERE SALARIO > (SELECT AVG(SALARIO) 
                 FROM EMPREGADO);

/*11. Crie um trigger que toda vez que o total de uma venda inserida
for superior a R$300,00 coloca o frete daquela venda como
gratuito.*/
CREATE OR REPLACE TRIGGER VERIFICAR_FRETE
AFTER INSERT ON ITENS_VENDA
FOR EACH ROW
WHEN (((NEW.PRECO_UNITARIO - (NEW.DESCONTO * NEW.PRECO_UNITARIO)) * NEW.QUANTIDADE) > 300)
BEGIN
    UPDATE VENDA V
    SET V.FRETE = 0
    WHERE V.ID_VENDA = :NEW.ID_VENDA;
END VERIFICAR_FRETE;


/*12. Crie um trigger para toda vez que a data de entrega for
atualizada, se a mesma ultrapassar 30 dias da data da venda,
inserir um bônus do valor do frete no cliente que fez a compra.*/

CREATE OR REPLACE TRIGGER BONUS
AFTER UPDATE OF DT_ENTREGA ON VENDA
FOR EACH ROW
WHEN (NEW.DT_VENDA - NEW.DT_ENTREGA > 30)
BEGIN
    UPDATE CLIENTE
    SET BONUS = BONUS + :NEW.FRETE
    WHERE ID_CLIENTE = :NEW.ID_CLIENTE;
END BONUS;

/*13. Crie uma visão que mostra o nome do produto e o nome do seu
fornecedor para todos os produtos descontinuados, mesmo que
não tenham fornecedor associado (null no campo id_forn da
tabela Produto).*/
CREATE OR REPLACE VIEW DESCONTINUADOS AS( 
SELECT F.NOME, P.NOME as PRODUTONOME
	FROM FORNECEDOR F
	FULL JOIN PRODUTO P
	ON F.ID_FORN = P.ID_FORN
	WHERE P.DESCONTINUADO = 'S');

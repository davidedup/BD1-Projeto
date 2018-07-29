delete from ITENS_VENDA;
delete from VENDA;
delete from EMPREGADO;
delete from PRODUTO;
delete from FORNECEDOR;
delete from CATEGORIA;
delete from CLIENTE;
delete from TRANSPORTADORA;

insert into CLIENTE values (0, '09788554574', 'Joaquim Douglas', 'Pinto Filho', 'Sr', TO_DATE('2003/05/03', 'yyyy/mm/dd') , 'M', 'Rua Joao Salvino', '312B', 'Campina Grande', 'Araxá', 'PB', 'Brasil', '5840610', '83894615424', 'douglas@gmail.com', 0);
insert into CLIENTE values (1, '02341243478', 'Otávio Almeida', 'Alves', 'Sr', TO_DATE('1965/07/13', 'yyyy/mm/dd') , 'M', 'Rua da BR 040', '1113', 'Valparaíso', 'Centro', 'GO', 'Brasil', '5149290', '83542417091', 'otavio@gmail.com', 0);
insert into CLIENTE values (2, '79261213553', 'Thiago', 'Gomes Dias', 'Sr', TO_DATE('1932/11/30', 'yyyy/mm/dd') , 'M', 'Rua Joao Salvino', '312B', 'Campina Grande', 'Araxá', 'PB', 'Brasil', '5840610', '83894615424', 'douglas@gmail.com', 0);
insert into CLIENTE values (3, '90828471308', 'Estevan Douglas', 'Pinto Filho', 'Sir', TO_DATE('2003/05/03', 'yyyy/mm/dd') , 'M', 'Rua Joao Salvino', '312B', 'Campina Grande', 'Almeida', 'PB', 'Brasil', '5840610', '83894615424', 'douglas@gmail.com', 0);
insert into CLIENTE values (4, '44299554574', 'Isabella', 'Rocha Costa', 'Sra', TO_DATE('1980/09/19', 'yyyy/mm/dd') , 'F', 'Rua Travessa Juarez Honorate', '1811', 'Criciúma', 'Acara', 'PB', 'Brasil', '5831210', '31334915424', 'isabela@gmail.com', 0);
insert into CLIENTE values (5, '29724894172', 'Bruna', 'Carvalho Ferreira', 'Sra', TO_DATE('1985/03/30', 'yyyy/mm/dd') , 'F', 'Rua das Mangueiras', '1750', 'Campina Grande', 'Monte Santo', 'PB', 'Brasil', '5842100', '8389461124', 'bruna@gmail.com', 0);
insert into CLIENTE values (6, '81895346213', 'Enzo', 'Barbosa Gomes', 'Sir', TO_DATE('1994/05/03', 'yyyy/mm/dd') , 'M', 'Rua Joao Rezende', '1985', 'Campina Grande', 'Pedregal', 'PB', 'Brasil', '5840312', '-', 'enzo@gmail.com', 0);
insert into CLIENTE values (7, '96885646615', 'Vladmir', 'Ulyanovsky Lenin', 'Sir', TO_DATE('1870/04/22', 'yyyy/mm/dd') , 'M', 'Rua Praça Vermelha', '1917B', 'Moscou', 'Kremlin', 'MO', 'Rússia', '5240512', '-', 'lenin@cccp.su', 0);
insert into CLIENTE values (5, '29724894172', 'Ivyna', 'Carvalho Ferreira', 'Sra', TO_DATE('1985/03/30', 'yyyy/mm/dd') , 'F', 'Rua das Mangueiras', '1750', 'Campina Grande', 'Monte Santo', 'PB', 'Brasil', '5842100', '8389461124', 'bruna@gmail.com', 0);


insert into DEPENDENTE values (0, 6, 'Enzinho', 'M', TO_DATE('1994/05/03', 'yyyy/mm/dd'));
insert into DEPENDENTE values (1, 7, 'Luís inácio Lula da Silva', 'M', TO_DATE('2005/10/27', 'yyyy/mm/dd'));
insert into DEPENDENTE values (2, 6, 'Maria Silva Pereira', 'F', TO_DATE('1997/12/04', 'yyyy/mm/dd'));


insert into TRANSPORTADORA values (0, 'Correios', 'correios@correios.com');
insert into TRANSPORTADORA values (1, 'SEDEX', 'sedex@cae.com');
insert into TRANSPORTADORA values (2, 'FEDEx', 'fede@x.com');

insert into FORNECEDOR values (0, 'Unilever', 'unilever@uni.com', 'Rua São paulo', '98745468794', 'www.unilever.com');
insert into FORNECEDOR values (1, 'Toddy', 'toddy@toddy.com', 'Avenida Rio de Jan', '1328199182', 'www.toddy.com');
insert into FORNECEDOR values (2, 'Omo', 'omo@omo.com', 'Avenida Omo', '1328139182', 'www.omo.com');
insert into FORNECEDOR values (3, 'Nissin', 'nissin@nissin.com', 'Avenida Nissin', '1112392', 'www.nissin.com');


insert into CATEGORIA values (0, 'Higiene');
insert into CATEGORIA values (1, 'Laticíneos');
insert into CATEGORIA values (2, 'Higiene Pessoal');
insert into CATEGORIA values (3, 'Frutas');
insert into CATEGORIA values (4, 'Livraria');
insert into CATEGORIA values (5, 'Massas');


insert into PRODUTO values (0, 'Absorvente Always 20 unidades', 6.99, 5, 'N', TO_DATE('2017/08/27', 'yyyy/mm/dd'),  TO_DATE('2020/12/30', 'yyyy/mm/dd'), 0, 2);
insert into PRODUTO values (1, 'Toddynho 200ml', 1.89, 10, 'N', TO_DATE('2018/04/22', 'yyyy/mm/dd'),  TO_DATE('2018/08/30', 'yyyy/mm/dd'), 1, 1);
insert into PRODUTO values (2, 'Toddy em pó 300mg', 3.89, 10, 'N', TO_DATE('2018/03/12', 'yyyy/mm/dd'),  TO_DATE('2019/03/12', 'yyyy/mm/dd'), 1, 1);
insert into PRODUTO values (3, 'Sabão em Pó Omo 1Kg', 11.89, 7, 'N', TO_DATE('2017/10/10', 'yyyy/mm/dd'),  TO_DATE('2022/08/01', 'yyyy/mm/dd'), 2, 0);
insert into PRODUTO values (4, 'Miojo Turma da Monica', 0.99, 10, 'N', TO_DATE('2017/11/28', 'yyyy/mm/dd'),  TO_DATE('2022/11/28', 'yyyy/mm/dd'), 3, 5);
insert into PRODUTO values (5, 'Dove creme pos banho', 12.69, 7, 'N', TO_DATE('2017/02/19', 'yyyy/mm/dd'),  TO_DATE('2023/02/19', 'yyyy/mm/dd'), 0, 2);
insert into PRODUTO values (6, 'Água sanitária Uni', 2.69, 7, 'N', TO_DATE('2017/02/19', 'yyyy/mm/dd'),  TO_DATE('2023/02/19', 'yyyy/mm/dd'), 0, 0);
insert into PRODUTO values (7, 'Creme de Leite Nestlé', 1.19, 5, 'N', TO_DATE('2017/12/13', 'yyyy/mm/dd'),  TO_DATE('2018/07/12', 'yyyy/mm/dd'), 0, 1);
insert into PRODUTO values (8, 'Chamyto', 0.39, 5, 'N', TO_DATE('2018/02/13', 'yyyy/mm/dd'),  TO_DATE('2018/06/20', 'yyyy/mm/dd'), 0, 1);
insert into PRODUTO values (9, 'Creme Dental Colgate', 0.89, 5, 'N', TO_DATE('2017/03/16', 'yyyy/mm/dd'),  TO_DATE('2018/06/25', 'yyyy/mm/dd'), 0, 2);

insert into EMPREGADO values (0, 'Maria Costa', 'Gerente', TO_DATE('1993/10/01', 'yyyy/mm/dd'), TO_DATE('2011/01/14', 'yyyy/mm/dd'), 'Rua Floriano Peixoto', 1500, NULL);
insert into EMPREGADO values (1, 'Carlos Eduardo', 'Vendedor', TO_DATE('1997/09/29', 'yyyy/mm/dd'), TO_DATE('2011/01/14', 'yyyy/mm/dd'), 'Rua das Flores', 1200, 0);
insert into EMPREGADO values (2, 'Marcos da Silva', 'Suporvisor', TO_DATE('1980/05/26', 'yyyy/mm/dd'), TO_DATE('1995/05/06' , 'yyyy/mm/dd'), 'Rua legal', 1400, 0);
insert into EMPREGADO values (3, 'Joaquina Peres', 'Vendedor', TO_DATE('1995/05/06' , 'yyyy/mm/dd'), TO_DATE('1995/05/06' , 'yyyy/mm/dd'), 'Rua legal', 800, 2);

insert into VENDA values (0, TO_DATE('2018/07/10', 'yyyy/mm/dd'), 10, 'Rua do Sol', TO_DATE('2018/05/22', 'yyyy/mm/dd'), 0, 4, 1);
insert into VENDA values (1, TO_DATE('2018/05/01', 'yyyy/mm/dd'), 15, 'Rua da Lua', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 1, 4, 1);
insert into VENDA values (2, TO_DATE('2018/05/12', 'yyyy/mm/dd'), 16, 'Rua da Terra', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 2, 1, 1);
insert into VENDA values (3, TO_DATE('2018/05/13', 'yyyy/mm/dd'), 89, 'Rua da Felicidade', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 2, 5, 1);
insert into VENDA values (4, TO_DATE('2018/05/13', 'yyyy/mm/dd'), 13, 'Rua da Sol', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 0, 6, 3);
insert into VENDA values (5, TO_DATE('2017/05/13', 'yyyy/mm/dd'), 13, 'Rua da Sol', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 0, 6, 3);
insert into VENDA values (6, TO_DATE('2015/05/13', 'yyyy/mm/dd'), 16, 'Rua da Sol', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 0, 6, 3);
insert into VENDA values (7, TO_DATE('2016/05/13', 'yyyy/mm/dd'), 17, 'Rua da Sol', TO_DATE('2018/04/22', 'yyyy/mm/dd'), 0, 6, 3);


insert into ITENS_VENDA values (0, 1.89, 50, 10, 0, 1);
insert into ITENS_VENDA values (1, 3.89, 50, 20, 0, 2);
insert into ITENS_VENDA values (2, 1.89, 50, 0, 1, 1);
insert into ITENS_VENDA values (3, 3.89, 50, 0, 1, 2);
insert into ITENS_VENDA values (4, 1.89, 50, 10, 2, 1);
insert into ITENS_VENDA values (5, 3.89, 50, 30, 2, 2);
insert into ITENS_VENDA values (6, 6.99, 1, 20, 3, 0);
insert into ITENS_VENDA values (7, 6.89, 2, 0.4, 1, 3);
insert into ITENS_VENDA values (8, 0.99, 1, 20, 4, 4);
insert into ITENS_VENDA values (9, 12.0, 3, 10, 4, 5);
insert into ITENS_VENDA values (10, 1.99, 2, 20, 4, 6);
insert into ITENS_VENDA values (11, 1.99, 2, 19, 4, 6);
insert into ITENS_VENDA values (12, 1.99, 50, 0, 0, 6);
insert into ITENS_VENDA values (13, 1.50, 5, 10, 0, 7);
insert into ITENS_VENDA values (14, 0.50, 20, 0, 0, 8);
insert into ITENS_VENDA values (15, 1.00, 50, 0, 0, 9);
insert into ITENS_VENDA values (16, 1.50, 5, 10, 1, 7);


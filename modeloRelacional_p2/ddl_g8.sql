DROP TABLE venda_produto;
DROP TABLE produto;
DROP TABLE venda;
DROP TABLE dependente;
DROP TABLE cliente;
DROP TABLE telefone_transportadora;
DROP TABLE transportadora;
DROP TABLE telefone_empregado;
DROP TABLE atuacao_empregado;
DROP TABLE empregado;
DROP TABLE regiao;
DROP TABLE fornecedor;
DROP TABLE categoria;

CREATE TABLE cliente (
    idCliente INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    sobrenome VARCHAR(128) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    titulo_tratamento VARCHAR(20) NOT NULL,
    dt_nascimento DATE NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    rua VARCHAR(128) NOT NULL,
    num INT,
    bairro VARCHAR(128) NOT NULL,
    cidade VARCHAR(128) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    cep VARCHAR(9) NOT NULL
);

CREATE TABLE fornecedor (
    idFornecedor INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL,
    endereco VARCHAR(128) NOT NULL,
    telefone INT,
    homepage VARCHAR(128) NOT NULL
);

CREATE TABLE transportadora (
    idTransportadora INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL
);

CREATE TABLE empregado (
    matricula INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    mat_supervisor INT,
    nome VARCHAR(128) NOT NULL,
    funcao VARCHAR(128) NOT NULL,
    dt_nascimento DATE NOT NULL,
    dt_contrato DATE NOT NULL,
    endereco VARCHAR(128) NOT NULL,
    salario FLOAT(20),
    
    FOREIGN KEY (mat_supervisor) REFERENCES empregado(matricula)
);

CREATE TABLE venda (
    idVenda INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    id_cliente INT,
    id_transportadora INT,
    matricula INT,
    frete VARCHAR(128) NOT NULL,
    endereco VARCHAR(128) NOT NULL,
    dt_entrega VARCHAR(10) NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (id_transportadora) REFERENCES transportadora(idTransportadora),
    FOREIGN KEY (matricula) REFERENCES empregado(matricula)  
);

CREATE TABLE categoria (
    idCategoria INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE produto (
    idProduto INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    id_categoria INT,
    id_fornecedor INT,
    nome VARCHAR(128) NOT NULL,
    preco_compra FLOAT(20),
    margem_lucro FLOAT(20),
    descontinuado FLOAT(20),
    dt_fabric DATE NOT NULL,
    dt_validade DATE NOT NULL,
    
    FOREIGN KEY (id_categoria) REFERENCES categoria(idCategoria),
    FOREIGN KEY (id_fornecedor)  REFERENCES fornecedor(idFornecedor)
);

CREATE TABLE telefone_empregado (
    matricula INT,
    numero INT,
    codigo INT,
    operadora VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (matricula, numero),
    FOREIGN KEY (matricula) REFERENCES empregado(matricula)
);

CREATE TABLE telefone_transportadora (
    idTransportadora INT,
    numero INT,
    codigo INT,
    operadora VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (idTransportadora, numero),
    FOREIGN KEY (idTransportadora) REFERENCES transportadora(idTransportadora)
);

CREATE TABLE regiao (
    idRegiao INT GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE dependente (
    idDependente INT,
    idCliente INT,
    nome VARCHAR(128) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    dt_nascimento DATE NOT NULL,
    
    PRIMARY KEY (idDependente, idCliente),
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE venda_produto (
    idVenda INT,
    idProduto INT,
    preco_unitario FLOAT(20),
    quantidade INT,
    desconto FLOAT(20),
    
    PRIMARY KEY (idVenda, idProduto),
    FOREIGN KEY (idVenda) REFERENCES venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

CREATE TABLE atuacao_empregado (
    matricula INT,
    idRegiao INT,
    
    PRIMARY KEY (matricula, idRegiao),
    FOREIGN KEY (matricula) REFERENCES empregado(matricula),
    FOREIGN KEY (idRegiao) REFERENCES regiao(idRegiao)
);

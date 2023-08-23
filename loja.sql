CREATE DATABASE loja;

USE loja;

CREATE TABLE fornecedores (
  cnpj VARCHAR(14) PRIMARY KEY,
  razao_social VARCHAR(40),
  insc_estadual VARCHAR(20),
  endereco VARCHAR(50),
  bairro VARCHAR(50),
  estado CHAR(2),
  telefone VARCHAR(20),
  email VARCHAR(60)

  PRIMARY KEY(cnpj)
);

CREATE TABLE produtos (
    codProdutos INT(8) NOT NULL,
    descricao VARCHAR(50),
    categoria VARCHAR(30),
    classificacao VARCHAR(20),
    numeracao VARCHAR(10),
    modelo VARCHAR(20),
    cor VARCHAR(10)
    forn_cnpj DECIMAL(14),
    PRIMARY KEY(codProdutos),
    FOREIGN KEY(forn_cnpj) REFERENCES fornecedores(cnpj)
);

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  telefone VARCHAR(20),
  data_nascimento DATE,
  endereco VARCHAR(100),
  cidade VARCHAR(40),
  estado CHAR(2),
  cep CHAR(8)

  PRIMARY KEY(nome)
);

CREATE TABLE vendas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  produto_id INT,
  data_venda DATE,
  quantidade INT,
  valor_total DECIMAL(10,2),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)

  PRIMARY KEY(cliente_id)
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  produto_id INT,
  data_pedido DATE,
  _status VARCHAR(20),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)

  PRIMARY KEY(cliente_id)
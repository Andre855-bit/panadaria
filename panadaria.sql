-- apagando banco de dados se existir

drop database dbpanadaria;

-- criando bando de dados

create database dbpanadaria;

-- acessar banco de dados

use dbpanadaria;

create table tbgenero(
cod_gen int not null,
nome_gen varchar(100),
primary key(cod_gen));


create table tbfuncionario(
cod_fun int not null auto_increment,
nome_fun varchar(50) not null,
email_fun varchar(50),
tel_fun char(10),
dataNasc_fun datetime,
salario_fun decimal (9,2) default 0 check(salario_fun >= 0),
sexo_fun char(1) default "X" check(sexo_fun in("F","M")),
cod_gen int not null,
primary key (cod_fun),
foreign key (cod_gen) references tbgenero(cod_gen));

create table tbusuarios(
cod_usu int not null auto_increment,
nome_usu varchar(50) not null,
senha_usu varchar(12) not null,
cod_fun int not null,
primary key (cod_usu),
foreign key (cod_fun) references tbfuncionario(cod_fun));

create table tbFornecedor(
cod_forn int not null,
nome_forn varchar(100),
email_forn varchar(30),
tel_forn char(10),
primary key(cod_forn));

create table tbProdutos(
cod_prod int not null auto_increment,
desc_prod varchar(100),
quant_prod int,
preco_prod decimal(5,2),
dataVal_prod datetime,
lote_prod varchar(10),
cod_forn int not null,
primary key(cod_prod),
foreign key (cod_forn) references tbFornecedor(cod_forn));

create table tbCliente(
cod_clie int not null auto_increment,
nome varchar(100) not null,
cpf_clie char(14) not null unique,
email_clie varchar(100),
primary key(cod_clie));

create table tbVendas(
cod_ven int not null auto_increment,
data_ven date,
hora_ven time,
quant_ven decimal default 0 check(quant_ven >= 0),
valor_ven decimal default 0 check(valor_ven >= 0),
cod_prod int not null,
cod_usu int not null,
cod_clie int not null,
primary key(cod_ven),
foreign key(cod_prod) references tbProdutos(cod_prod),
foreign key(cod_usu) references tbusuarios(cod_usu),
foreign key(cod_clie) references tbCliente(cod_clie));


show tables;

desc tbusuarios;
desc tbfuncionario;
desc tbgenero;
desc tbFornecedor;
desc tbProdutos;
desc tbCliente;
desc tbVendas;
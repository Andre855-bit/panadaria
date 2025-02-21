-- apagando banco de dados se existir

drop database dbpanadaria;

-- criando bando de dados

create database dbpanadaria;

-- acessar banco de dados

use dbpanadaria;


create table tbfuncionario(
cod_fun int not null auto_increment,
nome_fun varchar(50) not null,
email_fun varchar(50) unique,
tel_fun char(10),
dataNasc_fun datetime,
salario_fun decimal (9,2) default 0 check(salario_fun >= 0),
sexo_fun char(1) default "X" check(sexo_fun in("F","M")),
primary key (cod_fun));

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
email_clie varchar(100) unique,
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

--Inserindo registros na tabelas

insert into tbCliente(nome,cpf_clie,email_clie) values ('Marcos','213.456.879-12','exemplo@exemplo.com');
insert into tbCliente(nome,cpf_clie,email_clie) values ('Tocatins','173.455.875-12','estado@exemplo.com');

insert into tbFornecedor (nome_forn,email_forn,tel_forn) values('Verduras SA','verduras@exemplo.com','97586-9586');

insert into tbfuncionario(nome_fun,email_fun,tel_fun,dataNasc_fun,salario_fun,sexo_fun) values ('Rainundo','rainundo@exemplo.com','45564-6124','1987-02-14',1707.21,'M');
insert into tbfuncionario(nome_fun,email_fun,tel_fun,dataNasc_fun,salario_fun,sexo_fun) values ('José','jose@exemplo.com','21874-6872','1994-07-11',1387.00,'M');

insert into tbusuarios(nome_usu,senha_usu,cod_fun) values('José','Jose123',2);
insert into tbusuarios(nome_usu,senha_usu,cod_fun) values('Rainundo','Rainundo123',1);


--Visualizando os registros nas tabelas

select * from tbCliente;
select * from tbFornecedor;
select * from tbfuncionario;
select * from tbusuarios;
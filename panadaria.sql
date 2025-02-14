-- apagando banco de dados se existir

drop database dbpanadaria;

-- criando bando de dados

create database dbpanadaria;

-- acessar banco de dados

use dbpanadaria;

create table tbusuarios(
cod_usu int not null auto_increment,
nome_usu varchar(50) not null,
senha_usu varchar(12) not null,
primary key (cod_usu)
);

create table tbfuncionario(
cod_fun int not null auto_increment,
nome_fun varchar(50) not null,
email_fun varchar(50),
tel_fun char(10),
dataNasc_fun datetime,
salario_fun decimal (9,2),
sexo_fun char(1),
primary key (cod_fun)

);

show tables;

desc tbusuarios;
desc tbfuncionario;
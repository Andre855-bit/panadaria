drop database dbpanadaria;

create database dbRedeDeTrabalho;

use dbrededetrabalho;

create table tbCliente(
cod_clie int not null auto_increment,
nome_clie varchar(100) not null,
tel_clie char(13),
cel_clie char(13) not null,
cpf_clie char(14) not null unique,
email_clie varchar(100) unique,
primary key(cod_clie));

desc tbCliente;

INSERT INTO tbCliente (nome, tel_clie, cel_clie, cpf_clie, email_clie)
VALUES 
('João Silva', '(11) 1234-5678', '(11) 98765-4321', '123.456.789-00', 'joao.silva@email.com'),
('Maria Oliveira', '(21) 2222-3333', '(21) 99999-8888', '987.654.321-00', 'maria.oliveira@email.com'),
('Carlos Santos', NULL, '(31) 98888-7777', '111.222.333-44', 'carlos.santos@email.com');

select * from tbCliente;

create table tbTrabalhador(
cod_trab int not null auto_increment,
nome_trab varchar(50) not null,
end_trab varchar(50) not null,
profis_trab varchar(30) not null,
email_trab varchar(50) not null unique,
tel_trab char(10),
cel_trab char(10) not null,
cpf_trab char(14) not null unique,
sexo_fun char(1) default "X" check(sexo_fun in("F","M")),
primary key (cod_trab));

desc tbTrabalhador;

INSERT INTO tbTrabalhador (nome_trab, end_trab, profis_trab, email_trab, tel_trab, cel_trab, cpf_trab, sexo_fun)  
VALUES  
('João Silva', 'Rua das Flores, 123', 'Engenheiro', 'joao.silva@email.com', '1122334455', '9912345678', '123.456.789-00', 'M'),  
('Maria Oliveira', 'Avenida Central, 456', 'Médica', 'maria.oliveira@email.com', '2233445566', '9923456789', '987.654.321-00', 'F'),  
('Carlos Santos', 'Praça da Sé, 789', 'Professor', 'carlos.santos@email.com', NULL, '9934567890', '456.789.123-00', 'M'); 

select * from tbTrabalhador;

create table tbServico(
cod_serv int not null auto_increment,
nome_serv varchar(50) not null,
desc_serv varchar(250) not null,
dura_serv datetime not null,
valor_serv decimal (5,2) not null,
cod_trab int not null,
incomodo_serv varchar(250),
primary key(cod_serv),
foreign key (cod_trab) references tbTrabalhador(cod_trab));

desc tbServico;

INSERT INTO tbServico (nome_serv, desc_serv, dura_serv, valor_serv, cod_trab, incomodo_serv)
VALUES 
('Reparo Elétrico', 'Troca de fiação e instalação de novos disjuntores', '2024-03-07 10:00:00', 350.00, 2, 'Possível interrupção de energia durante o serviço'),
('Pintura Residencial', 'Pintura interna de sala e quartos com tinta lavável', '2024-03-08 09:30:00', 500.00, 3, 'Cheiro forte de tinta por algumas horas'),
('Consultoria de Engenharia', 'Avaliação estrutural e recomendações para reforma', '2024-03-09 14:00:00', 750.00, 1, 'Necessário acesso a documentos estruturais do imóvel');

select * from tbServico;

create table tbPedidos(
cod_ped int not null auto_increment,
cod_clie int not null,
cod_trab int not null,
cod_serv int not null,
end_ped char(70) not null,
data_inic_ped date not null,
data_fim_ped date not null,
valor_final_ped decimal (8,2) not null,
hora_inic_ped time not null,
hora_fim_ped time not null,
primary key(cod_ped),
foreign key (cod_clie) references tbCliente(cod_clie),
foreign key (cod_trab) references tbTrabalhador(cod_trab),
foreign key (cod_serv) references tbServico(cod_serv));

desc tbPedidos;

INSERT INTO tbPedidos (cod_clie, cod_trab, cod_serv, end_ped, data_inic_ped, data_fim_ped, valor_final_ped, hora_inic_ped, hora_fim_ped)
VALUES 
(1, 2, 1, 'Rua das Palmeiras, 200', '2024-03-10', '2024-03-10', 350.00, '10:00:00', '12:30:00'),
(2, 3, 2, 'Av. São João, 789', '2024-03-12', '2024-03-12', 500.00, '09:30:00', '15:00:00'),
(3, 1, 3, 'Rua do Centro, 55', '2024-03-15', '2024-03-15', 750.00, '14:00:00', '17:30:00');

select * from tbPedidos;

create database if not exists Loja;
use Loja;


drop table if exists ContaReceber;
drop table if exists Cliente;
drop table if exists Municipio;
drop table if exists Estado;

-- Criar tabela Estado
create table Estado(
  ID int primary key auto_increment,
  Nome varchar(100) not null,
  UF varchar(2) not null
);


create table Municipio(
  ID int primary key auto_increment,
  FK_EstadoID int not null,
  Nome varchar(100) not null,
  codIBGE int not null,
  foreign key (FK_EstadoID) references Estado(ID)
);


create table Cliente(
  ID int primary key auto_increment,
  Nome varchar(80) not null,
  CPF varchar(11) not null,
  Celular varchar(11) not null,
  EndLogradouro varchar(100) not null,
  EndNumero varchar(10) not null,
  EndMunicipio int not null,
  FK_Municipio_ID int not null,
  EndCep char(8) not null,
  foreign key (FK_Municipio_ID) references Municipio(ID)
);


create table ContaReceber(
  ID int primary key auto_increment,
  FK_Cliente_ID int not null,
  FaturaVendaID int not null,
  DataConta date not null,
  DataVencimento date not null,
  Valor decimal(18,2) not null,
  Situacao enum('1','2','3') not null,
  foreign key (FK_Cliente_ID) references Cliente(ID)
);


INSERT INTO Estado (Nome, UF) VALUES
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Minas Gerais', 'MG');


INSERT INTO Municipio (FK_EstadoID, Nome, CodIBGE) VALUES
(1, 'São Luiz', 3550308),
(2, 'São João', 3304557),
(3, 'Santo Antonio', 3106200);


INSERT INTO Cliente (Nome, CPF, Celular, EndLogradouro, EndNumero, EndMunicipio, FK_Municipio_ID, EndCep) VALUES
('Weslley Ribeiro', '65877389430', '974679578', 'Rua A', '123', 1, 1, '75934733'),
('Heloise Cardoso', '75836574894', '983957648', 'Rua B', '456', 2, 2, '75927568'),
('Davi Soares', '97462857437', '975936583', 'Rua C', '789', 3, 3, '84905638');


INSERT INTO ContaReceber (FK_Cliente_ID, FaturaVendaID, DataConta, DataVencimento, Valor, Situacao) VALUES
(1, 105, '2024-08-05', '2025-11-15', 100, '1'),
(2, 106, '2024-07-09', '2025-12-13', 200, '2'),
(3, 107, '2024-09-17', '2025-12-22', 300, '3');

-- Apagar a view se já existir e criar de novo
drop view if exists ContasNaoPagas;

create view ContasNaoPagas as
select CR.ID as 'ID da Conta a receber',
       C.Nome as 'Nome do Cliente',
       C.CPF as 'CPF do Cliente',
       CR.DataVencimento as 'Data de Vencimento',
       CR.Valor as 'Valor da Conta'
from ContaReceber CR
join Cliente C on CR.FK_Cliente_ID = C.ID
where CR.Situacao = '1';

-- Consultas de teste
select * from Estado;
select * from Municipio;
select * from Cliente;
select * from ContaReceber;
select * from ContasNaoPagas;















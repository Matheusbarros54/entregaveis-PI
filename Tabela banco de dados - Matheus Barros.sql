CREATE DATABASE embatech;
USE embatech;

CREATE TABLE cadastro (
cpf_cnpj VARCHAR(15) PRIMARY KEY,
usuario VARCHAR(30) NOT NULL,
senha VARCHAR(30) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
telefone VARCHAR(15) NOT NULL UNIQUE,	
chave_de_acesso VARCHAR(20) NOT NULL);

CREATE TABLE sensor (
idsensor INT PRIMARY KEY AUTO_INCREMENT,
situacao VARCHAR(30),
CONSTRAINT chkStatus CHECK (situacao IN ('ligado', 'desligado')),
temperatura FLOAT,
localizacao VARCHAR(50),
CONSTRAINT chkLocal CHECK (localizacao IN ('máquina 1', 'máquina 2', 'máquina 3')),
ultima_leitura TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE embalagem (
idmolde INT PRIMARY KEY AUTO_INCREMENT,
material VARCHAR(20),
limite_temperatura FLOAT,
temperatura_ideal FLOAT);

INSERT INTO cadastro VALUES
('12345678901', 'Envolve', '426835917', 'corporativo@Envolve.com', '(11) 98765-4321', '#Kso@9)!'),
('98765432101', 'Embala Fácil', '309574682', 'atendimento@comerciodeferramentas.com', '(21) 12345-6789', 'RfTg#23a'),
('65432109801', 'Bright Embalagens Ltda', '718263945', 'servicos@transportadoraexpresso.com', '(31) 87654-3210', '7B$pQz&1'),
('23456789012', 'Maria Silva', '592817346', 'maria.silva@outlook.com', '(41) 56789-0123', 'XyZ#87*!'),
('34567890123', 'João Pereira', '134769528', 'joao.pereira@gmail.com', '(51) 43210-9876', '2@LmN&90');

INSERT INTO sensor VALUES
(DEFAULT, 'ligado', 25.5, 'máquina 1', DEFAULT),
(DEFAULT, 'desligado', 20.0, 'máquina 2', DEFAULT),
(DEFAULT, 'ligado', 28.3, 'máquina 3', DEFAULT),
(DEFAULT, 'desligado', 22.8, 'máquina 1', DEFAULT),
(DEFAULT, 'ligado', 26.7, 'máquina 2', DEFAULT);

INSERT INTO embalagem VALUES
(DEFAULT, 'Plástico', 100.0, 80.0),
(DEFAULT, 'Metal', 200.0, 150.0),
(DEFAULT, 'Papel', 80.0, 60.0),
(DEFAULT, 'Vidro', 150.0, 90.0),
(DEFAULT, 'Tecido', 90.0, 70.0);


select cpf_cnpj as 'Cpf / Cnpj', usuario as Usuário, 
senha as Senha, email as Email, telefone as Telefone, 
chave_de_acesso as 'Chave de Acesso' from cadastro;

select idsensor as Sensor, situacao as Situação, 
temperatura as Temperatura, localizacao as Localização, 
ultima_leitura as 'Última Leitura' from sensor;

Select idmolde as 'N° Embalagem', material as Material, 
limite_temperatura as 'Limite de Temperatura', 
temperatura_ideal as 'Temperatura Ideal' from embalagem;







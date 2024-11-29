CREATE DATABASE db_carros;
USE db_carros;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(9) NOT NULL UNIQUE,
    cor VARCHAR(50),
    foto VARCHAR(350),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('Carlos Souza', '111.222.333-44', 'carlos.souza@email.com', '97777-6666'),
('Ana Costa', '555.666.777-88', 'ana.costa@email.com', '96666-5555'),
('Fernanda Pereira', '444.555.666-77', 'fernanda.pereira@email.com', '95555-4444');

INSERT INTO veiculos (modelo, marca, ano, placa, cor, foto, id_cliente) VALUES
('Fusca', 'Volkswagen', 1975, 'ABC-1234', 'Azul', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7tYlzl7oOs4P6zDtwez2w1VhFt2PI2iEDMQ&s', 1),    
('Civic', 'Honda', 2020, 'XYZ-4321', 'Preto', 'https://cdn.awsli.com.br/2500x2500/2571/2571273/produto/240006136/aut-73222--01-z4wse987ma.jpg', 2),          
('Fiesta', 'Ford', 2015, 'LMN-9876', 'Branco', 'https://s3.ecompletocarros.dev/images/lojas/108/veiculos/69567/veiculoInfoVeiculoImagesMobile/vehicle_image_1628195194_d41d8cd98f00b204e9800998ecf8427e.jpeg', 1),         
('HB20', 'Hyundai', 2018, 'GHI-1234', 'Prata', 'https://cdn.motor1.com/images/mgl/ZBrK2/s3/hyundai-hb20s-2020-prata.jpg', 3),         
('Kwid', 'Renault', 2021, 'PQR-1234', 'Amarelo', 'https://dezeroacem.com.br/wp-content/uploads/2017/08/Renault-Kwid-amarelo-yellow.jpg', 2),       
('Onix', 'Chevrolet', 2017, 'STU-4321', 'Azul', 'https://conteudo.imguol.com.br/c/entretenimento/7c/2018/05/22/chevrolet-onix-2019-5-1527026394303_v2_750x421.jpg', 3);

SELECT *
FROM clientes
INNER JOIN veiculos
ON clientes.id_cliente = veiculos.id_cliente;
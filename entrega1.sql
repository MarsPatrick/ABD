CREATE TABLE EMPRESAREPARTO
(
	COD_REPARTO INT,
	NOM_EMPREPARTO VARCHAR(20),
	PRIMARY KEY(COD_REPARTO)
);

CREATE TABLE REGION
(
	COD_REGION INT,
	NOM_REGION VARCHAR(20),
	PRIMARY KEY(COD_REGION)
);

CREATE TABLE CIUDAD
(
	COD_CIUDAD INT,
	NOM_CIUDAD VARCHAR(20),
	COD_REGION INT,
	PRIMARY KEY(COD_CIUDAD),
	FOREIGN KEY (COD_REGION) REFERENCES REGION
);

CREATE TABLE EMPRENDEDOR
(
	COD_EMPRENDEDOR INT,
	NOM_COMERCIAL VARCHAR(20),
	NOM_DUENO VARCHAR(20),
	EMAIL VARCHAR(20),
	CUE_INSTAGRAM VARCHAR(20),
	CUE_FACEBOOK VARCHAR(20),
	COD_CIUDAD INT,
	PRIMARY KEY(COD_EMPRENDEDOR),
	FOREIGN KEY (COD_CIUDAD) REFERENCES CIUDAD
);

CREATE TABLE PRODUCTO 
(
	COD_PRODUCTO INT,
	NOM_PRODUCTO VARCHAR(20),
	UNI_MEDIDA VARCHAR(20),
	VALOR INT,
	STOCK INT,
	COD_EMPRENDEDOR INT,
	PRIMARY KEY(COD_PRODUCTO),
	FOREIGN KEY (COD_EMPRENDEDOR) REFERENCES EMPRENDEDOR
);

CREATE TABLE CLIENTE
(
	RUT_CLIENTE VARCHAR(20),
	NOM_CLIENTE VARCHAR(20),
	PRIMARY KEY(RUT_CLIENTE)
);

CREATE TABLE DIRECCION
(
	COD_DIRECCION INT,
	NOM_DIRECCION VARCHAR(20),
	CALLE VARCHAR(20),
	NUMERO INT,
	COD_CIUDAD INT,
	PRIMARY KEY(COD_DIRECCION),
	FOREIGN KEY (COD_CIUDAD) REFERENCES CIUDAD
);

CREATE TABLE COMPRA
(
	COD_COMPRA INT,
	METODO_PAGO VARCHAR(20),
	FECHA_COMPRA DATE,
	ESTADO VARCHAR(20),
	TOTAL_COMPRA INT,
	COD_DIRECCION INT,
	FOREIGN KEY (COD_DIRECCION) REFERENCES DIRECCION
);

CREATE TABLE EVALUA
(
	NOTA_PRODUCTO INTEGER,
	COMENTARIO_PRODUCTO VARCHAR(20),
	RUT_CLIENTE VARCHAR(20),
	COD_COMPRA INTEGER,
	PRIMARY KEY(RUT_CLIENTE),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA
);

CREATE TABLE REALIZA
(
	RUT_CLIENTE VARCHAR(20),
	COD_COMPRA INTEGER,
	PRIMARY KEY(RUT_CLIENTE),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA
);

CREATE TABLE ORIGINA
(
	CAN_PRODUCTO INT,
	TOTAL_PRODUCTO INT,
	COD_PRODUCTO INT,
	COD_COMPRA INT,
	FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO,
	FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA
);


CREATE TABLE TIENE
(
	RUT_CLIENTE VARCHAR(20),
	COD_DIRECCION INT,
	PRIMARY KEY(RUT_CLIENTE, COD_DIRECCION),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_DIRECCION) REFERENCES DIRECCION
);

CREATE TABLE ENVIO
(
	FECHA_ESTIMADA DATE,
	FECHA_REAL DATE,
	COD_DIRECCION INT,
	COD_COMPRA INT,
	COD_EMPRENDEDOR INT,
	COD_REPARTO INT,
	PRIMARY KEY(COD_EMPRENDEDOR, COD_REPARTO),
	FOREIGN KEY (COD_DIRECCION, COD_COMPRA) REFERENCES COMPRA,
	FOREIGN KEY (COD_EMPRENDEDOR) REFERENCES EMPRENDEDOR,
	FOREIGN KEY (COD_REPARTO) REFERENCES EMPRESAREPARTO
);

CREATE TABLE CUBRE
(
	COD_REPARTO INTEGER,
	COD_REGION INTEGER,
	PRIMARY KEY(COD_REGION, COD_REPARTO),
	FOREIGN KEY (COD_REGION) REFERENCES REGION,
	FOREIGN KEY (COD_REPARTO) REFERENCES EMPRESAREPARTO
);

DROP TABLE CUBRE;
DROP TABLE ENVIO;
DROP TABLE TIENE;
DROP TABLE ORIGINA;
DROP TABLE REALIZA;
DROP TABLE EVALUA;
DROP TABLE COMPRA;
DROP TABLE DIRECCION;
DROP TABLE CLIENTE;
DROP TABLE PRODUCTO;
DROP TABLE EMPRENDEDOR;
DROP TABLE CIUDAD;
DROP TABLE REGION;
DROP TABLE EMPRESAREPARTO;

1) EMPRENDEDOR QUE MAS VENTA TIENE EN SEPTIEMBRE
2) CLIENTES QUE NO COMPRAN DURANTE DESDE JULIO 2020

INSERT INTO EMPRESAREPARTO
VALUES	(1,'STARKEN'),
	(2,'CHILEXPRESS'),
	(3,'BLUEXPRESS'),
	(4,'CORREOSCHILE'),
	(5,'DHL'),
	(6,'FEDEX'),
	(7,'TNT');

INSERT INTO Region
Values 	(1,'Arica y Parinacota'),
	(2,'Tarapaca'),
	(3,'Antofagasta'),
	(4,'Atacama'),
	(5,'Coquimbo'),
	(6,'Valparaiso'),
	(7,'Metropolitana de Santiago'),
	(8,'Libertador General Bernardo O’Higgins'),
	(9,'Maule'),
	(10,'Ñuble'),
	(11,'Biobio'),
	(12,'La Araucania'),
	(13,'Los Rios'),
	(14,'Los Lagos'),
	(15,'Aysén del General Carlos Ibañez del Campo'),
	(16,'Magallanes y Antártica Chilena');

INSERT INTO Ciudad
Values	(1,'Arica',1),
	(2,'Iquique',2),
	(3,'Antofagasta',3),
	(4,'Copiapo',4),
	(5,'La Serena',5),
	(6,'Valparaiso',6),
	(7,'Santiago',7),
	(8,'Rancagua',8),
	(9,'Talca',9),
	(10,'Chillan',10),
	(11,'Concepcion',11),
	(12,'Temuco',12),
	(13,'Valdivia',13),
	(14,'Puerto Montt',14),
	(15,'Coyhaique',15),
	(16,'Punta Arenas',16);

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

INSERT INTO EMPRENDEDOR
Values	(1,'Plush Candy','Gregoria Lina Tapia Salgado','plushcandy@gmail.com','@plushcandy','PlushCandy',1),
	(2,'Fast Mobile','Alexander Ibai Pastor Carro','fastmobile@gmail.com','@fastmobile','fastmobile',2),
	(3,'','Delia Maravillas Palazon Villena','@gmail.com','@','',3),
	(4,'ChocoMan','Cesar Dario Arellano Mera','chocoman@gmail.com','@chocoman','chocoman',4),
	(5,'','Eulogio Younes Toribio Burgos','@gmail.com','@','',5),
	(6,'','Arantza Alejandra Vizcaino Serra','@gmail.com','@','',6),
	(7,'','Jaime Ernesto Fajardo Revilla','@gmail.com','@','',7),
	(8,'','Thiago Nelson Pacheco Flores','@gmail.com','@','',8),
	(9,'Tasty Pops','Julio Francisco Mata Villanueva','tastypops@gmail.com','@tastypops','TastyPops',9),
	(10,'SupraPhone','Cristina Lorenza Jurado Robles','supraphone@gmail.com','@supraphone','supraphone',10),
	(11,'','Mireia Aadelaida Melero Oviedo','@gmail.com','@','',11),
	(12,'WonderCacao','Maria Jesica Romero Guijarro','wondercacao@gmail.com','@wondercacao','wondercacao',12),
	(13,'','Sergio Modesto Quiñones Villena','@gmail.com','@','',13),
	(14,'','Faustina Jeronima Espinoza Barbera','@gmail.com','@','',14),
	(15,'','Rocio Dominga Arce Toro','@gmail.com','@','',15),
	(16,'','Jon Bernat Santamaria Barragan','@gmail.com','@','',16),

INSERT INTO PRODUCTO
Values	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),
	(1,'','',1,1,1),

INSERT INTO CLIENTE
Values	('11.066.621-7','Mirian Jessica Cantero Piñero'),
	('17.873.223-4','Amador Andres Jerez Garca'),
	('6.434.134-0','Casimiro Manolo Orozco Cobos'),
	('8.715.774-1','Luna Sarai Campillo Salas'),
	('17.186.593-k','Iker Fernando Mota Sousa'),
	('19.068.608-6','Moises Candido Segura Canales'),
	('18.211.726-9','Jennifer Elsa Reyes Quiñones'),
	('18.653.702-5','Maria Adela Fidalgo Mansilla'),
	('19.983.237-9','Jesus Axel Rodenas Zamorano'),
	('15.516.724-6','Edgar Baldomero Galera Ochoa'),
	('9.398.010-7','Mateo Jose Aguado Pardo'),
	('10.212.805-2','Alfonso Avelino Garriga Prats'),
	('18.384.256-0','Clotilde Anais Vallejo Roman'),
	('13.181.120-9','Gloria Myriam Garca Bosch'),
	('14.280.137-k','Luis Victor Guijarro Rocha'),
	('12.016.783-9','Sofia Antonia Capdevila Valencia'),

INSERT INTO COMPRA
Values	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),
	(1,'','','','',1),

INSERT INTO DIRECCION
Values	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),
	(1,'','',1,1),

INSERT INTO TIENE
Values	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),
	('',1),

INSERT INTO DESPACHO
Values	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),
	('',1,1,'//'),

INSERT INTO CUBRE
Values	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),
	(1,1),

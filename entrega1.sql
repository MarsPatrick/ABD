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
	PRIMARY KEY(COD_COMPRA),
	FOREIGN KEY (COD_DIRECCION) REFERENCES DIRECCION
);

CREATE TABLE EVALUA
(
	NOTA_PRODUCTO INTEGER,
	COMENTARIO_PRODUCTO VARCHAR(20),
	RUT_CLIENTE VARCHAR(20),
	COD_COMPRA INTEGER,
	PRIMARY KEY(RUT_CLIENTE, COD_COMPRA),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA
);

CREATE TABLE REALIZA
(
	RUT_CLIENTE VARCHAR(20),
	COD_COMPRA INTEGER,
	PRIMARY KEY(RUT_CLIENTE, COD_COMPRA),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA
);

CREATE TABLE ORIGINA
(
	CAN_PRODUCTO INT,
	TOTAL_PRODUCTO INT,
	COD_PRODUCTO INT,
	COD_COMPRA INT,
	PRIMARY KEY(COD_PRODUCTO, COD_COMPRA),
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
	PRIMARY KEY(COD_EMPRENDEDOR, COD_REPARTO, COD_COMPRA, COD_DIRECCION),
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

INSERT INTO EMPRESAREPARTO VALUES (1,'STARKEN');
INSERT INTO EMPRESAREPARTO VALUES (2,'CHILEXPRESS');
INSERT INTO EMPRESAREPARTO VALUES (3,'BLUEXPRESS');
INSERT INTO EMPRESAREPARTO VALUES (4,'CORREOSCHILE');
INSERT INTO EMPRESAREPARTO VALUES (5,'DHL');
INSERT INTO EMPRESAREPARTO VALUES (6,'FEDEX');
INSERT INTO EMPRESAREPARTO VALUES (7,'TNT');

INSERT INTO Region Values (1,'Arica y Parinacota');
INSERT INTO Region Values (2,'Tarapaca');
INSERT INTO Region Values (3,'Antofagasta');
INSERT INTO Region Values (4,'Atacama');
INSERT INTO Region Values (5,'Coquimbo');
INSERT INTO Region Values (6,'Valparaiso');
INSERT INTO Region Values (7,'Metropolitana de Santiago');
INSERT INTO Region Values (8,'Libertador General Bernardo O’Higgins');
INSERT INTO Region Values (9,'Maule');
INSERT INTO Region Values (10,'Ñuble');
INSERT INTO Region Values (11,'Biobio');
INSERT INTO Region Values (12,'La Araucania');
INSERT INTO Region Values (13,'Los Rios');
INSERT INTO Region Values (14,'Los Lagos');
INSERT INTO Region Values (15,'Aysén del General Carlos Ibañez del Campo');
INSERT INTO Region Values (16,'Magallanes y Antártica Chilena');

INSERT INTO Ciudad Values (1,'Arica',1);
INSERT INTO Ciudad Values (2,'Iquique',2);
INSERT INTO Ciudad Values (3,'Antofagasta',3);
INSERT INTO Ciudad Values (4,'Copiapo',4);
INSERT INTO Ciudad Values (5,'La Serena',5);
INSERT INTO Ciudad Values (6,'Valparaiso',6);
INSERT INTO Ciudad Values (7,'Santiago',7);
INSERT INTO Ciudad Values (8,'Rancagua',8);
INSERT INTO Ciudad Values (9,'Talca',9);
INSERT INTO Ciudad Values (10,'Chillan',10);
INSERT INTO Ciudad Values (11,'Concepcion',11);
INSERT INTO Ciudad Values (12,'Temuco',12);
INSERT INTO Ciudad Values (13,'Valdivia',13);
INSERT INTO Ciudad Values (14,'Puerto Montt',14);
INSERT INTO Ciudad Values (15,'Coyhaique',15);
INSERT INTO Ciudad Values (16,'Punta Arenas',16);

INSERT INTO EMPRENDEDOR Values (1,'Plush Candy','Gregoria Lina Tapia Salgado','plushcandy@gmail.com','@plushcandy','PlushCandy',1);
INSERT INTO EMPRENDEDOR Values (2,'Fast Mobile','Alexander Ibai Pastor Carro','fastmobile@gmail.com','@fastmobile','fastmobile',2);
INSERT INTO EMPRENDEDOR Values (3,'ChocoMan','Cesar Dario Arellano Mera','chocoman@gmail.com','@chocoman','chocoman',3);
INSERT INTO EMPRENDEDOR Values (4,'Tasty Pops','Julio Francisco Mata Villanueva','tastypops@gmail.com','@tastypops','TastyPops',4);
INSERT INTO EMPRENDEDOR Values (5,'SupraPhone','Cristina Lorenza Jurado Robles','supraphone@gmail.com','@supraphone','supraphone',5);
INSERT INTO EMPRENDEDOR Values (6,'WonderCacao','Maria Jesica Romero Guijarro','wondercacao@gmail.com','@wondercacao','wondercacao',6);
INSERT INTO EMPRENDEDOR Values (7,'Empresa7','Delia Maravillas Palazon Villena','Empresa7@gmail.com','@Empresa7','Empresa7',7);
INSERT INTO EMPRENDEDOR Values (8,'Empresa8','Eulogio Younes Toribio Burgos','Empresa8@gmail.com','@Empresa8','Empresa8',8);
INSERT INTO EMPRENDEDOR Values (9,'Empresa9','Arantza Alejandra Vizcaino Serra','Empresa9@gmail.com','@Empresa9','Empresa9',9);
INSERT INTO EMPRENDEDOR Values (10,'Empresa10','Jaime Ernesto Fajardo Revilla','Empresa10@gmail.com','@Empresa10','Empresa10',10);
INSERT INTO EMPRENDEDOR Values (11,'Empresa11','Thiago Nelson Pacheco Flores','Empresa11@gmail.com','@Empresa11','Empresa11',11);
INSERT INTO EMPRENDEDOR Values (12,'Empresa12','Mireia Aadelaida Melero Oviedo','Empresa12@gmail.com','@Empresa12','Empresa12',12);
INSERT INTO EMPRENDEDOR Values (13,'Empresa13','Sergio Modesto Quiñones Villena','Empresa13@gmail.com','@Empresa13','Empresa13',13);
INSERT INTO EMPRENDEDOR Values (14,'Empresa14','Faustina Jeronima Espinoza Barbera','Empresa14@gmail.com','@Empresa14','Empresa14',14);
INSERT INTO EMPRENDEDOR Values (15,'Empresa15','Rocio Dominga Arce Toro','Empresa15@gmail.com','@Empresa15','Empresa15',15);
INSERT INTO EMPRENDEDOR Values (16,'Empresa16','Jon Bernat Santamaria Barragan','Empresa16@gmail.com','@Empresa16','Empresa16',16);

INSERT INTO PRODUCTO Values (1,'Producto1','Unidad',1,1,1);
INSERT INTO PRODUCTO Values (2,'Producto2','Unidad',1,1,1);
INSERT INTO PRODUCTO Values (3,'Producto3','Unidad',1,1,2);
INSERT INTO PRODUCTO Values (4,'Producto4','Unidad',1,1,2);
INSERT INTO PRODUCTO Values (5,'Producto5','Unidad',1,1,3);
INSERT INTO PRODUCTO Values (6,'Producto6','Unidad',1,1,3);
INSERT INTO PRODUCTO Values (7,'Producto7','Unidad',1,1,4);
INSERT INTO PRODUCTO Values (8,'Producto8','Unidad',1,1,4);
INSERT INTO PRODUCTO Values (9,'Producto9','Unidad',1,1,5);
INSERT INTO PRODUCTO Values (10,'Producto10','Unidad',1,1,5);
INSERT INTO PRODUCTO Values (11,'Producto11','Unidad',1,1,6);
INSERT INTO PRODUCTO Values (12,'Producto12','Unidad',1,1,6);
INSERT INTO PRODUCTO Values (13,'Producto13','Unidad',1,1,7);
INSERT INTO PRODUCTO Values (14,'Producto14','Unidad',1,1,7);
INSERT INTO PRODUCTO Values (15,'Producto15','Unidad',1,1,8);
INSERT INTO PRODUCTO Values (16,'Producto16','Unidad',1,1,8);
INSERT INTO PRODUCTO Values (17,'Producto17','Unidad',1,1,9);
INSERT INTO PRODUCTO Values (18,'Producto18','Unidad',1,1,9);
INSERT INTO PRODUCTO Values (19,'Producto19','Unidad',1,1,10);
INSERT INTO PRODUCTO Values (20,'Producto20','Unidad',1,1,10);
INSERT INTO PRODUCTO Values (21,'Producto21','Unidad',1,1,11);
INSERT INTO PRODUCTO Values (22,'Producto22','Unidad',1,1,11);
INSERT INTO PRODUCTO Values (23,'Producto23','Unidad',1,1,12);
INSERT INTO PRODUCTO Values (24,'Producto24','Unidad',1,1,12);
INSERT INTO PRODUCTO Values (25,'Producto25','Unidad',1,1,13);
INSERT INTO PRODUCTO Values (26,'Producto26','Unidad',1,1,13);
INSERT INTO PRODUCTO Values (27,'Producto27','Unidad',1,1,14);
INSERT INTO PRODUCTO Values (28,'Producto28','Unidad',1,1,14);
INSERT INTO PRODUCTO Values (29,'Producto29','Unidad',1,1,15);
INSERT INTO PRODUCTO Values (30,'Producto30','Unidad',1,1,15);
INSERT INTO PRODUCTO Values (31,'Producto31','Unidad',1,1,16);
INSERT INTO PRODUCTO Values (32,'Producto32','Unidad',1,1,16);

INSERT INTO CLIENTE Values ('11.066.621-7','Mirian Jessica Cantero Piñero');
INSERT INTO CLIENTE Values ('17.873.223-4','Amador Andres Jerez Garca');
INSERT INTO CLIENTE Values ('6.434.134-0','Casimiro Manolo Orozco Cobos');
INSERT INTO CLIENTE Values ('8.715.774-1','Luna Sarai Campillo Salas');
INSERT INTO CLIENTE Values ('17.186.593-k','Iker Fernando Mota Sousa');
INSERT INTO CLIENTE Values ('19.068.608-6','Moises Candido Segura Canales');
INSERT INTO CLIENTE Values ('18.211.726-9','Jennifer Elsa Reyes Quiñones');
INSERT INTO CLIENTE Values ('18.653.702-5','Maria Adela Fidalgo Mansilla');
INSERT INTO CLIENTE Values ('19.983.237-9','Jesus Axel Rodenas Zamorano');
INSERT INTO CLIENTE Values ('15.516.724-6','Edgar Baldomero Galera Ochoa');
INSERT INTO CLIENTE Values ('9.398.010-7','Mateo Jose Aguado Pardo');
INSERT INTO CLIENTE Values ('10.212.805-2','Alfonso Avelino Garriga Prats');
INSERT INTO CLIENTE Values ('18.384.256-0','Clotilde Anais Vallejo Roman');
INSERT INTO CLIENTE Values ('13.181.120-9','Gloria Myriam Garca Bosch');
INSERT INTO CLIENTE Values ('14.280.137-k','Luis Victor Guijarro Rocha');
INSERT INTO CLIENTE Values ('12.016.783-9','Sofia Antonia Capdevila Valencia');

INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);
INSERT INTO DIRECCION Values (1,'','',1,1);

INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);
INSERT INTO COMPRA Values (1,'','','','',1);

INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);
INSERT INTO EVALUA Values (1,'','',1);

INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);
INSERT INTO REALIZA Values ('',1);

INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,1,1);

INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);
INSERT INTO TIENE Values ('',1);

INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');
INSERT INTO DESPACHO Values ('',1,1,'//');

INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);
INSERT INTO ENVIO Values ('','',1,1,1,1);

INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,1);

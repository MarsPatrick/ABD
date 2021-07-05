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
	FOREIGN KEY (COD_DIRECCION) REFERENCES COMPRA,
    FOREIGN KEY (COD_COMPRA) REFERENCES COMPRA,
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

1) EMPRENDEDOR QUE MAS VENTA TIENE EN SEPTIEMBRE (empresa 16)
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

INSERT INTO PRODUCTO Values (1,'Producto1','Unidad',5,100,1);
INSERT INTO PRODUCTO Values (2,'Producto2','Unidad',10,100,1);
INSERT INTO PRODUCTO Values (3,'Producto3','Unidad',15,100,2);
INSERT INTO PRODUCTO Values (4,'Producto4','Unidad',20,100,2);
INSERT INTO PRODUCTO Values (5,'Producto5','Unidad',25,100,3);
INSERT INTO PRODUCTO Values (6,'Producto6','Unidad',30,100,3);
INSERT INTO PRODUCTO Values (7,'Producto7','Unidad',35,100,4);
INSERT INTO PRODUCTO Values (8,'Producto8','Unidad',40,100,4);
INSERT INTO PRODUCTO Values (9,'Producto9','Unidad',45,100,5);
INSERT INTO PRODUCTO Values (10,'Producto10','Unidad',50,100,5);
INSERT INTO PRODUCTO Values (11,'Producto11','Unidad',55,100,6);
INSERT INTO PRODUCTO Values (12,'Producto12','Unidad',60,100,6);
INSERT INTO PRODUCTO Values (13,'Producto13','Unidad',65,100,7);
INSERT INTO PRODUCTO Values (14,'Producto14','Unidad',70,100,7);
INSERT INTO PRODUCTO Values (15,'Producto15','Unidad',75,100,8);
INSERT INTO PRODUCTO Values (16,'Producto16','Unidad',80,100,8);
INSERT INTO PRODUCTO Values (17,'Producto17','Unidad',85,100,9);
INSERT INTO PRODUCTO Values (18,'Producto18','Unidad',90,100,9);
INSERT INTO PRODUCTO Values (19,'Producto19','Unidad',95,100,10);
INSERT INTO PRODUCTO Values (20,'Producto20','Unidad',100,100,10);
INSERT INTO PRODUCTO Values (21,'Producto21','Unidad',105,100,11);
INSERT INTO PRODUCTO Values (22,'Producto22','Unidad',110,100,11);
INSERT INTO PRODUCTO Values (23,'Producto23','Unidad',115,100,12);
INSERT INTO PRODUCTO Values (24,'Producto24','Unidad',120,100,12);
INSERT INTO PRODUCTO Values (25,'Producto25','Unidad',125,100,13);
INSERT INTO PRODUCTO Values (26,'Producto26','Unidad',130,100,13);
INSERT INTO PRODUCTO Values (27,'Producto27','Unidad',135,100,14);
INSERT INTO PRODUCTO Values (28,'Producto28','Unidad',140,100,14);
INSERT INTO PRODUCTO Values (29,'Producto29','Unidad',145,100,15);
INSERT INTO PRODUCTO Values (30,'Producto30','Unidad',150,100,15);
INSERT INTO PRODUCTO Values (31,'Producto31','Unidad',155,100,16);
INSERT INTO PRODUCTO Values (32,'Producto32','Unidad',160,100,16);

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

INSERT INTO DIRECCION Values (1,'Nombre1','Calle1',1,1);
INSERT INTO DIRECCION Values (2,'Nombre2','Calle2',2,2);
INSERT INTO DIRECCION Values (3,'Nombre3','Calle3',3,3);
INSERT INTO DIRECCION Values (4,'Nombre4','Calle4',4,4);
INSERT INTO DIRECCION Values (5,'Nombre5','Calle5',5,5);
INSERT INTO DIRECCION Values (6,'Nombre6','Calle6',6,6);
INSERT INTO DIRECCION Values (7,'Nombre7','Calle7',7,7);
INSERT INTO DIRECCION Values (8,'Nombre8','Calle8',8,8);
INSERT INTO DIRECCION Values (9,'Nombre9','Calle9',9,9);
INSERT INTO DIRECCION Values (10,'Nombre10','Calle10',10,10);
INSERT INTO DIRECCION Values (11,'Nombre11','Calle11',11,11);
INSERT INTO DIRECCION Values (12,'Nombre12','Calle12',12,12);
INSERT INTO DIRECCION Values (13,'Nombre13','Calle13',13,13);
INSERT INTO DIRECCION Values (14,'Nombre14','Calle14',14,14);
INSERT INTO DIRECCION Values (15,'Nombre15','Calle15',15,15);
INSERT INTO DIRECCION Values (16,'Nombre16','Calle16',16,16);

INSERT INTO COMPRA Values (1,'Efectivo','01/06/2020','Pendiente',1,1);
INSERT INTO COMPRA Values (2,'Efectivo','02/06/2020','Pendiente',1,2);
INSERT INTO COMPRA Values (3,'Efectivo','03/06/2020','Pendiente',1,3);
INSERT INTO COMPRA Values (4,'Efectivo','04/06/2020','Pendiente',1,4);
INSERT INTO COMPRA Values (5,'Efectivo','05/06/2020','Pendiente',1,1);
INSERT INTO COMPRA Values (6,'Efectivo','06/06/2020','Pendiente',1,2);
INSERT INTO COMPRA Values (7,'Efectivo','07/06/2020','Pendiente',1,3);
INSERT INTO COMPRA Values (8,'Efectivo','08/06/2020','Pendiente',1,4);
INSERT INTO COMPRA Values (9,'Transferencia','01/07/2020','Pendiente',1,5);
INSERT INTO COMPRA Values (10,'Transferencia','02/07/2020','Pendiente',1,6);
INSERT INTO COMPRA Values (11,'Transferencia','03/07/2020','Pendiente',1,7);
INSERT INTO COMPRA Values (12,'Transferencia','04/07/2020','Pendiente',1,8);
INSERT INTO COMPRA Values (13,'Transferencia','05/07/2020','Pendiente',1,5);
INSERT INTO COMPRA Values (14,'Transferencia','06/07/2020','Pendiente',1,6);
INSERT INTO COMPRA Values (15,'Transferencia','07/07/2020','Pendiente',1,7);
INSERT INTO COMPRA Values (16,'Transferencia','08/07/2020','Pendiente',1,8);
INSERT INTO COMPRA Values (17,'Cheque','01/08/2020','Pendiente',1,9);
INSERT INTO COMPRA Values (18,'Cheque','02/08/2020','Pendiente',1,10);
INSERT INTO COMPRA Values (19,'Cheque','03/08/2020','Pendiente',1,11);
INSERT INTO COMPRA Values (20,'Cheque','04/08/2020','Pendiente',1,12);
INSERT INTO COMPRA Values (21,'Cheque','05/08/2020','Pendiente',1,9);
INSERT INTO COMPRA Values (22,'Cheque','06/08/2020','Pendiente',1,10);
INSERT INTO COMPRA Values (23,'Cheque','07/08/2020','Pendiente',1,11);
INSERT INTO COMPRA Values (24,'Cheque','08/08/2020','Pendiente',1,12);
INSERT INTO COMPRA Values (25,'Tarjeta','01/09/2020','Pendiente',1,13);
INSERT INTO COMPRA Values (26,'Tarjeta','02/09/2020','Pendiente',1,14);
INSERT INTO COMPRA Values (27,'Tarjeta','03/09/2020','Pendiente',1,15);
INSERT INTO COMPRA Values (28,'Tarjeta','04/09/2020','Pendiente',1,16);
INSERT INTO COMPRA Values (29,'Tarjeta','05/09/2020','Pendiente',1,13);
INSERT INTO COMPRA Values (30,'Tarjeta','06/09/2020','Pendiente',1,14);
INSERT INTO COMPRA Values (31,'Tarjeta','07/09/2020','Pendiente',1,15);
INSERT INTO COMPRA Values (32,'Tarjeta','08/09/2020','Pendiente',1,16);

INSERT INTO EVALUA Values (1,'Comentario','11.066.621-7',1);
INSERT INTO EVALUA Values (1,'Comentario','17.873.223-4',1);
INSERT INTO EVALUA Values (1,'Comentario','6.434.134-0',1);
INSERT INTO EVALUA Values (1,'Comentario','8.715.774-1',1);
INSERT INTO EVALUA Values (1,'Comentario','17.186.593-k',1);
INSERT INTO EVALUA Values (1,'Comentario','19.068.608-6',1);
INSERT INTO EVALUA Values (1,'Comentario','18.211.726-9',1);
INSERT INTO EVALUA Values (1,'Comentario','18.653.702-5',1);
INSERT INTO EVALUA Values (1,'Comentario','19.983.237-9',1);
INSERT INTO EVALUA Values (1,'Comentario','15.516.724-6',1);
INSERT INTO EVALUA Values (1,'Comentario','9.398.010-7',1);
INSERT INTO EVALUA Values (1,'Comentario','10.212.805-2',1);
INSERT INTO EVALUA Values (1,'Comentario','18.384.256-0',1);
INSERT INTO EVALUA Values (1,'Comentario','13.181.120-9',1);
INSERT INTO EVALUA Values (1,'Comentario','14.280.137-k',1);
INSERT INTO EVALUA Values (1,'Comentario','12.016.783-9',1);

#Antes de julio
INSERT INTO REALIZA Values ('11.066.621-7',1);
INSERT INTO REALIZA Values ('11.066.621-7',2);
INSERT INTO REALIZA Values ('18.211.726-9',3);
INSERT INTO REALIZA Values ('18.211.726-9',4);
INSERT INTO REALIZA Values ('18.653.702-5',5);
INSERT INTO REALIZA Values ('18.653.702-5',6);

#Antes y en julio
INSERT INTO REALIZA Values ('6.434.134-0',7);
INSERT INTO REALIZA Values ('6.434.134-0',9);

#Antes y Despues de julio
INSERT INTO REALIZA Values ('8.715.774-1',8);
INSERT INTO REALIZA Values ('8.715.774-1',17);

#En julio
INSERT INTO REALIZA Values ('17.873.223-4',10);
INSERT INTO REALIZA Values ('17.873.223-4',11);
INSERT INTO REALIZA Values ('19.983.237-9',12);
INSERT INTO REALIZA Values ('19.983.237-9',13);
INSERT INTO REALIZA Values ('15.516.724-6',14);
INSERT INTO REALIZA Values ('15.516.724-6',15);

#En y despues de julio
INSERT INTO REALIZA Values ('19.068.608-6',16);
INSERT INTO REALIZA Values ('19.068.608-6',18;

#Despues de julio
INSERT INTO REALIZA Values ('17.186.593-k',19);
INSERT INTO REALIZA Values ('17.186.593-k',20);
INSERT INTO REALIZA Values ('9.398.010-7',21);
INSERT INTO REALIZA Values ('9.398.010-7',22);
INSERT INTO REALIZA Values ('10.212.805-2',23);
INSERT INTO REALIZA Values ('10.212.805-2',24);
INSERT INTO REALIZA Values ('18.384.256-0',25);
INSERT INTO REALIZA Values ('18.384.256-0',26);
INSERT INTO REALIZA Values ('13.181.120-9',27);
INSERT INTO REALIZA Values ('13.181.120-9',28);
INSERT INTO REALIZA Values ('14.280.137-k',29);
INSERT INTO REALIZA Values ('14.280.137-k',30);
INSERT INTO REALIZA Values ('12.016.783-9',31);
INSERT INTO REALIZA Values ('12.016.783-9',32);

INSERT INTO ORIGINA Values (1,1,1,1);
INSERT INTO ORIGINA Values (1,1,2,2);
INSERT INTO ORIGINA Values (1,1,3,3);
INSERT INTO ORIGINA Values (1,1,4,4);
INSERT INTO ORIGINA Values (1,1,5,5);
INSERT INTO ORIGINA Values (1,1,6,6);
INSERT INTO ORIGINA Values (1,1,7,7);
INSERT INTO ORIGINA Values (1,1,8,8);
INSERT INTO ORIGINA Values (1,1,9,9);
INSERT INTO ORIGINA Values (1,1,10,10);
INSERT INTO ORIGINA Values (1,1,11,11);
INSERT INTO ORIGINA Values (1,1,12,12);
INSERT INTO ORIGINA Values (1,1,13,13);
INSERT INTO ORIGINA Values (1,1,14,14);
INSERT INTO ORIGINA Values (1,1,15,15);
INSERT INTO ORIGINA Values (1,1,16,16);
INSERT INTO ORIGINA Values (1,1,17,17);
INSERT INTO ORIGINA Values (1,1,18,18);
INSERT INTO ORIGINA Values (1,1,19,19);
INSERT INTO ORIGINA Values (1,1,20,20);
INSERT INTO ORIGINA Values (1,1,22,21);
INSERT INTO ORIGINA Values (1,1,24,22);
INSERT INTO ORIGINA Values (1,1,26,23);
INSERT INTO ORIGINA Values (1,1,28,24);
INSERT INTO ORIGINA Values (1,1,30,25);
INSERT INTO ORIGINA Values (1,1,30,26);
INSERT INTO ORIGINA Values (1,1,30,27);
INSERT INTO ORIGINA Values (1,1,31,28);
INSERT INTO ORIGINA Values (1,1,31,29);
INSERT INTO ORIGINA Values (1,1,32,30);
INSERT INTO ORIGINA Values (1,1,32,31);
INSERT INTO ORIGINA Values (1,1,32,32);

INSERT INTO TIENE Values ('11.066.621-7',1);
INSERT INTO TIENE Values ('17.873.223-4',2);
INSERT INTO TIENE Values ('6.434.134-0',3);
INSERT INTO TIENE Values ('8.715.774-1',4);
INSERT INTO TIENE Values ('17.186.593-k',5);
INSERT INTO TIENE Values ('19.068.608-6',6);
INSERT INTO TIENE Values ('18.211.726-9',7);
INSERT INTO TIENE Values ('18.653.702-5',8);
INSERT INTO TIENE Values ('19.983.237-9',9);
INSERT INTO TIENE Values ('15.516.724-6',10);
INSERT INTO TIENE Values ('9.398.010-7',11);
INSERT INTO TIENE Values ('10.212.805-2',12);
INSERT INTO TIENE Values ('18.384.256-0',13);
INSERT INTO TIENE Values ('13.181.120-9',14);
INSERT INTO TIENE Values ('14.280.137-k',15);
INSERT INTO TIENE Values ('12.016.783-9',16);

INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);
INSERT INTO ENVIO Values ('01/01/01','01/01/01',1,1,1,1);

INSERT INTO CUBRE Values (1,1);
INSERT INTO CUBRE Values (1,2);
INSERT INTO CUBRE Values (1,3);
INSERT INTO CUBRE Values (2,4);
INSERT INTO CUBRE Values (2,5);
INSERT INTO CUBRE Values (2,6);
INSERT INTO CUBRE Values (3,7);
INSERT INTO CUBRE Values (3,8);
INSERT INTO CUBRE Values (4,9);
INSERT INTO CUBRE Values (4,10);
INSERT INTO CUBRE Values (5,11);
INSERT INTO CUBRE Values (5,12);
INSERT INTO CUBRE Values (6,13);
INSERT INTO CUBRE Values (6,14);
INSERT INTO CUBRE Values (7,15);
INSERT INTO CUBRE Values (7,16);

(
	CREATE TABLE EMPRESAREPARTO
	(
		COD_REPARTO INTEGER,
		NOM_EMPREPARTO VARCHAR(20),
		PRIMARY KEY(COD_REPARTO)
	);

	CREATE TABLE REGION
	(
		COD_REGION INTEGER,
		NOM_REGION VARCHAR(20),
		PRIMARY KEY(COD_REGION)
	);

	CREATE TABLE CIUDAD
	(
		COD_CIUDAD INTEGER,
		NOM_CIUDAD VARCHAR(20),
		COD_REGION INTEGER,
		PRIMARY KEY(COD_CIUDAD),
		FOREIGN KEY (COD_REGION) REFERENCES REGION
	);

	CREATE TABLE EMPRENDEDOR
	(
		COD_EMPRENDEDOR INTEGER,
		NOM_COMERCIAL VARCHAR(20),
		NOM_DUENO VARCHAR(20),
		EMAIL VARCHAR(20),
		CUE_INSTAGRAM VARCHAR(20),
		CUE_FACEBOOK VARCHAR(20),
		COD_CIUDAD INTEGER,
		PRIMARY KEY(COD_EMPRENDEDOR),
		FOREIGN KEY (COD_CIUDAD) REFERENCES CIUDAD
	);

	CREATE TABLE PRODUCTO 
	(
		COD_PRODUCTO INTEGER,
		NOM_PRODUCTO VARCHAR(20),
		UNI_MEDIDA VARCHAR(20),
		VALOR INT,
		STOCK INT,
		COD_EMPRENDEDOR INTEGER,
		PRIMARY KEY(COD_PRODUCTO),
		FOREIGN KEY (COD_EMPRENDEDOR) REFERENCES EMPRENDEDOR
	);

	CREATE TABLE CLIENTE
	(
		RUT_CLIENTE VARCHAR(20),
		NOM_CLIENTE VARCHAR(20),
		COD_PRODUCTO INTEGER,
		PRIMARY KEY(RUT_CLIENTE),
		FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
	);
	
	CREATE TABLE EVALUA
	(
		NOTA_PRODUCTO INTEGER,
		COMENTARIO_PRODUCTO VARCHAR(20),
		RUT_CLIENTE VARCHAR(20),
		COD_PRODUCTO INTEGER,
		PRIMARY KEY(RUT_CLIENTE),
		FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
		FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
		
	);

	CREATE TABLE COMPRA
	(
		CANTIDAD INT,
		METODOPAGO VARCHAR(20),
		DIRECCION VARCHAR(20),
		ESTADO VARCHAR(20),
		RUT_CLIENTE VARCHAR(20),
		COD_PRODUCTO INTEGER,
		PRIMARY KEY(RUT_CLIENTE, COD_PRODUCTO),
		FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
		FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
	);

	CREATE TABLE DIRECCION
	(
		COD_DIRECCION INTEGER,
		NOM_DIRECCION VARCHAR(20),
		CALLE VARCHAR(20),
		NUMERO INT,
		COD_CIUDAD INTEGER,
		PRIMARY KEY(COD_DIRECCION),
		FOREIGN KEY (COD_CIUDAD) REFERENCES CIUDAD
	);

	CREATE TABLE TIENE
	(
		RUT_CLIENTE VARCHAR(20),
		COD_DIRECCION INTEGER,
		PRIMARY KEY(RUT_CLIENTE, COD_DIRECCION),
		FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
		FOREIGN KEY (COD_DIRECCION) REFERENCES DIRECCION
	);

	CREATE TABLE DESPACHO
	(
		DIRECCION VARCHAR(20),
		COD_EMPRENDEDOR INTEGER,
		COD_REPARTO INTEGER,
		FECHA_ESTIMADA DATE,
		PRIMARY KEY(COD_EMPRENDEDOR, COD_REPARTO),
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
	DROP TABLE DESPACHO;
	DROP TABLE TIENE;
	DROP TABLE DIRECCION;
	DROP TABLE COMPRA;
	DROP TABLE EVALUA;
	DROP TABLE CLIENTE;
	DROP TABLE PRODUCTO;
	DROP TABLE EMPRENDEDOR;
	DROP TABLE CIUDAD;
	DROP TABLE REGION;
	DROP TABLE EMPRESAREPARTO;
)

a la profe:
- se pueden agregar datos

1) EMPRENDEDOR QUE MAS VENTA TIENE EN SEPTIEMBRE
2) CLIENTES QUE NO COMPRAN DURANTE DESDE JULIO 2020

(
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

)

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
		
CREATE TABLE PRODUCTO 
(
    COD_PRODUCTO INTEGER,
    NOM_PRODUCTO VARCHAR(20),
    UNI_MEDIDA VARCHAR(20),
    VALOR INT,
    STOCK INT,
    COD_EMPRENDEDOR INTEGER,
    PRIMARY KEY(COD_PRODUCTO),
    FOREIGN KEY (COD_EMPRENDEDOR) REFERENCES EMPRENDEDOR
);

INSERT INTO CLIENTE
Values	('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),
		('','',1,1,''),

CREATE TABLE CLIENTE
(
    RUT_CLIENTE VARCHAR(20),
    NOM_CLIENTE VARCHAR(20),
	COD_PRODUCTO INTEGER,
	NOTA_PRODUCTO INTEGER,
	COMENTARIO_PRODUCTO VARCHAR(20),
    PRIMARY KEY(RUT_CLIENTE),
	FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
);

CREATE TABLE EVALUA
(
	NOTA_PRODUCTO INTEGER,
	COMENTARIO_PRODUCTO VARCHAR(20),
	RUT_CLIENTE VARCHAR(20),
	COD_PRODUCTO INTEGER,
	PRIMARY KEY(RUT_CLIENTE),
	FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
	FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
	
);

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

CREATE TABLE COMPRA
(
    CANTIDAD INT,
    METODOPAGO VARCHAR(20),
    DIRECCION VARCHAR(20),
    ESTADO VARCHAR(20),
    RUT_CLIENTE VARCHAR(20),
    COD_PRODUCTO INTEGER,
    PRIMARY KEY(RUT_CLIENTE, COD_PRODUCTO),
    FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
    FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO
);

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

CREATE TABLE DIRECCION
(
    COD_DIRECCION INTEGER,
    NOM_DIRECCION VARCHAR(20),
    CALLE VARCHAR(20),
    NUMERO INTEGER,
    COD_CIUDAD INTEGER,
    PRIMARY KEY(COD_DIRECCION),
    FOREIGN KEY (COD_CIUDAD) REFERENCES CIUDAD
);

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

CREATE TABLE TIENE
(
    RUT_CLIENTE VARCHAR(20),
    COD_DIRECCION INTEGER,
    PRIMARY KEY(RUT_CLIENTE, COD_DIRECCION),
    FOREIGN KEY (RUT_CLIENTE) REFERENCES CLIENTE,
    FOREIGN KEY (COD_DIRECCION) REFERENCES DIRECCION
);

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

CREATE TABLE DESPACHO
(
    DIRECCION VARCHAR(20),
    COD_EMPRENDEDOR INTEGER,
    COD_REPARTO INTEGER,
    FECHA DATE,
    PRIMARY KEY(COD_EMPRENDEDOR, COD_REPARTO),
    FOREIGN KEY (COD_EMPRENDEDOR) REFERENCES EMPRENDEDOR,
    FOREIGN KEY (COD_REPARTO) REFERENCES EMPRESAREPARTO
);

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

CREATE TABLE CUBRE
(
    COD_REPARTO INTEGER,
    COD_REGION INTEGER,
    PRIMARY KEY(COD_REGION, COD_REPARTO),
    FOREIGN KEY (COD_REGION) REFERENCES REGION,
    FOREIGN KEY (COD_REPARTO) REFERENCES EMPRESAREPARTO
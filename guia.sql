CREATE TABLE PRODUCTO (
    FABRICANTE VARCHAR2(20) PRIMARY KEY,
    PRO_MODELO VARCHAR2(20) PRIMARY KEY,
    FECHA DATE
);

CREATE TABLE PC (
    PC_MODELO VARCHAR2(20),
    VELOCIDAD INTEGER,
    MEMORIA INTEGER,
    SSD INTEGER,
    PRECIO INTEGER,
    PRIMARY KEY(PC_MODELO),
    FOREIGN KEY (PC_MODELO) REFERENCES PRODUCTO (PRO_MODELO)
);

CREATE TABLE IMPRESORA (
    IMP_MODELO VARCHAR2(20),
    COLOR VARCHAR2(20),
    TIPO VARCHAR2(20),
    PRECIO INTEGER,
    PRIMARY KEY(IMP_MODELO),
    FOREIGN KEY (IMP_MODELO) REFERENCES PRODUCTO (PRO_MODELO)
);

INSERT INTO PRODUCTO VALUES('CANON','ALPHA','28/03/2021');

INSERT INTO PRODUCTO VALUES('CANON','ALPHA2','29/03/2021');

INSERT INTO PRODUCTO VALUES('EPSON','BETA','26/03/2021');

INSERT INTO PRODUCTO VALUES('EPSON','BETA2','27/03/2021');

INSERT INTO PRODUCTO VALUES('EPSON','BETA3','28/03/2021');

INSERT INTO PRODUCTO VALUES('EPSON','BETA4','29/03/2021');

INSERT INTO PRODUCTO VALUES('HP','CHARLIE','24/03/2021');

INSERT INTO PRODUCTO VALUES('HP','CHARLIE2','25/03/2021');

INSERT INTO PRODUCTO VALUES('HP','X360','26/03/2021');

INSERT INTO PRODUCTO VALUES('HP','SPECTRE','27/03/2021');

INSERT INTO PRODUCTO VALUES('LENOVO','LEGION','24/03/2021');

INSERT INTO PRODUCTO VALUES('ACER','NITRO','23/03/2021');

INSERT INTO PRODUCTO VALUES('MICROSOFT','SURFACE','22/03/2021');

INSERT INTO IMPRESORA VALUES ('ALPHA','ROJO','3D',20);

INSERT INTO IMPRESORA VALUES ('ALPHA2','ROJO','2D',15);

INSERT INTO IMPRESORA VALUES ('BETA','VERDE','2D',10);

INSERT INTO IMPRESORA VALUES ('BETA2','VERDE','3D',30);

INSERT INTO IMPRESORA VALUES ('BETA3','VERDE','2D',15);

INSERT INTO IMPRESORA VALUES ('BETA4','VERDE','3D',35);

INSERT INTO IMPRESORA VALUES ('CHARLIE','AZUL','2D',10);

INSERT INTO IMPRESORA VALUES ('CHARLIE2','AZUL','2D',5);

INSERT INTO PC VALUES ('X360',2400,8,128,10);

INSERT INTO PC VALUES ('LEGION',3000,16,256,20);

INSERT INTO PC VALUES ('SPECTRE',2600,12,64,15);

INSERT INTO PC VALUES ('NITRO',3000,12,256,15);

INSERT INTO PC VALUES ('SURFACE',2400,8,128,20);

--1
SELECT FABRICANTE FROM PRODUCTO P, IMPRESORA I WHERE P.PRO_MODELO=I.IMP_MODELO AND I.TIPO='3D' GROUP BY P.FABRICANTE;
--2
SELECT FABRICANTE FROM PRODUCTO P, IMPRESORA I WHERE P.PRO_MODELO=I.IMP_MODELO AND I.COLOR<>'ROJO' GROUP BY P.FABRICANTE;
--3
SELECT P.PC_MODELO , P.VELOCIDAD FROM PC P, PRODUCTO PR WHERE PR.PRO_MODELO=P.PC_MODELO AND P.SSD>120 AND P.PRECIO <= (SELECT AVG(PRECIO) FROM PC);
--4
SELECT P.FABRICANTE, AVG(I.PRECIO) FROM PRODUCTO P, IMPRESORA I WHERE  P.PRO_MODELO=I.IMP_MODELO GROUP BY P.FABRICANTE;
--5
SELECT P.PC_MODELO FROM PC P , PRODUCTO PR WHERE P.PC_MODELO=PR.PRO_MODELO AND P.PRECIO = (SELECT MAX(PRECIO) FROM PC);
--6
SELECT P.FABRICANTE FROM IMPRESORA I , PRODUCTO P WHERE P.PRO_MODELO=I.IMP_MODELO AND I.PRECIO = (SELECT MIN(PRECIO) FROM IMPRESORA);
--7
SELECT I.IMP_MODELO, I.TIPO FROM IMPRESORA I , PRODUCTO P WHERE P.PRO_MODELO=I.IMP_MODELO AND P.FABRICANTE<>'EPSON' AND P.FABRICANTE<>'CANON';
--8
	--OPCION EL MAS RAPIDO DE LOS BARATOS
	CREATE VIEW RENDIMIENTO_PRECIO AS (SELECT PR.FABRICANTE, P.PRECIO, P.VELOCIDAD FROM PRODUCTO PR, PC P WHERE PR.PRO_MODELO=P.PC_MODELO AND P.PRECIO=(SELECT MIN(PRECIO) FROM PC));
	SELECT FABRICANTE FROM RENDIMIENTO_PRECIO WHERE VELOCIDAD=(SELECT MAX(VELOCIDAD) FROM RENDIMIENTO_PRECIO);
	--OPCION EL MAS BARATO DE LOS RAPIDOS
	CREATE VIEW RENDIMIENTO_PRECIO AS (SELECT PR.FABRICANTE, P.PRECIO, P.VELOCIDAD FROM PRODUCTO PR, PC P WHERE PR.PRO_MODELO=P.PC_MODELO AND P.PRECIO=(SELECT MAX(VELOCIDAD) FROM PC));
	SELECT FABRICANTE FROM RENDIMIENTO_PRECIO WHERE PRECIO=(SELECT MIN(PRECIO) FROM RENDIMIENTO_PRECIO);
	
--9
SELECT P.FABRICANTE , COUNT(2) , AVG(I.PRECIO) FROM PRODUCTO P, IMPRESORA I WHERE P.PRO_MODELO = I.IMP_MODELO GROUP BY P.FABRICANTE HAVING COUNT(2)>3
--10
CREATE VIEW FABRICA_IMPRESORAS AS (SELECT PR.FABRICANTE , COUNT(PR.PRO_MODELO) AS CANTIDAD FROM PRODUCTO PR, IMPRESORA I WHERE PR.PRO_MODELO=I.IMP_MODELO AND PR.FABRICANTE NOT IN (SELECT PR.FABRICANTE FROM PRODUCTO PR, PC P WHERE P.PC_MODELO=PR.PRO_MODELO GROUP BY PR.FABRICANTE) GROUP BY PR.FABRICANTE);
SELECT * FROM FABRICA_IMPRESORAS WHERE CANTIDAD = (SELECT MIN(CANTIDAD) FROM FABRICA_IMPRESORAS)
--11

CREATE VIEW FABRICANTE_IMPRESORA AS (SELECT P.FABRICANTE , COUNT(2) AS CANTIDAD FROM PRODUCTO P, IMPRESORA I WHERE I.IMP_MODELO=P.PRO_MODELO GROUP BY P.FABRICANTE);

CREATE VIEW FABRICANTE_PC AS (SELECT PR.FABRICANTE , COUNT(2) AS CANTIDAD FROM PRODUCTO PR, PC P WHERE P.PC_MODELO=PR.PRO_MODELO GROUP BY PR.FABRICANTE);

SELECT I.FABRICANTE , I.CANTIDAD / (I.CANTIDAD + P.CANTIDAD) * 100 AS PORCENTAJE FROM FABRICANTE_IMPRESORA I, FABRICANTE_PC P WHERE I.FABRICANTE=P.FABRICANTE
UNION
SELECT I.FABRICANTE , 100 AS PORCENTAJE FROM FABRICANTE_IMPRESORA I, FABRICANTE_PC P WHERE I.FABRICANTE NOT IN (SELECT I.FABRICANTE FROM FABRICANTE_IMPRESORA I, FABRICANTE_PC P WHERE I.FABRICANTE=P.FABRICANTE)
UNION
SELECT P.FABRICANTE , 0 AS PORCENTAJE FROM FABRICANTE_IMPRESORA I, FABRICANTE_PC P WHERE P.FABRICANTE NOT IN (SELECT I.FABRICANTE FROM FABRICANTE_IMPRESORA I, FABRICANTE_PC P WHERE I.FABRICANTE=P.FABRICANTE)

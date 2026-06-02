-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-06-02 08:03:34 ECT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE Asignaciones CASCADE CONSTRAINTS 
;

DROP TABLE Categorias CASCADE CONSTRAINTS 
;

DROP TABLE Departamentos CASCADE CONSTRAINTS 
;

DROP TABLE Encargados CASCADE CONSTRAINTS 
;

DROP TABLE Instalaciones CASCADE CONSTRAINTS 
;

DROP TABLE Mantenimientos CASCADE CONSTRAINTS 
;

DROP TABLE Perifericos CASCADE CONSTRAINTS 
;

DROP TABLE Proveedores CASCADE CONSTRAINTS 
;

DROP TABLE Softwares CASCADE CONSTRAINTS 
;

DROP TABLE Ubicaciones CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Asignaciones 
    ( 
     Encargados_encrd_id INTEGER  NOT NULL , 
     Perifericos_per_id  INTEGER  NOT NULL , 
     fecha_asignacion    DATE  NOT NULL , 
     fecha_retiro        DATE 
    ) 
;

ALTER TABLE Asignaciones 
    ADD CONSTRAINT Asignacion_PK PRIMARY KEY ( Encargados_encrd_id, Perifericos_per_id ) ;

CREATE TABLE Categorias 
    ( 
     cate_id      INTEGER  NOT NULL , 
     cate_nombre  VARCHAR2 (200 CHAR)  NOT NULL , 
     cate_descrip VARCHAR2 (500 CHAR) 
    ) 
;

ALTER TABLE Categorias 
    ADD CONSTRAINT Categoria_PK PRIMARY KEY ( cate_id ) ;

CREATE TABLE Departamentos 
    ( 
     dep_id     INTEGER  NOT NULL , 
     dep_nombre VARCHAR2 (200 CHAR)  NOT NULL 
    ) 
;

ALTER TABLE Departamentos 
    ADD CONSTRAINT Departamentos_PK PRIMARY KEY ( dep_id ) ;

CREATE TABLE Encargados 
    ( 
     encrd_id             INTEGER  NOT NULL , 
     encrd_nombre         VARCHAR2 (200 CHAR)  NOT NULL , 
     Departamentos_dep_id INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Encargados 
    ADD CONSTRAINT Encargados_PK PRIMARY KEY ( encrd_id ) ;

CREATE TABLE Instalaciones 
    ( 
     Softwares_soft_id  INTEGER  NOT NULL , 
     Perifericos_per_id INTEGER  NOT NULL , 
     fecha_instalacion  DATE  NOT NULL , 
     inst_clave         VARCHAR2 (50 CHAR) 
    ) 
;

ALTER TABLE Instalaciones 
    ADD CONSTRAINT Instalaciones_PK PRIMARY KEY ( Softwares_soft_id, Perifericos_per_id ) ;

CREATE TABLE Mantenimientos 
    ( 
     mts_id             INTEGER  NOT NULL , 
     fechaEnvio         DATE , 
     fechaRetorno       DATE , 
     mts_descrip        VARCHAR2 (500 CHAR) , 
     costo              NUMBER  NOT NULL , 
     Perifericos_per_id INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Mantenimientos 
    ADD CONSTRAINT Mantenimientos_PK PRIMARY KEY ( mts_id ) ;

CREATE TABLE Perifericos 
    ( 
     per_id             INTEGER  NOT NULL , 
     per_nombre         VARCHAR2 (200 CHAR)  NOT NULL , 
     per_estado         VARCHAR2 (100 CHAR)  NOT NULL , 
     per_marca          VARCHAR2 (100 CHAR) , 
     Provedores_pro_id  INTEGER  NOT NULL , 
     Ubicaciones_ubi_id INTEGER  NOT NULL , 
     Categoria_cate_id  INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Perifericos 
    ADD CONSTRAINT Perifericos_PK PRIMARY KEY ( per_id ) ;

CREATE TABLE Proveedores 
    ( 
     pro_id       INTEGER  NOT NULL , 
     pro_nombre   VARCHAR2 (200 CHAR)  NOT NULL , 
     pro_telefono VARCHAR2 (20 CHAR) 
    ) 
;

ALTER TABLE Proveedores 
    ADD CONSTRAINT Provedores_PK PRIMARY KEY ( pro_id ) ;

CREATE TABLE Softwares 
    ( 
     soft_id       INTEGER  NOT NULL , 
     nom_programa  VARCHAR2 (100 CHAR)  NOT NULL , 
     tipo_licencia VARCHAR2 (100 CHAR) 
    ) 
;

ALTER TABLE Softwares 
    ADD CONSTRAINT Softwares_PK PRIMARY KEY ( soft_id ) ;

CREATE TABLE Ubicaciones 
    ( 
     ubi_id     INTEGER  NOT NULL , 
     ubi_nombre VARCHAR2 (200 CHAR) 
    ) 
;

ALTER TABLE Ubicaciones 
    ADD CONSTRAINT Ubicaciones_PK PRIMARY KEY ( ubi_id ) ;

ALTER TABLE Asignaciones 
    ADD CONSTRAINT Asignacion_Encargados_FK FOREIGN KEY 
    ( 
     Encargados_encrd_id
    ) 
    REFERENCES Encargados 
    ( 
     encrd_id
    ) 
;

ALTER TABLE Asignaciones 
    ADD CONSTRAINT Asignacion_Perifericos_FK FOREIGN KEY 
    ( 
     Perifericos_per_id
    ) 
    REFERENCES Perifericos 
    ( 
     per_id
    ) 
;

ALTER TABLE Encargados 
    ADD CONSTRAINT Encargados_Departamentos_FK FOREIGN KEY 
    ( 
     Departamentos_dep_id
    ) 
    REFERENCES Departamentos 
    ( 
     dep_id
    ) 
;

ALTER TABLE Instalaciones 
    ADD CONSTRAINT Instalaciones_Perifericos_FK FOREIGN KEY 
    ( 
     Perifericos_per_id
    ) 
    REFERENCES Perifericos 
    ( 
     per_id
    ) 
;

ALTER TABLE Instalaciones 
    ADD CONSTRAINT Instalaciones_Softwares_FK FOREIGN KEY 
    ( 
     Softwares_soft_id
    ) 
    REFERENCES Softwares 
    ( 
     soft_id
    ) 
;

ALTER TABLE Mantenimientos 
    ADD CONSTRAINT Mantenimientos_Perifericos_FK FOREIGN KEY 
    ( 
     Perifericos_per_id
    ) 
    REFERENCES Perifericos 
    ( 
     per_id
    ) 
;

ALTER TABLE Perifericos 
    ADD CONSTRAINT Perifericos_Categoria_FK FOREIGN KEY 
    ( 
     Categoria_cate_id
    ) 
    REFERENCES Categorias 
    ( 
     cate_id
    ) 
;

ALTER TABLE Perifericos 
    ADD CONSTRAINT Perifericos_Provedores_FK FOREIGN KEY 
    ( 
     Provedores_pro_id
    ) 
    REFERENCES Proveedores 
    ( 
     pro_id
    ) 
;

ALTER TABLE Perifericos 
    ADD CONSTRAINT Perifericos_Ubicaciones_FK FOREIGN KEY 
    ( 
     Ubicaciones_ubi_id
    ) 
    REFERENCES Ubicaciones 
    ( 
     ubi_id
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

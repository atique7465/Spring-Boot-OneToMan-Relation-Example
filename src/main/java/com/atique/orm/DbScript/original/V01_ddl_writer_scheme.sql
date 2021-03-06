CREATE USER WRITER IDENTIFIED BY writer;

GRANT CREATE DATABASE LINK TO WRITER;
GRANT CREATE SESSION TO WRITER;
GRANT ALTER SESSION TO WRITER;
GRANT UNLIMITED TABLESPACE TO WRITER;
GRANT CREATE SEQUENCE TO WRITER;
GRANT CREATE ANY INDEX TO WRITER;
GRANT RESOURCE TO WRITER;
GRANT CREATE SYNONYM TO WRITER;
GRANT CREATE VIEW TO WRITER;


create table WRITER.INFO
(
    ID             NUMBER             not null
        CONSTRAINT pk_info PRIMARY KEY,
    READER_ID      NUMBER             not null,
    WRITER_NAME    VARCHAR2(255 char) not null,
    WRITER_ADDRESS VARCHAR2(255 char) not null,
    CONSTRAINT uk_info UNIQUE (READER_ID, WRITER_NAME)
);

CREATE SEQUENCE WRITER.INFO_SEQUENCE;
CREATE INDEX idx_info
    ON WRITER.INFO (READER_ID);


create table WRITER.BOOK
(
    ID        NUMBER             not null
        CONSTRAINT pk_book PRIMARY KEY,
    BOOK_NAME VARCHAR2(255 char) not null,
    BOOK_TYPE VARCHAR2(255 char) not null,
    CNT       NUMBER             not null,
    INFO_ID   NUMBER             not null,
    FOREIGN KEY (INFO_ID) REFERENCES WRITER.INFO (ID)
);
CREATE SEQUENCE WRITER.BOOK_SEQUENCE;
CREATE DATABASE CollectionManager;

USE CollectionManager;

CREATE TABLE Usuario (
    username VARCHAR(30)            NOT NULL,
    nome     VARCHAR(50)            NOT NULL,
    email    VARCHAR(50)            NOT NULL
);

CREATE TABLE Carta (
    nome    VARCHAR(141)            NOT NULL,
    tipo    VARCHAR(30)             NOT NULL,
    cor     VARCHAR(10)             NOT NULL,
    custo   VARCHAR(10)             NOT NULL

);

CREATE TABLE CopiaCarta (
    copiaID         INT             NOT NULL,
    nomeCarta       VARCHAR(141)    NOT NULL,
    usuario         VARCHAR(30)     NOT NULL,
    armazenamento   INT             NOT NULL
);

CREATE TABLE Troca (
    
);
CREATE DATABASE CollectionManager;

USE CollectionManager;

CREATE TABLE Usuario (
    username            VARCHAR(30)     NOT NULL,
    nome                VARCHAR(50)     NOT NULL,
    email               VARCHAR(50)     NOT NULL
);

CREATE TABLE Carta (
    nome                VARCHAR(141)    NOT NULL,
    tipo                VARCHAR(30)     NOT NULL,
    cor                 VARCHAR(10)     NOT NULL,
    custo               VARCHAR(10)     NOT NULL

);

CREATE TABLE CopiaCarta (
    copiaID             INT             NOT NULL,
    nomeCarta           VARCHAR(141)    NOT NULL,
    usuario             VARCHAR(30)     NOT NULL,
    armazenamento       INT             NOT NULL
);

CREATE TABLE Troca (
    trocaID             INT             NOT NULL,
    remetente           VARCHAR(30)     NOT NULL,
    destinatario        VARCHAR(30)     NOT NULL,
    carta               INT             NOT NULL
);

CREATE TABLE Bloco (
    sigla               CHAR(3)         NOT NULL,
    nome                VARCHAR(50)     NOT NULL
);

CREATE TABLE Formato (
    nome                VARCHAR(30)     NOT NULL,
    tamanhoMinimoDeck   INT             NOT NULL
);

CREATE TABLE Armazenamento (
    armazenamentoID     INT             NOT NULL,
    dono                VARCHAR(30)     NOT NULL,    
    tipo                VARCHAR(30)     NOT NULL,    
    limite              INT             NOT NULL
);

CREATE TABLE Deck (
    armazenamento       INT             NOT NULL
);

CREATE TABLE CartaPertenceBloco (
    carta               VARCHAR(141)    NOT NULL,
    bloco               CHAR(3)         NOT NULL
);

CREATE TABLE BlocoValidoFormato (
    bloco               CHAR(3)         NOT NULL,
    formato             VARCHAR(30)     NOT NULL
);

CREATE TABLE CartaBanidaFormato (
    carta               VARCHAR(141)    NOT NULL,
    formato             VARCHAR(30)     NOT NULL
);

CREATE TABLE DeckValidoFormato (
    deck                INT             NOT NULL,
    formato             VARCHAR(30)     NOT NULL
);
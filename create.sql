CREATE DATABASE IF NOT EXISTS mtgCollectionManager
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE mtgCollectionManager;

CREATE TABLE IF NOT EXISTS Usuario (
    username            VARCHAR(30)     NOT NULL,
    nome                VARCHAR(50)     NOT NULL,
    email               VARCHAR(50)     NOT NULL,
    PRIMARY KEY(username)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Carta (
    nome                VARCHAR(141)    							NOT NULL,
    tipo                VARCHAR(30)     							NOT NULL,
    cor                 ENUM('W', 'U', 'B', 'R', 'G', 'M', 'C')     NOT NULL,
    custo               VARCHAR(10)     							NOT NULL,
    PRIMARY KEY(nome)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Armazenamento (
    armazenamentoID     INT             NOT NULL AUTO_INCREMENT,
    dono                VARCHAR(30)     NOT NULL,    
    tipo                VARCHAR(30)     NOT NULL,    
    limite              TINYINT         NOT NULL,
    PRIMARY KEY(armazenamentoID),
    FOREIGN KEY(dono) REFERENCES Usuario(username)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Deck (
    armazenamento       INT             NOT NULL,
    FOREIGN KEY(armazenamento) REFERENCES Armazenamento(armazenamentoID)
) ;

CREATE TABLE IF NOT EXISTS CopiaCarta (
    copiaID             INT             NOT NULL AUTO_INCREMENT,
    nomeCarta           VARCHAR(141)    NOT NULL,
    usuario             VARCHAR(30)     NOT NULL,
    armazenamento       INT             NOT NULL,
    PRIMARY KEY(copiaID),
    FOREIGN KEY(nomeCarta)     REFERENCES Carta(nome),
    FOREIGN KEY(usuario)       REFERENCES Usuario(username),
    FOREIGN KEY(armazenamento) REFERENCES Armazenamento(armazenamentoID)
);

CREATE TABLE IF NOT EXISTS Troca (
    trocaID             INT             NOT NULL AUTO_INCREMENT,
    remetente           VARCHAR(30)     NOT NULL,
    destinatario        VARCHAR(30)     NOT NULL,
    carta               INT             NOT NULL,
    PRIMARY KEY(trocaID),
    FOREIGN KEY(remetente)    REFERENCES Usuario(username),
    FOREIGN KEY(destinatario) REFERENCES Usuario(username),  
    FOREIGN KEY(carta)        REFERENCES CopiaCarta(copiaID)
);

CREATE TABLE IF NOT EXISTS Bloco (
    sigla               CHAR(3)         NOT NULL,
    nome                VARCHAR(50)     NOT NULL,
    PRIMARY KEY(sigla)
);

CREATE TABLE IF NOT EXISTS Formato (
    nome                VARCHAR(30)     NOT NULL,
    tamanhoMinimoDeck   TINYINT         NOT NULL,
    PRIMARY KEY(nome)
);

CREATE TABLE IF NOT EXISTS CartaPertenceBloco (
    carta               VARCHAR(141)    NOT NULL,
    bloco               CHAR(3)         NOT NULL,
    FOREIGN KEY(carta)  REFERENCES Carta(nome),
    FOREIGN KEY(bloco)  REFERENCES Bloco(sigla)
);

CREATE TABLE IF NOT EXISTS BlocoValidoFormato (
    bloco                CHAR(3)         NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(bloco)   REFERENCES Bloco(sigla),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);

CREATE TABLE IF NOT EXISTS CartaBanidaFormato (
    carta                VARCHAR(141)    NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(carta)   REFERENCES Carta(nome),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);

CREATE TABLE IF NOT EXISTS DeckValidoFormato (
    deck                 INT             NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(deck)    REFERENCES Deck(armazenamento),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);
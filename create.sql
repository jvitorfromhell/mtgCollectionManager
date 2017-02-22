CREATE DATABASE mtgCollectionManager
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE mtgCollectionManager;

CREATE TABLE Usuario (
    username            VARCHAR(30)     NOT NULL,
    nome                VARCHAR(50)     NOT NULL,
    email               VARCHAR(50)     NOT NULL,
    PRIMARY KEY(username)
) DEFAULT CHARSET = utf8;

CREATE TABLE Carta (
    nome                VARCHAR(141)    							NOT NULL,
    tipo                VARCHAR(30)     							NOT NULL,
    cor                 ENUM('W', 'U', 'B', 'R', 'G', 'M', 'C')     NOT NULL,
    custo               VARCHAR(10)     							NOT NULL,
    PRIMARY KEY(nome)
) DEFAULT CHARSET = utf8;

CREATE TABLE Armazenamento (
    armazenamentoID     INT             NOT NULL,
    dono                VARCHAR(30)     NOT NULL,    
    tipo                VARCHAR(30)     NOT NULL,    
    limite              TINYINT         NOT NULL,
    PRIMARY KEY(armazenamentoID),
    FOREIGN KEY(dono) REFERENCES Usuario(username)
) DEFAULT CHARSET = utf8;

CREATE TABLE Deck (
    armazenamento       INT             NOT NULL,
    FOREIGN KEY(armazenamento) REFERENCES Armazenamento(armazenamentoID)
) ;

CREATE TABLE CopiaCarta (
    copiaID             INT             NOT NULL,
    nomeCarta           VARCHAR(141)    NOT NULL,
    usuario             VARCHAR(30)     NOT NULL,
    armazenamento       INT             NOT NULL,
    PRIMARY KEY(copiaID),
    FOREIGN KEY(nomeCarta)     REFERENCES Carta(nome),
    FOREIGN KEY(usuario)       REFERENCES Usuario(username),
    FOREIGN KEY(armazenamento) REFERENCES Armazenamento(armazenamentoID)
);

CREATE TABLE Troca (
    trocaID             INT             NOT NULL,
    remetente           VARCHAR(30)     NOT NULL,
    destinatario        VARCHAR(30)     NOT NULL,
    carta               INT             NOT NULL,
    PRIMARY KEY(trocaID),
    FOREIGN KEY(remetente)    REFERENCES Usuario(username),
    FOREIGN KEY(destinatario) REFERENCES Usuario(username),  
    FOREIGN KEY(carta)        REFERENCES CopiaCarta(copiaID)
);

CREATE TABLE Bloco (
    sigla               CHAR(3)         NOT NULL,
    nome                VARCHAR(50)     NOT NULL,
    PRIMARY KEY(sigla)
);

CREATE TABLE Formato (
    nome                VARCHAR(30)     NOT NULL,
    tamanhoMinimoDeck   TINYINT             NOT NULL,
    PRIMARY KEY(nome)
);

CREATE TABLE CartaPertenceBloco (
    carta               VARCHAR(141)    NOT NULL,
    bloco               CHAR(3)         NOT NULL,
    FOREIGN KEY(carta)  REFERENCES Carta(nome),
    FOREIGN KEY(bloco)  REFERENCES Bloco(sigla)
);

CREATE TABLE BlocoValidoFormato (
    bloco                CHAR(3)         NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(bloco)   REFERENCES Bloco(sigla),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);

CREATE TABLE CartaBanidaFormato (
    carta                VARCHAR(141)    NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(carta)   REFERENCES Carta(nome),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);

CREATE TABLE DeckValidoFormato (
    deck                 INT             NOT NULL,
    formato              VARCHAR(30)     NOT NULL,
    FOREIGN KEY(deck)    REFERENCES Deck(armazenamento),
    FOREIGN KEY(formato) REFERENCES Formato(nome)
);
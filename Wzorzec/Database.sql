CREATE TABLE SYSTEM (
 idDBSYSTEM int NOT NULL,
 WersjaBazy varchar(10) NULL,
 nrWersji Varchar(10) NULL,
 dataOstatniejAktualizacji date NULL,
 CONSTRAINT key_idDBSYSTEM PRIMARY KEY (idDBSYSTEM)
);


Insert into System(idDbSystem, WersjaBazy, nrWersji,dataOstatniejAktualizacji) values(1,'1.01','1.01.001', now());




create table IDMAX
(
 IDM SERIAL,
 NazwaTabeli varchar(255) null,
 IDMAX int null,
 CONSTRAINT key_idMax UNIQUE (IDM)
);



Create table Adres(
 idAdres integer not NULL,
 KodPocztowy varchar(5),
 Poczta varchar(24),
 Gmina varchar(26),
 Miejscowosc varchar(26),
 Ulica varchar(30),
 NumerDomu varchar(7),
 NumerLokalu varchar(7),
 NumerTelefonu varchar(10),
 SymbolPanstwa varchar(2),
 KodPocztowyZagr varchar(12),
 NazwaPanstwa varchar(22),
 Email varchar(28), 
 CONSTRAINT key_adres UNIQUE(idAdres)
);




Create table Pracownik(
 idPracownik integer not NULL,
 Pesel       varchar(11),
 RodzajDokumentu smallint,
 SeriaNumerDokumentu varchar(15),
 Nazwisko varchar(31),
 Imie varchar(22),
 DataUrodzenia date,   
 CONSTRAINT key_pracownik UNIQUE(idPracownik)
);







CREATE TABLE platnik (
    idPlatnik integer not NULL, 
    Nip         varchar(10),
    Regon       varchar(14),
    Pesel       varchar(11),
    RodzajDokumentu varchar(1),
    SeriaNumerDok varchar(15),
    NazwaSkrocona varchar(31),
    Nazwisko varchar(31),
    Imie varchar(31),
    idAdresSiedziby int,  
    idPracownik int, 
    CONSTRAINT key_platnik UNIQUE(idPlatnik),
    FOREIGN KEY(idAdresSiedziby) REFERENCES
    Adres(idAdres) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idPracownik) REFERENCES
    Pracownik(idPracownik) ON UPDATE CASCADE ON DELETE CASCADE
);



Create Table Plik(
 IDM SERIAL,
 DataUtworzenia timestamp default current_timestamp,
 sciezka varchar(255), 
 nazwa varchar(255),
 CONSTRAINT key_plik UNIQUE (IDM)
);
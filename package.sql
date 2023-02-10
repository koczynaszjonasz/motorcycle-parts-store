create or replace PACKAGE magazyn AS
PROCEDURE status_magazyn;
PROCEDURE ostatnie_sztuki;
PROCEDURE dostawa;
end;

create or replace package body MAGAZYN
AS


PROCEDURE status_magazyn IS
CURSOR KURSOR_status_magazyn IS 
SELECT NAZWA_ARTYKULU,ILOSC_MAGAZYN, ID_ARTYKULU FROM ARTYKULY ;
produkt_status KURSOR_status_magazyn%rowtype;
BEGIN
FOR produkt_status IN KURSOR_status_magazyn
LOOP
UPDATE ARTYKULY 
SET STATUS_PRODUKTU = CASE
                        WHEN ILOSC_MAGAZYN = 0 THEN 'Brak'
                        ELSE 'Na magazynie'
                    END
    WHERE NAZWA_ARTYKULU=produkt_status.NAZWA_ARTYKULU;                
END LOOP;
END;


PROCEDURE ostatnie_sztuki IS
CURSOR KURSOR_ostatnie_sztuki IS 
SELECT ILOSC_MAGAZYN, ID_ARTYKULU FROM ARTYKULY;
obnizka KURSOR_ostatnie_sztuki%rowtype;
BEGIN
FOR obnizka IN KURSOR_ostatnie_sztuki
LOOP
IF obnizka.ILOSC_MAGAZYN BETWEEN 11 AND 20 THEN 
UPDATE ARTYKULY 
    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.1 * CENA_JEDNOSTKOWA)
    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;
ELSIF obnizka.ILOSC_MAGAZYN BETWEEN 6 AND 10 THEN
UPDATE ARTYKULY 
    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.2 * CENA_JEDNOSTKOWA)
    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;
ELSIF obnizka.ILOSC_MAGAZYN BETWEEN 1 AND 5 THEN
UPDATE ARTYKULY 
    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.3 * CENA_JEDNOSTKOWA)
    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;
END IF;
END LOOP;
END;


PROCEDURE dostawa IS
    CURSOR KURSOR_dostawa IS 
        SELECT id_klienta, punkty, darmowa_dostawa FROM klienci;
dostawa KURSOR_dostawa%rowtype;
BEGIN
    FOR dostawa IN KURSOR_dostawa
        LOOP
            IF dostawa.punkty > 5 THEN 
                UPDATE klienci SET darmowa_dostawa = 'TAK' WHERE id_klienta=dostawa.id_klienta;
            ELSIF dostawa.punkty < 5 THEN
                UPDATE klienci SET darmowa_dostawa = 'NIE' WHERE id_klienta=dostawa.id_klienta;
            END IF;
END LOOP;
END;

end; 

create or replace PACKAGE PCKG_WALIDUJ_IDS AS
    FUNCTION    FDB_Waliduj_NIP(pc_NIP VARCHAR2) RETURN INTEGER;
    FUNCTION    FDB_Waliduj_PESEL(pc_PESEL VARCHAR2) RETURN INTEGER;
    FUNCTION    FDB_Waliduj_REGON(pc_REGON VARCHAR2) RETURN INTEGER;
    PRAGMA RESTRICT_REFERENCES(FDB_Waliduj_NIP, WNDS);
    PRAGMA RESTRICT_REFERENCES(FDB_Waliduj_PESEL, WNDS);
    PRAGMA RESTRICT_REFERENCES(FDB_Waliduj_REGON, WNDS);
END;

create or replace PACKAGE BODY PCKG_WALIDUJ_IDS IS
TYPE t_Wagi IS TABLE OF SIMPLE_INTEGER;
vt_NIP t_Wagi := t_Wagi(6, 5, 7, 2, 3, 4, 5, 6, 7 );
vt_PESEL t_Wagi := t_Wagi(1, 3, 7, 9, 1, 3, 7,9,1,3);
vt_REGON_9 t_Wagi := t_Wagi(8, 9, 2, 3, 4, 5, 6, 7);
vt_REGON_14 t_Wagi := t_Wagi( 2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8);

FUNCTION PDB_Waliduj( pc_Literal VARCHAR2, pt_Wagi IN t_Wagi,
    pn_Modulo SIMPLE_INTEGER, pb_PESEL BOOLEAN :=FALSE) RETURN INTEGER
IS
    vc_Literal VARCHAR2(14 CHAR);
    vn_SumaKontr SIMPLE_INTEGER:=0;
BEGIN
    IF NVL(REGEXP_COUNT(pc_Literal,'[[:digit:]]'),0) <> pt_Wagi.COUNT + 1 THEN        
        RETURN 0;
     END IF;
---Suma kontrolna
    vc_Literal := REGEXP_REPLACE( pc_Literal,'[^[:digit:]]','');                      
    FOR i IN 1..pt_Wagi.COUNT
    LOOP
        vn_SumaKontr := vn_SumaKontr + TO_NUMBER(SUBSTR( vc_Literal, i,1)) * pt_Wagi(i);
    END LOOP;
---
    vn_SumaKontr := MOD(vn_SumaKontr, pn_Modulo);
--  Dla NIP poniższy przypadek nie powinien wystąpić, dla PESEL nie wystąpi
    IF vn_SumaKontr = 10 THEN
        vn_SumaKontr := 0;
    END IF;  
--  PESEL    
    IF pb_Pesel THEN
        IF vn_SumaKontr + TO_NUMBER(SUBSTR( vc_Literal, Length(vc_Literal),1)) IN ( 0, 10)  THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END IF;
-- NIP, REGON
    IF vn_SumaKontr = TO_NUMBER(SUBSTR( vc_Literal, Length(vc_Literal),1)) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
----
FUNCTION  FDB_Waliduj_NIP(pc_NIP VARCHAR2) RETURN INTEGER
IS   
BEGIN    
    RETURN PDB_Waliduj(pc_NIP, vt_NIP, 11);           
END;
------------------------------------------------------  
FUNCTION  FDB_Waliduj_PESEL(pc_PESEL VARCHAR2) RETURN INTEGER
IS  
BEGIN
    RETURN PDB_Waliduj(pc_Pesel, vt_PESEL, 10, TRUE);
END;
------------------------------------------------------
FUNCTION  FDB_Waliduj_REGON(pc_REGON VARCHAR2) RETURN INTEGER
IS  
BEGIN           
    RETURN PDB_Waliduj(pc_REGON, vt_REGON_9,  11) +
    PDB_Waliduj(pc_REGON, vt_REGON_14, 11);
END;
END;


create or replace PACKAGE zarzadzanie_zamowieniami
AS

  PROCEDURE dodaj_produkt (
    p_NAZWA_ARTYKULU  IN VARCHAR2,
    p_ILOSC_MAGAZYN IN NUMBER);

  PROCEDURE usun_produkt (
    p_NAZWA_ARTYKULU IN VARCHAR2);

  FUNCTION sprawdz_ilosc
  RETURN NUMBER;

  FUNCTION produkt_istnieje(
    p_NAZWA_ARTYKULU IN VARCHAR2)
  RETURN NUMBER;

  PROCEDURE wyczysc_koszyk;

  FUNCTION klient_istnieje(
    p_klient_email IN VARCHAR2)
  RETURN NUMBER;


     FUNCTION policz_naleznosc
    RETURN NUMBER;
  

  PROCEDURE stworz_zamowienie (
    p_klient_email IN VARCHAR2,
    p_id_zamowienia       OUT NUMBER,
    p_id_klienta  OUT NUMBER );
END zarzadzanie_zamowieniami;

create or replace PACKAGE BODY zarzadzanie_zamowieniami
AS
  PROCEDURE dodaj_produkt (p_NAZWA_ARTYKULU   IN VARCHAR2,
                        p_ILOSC_MAGAZYN IN NUMBER)
  IS
  BEGIN
      IF NOT apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        apex_collection.create_collection(p_collection_name => 'ARTYKULY');
      END IF;

      apex_collection.add_member(p_collection_name => 'ARTYKULY',
      p_n001 => p_NAZWA_ARTYKULU,
      p_n002 => p_ILOSC_MAGAZYN);
      
  END dodaj_produkt;

   

  PROCEDURE usun_produkt (p_NAZWA_ARTYKULU IN VARCHAR2)
  IS
    l_id NUMBER;
  BEGIN
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        SELECT seq_id
        INTO   l_id
        FROM   apex_collections a
        WHERE  collection_name = 'ARTYKULY'
              AND a.n001 = p_NAZWA_ARTYKULU;

        apex_collection.delete_member(p_collection_name => 'ARTYKULY', 
                                      p_seq=> l_id);
      END IF;
  END usun_produkt;

  FUNCTION sprawdz_ilosc
  RETURN NUMBER
  IS
    l_przedmioty NUMBER := 0;
  BEGIN
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        SELECT SUM(n002)
        INTO   l_przedmioty
        FROM   apex_collections a
        WHERE  collection_name = 'ARTYKULY';
      END IF;

      RETURN l_przedmioty;
  END sprawdz_ilosc;


  FUNCTION produkt_istnieje(p_NAZWA_ARTYKULU IN VARCHAR2)
  RETURN NUMBER
  IS
    l_ilosc NUMBER;
  BEGIN
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        SELECT a.n002
        INTO   l_ilosc
        FROM   apex_collections a
        WHERE  collection_name = 'ARTYKULY'
              AND a.n001 = p_NAZWA_ARTYKULU;

        RETURN l_ilosc;
      ELSE
        RETURN 0;
      END IF;
  EXCEPTION
    WHEN OTHERS THEN
              RETURN 0;
  END produkt_istnieje;

  PROCEDURE wyczysc_koszyk
  IS
  BEGIN
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        apex_collection.truncate_collection(p_collection_name => 'ARTYKULY');
      END IF;
  END wyczysc_koszyk;

  FUNCTION klient_istnieje(p_klient_email IN VARCHAR2)
  RETURN NUMBER
  IS
    l_klient NUMBER;
  BEGIN
      SELECT ID_KLIENTA
      INTO   l_klient
      FROM   KLIENCI
      WHERE  EMAIL = p_klient_email;

      RETURN l_klient;
  EXCEPTION
    WHEN no_data_found THEN
              RETURN 0;
  END klient_istnieje;



FUNCTION policz_naleznosc
RETURN NUMBER
IS
  l_value NUMBER := 0;
BEGIN
  IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY') THEN
    SELECT SUM(TO_NUMBER(a.n002) * b.CENA_JEDNOSTKOWA)
    INTO   l_value
    FROM   apex_collections a,ARTYKULY b
    WHERE  collection_name = 'ARTYKULY'
    AND a.n001 = b.NAZWA_ARTYKULU;
  END IF;
  RETURN l_value;
END policz_naleznosc;


  PROCEDURE stworz_zamowienie (
                          p_klient_email IN VARCHAR2,
                          p_id_zamowienia      OUT NUMBER,
                          p_id_klienta    OUT NUMBER)
  IS
  v_naleznosc NUMBER;
  BEGIN
      p_id_klienta := klient_istnieje(p_klient_email);
      p_id_zamowienia:=sequence_zamowienia.NEXTVAL;
      v_naleznosc:=policz_naleznosc;

      INSERT INTO ZAMOWIENIA
                  (   ID_ZAMOWIENIA,                
                      KLIENT,
                      NALEZNOSC,
                      DATA_ZAMOWIENIA,
                      ZWROT 
                  )

      VALUES      ( 
                   TO_NUMBER(p_id_zamowienia),
                   p_id_klienta,
                   v_naleznosc,
                   SYSDATE(),
                   ''
                  )                

      returning ID_ZAMOWIENIA INTO p_id_zamowienia;
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        INSERT INTO SZCZEGOLY_ZAMOWIENIA
                    (ZAMOWIENIE,
                    ARTYKUL,
                    ILOSC_ZAMOWIONYCH_SZTUK,
                    FORMA_ZAMOWIENIA
                    )
         SELECT  p_id_zamowienia,
              p.NAZWA_ARTYKULU,
              n002,
              'online'
        FROM   apex_collections a,
              ARTYKULY p
        WHERE  collection_name = 'ARTYKULY'
              AND p.ID_ARTYKULU = a.n001;
      END IF;

      apex_collection.delete_collection(p_collection_name => 'ARTYKULY');
  END stworz_zamowienie;
END zarzadzanie_zamowieniami;




create or replace PROCEDURE aktualizuj_place_dla_stanowiska (
  p_stanowisko IN STANOWISKO.NAZWA%TYPE,
  p_wyplata IN STANOWISKO.PLACA%TYPE
)
AS
  CURSOR c_stanowisko IS
  SELECT NAZWA, PLACA
  FROM STANOWISKO
  WHERE NAZWA = p_stanowisko;
  l_stanowisko STANOWISKO.NAZWA%TYPE;
  l_wyplata STANOWISKO.PLACA%TYPE;
BEGIN
  OPEN c_stanowisko;
  FETCH c_stanowisko INTO l_stanowisko, l_wyplata;
  IF c_stanowisko%FOUND THEN
    UPDATE STANOWISKO
    SET PLACA = p_wyplata
    WHERE NAZWA = l_stanowisko;
  END IF;
  CLOSE c_stanowisko;
END;

create or replace PROCEDURE aktualizuj_stanowisko(
  p_pesel IN PRACOWNICY.PESEL%TYPE,
  p_stanowisko IN PRACOWNICY.STANOWISKO%TYPE
)
AS
  CURSOR c_pracownik IS
  SELECT PESEL, STANOWISKO
  FROM PRACOWNICY
  WHERE PESEL = p_pesel;
  l_pesel PRACOWNICY.PESEL%TYPE;
  l_stanowisko PRACOWNICY.STANOWISKO%TYPE;
BEGIN
  OPEN c_pracownik;
  FETCH c_pracownik INTO l_pesel, l_stanowisko;
  IF c_pracownik%FOUND THEN
    UPDATE PRACOWNICY
    SET STANOWISKO = p_stanowisko
    WHERE PESEL = l_pesel;
  END IF;
  CLOSE c_pracownik;
END;

create or replace PROCEDURE dodaj_produkt (p_NAZWA_ARTYKULU   IN VARCHAR2,
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

create or replace PROCEDURE dostawa IS
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

create or replace PROCEDURE ostatnie_sztuki IS
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

create or replace PROCEDURE rabat_mail IS
CURSOR KURSOR_rabat_mail IS 
SELECT POTWIERDZONY_MAIL, ID_KLIENTA FROM KLIENCI;
rabat_verified_mail KURSOR_rabat_mail%rowtype;
BEGIN
FOR rabat_verified_mail IN KURSOR_rabat_mail
LOOP
IF rabat_verified_mail.POTWIERDZONY_MAIL = 'TAK' OR rabat_verified_mail.POTWIERDZONY_MAIL = 'Tak' THEN 
UPDATE KLIENCI 
    SET RABAT = 5
    WHERE ID_KLIENTA=rabat_verified_mail.ID_KLIENTA;
END IF;
END LOOP;
END;

create or replace PROCEDURE sprawdz_nip (p_nip IN INTEGER)
AS
v_sum INTEGER;
v_weights INTEGER;
v_error_message VARCHAR2(255);
BEGIN
    IF LENGTH(p_nip) != 10 THEN
        v_error_message := 'NIP musi posiadać 10 znaków!';
    END IF;
    FOR i IN 1..LENGTH(p_nip) LOOP
        IF NOT (SUBSTR(p_nip, i, 1) BETWEEN '0' AND '9') THEN
            v_error_message := 'NIP musi składać się z cyfr!';
        END IF;
    END LOOP;
    v_sum := 0;
    v_weights := 6;
    FOR i IN 1..LENGTH(p_nip) LOOP
        v_sum := v_sum + (SUBSTR(p_nip, i, 1) * v_weights);
        v_weights := v_weights - 1;
    END LOOP;
    IF MOD(v_sum, 11) != 0 THEN
        v_error_message := 'NIP nie jest poprawny!';
    END IF;
END;

create or replace PROCEDURE status_magazyn IS
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

create or replace PROCEDURE stworz_zamowienie (p_klient        IN VARCHAR2,
                          p_klient_email IN VARCHAR2,
                          p_id_zamowienia      OUT ZAMOWIENIA.ID_ZAMOWIENIA%TYPE,
                          p_id_klienta    OUT NUMBER)
  IS
  BEGIN
      p_id_klienta := klient_istnieje(p_klient_email);
      
      
      IF p_id_klienta = 0 THEN
        INSERT INTO KLIENCI
                    (IMIE,
                    EMAIL)
        VALUES      (p_klient,
                    p_klient_email)
        returning ID_KLIENTA INTO p_id_klienta ;
      END IF;
     
      INSERT INTO ZAMOWIENIA
                  (   ID_ZAMOWIENIA,
                      DATA_ZAMOWIENIA,
                      PESEL_PRACOWNIKA,
                      NALEZNOSC,
                  KLIENT,
                  ZWROT
                  )
      VALUES      ( 
                    sequence_zamowienia.NEXTVAL,
                    SYSDATE,
                   '3022059708',
                    '123',
                  p_id_klienta,
                  'NIE'
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
        SELECT p_id_zamowienia,
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
end;

create or replace PROCEDURE usun_produkt (p_NAZWA_ARTYKULU IN VARCHAR2)
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

create or replace PROCEDURE walidacja_nr_konta (p_nrkonta IN INTEGER)
AS
v_valid INTEGER;
v_error_message VARCHAR2(255);
BEGIN
    v_valid := 1;
    v_error_message := NULL;
    IF LENGTH(p_nrkonta) != 26 THEN
        v_valid := 0;
        v_error_message := 'Długość numeru rachunku musi wynosic 26 znakow!';
    END IF;
    FOR i IN 1..LENGTH(p_nrkonta) LOOP
        IF NOT (SUBSTR(p_nrkonta, i, 1) BETWEEN '0' AND '9') THEN
            v_valid := 0;
            v_error_message := 'Numer rachunku musi zawierać jedynie cyfry!';
            EXIT;
        END IF;
    END LOOP;
END;

create or replace PROCEDURE wyczysc_koszyk
  IS
  BEGIN
      IF apex_collection.collection_exists (p_collection_name => 'ARTYKULY')
      THEN
        apex_collection.truncate_collection(p_collection_name => 'ARTYKULY');
      END IF;
  END wyczysc_koszyk;


create or replace FUNCTION aktualizuj_dni_urlopu(dni_dodane INTEGER)
RETURN INTEGER IS
    cursor pracownicy_cursor is
        SELECT PESEL, dni_urlopu, WYKORZYSTANY_URLOP
        FROM pracownicy;
    liczba_dni pracownicy_cursor%rowtype;
BEGIN
    open pracownicy_cursor;
    loop
        fetch pracownicy_cursor into liczba_dni;
        exit when pracownicy_cursor%notfound;
        if extract(year from current_date) > extract(year from liczba_dni.WYKORZYSTANY_URLOP) then
            UPDATE pracownicy
            SET dni_urlopu = liczba_dni.dni_urlopu + dni_dodane
            WHERE PESEL = liczba_dni.PESEL;
        end if;
        UPDATE pracownicy
        SET WYKORZYSTANY_URLOP = current_date
        WHERE PESEL = liczba_dni.PESEL;
    end loop;
    close pracownicy_cursor;
    RETURN 1;
END;

create or replace FUNCTION autoryzacja (p_username in varchar2, p_password in varchar2) return boolean
as
v_ps_check varchar2(1);
begin
select 'x' into v_ps_check
from KLIENCI
where  upper(EMAIL) = upper(p_username)
and upper(HASLO) = upper(p_password)
and POTWIERDZONY_MAIL = 'TAK';
apex_util.set_authentication_result(0);
return true;
exception when no_data_found then
apex_util.set_authentication_result (4);
return false;
end;


create or replace FUNCTION dodaj_godziny_pracy(godziny_dodane INTEGER)
RETURN INTEGER
AS
   dzien VARCHAR2(9);
   czas_prac NUMBER;
   CURSOR c1 IS SELECT PESEL, CZAS_PRACY FROM PRACOWNICY;
BEGIN
   SELECT TO_CHAR(SYSDATE, 'DAY') INTO dzien FROM DUAL;
   IF dzien NOT IN ('SATURDAY', 'SUNDAY') THEN
      FOR r IN c1 LOOP
         UPDATE PRACOWNICY
         SET CZAS_PRACY = r.CZAS_PRACY + 8
         WHERE PESEL = r.PESEL;
      END LOOP;
      RETURN 1;
   END IF;
   RETURN 0;
END;


create or replace FUNCTION  FDB_Waliduj_REGON(pc_REGON VARCHAR2) RETURN INTEGER
IS  
BEGIN           
    RETURN PDB_Waliduj(pc_REGON, vt_REGON_9,  11) +
    PDB_Waliduj(pc_REGON, vt_REGON_14, 11);
END;

create or replace FUNCTION klient_istnieje(p_klient_email IN VARCHAR2)
  RETURN NUMBER
  IS
    l_klient KLIENCI.ID_KLIENTA%TYPE;
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

create or replace FUNCTION produkt_istnieje(p_NAZWA_ARTYKULU IN VARCHAR2)
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

create or replace FUNCTION sprawdz_ilosc
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

create or replace FUNCTION walidacja_pesel ( PESEL IN VARCHAR2)
RETURN VARCHAR2 IS
SUMA NUMBER;
BEGIN
    IF LENGTH(PESEL) <> 11 THEN
    RETURN 'Pesel jest nieprawidłowy';
    END IF;
        SUMA := MOD(10 -
        MOD(SUBSTR(PESEL, 1, 1) * 1
        +SUBSTR(PESEL, 2, 1) * 3
        +SUBSTR(PESEL, 3, 1) * 7
        +SUBSTR(PESEL, 4, 1) * 9
        +SUBSTR(PESEL, 5, 1) * 1
        +SUBSTR(PESEL, 6, 1) * 3
        +SUBSTR(PESEL, 7, 1) * 7
        +SUBSTR(PESEL, 8, 1) * 9
        +SUBSTR(PESEL, 9, 1) * 1
        +SUBSTR(PESEL, 10, 1) * 3
        ,10)
        ,10);
    EXCEPTION
    WHEN OTHERS THEN
    RETURN 'Pesel jest nieprawidłowy';
END;

create or replace FUNCTION wyslij_kod_urodzinowy(uro VARCHAR2)
RETURN VARCHAR2
AS
   v_mail_kli VARCHAR2(255);
   v_imie_kli VARCHAR2(255);
BEGIN
   
   FOR r IN (SELECT EMAIL, imie || ' ' || nazwisko as name
             FROM klienci) LOOP
      v_mail_kli := r.EMAIL;
      v_imie_kli := r.name;
      APEX_MAIL.send(p_to => v_mail_kli,
                     p_from => 'no-reply@many_moto.com',
                     p_body => 'Drogi ' || v_imie_kli || ', ' ||
                               'Świętujemy dziś rocznicę otwarcia naszego sklepu i chcielibyśmy podziękować za Waszą lojalność! ' ||
                               'ako specjalny prezent, użyj kodu URODZINYMANEGO23 przy zamówieniu, aby otrzymać zniżkę 23% na swoje następne zakupy. ' ||
                               'Mamy nadzieję, że będziecie mieć wspaniały dzień i cieszymy się na myśl o obsłużeniu Was w przyszłości. ' ||
                               'Pozdrawiamy, ' ||
                               'Twoja Firma ',
                     p_subj => 'Urodziny Naszego Sklepu');
   END LOOP;
END;










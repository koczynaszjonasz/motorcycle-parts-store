prompt --application/deployment/install/install_procedury_sql
begin
--   Manifest
--     INSTALL: INSTALL-Procedury.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(41115562121758798439)
,p_install_id=>wwv_flow_imp.id(37088097327174612384)
,p_name=>'Procedury.sql'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE EDITIONABLE PROCEDURE "AKTUALIZUJ_PLACE_DLA_STANOWISKA" (',
'  p_stanowisko IN STANOWISKO.NAZWA%TYPE,',
'  p_wyplata IN STANOWISKO.PLACA%TYPE',
')',
'AS',
'  CURSOR c_stanowisko IS',
'  SELECT NAZWA, PLACA',
'  FROM STANOWISKO',
'  WHERE NAZWA = p_stanowisko;',
'  l_stanowisko STANOWISKO.NAZWA%TYPE;',
'  l_wyplata STANOWISKO.PLACA%TYPE;',
'BEGIN',
'  OPEN c_stanowisko;',
'  FETCH c_stanowisko INTO l_stanowisko, l_wyplata;',
'  IF c_stanowisko%FOUND THEN',
'    UPDATE STANOWISKO',
'    SET PLACA = p_wyplata',
'    WHERE NAZWA = l_stanowisko;',
'  END IF;',
'  CLOSE c_stanowisko;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "AKTUALIZUJ_STANOWISKO" (',
'  p_pesel IN PRACOWNICY.PESEL%TYPE,',
'  p_stanowisko IN PRACOWNICY.STANOWISKO%TYPE',
')',
'AS',
'  CURSOR c_pracownik IS',
'  SELECT PESEL, STANOWISKO',
'  FROM PRACOWNICY',
'  WHERE PESEL = p_pesel;',
'  l_pesel PRACOWNICY.PESEL%TYPE;',
'  l_stanowisko PRACOWNICY.STANOWISKO%TYPE;',
'BEGIN',
'  OPEN c_pracownik;',
'  FETCH c_pracownik INTO l_pesel, l_stanowisko;',
'  IF c_pracownik%FOUND THEN',
'    UPDATE PRACOWNICY',
'    SET STANOWISKO = p_stanowisko',
'    WHERE PESEL = l_pesel;',
'  END IF;',
'  CLOSE c_pracownik;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "DODAJ_PRODUKT" (p_NAZWA_ARTYKULU   IN VARCHAR2,',
'                        p_ILOSC_MAGAZYN IN NUMBER)',
'  IS',
'  BEGIN',
'      IF NOT apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        apex_collection.create_collection(p_collection_name => ''ARTYKULY'');',
'      END IF;',
'      apex_collection.add_member(p_collection_name => ''ARTYKULY'',',
'      p_n001 => p_NAZWA_ARTYKULU,',
'      p_n002 => p_ILOSC_MAGAZYN);',
'      ',
'  END dodaj_produkt;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "DOSTAWA" IS',
'    CURSOR KURSOR_dostawa IS ',
'        SELECT id_klienta, punkty, darmowa_dostawa FROM klienci;',
'dostawa KURSOR_dostawa%rowtype;',
'BEGIN',
'    FOR dostawa IN KURSOR_dostawa',
'        LOOP',
'            IF dostawa.punkty > 5 THEN ',
'                UPDATE klienci SET darmowa_dostawa = ''TAK'' WHERE id_klienta=dostawa.id_klienta;',
'            ELSIF dostawa.punkty < 5 THEN',
'                UPDATE klienci SET darmowa_dostawa = ''NIE'' WHERE id_klienta=dostawa.id_klienta;',
'            END IF;',
'END LOOP;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "OSTATNIE_SZTUKI" IS',
'CURSOR KURSOR_ostatnie_sztuki IS ',
'SELECT ILOSC_MAGAZYN, ID_ARTYKULU FROM ARTYKULY;',
'obnizka KURSOR_ostatnie_sztuki%rowtype;',
'BEGIN',
'FOR obnizka IN KURSOR_ostatnie_sztuki',
'LOOP',
'IF obnizka.ILOSC_MAGAZYN BETWEEN 11 AND 20 THEN ',
'UPDATE ARTYKULY ',
'    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.1 * CENA_JEDNOSTKOWA)',
'    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;',
'ELSIF obnizka.ILOSC_MAGAZYN BETWEEN 6 AND 10 THEN',
'UPDATE ARTYKULY ',
'    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.2 * CENA_JEDNOSTKOWA)',
'    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;',
'ELSIF obnizka.ILOSC_MAGAZYN BETWEEN 1 AND 5 THEN',
'UPDATE ARTYKULY ',
'    SET CENA_JEDNOSTKOWA = CENA_JEDNOSTKOWA - (0.3 * CENA_JEDNOSTKOWA)',
'    WHERE ID_ARTYKULU=obnizka.ID_ARTYKULU;',
'END IF;',
'END LOOP;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "RABAT_MAIL" IS',
'CURSOR KURSOR_rabat_mail IS ',
'SELECT POTWIERDZONY_MAIL, ID_KLIENTA FROM KLIENCI;',
'rabat_verified_mail KURSOR_rabat_mail%rowtype;',
'BEGIN',
'FOR rabat_verified_mail IN KURSOR_rabat_mail',
'LOOP',
'IF rabat_verified_mail.POTWIERDZONY_MAIL = ''TAK'' OR rabat_verified_mail.POTWIERDZONY_MAIL = ''Tak'' THEN ',
'UPDATE KLIENCI ',
'    SET RABAT = 5',
'    WHERE ID_KLIENTA=rabat_verified_mail.ID_KLIENTA;',
'END IF;',
'END LOOP;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "SPRAWDZ_NIP" (p_nip IN INTEGER)',
'AS',
'v_sum INTEGER;',
'v_weights INTEGER;',
'v_error_message VARCHAR2(255);',
'BEGIN',
'    IF LENGTH(p_nip) != 10 THEN',
unistr('        v_error_message := ''NIP musi posiada\0107 10 znak\00F3w!'';'),
'    END IF;',
'    FOR i IN 1..LENGTH(p_nip) LOOP',
'        IF NOT (SUBSTR(p_nip, i, 1) BETWEEN ''0'' AND ''9'') THEN',
unistr('            v_error_message := ''NIP musi sk\0142ada\0107 si\0119 z cyfr!'';'),
'        END IF;',
'    END LOOP;',
'    v_sum := 0;',
'    v_weights := 6;',
'    FOR i IN 1..LENGTH(p_nip) LOOP',
'        v_sum := v_sum + (SUBSTR(p_nip, i, 1) * v_weights);',
'        v_weights := v_weights - 1;',
'    END LOOP;',
'    IF MOD(v_sum, 11) != 0 THEN',
'        v_error_message := ''NIP nie jest poprawny!'';',
'    END IF;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "STATUS_MAGAZYN" IS',
'CURSOR KURSOR_status_magazyn IS ',
'SELECT NAZWA_ARTYKULU,ILOSC_MAGAZYN, ID_ARTYKULU FROM ARTYKULY ;',
'produkt_status KURSOR_status_magazyn%rowtype;',
'BEGIN',
'FOR produkt_status IN KURSOR_status_magazyn',
'LOOP',
'UPDATE ARTYKULY ',
'SET STATUS_PRODUKTU = CASE',
'                        WHEN ILOSC_MAGAZYN = 0 THEN ''Brak''',
'                        ELSE ''Na magazynie''',
'                    END',
'    WHERE NAZWA_ARTYKULU=produkt_status.NAZWA_ARTYKULU;                ',
'END LOOP;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "STWORZ_ZAMOWIENIE" (p_klient        IN VARCHAR2,',
'                          p_klient_email IN VARCHAR2,',
'                          p_id_zamowienia      OUT ZAMOWIENIA.ID_ZAMOWIENIA%TYPE,',
'                          p_id_klienta    OUT NUMBER)',
'  IS',
'  BEGIN',
'      p_id_klienta := klient_istnieje(p_klient_email);',
'      ',
'      ',
'      IF p_id_klienta = 0 THEN',
'        INSERT INTO KLIENCI',
'                    (IMIE,',
'                    EMAIL)',
'        VALUES      (p_klient,',
'                    p_klient_email)',
'        returning ID_KLIENTA INTO p_id_klienta ;',
'      END IF;',
'     ',
'      INSERT INTO ZAMOWIENIA',
'                  (   ID_ZAMOWIENIA,',
'                      DATA_ZAMOWIENIA,',
'                      PESEL_PRACOWNIKA,',
'                      NALEZNOSC,',
'                  KLIENT,',
'                  ZWROT',
'                  )',
'      VALUES      ( ',
'                    sequence_zamowienia.NEXTVAL,',
'                    SYSDATE,',
'                   ''3022059708'',',
'                    ''123'',',
'                  p_id_klienta,',
'                  ''NIE''',
'                  )           ',
'      returning ID_ZAMOWIENIA INTO p_id_zamowienia;',
'      IF apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        INSERT INTO SZCZEGOLY_ZAMOWIENIA',
'                    (ZAMOWIENIE,',
'                    ARTYKUL,',
'                    ILOSC_ZAMOWIONYCH_SZTUK,',
'                    FORMA_ZAMOWIENIA',
'                    )',
'        SELECT p_id_zamowienia,',
'              p.NAZWA_ARTYKULU,',
'              n002,',
'              ''online''',
'        FROM   apex_collections a,',
'              ARTYKULY p',
'        WHERE  collection_name = ''ARTYKULY''',
'              AND p.ID_ARTYKULU = a.n001;',
'      END IF;',
'      apex_collection.delete_collection(p_collection_name => ''ARTYKULY'');',
'  END stworz_zamowienie;',
'END zarzadzanie_zamowieniami;',
'end;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "USUN_PRODUKT" (p_NAZWA_ARTYKULU IN VARCHAR2)',
'  IS',
'    l_id NUMBER;',
'  BEGIN',
'      IF apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        SELECT seq_id',
'        INTO   l_id',
'        FROM   apex_collections a',
'        WHERE  collection_name = ''ARTYKULY''',
'              AND a.n001 = p_NAZWA_ARTYKULU;',
'        apex_collection.delete_member(p_collection_name => ''ARTYKULY'', ',
'                                      p_seq=> l_id);',
'      END IF;',
'  END usun_produkt;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "WALIDACJA_NR_KONTA" (p_nrkonta IN INTEGER)',
'AS',
'v_valid INTEGER;',
'v_error_message VARCHAR2(255);',
'BEGIN',
'    v_valid := 1;',
'    v_error_message := NULL;',
'    IF LENGTH(p_nrkonta) != 26 THEN',
'        v_valid := 0;',
unistr('        v_error_message := ''D\0142ugo\015B\0107 numeru rachunku musi wynosic 26 znakow!'';'),
'    END IF;',
'    FOR i IN 1..LENGTH(p_nrkonta) LOOP',
'        IF NOT (SUBSTR(p_nrkonta, i, 1) BETWEEN ''0'' AND ''9'') THEN',
'            v_valid := 0;',
unistr('            v_error_message := ''Numer rachunku musi zawiera\0107 jedynie cyfry!'';'),
'            EXIT;',
'        END IF;',
'    END LOOP;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE PROCEDURE "WYCZYSC_KOSZYK" ',
'  IS',
'  BEGIN',
'      IF apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        apex_collection.truncate_collection(p_collection_name => ''ARTYKULY'');',
'      END IF;',
'  END wyczysc_koszyk;',
'/',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115562205011798440)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'AKTUALIZUJ_PLACE_DLA_STANOWISKA'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115562414699798440)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'AKTUALIZUJ_STANOWISKO'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115562668591798440)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'DODAJ_PRODUKT'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115562839903798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'DOSTAWA'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115563089456798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'OSTATNIE_SZTUKI'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115563225668798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'RABAT_MAIL'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115563418311798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'SPRAWDZ_NIP'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115563614886798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'STATUS_MAGAZYN'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115563891123798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'STWORZ_ZAMOWIENIE'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115564077486798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'USUN_PRODUKT'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115564285408798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'WALIDACJA_NR_KONTA'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115564438766798441)
,p_script_id=>wwv_flow_imp.id(41115562121758798439)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PROCEDURE'
,p_object_name=>'WYCZYSC_KOSZYK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182021','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/

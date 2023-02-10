prompt --application/deployment/install/install_funkcje_sql
begin
--   Manifest
--     INSTALL: INSTALL-funkcje.sql
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
 p_id=>wwv_flow_imp.id(41114906527550770212)
,p_install_id=>wwv_flow_imp.id(37088097327174612384)
,p_name=>'funkcje.sql'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE EDITIONABLE FUNCTION "AKTUALIZUJ_DNI_URLOPU" (dni_dodane INTEGER)',
'RETURN INTEGER IS',
'    cursor pracownicy_cursor is',
'        SELECT PESEL, dni_urlopu, WYKORZYSTANY_URLOP',
'        FROM pracownicy;',
'    liczba_dni pracownicy_cursor%rowtype;',
'BEGIN',
'    open pracownicy_cursor;',
'    loop',
'        fetch pracownicy_cursor into liczba_dni;',
'        exit when pracownicy_cursor%notfound;',
'        if extract(year from current_date) > extract(year from liczba_dni.WYKORZYSTANY_URLOP) then',
'            UPDATE pracownicy',
'            SET dni_urlopu = liczba_dni.dni_urlopu + dni_dodane',
'            WHERE PESEL = liczba_dni.PESEL;',
'        end if;',
'        UPDATE pracownicy',
'        SET WYKORZYSTANY_URLOP = current_date',
'        WHERE PESEL = liczba_dni.PESEL;',
'    end loop;',
'    close pracownicy_cursor;',
'    RETURN 1;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "AUTORYZACJA" (p_username in varchar2, p_password in varchar2) return boolean',
'as',
'v_ps_check varchar2(1);',
'begin',
'select ''x'' into v_ps_check',
'from KLIENCI',
'where  upper(EMAIL) = upper(p_username)',
'and upper(HASLO) = upper(p_password)',
'and POTWIERDZONY_MAIL = ''TAK'';',
'apex_util.set_authentication_result(0);',
'return true;',
'exception when no_data_found then',
'apex_util.set_authentication_result (4);',
'return false;',
'end;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "DODAJ_GODZINY_PRACY" (godziny_dodane INTEGER)',
'RETURN INTEGER',
'AS',
'   dzien VARCHAR2(9);',
'   czas_prac NUMBER;',
'   CURSOR c1 IS SELECT PESEL, CZAS_PRACY FROM PRACOWNICY;',
'BEGIN',
'   SELECT TO_CHAR(SYSDATE, ''DAY'') INTO dzien FROM DUAL;',
'   IF dzien NOT IN (''SATURDAY'', ''SUNDAY'') THEN',
'      FOR r IN c1 LOOP',
'         UPDATE PRACOWNICY',
'         SET CZAS_PRACY = r.CZAS_PRACY + 8',
'         WHERE PESEL = r.PESEL;',
'      END LOOP;',
'      RETURN 1;',
'   END IF;',
'   RETURN 0;',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "FDB_WALIDUJ_REGON" (pc_REGON VARCHAR2) RETURN INTEGER',
'IS  ',
'BEGIN           ',
'    RETURN PDB_Waliduj(pc_REGON, vt_REGON_9,  11) +',
'    PDB_Waliduj(pc_REGON, vt_REGON_14, 11);',
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "KLIENT_ISTNIEJE" (p_klient_email IN VARCHAR2)',
'  RETURN NUMBER',
'  IS',
'    l_klient KLIENCI.ID_KLIENTA%TYPE;',
'  BEGIN',
'      SELECT ID_KLIENTA',
'      INTO   l_klient',
'      FROM   KLIENCI',
'      WHERE  EMAIL = p_klient_email;',
'      RETURN l_klient;',
'  EXCEPTION',
'    WHEN no_data_found THEN',
'              RETURN 0;',
'  END klient_istnieje;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "PRODUKT_ISTNIEJE" (p_NAZWA_ARTYKULU IN VARCHAR2)',
'  RETURN NUMBER',
'  IS',
'    l_ilosc NUMBER;',
'  BEGIN',
'      IF apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        SELECT a.n002',
'        INTO   l_ilosc',
'        FROM   apex_collections a',
'        WHERE  collection_name = ''ARTYKULY''',
'              AND a.n001 = p_NAZWA_ARTYKULU;',
'        RETURN l_ilosc;',
'      ELSE',
'        RETURN 0;',
'      END IF;',
'  EXCEPTION',
'    WHEN OTHERS THEN',
'              RETURN 0;',
'  END produkt_istnieje;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "SPRAWDZ_ILOSC" ',
'  RETURN NUMBER',
'  IS',
'    l_przedmioty NUMBER := 0;',
'  BEGIN',
'      IF apex_collection.collection_exists (p_collection_name => ''ARTYKULY'')',
'      THEN',
'        SELECT SUM(n002)',
'        INTO   l_przedmioty',
'        FROM   apex_collections a',
'        WHERE  collection_name = ''ARTYKULY'';',
'      END IF;',
'      RETURN l_przedmioty;',
'  END sprawdz_ilosc;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "WALIDACJA_PESEL" ( PESEL IN VARCHAR2)',
'RETURN VARCHAR2 IS',
'SUMA NUMBER;',
'BEGIN',
'    IF LENGTH(PESEL) <> 11 THEN',
unistr('    RETURN ''Pesel jest nieprawid\0142owy'';'),
'    END IF;',
'        SUMA := MOD(10 -',
'        MOD(SUBSTR(PESEL, 1, 1) * 1',
'        +SUBSTR(PESEL, 2, 1) * 3',
'        +SUBSTR(PESEL, 3, 1) * 7',
'        +SUBSTR(PESEL, 4, 1) * 9',
'        +SUBSTR(PESEL, 5, 1) * 1',
'        +SUBSTR(PESEL, 6, 1) * 3',
'        +SUBSTR(PESEL, 7, 1) * 7',
'        +SUBSTR(PESEL, 8, 1) * 9',
'        +SUBSTR(PESEL, 9, 1) * 1',
'        +SUBSTR(PESEL, 10, 1) * 3',
'        ,10)',
'        ,10);',
'    EXCEPTION',
'    WHEN OTHERS THEN',
unistr('    RETURN ''Pesel jest nieprawid\0142owy'';'),
'END;',
'/',
'',
'CREATE OR REPLACE EDITIONABLE FUNCTION "WYSLIJ_KOD_URODZINOWY" (uro VARCHAR2)',
'RETURN VARCHAR2',
'AS',
'   v_mail_kli VARCHAR2(255);',
'   v_imie_kli VARCHAR2(255);',
'BEGIN',
'   ',
'   FOR r IN (SELECT EMAIL, imie || '' '' || nazwisko as name',
'             FROM klienci) LOOP',
'      v_mail_kli := r.EMAIL;',
'      v_imie_kli := r.name;',
'      APEX_MAIL.send(p_to => v_mail_kli,',
'                     p_from => ''no-reply@many_moto.com'',',
'                     p_body => ''Drogi '' || v_imie_kli || '', '' ||',
unistr('                               ''\015Awi\0119tujemy dzi\015B rocznic\0119 otwarcia naszego sklepu i chcieliby\015Bmy podzi\0119kowa\0107 za Wasz\0105 lojalno\015B\0107! '' ||'),
unistr('                               ''ako specjalny prezent, u\017Cyj kodu URODZINYMANEGO23 przy zam\00F3wieniu, aby otrzyma\0107 zni\017Ck\0119 23% na swoje nast\0119pne zakupy. '' ||'),
unistr('                               ''Mamy nadziej\0119, \017Ce b\0119dziecie mie\0107 wspania\0142y dzie\0144 i cieszymy si\0119 na my\015Bl o obs\0142u\017Ceniu Was w przysz\0142o\015Bci. '' ||'),
'                               ''Pozdrawiamy, '' ||',
'                               ''Twoja Firma '',',
'                     p_subj => ''Urodziny Naszego Sklepu'');',
'   END LOOP;',
'END;',
'/',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114906667857770217)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'AKTUALIZUJ_DNI_URLOPU'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114906840810770218)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'AUTORYZACJA'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114907020430770218)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'DODAJ_GODZINY_PRACY'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114907212966770218)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'FDB_WALIDUJ_REGON'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114907431855770218)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'KLIENT_ISTNIEJE'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114907667894770218)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'PRODUKT_ISTNIEJE'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114907847812770219)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'SPRAWDZ_ILOSC'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114908013789770219)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'WALIDACJA_PESEL'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41114908274696770219)
,p_script_id=>wwv_flow_imp.id(41114906527550770212)
,p_object_owner=>'#OWNER#'
,p_object_type=>'FUNCTION'
,p_object_name=>'WYSLIJ_KOD_URODZINOWY'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181538','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/

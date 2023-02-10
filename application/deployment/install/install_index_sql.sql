prompt --application/deployment/install/install_index_sql
begin
--   Manifest
--     INSTALL: INSTALL-index.sql
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
 p_id=>wwv_flow_imp.id(41115224988718107929)
,p_install_id=>wwv_flow_imp.id(37088097327174612384)
,p_name=>'index.sql'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE UNIQUE INDEX "DOSTAWCY_PK" ON "DOSTAWCY" ("NIP") ',
'  ;',
'',
'CREATE UNIQUE INDEX "KATEGORIA_PK" ON "KATEGORIA" ("KATEGORIA") ',
'  ;',
'',
'CREATE UNIQUE INDEX "KLIENCI_PK" ON "KLIENCI" ("ID_KLIENTA") ',
'  ;',
'',
'CREATE UNIQUE INDEX "PRACOWNICY_PK" ON "PRACOWNICY" ("PESEL") ',
'  ;',
'',
'CREATE UNIQUE INDEX "STANOWISKO_PK" ON "STANOWISKO" ("ID_STANOWISKA") ',
'  ;',
'',
'CREATE UNIQUE INDEX "TOWARY_PK" ON "ARTYKULY" ("ID_ARTYKULU") ',
'  ;',
'',
'CREATE UNIQUE INDEX "ZAMOWIENIA_PK" ON "ZAMOWIENIA" ("ID_ZAMOWIENIA") ',
'  ;',
'',
'CREATE UNIQUE INDEX "ZAM_DOST_PK" ON "ZAMOWIENIA_DOSTAWCY" ("ID_ZAMOWIENIA_DOSTAWCY") ',
'  ;',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115225017573107929)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'DOSTAWCY_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115225255064107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'KATEGORIA_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115225422352107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'KLIENCI_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115225607332107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'PRACOWNICY_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115225877393107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'STANOWISKO_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115226087569107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TOWARY_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115226276687107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'ZAMOWIENIA_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41115226407088107930)
,p_script_id=>wwv_flow_imp.id(41115224988718107929)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'ZAM_DOST_PK'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116181702','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/

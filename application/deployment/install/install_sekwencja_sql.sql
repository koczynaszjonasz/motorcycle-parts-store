prompt --application/deployment/install/install_sekwencja_sql
begin
--   Manifest
--     INSTALL: INSTALL-Sekwencja.sql
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
 p_id=>wwv_flow_imp.id(41116223642338804915)
,p_install_id=>wwv_flow_imp.id(37088097327174612384)
,p_name=>'Sekwencja.sql'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' CREATE SEQUENCE  "ARTYKULY_SEQ"  MINVALUE 1 MAXVALUE 999 INCREMENT BY 1 START WITH 91 CACHE 20 NOORDER  NOCYCLE  NOKEEP  GLOBAL ;',
'',
' CREATE SEQUENCE  "KLIENCI_SEQ"  MINVALUE 1 MAXVALUE 999 INCREMENT BY 1 START WITH 252 CACHE 20 NOORDER  NOCYCLE  NOKEEP  GLOBAL ;',
'',
' CREATE SEQUENCE  "SEQUENCE_ZAMOWIENIA"  MINVALUE 100 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 191 CACHE 20 NOORDER  NOCYCLE  NOKEEP  GLOBAL ;',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41116223738816804916)
,p_script_id=>wwv_flow_imp.id(41116223642338804915)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'ARTYKULY_SEQ'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41116223980730804916)
,p_script_id=>wwv_flow_imp.id(41116223642338804915)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'KLIENCI_SEQ'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(41116224177708804916)
,p_script_id=>wwv_flow_imp.id(41116223642338804915)
,p_object_owner=>'#OWNER#'
,p_object_type=>'SEQUENCE'
,p_object_name=>'SEQUENCE_ZAMOWIENIA'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_updated_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
,p_created_by=>'MACIEKZAK550@GMAIL.COM'
,p_created_on=>to_date('20230116182125','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/

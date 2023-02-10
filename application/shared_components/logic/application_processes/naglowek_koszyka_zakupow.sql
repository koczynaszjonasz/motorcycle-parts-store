prompt --application/shared_components/logic/application_processes/naglowek_koszyka_zakupow
begin
--   Manifest
--     APPLICATION PROCESS: naglowek koszyka zakupow
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(38423252841319359297)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'naglowek koszyka zakupow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_cnt NUMBER := zarzadzanie_zamowieniami.sprawdz_ilosc;',
'BEGIN',
'    IF l_cnt > 0 THEN',
'        :KOSZYK_PRODUKTY := l_cnt;',
'        :KOSZYK_IKONA := ''fa-cart-full'';',
'    ELSE',
'        :KOSZYK_PRODUKTY :='''';',
'        :KOSZYK_IKONA := ''fa-cart-empty'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_imp.component_end;
end;
/

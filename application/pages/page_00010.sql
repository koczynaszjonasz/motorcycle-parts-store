prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Pracownicy - tabela'
,p_alias=>'PRACOWNICY-TABELA'
,p_step_title=>'Pracownicy - tabela'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230116172325'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39165541484559022713)
,p_plug_name=>'Raport'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195855485177863063)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'htp.p(''<style>',
'    table,th,td{',
'        border: 1px solid black;',
'        border-collapse: collapse;',
'    }',
'</style>'');',
'',
'htp.p(''<center><h2>Pracownicy</h2></center>'');',
'',
'htp.p(''<table style="width:100%">',
'    <tr>',
'        <th>PESEL</th>',
'        <th>NAZWISKO</th>',
'        <th>IMIE</th>',
'        <th>STANOWISKO</th>',
'        <th>CZAS PRACY</th>',
'        <th>DNI URLOPU</th>',
'        <th>KOD POCZTOWY</th>',
unistr('        <th>MIEJSCOWO\015A\0106</th>'),
'        <th>ULICA</th>',
'        <th>NUMER DOMU</th>',
'        <th>WYKORZYSTANY URLOP</th>',
'    </tr>'');',
'    ',
'    FOR x IN (SELECT PESEL, NAZWISKO, IMIE, STANOWISKO, CZAS_PRACY, DNI_URLOPU, KOD_POCZTOWY, MIEJSCOWOSC, ULICA, NUMER_DOMU, WYKORZYSTANY_URLOP FROM PRACOWNICY)',
'    LOOP',
'',
'htp.p(''<tr>',
'    <td>''||x.PESEL||''</td>',
'    <td>''||x.NAZWISKO||''</td>',
'    <td>''||x.IMIE||''</td>',
'    <td>''||x.STANOWISKO||''</td>',
'    <td>''||x.CZAS_PRACY||''</td>',
'    <td>''||x.DNI_URLOPU||''</td>',
'    <td>''||x.KOD_POCZTOWY||''</td>',
'    <td>''||x.MIEJSCOWOSC||''</td>',
'    <td>''||x.ULICA||''</td>',
'    <td>''||x.NUMER_DOMU||''</td>',
'    <td>''||x.WYKORZYSTANY_URLOP||''</td>',
'',
'    </tr>'');',
'    END LOOP;',
'    RETURN NULL;',
'htp.p(''</table>'');',
'END;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp.component_end;
end;
/

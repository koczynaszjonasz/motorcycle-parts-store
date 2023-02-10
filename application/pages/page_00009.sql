prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'O NAS'
,p_alias=>'O-NAS'
,p_step_title=>'O NAS'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/widget.miniMap.js'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'THEADVANCCE'
,p_last_upd_yyyymmddhh24miss=>'20230116170717'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36610716225164290032)
,p_plug_name=>'MANY MOTO'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<body>',
unistr('<p> Nasza firma zajmuje si\0119 sprzeda\017C\0105 cz\0119\015Bci motocyklowych od ponad 20 lat. Posiadamy bogaty wyb\00F3r produkt\00F3w, od oryginalnych cz\0119\015Bci producent\00F3w po zamienniki wysokiej jako\015Bci. Nasz zesp\00F3\0142 sk\0142ada si\0119 z pasjonat\00F3w motocykli, dzi\0119ki czemu jeste\015Bmy w st')
||unistr('anie doradzi\0107 naszym klientom w doborze odpowiednich cz\0119\015Bci do ich motocykli. </p>'),
'<br>',
unistr('<p> Nasz sklep stacjonarny znajduje si\0119 w centrum miasta, a nasz sklep internetowy dost\0119pny jest dla klient\00F3w z ca\0142ego kraju. Dzi\0119ki temu, \017Ce oferujemy szybk\0105 i tani\0105 wysy\0142k\0119, nasi klienci mog\0105 korzysta\0107 z naszych us\0142ug bez wzgl\0119du na to, gdzie miesz')
||unistr('kaj\0105. </p>'),
'<br>',
unistr('<p> Jeste\015Bmy dumni, \017Ce jeste\015Bmy jednym z najwi\0119kszych dystrybutor\00F3w cz\0119\015Bci motocyklowych w kraju. Dzi\0119ki wsp\00F3\0142pracy z wieloma producentami, jeste\015Bmy w stanie zaoferowa\0107 naszym klientom szeroki wyb\00F3r produkt\00F3w w konkurencyjnych cenach. </p>'),
'<br>',
unistr('<p> Jako\015B\0107 i satysfakcja klienta jest dla nas priorytetem. Dlatego te\017C, je\015Bli masz jakiekolwiek pytanie dotycz\0105ce naszych produkt\00F3w lub potrzebujesz pomocy przy doborze odpowiednich cz\0119\015Bci, zapraszamy do kontaktu z naszym zespo\0142em. </p>'),
'<br>',
unistr('<p> Dzi\0119kujemy za zaufanie i wyb\00F3r naszej firmy jako dostawcy cz\0119\015Bci motocyklowych. Jeste\015Bmy gotowi, aby pom\00F3c Ci znale\017A\0107 to, czego potrzebujesz, aby Tw\00F3j motocykl dzia\0142a\0142 jak nale\017Cy. </p>'),
'<br>',
'<p> Kontakt: +17 2353 785 </p>',
'<br>',
unistr('<p> Rzesz\00F3w, ul. Podwis\0142ocze 12 </p>'),
'<div id = "optionsMap" style="width:100%; height:600px;"></div>',
'</body>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41081448988089493798)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195877711652863073)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(25195361961967863016)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(25195939834312863106)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(36610716635680290036)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(36610716225164290032)
,p_button_name=>'Mapa'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Mapa'
,p_button_position=>'COPY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-map-marker-o'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(36610716742999290037)
,p_name=>'Klikniecie'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(36610716635680290036)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(36610716829490290038)
,p_event_id=>wwv_flow_imp.id(36610716742999290037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'KOD JS'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#optionsMap").miniMap({',
'    center: [22.00543, 50.02258],',
'    background: "osm-bright",',
'    zoom: 14,',
'    marker: true,',
'    markerColor: "red",',
'    controls: true,',
'    interactive: true,',
'    tooltip: "Oracle Redwood Shores"',
'});'))
);
wwv_flow_imp.component_end;
end;
/

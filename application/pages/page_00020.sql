prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>unistr('Artyku\0142y')
,p_alias=>unistr('ARTYKU\0141Y')
,p_step_title=>unistr('Artyku\0142y')
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}'))
,p_step_template=>wwv_flow_imp.id(25195369324904863021)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20221207230700'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25849448717351974471)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25849450191477974473)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(25195399235107863035)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(25849450949778974474)
,p_name=>'Master Records'
,p_template=>wwv_flow_imp.id(25195800620268863036)
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID_ARTYKULU",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P20_ID_ARTYKULU'', p_values => "ID_ARTYKULU") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P20_ID_ARTYKULU,''0'') = "ID_ARTYKULU"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("NAZWA_ARTYKULU", 1, 50)||( case when length("NAZWA_ARTYKULU") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    (substr("PRODUCENT", 1, 50)||( case when length("PRODUCENT") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE',
'from "ARTYKULY" x',
'where (:P20_SEARCH is null',
'        or upper(x."NAZWA_ARTYKULU") like ''%''||upper(:P20_SEARCH)||''%''',
'        or upper(x."PRODUCENT") like ''%''||upper(:P20_SEARCH)||''%''',
'    )',
'order by "NAZWA_ARTYKULU"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P20_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(25195900028130863085)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No data found.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849451641511974487)
,p_query_column_id=>1
,p_column_alias=>'ID_ARTYKULU'
,p_column_display_sequence=>1
,p_column_heading=>'ID_ARTYKULU'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849452082937974487)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849452476021974488)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849452875877974488)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849453270268974488)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849453614618974488)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849454048181974489)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849454409364974489)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849454890252974489)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849455271447974489)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(25849455697122974672)
,p_name=>'Artykuly'
,p_template=>wwv_flow_imp.id(25195865362129863068)
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'ARTYKULY'
,p_query_where=>'"ID_ARTYKULU" = :P20_ID_ARTYKULU'
,p_include_rowid_column=>false
,p_display_when_condition=>'P20_ID_ARTYKULU'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(25195906266002863088)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Record Selected'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849456378891974673)
,p_query_column_id=>1
,p_column_alias=>'ID_ARTYKULU'
,p_column_display_sequence=>1
,p_column_heading=>'Id Artykulu'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "ID_ARTYKULU" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849456707959974673)
,p_query_column_id=>2
,p_column_alias=>'KATEGORIA'
,p_column_display_sequence=>2
,p_column_heading=>'Kategoria'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "KATEGORIA" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849457190197974674)
,p_query_column_id=>3
,p_column_alias=>'NAZWA_ARTYKULU'
,p_column_display_sequence=>3
,p_column_heading=>'Nazwa Artykulu'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "NAZWA_ARTYKULU" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849457585131974674)
,p_query_column_id=>4
,p_column_alias=>'PRODUCENT'
,p_column_display_sequence=>4
,p_column_heading=>'Producent'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "PRODUCENT" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849457915824974674)
,p_query_column_id=>5
,p_column_alias=>'NIP_DOSTAWCY'
,p_column_display_sequence=>5
,p_column_heading=>'Nip Dostawcy'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "NIP_DOSTAWCY" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849458358124974674)
,p_query_column_id=>6
,p_column_alias=>'CENA_JEDNOSTKOWA'
,p_column_display_sequence=>6
,p_column_heading=>'Cena Jednostkowa'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "CENA_JEDNOSTKOWA" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849458794066974675)
,p_query_column_id=>7
,p_column_alias=>'ILOSC_MAGAZYN'
,p_column_display_sequence=>7
,p_column_heading=>'Ilosc Magazyn'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "ILOSC_MAGAZYN" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849459121743974675)
,p_query_column_id=>8
,p_column_alias=>'STATUS_PRODUKTU'
,p_column_display_sequence=>8
,p_column_heading=>'Status Produktu'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "STATUS_PRODUKTU" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25849459554731974675)
,p_query_column_id=>9
,p_column_alias=>'OUTLET'
,p_column_display_sequence=>9
,p_column_heading=>'Outlet'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "ARTYKULY"',
'where "OUTLET" is not null',
'and "ID_ARTYKULU" = :P20_ID_ARTYKULU'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25849466071005974682)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(25195399235107863035)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P20_ID_ARTYKULU'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25849483778601974852)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195399235107863035)
,p_plug_display_sequence=>70
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P20_ID_ARTYKULU'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25849484298120974852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25849455697122974672)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:RP,21:P21_ID_ARTYKULU:&P20_ID_ARTYKULU.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25849449440732974472)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25849448717351974471)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&APP_SESSION.:RESET:&DEBUG.:RP,20::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25849449813476974472)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25849448717351974471)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:RP,21::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25849450598436974473)
,p_name=>'P20_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25849450191477974473)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935477065863103)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25849465645334974682)
,p_name=>'P20_ID_ARTYKULU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(25849455697122974672)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25849484559577974852)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(25849455697122974672)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25849485197913974853)
,p_event_id=>wwv_flow_imp.id(25849484559577974852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25849455697122974672)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25849485630945974853)
,p_event_id=>wwv_flow_imp.id(25849484559577974852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Artykuly row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25849484622354974852)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25849486413753974853)
,p_event_id=>wwv_flow_imp.id(25849484622354974852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25849450949778974474)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25849486929590974854)
,p_event_id=>wwv_flow_imp.id(25849484622354974852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp.component_end;
end;
/

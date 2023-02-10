prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Koszyk zakupow'
,p_alias=>'KOSZYK-ZAKUPOW'
,p_step_title=>'Koszyk zakupow'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'img {',
'    width: 150px;',
'    height: 150px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_navigation_list_position=>'SIDE'
,p_navigation_list_id=>wwv_flow_imp.id(25195362416444863016)
,p_navigation_list_template_id=>wwv_flow_imp.id(25195926059875863098)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230116155927'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38622906850899016230)
,p_plug_name=>'Koszyk zakupow'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195806356046863040)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT seq_id item,',
'    p.ZDJECIE_PRODUKTU,',
'    p.ID_ARTYKULU,',
'    p.NAZWA_ARTYKULU,',
'    p.CENA_JEDNOSTKOWA,',
'    n002               quantity,',
'    p.CENA_JEDNOSTKOWA* n002 subtotal',
'FROM   apex_collections a,',
'    ARTYKULY p',
'WHERE  collection_name = ''ARTYKULY''',
'AND    p.ID_ARTYKULU = a.n001'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'Twoj koszyk jest pusty!'
,p_no_data_found_icon_classes=>'fa-cart-empty'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(38622906933433016231)
,p_region_id=>wwv_flow_imp.id(38622906850899016230)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAZWA_ARTYKULU'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'Ilosc: &QUANTITY.'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>Cena Jednostkowa: &CENA_JEDNOSTKOWA. </b> <BR>',
'<b>Calosc: &SUBTOTAL. </b>'))
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'ZDJECIE_PRODUKTU'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'ITEM'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(38622907032796016232)
,p_card_id=>wwv_flow_imp.id(38622906933433016231)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Edytuj'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::P18_ID_ARTYKULU:&ID_ARTYKULU.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-cart-edit'
,p_is_hot=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38622907152739016233)
,p_plug_name=>'Szczegoly Zamowienia'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38622907830437016240)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_button_name=>'Wyczysc'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Wyczysc koszyk'
,p_button_position=>'CHANGE'
,p_button_condition=>'KOSZYK_PRODUKTY'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-cart-empty'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38622907666880016238)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_button_name=>'Kasa'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Idz do kasy'
,p_button_position=>'CREATE'
,p_button_condition=>'KOSZYK_PRODUKTY'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38622908381834016245)
,p_branch_name=>'Przejdz do szczegolow'
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_ZAMOWIENIE:&P17_ID_ZAMOWIENIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(38622907830437016240)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38622908459161016246)
,p_branch_name=>'Idz do produktow'
,p_branch_action=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:29::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(38622907830437016240)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622907206760016234)
,p_name=>'P17_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_prompt=>'Email Klienta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622907310615016235)
,p_name=>'P17_IMIE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_prompt=>'Imie Klienta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622907496960016236)
,p_name=>'P17_ID_ZAMOWIENIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622907523667016237)
,p_name=>'P17_ID_KLIENTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(38622907152739016233)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(38622907918411016241)
,p_validation_name=>'Walidacja Imie'
,p_validation_sequence=>10
,p_validation=>'P17_IMIE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Prosze wpisz swoje Imie'
,p_when_button_pressed=>wwv_flow_imp.id(38622907666880016238)
,p_associated_item=>wwv_flow_imp.id(38622907310615016235)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(38622908013475016242)
,p_validation_name=>'Walidacja email'
,p_validation_sequence=>20
,p_validation=>'P17_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Prosze wpisz swoj email'
,p_when_button_pressed=>wwv_flow_imp.id(38622907666880016238)
,p_associated_item=>wwv_flow_imp.id(38622907206760016234)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38622908575487016247)
,p_name=>'Aktualizuj naglowek'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(38622906850899016230)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'parseInt(this.data.P18_KOSZYK_PRODUKTY) > 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622908671190016248)
,p_event_id=>wwv_flow_imp.id(38622908575487016247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Update Badge Text',
'apex.jQuery(".js-shopping-cart-item .t-Button-badge").text(this.data.P18_KOSZYK_PRODUKTY);',
'',
'// Update Icon',
'apex.jQuery(".js-shopping-cart-item .t-Icon").removeClass(''fa-cart-empty'').addClass(''fa-cart-full'');'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622908897672016250)
,p_event_id=>wwv_flow_imp.id(38622908575487016247)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Update Badge Text',
'apex.jQuery(".js-shopping-cart-item .t-Button-badge").text('''');',
'',
'// Update Icon',
'apex.jQuery(".js-shopping-cart-item .t-Icon").removeClass(''fa-cart-full'').addClass(''fa-cart-empty'');'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622908783304016249)
,p_event_id=>wwv_flow_imp.id(38622908575487016247)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(38622906850899016230)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39816617517229609401)
,p_event_id=>wwv_flow_imp.id(38622908575487016247)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(38622906850899016230)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622908163182016243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Kasa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    zarzadzanie_zamowieniami.wyczysc_koszyk;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38622907666880016238)
,p_process_success_message=>'Zamowienie zlozone!:&P17_ID_ZAMOWIENIA.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622908252238016244)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Wyczysc Wozek'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    zarzadzanie_zamowieniami.wyczysc_koszyk;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38622907830437016240)
);
wwv_flow_imp.component_end;
end;
/

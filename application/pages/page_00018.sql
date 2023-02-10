prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Dodaj do koszyka'
,p_alias=>'DODAJ-DO-KOSZYKA'
,p_page_mode=>'MODAL'
,p_step_title=>'Dodaj do koszyka'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'600'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230113102159'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38622903991712016201)
,p_plug_name=>'Produkt'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195806356046863040)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID_ARTYKULU,',
'    NAZWA_ARTYKULU,',
'    CENA_JEDNOSTKOWA,',
'    KATEGORIA,',
'    PRODUCENT,',
'    ZDJECIE_PRODUKTU,',
'    ZDJECIE_PRODUKTU_NAZWA,',
'    ILOSC_MAGAZYN',
'    STATUS_PRODUKTU',
'FROM   ARTYKULY',
'WHERE ID_ARTYKULU = :P18_ID_ARTYKULU',
'',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(38622904066238016202)
,p_region_id=>wwv_flow_imp.id(38622903991712016201)
,p_layout_type=>'FLOAT'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAZWA_ARTYKULU'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'KATEGORIA'
,p_body_adv_formatting=>false
,p_body_column_name=>'PRODUCENT'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'Cena: &CENA_JEDNOSTKOWA.'
,p_icon_source_type=>'BLOB'
,p_icon_blob_column_name=>'ZDJECIE_PRODUKTU'
,p_icon_position=>'START'
,p_icon_description=>'&ZDJECIE_PRODUKTU_NAZWA.'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID_ARTYKULU'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38622904338538016205)
,p_plug_name=>'Pasek przyciskow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195802055210863037)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38622904987222016211)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_button_name=>'Edytuj'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aktualizuj ilosc'
,p_button_position=>'CREATE'
,p_button_condition=>'P18_ILOSC_MAGAZYN'
,p_button_condition_type=>'ITEM_IS_NOT_ZERO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38622905012414016212)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_button_name=>'Usun'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Usun z koszyka'
,p_button_position=>'EDIT'
,p_button_condition=>'P18_ILOSC_MAGAZYN'
,p_button_condition_type=>'ITEM_IS_NOT_ZERO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38622904842584016210)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_button_name=>'Dodaj'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj do koszyka'
,p_button_position=>'NEXT'
,p_button_condition=>'P18_ILOSC_MAGAZYN'
,p_button_condition_type=>'ITEM_IS_ZERO'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622904491513016206)
,p_name=>'P18_AKCJA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622904559036016207)
,p_name=>'P18_ID_ARTYKULU'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622904624784016208)
,p_name=>'P18_KOSZYK_PRODUKTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38622904751854016209)
,p_name=>'P18_ILOSC_MAGAZYN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(38622904338538016205)
,p_prompt=>'Ilosc Magazyn'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:1;1,2;2,3;3,4;4,5;5'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(25195935819654863104)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38622905149939016213)
,p_computation_sequence=>10
,p_computation_item=>'P18_ILOSC_MAGAZYN'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'RETURN zarzadzanie_zamowieniami.produkt_istnieje(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU);'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622905225187016214)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Dodaj Produkt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF zarzadzanie_zamowieniami.produkt_istnieje(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU) = 0 THEN',
'        zarzadzanie_zamowieniami.dodaj_produkt (p_NAZWA_ARTYKULU  => :P18_ID_ARTYKULU,',
'                                p_ILOSC_MAGAZYN => :P18_ILOSC_MAGAZYN);',
'    END IF;',
'    :P18_AKCJA := ''DODAJ'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38622904842584016210)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622905393183016215)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Edytuj Produkt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF zarzadzanie_zamowieniami.produkt_istnieje(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU) > 0 THEN',
'        zarzadzanie_zamowieniami.usun_produkt(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU);',
'        zarzadzanie_zamowieniami.dodaj_produkt (p_NAZWA_ARTYKULU  => :P18_ID_ARTYKULU,',
'                                p_ILOSC_MAGAZYN => :P18_ILOSC_MAGAZYN);',
'    END IF;',
'    :P18_AKCJA := ''EDYTUJ'';',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38622904987222016211)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622905471215016216)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Usun Produkt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF zarzadzanie_zamowieniami.produkt_istnieje(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU) > 0 THEN',
'        zarzadzanie_zamowieniami.usun_produkt(p_NAZWA_ARTYKULU => :P18_ID_ARTYKULU);',
'    END IF;',
'    :P18_AKCJA := ''USUN'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38622905012414016212)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622905538021016217)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Licz przedmioty'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P18_KOSZYK_PRODUKTY := zarzadzanie_zamowieniami.sprawdz_ilosc;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38622905601448016218)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Zamknij okno'
,p_attribute_01=>'KOSZYK_PRODUKTY,P18_ID_ARTYKULU,P18_AKCJA,P18_ILOSC_MAGAZYN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/

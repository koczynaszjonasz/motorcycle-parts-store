prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Dodaj dostawce'
,p_alias=>'DODAJ-DOSTAWCE'
,p_step_title=>'Dodaj dostawce'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(38652491947320524882)
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230111212616'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38675560118254948983)
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
 p_id=>wwv_flow_imp.id(38675560759156949080)
,p_plug_name=>'Dodaj dostawce'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'DOSTAWCY'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38675564809331949083)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P13_NIP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38675563851043949082)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38675565222066949083)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Wy\015Blij')
,p_button_position=>'CREATE'
,p_button_condition=>'P13_NIP'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38675564425238949082)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P13_NIP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38675565545295949083)
,p_branch_action=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38587878523088472347)
,p_name=>'P13_REGON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_item_source_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_prompt=>'Regon'
,p_source=>'REGON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38675561064694949080)
,p_name=>'P13_NIP'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_item_source_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_prompt=>'Podaj nip dostawcy'
,p_source=>'NIP'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>13
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38675561461593949080)
,p_name=>'P13_NUMER_KONTA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_item_source_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Numer Konta'
,p_source=>'NUMER_KONTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>26
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38675561893815949081)
,p_name=>'P13_NAZWA_DOSTAWCY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_item_source_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nazwa Dostawcy'
,p_source=>'NAZWA_DOSTAWCY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38675562219055949081)
,p_name=>'P13_LOKALIZACJA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_item_source_plug_id=>wwv_flow_imp.id(38675560759156949080)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lokalizacja'
,p_source=>'LOKALIZACJA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>45
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(36610716135315290031)
,p_validation_name=>'BANKACC_VAL'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'        IF LENGTH(:P13_NUMER_KONTA) != 26 THEN',
unistr('            RETURN ''D\0142ugo\015B\0107 numeru rachunku musi wynosic 26 znakow!'';'),
'        END IF;',
'        FOR i IN 1..LENGTH(:P13_NUMER_KONTA) LOOP',
'            IF NOT (SUBSTR(:P13_NUMER_KONTA, i, 1) BETWEEN ''0'' AND ''9'') THEN',
unistr('                RETURN ''Numer rachunku musi zawiera\0107 jedynie cyfry!'';'),
'                EXIT;',
'            END IF;',
'        END LOOP;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(38675561461593949080)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38675566425745949084)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(38675560759156949080)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Dodaj dostawce'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38587878355708472345)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PACKAGE_VALIDATION_REGON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   result integer;',
'BEGIN',
'   result := PCKG_WALIDUJ_IDS.FDB_Waliduj_REGON(:P13_REGON);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Nie poprawny REGON.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38675565222066949083)
,p_process_success_message=>'Poprawny REGON. Dodano wiersz.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38587878629835472348)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PACKAGE_VALIDATION_NIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   result number;',
'BEGIN',
'   result := PCKG_WALIDUJ_IDS.FDB_Waliduj_NIP(:P13_NIP);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Nie poprawny NIP.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38675565222066949083)
,p_process_success_message=>'Poprawny NIP. Dodano wiersz.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38675566074529949084)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(38675560759156949080)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Dodaj dostawce'
);
wwv_flow_imp.component_end;
end;
/

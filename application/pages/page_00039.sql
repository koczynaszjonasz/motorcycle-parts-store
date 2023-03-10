prompt --application/pages/page_00039
begin
--   Manifest
--     PAGE: 00039
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
 p_id=>39
,p_name=>'Wyszukanie Dostawcow'
,p_alias=>'WYSZUKANIE-DOSTAWCOW'
,p_page_mode=>'MODAL'
,p_step_title=>'Wyszukanie Dostawcow'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(25195362742691863017)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230111231046'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39155262751702670335)
,p_plug_name=>'Wyszukanie Dostawcow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195399235107863035)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'DOSTAWCY'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39155266583133670339)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195802055210863037)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39155266944027670339)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39155266583133670339)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39155268327778670341)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39155266583133670339)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P39_NIP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39155268714419670341)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39155266583133670339)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P39_NIP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39155269111059670341)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(39155266583133670339)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P39_NIP'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39155263047458670336)
,p_name=>'P39_NIP'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_item_source_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nip'
,p_source=>'NIP'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39155263461931670336)
,p_name=>'P39_NUMER_KONTA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_item_source_plug_id=>wwv_flow_imp.id(39155262751702670335)
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
 p_id=>wwv_flow_imp.id(39155263832335670337)
,p_name=>'P39_NAZWA_DOSTAWCY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_item_source_plug_id=>wwv_flow_imp.id(39155262751702670335)
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
 p_id=>wwv_flow_imp.id(39155264275370670337)
,p_name=>'P39_LOKALIZACJA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_item_source_plug_id=>wwv_flow_imp.id(39155262751702670335)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39155264607733670337)
,p_name=>'P39_REGON'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_item_source_plug_id=>wwv_flow_imp.id(39155262751702670335)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Regon'
,p_source=>'REGON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39155267010493670339)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39155266944027670339)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39155267862204670340)
,p_event_id=>wwv_flow_imp.id(39155267010493670339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39155269959129670342)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(39155262751702670335)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Wyszukanie Dostawcow'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39155270365678670342)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39155269599972670341)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(39155262751702670335)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Wyszukanie Dostawcow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/

prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Rejestracja'
,p_alias=>'REJESTRACJA'
,p_page_mode=>'MODAL'
,p_step_title=>'Rejestracja'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'!'||wwv_flow_imp.id(37675337482478164540)
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_rejoin_existing_sessions=>'Y'
,p_page_component_map=>'02'
,p_last_updated_by=>'THEADVANCCE'
,p_last_upd_yyyymmddhh24miss=>'20230110194639'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25795539579903931893)
,p_plug_name=>'Rejestracja'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195399235107863035)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'KLIENCI'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25795549527163931901)
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
 p_id=>wwv_flow_imp.id(25795549979337931902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25795549527163931901)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25795551345286931903)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25795549527163931901)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P16_ID_KLIENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25795551743464931904)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(25795549527163931901)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P16_ID_KLIENTA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25795552185901931904)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(25795549527163931901)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P16_ID_KLIENTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795539828307931893)
,p_name=>'P16_ID_KLIENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_default=>'KLIENCI_SEQ'
,p_item_default_type=>'SEQUENCE'
,p_source=>'ID_KLIENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795540220981931894)
,p_name=>'P16_NAZWISKO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Nazwisko'
,p_source=>'NAZWISKO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>45
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795540646239931894)
,p_name=>'P16_IMIE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Imie'
,p_source=>'IMIE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>45
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795541091529931895)
,p_name=>'P16_NIP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Nip'
,p_source=>'NIP'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>13
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795541449489931895)
,p_name=>'P16_NUMER_KONTA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Numer Konta'
,p_source=>'NUMER_KONTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>26
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795541800067931896)
,p_name=>'P16_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>45
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795542686834931896)
,p_name=>'P16_HASLO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Haslo'
,p_source=>'HASLO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>45
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795543875105931897)
,p_name=>'P16_KOD_POCZTOWY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Kod Pocztowy'
,p_source=>'KOD_POCZTOWY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>6
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795544183551931898)
,p_name=>'P16_MIEJSCOWOSC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Miejscowosc'
,p_source=>'MIEJSCOWOSC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795544557835931898)
,p_name=>'P16_ULICA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Ulica'
,p_source=>'ULICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25795544985861931898)
,p_name=>'P16_NUMER__DOMU'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_item_source_plug_id=>wwv_flow_imp.id(25795539579903931893)
,p_prompt=>'Numer  Domu'
,p_source=>'NUMER__DOMU'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(25195937056376863105)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(25730680519444637217)
,p_validation_name=>unistr('Weryfikacja has\0142a')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF 8 <= LENGTH(:P16_HASLO) AND  LENGTH(:P16_HASLO) <= 15  THEN',
'    IF REGEXP_LIKE(:P16_HASLO, ''^.*[0-9]'') THEN',
' IF REGEXP_LIKE(:P16_HASLO, ''^.*[a-z]'', ''c'') THEN',
' IF REGEXP_LIKE(:P16_HASLO, ''^.*[A-Z]'', ''c'') THEN',
' IF REGEXP_LIKE(:P16_HASLO, ''^.*[!@#$%^&*()_]'', ''c'') THEN',
' RETURN '''';',
' ELSE',
unistr('    RETURN ''Has\0142o nie ma ani jednego znaku specjalnego'';'),
' END IF;',
' ELSE',
unistr('    RETURN ''Has\0142o nie ma ani jednej du\017Cej litery'';'),
' END IF;   ',
' ELSE',
unistr('    RETURN ''Has\0142o nie ma ani jednej ma\0142ej litery'';'),
' END IF;',
' ELSE',
unistr('    RETURN ''Has\0142o nie ma ani jednej cyfry'';'),
' END IF; ',
'ELSE',
unistr('RETURN ''D\0142ugo\015B\0107 has\0142a musi wynosi\0107 min 8 znak\00F3w i max 15 znak\00F3w'),
unistr('a d\0142ugo\015B\0107 Twojego has\0142a to''||'' ''||LENGTH(:P16_HASLO);'),
'END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(25795542686834931896)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(25730681047621637222)
,p_validation_name=>'walidacja adresu email'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' IF regexp_like (:P16_EMAIL, ''^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')',
' THEN',
' RETURN '''';',
' ELSE',
'    RETURN ''Podano nie poprawny e-mail'';',
' END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(25795541800067931896)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25795550038249931902)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25795549979337931902)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25795550896090931903)
,p_event_id=>wwv_flow_imp.id(25795550038249931902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25795552918267931904)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(25795539579903931893)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Rejestracja'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25730681185906637223)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'send email'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'l_body_html CLOB;',
'v_email nvarchar2(50);',
'',
'begin',
'',
'select EMAIL into v_email from KLIENCI',
'',
'where id_klienta = :P16_ID_KLIENTA;',
'',
'l_body_html := ''',
'',
'<html lang="en-US">',
'',
'         <head>',
'',
'  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">',
'',
'         </head>',
'',
'                <body>',
'',
'<div style="height:300px; width: 800px;border: 1px solid rgb(167, 162, 162);box-shadow: 2px 2px 5px 2px rgb(216, 204, 203);">',
'',
'          <div style="background:#244283; height: 40px; width: 800px;color:#fff; ">',
'',
'      <h2 style="margin-left:20px; margin-top: 0px; padding-top: 10px;">Account Verification Email</h2>',
'',
'     </div>',
'',
'     <div style="height: 45px;margin: 20px;" >',
'',
'     <p>',
'',
unistr('                    Dzi\0119kujemy za rejestracj\0119.'),
'',
'                   ',
'',
'                    <br>',
'',
unistr('     \017Beby zweryfikowa\0107 sw\00F3j mail, klikinj link poni\017Cej.</p>'),
'',
'     <p><a href="https://apex.oracle.com/pls/apex/r/myszard/sklep-z-cz%C4%99%C5%9Bciami-motocyklowymi/weryfikacja-maila?P3_EMAIL_VER=''||v_email||''">Zweryfikuj swoje konto</a></p><br>',
'',
'  </div>',
'',
'</div> ',
'',
'</body>',
'',
'</html>',
'',
''';',
'',
'APEX_MAIL.SEND(:P16_EMAIL,''no-reply@many_moto.com'',l_body_html,l_body_html,''E-mail weryfikacyjny konta'',null,null,null);',
'',
'exception when others then null;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Sukces! \017Beby potwierdzi\0107 sw\00F3j adres emial przejd\017A do swojej skrzynki pocztowej! ')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25795553364568931905)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25795552515541931904)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(25795539579903931893)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Rejestracja'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/

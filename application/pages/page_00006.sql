prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>unistr('Reset has\0142a')
,p_alias=>unistr('RESET-HAS\0141A')
,p_step_title=>unistr('Reset has\0142a')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'16'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230110184251'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25730682628964637238)
,p_plug_name=>unistr('Reset has\0142a')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--standardPadding:margin-top-lg:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'                    <div style = "text-align:center; color:red;">',
'                        <div style="font-size:1.3rem;">',
'                        	<b>',
unistr('                            <u> Zmie\0144 swoje has\0142o. </u>'),
'                            </b>                   ',
'                        </div>',
'                    </div>',
'                '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25730682758623637239)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(25730682628964637238)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25730683140467637243)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(25730682758623637239)
,p_button_name=>'Submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>unistr('Wy\015Blij')
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25730682831104637240)
,p_name=>'P6_EMAIL_ADDRESS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25730682758623637239)
,p_prompt=>'Email adres'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_attribute_06=>'null'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25730682966212637241)
,p_name=>'P6_NEW_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(25730682758623637239)
,p_prompt=>unistr('Nowe has\0142o')
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
 p_id=>wwv_flow_imp.id(25730683020681637242)
,p_name=>'P6_CONFIRM_NEW_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(25730682758623637239)
,p_prompt=>unistr('Potwierd\017A nowe has\0142o')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(25730683278125637244)
,p_validation_name=>unistr('Sprawdzanie czy has\0142a s\0105 takie same')
,p_validation_sequence=>10
,p_validation=>':P6_NEW_PASSWORD = :P6_CONFIRM_NEW_PASSWORD'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Podane has\0142a s\0105 r\00F3\017Cne')
,p_when_button_pressed=>wwv_flow_imp.id(25730683140467637243)
,p_associated_item=>wwv_flow_imp.id(25730682966212637241)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(38587876290275472324)
,p_validation_name=>unistr('D\0142ugo\015B\0107 has\0142a')
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF 8 <= LENGTH(:P6_NEW_PASSWORD) AND  LENGTH(:P6_NEW_PASSWORD) <= 15  THEN',
'    IF REGEXP_LIKE(:P6_NEW_PASSWORD, ''^.*[0-9]'') THEN',
' IF REGEXP_LIKE(:P6_NEW_PASSWORD, ''^.*[a-z]'', ''c'') THEN',
' IF REGEXP_LIKE(:P6_NEW_PASSWORD, ''^.*[A-Z]'', ''c'') THEN',
' IF REGEXP_LIKE(:P6_NEW_PASSWORD, ''^.*[!@#$%^&*()_]'', ''c'') THEN',
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
unistr('a d\0142ugo\015B\0107 Twojego has\0142a to''||'' ''||LENGTH(:P6_NEW_PASSWORD);'),
'END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(25730682966212637241)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25730683363499637245)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Zmiana has\0142a w bazie')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                    BEGIN',
'                        UPDATE KLIENCI',
'                           SET HASLO = :P6_CONFIRM_NEW_PASSWORD',
'                         WHERE EMAIL = :P6_EMAIL_ADDRESS;',
'                        APEX_APPLICATION.g_print_success_message :=',
unistr('                            ''Has\0142o zosta\0142o pomy\015Blnie zmienione'';'),
'                    EXCEPTION',
'                        WHEN OTHERS',
'                        THEN',
unistr('                            APEX_APPLICATION.g_print_success_message := ''Has\0142o nie zosta\0142o zmienione'';'),
'                    END;',
'               '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(25730683140467637243)
);
wwv_flow_imp.component_end;
end;
/

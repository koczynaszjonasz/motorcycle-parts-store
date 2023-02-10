prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>unistr('Reset Has\0142a_')
,p_alias=>unistr('RESET-HAS\0141A1')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Reset Has\0142a_')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230110180404'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38587874058257472302)
,p_plug_name=>unistr('Reset has\0142a')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'KLIENCI'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38588060959123808606)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(38587874058257472302)
,p_button_name=>'Submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>unistr('Wy\015Blij')
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38587874257362472304)
,p_branch_name=>'Submit'
,p_branch_action=>'f?p=&APP_ID.:9999:&SESSION.::&DEBUG.:9999::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38587874530592472307)
,p_name=>'P7_ID_KLIENTA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38587874058257472302)
,p_item_source_plug_id=>wwv_flow_imp.id(38587874058257472302)
,p_source=>'ID_KLIENTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38587932192387477577)
,p_name=>'P7_EMAIL_ADDRESS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(38587874058257472302)
,p_prompt=>'Email Address'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38587874168736472303)
,p_process_sequence=>10
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
'where EMAIL = :P7_EMAIL_ADDRESS;',
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
unistr('      <h2 style="margin-left:20px; margin-top: 0px; padding-top: 10px;">Reset has\0142a</h2>'),
'',
'     </div>',
'',
'     <div style="height: 45px;margin: 20px;" >',
'',
'     <p>',
'',
unistr('                    Dzi\0119kujemy za wys\0142anie pro\015Bby o reset has\0142a.'),
'',
'                   ',
'',
'                    <br>',
'',
unistr('     \017Beby zresetowa\0107 swoje has\0142o, klikinj link poni\017Cej.</p>'),
'',
unistr('     <p><a href="https://apex.oracle.com/pls/apex/r/myszard/sklep-z-cz%C4%99%C5%9Bciami-motocyklowymi/reset-has%C5%82a?P6_EMAIL_ADDRESS=''||v_email||''">Zresetuj swoje has\0142o</a></p><br>'),
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
unistr('APEX_MAIL.SEND(:P7_EMAIL_ADDRESS,''no-reply@many_moto.com'',l_body_html,l_body_html,''E-mail resetuj\0105cy has\0142o'',null,null,null);'),
'',
'exception when others then null;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38588060959123808606)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38587874425290472306)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(38587874058257472302)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Reset Has\0142a_')
);
wwv_flow_imp.component_end;
end;
/

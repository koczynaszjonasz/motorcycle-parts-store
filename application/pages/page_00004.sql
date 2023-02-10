prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Weryfikacja Maila'
,p_alias=>'WERYFIKACJA-MAILA'
,p_step_title=>'Weryfikacja Maila'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'25'
,p_last_updated_by=>'JONASZ2105@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230112001011'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25730681682721637228)
,p_plug_name=>unistr('Wiadomo\015B\0107 weryfikacyjna')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_email nvarchar2(50);',
'',
'begin',
'',
'select EMAIL into v_email  from KLIENCI where EMAIL = :P3_EMAIL_VER;',
'',
'if v_email is not null then',
'',
'update KLIENCI set POTWIERDZONY_MAIL = ''TAK'' where EMAIL = :P3_EMAIL_VER;',
'',
'',
'htp.print(''',
'',
'      <style>',
'',
'      .class1',
'',
'      {',
'',
'       text-align:center;',
'',
'      }',
'',
'      </style>',
' <div style = "text-align:center;">',
'',
'          <h4>',
'',
unistr('               Gratulacje, Twoja weryfikacja konta jest zako\0144czona!.</br>'),
'',
unistr('                 <a href="https://apex.oracle.com/pls/apex/r/myszard/sklep-z-cz%C4%99%C5%9Bciami-motocyklowymi/login">kliknij</a> tutaj, \017Ceby si\0119 zalogowa\0107.'),
'    </h4>',
'',
'      </div>',
'',
'      '');',
'',
'      else',
'',
'      htp.print(''',
'',
'            <style>',
'',
'      .class2',
'',
'      {',
'',
'       text-align:center;',
'',
'      }',
'',
'      </style>',
'',
'      <div class="class2">',
'',
'          <p>',
'',
unistr('               Przepraszam, co\015B posz\0142o nie tak.</br>'),
'',
unistr('                 Prosz\0119 jeszcze raz spr\00F3bwa\0107 si\0119 zarejestrowa\0107 po up\0142ywie 30 min.'),
'',
'     ',
'',
'          </p>',
'',
'      </div>',
'',
'      '');',
'',
'      end if;',
'',
'      exception when others then null;',
'      ',
'    return v_email;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37040793771571490802)
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
 p_id=>wwv_flow_imp.id(39165540205983022701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(25730681682721637228)
,p_button_name=>'Kliknij'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(25195938296627863106)
,p_button_image_alt=>unistr('Kliknij, aby otrzyma\0107 RABAT')
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25730681725581637229)
,p_name=>'P3_EMAIL_VER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25730681682721637228)
,p_prompt=>'Email Ver'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38587878759738472349)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RABAT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P3_EMAIL_VER IS NOT NULL THEN ',
'UPDATE KLIENCI ',
'    SET RABAT = 5',
'    WHERE EMAIL=:P3_EMAIL_VER;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(39165540205983022701)
);
wwv_flow_imp.component_end;
end;
/

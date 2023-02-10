prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 23067
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(25195941235725863108)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(25195389178311863030)
,p_default_dialog_template=>wwv_flow_imp.id(25195383930869863028)
,p_error_template=>wwv_flow_imp.id(25195373332035863023)
,p_printer_friendly_template=>wwv_flow_imp.id(25195389178311863030)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(25195373332035863023)
,p_default_button_template=>wwv_flow_imp.id(25195938296627863106)
,p_default_region_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_chart_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_form_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_reportr_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_tabform_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_wizard_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_menur_template=>wwv_flow_imp.id(25195877711652863073)
,p_default_listr_template=>wwv_flow_imp.id(25195865362129863068)
,p_default_irr_template=>wwv_flow_imp.id(25195855485177863063)
,p_default_report_template=>wwv_flow_imp.id(25195903228232863086)
,p_default_label_template=>wwv_flow_imp.id(25195935781632863104)
,p_default_menu_template=>wwv_flow_imp.id(25195939834312863106)
,p_default_calendar_template=>wwv_flow_imp.id(25195939916788863107)
,p_default_list_template=>wwv_flow_imp.id(25195919679617863095)
,p_default_nav_list_template=>wwv_flow_imp.id(25195931495601863101)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(25195931495601863101)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(25195926059875863098)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(25195802055210863037)
,p_default_dialogr_template=>wwv_flow_imp.id(25195399235107863035)
,p_default_option_label=>wwv_flow_imp.id(25195935781632863104)
,p_default_required_label=>wwv_flow_imp.id(25195937056376863105)
,p_default_navbar_list_template=>wwv_flow_imp.id(25195925629599863098)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/

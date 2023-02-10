prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 23067
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(23067)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:31:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:9999:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(25195362416444863016)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(25195926059875863098)
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(25195963731847863119)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(25195925629599863098)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/

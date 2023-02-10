prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_name=>'Strona domowa'
,p_alias=>'STRONA-DOMOWA'
,p_step_title=>'Many Moto'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body {',
'background-image: url("#APP_FILES#zdjecie2.jpg");',
'background-size: 1920px 1080px;',
'}'))
,p_step_template=>wwv_flow_imp.id(25195389178311863030)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230113131744'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38164649950514239168)
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
 p_id=>wwv_flow_imp.id(39816617719443609403)
,p_button_sequence=>10
,p_button_name=>'KOSZYK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Koszyk'
,p_button_position=>'BEFORE_NAVIGATION_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-cart-empty'
);
wwv_flow_imp.component_end;
end;
/

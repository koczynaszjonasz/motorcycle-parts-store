prompt --application/shared_components/security/authentications/autoryzacja
begin
--   Manifest
--     AUTHENTICATION: autoryzacja
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(37712825898410582534)
,p_name=>'autoryzacja'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'autoryzacja'
,p_attribute_05=>'N'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_imp.component_end;
end;
/

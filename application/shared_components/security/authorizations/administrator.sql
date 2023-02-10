prompt --application/shared_components/security/authorizations/administrator
begin
--   Manifest
--     SECURITY SCHEME: Administrator
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(38652491947320524882)
,p_name=>'Administrator'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>'SELECT ROLA_UZYTKOWNIKA FROM KLIENCI WHERE UPPER(EMAIL) = V(''APP_USER'') AND ROLA_UZYTKOWNIKA IN (''admin'')'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/

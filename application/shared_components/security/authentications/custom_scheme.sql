prompt --application/shared_components/security/authentications/custom_scheme
begin
--   Manifest
--     AUTHENTICATION: custom_scheme
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
 p_id=>wwv_flow_imp.id(37659384087437757831)
,p_name=>'custom_scheme'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'user_aut'
,p_attribute_05=>'N'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION user_aut(',
'    ',
' p_username IN VARCHAR2, --User_Name',
' p_password IN VARCHAR2 -- Password    ',
')',
' RETURN BOOLEAN',
'AS',
' lc_pwd_exit VARCHAR2 (3);',
'BEGIN',
' -- Validate whether the user exits or not',
' SELECT ''TAK''',
' INTO lc_pwd_exit',
' FROM KLIENCI',
' WHERE upper(EMAIL) = UPPER (p_username) AND HASLO = p_password and POTWIERDZONY_MAIL = ''TAK'' ',
';',
'RETURN TRUE;',
'EXCEPTION',
' WHEN NO_DATA_FOUND',
' THEN',
' RETURN FALSE;',
'END user_aut;'))
,p_verification_function=>'log_in'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_imp.component_end;
end;
/

prompt --application/shared_components/logic/application_items/koszyk_ikona
begin
--   Manifest
--     APPLICATION ITEM: KOSZYK_IKONA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(38420542314882293330)
,p_name=>'KOSZYK_IKONA'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/

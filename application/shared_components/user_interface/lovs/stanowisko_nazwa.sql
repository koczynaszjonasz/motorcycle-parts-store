prompt --application/shared_components/user_interface/lovs/stanowisko_nazwa
begin
--   Manifest
--     STANOWISKO.NAZWA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(38664355985309074553)
,p_lov_name=>'STANOWISKO.NAZWA'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'STANOWISKO'
,p_return_column_name=>'ID_STANOWISKA'
,p_display_column_name=>'NAZWA'
,p_default_sort_column_name=>'NAZWA'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/

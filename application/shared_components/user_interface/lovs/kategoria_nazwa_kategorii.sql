prompt --application/shared_components/user_interface/lovs/kategoria_nazwa_kategorii
begin
--   Manifest
--     KATEGORIA.NAZWA_KATEGORII
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
 p_id=>wwv_flow_imp.id(25840906826090628125)
,p_lov_name=>'KATEGORIA.NAZWA_KATEGORII'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'KATEGORIA'
,p_return_column_name=>'KATEGORIA'
,p_display_column_name=>'NAZWA_KATEGORII'
,p_default_sort_column_name=>'NAZWA_KATEGORII'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/

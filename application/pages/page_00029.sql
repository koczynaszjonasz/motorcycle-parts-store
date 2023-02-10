prompt --application/pages/page_00029
begin
--   Manifest
--     PAGE: 00029
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
 p_id=>29
,p_name=>'Produkty'
,p_alias=>'PRODUKTY'
,p_step_title=>'Produkty'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(25195365673221863019)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
,p_last_updated_by=>'MACIEKZAK550@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230113113807'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38156617583103728995)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38156618186468728999)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(25195806356046863040)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID_ARTYKULU",',
'       "KATEGORIA",',
'       ( select l1."NAZWA_KATEGORII" from "KATEGORIA" l1 where l1."KATEGORIA" = m."KATEGORIA") "KATEGORIA_L$1",',
'       "NAZWA_ARTYKULU",',
'       "PRODUCENT",',
'       "NIP_DOSTAWCY",',
'       ( select l2."NUMER_KONTA" from "DOSTAWCY" l2 where l2."NIP" = m."NIP_DOSTAWCY") "NIP_DOSTAWCY_L$2",',
'       "CENA_JEDNOSTKOWA",',
'       "ILOSC_MAGAZYN",',
'       "STATUS_PRODUKTU",',
'       "OUTLET",',
'       "ZDJECIE_PRODUKTU",',
'       "ZDJECIE_PRODUKTU_NAZWA"',
'from "ARTYKULY" m'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P29_ORDER_BY", "orderBys": [{"key":"NAZWA_ARTYKULU","expr":"\"NAZWA_ARTYKULU\" asc"},{"key":"PRODUCENT","expr":"\"PRODUCENT\" asc"},{"key":"CENA_JEDNOSTKOWA","expr":"\"CENA_JEDNOSTKOWA\" asc"}]}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(38156623066972729004)
,p_region_id=>wwv_flow_imp.id(38156618186468728999)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'h3 {text-align: center;}',
'</style>',
'<h3>&NAZWA_ARTYKULU.</h3>'))
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b class="u-success-text u-pullRight" id="message_&ID_ARTYKULU.">',
'{if ILOSC_MAGAZYN/} &ILOSC_MAGAZYN. w magazynie {endif/}',
'</b>',
'<b>&CENA_JEDNOSTKOWA. zl</b>'))
,p_body_adv_formatting=>false
,p_body_column_name=>'PRODUCENT'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'ZDJECIE_PRODUKTU'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'WIDESCREEN'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'ID_ARTYKULU'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(38622905761330016219)
,p_card_id=>wwv_flow_imp.id(38156623066972729004)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:18:P18_ID_ARTYKULU:&ID_ARTYKULU.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38156618226021728999)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(25195865362129863068)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(38156618186468728999)
,p_landmark_label=>'Filters'
,p_attribute_01=>'N'
,p_attribute_06=>'E'
,p_attribute_08=>'#active_facets'
,p_attribute_09=>'Y'
,p_attribute_10=>'Wyniki wyszukiwania:'
,p_attribute_12=>'10000'
,p_attribute_13=>'Y'
,p_attribute_15=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38156621840392729003)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(25195802055210863037)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>'<div id="active_facets"></div>'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39816617610614609402)
,p_button_sequence=>10
,p_button_name=>'KOSZYK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Koszyk'
,p_button_position=>'BEFORE_NAVIGATION_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-shopping-cart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38156622332897729003)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38156621840392729003)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(25195938392385863106)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&APP_SESSION.::&DEBUG.:RR,29::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156618757918729000)
,p_name=>'P29_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Search'
,p_source=>'ZDJECIE_PRODUKTU_NAZWA,KATEGORIA,NAZWA_ARTYKULU,NIP_DOSTAWCY,STATUS_PRODUKTU,OUTLET,PRODUCENT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attribute_01=>'ROW'
,p_attribute_02=>'FACET'
,p_attribute_04=>'N'
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156619152706729001)
,p_name=>'P29_KATEGORIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Kategoria'
,p_source=>'KATEGORIA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'KATEGORIA.NAZWA_KATEGORII'
,p_attribute_01=>'1'
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156619581238729001)
,p_name=>'P29_PRODUCENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Producent'
,p_source=>'PRODUCENT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156620374383729002)
,p_name=>'P29_CENA_JEDNOSTKOWA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Cena Jednostkowa'
,p_source=>'CENA_JEDNOSTKOWA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>unistr('STATIC2:<50z\0142;|50,50 - 120z\0142;50|120,120 - 150z\0142;120|150,150 - 300z\0142;150|300,>=300z\0142;300|')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156620759538729002)
,p_name=>'P29_ILOSC_MAGAZYN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Ilosc Magazyn'
,p_source=>'ILOSC_MAGAZYN'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC2:<2;|2,2 - 5;2|5,5 - 9;5|9,9 - 20;9|20,>=20;20|'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156621195177729002)
,p_name=>'P29_STATUS_PRODUKTU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Status Produktu'
,p_source=>'STATUS_PRODUKTU'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_attribute_01=>'1'
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156621553675729003)
,p_name=>'P29_OUTLET'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(38156618226021728999)
,p_prompt=>'Outlet'
,p_source=>'OUTLET'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
,p_attribute_03=>'Y'
,p_attribute_05=>'N'
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_toggleable=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38156623518624729005)
,p_name=>'P29_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38156618186468728999)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'NAZWA_ARTYKULU'
,p_prompt=>'Sortuj'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC2:Nazwa artyku\0142u;NAZWA_ARTYKULU,Producent;PRODUCENT,Cena jednostkowa w z\0142;CENA_JEDNOSTKOWA')
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(25195935781632863104)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38622905898466016220)
,p_name=>'Pokaz wiadomosc o sukcesie'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(38156618186468728999)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622905963053016221)
,p_event_id=>wwv_flow_imp.id(38622905898466016220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var productAction   = this.data.P18_AKCJA,',
'    productQuantity = this.data.P18_ILOSC_MAGAZYN,',
'    productCard$  = apex.jQuery("#message_" + this.data.P18_ID_ARTYKULU);',
'',
'if (productAction === ''DODAJ'') {',
'    productCard$.text("Dodano " + productQuantity + " do koszyka!");',
'} else if (productAction === ''EDYTUJ'') {',
'    productCard$.text("Zaktualizowano ilosc " + productQuantity + "!");',
'} else if (productAction === ''USUN'') {',
'    productCard$.text("Usunieto z koszyka!");',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38622906245883016224)
,p_name=>'Aktualizuj naglowek koszyka'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(38156618186468728999)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'parseInt(this.data.P18_KOSZYK_PRODUKTY) > 0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622906310256016225)
,p_event_id=>wwv_flow_imp.id(38622906245883016224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'// Update Badge Text',
'apex.jQuery(".js-koszyk-produkty .t-Button-badge").text(this.data.P18_KOSZYK_PRODUKTY);',
'',
'// Update Icon',
'apex.jQuery(".js-koszyk-produkty .t-Icon").removeClass(''fa-cart-empty'').addClass(''fa-cart-full'');',
'',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38622906479761016226)
,p_event_id=>wwv_flow_imp.id(38622906245883016224)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Update Badge Text',
'apex.jQuery(".js-koszyk-produkty .t-Button-badge").text('''');',
'',
'// Update Icon',
'apex.jQuery(".js-koszyk-produkty .t-Icon").removeClass(''fa-cart-full'').addClass(''fa-cart-empty'');',
''))
);
wwv_flow_imp.component_end;
end;
/

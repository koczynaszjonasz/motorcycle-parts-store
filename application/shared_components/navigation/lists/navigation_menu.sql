prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>25142937697737223804
,p_default_application_id=>23067
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MYSZARD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(25195362416444863016)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25195974315058863135)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Panel administratora'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25841361331380670188)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Dodaj artyku\0142y')
,p_list_item_link_target=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-forms'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38664352676894074430)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Dodaj pracownika'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-forms'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38674161365946261401)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>unistr('Dodaj nazw\0119 stanowiska i p\0142ac\0119 pracownika')
,p_list_item_link_target=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-forms'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38675559661953948982)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Dodaj dostawce'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-forms'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39155200652186655736)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Wyszukanie Klientow'
,p_list_item_link_target=>'f?p=&APP_ID.:34:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'34,35'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39155944417289334506)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Wyszukanie Artykulow'
,p_list_item_link_target=>'f?p=&APP_ID.:36:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'36,37'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39155270905323670343)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Wyszukanie Dostawcow'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'38,39'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(41066679275739262858)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>unistr('Data zam\00F3wienia')
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(41087267389640583461)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Pracownicy - tabela'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_parent_list_item_id=>wwv_flow_imp.id(25195974315058863135)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(37040793292881490802)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Weryfikacja Maila'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_security_scheme=>'!'||wwv_flow_imp.id(38652653134400851820)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38156617008788728994)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Produkty'
,p_list_item_link_target=>'f?p=&APP_ID.:29:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table-search'
,p_security_scheme=>wwv_flow_imp.id(38652653134400851820)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'29'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38164649423056239167)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Strona domowa'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_security_scheme=>wwv_flow_imp.id(38652653134400851820)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'31'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38555001243641410641)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>unistr('Reset has\0142a')
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_security_scheme=>'!'||wwv_flow_imp.id(38652653134400851820)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(38587829110870469217)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>unistr('Reset Has\0142a_')
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_security_scheme=>'!'||wwv_flow_imp.id(38652653134400851820)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39144980611079861254)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-dashboard'
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'33'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39153658625218623879)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>unistr('Wy\015Bwietlanie klient\00F3w')
,p_list_item_link_target=>'f?p=&APP_ID.:35:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'35,36'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(39153937405331308291)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Wyswietlanie Artykulow'
,p_list_item_link_target=>'f?p=&APP_ID.:37:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_security_scheme=>wwv_flow_imp.id(38652491947320524882)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'37,38'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(41081448416128493798)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'O NAS'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'9'
);
wwv_flow_imp.component_end;
end;
/

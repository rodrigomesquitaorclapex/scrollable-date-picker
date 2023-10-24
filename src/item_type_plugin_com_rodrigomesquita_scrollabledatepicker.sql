prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>461892527200270202
,p_default_application_id=>120
,p_default_id_offset=>0
,p_default_owner=>'WKSP_QUICKBOOKME'
);
end;
/
 
prompt APPLICATION 120 - QuickBookMe
--
-- Application Export:
--   Application:     120
--   Name:            QuickBookMe
--   Date and Time:   20:16 Tuesday October 24, 2023
--   Exported By:     QUICKBOOKME
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 477527662944594475
--   Manifest End
--   Version:         23.1.5
--   Instance ID:     7605533469494042
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/com_rodrigomesquita_scrollabledatepicker
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(477527662944594475)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.RODRIGOMESQUITA.SCROLLABLEDATEPICKER'
,p_display_name=>'Scrollable Date Picker'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_javascript_file_urls=>'#PLUGIN_FILES#scrollable-datepicker#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#scrollable-datepicker.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------------------------------',
'-- Render Procedure',
'--------------------------------------------------------------------------------',
'procedure render (',
'    p_item   in            apex_plugin.t_item,',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_param  in            apex_plugin.t_item_render_param,',
'    p_result in out nocopy apex_plugin.t_item_render_result )',
'is',
'l_week_days      p_plugin.attribute_01%type := p_plugin.attribute_01;',
'l_month_names    p_plugin.attribute_02%type := p_plugin.attribute_02;',
'',
'begin',
'',
'   apex_debug.info(''plugin ''||p_item.name||'' started'');',
'   apex_plugin_util.debug_page_item (',
'    p_plugin    => p_plugin,',
'    p_page_item => p_item );',
'',
'     ',
'            sys.htp.prn(''<input style="display:none;" type="text" id="'' || p_item.name || ''" name="'' || p_item.name || ''" />'');',
'            sys.htp.prn(''<div id="sd_''||p_item.name||''"class="sd-date-selector">'');',
'            sys.htp.prn(''<div class="sd-monthPicker" currentMonth="">'');',
'            sys.htp.prn(''<span id="sd-previous-month" class="fa fa-chevron-left sd-dt-selector" aria-hidden="true"></span><b class="sd-monthName"></b><span id="sd-next-month" class="fa fa-chevron-right sd-dt-selector" aria-hidden="true"></span>'');',
'            sys.htp.prn(''</div>'');',
'            sys.htp.prn(''<div class="scrollable-datepicker">'');',
'            sys.htp.prn(''<ul id="sd-calendar"> </ul>'');',
'            sys.htp.prn(''</div>'');',
'            sys.htp.prn(''</div>'');',
'            ',
'    apex_javascript.add_onload_code (p_code => ''scrollableDatepicker.init(''||',
'                                                apex_javascript.add_value (',
'                                                p_value     => p_item.name,',
'                                                p_add_comma => true )  ||',
'                                                apex_javascript.add_value (',
'                                                p_value     => l_week_days,',
'                                                p_add_comma => true )  ||',
'                                                apex_javascript.add_value (',
'                                                p_value     => l_month_names,',
'                                                p_add_comma => false )  || '');'');',
'',
'    apex_debug.info(''plugin ''||p_item.name||'' ended'');',
'   ',
'',
'end render;',
''))
,p_default_escape_mode=>'HTML'
,p_api_version=>2
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'  Oracle APEX Item Plugin Scrollable Date Picker.',
'</p>',
'<p>',
'  Author: <code>Rodrigo Mesquita</code><br/>',
'  E-mail: <code>rodrigomesquita.ti@gmail.com</code><br/>',
'  X: <code>@mesquitarod</code><br/>',
'  Plugin home page: <code>https://github.com/rodrigomesquitaorclapex/scrollable-date-picker</code>',
'  License: Licensed under the MIT (LICENSE.txt) license.',
'</p>'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://apexblog.dev/new-oracle-apex-plugin-scrollable-date-picker'
,p_files_version=>135
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(477646693654884720)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Week Days'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(477648748778890752)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Month Names'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
,p_text_case=>'UPPER'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(477604960478808999)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_name=>'scrollable-datepicker-change'
,p_display_name=>'Change'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E73642D646174652D73656C6563746F72207B0A202020206865696768743A20323576683B0A20202020746578742D616C69676E3A2063656E7465723B0A7D0A0A756C2373642D63616C656E646172207B0A20202020637572736F723A20677261623B0A';
wwv_flow_imp.g_varchar2_table(2) := '7D0A0A2E7363726F6C6C61626C652D646174657069636B6572207B0A20202020636F6C6F723A20626C61636B3B0A202020206F766572666C6F772D783A206175746F3B0A2020202077686974652D73706163653A206E6F777261703B0A20202020736372';
wwv_flow_imp.g_varchar2_table(3) := '6F6C6C6261722D77696474683A206E6F6E653B202F2A2046697265666F78202A2F0A202020202D6D732D6F766572666C6F772D7374796C653A206E6F6E653B20202F2A2049452031302B202A2F0A7D0A0A2E7363726F6C6C61626C652D64617465706963';
wwv_flow_imp.g_varchar2_table(4) := '6B65723A3A2D7765626B69742D7363726F6C6C626172207B202F2A205765624B6974202A2F0A2020202077696474683A20303B0A202020206865696768743A20303B0A7D0A0A2E7363726F6C6C61626C652D646174657069636B657220756C207B0A2020';
wwv_flow_imp.g_varchar2_table(5) := '20206C6973742D7374796C652D747970653A206E6F6E653B0A202020206D617267696E3A20303B0A2020202070616464696E673A20303B0A7D0A0A2E7363726F6C6C61626C652D646174657069636B657220756C206C69207B0A20202020646973706C61';
wwv_flow_imp.g_varchar2_table(6) := '793A20696E6C696E652D626C6F636B3B0A20202020626F726465722D7261646975733A203530253B0A20202020746578742D616C69676E3A2063656E7465723B0A2020202070616464696E673A203132707820303B0A20202020666F6E742D73697A653A';
wwv_flow_imp.g_varchar2_table(7) := '20313470783B0A202020206D617267696E3A20313070783B0A7D0A0A2E73642D6461794E756D2E73642D616374697665207B0A202020206261636B67726F756E643A20236565343134313B0A20202020636F6C6F723A20236666666666663B0A20202020';
wwv_flow_imp.g_varchar2_table(8) := '666F6E742D7765696768743A20626F6C643B0A7D0A2E73642D6461794E756D207B0A20202020646973706C61793A20626C6F636B3B0A20202020626F726465722D7261646975733A203530253B0A2020202077696474683A20333270783B0A2020202068';
wwv_flow_imp.g_varchar2_table(9) := '65696768743A20333270783B0A202020206C696E652D6865696768743A20333270783B0A20202020666F6E742D73697A653A20313670783B0A20202020637572736F723A20706F696E7465723B0A7D0A0A2E73642D6D6F6E74685069636B6572207B0A20';
wwv_flow_imp.g_varchar2_table(10) := '202020706F736974696F6E3A2072656C61746976653B0A2020202070616464696E672D746F703A20313570783B0A7D0A0A2E73642D6D6F6E74684E616D65207B0A20202020636F6C6F723A20626C61636B3B0A7D0A0A2E64697361626C65645069636B65';
wwv_flow_imp.g_varchar2_table(11) := '72207B0A202020206F7061636974793A20302E363B0A7D0A0A2E73642D7765656B646179207B0A20202020666F6E742D73697A653A203970783B0A20202020636F6C6F723A20233838383838383B0A7D0A2E73642D7765656B4461792E73642D61637469';
wwv_flow_imp.g_varchar2_table(12) := '7665207B0A20202020636F6C6F723A20233434354644323B0A20202020666F6E742D7765696768743A626F6C643B0A7D20200A0A2E73642D64742D73656C6563746F72207B0A2020202070616464696E673A203270783B0A20202020637572736F723A20';
wwv_flow_imp.g_varchar2_table(13) := '706F696E7465723B0A202020206D617267696E3A2030707820323570782030707820323570783B0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(477528289283599791)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_file_name=>'scrollable-datepicker.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '66756E6374696F6E206C506164546F32286E756D62657229207B0A20202020696620286E756D626572203C3D203929207B0A20202020202020206E756D626572203D2028223022202B206E756D626572292E736C696365282D32293B0A202020207D0A20';
wwv_flow_imp.g_varchar2_table(2) := '20202072657475726E206E756D6265723B0A7D0A0A766172207363726F6C6C61626C65446174657069636B6572203D207B0A20202020696E69743A2066756E6374696F6E28704974656D49642C207765656B446179732C206D6F6E74684E616D65732920';
wwv_flow_imp.g_varchar2_table(3) := '7B0A2020202020202020747279207B0A20202020202020202020202076617220615765656B44617973203D204A534F4E2E7061727365287765656B44617973293B0A20202020202020207D206361746368202865727229207B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(4) := '2020617065782E6D6573736167652E73686F774572726F7273285B7B0A20202020202020202020202020202020747970653A20226572726F72222C0A202020202020202020202020202020206C6F636174696F6E3A2022696E6C696E65222C0A20202020';
wwv_flow_imp.g_varchar2_table(5) := '202020202020202020202020706167654974656D3A20704974656D49642C0A202020202020202020202020202020206D6573736167653A2022496E76616C6964205765656B20446179732C2075736520612076616C6964204A534F4E204172726179222C';
wwv_flow_imp.g_varchar2_table(6) := '0A20202020202020202020202020202020756E736166653A2066616C73650A2020202020202020202020207D5D293B0A20202020202020207D0A2020202020202020747279207B0A20202020202020202020202076617220614D6F6E74684E616D657320';
wwv_flow_imp.g_varchar2_table(7) := '3D204A534F4E2E7061727365286D6F6E74684E616D6573293B0A20202020202020207D206361746368202865727229207B0A202020202020202020202020617065782E6D6573736167652E73686F774572726F7273285B7B0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(8) := '2020202020747970653A20226572726F72222C0A202020202020202020202020202020206C6F636174696F6E3A2022696E6C696E65222C0A20202020202020202020202020202020706167654974656D3A20704974656D49642C0A202020202020202020';
wwv_flow_imp.g_varchar2_table(9) := '202020202020206D6573736167653A2022496E76616C6964204D6F6E7468204E616D65732C2075736520612076616C6964204A534F4E204172726179222C0A20202020202020202020202020202020756E736166653A2066616C73650A20202020202020';
wwv_flow_imp.g_varchar2_table(10) := '20202020207D5D293B0A202020202020202020202020202020207D202020202020200A0A2020202020202020766172205F74686973203D202428272373645F27202B20704974656D4964293B0A20202020202020206C6F6164446174657069636B657228';
wwv_flow_imp.g_varchar2_table(11) := '5F74686973293B0A0A20202020202020205F746869732E66696E6428272373642D70726576696F75732D6D6F6E746827292E636C69636B2866756E6374696F6E2829207B0A2020202020202020202020206C6574207043757272656E744D6F6E7468203D';
wwv_flow_imp.g_varchar2_table(12) := '205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E744D6F6E746827293B0A2020202020202020202020206C6574207043757272656E7459656172203D205F746869732E66696E6428272E73642D';
wwv_flow_imp.g_varchar2_table(13) := '6D6F6E74685069636B657227292E61747472282763757272656E745965617227293B0A2020202020202020202020206C65742070726576696F75734D6F6E74683B0A202020202020202020202020696620287043757272656E744D6F6E746820213D2030';
wwv_flow_imp.g_varchar2_table(14) := '29207B0A2020202020202020202020202020202070726576696F75734D6F6E7468203D204E756D626572287043757272656E744D6F6E746829202D20310A2020202020202020202020207D20656C7365207B0A2020202020202020202020202020202070';
wwv_flow_imp.g_varchar2_table(15) := '726576696F75734D6F6E7468203D2031313B0A202020202020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E7459656172272C204E756D626572287043757272656E74';
wwv_flow_imp.g_varchar2_table(16) := '5965617229202D2031293B0A2020202020202020202020207D0A2020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E744D6F6E7468272C2070726576696F75734D6F6E';
wwv_flow_imp.g_varchar2_table(17) := '7468293B0A2020202020202020202020206C6F6164446174657069636B6572285F74686973293B0A20202020202020207D293B0A0A20202020202020205F746869732E66696E6428272373642D6E6578742D6D6F6E746827292E636C69636B2866756E63';
wwv_flow_imp.g_varchar2_table(18) := '74696F6E2829207B0A2020202020202020202020206C6574206E43757272656E744D6F6E7468203D205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E744D6F6E746827293B0A20202020202020';
wwv_flow_imp.g_varchar2_table(19) := '20202020206C6574206E43757272656E7459656172203D205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E745965617227293B0A2020202020202020202020206C6574206E6578744D6F6E7468';
wwv_flow_imp.g_varchar2_table(20) := '3B0A202020202020202020202020696620286E43757272656E744D6F6E746820213D20313129207B0A202020202020202020202020202020206E6578744D6F6E7468203D204E756D626572286E43757272656E744D6F6E746829202B20310A2020202020';
wwv_flow_imp.g_varchar2_table(21) := '202020202020207D20656C7365207B0A202020202020202020202020202020206E6578744D6F6E7468203D20303B0A202020202020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763';
wwv_flow_imp.g_varchar2_table(22) := '757272656E7459656172272C204E756D626572286E43757272656E745965617229202B2031293B0A2020202020202020202020207D0A2020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472';
wwv_flow_imp.g_varchar2_table(23) := '282763757272656E744D6F6E7468272C206E6578744D6F6E7468293B0A2020202020202020202020206C6F6164446174657069636B6572285F74686973293B0A20202020202020207D293B0A0A202020202020202066756E6374696F6E206C6F61644461';
wwv_flow_imp.g_varchar2_table(24) := '74657069636B657228696429207B0A0A202020202020202020202020766172205F74686973203D2069643B0A2020202020202020202020206C6574206D6F757365446F776E203D2066616C73653B0A2020202020202020202020206C6574207374617274';
wwv_flow_imp.g_varchar2_table(25) := '582C207363726F6C6C4C6566743B0A202020202020202020202020636F6E737420736C69646572203D20646F63756D656E742E717565727953656C6563746F7228272E7363726F6C6C61626C652D646174657069636B657227293B0A0A20202020202020';
wwv_flow_imp.g_varchar2_table(26) := '2020202020636F6E73742073746172744472616767696E67203D20286529203D3E207B0A202020202020202020202020202020206D6F757365446F776E203D20747275653B0A20202020202020202020202020202020737461727458203D20652E706167';
wwv_flow_imp.g_varchar2_table(27) := '6558202D20736C696465722E6F66667365744C6566743B0A202020202020202020202020202020207363726F6C6C4C656674203D20736C696465722E7363726F6C6C4C6566743B0A2020202020202020202020207D0A0A20202020202020202020202063';
wwv_flow_imp.g_varchar2_table(28) := '6F6E73742073746F704472616767696E67203D20286529203D3E207B0A202020202020202020202020202020206D6F757365446F776E203D2066616C73653B0A2020202020202020202020207D0A0A202020202020202020202020636F6E7374206D6F76';
wwv_flow_imp.g_varchar2_table(29) := '65203D20286529203D3E207B0A20202020202020202020202020202020652E70726576656E7444656661756C7428293B0A2020202020202020202020202020202069662028216D6F757365446F776E29207B0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(30) := '20202072657475726E3B0A202020202020202020202020202020207D0A20202020202020202020202020202020636F6E73742078203D20652E7061676558202D20736C696465722E6F66667365744C6566743B0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(31) := '636F6E7374207363726F6C6C203D2078202D207374617274583B0A20202020202020202020202020202020736C696465722E7363726F6C6C4C656674203D207363726F6C6C4C656674202D207363726F6C6C3B0A2020202020202020202020207D0A0A20';
wwv_flow_imp.g_varchar2_table(32) := '2020202020202020202020736C696465722E6164644576656E744C697374656E657228276D6F7573656D6F7665272C206D6F76652C2066616C7365293B0A202020202020202020202020736C696465722E6164644576656E744C697374656E657228276D';
wwv_flow_imp.g_varchar2_table(33) := '6F757365646F776E272C2073746172744472616767696E672C2066616C7365293B0A202020202020202020202020736C696465722E6164644576656E744C697374656E657228276D6F7573657570272C2073746F704472616767696E672C2066616C7365';
wwv_flow_imp.g_varchar2_table(34) := '293B0A202020202020202020202020736C696465722E6164644576656E744C697374656E657228276D6F7573656C65617665272C2073746F704472616767696E672C2066616C7365293B0A0A20202020202020202020202066756E6374696F6E20646179';
wwv_flow_imp.g_varchar2_table(35) := '73496E4D6F6E7468286D6F6E74682C207965617229207B0A2020202020202020202020202020202072657475726E206E6577204461746528796561722C204E756D626572286D6F6E746829202B20312C2030292E6765744461746528293B0A2020202020';
wwv_flow_imp.g_varchar2_table(36) := '202020202020207D0A0A2020202020202020202020205F746869732E66696E6428272373642D63616C656E64617227292E6368696C6472656E28292E72656D6F766528293B0A0A2020202020202020202020206C65742063757272656E74446179203D20';
wwv_flow_imp.g_varchar2_table(37) := '303B0A2020202020202020202020206C65742063757272656E744D6F6E7468203D20303B0A2020202020202020202020206C65742063757272656E7459656172203D20303B0A0A2020202020202020202020206C6574207765656B646179203D20615765';
wwv_flow_imp.g_varchar2_table(38) := '656B446179733B0A202020202020202020202020636F6E73742073644D6F6E74684E616D6573203D20614D6F6E74684E616D65733B0A0A0A2020202020202020202020207661722064617465203D206E6577204461746528293B0A202020202020202020';
wwv_flow_imp.g_varchar2_table(39) := '202020696620285F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E746D6F6E74682729203D3D20272729207B0A202020202020202020202020202020205F746869732E66696E6428272E73642D6D';
wwv_flow_imp.g_varchar2_table(40) := '6F6E74685069636B657227292E61747472282763757272656E744D6F6E7468272C20646174652E6765744D6F6E74682829293B0A202020202020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E6174';
wwv_flow_imp.g_varchar2_table(41) := '7472282763757272656E7459656172272C20646174652E67657446756C6C596561722829293B0A2020202020202020202020207D0A20202020202020202020202063757272656E74446179203D20646174652E67657444617928293B0A20202020202020';
wwv_flow_imp.g_varchar2_table(42) := '202020202063757272656E744D6F6E7468203D205F746869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E744D6F6E746827293B0A20202020202020202020202063757272656E7459656172203D205F74';
wwv_flow_imp.g_varchar2_table(43) := '6869732E66696E6428272E73642D6D6F6E74685069636B657227292E61747472282763757272656E745965617227293B0A0A0A2020202020202020202020205F746869732E66696E6428272E73642D6D6F6E74684E616D6527292E68746D6C2873644D6F';
wwv_flow_imp.g_varchar2_table(44) := '6E74684E616D65735B63757272656E744D6F6E74685D202B20272C2027202B2063757272656E7459656172290A202020202020202020202020666F7220287661722069203D20313B2069203C3D2064617973496E4D6F6E74682863757272656E744D6F6E';
wwv_flow_imp.g_varchar2_table(45) := '74682C2063757272656E7459656172293B20692B2B29207B0A20202020202020202020202020202020766172206461746532203D206E657720446174652863757272656E74596561722C2063757272656E744D6F6E74682C2069290A2020202020202020';
wwv_flow_imp.g_varchar2_table(46) := '202020202020202076617220756C203D20646F63756D656E742E676574456C656D656E7442794964282273642D63616C656E64617222293B0A20202020202020202020202020202020766172206C69203D20646F63756D656E742E637265617465456C65';
wwv_flow_imp.g_varchar2_table(47) := '6D656E7428226C6922293B0A0A202020202020202020202020202020202F2F546F646179277320646174650A2020202020202020202020202020202076617220626F6F6C203D2028646174652E746F44617465537472696E672829203D3D3D2064617465';
wwv_flow_imp.g_varchar2_table(48) := '322E746F44617465537472696E672829293B0A2020202020202020202020202020202069662028626F6F6C29207B0A20202020202020202020202020202020202020206C692E636C6173734C6973742E616464282773642D61637469766527290A202020';
wwv_flow_imp.g_varchar2_table(49) := '202020202020202020202020207D0A202020202020202020202020202020206C692E73657441747472696275746528276964272C2064617465322E67657454696D652829202F2031303030290A0A202020202020202020202020202020202F2F44617973';
wwv_flow_imp.g_varchar2_table(50) := '206F6420746865206D6F6E74680A202020202020202020202020202020206C6574206461794E756D203D20646F63756D656E742E637265617465456C656D656E7428277370616E27293B0A202020202020202020202020202020206461794E756D2E636C';
wwv_flow_imp.g_varchar2_table(51) := '6173734C6973742E616464282773642D6461794E756D27290A202020202020202020202020202020206461794E756D2E617070656E644368696C6428646F63756D656E742E637265617465546578744E6F64652864617465322E67657444617465282929';
wwv_flow_imp.g_varchar2_table(52) := '290A2020202020202020202020202020202069662028626F6F6C29207B0A20202020202020202020202020202020202020206461794E756D2E636C6173734C6973742E616464282773642D61637469766527290A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(53) := '7D0A202020202020202020202020202020206C6574207765656B446179203D20646F63756D656E742E637265617465456C656D656E7428277370616E27293B0A202020202020202020202020202020207765656B4461792E636C6173734C6973742E6164';
wwv_flow_imp.g_varchar2_table(54) := '64282773642D7765656B64617927293B0A202020202020202020202020202020207765656B4461792E617070656E644368696C6428646F63756D656E742E637265617465546578744E6F6465287765656B6461795B64617465322E67657444617928295D';
wwv_flow_imp.g_varchar2_table(55) := '29290A2020202020202020202020202020202069662028626F6F6C29207B0A20202020202020202020202020202020202020207765656B4461792E636C6173734C6973742E616464282773642D61637469766527293B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(56) := '202020202020207765656B4461792E7363726F6C6C496E746F56696577287B0A2020202020202020202020202020202020202020202020206265686176696F723A2022736D6F6F7468222C0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(57) := '626C6F636B3A202263656E746572222C0A202020202020202020202020202020202020202020202020696E6C696E653A202263656E746572220A20202020202020202020202020202020202020207D293B0A202020202020202020202020202020207D0A';
wwv_flow_imp.g_varchar2_table(58) := '202020202020202020202020202020206C692E617070656E644368696C64287765656B446179293B0A202020202020202020202020202020206C692E617070656E644368696C64286461794E756D293B0A20202020202020202020202020202020766172';
wwv_flow_imp.g_varchar2_table(59) := '20746869734D6F6E7468203D204E756D6265722863757272656E744D6F6E746829202B20313B0A202020202020202020202020202020206C692E7365744174747269627574652827646174612D64617465272C206C506164546F322864617465322E6765';
wwv_flow_imp.g_varchar2_table(60) := '7444617465282929202B20272F27202B20746869734D6F6E7468202B20272F27202B2063757272656E7459656172293B0A20202020202020202020202020202020756C2E617070656E644368696C64286C69293B0A2020202020202020202020207D0A20';
wwv_flow_imp.g_varchar2_table(61) := '20202020202020202020202F2F207363726F6C6C20746F2061637469766520646174650A202020202020202020202020696620285F746869732E66696E6428272E73642D61637469766527292E6C656E67746820213D203029207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(62) := '2020202020202020766172206163746976655363726F6C6C506F73203D205F746869732E66696E6428272E73642D61637469766527292E6F666673657428292E6C656674202B205F746869732E66696E6428272E73642D61637469766527292E6F757465';
wwv_flow_imp.g_varchar2_table(63) := '725769647468287472756529202F2032202B205F746869732E66696E6428272E7363726F6C6C61626C652D646174657069636B657227292E7363726F6C6C4C6566742829202D205F746869732E66696E6428272E7363726F6C6C61626C652D6461746570';
wwv_flow_imp.g_varchar2_table(64) := '69636B657227292E77696474682829202F20323B0A0A202020202020202020202020202020205F746869732E66696E6428272E7363726F6C6C61626C652D646174657069636B657227292E616E696D617465287B0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(65) := '20202020207363726F6C6C4C6566743A206163746976655363726F6C6C506F73202D2031300A202020202020202020202020202020207D2C2027736C6F7727293B0A2020202020202020202020207D0A2020202020202020202020202F2F2073656C6563';
wwv_flow_imp.g_varchar2_table(66) := '74204461790A2020202020202020202020205F746869732E66696E6428272E7363726F6C6C61626C652D646174657069636B657227292E6F6E2827636C69636B272C20276C69272C2066756E6374696F6E2829207B0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(67) := '20205F746869732E66696E6428272E7363726F6C6C61626C652D646174657069636B6572206C6927292E72656D6F7665436C617373282773642D61637469766527293B0A202020202020202020202020202020205F746869732E66696E6428272E73642D';
wwv_flow_imp.g_varchar2_table(68) := '6461794E756D27292E72656D6F7665436C617373282273642D61637469766522293B0A202020202020202020202020202020205F746869732E66696E6428272E73642D7765656B64617927292E72656D6F7665436C617373282273642D61637469766522';
wwv_flow_imp.g_varchar2_table(69) := '293B0A202020202020202020202020202020205F746869732E66696E642874686973292E616464436C617373282773642D61637469766527290A202020202020202020202020202020205F746869732E66696E642874686973292E6368696C6472656E28';
wwv_flow_imp.g_varchar2_table(70) := '272E73642D6461794E756D27292E616464436C617373282773642D61637469766527290A202020202020202020202020202020205F746869732E66696E642874686973292E6368696C6472656E28272E73642D7765656B64617927292E616464436C6173';
wwv_flow_imp.g_varchar2_table(71) := '73282773642D61637469766527290A20202020202020202020202020202020617065782E6974656D28704974656D4964292E73657456616C7565285F746869732E66696E642874686973292E617474722827646174612D646174652729293B0A20202020';
wwv_flow_imp.g_varchar2_table(72) := '2020202020202020202020202428272327202B20704974656D4964292E7472696767657228277363726F6C6C61626C652D646174657069636B65722D6368616E676527293B0A0A2020202020202020202020207D293B0A20202020202020207D3B0A2020';
wwv_flow_imp.g_varchar2_table(73) := '20207D0A7D3B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(477528572165599793)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_file_name=>'scrollable-datepicker.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '66756E6374696F6E206C506164546F322865297B72657475726E20653C3D39262628653D282230222B65292E736C696365282D3229292C657D766172207363726F6C6C61626C65446174657069636B65723D7B696E69743A66756E6374696F6E28652C74';
wwv_flow_imp.g_varchar2_table(2) := '2C61297B7472797B76617220723D4A534F4E2E70617273652874297D63617463682874297B617065782E6D6573736167652E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A22696E6C696E65222C706167654974';
wwv_flow_imp.g_varchar2_table(3) := '656D3A652C6D6573736167653A22496E76616C6964205765656B20446179732C2075736520612076616C6964204A534F4E204172726179222C756E736166653A21317D5D297D7472797B766172206E3D4A534F4E2E70617273652861297D636174636828';
wwv_flow_imp.g_varchar2_table(4) := '74297B617065782E6D6573736167652E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A22696E6C696E65222C706167654974656D3A652C6D6573736167653A22496E76616C6964204D6F6E7468204E616D65732C';
wwv_flow_imp.g_varchar2_table(5) := '2075736520612076616C6964204A534F4E204172726179222C756E736166653A21317D5D297D76617220643D2428222373645F222B65293B66756E6374696F6E20692874297B76617220613D743B6C657420642C692C733D21313B636F6E737420633D64';
wwv_flow_imp.g_varchar2_table(6) := '6F63756D656E742E717565727953656C6563746F7228222E7363726F6C6C61626C652D646174657069636B657222292C6C3D653D3E7B733D21317D3B632E6164644576656E744C697374656E657228226D6F7573656D6F7665222C28653D3E7B69662865';
wwv_flow_imp.g_varchar2_table(7) := '2E70726576656E7444656661756C7428292C21732972657475726E3B636F6E737420743D652E70616765582D632E6F66667365744C6566742D643B632E7363726F6C6C4C6566743D692D747D292C2131292C632E6164644576656E744C697374656E6572';
wwv_flow_imp.g_varchar2_table(8) := '28226D6F757365646F776E222C28653D3E7B733D21302C643D652E70616765582D632E6F66667365744C6566742C693D632E7363726F6C6C4C6566747D292C2131292C632E6164644576656E744C697374656E657228226D6F7573657570222C6C2C2131';
wwv_flow_imp.g_varchar2_table(9) := '292C632E6164644576656E744C697374656E657228226D6F7573656C65617665222C6C2C2131292C612E66696E6428222373642D63616C656E64617222292E6368696C6472656E28292E72656D6F766528293B6C6574206F3D302C6D3D302C663D302C75';
wwv_flow_imp.g_varchar2_table(10) := '3D723B636F6E737420683D6E3B76617220763D6E657720446174653B22223D3D612E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E746D6F6E74682229262628612E66696E6428222E73642D6D6F6E74685069';
wwv_flow_imp.g_varchar2_table(11) := '636B657222292E61747472282263757272656E744D6F6E7468222C762E6765744D6F6E74682829292C612E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E7459656172222C762E67657446756C6C5965617228';
wwv_flow_imp.g_varchar2_table(12) := '2929292C6F3D762E67657444617928292C6D3D612E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E744D6F6E746822292C663D612E66696E6428222E73642D6D6F6E74685069636B657222292E617474722822';
wwv_flow_imp.g_varchar2_table(13) := '63757272656E745965617222292C612E66696E6428222E73642D6D6F6E74684E616D6522292E68746D6C28685B6D5D2B222C20222B66293B666F722876617220703D313B703C3D6E6577204461746528662C4E756D626572286D292B312C30292E676574';
wwv_flow_imp.g_varchar2_table(14) := '4461746528293B702B2B297B766172206B3D6E6577204461746528662C6D2C70292C673D646F63756D656E742E676574456C656D656E7442794964282273642D63616C656E64617222292C623D646F63756D656E742E637265617465456C656D656E7428';
wwv_flow_imp.g_varchar2_table(15) := '226C6922292C793D762E746F44617465537472696E6728293D3D3D6B2E746F44617465537472696E6728293B792626622E636C6173734C6973742E616464282273642D61637469766522292C622E73657441747472696275746528226964222C6B2E6765';
wwv_flow_imp.g_varchar2_table(16) := '7454696D6528292F316533293B6C657420653D646F63756D656E742E637265617465456C656D656E7428227370616E22293B652E636C6173734C6973742E616464282273642D6461794E756D22292C652E617070656E644368696C6428646F63756D656E';
wwv_flow_imp.g_varchar2_table(17) := '742E637265617465546578744E6F6465286B2E67657444617465282929292C792626652E636C6173734C6973742E616464282273642D61637469766522293B6C657420743D646F63756D656E742E637265617465456C656D656E7428227370616E22293B';
wwv_flow_imp.g_varchar2_table(18) := '742E636C6173734C6973742E616464282273642D7765656B64617922292C742E617070656E644368696C6428646F63756D656E742E637265617465546578744E6F646528755B6B2E67657444617928295D29292C79262628742E636C6173734C6973742E';
wwv_flow_imp.g_varchar2_table(19) := '616464282273642D61637469766522292C742E7363726F6C6C496E746F56696577287B6265686176696F723A22736D6F6F7468222C626C6F636B3A2263656E746572222C696E6C696E653A2263656E746572227D29292C622E617070656E644368696C64';
wwv_flow_imp.g_varchar2_table(20) := '2874292C622E617070656E644368696C642865293B766172204E3D4E756D626572286D292B313B622E7365744174747269627574652822646174612D64617465222C6C506164546F32286B2E676574446174652829292B222F222B4E2B222F222B66292C';
wwv_flow_imp.g_varchar2_table(21) := '672E617070656E644368696C642862297D69662830213D612E66696E6428222E73642D61637469766522292E6C656E677468297B766172204C3D612E66696E6428222E73642D61637469766522292E6F666673657428292E6C6566742B612E66696E6428';
wwv_flow_imp.g_varchar2_table(22) := '222E73642D61637469766522292E6F757465725769647468282130292F322B612E66696E6428222E7363726F6C6C61626C652D646174657069636B657222292E7363726F6C6C4C65667428292D612E66696E6428222E7363726F6C6C61626C652D646174';
wwv_flow_imp.g_varchar2_table(23) := '657069636B657222292E776964746828292F323B612E66696E6428222E7363726F6C6C61626C652D646174657069636B657222292E616E696D617465287B7363726F6C6C4C6566743A4C2D31307D2C22736C6F7722297D612E66696E6428222E7363726F';
wwv_flow_imp.g_varchar2_table(24) := '6C6C61626C652D646174657069636B657222292E6F6E2822636C69636B222C226C69222C2866756E6374696F6E28297B612E66696E6428222E7363726F6C6C61626C652D646174657069636B6572206C6922292E72656D6F7665436C617373282273642D';
wwv_flow_imp.g_varchar2_table(25) := '61637469766522292C612E66696E6428222E73642D6461794E756D22292E72656D6F7665436C617373282273642D61637469766522292C612E66696E6428222E73642D7765656B64617922292E72656D6F7665436C617373282273642D61637469766522';
wwv_flow_imp.g_varchar2_table(26) := '292C612E66696E642874686973292E616464436C617373282273642D61637469766522292C612E66696E642874686973292E6368696C6472656E28222E73642D6461794E756D22292E616464436C617373282273642D61637469766522292C612E66696E';
wwv_flow_imp.g_varchar2_table(27) := '642874686973292E6368696C6472656E28222E73642D7765656B64617922292E616464436C617373282273642D61637469766522292C617065782E6974656D2865292E73657456616C756528612E66696E642874686973292E617474722822646174612D';
wwv_flow_imp.g_varchar2_table(28) := '646174652229292C24282223222B65292E7472696767657228227363726F6C6C61626C652D646174657069636B65722D6368616E676522297D29297D692864292C642E66696E6428222373642D70726576696F75732D6D6F6E746822292E636C69636B28';
wwv_flow_imp.g_varchar2_table(29) := '2866756E6374696F6E28297B6C657420652C743D642E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E744D6F6E746822292C613D642E66696E6428222E73642D6D6F6E74685069636B657222292E6174747228';
wwv_flow_imp.g_varchar2_table(30) := '2263757272656E745965617222293B30213D743F653D4E756D6265722874292D313A28653D31312C642E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E7459656172222C4E756D6265722861292D3129292C64';
wwv_flow_imp.g_varchar2_table(31) := '2E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E744D6F6E7468222C65292C692864297D29292C642E66696E6428222373642D6E6578742D6D6F6E746822292E636C69636B282866756E6374696F6E28297B6C';
wwv_flow_imp.g_varchar2_table(32) := '657420652C743D642E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E744D6F6E746822292C613D642E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E745965617222';
wwv_flow_imp.g_varchar2_table(33) := '293B3131213D743F653D4E756D6265722874292B313A28653D302C642E66696E6428222E73642D6D6F6E74685069636B657222292E61747472282263757272656E7459656172222C4E756D6265722861292B3129292C642E66696E6428222E73642D6D6F';
wwv_flow_imp.g_varchar2_table(34) := '6E74685069636B657222292E61747472282263757272656E744D6F6E7468222C65292C692864297D29297D7D3B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(477643346390439243)
,p_plugin_id=>wwv_flow_imp.id(477527662944594475)
,p_file_name=>'scrollable-datepicker.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

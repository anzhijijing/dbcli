-- =====================================================
-- fzzh (Kingbase) 表结构修复 SQL
-- 基于 mydx_20230402 (MySQL) 源数据库
-- =====================================================

-- 统计信息:
--   默认值缺失: 20 个字段
--   默认值不同: 633 个字段
--   类型不同: 62 个字段
--   nullable 不同: 3 个字段
--   共涉及 274 个表

-- 注意: 执行前请先备份相关表
-- 执行方式: 在 Kingbase 数据库中逐条执行

-- ==================== 表: g_action ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_action ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_action ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_actlog ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_actlog ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_api_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_api_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_data_consume_param ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_data_consume_param ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_data_service ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_data_service ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_data_service_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_data_service_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_data_service_param ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_data_service_param ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_gateway_service_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_gateway_service_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_gwservice ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_gwservice ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_gwservice_interface ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_gwservice_interface ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 request_type: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_app_gwservice_interface ALTER COLUMN request_type SET DEFAULT 1;

-- ==================== 表: g_app_gwservice_privilege ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_gwservice_privilege ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_manage ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_manage ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_mservice ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_mservice ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_mservice_interface ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_mservice_interface ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_app_mservice_permission ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_app_mservice_permission ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_appgroup ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_appgroup ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_application ====================
-- 字段 allow_partys: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_partys TYPE text;

-- 字段 allow_partys_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_partys_schema TYPE text;

-- 字段 allow_partys_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_partys_text TYPE text;

-- 字段 allow_tags: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_tags TYPE text;

-- 字段 allow_tags_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_tags_text TYPE text;

-- 字段 allow_userinfos: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_userinfos TYPE text;

-- 字段 allow_userinfos_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN allow_userinfos_text TYPE text;

-- 字段 app_category: 类型不一致
-- MySQL: decimal(2,0), Kingbase: varchar(50)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN app_category TYPE decimal(2,0);

-- 字段 badge_datasource: 类型不一致
-- MySQL: varchar(32), Kingbase: numeric(2)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN badge_datasource TYPE varchar(32);

-- 字段 disallow_partys: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_partys TYPE text;

-- 字段 disallow_partys_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_partys_schema TYPE text;

-- 字段 disallow_partys_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_partys_text TYPE text;

-- 字段 disallow_tags_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_tags_text TYPE text;

-- 字段 disallow_userinfos: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_userinfos TYPE text;

-- 字段 disallow_userinfos_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_application ALTER COLUMN disallow_userinfos_text TYPE text;

-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_forbdden: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN is_forbdden SET DEFAULT '-1';

-- 字段 is_reportenter: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN is_reportenter SET DEFAULT '-1';

-- 字段 report_location_flag: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN report_location_flag SET DEFAULT '-1';

-- 字段 show_in_mobile: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN show_in_mobile SET DEFAULT '-1';

-- 字段 show_in_pc: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application ALTER COLUMN show_in_pc SET DEFAULT '-1';

-- ==================== 表: g_application_menu ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application_menu ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_application_menu ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_archives_info ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_archives_info ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_area ====================
-- 字段 fid: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_area ALTER COLUMN fid SET DEFAULT 0;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_area ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_association_module ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_association_module ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_association_module ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_attach_signsec ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_attach_signsec ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_attach_white_list ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_attach_white_list ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_authattention ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_authattention ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_biz_usergroup ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_biz_usergroup ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_biz_usergroup_user ====================
-- 字段 group_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_biz_usergroup_user ALTER COLUMN group_id SET DEFAULT 1;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_biz_usergroup_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_bqsz ====================
-- 字段 attach_count: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN attach_count SET DEFAULT 0;

-- 字段 info_version: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_bqsz ALTER COLUMN info_version SET DEFAULT 1;

-- 字段 is_distribed: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN is_distribed SET DEFAULT 0;

-- 字段 is_leader_opinion: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN is_leader_opinion SET DEFAULT 0;

-- 字段 is_leader_sign: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN is_leader_sign SET DEFAULT 0;

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_bqsz ALTER COLUMN rowstate SET DEFAULT 1;

-- 字段 showorder: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_bqsz ALTER COLUMN showorder SET DEFAULT 1;

-- 字段 status: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN status SET DEFAULT 0;

-- 字段 tempstatus: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_bqsz ALTER COLUMN tempstatus SET DEFAULT 1;

-- 字段 unionfiles: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_bqsz ALTER COLUMN unionfiles SET DEFAULT 0;

-- ==================== 表: g_bqwh ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_bqwh ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_button ====================
-- 字段 is_default: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_button ALTER COLUMN is_default SET DEFAULT '-1';

-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_button ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_button ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_self_enable: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_button ALTER COLUMN is_self_enable SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_button ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_code ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_code ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_code ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_system: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_code ALTER COLUMN is_system SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_code ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_codeprint ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_codeprint ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_common_choice_history ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_common_choice_history ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_common_choice_history ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_common_interface_component ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_common_interface_component ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_common_interface_component ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_confidentiality ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_confidentiality ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_confidentiality ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_config ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_config ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_config ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_config_setup ====================
-- 字段 default_value: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_config_setup ALTER COLUMN default_value TYPE text;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_config_setup ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_config_setup ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_config_setup_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_config_setup_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_contact ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_contact ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_control ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_control ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_control_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_control_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_convert ====================
-- 字段 is_convert_flow: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_convert_flow SET DEFAULT '-1';

-- 字段 is_exchange_feedback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_exchange_feedback SET DEFAULT '-1';

-- 字段 is_exchange_form2rcv: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_exchange_form2rcv SET DEFAULT '-1';

-- 字段 is_exchange_receive: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_exchange_receive SET DEFAULT '-1';

-- 字段 is_exchange_send: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_exchange_send SET DEFAULT '-1';

-- 字段 is_exchange_send2form: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_convert ALTER COLUMN is_exchange_send2form SET DEFAULT '-1';

-- ==================== 表: g_custom_agency ====================
-- 字段 agency_type: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_custom_agency ALTER COLUMN agency_type SET DEFAULT 1;

-- ==================== 表: g_custom_agency_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_agency_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_autohandle ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_autohandle ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_contacts ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_contacts ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_filetag ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_filetag ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_historyk ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_historyk ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_menu ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_menu ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_tab_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_menu ALTER COLUMN is_tab_reload SET DEFAULT '-1';

-- ==================== 表: g_custom_query_temp ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_query_temp ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_sender ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sender ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_sendgroup ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sendgroup ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_sendgroup_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sendgroup_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_sendnode ====================
-- 字段 is_custom: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sendnode ALTER COLUMN is_custom SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sendnode ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_shortcut_addnew ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_shortcut_addnew ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_sign ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_sign ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_tag ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_tag ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_custom_todo ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_custom_todo ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_daily_sentence ====================
-- 字段 id: nullable 不一致
-- MySQL nullable: True, Kingbase nullable: False
ALTER TABLE g_daily_sentence ALTER COLUMN id DROP NOT NULL;

-- ==================== 表: g_data_source ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_source ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_data_submit ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_submit ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_data_submit_cell ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_submit_cell ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_data_submit_sheet ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_submit_sheet ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_data_submit_temp ====================
-- 字段 allow_privilege: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_submit_temp ALTER COLUMN allow_privilege SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_submit_temp ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_data_times ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_data_times ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_db ====================
-- 字段 attach_count: 缺少默认值
ALTER TABLE g_db ALTER COLUMN attach_count SET DEFAULT 0;

-- 字段 done_periodical_size: 缺少默认值
ALTER TABLE g_db ALTER COLUMN done_periodical_size SET DEFAULT 0;

-- 字段 feedback_system: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_db ALTER COLUMN feedback_system SET DEFAULT 1;

-- 字段 feedback_system2: 缺少默认值
ALTER TABLE g_db ALTER COLUMN feedback_system2 SET DEFAULT 1;

-- 字段 important: 缺少默认值
ALTER TABLE g_db ALTER COLUMN important SET DEFAULT 1;

-- 字段 inform_type: 默认值不一致
-- MySQL: 1, Kingbase: '0'::varchar
ALTER TABLE g_db ALTER COLUMN inform_type SET DEFAULT 1;

-- 字段 is_distribed: 缺少默认值
ALTER TABLE g_db ALTER COLUMN is_distribed SET DEFAULT 0;

-- 字段 is_leader_opinion: 缺少默认值
ALTER TABLE g_db ALTER COLUMN is_leader_opinion SET DEFAULT 0;

-- 字段 is_leader_sign: 缺少默认值
ALTER TABLE g_db ALTER COLUMN is_leader_sign SET DEFAULT 0;

-- 字段 is_split: 类型不一致
-- MySQL: varchar(10), Kingbase: numeric(1)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db ALTER COLUMN is_split TYPE varchar(10);

-- 字段 is_split: 缺少默认值
ALTER TABLE g_db ALTER COLUMN is_split SET DEFAULT 0;

-- 字段 is_template: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_db ALTER COLUMN is_template SET DEFAULT '-1';

-- 字段 is_top: 类型不一致
-- MySQL: varchar(20), Kingbase: integer(32)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db ALTER COLUMN is_top TYPE varchar(20);

-- 字段 is_top: 缺少默认值
ALTER TABLE g_db ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 jjcd: 缺少默认值
ALTER TABLE g_db ALTER COLUMN jjcd SET DEFAULT 0;

-- 字段 mj: 缺少默认值
ALTER TABLE g_db ALTER COLUMN mj SET DEFAULT 0;

-- 字段 periodical_size: 缺少默认值
ALTER TABLE g_db ALTER COLUMN periodical_size SET DEFAULT 0;

-- 字段 spzt: 缺少默认值
ALTER TABLE g_db ALTER COLUMN spzt SET DEFAULT 1;

-- 字段 status: 缺少默认值
ALTER TABLE g_db ALTER COLUMN status SET DEFAULT 0;

-- 字段 step: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_db ALTER COLUMN step SET DEFAULT 1;

-- 字段 traffic_light: 缺少默认值
ALTER TABLE g_db ALTER COLUMN traffic_light SET DEFAULT 0;

-- 字段 unionfiles: 缺少默认值
ALTER TABLE g_db ALTER COLUMN unionfiles SET DEFAULT 0;

-- ==================== 表: g_db_cb ====================
-- 字段 attach_count: 缺少默认值
ALTER TABLE g_db_cb ALTER COLUMN attach_count SET DEFAULT 0;

-- 字段 cbzt: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_db_cb ALTER COLUMN cbzt SET DEFAULT 0;

-- 字段 handle_nodename: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db_cb ALTER COLUMN handle_nodename TYPE text;

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_db_cb ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_db_change ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_db_change ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_db_config ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_db_config ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_db_fk ====================
-- 字段 attach_count: 缺少默认值
ALTER TABLE g_db_fk ALTER COLUMN attach_count SET DEFAULT 0;

-- 字段 bfb: 默认值不一致
-- MySQL: %, Kingbase: '%'::varchar
ALTER TABLE g_db_fk ALTER COLUMN bfb SET DEFAULT '%';

-- 字段 fkzt: 默认值不一致
-- MySQL: 0, Kingbase: 1
ALTER TABLE g_db_fk ALTER COLUMN fkzt SET DEFAULT 0;

-- 字段 handle_nodename: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db_fk ALTER COLUMN handle_nodename TYPE text;

-- 字段 is_top: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_db_fk ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_db_fk ALTER COLUMN unionfid SET DEFAULT 'NO';

-- 字段 wcbl: 类型不一致
-- MySQL: decimal(2,0), Kingbase: varchar(100)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db_fk ALTER COLUMN wcbl TYPE decimal(2,0);

-- ==================== 表: g_db_ldps ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_db_ldps ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_db_periodical ====================
-- 字段 periodical_date: 类型不一致
-- MySQL: datetime, Kingbase: pg_catalog.date()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db_periodical ALTER COLUMN periodical_date TYPE datetime;

-- 字段 pre_periodical_date: 类型不一致
-- MySQL: datetime, Kingbase: pg_catalog.date()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_db_periodical ALTER COLUMN pre_periodical_date TYPE datetime;

-- ==================== 表: g_db_yq ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_db_yq ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_distrib ====================
-- 字段 is_distrib_form: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib ALTER COLUMN is_distrib_form SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib ALTER COLUMN project_id SET DEFAULT 1;

-- ==================== 表: g_distrib_attach ====================
-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib_attach ALTER COLUMN project_id SET DEFAULT 1;

-- ==================== 表: g_distrib_fsfh ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib_fsfh ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_distrib_range ====================
-- 字段 is_sms: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib_range ALTER COLUMN is_sms SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib_range ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 uname: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib_range ALTER COLUMN uname SET DEFAULT 1;

-- ==================== 表: g_distrib_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_top: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_distrib_user ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib_user ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 uname: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_distrib_user ALTER COLUMN uname SET DEFAULT 1;

-- ==================== 表: g_error_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_error_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_evaluate ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_evaluate ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_evaluate_sub ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_evaluate_sub ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_favorite ====================
-- 字段 fid: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_favorite ALTER COLUMN fid SET DEFAULT 0;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_favorite ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_favorite ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 show_order: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_favorite ALTER COLUMN show_order SET DEFAULT 0;

-- ==================== 表: g_favorite_folder ====================
-- 字段 fid: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_favorite_folder ALTER COLUMN fid SET DEFAULT 0;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_favorite_folder ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_favorite_folder ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 show_order: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_favorite_folder ALTER COLUMN show_order SET DEFAULT 0;

-- 字段 showorder: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_favorite_folder ALTER COLUMN showorder SET DEFAULT 0;

-- ==================== 表: g_file_relation ====================
-- 字段 iscustomopinion: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_file_relation ALTER COLUMN iscustomopinion SET DEFAULT '-1';

-- 字段 isopinionrelation: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_file_relation ALTER COLUMN isopinionrelation SET DEFAULT '-1';

-- ==================== 表: g_filecode_redhead_edition ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_filecode_redhead_edition ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_filecode_template ====================
-- 字段 cam_sfgz: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_filecode_template ALTER COLUMN cam_sfgz SET DEFAULT '-1';

-- 字段 cam_sfsxw: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_filecode_template ALTER COLUMN cam_sfsxw SET DEFAULT '-1';

-- 字段 cma_sfcsgw: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_filecode_template ALTER COLUMN cma_sfcsgw SET DEFAULT '-1';

-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_filecode_template ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_filecode_template ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_filecode_template ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_filecode_template_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_filecode_template_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow ====================
-- 字段 drafter_message: 默认值不一致
-- MySQL: 您起草的[模块名称]文件：[文件标题]于[发件时间]由[发人]进行了处理。, Kingbase: '您起草的[模块名称]文件：[文件标题]于[发件时间]由[发人]进行了处理。'::varchar
ALTER TABLE g_flow ALTER COLUMN drafter_message SET DEFAULT '您起草的[模块名称]文件：[文件标题]于[发件时间]由[发人]进行了处理。';

-- 字段 drafter_type: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_flow ALTER COLUMN drafter_type SET DEFAULT 1;

-- 字段 everyone_message: 默认值不一致
-- MySQL: 您参与的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了批示处理。, Kingbase: '您参与的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了批示处理。'::varchar
ALTER TABLE g_flow ALTER COLUMN everyone_message SET DEFAULT '您参与的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了批示处理。';

-- 字段 everyone_type: 默认值不一致
-- MySQL: 6, Kingbase: '6'::varchar
ALTER TABLE g_flow ALTER COLUMN everyone_type SET DEFAULT 6;

-- 字段 follower_message: 默认值不一致
-- MySQL: 您关注的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了处理。, Kingbase: '您关注的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了处理。'::varchar
ALTER TABLE g_flow ALTER COLUMN follower_message SET DEFAULT '您关注的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了处理。';

-- 字段 follower_type: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_flow ALTER COLUMN follower_type SET DEFAULT 1;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 reciever_message: 默认值不一致
-- MySQL: [发件人]于[发件时间]给您发送了[模块名称]：[文件标题]。, Kingbase: '[发件人]于[发件时间]给您发送了[模块名称]：[文件标题]。'::varchar
ALTER TABLE g_flow ALTER COLUMN reciever_message SET DEFAULT '[发件人]于[发件时间]给您发送了[模块名称]：[文件标题]。';

-- 字段 reciever_type: 默认值不一致
-- MySQL: 6, Kingbase: '6'::varchar
ALTER TABLE g_flow ALTER COLUMN reciever_type SET DEFAULT 6;

-- 字段 remind_drafter: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow ALTER COLUMN remind_drafter SET DEFAULT '-1';

-- 字段 remind_follower: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow ALTER COLUMN remind_follower SET DEFAULT '-1';

-- 字段 remind_sender: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow ALTER COLUMN remind_sender SET DEFAULT '-1';

-- 字段 sender_message: 默认值不一致
-- MySQL: 您交由[发件人]处理的的[模块名称]文件：[文件标题]已于[发件时间]处理完毕。, Kingbase: '您交由[发件人]处理的的[模块名称]文件：[文件标题]已于[发件时间]处理完毕。'::varchar
ALTER TABLE g_flow ALTER COLUMN sender_message SET DEFAULT '您交由[发件人]处理的的[模块名称]文件：[文件标题]已于[发件时间]处理完毕。';

-- 字段 sender_type: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_flow ALTER COLUMN sender_type SET DEFAULT 1;

-- ==================== 表: g_flow_button ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_button ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_flow_emulation ====================
-- 字段 archive_period: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_flow_emulation ALTER COLUMN archive_period SET DEFAULT 0;

-- 字段 blqx_days: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_emulation ALTER COLUMN blqx_days SET DEFAULT '-1';

-- 字段 is_historyfile: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_emulation ALTER COLUMN is_historyfile SET DEFAULT '-1';

-- ==================== 表: g_flow_form ====================
-- 字段 auto_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_form ALTER COLUMN auto_hide SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_form ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 isopen_handwrite: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_form ALTER COLUMN isopen_handwrite SET DEFAULT '-1';

-- ==================== 表: g_flow_line ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_line ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_message_fail_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_message_fail_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_meta_pri ====================
-- 字段 allow_auto_clear_file: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_auto_clear_file SET DEFAULT '-1';

-- 字段 allow_default_mark: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_default_mark SET DEFAULT '-1';

-- 字段 allow_display: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_display SET DEFAULT '-1';

-- 字段 allow_download: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_download SET DEFAULT '-1';

-- 字段 allow_duplicate_check: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_duplicate_check SET DEFAULT '-1';

-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 allow_maintain: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_maintain SET DEFAULT '-1';

-- 字段 allow_mark: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_mark SET DEFAULT '-1';

-- 字段 allow_save: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_save SET DEFAULT '-1';

-- 字段 allow_verify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_verify SET DEFAULT '-1';

-- 字段 allow_view_history: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_view_history SET DEFAULT '-1';

-- 字段 allow_white_list: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN allow_white_list SET DEFAULT '-1';

-- 字段 auto_sign: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN auto_sign SET DEFAULT '-1';

-- 字段 first_dept_sn: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN first_dept_sn SET DEFAULT '-1';

-- 字段 force_default: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN force_default SET DEFAULT '-1';

-- 字段 is_handwrite: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN is_handwrite SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 personal_sn: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN personal_sn SET DEFAULT '-1';

-- 字段 unit_sn: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_meta_pri ALTER COLUMN unit_sn SET DEFAULT '-1';

-- ==================== 表: g_flow_module ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_module ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_flow_monitor_set ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_monitor_set ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_node ====================
-- 字段 allow_bat: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_node ALTER COLUMN allow_bat SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_node ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_node ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_flow_node_extenddata ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_node_extenddata ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_node_infolist ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_node_infolist ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_remind ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_remind ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_flow_stage ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_flow_stage ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_form ====================
-- 字段 auto_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form ALTER COLUMN auto_hide SET DEFAULT '-1';

-- 字段 htmljsondata: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_form ALTER COLUMN htmljsondata TYPE longtext;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_tab: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form ALTER COLUMN is_tab SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 mobilelayoutdata: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_form ALTER COLUMN mobilelayoutdata TYPE longtext;

-- 字段 remark: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_form ALTER COLUMN remark TYPE longtext;

-- ==================== 表: g_form_template ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form_template ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_form_template ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_formelement ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_formelement ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_friend_management ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_friend_management ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_grade_setting ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grade_setting ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_grant ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grant ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grant ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_grant_privilege ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grant_privilege ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_grant_role ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grant_role ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_grant_role_privilege ====================
-- 字段 is_delegation_authority: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_grant_role_privilege ALTER COLUMN is_delegation_authority SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_grant_role_privilege ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_grant_role_privilege ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_grant_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_grant_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_hyjy ====================
-- 字段 attendees: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN attendees TYPE text;

-- 字段 attendees_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN attendees_schema TYPE text;

-- 字段 attendees_text: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN attendees_text TYPE text;

-- 字段 invited: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN invited TYPE text;

-- 字段 invited_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN invited_schema TYPE text;

-- 字段 invited_text: 类型不一致
-- MySQL: text, Kingbase: varchar(2000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_hyjy ALTER COLUMN invited_text TYPE text;

-- ==================== 表: g_icon ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_icon ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_inbox ====================
-- 字段 allow_batch: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN allow_batch SET DEFAULT '-1';

-- 字段 ban_sendback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN ban_sendback SET DEFAULT '-1';

-- 字段 is_auto_send: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_auto_send SET DEFAULT '-1';

-- 字段 is_cb: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_cb SET DEFAULT '-1';

-- 字段 is_counter_sign_node: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_counter_sign_node SET DEFAULT '-1';

-- 字段 is_hb: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_hb SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_push: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_push SET DEFAULT '-1';

-- 字段 is_top: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 lock_node: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox ALTER COLUMN lock_node SET DEFAULT '-1';

-- 字段 readed_users: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_inbox ALTER COLUMN readed_users SET DEFAULT '-1';

-- ==================== 表: g_inbox_unify_task ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox_unify_task ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_inbox_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_inbox_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_individual_annual_report ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_individual_annual_report ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_info_edition ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_info_edition ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_infos ====================
-- 字段 blqx_days: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN blqx_days SET DEFAULT '-1';

-- 字段 c_b0007: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_infos ALTER COLUMN c_b0007 SET DEFAULT 0;

-- 字段 c_b0057: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_infos ALTER COLUMN c_b0057 SET DEFAULT 1;

-- 字段 has_finalization: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN has_finalization SET DEFAULT '-1';

-- 字段 is_cascade: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_cascade SET DEFAULT '-1';

-- 字段 is_distribed: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_distribed SET DEFAULT '-1';

-- 字段 is_historyfile: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_historyfile SET DEFAULT '-1';

-- 字段 is_leader_sign: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_leader_sign SET DEFAULT '-1';

-- 字段 is_main_leader: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_main_leader SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_remote: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_remote SET DEFAULT '-1';

-- 字段 is_remotesend: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_remotesend SET DEFAULT '-1';

-- 字段 is_send_form: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN is_send_form SET DEFAULT '-1';

-- 字段 need_remote_feedback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos ALTER COLUMN need_remote_feedback SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_infos ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_infos_grant ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_infos_grant ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_internal_project_config ====================
-- 字段 publish_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_internal_project_config ALTER COLUMN publish_status SET DEFAULT '-1';

-- ==================== 表: g_internal_project_module ====================
-- 字段 publish_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_internal_project_module ALTER COLUMN publish_status SET DEFAULT '-1';

-- ==================== 表: g_label_class ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_label_class ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_label_class ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_label_file ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_label_file ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_label_file ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_label_file_class ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_label_file_class ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_label_file_class ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_label_file_detail ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_label_file_detail ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_label_file_detail ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_label_info ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_label_info ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_label_info ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_ldrc ====================
-- 字段 fbzt: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ldrc ALTER COLUMN fbzt SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_ldrc ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_leader_sec ====================
-- 字段 alenda_blank_text: 默认值不一致
-- MySQL: 部内办公, Kingbase: '部内办公'::varchar
ALTER TABLE g_leader_sec ALTER COLUMN alenda_blank_text SET DEFAULT '部内办公';

-- ==================== 表: g_leave ====================
-- 字段 handle_nodename: 类型不一致
-- MySQL: text, Kingbase: varchar(50)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_leave ALTER COLUMN handle_nodename TYPE text;

-- ==================== 表: g_list ====================
-- 字段 allow_col_width: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN allow_col_width SET DEFAULT '-1';

-- 字段 allow_custom_rowclick: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN allow_custom_rowclick SET DEFAULT '-1';

-- 字段 allow_delete: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN allow_delete SET DEFAULT '-1';

-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 allow_full_delete: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN allow_full_delete SET DEFAULT '-1';

-- 字段 auto_popfilter: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN auto_popfilter SET DEFAULT '-1';

-- 字段 display_mode: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_list ALTER COLUMN display_mode SET DEFAULT 1;

-- 字段 hide_action: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN hide_action SET DEFAULT '-1';

-- 字段 is_show_flow_stage: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN is_show_flow_stage SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 need_custom_folder: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN need_custom_folder SET DEFAULT '-1';

-- 字段 need_flowinfo: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list ALTER COLUMN need_flowinfo SET DEFAULT '-1';

-- 字段 ydlbmb: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_list ALTER COLUMN ydlbmb SET DEFAULT 1;

-- ==================== 表: g_list_button ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_button ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_button ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_list_export_personal ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_export_personal ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_list_item ====================
-- 字段 allow_batch_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN allow_batch_edit SET DEFAULT '-1';

-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 force_filter_single: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN force_filter_single SET DEFAULT '-1';

-- 字段 is_default_filter: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN is_default_filter SET DEFAULT '-1';

-- 字段 is_mobile: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN is_mobile SET DEFAULT '-1';

-- 字段 is_show: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN is_show SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 need_sum: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN need_sum SET DEFAULT '-1';

-- 字段 replace_ellipsis: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item ALTER COLUMN replace_ellipsis SET DEFAULT '-1';

-- ==================== 表: g_list_item_filter ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_item_filter ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_list_personal_item_wdith ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_list_personal_item_wdith ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_manage_favorite ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_manage_favorite ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_maxvalue ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_maxvalue ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_maxvalue_rule ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_maxvalue_rule ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_meeting_filltopic ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meeting_filltopic ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_meeting_plan_dept_report ====================
-- 字段 have_plan: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_meeting_plan_dept_report ALTER COLUMN have_plan SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meeting_plan_dept_report ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_meeting_plan_implement ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meeting_plan_implement ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_meeting_plan_notice ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meeting_plan_notice ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_meeting_topic ====================
-- 字段 attendees: 类型不一致
-- MySQL: text, Kingbase: varchar(1000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN attendees TYPE text;

-- 字段 attendees_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(1000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN attendees_schema TYPE text;

-- 字段 attendees_text: 类型不一致
-- MySQL: text, Kingbase: varchar(1000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN attendees_text TYPE text;

-- 字段 chbm: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN chbm TYPE text;

-- 字段 chbm_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN chbm_schema TYPE text;

-- 字段 chbm_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN chbm_text TYPE text;

-- 字段 is_confirm: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_meeting_topic ALTER COLUMN is_confirm SET DEFAULT '-1';

-- 字段 is_verified: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_meeting_topic ALTER COLUMN is_verified SET DEFAULT '-1';

-- 字段 lxbm: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN lxbm TYPE text;

-- 字段 lxbm_schema: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN lxbm_schema TYPE text;

-- 字段 lxbm_text: 类型不一致
-- MySQL: text, Kingbase: varchar(500)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meeting_topic ALTER COLUMN lxbm_text TYPE text;

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meeting_topic ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_meetingroom_occupy ====================
-- 字段 imgurl: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meetingroom_occupy ALTER COLUMN imgurl TYPE longtext;

-- 字段 seatdata: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_meetingroom_occupy ALTER COLUMN seatdata TYPE longtext;

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_meetingroom_occupy ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_menu ====================
-- 字段 iconbackground: 默认值不一致
-- MySQL: BACKGROUND, Kingbase: 'BACKGROUND'::varchar
ALTER TABLE g_menu ALTER COLUMN iconbackground SET DEFAULT 'BACKGROUND';

-- 字段 is_defasult_shortcut: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_defasult_shortcut SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_new_class: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_new_class SET DEFAULT '-1';

-- 字段 is_new_entrance: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_new_entrance SET DEFAULT '-1';

-- 字段 is_shortcut_display: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_shortcut_display SET DEFAULT '-1';

-- 字段 is_sm_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_sm_hide SET DEFAULT '-1';

-- 字段 is_system: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_system SET DEFAULT '-1';

-- 字段 is_tab_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_tab_reload SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 isquickdisplay_value: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_menu ALTER COLUMN isquickdisplay_value SET DEFAULT '-1';

-- ==================== 表: g_metadata ====================
-- 字段 is_cpp: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN is_cpp SET DEFAULT '-1';

-- 字段 is_crypto: 缺少默认值
ALTER TABLE g_metadata ALTER COLUMN is_crypto SET DEFAULT '-1';

-- 字段 is_on_cpp: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN is_on_cpp SET DEFAULT '-1';

-- 字段 is_safe_mask: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN is_safe_mask SET DEFAULT '-1';

-- 字段 is_safe_signature: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN is_safe_signature SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 primary_key: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN primary_key SET DEFAULT '-1';

-- 字段 primary_key_text: 默认值不一致
-- MySQL: 否, Kingbase: '否'::varchar
ALTER TABLE g_metadata ALTER COLUMN primary_key_text SET DEFAULT '否';

-- 字段 range_sql: 类型不一致
-- MySQL: text, Kingbase: varchar(1000)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_metadata ALTER COLUMN range_sql TYPE text;

-- 字段 subform: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata ALTER COLUMN subform SET DEFAULT '-1';

-- ==================== 表: g_metadata_fieldinfo ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_metadata_fieldinfo ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_module ====================
-- 字段 allow_delegate: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN allow_delegate SET DEFAULT '-1';

-- 字段 allow_fulltext_query: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN allow_fulltext_query SET DEFAULT '-1';

-- 字段 is_data_push: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_module ALTER COLUMN is_data_push SET DEFAULT '-1';

-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify_flow: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN is_modify_flow SET DEFAULT '-1';

-- 字段 is_recommend: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN is_recommend SET DEFAULT '-1';

-- 字段 is_simple: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN is_simple SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 main_dept_draft: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module ALTER COLUMN main_dept_draft SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_module ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_module_attachment ====================
-- 字段 allow_leadin: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN allow_leadin SET DEFAULT '-1';

-- 字段 auto_bt: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN auto_bt SET DEFAULT '-1';

-- 字段 id: nullable 不一致
-- MySQL nullable: False, Kingbase nullable: True
-- ALTER TABLE g_module_attachment ALTER COLUMN id SET NOT NULL;

-- 字段 is_zwqy: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN is_zwqy SET DEFAULT '-1';

-- 字段 preview_trace: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN preview_trace SET DEFAULT '-1';

-- 字段 scan_upload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN scan_upload SET DEFAULT '-1';

-- 字段 show_downloads: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN show_downloads SET DEFAULT '-1';

-- 字段 wps_yun_upload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_attachment ALTER COLUMN wps_yun_upload SET DEFAULT '-1';

-- ==================== 表: g_module_custom_node ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_custom_node ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_module_filerela ====================
-- 字段 allow_rela_status: 默认值不一致
-- MySQL: 0,1,2, Kingbase: '0,1,2'::varchar
ALTER TABLE g_module_filerela ALTER COLUMN allow_rela_status SET DEFAULT '0,1,2';

-- 字段 is_createnew: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_filerela ALTER COLUMN is_createnew SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_filerela ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_filerela ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 isautounion: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_filerela ALTER COLUMN isautounion SET DEFAULT '-1';

-- 字段 need_file: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_filerela ALTER COLUMN need_file SET DEFAULT '-1';

-- ==================== 表: g_module_grade ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_grade ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_push: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_grade ALTER COLUMN is_push SET DEFAULT '-1';

-- ==================== 表: g_module_metadata ====================
-- 字段 is_cpp: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_cpp SET DEFAULT '-1';

-- 字段 is_crypto: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_crypto SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_on_cpp: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_on_cpp SET DEFAULT '-1';

-- 字段 is_safe_mask: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_safe_mask SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 meta_type_text: 默认值不一致
-- MySQL: 业务, Kingbase: '业务'::varchar
ALTER TABLE g_module_metadata ALTER COLUMN meta_type_text SET DEFAULT '业务';

-- 字段 primary_key: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN primary_key SET DEFAULT '-1';

-- 字段 primary_key_text: 默认值不一致
-- MySQL: 否, Kingbase: '否'::varchar
ALTER TABLE g_module_metadata ALTER COLUMN primary_key_text SET DEFAULT '否';

-- 字段 subform: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata ALTER COLUMN subform SET DEFAULT '-1';

-- 字段 subform_text: 默认值不一致
-- MySQL: 否, Kingbase: '否'::varchar
ALTER TABLE g_module_metadata ALTER COLUMN subform_text SET DEFAULT '否';

-- ==================== 表: g_module_metadata_fieldinfo ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_metadata_fieldinfo ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_module_publish_log ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_publish_log ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_module_version ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_module_version ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_notation ====================
-- 字段 packet_content: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_notation ALTER COLUMN packet_content TYPE longtext;

-- ==================== 表: g_notation_history ====================
-- 字段 packet_content: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_notation_history ALTER COLUMN packet_content TYPE longtext;

-- ==================== 表: g_notepaper ====================
-- 字段 index_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notepaper ALTER COLUMN index_status SET DEFAULT '-1';

-- 字段 is_remote: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notepaper ALTER COLUMN is_remote SET DEFAULT '-1';

-- 字段 is_remotesend: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notepaper ALTER COLUMN is_remotesend SET DEFAULT '-1';

-- 字段 is_sms: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notepaper ALTER COLUMN is_sms SET DEFAULT '-1';

-- 字段 is_top: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notepaper ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_notepaper ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_notice ====================
-- 字段 index_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notice ALTER COLUMN index_status SET DEFAULT '-1';

-- 字段 is_remote: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notice ALTER COLUMN is_remote SET DEFAULT '-1';

-- 字段 is_remotesend: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notice ALTER COLUMN is_remotesend SET DEFAULT '-1';

-- 字段 is_sms: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notice ALTER COLUMN is_sms SET DEFAULT '-1';

-- 字段 publish_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_notice ALTER COLUMN publish_status SET DEFAULT '-1';

-- 字段 sf_confirm: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_notice ALTER COLUMN sf_confirm SET DEFAULT '-1';

-- 字段 sf_read: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_notice ALTER COLUMN sf_read SET DEFAULT '-1';

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_notice ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_nr ====================
-- 字段 extra_page_num: 类型不一致
-- MySQL: decimal(2,0), Kingbase: integer(32)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_nr ALTER COLUMN extra_page_num TYPE decimal(2,0);

-- 字段 extra_page_num: 缺少默认值
ALTER TABLE g_nr ALTER COLUMN extra_page_num SET DEFAULT 0;

-- 字段 is_detach: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_detach SET DEFAULT '-1';

-- 字段 is_historyfile: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_historyfile SET DEFAULT '-1';

-- 字段 is_lock: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_lock SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_old: 类型不一致
-- MySQL: char(40), Kingbase: bpchar(40)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_nr ALTER COLUMN is_old TYPE char(40);

-- 字段 is_red: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_red SET DEFAULT '-1';

-- 字段 is_seal: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN is_seal SET DEFAULT '-1';

-- 字段 max_download_times: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN max_download_times SET DEFAULT '-1';

-- 字段 mj: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr ALTER COLUMN mj SET DEFAULT '-1';

-- ==================== 表: g_nr_history ====================
-- 字段 is_encryption: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr_history ALTER COLUMN is_encryption SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr_history ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_nr_temp ====================
-- 字段 is_encryption: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr_temp ALTER COLUMN is_encryption SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_nr_temp ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_object_permission ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_object_permission ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_opinion ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_opinion ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_opinion_attach ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_opinion_attach ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_opinion_tag ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_opinion_tag ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_organize ====================
-- 字段 allow_rcv_remote_file: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize ALTER COLUMN allow_rcv_remote_file SET DEFAULT '-1';

-- 字段 enable_device_lock: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize ALTER COLUMN enable_device_lock SET DEFAULT '-1';

-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_remote: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize ALTER COLUMN is_remote SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_organize_receive ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize_receive ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organize_receive ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_organizem ====================
-- 字段 allow_rcv_remote_file: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN allow_rcv_remote_file SET DEFAULT '-1';

-- 字段 enable_device_lock: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN enable_device_lock SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_remote: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN is_remote SET DEFAULT '-1';

-- 字段 is_temporary: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN is_temporary SET DEFAULT '-1';

-- 字段 is_tripartite: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN is_tripartite SET DEFAULT '-1';

-- 字段 is_unit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_organizem ALTER COLUMN is_unit SET DEFAULT '-1';

-- ==================== 表: g_orguser ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_orguser ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_orguserm ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_orguserm ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_page_application ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_page_application ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_part ====================
-- 字段 category: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_part ALTER COLUMN category SET DEFAULT 1;

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_part ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 show_type: 默认值不一致
-- MySQL: work, Kingbase: 'work'::varchar
ALTER TABLE g_part ALTER COLUMN show_type SET DEFAULT 'work';

-- ==================== 表: g_personal_agenda ====================
-- 字段 index_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda ALTER COLUMN index_status SET DEFAULT '-1';

-- 字段 is_custom_remind: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda ALTER COLUMN is_custom_remind SET DEFAULT '-1';

-- 字段 is_custom_remind_content: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda ALTER COLUMN is_custom_remind_content SET DEFAULT '-1';

-- 字段 is_fullday: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda ALTER COLUMN is_fullday SET DEFAULT '-1';

-- 字段 is_repeat: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda ALTER COLUMN is_repeat SET DEFAULT '-1';

-- 字段 meeting_room: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE g_personal_agenda ALTER COLUMN meeting_room SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_personal_agenda ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_personal_agenda ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_personal_agenda_remind ====================
-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_personal_agenda_remind ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_personal_agenda_remind ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_personal_agenda_setup ====================
-- 字段 index_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_agenda_setup ALTER COLUMN index_status SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_personal_agenda_setup ALTER COLUMN project_id SET DEFAULT 1;

-- ==================== 表: g_personal_config ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_config ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_personal_group ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_personal_group ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_pnodes ====================
-- 字段 ban_next_sendback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN ban_next_sendback SET DEFAULT '-1';

-- 字段 ban_sendback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN ban_sendback SET DEFAULT '-1';

-- 字段 fids: 类型不一致
-- MySQL: varchar(1000), Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_pnodes ALTER COLUMN fids TYPE varchar(1000);

-- 字段 is_autohandle: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_autohandle SET DEFAULT '-1';

-- 字段 is_counter_sign_node: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_counter_sign_node SET DEFAULT '-1';

-- 字段 is_counter_sign_opinion: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_counter_sign_opinion SET DEFAULT '-1';

-- 字段 is_cs: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_cs SET DEFAULT '-1';

-- 字段 is_force_retrieve: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_force_retrieve SET DEFAULT '-1';

-- 字段 is_opinion_valid: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN is_opinion_valid SET DEFAULT '-1';

-- 字段 lock_node: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN lock_node SET DEFAULT '-1';

-- 字段 project_id: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_pnodes ALTER COLUMN project_id SET DEFAULT 1;

-- 字段 retrieve_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes ALTER COLUMN retrieve_status SET DEFAULT '-1';

-- 字段 uname: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_pnodes ALTER COLUMN uname SET DEFAULT 1;

-- ==================== 表: g_pnodes_abn ====================
-- 字段 count_sendback: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes_abn ALTER COLUMN count_sendback SET DEFAULT '-1';

-- ==================== 表: g_pnodes_attach ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes_attach ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_pnodes_garther ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_pnodes_garther ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_portal ====================
-- 字段 is_default: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portal ALTER COLUMN is_default SET DEFAULT '-1';

-- ==================== 表: g_portal_component ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portal_component ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portal_component ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_portal_portlets ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portal_portlets ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_portlets ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portlets ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_folder: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portlets ALTER COLUMN is_folder SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_portlets ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_post ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_post ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_post ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_post_template ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_post_template ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_post_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_post_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_print ====================
-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 id: nullable 不一致
-- MySQL nullable: False, Kingbase nullable: True
-- ALTER TABLE g_print ALTER COLUMN id SET NOT NULL;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_print_item ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print_item ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_print_item_format ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print_item_format ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print_item_format ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_print_template ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_print_template ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_private_usergroup ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_private_usergroup ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_private_usergroup_share ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_private_usergroup_share ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_private_usergroup_user ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_private_usergroup_user ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_privilege ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_privilege ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_privilege ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_sm_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_privilege ALTER COLUMN is_sm_hide SET DEFAULT '-1';

-- 字段 is_system: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_privilege ALTER COLUMN is_system SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_privilege ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_process ====================
-- 字段 content: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE g_process ALTER COLUMN content TYPE longtext;

-- 字段 is_force_retrieve: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_process ALTER COLUMN is_force_retrieve SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_process ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_process_node_sendrange ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_process_node_sendrange ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_process_node_sendrange ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_product ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_product ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_product ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_property_join ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_property_join ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_property_join_rule ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_property_join_rule ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 operation: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_property_join_rule ALTER COLUMN operation SET DEFAULT 1;

-- 字段 operator: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_property_join_rule ALTER COLUMN operator SET DEFAULT 1;

-- ==================== 表: g_quality_system ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_quality_system ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_quality_system_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_quality_system_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_recycle ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE g_recycle ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_recycle ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: g_redhead_edition ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_redhead_edition ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_redhead_edition_wordage ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_redhead_edition_wordage ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_redhead_font ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_redhead_font ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_redhead_unit ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_redhead_unit ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_refresh_mark_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_refresh_mark_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_remind ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_remind ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_remind_history ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_remind_history ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 read_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_remind_history ALTER COLUMN read_status SET DEFAULT '-1';

-- ==================== 表: g_remind_template ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_remind_template ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_remind_template_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_remind_template_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_responsible_file ====================
-- 字段 attach_count: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN attach_count SET DEFAULT 0;

-- 字段 info_version: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN info_version SET DEFAULT 1;

-- 字段 is_distribed: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN is_distribed SET DEFAULT 0;

-- 字段 is_leader_opinion: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN is_leader_opinion SET DEFAULT 0;

-- 字段 is_leader_sign: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN is_leader_sign SET DEFAULT 0;

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN rowstate SET DEFAULT 1;

-- 字段 showorder: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN showorder SET DEFAULT 1;

-- 字段 status: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN status SET DEFAULT 0;

-- 字段 tempstatus: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN tempstatus SET DEFAULT 1;

-- 字段 unionfiles: 默认值不一致
-- MySQL: 0, Kingbase: '0'::numeric
ALTER TABLE g_responsible_file ALTER COLUMN unionfiles SET DEFAULT 0;

-- ==================== 表: g_role ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_role ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_directory_text: 默认值不一致
-- MySQL: 否, Kingbase: '否'::varchar
ALTER TABLE g_role ALTER COLUMN is_directory_text SET DEFAULT '否';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_role ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_role ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 status_text: 默认值不一致
-- MySQL: 启用, Kingbase: '启用'::varchar
ALTER TABLE g_role ALTER COLUMN status_text SET DEFAULT '启用';

-- ==================== 表: g_role_privilege ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_role_privilege ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_role_privilege ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_safe_signature ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_safe_signature ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_schedule_form ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_schedule_form ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_schedule_form_sub ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_schedule_form_sub ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_scheduled_task ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_scheduled_task ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_scheduled_task_sub ====================
-- 字段 unionfid: 默认值不一致
-- MySQL: NO, Kingbase: 'NO'::varchar
ALTER TABLE g_scheduled_task_sub ALTER COLUMN unionfid SET DEFAULT 'NO';

-- ==================== 表: g_server ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_server ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_server_component ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_server_component ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_server_component ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_shortcut ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_shortcut2 ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut2 ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut2 ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_shortcut_add ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_add ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_tab_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_add ALTER COLUMN is_tab_reload SET DEFAULT '-1';

-- ==================== 表: g_shortcut_ding ====================
-- 字段 allow_guset: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_ding ALTER COLUMN allow_guset SET DEFAULT '-1';

-- 字段 display_position: 默认值不一致
-- MySQL: work, Kingbase: 'work'::varchar
ALTER TABLE g_shortcut_ding ALTER COLUMN display_position SET DEFAULT 'work';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_ding ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 use_terminal: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_shortcut_ding ALTER COLUMN use_terminal SET DEFAULT 1;

-- ==================== 表: g_shortcut_ding_setting ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_ding_setting ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_shortcut_menu ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_shortcut_menu ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_skydrive ====================
-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 is_folder: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive ALTER COLUMN is_folder SET DEFAULT '-1';

-- ==================== 表: g_skydrive_privilege ====================
-- 字段 allow_delete: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_privilege ALTER COLUMN allow_delete SET DEFAULT '-1';

-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_privilege ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 allow_maintain: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_privilege ALTER COLUMN allow_maintain SET DEFAULT '-1';

-- ==================== 表: g_skydrive_share ====================
-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_share ALTER COLUMN allow_edit SET DEFAULT '-1';

-- 字段 allow_sms: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_share ALTER COLUMN allow_sms SET DEFAULT '-1';

-- ==================== 表: g_skydrive_share_sub ====================
-- 字段 allow_edit: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_skydrive_share_sub ALTER COLUMN allow_edit SET DEFAULT '-1';

-- ==================== 表: g_suite_menu_base ====================
-- 字段 icon: 默认值不一致
-- MySQL: MENU, Kingbase: 'MENU'::varchar
ALTER TABLE g_suite_menu_base ALTER COLUMN icon SET DEFAULT 'MENU';

-- 字段 iconbackground: 默认值不一致
-- MySQL: BACKGROUND, Kingbase: 'BACKGROUND'::varchar
ALTER TABLE g_suite_menu_base ALTER COLUMN iconbackground SET DEFAULT 'BACKGROUND';

-- 字段 is_defasult_shortcut: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_defasult_shortcut SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_new: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_new SET DEFAULT '-1';

-- 字段 is_new_class: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_new_class SET DEFAULT '-1';

-- 字段 is_new_entrance: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_new_entrance SET DEFAULT '-1';

-- 字段 is_shortcut_display: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_shortcut_display SET DEFAULT '-1';

-- 字段 is_sm_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_sm_hide SET DEFAULT '-1';

-- 字段 is_system: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_system SET DEFAULT '-1';

-- 字段 is_tab_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_base ALTER COLUMN is_tab_reload SET DEFAULT '-1';

-- 字段 target: 默认值不一致
-- MySQL: main, Kingbase: 'main'::varchar
ALTER TABLE g_suite_menu_base ALTER COLUMN target SET DEFAULT 'main';

-- 字段 vobject: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_suite_menu_base ALTER COLUMN vobject SET DEFAULT 1;

-- ==================== 表: g_suite_menu_custom ====================
-- 字段 icon: 默认值不一致
-- MySQL: MENU, Kingbase: 'MENU'::varchar
ALTER TABLE g_suite_menu_custom ALTER COLUMN icon SET DEFAULT 'MENU';

-- 字段 iconbackground: 默认值不一致
-- MySQL: BACKGROUND, Kingbase: 'BACKGROUND'::varchar
ALTER TABLE g_suite_menu_custom ALTER COLUMN iconbackground SET DEFAULT 'BACKGROUND';

-- 字段 is_defasult_shortcut: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_defasult_shortcut SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_new: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_new SET DEFAULT '-1';

-- 字段 is_new_class: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_new_class SET DEFAULT '-1';

-- 字段 is_new_entrance: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_new_entrance SET DEFAULT '-1';

-- 字段 is_shortcut_display: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_shortcut_display SET DEFAULT '-1';

-- 字段 is_sm_hide: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_sm_hide SET DEFAULT '-1';

-- 字段 is_system: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_system SET DEFAULT '-1';

-- 字段 is_tab_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_custom ALTER COLUMN is_tab_reload SET DEFAULT '-1';

-- 字段 target: 默认值不一致
-- MySQL: main, Kingbase: 'main'::varchar
ALTER TABLE g_suite_menu_custom ALTER COLUMN target SET DEFAULT 'main';

-- 字段 vobject: 默认值不一致
-- MySQL: 1, Kingbase: '1'::varchar
ALTER TABLE g_suite_menu_custom ALTER COLUMN vobject SET DEFAULT 1;

-- ==================== 表: g_suite_menu_grant ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_grant ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_suite_menu_grant_group ====================
-- 字段 grant_unit: 默认值不一致
-- MySQL: 菜单授权, Kingbase: '菜单授权'::varchar
ALTER TABLE g_suite_menu_grant_group ALTER COLUMN grant_unit SET DEFAULT '菜单授权';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_suite_menu_grant_group ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_system_version ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_system_version ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_tabform_item ====================
-- 字段 is_cm_server: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_tabform_item ALTER COLUMN is_cm_server SET DEFAULT '-1';

-- 字段 is_focus: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_tabform_item ALTER COLUMN is_focus SET DEFAULT '-1';

-- 字段 is_reload: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_tabform_item ALTER COLUMN is_reload SET DEFAULT '-1';

-- ==================== 表: g_table_index ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_table_index ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_unique: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_table_index ALTER COLUMN is_unique SET DEFAULT '-1';

-- ==================== 表: g_third_party_interface ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_third_party_interface ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_timetask ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_timetask ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_timetask ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_transfer_parameter_sub ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_transfer_parameter_sub ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_tripartite_task ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_tripartite_task ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_ufiles ====================
-- 字段 is_distrib: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_distrib SET DEFAULT '-1';

-- 字段 is_flow: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_flow SET DEFAULT '-1';

-- 字段 is_manager: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_manager SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_owner: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_owner SET DEFAULT '-1';

-- 字段 is_share: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles ALTER COLUMN is_share SET DEFAULT '-1';

-- ==================== 表: g_ufiles_group ====================
-- 字段 is_distrib: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_distrib SET DEFAULT '-1';

-- 字段 is_flow: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_flow SET DEFAULT '-1';

-- 字段 is_manager: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_manager SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 is_owner: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_owner SET DEFAULT '-1';

-- 字段 is_share: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_ufiles_group ALTER COLUMN is_share SET DEFAULT '-1';

-- ==================== 表: g_unit_module ====================
-- 字段 is_top: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_unit_module ALTER COLUMN is_top SET DEFAULT '-1';

-- 字段 is_used: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_unit_module ALTER COLUMN is_used SET DEFAULT '-1';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_unit_module ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_user_custom_setting ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_user_custom_setting ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_user_device ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_user_device ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_user_page_application ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_user_page_application ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_usergroup ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_usergroup ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_usergroup_user ====================
-- 字段 group_role_text: 默认值不一致
-- MySQL: 组员, Kingbase: '组员'::varchar
ALTER TABLE g_usergroup_user ALTER COLUMN group_role_text SET DEFAULT '组员';

-- ==================== 表: g_userinfo ====================
-- 字段 agency_status: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo ALTER COLUMN agency_status SET DEFAULT '-1';

-- 字段 breakrest: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_userinfo ALTER COLUMN breakrest SET DEFAULT 0;

-- 字段 currentgx: 默认值不一致
-- MySQL: 5, Kingbase: '5'::varchar
ALTER TABLE g_userinfo ALTER COLUMN currentgx SET DEFAULT 5;

-- 字段 frozengx: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_userinfo ALTER COLUMN frozengx SET DEFAULT 0;

-- 字段 frozentx: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_userinfo ALTER COLUMN frozentx SET DEFAULT 0;

-- 字段 gongxiu: 默认值不一致
-- MySQL: 5, Kingbase: '5'::varchar
ALTER TABLE g_userinfo ALTER COLUMN gongxiu SET DEFAULT 5;

-- 字段 is_formation: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo ALTER COLUMN is_formation SET DEFAULT '-1';

-- 字段 is_login_allowed: 默认值不一致
-- MySQL: 1,2,3, Kingbase: '1,2,3'::varchar
ALTER TABLE g_userinfo ALTER COLUMN is_login_allowed SET DEFAULT '1,2,3';

-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- 字段 login_type: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_userinfo ALTER COLUMN login_type SET DEFAULT 0;

-- 字段 surplus: 默认值不一致
-- MySQL: 0, Kingbase: '0'::varchar
ALTER TABLE g_userinfo ALTER COLUMN surplus SET DEFAULT 0;

-- ==================== 表: g_userinfo_dingding ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo_dingding ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_userinfo_online ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo_online ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_userinfo_receive ====================
-- 字段 is_valid_data: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_userinfo_receive ALTER COLUMN is_valid_data SET DEFAULT '-1';

-- ==================== 表: g_wechat_log ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_wechat_log ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: g_zsdw ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE g_zsdw ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: guide_page ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE guide_page ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_code ====================
-- 字段 is_directory: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::numeric
ALTER TABLE idm_code ALTER COLUMN is_directory SET DEFAULT '-1';

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE idm_code ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: idm_console_codepackage ====================
-- 字段 current_config_text: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_console_codepackage ALTER COLUMN current_config_text TYPE longtext;

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_console_codepackage ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_console_codepackage_version ====================
-- 字段 config_text: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_console_codepackage_version ALTER COLUMN config_text TYPE longtext;

-- ==================== 表: idm_customization ====================
-- 字段 customdata: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_customization ALTER COLUMN customdata TYPE longtext;

-- ==================== 表: idm_datamodel ====================
-- 字段 data_table_list_json: 类型不一致
-- MySQL: mediumtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datamodel ALTER COLUMN data_table_list_json TYPE mediumtext;

-- 字段 generate_type: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_datamodel ALTER COLUMN generate_type SET DEFAULT '-1';

-- 字段 group_id: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE idm_datamodel ALTER COLUMN group_id SET DEFAULT '-1';

-- 字段 request_type: 类型不一致
-- MySQL: char(10), Kingbase: bpchar(10)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datamodel ALTER COLUMN request_type TYPE char(10);

-- 字段 request_type: 默认值不一致
-- MySQL: GET, Kingbase: 'GET'::bpchar
ALTER TABLE idm_datamodel ALTER COLUMN request_type SET DEFAULT 'GET';

-- 字段 result_json: 类型不一致
-- MySQL: mediumtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datamodel ALTER COLUMN result_json TYPE mediumtext;

-- 字段 rowstate: 默认值不一致
-- MySQL: 1, Kingbase: '1'::numeric
ALTER TABLE idm_datamodel ALTER COLUMN rowstate SET DEFAULT 1;

-- ==================== 表: idm_datasource ====================
-- 字段 debug_result: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datasource ALTER COLUMN debug_result TYPE longtext;

-- 字段 group_id: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE idm_datasource ALTER COLUMN group_id SET DEFAULT '-1';

-- 字段 request_type: 类型不一致
-- MySQL: char(10), Kingbase: bpchar(10)
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datasource ALTER COLUMN request_type TYPE char(10);

-- 字段 request_type: 默认值不一致
-- MySQL: GET, Kingbase: 'GET'::bpchar
ALTER TABLE idm_datasource ALTER COLUMN request_type SET DEFAULT 'GET';

-- 字段 result_json: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_datasource ALTER COLUMN result_json TYPE longtext;

-- ==================== 表: idm_module ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_module_attr ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module_attr ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_module_attr_data ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module_attr_data ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_module_custom ====================
-- 字段 group_id: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::varchar
ALTER TABLE idm_module_custom ALTER COLUMN group_id SET DEFAULT '-1';

-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module_custom ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 schema_text: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_module_custom ALTER COLUMN schema_text TYPE longtext;

-- ==================== 表: idm_module_market ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module_market ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_module_version ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_module_version ALTER COLUMN is_modify SET DEFAULT '-1';

-- ==================== 表: idm_version ====================
-- 字段 is_modify: 默认值不一致
-- MySQL: -1, Kingbase: '-1'::integer
ALTER TABLE idm_version ALTER COLUMN is_modify SET DEFAULT '-1';

-- 字段 schema_text: 类型不一致
-- MySQL: longtext, Kingbase: text()
-- 注意: 类型修改可能导致数据丢失，请谨慎处理
-- ALTER TABLE idm_version ALTER COLUMN schema_text TYPE longtext;

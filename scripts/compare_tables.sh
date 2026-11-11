#!/bin/bash

DBCLI="/home/dreamsoft/code/other/DBChat/dbcli-cli/target/dbcli-cli"
MYDX_DS="mydx"
MYDX_SCHEMA="mydx_20230402"
KINGBASE_DS="kingbase-test"
KINGBASE_SCHEMA="fzzh"
OUTPUT_DIR="/home/dreamsoft/code/other/dbcli/dbcli-cli/target/dbcli-cli"

# 共有表列表
TABLES=$(cat <<'EOF'
g_action
g_action_mark
g_actlog
g_api_log
g_app_data_consume_param
g_app_data_service
g_app_data_service_log
g_app_data_service_param
g_app_gateway_service_log
g_appgroup
g_app_gwservice
g_app_gwservice_interface
g_app_gwservice_privilege
g_application
g_application_menu
g_app_manage
g_app_mservice
g_app_mservice_interface
g_app_mservice_permission
g_archives_info
g_area
g_association_module
g_attach_signsec
g_attach_white_list
g_authattention
g_biz_usergroup
g_biz_usergroup_user
g_bqsz
g_bqwh
g_button
g_cabinet
g_code
g_code_group_private
g_codeprint
g_common_choice_history
g_common_interface_component
g_confidentiality
g_config
g_config_setup
g_config_setup_sub
g_contact
g_contact_catalog
g_contact_pri_insider
g_control
g_control_sub
g_convert
g_convert_item
g_custom_agency
g_custom_agency_log
g_custom_autohandle
g_custom_contacts
g_custom_filetag
g_custom_historyk
g_custom_menu
g_custom_query_temp
g_custom_sender
g_custom_sendgroup
g_custom_sendgroup_user
g_custom_sendnode
g_custom_shortcut_addnew
g_custom_sign
g_custom_tag
g_custom_todo
g_daily_sentence
g_data_source
g_data_submit
g_data_submit_cell
g_data_submit_sheet
g_data_submit_temp
g_data_times
g_db
g_db_cb
g_db_change
g_db_config
g_db_fk
g_db_ldps
g_db_periodical
g_db_rz
g_db_yq
g_device
g_distrib
g_distrib_attach
g_distrib_fsfh
g_distrib_range
g_distrib_user
g_error_log
g_evaluate
g_evaluate_sub
g_favorite
g_favorite_folder
g_filecode_history
g_filecode_redhead_edition
g_filecode_template
g_filecode_template_sub
g_file_relation
g_flow
g_flow_button
g_flow_custom_node
g_flow_emulation
g_flow_form
g_flow_line
g_flow_message_fail_log
g_flow_meta_pri
g_flow_module
g_flow_monitor_set
g_flow_node
g_flow_node_extenddata
g_flow_node_infolist
g_flow_remind
g_flow_stage
g_form
g_formelement
g_form_template
g_friend_management
g_grade_setting
g_grant
g_grant_privilege
g_grant_role
g_grant_role_privilege
g_grant_user
g_holiday
g_holiday_group
g_hyjy
g_icon
g_inbox
g_inbox_unify_task
g_inbox_user
g_individual_annual_report
g_info_edition
g_infos
g_infos_grant
g_internal_project
g_internal_project_config
g_internal_project_module
g_label_class
g_label_file
g_label_file_class
g_label_file_detail
g_label_info
g_ldrc
g_ldrc_template
g_leader_sec
g_leader_sec_group
g_leave
g_list
g_list_button
g_list_export_personal
g_list_item
g_list_item_filter
g_list_personal
g_list_personal_item_wdith
g_manage_favorite
g_maxvalue
g_maxvalue_rule
g_meeting_delib_opinions
g_meeting_filltopic
g_meeting_plan_dept_report
g_meeting_plan_implement
g_meeting_plan_notice
g_meetingroom_occupy
g_meeting_room_resource
g_meetingsq_resource
g_meeting_topic
g_meeting_topic_mark
g_meeting_vote
g_meeting_vote_log
g_menu
g_metadata
g_metadata_fieldinfo
g_module
g_module_attachment
g_module_custom_node
g_module_favorite
g_module_filerela
g_module_grade
g_module_metadata
g_module_metadata_fieldinfo
g_module_publish_log
g_module_publish_task
g_module_version
g_monitor_log
g_notation
g_notation_add_page
g_notation_history
g_notation_papers
g_notepaper
g_notepaper_recent_user
g_notice
g_notice_template
g_notice_user
g_nr
g_nr_history
g_nr_temp
g_object_permission
g_opinion
g_opinion_attach
g_opinion_tag
g_opinion_template
g_organize
g_organizem
g_organize_receive
g_orguser
g_orguserm
g_orguser_receive
g_page_application
g_part
g_partuser
g_personal_agenda
g_personal_agenda_remind
g_personal_agenda_setup
g_personal_config
g_personal_group
g_pnodes
g_pnodes_abn
g_pnodes_attach
g_pnodes_garther
g_portal
g_portal_component
g_portal_portlets
g_portal_template
g_portlets
g_post
g_post_template
g_post_user
g_print
g_print_item
g_print_item_format
g_print_template
g_private_usergroup
g_private_usergroup_share
g_private_usergroup_user
g_privilege
g_process
g_process_node_sendrange
g_product
g_property_join
g_property_join_rule
g_proxysendlog
g_quality_system
g_quality_system_sub
g_recycle
g_redhead_edition
g_redhead_edition_wordage
g_redhead_font
g_redhead_unit
g_refresh_mark_sub
g_remind
g_remind_history
g_remind_template
g_remind_template_sub
g_remote_rcv_temp
g_responsible_file
g_role
g_role_privilege
g_safe_signature
g_scheduled_task
g_scheduled_task_sub
g_schedule_form
g_schedule_form_sub
g_server
g_server_component
g_shortcut
g_shortcut2
g_shortcut_add
g_shortcut_ding
g_shortcut_ding_setting
g_shortcut_menu
g_skydrive
g_skydrive_fav
g_skydrive_privilege
g_skydrive_share
g_skydrive_share_sub
g_skydrive_size
g_sticky_note
g_suite_menu_base
g_suite_menu_custom
g_suite_menu_grant
g_suite_menu_grant_group
g_system_version
g_tabform_item
g_table_index
g_template
g_third_party_interface
g_tripartite_task
g_ufiles
g_ufiles_group
g_unit_module
g_unit_module_request
g_unit_module_score
g_urge
g_user_custom_setting
g_user_device
g_usergroup
g_usergroup_role
g_usergroup_user
g_userinfo
g_userinfo_dingding
g_userinfo_online
g_userinfo_receive
g_user_page_application
g_wechat_log
g_zsdw
idm_code
idm_console_codepackage
idm_console_codepackage_version
idm_customization
idm_datamodel
idm_datasource
idm_log
idm_module
idm_module_attr
idm_module_attr_data
idm_module_custom
idm_module_market
idm_module_version
idm_trace
idm_version
EOF
)

# 输出文件
MYDX_FILE="${OUTPUT_DIR}/mydx_columns.json"
KINGBASE_FILE="${OUTPUT_DIR}/kingbase_columns.json"
DIFF_FILE="${OUTPUT_DIR}/diff_report.md"

echo "开始获取表结构..."

# 清空输出文件
echo '{"tables": []}' > "$MYDX_FILE"
echo '{"tables": []}' > "$KINGBASE_FILE"

# 获取每个表的字段结构
for table in $TABLES; do
    echo "处理表: $table"

    # 获取 mydx 表结构
    mydx_json=$($DBCLI table desc "${MYDX_DS}.${MYDX_SCHEMA}.${table}" --json 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$mydx_json" ]; then
        echo "$mydx_json" | jq --arg tbl "$table" '.data.columns = (.data.columns | map(.name = (.name | ascii_downcase))) | {table: $tbl, columns: .data.columns}' >> "${MYDX_FILE}.tmp"
    fi

    # 获取 kingbase 表结构
    kingbase_json=$($DBCLI table desc "${KINGBASE_DS}.${KINGBASE_SCHEMA}.${table}" --json 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$kingbase_json" ]; then
        echo "$kingbase_json" | jq --arg tbl "$table" '.data.columns = (.data.columns | map(.name = (.name | ascii_downcase))) | {table: $tbl, columns: .data.columns}' >> "${KINGBASE_FILE}.tmp"
    fi
done

# 合并为 JSON 数组
if [ -f "${MYDX_FILE}.tmp" ]; then
    jq -s '{tables: .}' "${MYDX_FILE}.tmp" > "$MYDX_FILE"
    rm "${MYDX_FILE}.tmp"
fi

if [ -f "${KINGBASE_FILE}.tmp" ]; then
    jq -s '{tables: .}' "${KINGBASE_FILE}.tmp" > "$KINGBASE_FILE"
    rm "${KINGBASE_FILE}.tmp"
fi

echo "数据收集完成，开始对比..."
echo "mydx 数据: $MYDX_FILE"
echo "kingbase 数据: $KINGBASE_FILE"
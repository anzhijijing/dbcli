# 数据库结构对比报告

## 概述

- 源数据库: mydx_20230402 (MySQL)
- 目标数据库: fzzh (Kingbase)
- 检查范围: g_ 和 idm_ 开头的表
- 发现差异表数: 274

## 问题统计

| 问题类型 | 数量 |
|----------|------|
| 默认值缺失 | 20 |
| 默认值不同 | 633 |
| 类型不同 | 62 |
| nullable 不同 | 3 |

## 详细差异列表

### 表: g_action

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_actlog

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_api_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_data_consume_param

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_data_service

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_data_service_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_data_service_param

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_gateway_service_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_gwservice

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_gwservice_interface

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| request_type | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_app_gwservice_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_manage

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_mservice

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_mservice_interface

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_app_mservice_permission

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_appgroup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_application

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_partys | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_partys_schema | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_partys_text | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_tags | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_tags_text | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_userinfos | text | varchar(500) | NULL | NULL | 类型不同 |
| allow_userinfos_text | text | varchar(500) | NULL | NULL | 类型不同 |
| app_category | decimal(2,0) | varchar(50) | NULL | NULL | 类型不同 |
| badge_datasource | varchar(32) | decimal(2) | NULL | NULL | 类型不同 |
| disallow_partys | text | varchar(500) | NULL | NULL | 类型不同 |
| disallow_partys_schema | text | varchar(500) | NULL | NULL | 类型不同 |
| disallow_partys_text | text | varchar(500) | NULL | NULL | 类型不同 |
| disallow_tags_text | text | varchar(500) | NULL | NULL | 类型不同 |
| disallow_userinfos | text | varchar(500) | NULL | NULL | 类型不同 |
| disallow_userinfos_text | text | varchar(500) | NULL | NULL | 类型不同 |
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_forbdden | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_reportenter | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| report_location_flag | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| show_in_mobile | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| show_in_pc | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_application_menu

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_archives_info

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_area

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| fid | varchar(50) | varchar(50) | 0 | '0'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_association_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_attach_signsec

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_attach_white_list

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_authattention

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_biz_usergroup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_biz_usergroup_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| group_id | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_bqsz

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attach_count | decimal(5,0) | decimal(5) | 0 | '0'::numeric | 默认值不同 |
| info_version | decimal(9,0) | decimal(9) | 1 | '1'::numeric | 默认值不同 |
| is_distribed | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| is_leader_opinion | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| is_leader_sign | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |
| showorder | decimal(9,0) | decimal(9) | 1 | '1'::numeric | 默认值不同 |
| status | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| tempstatus | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |
| unionfiles | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |

### 表: g_bqwh

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_button

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_default | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_self_enable | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_code

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_system | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_codeprint

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_common_choice_history

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_common_interface_component

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_confidentiality

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_config

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_config_setup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| default_value | text | varchar(500) | NULL | NULL | 类型不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_config_setup_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_contact

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_control

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_control_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_convert

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_convert_flow | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_exchange_feedback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_exchange_form2rcv | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_exchange_receive | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_exchange_send | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_exchange_send2form | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_agency

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| agency_type | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_custom_agency_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_autohandle

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_contacts

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_filetag

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_historyk

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_menu

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_query_temp

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_sender

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_sendgroup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_sendgroup_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_sendnode

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_custom | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_shortcut_addnew

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_sign

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_tag

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_custom_todo

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_daily_sentence

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| id | varchar(150) | varchar(50) | NULL | NULL | nullable不同 |

### 表: g_data_source

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_data_submit

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_data_submit_cell

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_data_submit_sheet

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_data_submit_temp

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_privilege | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_data_times

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_db

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attach_count | decimal(5,0) | decimal(5) | 0 | NULL | 默认值缺失 |
| done_periodical_size | decimal(9,0) | decimal(9) | 0 | NULL | 默认值缺失 |
| feedback_system | varchar(20) | varchar(20) | 1 | '1'::varchar | 默认值不同 |
| feedback_system2 | decimal(3,0) | decimal(3) | 1 | NULL | 默认值缺失 |
| important | decimal(2,0) | decimal(2) | 1 | NULL | 默认值缺失 |
| inform_type | varchar(20) | varchar(20) | 1 | '0'::varchar | 默认值不同 |
| is_distribed | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| is_leader_opinion | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| is_leader_sign | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| is_split | varchar(10) | decimal(1) | 0 | NULL | 类型不同, 默认值缺失 |
| is_template | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_top | varchar(20) | int | -1 | NULL | 类型不同, 默认值缺失 |
| jjcd | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| mj | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| periodical_size | decimal(9,0) | decimal(9) | 0 | NULL | 默认值缺失 |
| spzt | decimal(2,0) | decimal(2) | 1 | NULL | 默认值缺失 |
| status | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| step | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |
| traffic_light | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |
| unionfiles | decimal(2,0) | decimal(2) | 0 | NULL | 默认值缺失 |

### 表: g_db_cb

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attach_count | decimal(5,0) | decimal(5) | 0 | NULL | 默认值缺失 |
| cbzt | varchar(50) | varchar(50) | 0 | '0'::varchar | 默认值不同 |
| handle_nodename | text | varchar(500) | NULL | NULL | 类型不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_db_change

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_db_config

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_db_fk

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attach_count | decimal(5,0) | decimal(5) | 0 | NULL | 默认值缺失 |
| bfb | varchar(100) | varchar(100) | % | '%'::varchar | 默认值不同 |
| fkzt | decimal(2,0) | decimal(2) | 0 | 1 | 默认值不同 |
| handle_nodename | text | varchar(500) | NULL | NULL | 类型不同 |
| is_top | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |
| wcbl | decimal(2,0) | varchar(100) | NULL | NULL | 类型不同 |

### 表: g_db_ldps

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_db_periodical

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| periodical_date | datetime | pg_catalog.date | NULL | NULL | 类型不同 |
| pre_periodical_date | datetime | pg_catalog.date | NULL | NULL | 类型不同 |

### 表: g_db_yq

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_distrib

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_distrib_form | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |

### 表: g_distrib_attach

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |

### 表: g_distrib_fsfh

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_distrib_range

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_sms | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| uname | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |

### 表: g_distrib_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_top | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| uname | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |

### 表: g_error_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_evaluate

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_evaluate_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_favorite

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| fid | varchar(32) | varchar(32) | 0 | '0'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| show_order | varchar(11) | varchar(11) | 0 | '0'::varchar | 默认值不同 |

### 表: g_favorite_folder

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| fid | varchar(32) | varchar(32) | 0 | '0'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| show_order | varchar(11) | varchar(11) | 0 | '0'::varchar | 默认值不同 |
| showorder | varchar(11) | varchar(11) | 0 | '0'::varchar | 默认值不同 |

### 表: g_file_relation

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| iscustomopinion | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |
| isopinionrelation | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |

### 表: g_filecode_redhead_edition

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_filecode_template

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| cam_sfgz | varchar(10) | varchar(10) | -1 | '-1'::varchar | 默认值不同 |
| cam_sfsxw | varchar(10) | varchar(10) | -1 | '-1'::varchar | 默认值不同 |
| cma_sfcsgw | varchar(10) | varchar(10) | -1 | '-1'::varchar | 默认值不同 |
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_filecode_template_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| drafter_message | varchar(200) | varchar(200) | 您起草的[模块名称]文件：[文件标题]于[发件时间]由[发人]进行了处理。 | '您起草的[模块名称]文件：[文件标题]于[发件时间]由[发人]进行了处理。'::varchar | 默认值不同 |
| drafter_type | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |
| everyone_message | varchar(200) | varchar(200) | 您参与的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了批示处理。 | '您参与的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了批示处理。'::varchar | 默认值不同 |
| everyone_type | varchar(100) | varchar(100) | 6 | '6'::varchar | 默认值不同 |
| follower_message | varchar(200) | varchar(200) | 您关注的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了处理。 | '您关注的[模块名称]文件：[文件标题]于[发件时间]由[发件人]进行了处理。'::varchar | 默认值不同 |
| follower_type | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| reciever_message | varchar(200) | varchar(200) | [发件人]于[发件时间]给您发送了[模块名称]：[文件标题]。 | '[发件人]于[发件时间]给您发送了[模块名称]：[文件标题]。'::varchar | 默认值不同 |
| reciever_type | varchar(100) | varchar(100) | 6 | '6'::varchar | 默认值不同 |
| remind_drafter | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| remind_follower | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| remind_sender | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| sender_message | varchar(200) | varchar(200) | 您交由[发件人]处理的的[模块名称]文件：[文件标题]已于[发件时间]处理完毕。 | '您交由[发件人]处理的的[模块名称]文件：[文件标题]已于[发件时间]处理完毕。'::varchar | 默认值不同 |
| sender_type | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |

### 表: g_flow_button

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_emulation

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| archive_period | varchar(20) | varchar(20) | 0 | '0'::varchar | 默认值不同 |
| blqx_days | decimal(5,0) | decimal(5) | -1 | '-1'::integer | 默认值不同 |
| is_historyfile | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_form

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| auto_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| isopen_handwrite | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_line

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_message_fail_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_meta_pri

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_auto_clear_file | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_default_mark | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_display | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_download | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_duplicate_check | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_maintain | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_mark | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_save | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_verify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_view_history | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_white_list | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| auto_sign | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| first_dept_sn | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| force_default | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_handwrite | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| personal_sn | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unit_sn | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_monitor_set

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_node

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_bat | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_node_extenddata

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_node_infolist

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_remind

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_flow_stage

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_form

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| auto_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| htmljsondata | longtext | text | NULL | NULL | 类型不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| mobilelayoutdata | longtext | text | NULL | NULL | 类型不同 |
| remark | longtext | text | NULL | NULL | 类型不同 |

### 表: g_form_template

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_formelement

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_friend_management

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_grade_setting

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_grant

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_grant_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_grant_role

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_grant_role_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_delegation_authority | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_grant_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_hyjy

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attendees | text | varchar(2000) | NULL | NULL | 类型不同 |
| attendees_schema | text | varchar(2000) | NULL | NULL | 类型不同 |
| attendees_text | text | varchar(2000) | NULL | NULL | 类型不同 |
| invited | text | varchar(2000) | NULL | NULL | 类型不同 |
| invited_schema | text | varchar(2000) | NULL | NULL | 类型不同 |
| invited_text | text | varchar(2000) | NULL | NULL | 类型不同 |

### 表: g_icon

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_inbox

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_batch | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| ban_sendback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_auto_send | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_cb | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_counter_sign_node | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_hb | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_push | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_top | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| lock_node | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| readed_users | varchar(1000) | varchar(1000) | -1 | '-1'::varchar | 默认值不同 |

### 表: g_inbox_unify_task

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_inbox_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_individual_annual_report

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_info_edition

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_infos

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| blqx_days | decimal(5,0) | decimal(5) | -1 | '-1'::integer | 默认值不同 |
| c_b0007 | varchar(50) | varchar(50) | 0 | '0'::varchar | 默认值不同 |
| c_b0057 | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |
| has_finalization | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_cascade | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_distribed | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_historyfile | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_leader_sign | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_main_leader | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remote | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remotesend | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_send_form | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| need_remote_feedback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_infos_grant

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_internal_project_config

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| publish_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_internal_project_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| publish_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_label_class

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_label_file

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_label_file_class

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_label_file_detail

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_label_info

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_ldrc

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| fbzt | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_leader_sec

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| alenda_blank_text | varchar(50) | varchar(50) | 部内办公 | '部内办公'::varchar | 默认值不同 |

### 表: g_leave

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| handle_nodename | text | varchar(50) | NULL | NULL | 类型不同 |

### 表: g_list

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_col_width | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_custom_rowclick | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_delete | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_full_delete | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| auto_popfilter | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| display_mode | varchar(200) | varchar(200) | 1 | '1'::varchar | 默认值不同 |
| hide_action | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_show_flow_stage | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| need_custom_folder | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| need_flowinfo | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| ydlbmb | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_list_button

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_list_export_personal

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_list_item

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_batch_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| force_filter_single | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_default_filter | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_mobile | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_show | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| need_sum | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| replace_ellipsis | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_list_item_filter

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_list_personal_item_wdith

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_manage_favorite

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_maxvalue

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_maxvalue_rule

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_meeting_filltopic

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_meeting_plan_dept_report

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| have_plan | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_meeting_plan_implement

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_meeting_plan_notice

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_meeting_topic

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attendees | text | varchar(1000) | NULL | NULL | 类型不同 |
| attendees_schema | text | varchar(1000) | NULL | NULL | 类型不同 |
| attendees_text | text | varchar(1000) | NULL | NULL | 类型不同 |
| chbm | text | varchar(500) | NULL | NULL | 类型不同 |
| chbm_schema | text | varchar(500) | NULL | NULL | 类型不同 |
| chbm_text | text | varchar(500) | NULL | NULL | 类型不同 |
| is_confirm | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_verified | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| lxbm | text | varchar(500) | NULL | NULL | 类型不同 |
| lxbm_schema | text | varchar(500) | NULL | NULL | 类型不同 |
| lxbm_text | text | varchar(500) | NULL | NULL | 类型不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_meetingroom_occupy

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| imgurl | longtext | text | NULL | NULL | 类型不同 |
| seatdata | longtext | text | NULL | NULL | 类型不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_menu

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| iconbackground | varchar(50) | varchar(50) | BACKGROUND | 'BACKGROUND'::varchar | 默认值不同 |
| is_defasult_shortcut | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_class | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_entrance | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_shortcut_display | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sm_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_system | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| isquickdisplay_value | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_metadata

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_cpp | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_crypto | decimal(2,0) | decimal(2) | -1 | NULL | 默认值缺失 |
| is_on_cpp | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_safe_mask | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_safe_signature | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| primary_key | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |
| primary_key_text | varchar(50) | varchar(50) | 否 | '否'::varchar | 默认值不同 |
| range_sql | text | varchar(1000) | NULL | NULL | 类型不同 |
| subform | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |

### 表: g_metadata_fieldinfo

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_delegate | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_fulltext_query | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_data_push | varchar(20) | varchar(20) | -1 | '-1'::varchar | 默认值不同 |
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify_flow | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_recommend | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_simple | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| main_dept_draft | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_module_attachment

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_leadin | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| auto_bt | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| id | varchar(96) | varchar(96) | NULL | NULL | nullable不同 |
| is_zwqy | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| preview_trace | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| scan_upload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| show_downloads | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| wps_yun_upload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_custom_node

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_filerela

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_rela_status | varchar(10) | varchar(10) | 0,1,2 | '0,1,2'::varchar | 默认值不同 |
| is_createnew | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| isautounion | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| need_file | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_grade

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_push | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_metadata

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_cpp | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_crypto | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_on_cpp | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_safe_mask | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| meta_type_text | varchar(50) | varchar(50) | 业务 | '业务'::varchar | 默认值不同 |
| primary_key | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |
| primary_key_text | varchar(50) | varchar(50) | 否 | '否'::varchar | 默认值不同 |
| subform | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |
| subform_text | varchar(50) | varchar(50) | 否 | '否'::varchar | 默认值不同 |

### 表: g_module_metadata_fieldinfo

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_publish_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_module_version

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_notation

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| packet_content | longtext | text | NULL | NULL | 类型不同 |

### 表: g_notation_history

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| packet_content | longtext | text | NULL | NULL | 类型不同 |

### 表: g_notepaper

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| index_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remote | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remotesend | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sms | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_top | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_notice

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| index_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remote | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remotesend | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sms | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| publish_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| sf_confirm | varchar(50) | varchar(50) | -1 | '-1'::varchar | 默认值不同 |
| sf_read | varchar(50) | varchar(50) | -1 | '-1'::varchar | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_nr

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| extra_page_num | decimal(2,0) | int | 0 | NULL | 类型不同, 默认值缺失 |
| is_detach | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_historyfile | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_lock | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_old | char(40) | bpchar | NULL | NULL | 类型不同 |
| is_red | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_seal | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| max_download_times | decimal(4,0) | decimal(4) | -1 | '-1'::integer | 默认值不同 |
| mj | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_nr_history

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_encryption | decimal(1,0) | decimal(1) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_nr_temp

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_encryption | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_object_permission

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_opinion

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_opinion_attach

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_opinion_tag

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_organize

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_rcv_remote_file | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| enable_device_lock | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remote | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_organize_receive

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_organizem

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_rcv_remote_file | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| enable_device_lock | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_remote | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_temporary | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tripartite | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_unit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_orguser

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_orguserm

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_page_application

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_part

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| category | varchar(2000) | varchar(2000) | 1 | '1'::varchar | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| show_type | varchar(100) | varchar(100) | work | 'work'::varchar | 默认值不同 |

### 表: g_personal_agenda

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| index_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_custom_remind | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_custom_remind_content | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_fullday | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_repeat | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| meeting_room | varchar(200) | varchar(200) | -1 | '-1'::varchar | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_personal_agenda_remind

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_personal_agenda_setup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| index_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |

### 表: g_personal_config

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_personal_group

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_pnodes

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| ban_next_sendback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| ban_sendback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| fids | varchar(1000) | text | NULL | NULL | 类型不同 |
| is_autohandle | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_counter_sign_node | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_counter_sign_opinion | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_cs | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_force_retrieve | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_opinion_valid | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| lock_node | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| project_id | varchar(32) | varchar(32) | 1 | '1'::varchar | 默认值不同 |
| retrieve_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| uname | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |

### 表: g_pnodes_abn

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| count_sendback | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_pnodes_attach

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_pnodes_garther

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_portal

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_default | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_portal_component

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_portal_portlets

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_portlets

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_folder | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_post

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_post_template

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_post_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_print

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| id | varchar(32) | varchar(32) | NULL | NULL | nullable不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_print_item

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_print_item_format

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_print_template

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_private_usergroup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_private_usergroup_share

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_private_usergroup_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sm_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_system | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_process

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| content | longtext | text | NULL | NULL | 类型不同 |
| is_force_retrieve | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_process_node_sendrange

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_product

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_property_join

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_property_join_rule

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| operation | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |
| operator | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_quality_system

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_quality_system_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_recycle

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: g_redhead_edition

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_redhead_edition_wordage

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_redhead_font

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_redhead_unit

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_refresh_mark_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_remind

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_remind_history

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| read_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_remind_template

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_remind_template_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_responsible_file

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| attach_count | decimal(5,0) | decimal(5) | 0 | '0'::numeric | 默认值不同 |
| info_version | decimal(9,0) | decimal(9) | 1 | '1'::numeric | 默认值不同 |
| is_distribed | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| is_leader_opinion | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| is_leader_sign | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |
| showorder | decimal(9,0) | decimal(9) | 1 | '1'::numeric | 默认值不同 |
| status | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |
| tempstatus | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |
| unionfiles | decimal(2,0) | decimal(2) | 0 | '0'::numeric | 默认值不同 |

### 表: g_role

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_directory_text | varchar(20) | varchar(20) | 否 | '否'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| status_text | varchar(20) | varchar(20) | 启用 | '启用'::varchar | 默认值不同 |

### 表: g_role_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_safe_signature

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_schedule_form

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_schedule_form_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_scheduled_task

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_scheduled_task_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| unionfid | varchar(50) | varchar(50) | NO | 'NO'::varchar | 默认值不同 |

### 表: g_server

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_server_component

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_shortcut

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_shortcut2

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_shortcut_add

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_shortcut_ding

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_guset | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| display_position | varchar(50) | varchar(50) | work | 'work'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| use_terminal | varchar(100) | varchar(100) | 1 | '1'::varchar | 默认值不同 |

### 表: g_shortcut_ding_setting

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_shortcut_menu

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_skydrive

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_folder | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_skydrive_privilege

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_delete | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_maintain | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_skydrive_share

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| allow_sms | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_skydrive_share_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| allow_edit | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_suite_menu_base

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| icon | varchar(200) | varchar(200) | MENU | 'MENU'::varchar | 默认值不同 |
| iconbackground | varchar(50) | varchar(50) | BACKGROUND | 'BACKGROUND'::varchar | 默认值不同 |
| is_defasult_shortcut | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_class | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_entrance | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_shortcut_display | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sm_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_system | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| target | varchar(20) | varchar(20) | main | 'main'::varchar | 默认值不同 |
| vobject | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_suite_menu_custom

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| icon | varchar(200) | varchar(200) | MENU | 'MENU'::varchar | 默认值不同 |
| iconbackground | varchar(50) | varchar(50) | BACKGROUND | 'BACKGROUND'::varchar | 默认值不同 |
| is_defasult_shortcut | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_class | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_new_entrance | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_shortcut_display | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_sm_hide | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_system | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_tab_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| target | varchar(20) | varchar(20) | main | 'main'::varchar | 默认值不同 |
| vobject | varchar(50) | varchar(50) | 1 | '1'::varchar | 默认值不同 |

### 表: g_suite_menu_grant

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_suite_menu_grant_group

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| grant_unit | varchar(100) | varchar(100) | 菜单授权 | '菜单授权'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_system_version

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_tabform_item

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_cm_server | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_focus | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_reload | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_table_index

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_unique | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_third_party_interface

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_timetask

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_transfer_parameter_sub

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_tripartite_task

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_ufiles

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_distrib | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_flow | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_manager | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_owner | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_share | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_ufiles_group

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_distrib | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_flow | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_manager | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_owner | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_share | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_unit_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_top | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_used | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_user_custom_setting

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_user_device

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_user_page_application

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_usergroup

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_usergroup_user

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| group_role_text | varchar(20) | varchar(20) | 组员 | '组员'::varchar | 默认值不同 |

### 表: g_userinfo

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| agency_status | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| breakrest | varchar(100) | varchar(100) | 0 | '0'::varchar | 默认值不同 |
| currentgx | varchar(100) | varchar(100) | 5 | '5'::varchar | 默认值不同 |
| frozengx | varchar(100) | varchar(100) | 0 | '0'::varchar | 默认值不同 |
| frozentx | varchar(100) | varchar(100) | 0 | '0'::varchar | 默认值不同 |
| gongxiu | varchar(100) | varchar(100) | 5 | '5'::varchar | 默认值不同 |
| is_formation | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| is_login_allowed | varchar(20) | varchar(20) | 1,2,3 | '1,2,3'::varchar | 默认值不同 |
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| login_type | varchar(2) | varchar(2) | 0 | '0'::varchar | 默认值不同 |
| surplus | varchar(100) | varchar(100) | 0 | '0'::varchar | 默认值不同 |

### 表: g_userinfo_dingding

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_userinfo_online

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_userinfo_receive

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_valid_data | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_wechat_log

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: g_zsdw

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: guide_page

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_code

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_directory | decimal(2,0) | decimal(2) | -1 | '-1'::numeric | 默认值不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: idm_console_codepackage

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| current_config_text | longtext | text | NULL | NULL | 类型不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_console_codepackage_version

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| config_text | longtext | text | NULL | NULL | 类型不同 |

### 表: idm_customization

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| customdata | longtext | text | NULL | NULL | 类型不同 |

### 表: idm_datamodel

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| data_table_list_json | mediumtext | text | NULL | NULL | 类型不同 |
| generate_type | int | int | -1 | '-1'::integer | 默认值不同 |
| group_id | varchar(100) | varchar(100) | -1 | '-1'::varchar | 默认值不同 |
| request_type | char(10) | bpchar | GET | 'GET'::bpchar | 类型不同, 默认值不同 |
| result_json | mediumtext | text | NULL | NULL | 类型不同 |
| rowstate | decimal(2,0) | decimal(2) | 1 | '1'::numeric | 默认值不同 |

### 表: idm_datasource

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| debug_result | longtext | text | NULL | NULL | 类型不同 |
| group_id | varchar(100) | varchar(100) | -1 | '-1'::varchar | 默认值不同 |
| request_type | char(10) | bpchar | GET | 'GET'::bpchar | 类型不同, 默认值不同 |
| result_json | longtext | text | NULL | NULL | 类型不同 |

### 表: idm_module

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_module_attr

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_module_attr_data

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_module_custom

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| group_id | varchar(100) | varchar(100) | -1 | '-1'::varchar | 默认值不同 |
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| schema_text | longtext | text | NULL | NULL | 类型不同 |

### 表: idm_module_market

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_module_version

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |

### 表: idm_version

| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |
|------|------------|---------------|--------------|-----------------|------|
| is_modify | decimal(2,0) | decimal(2) | -1 | '-1'::integer | 默认值不同 |
| schema_text | longtext | text | NULL | NULL | 类型不同 |

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品', '3', '1', 'medicine', 'medicine/medicine/index', 1, 0, 'C', '0', '0', 'medicine:medicine:list', '#', 'admin', sysdate(), '', null, '药品菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'medicine:medicine:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'medicine:medicine:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'medicine:medicine:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'medicine:medicine:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药品导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'medicine:medicine:export',       '#', 'admin', sysdate(), '', null, '');
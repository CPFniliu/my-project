
create table sys_table_extend (
   schema_tag varchar(36) comment '数据库',
   name varchar(50) not null comment '表名',
   simple_name varchar(20) not null comment '简称, 生成代码使用',
   type varchar(20) not null comment '表类型',
   comment varchar(200) default '' comment '备注',
   PRIMARY KEY (`schema_tag`,`name`)
) comment '表扩展信息';

insert into sys_table_extend(schema_tag, name, simple_name, type) 
SELECT table_schema, TABLE_NAME, '', LEFT(TABLE_NAME, POSITION('_' IN TABLE_NAME) - 1)
from information_schema.TABLES WHERE TABLE_SCHEMA = 'my-project';


create table sys_field_extend (
    schema_tag varchar(36) comment '数据库',
    table_name varchar(36) not null comment '表名',
    name varchar(30) not null comment '字段名称',
    label varchar(20) not null default '' comment '显示文本',
    dict_type varchar(50) default '' comment '字典类型',
    show_search varchar(20) not null default '' comment '搜索条件{输入框, 下拉框, 单选按钮组, 复选按钮组...}, 为空表示无需搜索',
    show_list varchar(20) not null default '' comment '列表页面条件{输入框, 下拉框, 单选按钮组, 复选按钮组...}, 为空表示无需列表',
    show_add varchar(20) not null default '' comment '新增页面条件{输入框, 下拉框, 单选按钮组, 复选按钮组...}, 为空表示新增无需编辑',
    show_edit varchar(20) not null default '' comment '修改页面条件{输入框, 下拉框, 单选按钮组, 复选按钮组...}, 为空表示修改无需编辑',
    show_detail varchar(20) not null default '' comment '修改页面条件{输入框, 下拉框, 单选按钮组, 复选按钮组...}, 为空表示无需详情页面  ',
    sort int(2) not null comment '排序',
    comment varchar(100) not null default '' comment '备注',
    PRIMARY KEY (`schema_tag`,`table_name`, name)
) comment '表字段扩展信息';

insert into sys_field_extend(schema_tag, table_name, name, sort)
SELECT table_schema, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION
from information_schema.COLUMNS WHERE TABLE_SCHEMA = 'my-project' ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- UPDATE sys_field_extend SET label = '状态', dict_type = 'table_state' WHERE name = 'state' 
-- UPDATE sys_field_extend SET label = '更新时间' WHERE name = 'update_time' 
-- UPDATE sys_field_extend SET label = '添加时间' WHERE name = 'add_time' 




create table sys_module (
    guid varchar(36) primary key comment '全局唯一标识',
    path varchar(100) not null default '' comment '路径',
    level int(1) not null default 0 comment '级别',
    module varchar(36) not null default '' comment '模块',
    comment varchar(200) not null default '' comment '注释'
) comment '页面设计';



create table sys_page (
    guid varchar(36) primary key comment '全局唯一标识',
    path varchar(100) not null default '' comment '路径',
    module varchar(36) not null default '' comment '模块',
    comment varchar(200) not null default '' comment '注释'
) comment '页面设计';

create table sys_post_code (
    guid varchar(36) primary key comment '全局唯一标识',
    code varchar(30) not null comment '返回码',
    page_guid varchar(36) not null comment '页面guid',
    text varchar(30) not null comment '文本',
    `operate_guid` varchar(36) NOT NULL default '' COMMENT '操作人标识',
) comment '返回码'








create table `sys_parameter` (
    `key` varchar(30) primary key comment '名称, 唯一主键',
    value varchar(180) not null comment '参数值',
    type varchar(2) not null default '' comment '类型',
    ord int(4) default 0 comment '排序',
    `comment` varchar(200) not null default '' comment '备注',
    `add_time` datetime NOT NULL COMMENT '添加时间',
    `update_time` datetime NOT NULL COMMENT '更新时间',
    `operate_guid` varchar(36) NOT NULL default '' COMMENT '操作人标识',
    `state` char(1) NOT NULL COMMENT '{1:激活,2:禁用}'
) comment='参数表';




#################################################




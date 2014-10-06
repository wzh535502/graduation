/*穿件数据库*/
create database `graduation`;
/*人员按照时间和班级分表 */

/*权限控制主表**************---*/

/*用户表*/
create table `users`(
	`user_id` int unsigned not null auto_increment comment "用户ID",
	`user_name` varchar(120) not null comment "用户名",		
	 primary key (`userid`)
)engine=innodb default charset='utf8'
/*角色表*/
create table `roles` (
	`role_id` int unsigned not null auto_increment comment "角色ID",
	`role_name` varchar(120) not null comment "角色名称",
	`descript` varchar(120) comment "角色描述"
	primary key ('roleid')
)engine=innodb default charset='utf8'
/*权限表*/
create table `permissions`(
 `perm_id` int unsigned not null auto_increment comment "权限ID",
 `perm_name` varchar(120)  not null comment "全选名称",
 `description` varchar(255) not null comment "权限描述",
 primary key (`permid`)
)engine=innodb default charset='utf8'
/*功能操作表*/
create table `operates`(
	`operate_id` int unsigned not null auto_increment comment "操作id",
	`operate_name` varchar(255) not null comment "操作名称",
	`operate_code` char(8) not null comment "操作权限代码，使用32位二进制标识，存储为16进制数值",
	`intercept_url` varchar(255) comment "拦截url"
	`parent_operate_id` int unsigned not null default '0' comment "父操作ID",
	primary key (`operate_id`)	
) engine=innodb default charset='utf8'

/*权限控制主表**************---*/


/*资源-----------------*/
/*用户组*/
create table `user_groups`(
	`user_group_id` int unsigned not null auto_increment comment "用户组ID",
	`user_group_name` varchar(120) not null comment "用户组名称",
	`parent_user_group_id` int not null default "0" comment "用户组父ID",
	primary key (`user_group_id`)
)engine=innodb default charset="utf8"
/*菜单表*/
create table `menus`(
	`menu_id` int unsigned not null auto_increment comment "菜单ID",
	`menu_name` varchar(30) not null comment "菜单名称",
	`menu_url` varchar(255) not null comment "菜单链接地址",
	`parent_menu_id` int unsigned not null default "0",
	primary key (`menu_id`)
)engine=innodb default charset='utf8'
/*页面元素*/
create table `elements` (
	`element_id` int unsigned not null auto_increment comment "元素ID",
	`element_code` varchar(50) comment "页面元素编号",
	primary key (`element_id`)
) engine=innodb default charset='utf8'
/*文件*/
create table `files` (
	`file_id` int unsigned not null auto_increment comment "文件编号ID",
	`file_name` varchar(200) not null comment "文件名称",
	`file_path` varchar(255) comment "文件路径",
	primary key ('file_id')
) engine = innodb default charset='utf8'

/*资源---------------------*/


/*用户，角色，用户组对应关系表---------------*/
/*用户组与用户关联表*/
create table `user_groups_users_relation`(
	`user_group_id` int unsigned not null comment "用户组ID",
	`user_id`int unsigned not null comment "用户ID"	
	
) engine=innodb default charset='utf8'
/*用户组角色关联表*/
create table `user_groups_roles_relation` (
	`role_id` int unsigned not null comment "角色ID",
	`user_group_id` int unsigned not null comment "用户组ID"
) engine=innodb default charset="utf8"
/*用户角色关联表*/
create table `users_rols_relation`(
	`user_id` int unsigned not null comment "用户ID",
	`role_id` int unsigned not null comment "角色ID"
) engine=innodb default charset='utf8'
/*用户，角色，用户组对应关系表---------------*/


/*权限，功能操作，资源对应表------------------*/
/*角色权限关联表*/
create table `roles_permissions_relation`(
	`role_id` int unsigned not null comment "角色ID",
	`perm_id` int unsigned not null comment "权限ID"
) engine=innodb default charset='utf8'
/*权限与操作关联表*/
create table `roles_operates_relation`(
	`perm_id` int unsigned not null comment "权限ID",
	`operate_id` int unsigned not null comment "操作ID"
) engine=innodb default charset='utf8'
/*权限菜单关联表*/
create table `permissions_menus_relation`(
 `perm_id` int unsigned not null comment "权限ID",
 `menu_id` int unsigned not null comment "菜单ID"
) engine=innodb default charset='utf8'
/*权限页面元素关联表*/
create table `permissions_elements_relation`(
	`perm_id` int unsigned not null comment "权限ID",
	`element_id` int unsigned not null comment "元素ID"
) engine=innodb default charset="utf8"
/*权限文件关联表*/
create table `permissions_files_relation`(
	`perm_id` int unsigned not null comment "权限ID",
	`file_id` int unsigned not null comment "文件ID"
) engine=innodb default charset="utf8"
/*权限，功能操作，资源对应表------------------*/

/*用户详情表*/
create table `users_info`(
	`user_id` int unsigned not null comment "用户ID"
	`student_id` int unsigned not null comment "学号"
	`user_pwd` varchar(120) comment "用户密码",
	`user_sex` tinyint comment "性别：1、男；2、女",
	`user_birthday` datetime comment "出生日期",
	`user_email` varchar(120) comment "email",
	`user_phone` varchar(20) comment "电话号码",
	`user_class_id` int unsigned not null comment "用户所属班级",
	`user_grade_id` int unsigned not null comment "用户所属年级",
	`belongs_type` tinyint unsigned not null comment "所属类型：1、学生，2、教职工，3、",
	`note` varchar(120) comment "备注",
	`is_del` tinyint unsigned not null default 0 comment "是否删除"
	
) engine=innodb default charset='utf8'

/*班级表*/
create table `users_classs_grades_relation` (
	`class_id` int unsigned not null auto_increment  comment "班级ID",
	`class_name` varchar(50) not null comment "班级名称",
	`grade_id` int unsigned not null comment "年级ID",
	primary key ('class_id')
) engine=innodb default charset='utf8'

/* 年级表*/
create table `class`(
	`grade_id` int unsigned not null auto_increment comment "年级ID",
	`grade_name` varchar(120) not null comment "年级名称"
) engine=innodb default charset="utf8"

/*论文课题表*/
create table `paper` (
	`paper_id` int unsigned not null comment "论文id",
	`paper_name` varchar(255) not null comment "论文标题",
	`description` text comment "描述",
	`need_nums` int unsigend not null default "0" comment "需要的人数",
	`user_id` int unsigend not null comment "指导教师id",
	`note` varchar(255) comment "备注"

) engine = innodb default charset="utf8"

/*论文选择设置*/
create table `select_papter`(
	`id` int unsigned not null auto_increment
) engine=innodb default charset="utf8"

/*部门表*/
create table `departments` (
	`department_id` int unsigned not null auto_increment comment "部门ID",
	`department_name` varchar(50) not null comment "部门名称",
	`descript` varchar(255) comment "部门描述",
	`is_del` tinyint default 0 comment "是否是已删除，默认为0，1表示删除"
	
) engine=innodb default charset="utf8"
/*学生论文信息*/
create table `student_paper` (
	`paper_id` int unsigned not null auto_increment comment "论文ID"

) engine = innodb default charset="utf8"
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/

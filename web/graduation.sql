/*�������ݿ�*/
create database `graduation`;
/*��Ա����ʱ��Ͱ༶�ֱ� */

/*Ȩ�޿�������**************---*/

/*�û���*/
create table `users`(
	`user_id` int unsigned not null auto_increment comment "�û�ID",
	`user_name` varchar(120) not null comment "�û���",		
	 primary key (`userid`)
)engine=innodb default charset='utf8'
/*��ɫ��*/
create table `roles` (
	`role_id` int unsigned not null auto_increment comment "��ɫID",
	`role_name` varchar(120) not null comment "��ɫ����",
	`descript` varchar(120) comment "��ɫ����"
	primary key ('roleid')
)engine=innodb default charset='utf8'
/*Ȩ�ޱ�*/
create table `permissions`(
 `perm_id` int unsigned not null auto_increment comment "Ȩ��ID",
 `perm_name` varchar(120)  not null comment "ȫѡ����",
 `description` varchar(255) not null comment "Ȩ������",
 primary key (`permid`)
)engine=innodb default charset='utf8'
/*���ܲ�����*/
create table `operates`(
	`operate_id` int unsigned not null auto_increment comment "����id",
	`operate_name` varchar(255) not null comment "��������",
	`operate_code` char(8) not null comment "����Ȩ�޴��룬ʹ��32λ�����Ʊ�ʶ���洢Ϊ16������ֵ",
	`intercept_url` varchar(255) comment "����url"
	`parent_operate_id` int unsigned not null default '0' comment "������ID",
	primary key (`operate_id`)	
) engine=innodb default charset='utf8'

/*Ȩ�޿�������**************---*/


/*��Դ-----------------*/
/*�û���*/
create table `user_groups`(
	`user_group_id` int unsigned not null auto_increment comment "�û���ID",
	`user_group_name` varchar(120) not null comment "�û�������",
	`parent_user_group_id` int not null default "0" comment "�û��鸸ID",
	primary key (`user_group_id`)
)engine=innodb default charset="utf8"
/*�˵���*/
create table `menus`(
	`menu_id` int unsigned not null auto_increment comment "�˵�ID",
	`menu_name` varchar(30) not null comment "�˵�����",
	`menu_url` varchar(255) not null comment "�˵����ӵ�ַ",
	`parent_menu_id` int unsigned not null default "0",
	primary key (`menu_id`)
)engine=innodb default charset='utf8'
/*ҳ��Ԫ��*/
create table `elements` (
	`element_id` int unsigned not null auto_increment comment "Ԫ��ID",
	`element_code` varchar(50) comment "ҳ��Ԫ�ر��",
	primary key (`element_id`)
) engine=innodb default charset='utf8'
/*�ļ�*/
create table `files` (
	`file_id` int unsigned not null auto_increment comment "�ļ����ID",
	`file_name` varchar(200) not null comment "�ļ�����",
	`file_path` varchar(255) comment "�ļ�·��",
	primary key ('file_id')
) engine = innodb default charset='utf8'

/*��Դ---------------------*/


/*�û�����ɫ���û����Ӧ��ϵ��---------------*/
/*�û������û�������*/
create table `user_groups_users_relation`(
	`user_group_id` int unsigned not null comment "�û���ID",
	`user_id`int unsigned not null comment "�û�ID"	
	
) engine=innodb default charset='utf8'
/*�û����ɫ������*/
create table `user_groups_roles_relation` (
	`role_id` int unsigned not null comment "��ɫID",
	`user_group_id` int unsigned not null comment "�û���ID"
) engine=innodb default charset="utf8"
/*�û���ɫ������*/
create table `users_rols_relation`(
	`user_id` int unsigned not null comment "�û�ID",
	`role_id` int unsigned not null comment "��ɫID"
) engine=innodb default charset='utf8'
/*�û�����ɫ���û����Ӧ��ϵ��---------------*/


/*Ȩ�ޣ����ܲ�������Դ��Ӧ��------------------*/
/*��ɫȨ�޹�����*/
create table `roles_permissions_relation`(
	`role_id` int unsigned not null comment "��ɫID",
	`perm_id` int unsigned not null comment "Ȩ��ID"
) engine=innodb default charset='utf8'
/*Ȩ�������������*/
create table `roles_operates_relation`(
	`perm_id` int unsigned not null comment "Ȩ��ID",
	`operate_id` int unsigned not null comment "����ID"
) engine=innodb default charset='utf8'
/*Ȩ�޲˵�������*/
create table `permissions_menus_relation`(
 `perm_id` int unsigned not null comment "Ȩ��ID",
 `menu_id` int unsigned not null comment "�˵�ID"
) engine=innodb default charset='utf8'
/*Ȩ��ҳ��Ԫ�ع�����*/
create table `permissions_elements_relation`(
	`perm_id` int unsigned not null comment "Ȩ��ID",
	`element_id` int unsigned not null comment "Ԫ��ID"
) engine=innodb default charset="utf8"
/*Ȩ���ļ�������*/
create table `permissions_files_relation`(
	`perm_id` int unsigned not null comment "Ȩ��ID",
	`file_id` int unsigned not null comment "�ļ�ID"
) engine=innodb default charset="utf8"
/*Ȩ�ޣ����ܲ�������Դ��Ӧ��------------------*/

/*�û������*/
create table `users_info`(
	`user_id` int unsigned not null comment "�û�ID"
	`student_id` int unsigned not null comment "ѧ��"
	`user_pwd` varchar(120) comment "�û�����",
	`user_sex` tinyint comment "�Ա�1���У�2��Ů",
	`user_birthday` datetime comment "��������",
	`user_email` varchar(120) comment "email",
	`user_phone` varchar(20) comment "�绰����",
	`user_class_id` int unsigned not null comment "�û������༶",
	`user_grade_id` int unsigned not null comment "�û������꼶",
	`belongs_type` tinyint unsigned not null comment "�������ͣ�1��ѧ����2����ְ����3��",
	`note` varchar(120) comment "��ע",
	`is_del` tinyint unsigned not null default 0 comment "�Ƿ�ɾ��"
	
) engine=innodb default charset='utf8'

/*�༶��*/
create table `users_classs_grades_relation` (
	`class_id` int unsigned not null auto_increment  comment "�༶ID",
	`class_name` varchar(50) not null comment "�༶����",
	`grade_id` int unsigned not null comment "�꼶ID",
	primary key ('class_id')
) engine=innodb default charset='utf8'

/* �꼶��*/
create table `class`(
	`grade_id` int unsigned not null auto_increment comment "�꼶ID",
	`grade_name` varchar(120) not null comment "�꼶����"
) engine=innodb default charset="utf8"

/*���Ŀ����*/
create table `paper` (
	`paper_id` int unsigned not null comment "����id",
	`paper_name` varchar(255) not null comment "���ı���",
	`description` text comment "����",
	`need_nums` int unsigend not null default "0" comment "��Ҫ������",
	`user_id` int unsigend not null comment "ָ����ʦid",
	`note` varchar(255) comment "��ע"

) engine = innodb default charset="utf8"

/*����ѡ������*/
create table `select_papter`(
	`id` int unsigned not null auto_increment
) engine=innodb default charset="utf8"

/*���ű�*/
create table `departments` (
	`department_id` int unsigned not null auto_increment comment "����ID",
	`department_name` varchar(50) not null comment "��������",
	`descript` varchar(255) comment "��������",
	`is_del` tinyint default 0 comment "�Ƿ�����ɾ����Ĭ��Ϊ0��1��ʾɾ��"
	
) engine=innodb default charset="utf8"
/*ѧ��������Ϣ*/
create table `student_paper` (
	`paper_id` int unsigned not null auto_increment comment "����ID"

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

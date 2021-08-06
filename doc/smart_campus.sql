DROP TABLE IF EXISTS `sc_school`;
CREATE TABLE `sc_school` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `name` varchar(20) NOT NULL COMMENT '名称',
     `short_name` varchar(20) NOT NULL COMMENT '简称',
     `city` varchar(50) DEFAULT NULL COMMENT '城市',
     `address` varchar(50) DEFAULT NULL COMMENT '地址',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校';

DROP TABLE IF EXISTS `sc_class`;
CREATE TABLE `sc_class` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `name` varchar(20) NOT NULL COMMENT '名称',
    `grade_id` INT(10) NOT NULL COMMENT '年级ID',

    `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '班级序号，不仅仅是排序',
    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级';

DROP TABLE IF EXISTS `sc_grade`;
CREATE TABLE `sc_grade` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `code` varchar(20) DEFAULT NULL COMMENT '编号',
    `name` varchar(20) NOT NULL COMMENT '年级名称',
    `school_year` varchar(20) NOT NULL COMMENT '某届，如2021',
    `dept_type` tinyint NOT NULL COMMENT '学部，如幼儿园、小学部、初中部、高中部、其它。值是数据字典的编码',

    `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级';


DROP TABLE IF EXISTS `sc_role`;
CREATE TABLE `sc_role` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `pid` INT(10) UNSIGNED NOT NULL COMMENT '父ID',
     `name` varchar(20) NOT NULL COMMENT '角色名称',
     `role_type` tinyint NOT NULL DEFAULT '1' COMMENT '角色类型：0二级管理员 1普通角色',
     `extend_type` tinyint NOT NULL DEFAULT '1' COMMENT '继承方式：0公有继承 1受保护继承 2私有继承',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

DROP TABLE IF EXISTS `sc_worker_role_rel`;
CREATE TABLE `sc_worker_role_rel` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `worker_id` INT(10) UNSIGNED NOT NULL COMMENT '教职工id',
      `role_id` INT(10) UNSIGNED NOT NULL COMMENT '角色id',

      `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教职工与角色关联表';

DROP TABLE IF EXISTS `sc_worker_grade_rel`;
CREATE TABLE `sc_worker_grade_rel` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `worker_id` INT(10) UNSIGNED NOT NULL COMMENT '教职工id',
     `type_id` INT(10) UNSIGNED NOT NULL COMMENT '年级或者班级id',
     `type` tinyint NOT NULL COMMENT '指定关系的类型：0表示年级 1表示班级',
     `subject_code` varchar(50) NOT NULL COMMENT '数据字典中教职工在班级的教学职务编码',
     `duty_code` varchar(50) NOT NULL COMMENT '数据字典中教职工在年级/班级的职务编码',
     `duty_name` varchar(50) NOT NULL COMMENT '数据字典中教职工在年级/班级的职务名称',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教职工和年级或班级职务关系';


DROP TABLE IF EXISTS `sc_dictionary`;
CREATE TABLE `sc_dictionary`  (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `pid` INT(10) UNSIGNED NOT NULL COMMENT 'PID',
      `code` varchar(20) DEFAULT NULL COMMENT '英文编号',
      `name` varchar(30) DEFAULT NULL COMMENT '配置名称',

      `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE INDEX `code`(`code`) USING BTREE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

DROP TABLE IF EXISTS `sc_student`;
CREATE TABLE `sc_student` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `class_id` INT(10) DEFAULT NULL COMMENT '班级ID',
      `name` varchar(30) DEFAULT NULL COMMENT '学生姓名',
      `gender` tinyint NOT NULL DEFAULT '1' COMMENT '性别：0女 1男',
      `number` varchar(32) DEFAULT NULL COMMENT '学号，uuid',
      `study_status` tinyint NOT NULL DEFAULT '1' COMMENT '学生状态：0休学 1在读 2毕业',
      `birthday` INT(10) UNSIGNED NOT NULL COMMENT '生日',
      `idcard_type` tinyint NOT NULL DEFAULT '1' COMMENT '证件类型：0身份证 1护照 2军官 3其它',
      `idcard` varchar(50) DEFAULT NULL COMMENT '证件号',
      `accommodation_type` varchar(50) NOT NULL COMMENT '数据字典中学生住宿类型编码',
      `census_register` char(10) DEFAULT NULL COMMENT '户籍',
      `address` varchar(50) DEFAULT NULL COMMENT '住址',
      `ic_card1` varchar(50) DEFAULT NULL COMMENT 'ic卡号1',
      `ic_card2` varchar(50) DEFAULT NULL COMMENT 'ic卡号2',
      `ic_card3` varchar(50) DEFAULT NULL COMMENT 'ic卡号3',

      `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

DROP TABLE IF EXISTS `sc_person_face`;
CREATE TABLE `sc_person_face` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `face_id` INT(10) UNSIGNED NOT NULL COMMENT 'face表中id',
       `user_id` INT(10) UNSIGNED NOT NULL COMMENT '教职工或者学生id',
       `face_url` varchar(100) DEFAULT NULL COMMENT '修剪图片路径',
       `origin_face_url` varchar(100) DEFAULT NULL COMMENT '原始图片路径',
       `photo_origin` tinyint NOT NULL DEFAULT '1' COMMENT '图片来源：1教职工上传 2未知 3家长上传 4抓拍上传',

       `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`),
       KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教职工或学生图片表，一个用户有多张图片';

DROP TABLE IF EXISTS `sc_student_parent_rel`;
CREATE TABLE `sc_student_parent_rel` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `student_id` INT(10) UNSIGNED NOT NULL COMMENT '学生id',
       `parent_id` INT(10) UNSIGNED NOT NULL COMMENT '监护人id',
       `kinship` tinyint NOT NULL COMMENT '学生和监护人关系：0父亲 1母亲 2爷爷 3奶奶 4外公 5外婆 6家长 7其它，这里应该也是来自字典',

       `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生监护人表';

DROP TABLE IF EXISTS `sc_department`;
CREATE TABLE `sc_department` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `pid` INT(10) UNSIGNED NOT NULL COMMENT '上级部门',
     `name` varchar(30) DEFAULT NULL COMMENT '部门名称',
     `short_name` varchar(20) NOT NULL COMMENT '部门简称',
     `code` varchar(20) DEFAULT NULL COMMENT '部门编码',
     `area_name` varchar(20) DEFAULT NULL COMMENT '区域划分',
     `area_code` varchar(20) DEFAULT NULL COMMENT '区划代码',
     `sort` tinyint NOT NULL DEFAULT '1' COMMENT '部门类别：0管理部门 1普通部门 2其它类别',
     `class` tinyint NOT NULL DEFAULT '1' COMMENT '部门类型：0一类 1二类 2其它类型',
     `phone_number` char(11) DEFAULT NULL COMMENT '联系电话',
     `fax_number` char(11) DEFAULT NULL COMMENT '传真号码',
     `address` varchar(50) DEFAULT NULL COMMENT '地址',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 部门和角色的关系是多对多

DROP TABLE IF EXISTS `sc_admin`;
CREATE TABLE `sc_admin` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `dept_code` varchar(20) DEFAULT NULL COMMENT '部门编码',
     `name` varchar(30) NOT NULL COMMENT '用户名称',
     `login_account` varchar(30) NOT NULL COMMENT '登录账号',
     `password` varchar(50) NOT NULL COMMENT '登录密码',
     `password_confirm` varchar(50) NOT NULL COMMENT '确认密码',
     `identity_code` char(18) DEFAULT NULL COMMENT '身份证号',
     `position_code` varchar(20) DEFAULT NULL COMMENT '职位编码',
     `position_name` varchar(20) DEFAULT NULL COMMENT '职位名称',
     `phone_number` char(11) DEFAULT NULL COMMENT '移动电话',
     `office_number` char(11) DEFAULT NULL COMMENT '办公电话',
     `email` varchar(20) DEFAULT NULL COMMENT '邮箱',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理用户表';

DROP TABLE IF EXISTS `sc_student_parent`;
CREATE TABLE `sc_student_parent` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `name` varchar(30) NOT NULL COMMENT '用户名称',
     `phone_number` char(11) DEFAULT NULL COMMENT '联系电话',
     `is_bind` tinyint NOT NULL DEFAULT '0' COMMENT '是否绑定小程序：0未绑定 1已绑定',
     `is_subscribe` tinyint NOT NULL DEFAULT '0' COMMENT '是否订阅各种服务：0试用中 1已订阅',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监护人表';

DROP TABLE IF EXISTS `sc_worker`;
CREATE TABLE `sc_worker` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `name` varchar(20) NOT NULL COMMENT '教职工名称',
     `gender` tinyint NOT NULL DEFAULT '1' COMMENT '性别：0女 1男',
     `number` varchar(32) DEFAULT NULL COMMENT '工号',
     `phone_number` char(11) DEFAULT NULL COMMENT '联系电话',
     `birthday` INT(10) UNSIGNED NOT NULL COMMENT '生日',
     `idcard_type` tinyint NOT NULL DEFAULT '1' COMMENT '证件类型：0身份证 1护照 2军官 3其它',
     `idcard` varchar(50) DEFAULT NULL COMMENT '证件号',
     `census_register` char(10) DEFAULT NULL COMMENT '户籍',
     `address` varchar(50) DEFAULT NULL COMMENT '住址',
     `is_bind` tinyint NOT NULL DEFAULT '0' COMMENT '是否绑定小程序：0未绑定 1已绑定',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教职工表';

-- 人员和角色的关系是多对多

DROP TABLE IF EXISTS `sc_face_group`;
CREATE TABLE `sc_face_group` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `group_type` tinyint NOT NULL DEFAULT '1' COMMENT '人脸库类别：0学生 1教职工 2教职工家属 3家长 4访客',
     `group_name` varchar(20) DEFAULT NULL COMMENT '人脸库名称',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人脸库分组表';

DROP TABLE IF EXISTS `sc_face`;
CREATE TABLE `sc_face` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `face_group_id` tinyint NOT NULL DEFAULT '1' COMMENT '人脸库id',
     `person_code` varchar(32) DEFAULT NULL UNIQUE COMMENT '编号，UUID生成(如果用户没有输入)，不同于教职工编号，也不同于学生学号',
     `person_name` varchar(20) NOT NULL COMMENT '姓名',
     `gender` tinyint NOT NULL DEFAULT '1' COMMENT '性别：0女 1男',
     `phone_number` char(11) DEFAULT NULL COMMENT '联系电话',
     `idcard_type` tinyint NOT NULL DEFAULT '1' COMMENT '证件类型：0身份证 1护照 2军官 3其它',
     `idcard` varchar(50) DEFAULT NULL COMMENT '证件号',
     `birthday` INT(10) UNSIGNED NOT NULL COMMENT '生日',
     `census_register` char(10) DEFAULT NULL COMMENT '户籍',
     `address` varchar(50) DEFAULT NULL COMMENT '住址',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人脸，在职工和学生表中输入的头像会转储到本表中';

-- 校务管理分割线----------------------------------------

DROP TABLE IF EXISTS `sc_attend_group`;
CREATE TABLE `sc_attend_group` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `group_name` varchar(20) DEFAULT NULL COMMENT '组名称',
     `group_type` tinyint NOT NULL DEFAULT '1' COMMENT '组类别：1学生 2教师',

     `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出勤组';

DROP TABLE IF EXISTS `sc_attend_rule`;
CREATE TABLE `sc_attend_rule` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',



       `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`),
       KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤规则，就是配置考勤组，如分配班次等';

{
  "attendancePeriods": [ // 班段信息，考勤时段
    {
      "periodName": "第一时段上下学",
      "periodOrder": 1,
      "startTime": "07:00",
      "startCheckInTime": "06:00",
      "endCheckInTime": "08:00",
      "endTime": "18:00",
      "startCheckOutTime": "17:00",
      "endCheckOutTime": "19:00"
    }
  ],
  "maxLateMin": "5",
  "maxEarlyMin": "5",
  "shiftName": "测试",
  "absentMin": "20",
  "description": "备注"
}

DROP TABLE IF EXISTS `sc_attend_class`;
CREATE TABLE `sc_attend_class` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',



      `order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`),
      KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤班次';
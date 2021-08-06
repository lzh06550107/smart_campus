DROP TABLE IF EXISTS `app_guardian_relation`;
CREATE TABLE `app_guardian_relation` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `user_id` INT(10) UNSIGNED NOT NULL COMMENT '用户ID',
     `student_id` INT(10) UNSIGNED NOT NULL COMMENT '学生ID',
     `mobile` char(11) NOT NULL COMMENT '手机号',
     `relation_type` tinyint NOT NULL COMMENT '关系：1爷爷 2奶奶 3父亲 4母亲等',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     UNIQUE KEY `mobile` (`mobile`)  USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生监护人表';

DROP TABLE IF EXISTS `app_message_tmpl`;
CREATE TABLE `app_message_tmpl` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `key` varchar(20) NOT NULL COMMENT 'key',
    `content` varchar(256) DEFAULT NULL COMMENT '内容',

    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板表';

DROP TABLE IF EXISTS `app_open_user`;
CREATE TABLE `app_open_user` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `open_id` varchar(64) NOT NULL COMMENT 'open id',
     `union_id` varchar(64) DEFAULT NULL COMMENT 'union id',
     `nick_name` varchar(32) DEFAULT NULL COMMENT '呢称',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     UNIQUE KEY `open_id` (`open_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户表';

DROP TABLE IF EXISTS `app_user_message`;
CREATE TABLE `app_user_message` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `user_id` varchar(20) NOT NULL COMMENT 'open user id',
    `type` varchar(20) DEFAULT NULL COMMENT '类型',

    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

DROP TABLE IF EXISTS `atd_attend_group`;
CREATE TABLE `atd_attend_group` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
    `school_id` INT(10) NOT NULL COMMENT '学校ID',
    `category` tinyint NOT NULL COMMENT '人员类别',
    `name` varchar(64) NOT NULL COMMENT '名称',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤组';

DROP TABLE IF EXISTS `atd_attend_group_rules`;
CREATE TABLE `atd_attend_group_rules` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `group_id` INT(10) NOT NULL COMMENT '组ID',
      `name` varchar(64) NOT NULL COMMENT '名称',
      `signin_time` time NOT NULL COMMENT '签到开始时间',
      `signin_start_time` time NOT NULL COMMENT '签到开始时间',
      `signin_end_time` time NOT NULL COMMENT '签到结束时间',
      `signout_time` time NOT NULL COMMENT '签退时间',
      `signout_start_time` time NOT NULL COMMENT '签退开始时间',
      `signout_end_time` time NOT NULL COMMENT '签退结束时间',

      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤组规则';

DROP TABLE IF EXISTS `atd_attend_record`;
CREATE TABLE `atd_attend_record` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `group_id` INT(10) NOT NULL COMMENT '考勤组ID',
     `rule_id` INT(10) NOT NULL,
     `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
     `school_id` INT(10) NOT NULL COMMENT '学校ID',
     `person_id` varchar(50) NOT NULL COMMENT '名单ID',
     `category` tinyint NOT NULL COMMENT '人员类别',
     `biz_id` INT(10) NOT NULL COMMENT '人员业务ID',
     `attend_date` date NOT NULL COMMENT '考勤日期',
     `signin_time` time DEFAULT NULL COMMENT '签到时间',
     `signin_compare_id` varchar(50) DEFAULT NULL COMMENT '签到比对记录',
     `signout_time` time DEFAULT NULL COMMENT '签退时间',
     `signout_compare_id` varchar(50) DEFAULT NULL COMMENT '签退比对记录',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人，该表一般不需要这个字段，但为了应用层面统一，故添加',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间，该表一般不需要这个字段，但为了应用层面统一，故添加',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤记录表';

DROP TABLE IF EXISTS `atd_device_config`;
CREATE TABLE `atd_device_config` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
     `school_id` INT(10) NOT NULL COMMENT '学校ID',
     `device_id` INT(10) NOT NULL COMMENT '设备ID',
     `type` tinyint NOT NULL COMMENT '1-进，2-出',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤设备配置表';

DROP TABLE IF EXISTS `cm_class`;
CREATE TABLE `cm_class` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `code` varchar(20) NOT NULL COMMENT '编号',
    `name` varchar(20) NOT NULL COMMENT '名称',
    `school_id` INT(10) NOT NULL COMMENT '学校ID',
    `grade_id` INT(10) NOT NULL COMMENT '年级ID',

    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级';

DROP TABLE IF EXISTS `cm_grade`;
CREATE TABLE `cm_grade` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

    `code` varchar(20) DEFAULT NULL COMMENT '编号',
    `name` varchar(20) NOT NULL COMMENT '名称',
    `school_id` INT(10) NOT NULL COMMENT '学校ID',

    `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
    `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
    `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
    `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
    `remark` varchar(100) DEFAULT NULL COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级';

DROP TABLE IF EXISTS `cm_school`;
CREATE TABLE `cm_school` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `tenant_id` INT(10) NOT NULL,
     `code` varchar(20) DEFAULT NULL COMMENT '编码',
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

DROP TABLE IF EXISTS `cm_student`;
CREATE TABLE `cm_student` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `pid` varchar(64) NOT NULL COMMENT '名单库ID',
      `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
      `school_id` INT(10) NOT NULL COMMENT '学校ID',
      `grade_id` INT(10) DEFAULT NULL COMMENT '年级ID',
      `class_id` INT(10) DEFAULT NULL COMMENT '班级ID',
      `student_no` varchar(32) DEFAULT NULL,
      `dorm_id` INT(10) DEFAULT NULL COMMENT '宿舍楼ID',
      `room_id` INT(10) DEFAULT NULL COMMENT '寝室ID',

      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

DROP TABLE IF EXISTS `cm_teacher`;
CREATE TABLE `cm_teacher` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `pid` varchar(64) NOT NULL COMMENT '名单库ID',
      `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
      `school_id` INT(10) NOT NULL COMMENT '学校ID',

      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师表';

DROP TABLE IF EXISTS `data_capture_record`;
CREATE TABLE `data_capture_record` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
       `school_id` INT(10) DEFAULT NULL COMMENT '学校ID',
       `device_id` INT(10) NOT NULL COMMENT '设备ID',
       `channel_no` int NOT NULL,
       `person_type` tinyint NOT NULL,
       `face_picture` varchar(256) DEFAULT NULL COMMENT '人脸图片',
       `body_picture` varchar(256) DEFAULT NULL COMMENT '人形图片',
       `background_picture` varchar(256) DEFAULT NULL COMMENT '背景图片',
       `face_id` varchar(32) DEFAULT NULL COMMENT '人脸ID',
       `face_quality` varchar(32) DEFAULT NULL COMMENT '人脸质量分数',
       `face_position` varchar(32) DEFAULT NULL COMMENT '人脸坐标',
       `temperature` varchar(32) DEFAULT NULL COMMENT '体温',
       `envir_temperature` varchar(32) DEFAULT NULL COMMENT '环境温度',
       `send_time` datetime DEFAULT NULL COMMENT '发送时间',
       `capture_time` datetime DEFAULT NULL COMMENT '抓拍时间',

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人，该表一般不需要这个字段，但为了应用层面统一，故添加',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人，该表一般不需要这个字段，但为了应用层面统一，故添加',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间，该表一般不需要这个字段，但为了应用层面统一，故添加',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抓拍记录表';


DROP TABLE IF EXISTS `data_compare_record`;
CREATE TABLE `data_compare_record` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
       `school_id` INT(10) DEFAULT NULL COMMENT '学校ID',
       `device_id` INT(10) NOT NULL COMMENT '设备ID',
       `person_id` varchar(32) NOT NULL COMMENT '人员ID',
       `visits_count` int DEFAULT NULL COMMENT '访问次数',
       `similarity` varchar(20) DEFAULT NULL COMMENT '相似度',
       `alarm_event` tinyint DEFAULT NULL COMMENT '报警事件 0：不报警 1：黑名单报警  2：白名单报警 3：VIP名单报警  4：非白名单报警',
       `liveness` tinyint DEFAULT NULL COMMENT '人脸活体检测	0：非活体	1： 活体',
       `age` tinyint DEFAULT NULL COMMENT '年龄',
       `gender` tinyint DEFAULT NULL COMMENT '性别 1：男  2：女',
       `glasses` tinyint DEFAULT NULL COMMENT '佩戴眼镜  0：不戴眼镜  1：戴眼镜   2：戴太阳镜',
       `mask` tinyint DEFAULT NULL COMMENT '口罩/面具	0：不佩戴口罩/面具	1：佩戴口罩/面具',
       `race` tinyint DEFAULT NULL COMMENT '胡子  0：没有胡子  1：有胡子',
       `beard` tinyint DEFAULT NULL COMMENT '皮肤种族  1：黄种人  2：黑种人  3：白种人',
       `compare_time` datetime DEFAULT NULL COMMENT '比对时间',

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人，该表一般不需要这个字段，但为了应用层面统一，故添加',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人，该表一般不需要这个字段，但为了应用层面统一，故添加',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间，该表一般不需要这个字段，但为了应用层面统一，故添加',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='比对记录表';

DROP TABLE IF EXISTS `data_face_image`;
CREATE TABLE `data_face_image` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `person_id` INT(10) DEFAULT NULL COMMENT '名单ID',
       `type` tinyint NOT NULL DEFAULT '0',
       `url_prefix` varchar(200) DEFAULT NULL,
       `url` varchar(200) DEFAULT NULL COMMENT 'url',
       `data_url` text COMMENT 'data_url',
       `path` varchar(200) DEFAULT NULL COMMENT 'path',
       `content_type` varchar(20) DEFAULT NULL,
       `original_file_name` varchar(100) DEFAULT NULL COMMENT '原始文件名',

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`),
       KEY `person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名单库图片';

DROP TABLE IF EXISTS `data_person`;
CREATE TABLE `data_person` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `pid` varchar(50) NOT NULL COMMENT '名单编号',
       `biz_id` INT(10) NOT NULL COMMENT '业务系统ID',
       `category` tinyint NOT NULL COMMENT '类别',
       `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
       `school_id` INT(10) NOT NULL,
       `code` varchar(32) DEFAULT NULL COMMENT '编号',
       `name` varchar(32) NOT NULL COMMENT '姓名',
       `type` tinyint DEFAULT NULL COMMENT '名单类型 1：黑名单  2：白名单 3：VIP名单',
       `sex` tinyint DEFAULT NULL COMMENT '性别1：男  2：女  0：未知',
       `id_card` varchar(32) DEFAULT NULL COMMENT '身份证号',
       `nation` varchar(32) DEFAULT NULL COMMENT '民族',
       `birthday` date DEFAULT NULL COMMENT '生日',
       `phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
       `address` varchar(64) DEFAULT NULL COMMENT '地址',
       `start_time` datetime DEFAULT NULL COMMENT '人员有效开始时间',
       `end_time` datetime DEFAULT NULL COMMENT '人员有效结束时间',
       `data_version` INT(10) NOT NULL DEFAULT '1' COMMENT '数据版本',
       `face_image_id` INT(10) NOT NULL DEFAULT '0' COMMENT '人脸底图',
       `role` varchar(20) DEFAULT NULL,

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`),
       UNIQUE KEY `tenant_person_uk` (`tenant_id`,`pid`) USING BTREE,
       KEY `tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名单库';

DROP TABLE IF EXISTS `dev_device_connect`;
CREATE TABLE `dev_device_connect` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `device_id` INT(10) NOT NULL COMMENT '设备序列号',
      `client_id` varchar(64) NOT NULL COMMENT 'client_id',
      `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
      `internal_ip` varchar(32) DEFAULT NULL COMMENT '内网IP',
      `external_ip` varchar(32) DEFAULT NULL COMMENT '外网IP',
      `mac` varchar(32) DEFAULT NULL COMMENT '设备Mac地址',
      `online` tinyint NOT NULL COMMENT '1-在线,0-离线 ',
      `connect_time` datetime DEFAULT NULL COMMENT '上线时间 ',
      `disconnect_time` datetime DEFAULT NULL COMMENT '离线时间',
      `mqtt_version` varchar(32) DEFAULT NULL COMMENT 'mqtt版本',
      `schedule_time` datetime NOT NULL,
      `message_count` int NOT NULL DEFAULT '0',
      `broker_id` varchar(64) DEFAULT NULL,

      `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
      `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
      `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
      `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
      `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
      `remark` varchar(100) DEFAULT NULL COMMENT '备注',

      PRIMARY KEY (`id`),
      UNIQUE KEY `client_id` (`client_id`) USING BTREE,
      KEY `schedule_time` (`schedule_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备连接信息';

DROP TABLE IF EXISTS `dev_device_firmware`;
CREATE TABLE `dev_device_firmware` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `video_format` tinyint DEFAULT NULL COMMENT 'VO环出制式',
       `device_factory_id` varchar(64) DEFAULT NULL COMMENT '设备ID(出厂自带)',
       `mac` varchar(32) DEFAULT NULL COMMENT '设备mac地址',
       `core_version` varchar(64) DEFAULT NULL COMMENT '设备内核版本',
       `version_date` varchar(64) DEFAULT NULL COMMENT '版本日期',
       `web_version` varchar(64) DEFAULT NULL COMMENT '设备页面版本',
       `http_version` varchar(64) DEFAULT NULL COMMENT '设备HTTP版本',
       `mqtt_version` varchar(64) DEFAULT NULL COMMENT 'MQTT版本',
       `sync_time` datetime DEFAULT NULL COMMENT '同步时间',

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备固件信息表';

DROP TABLE IF EXISTS `dev_device_info`;
CREATE TABLE `dev_device_info` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `uuid` varchar(64) COMMENT 'uuid',
       `code` varchar(20) COMMENT '编码',
       `name` varchar(20) NOT NULL COMMENT '名称',
       `model_id` INT(10) DEFAULT NULL,
       `tenant_id` INT(10) NOT NULL COMMENT '代理商ID',
       `school_id` INT(10) NOT NULL,
       `location` varchar(20) COMMENT '位置',

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备表';

DROP TABLE IF EXISTS `dev_device_location`;
CREATE TABLE `dev_device_location` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `device_id` INT(10) NOT NULL,
       `fature` tinyint NOT NULL,
       `location` varchar(64) DEFAULT NULL,
       `dorm_id` INT(10) DEFAULT NULL,
       `type` tinyint DEFAULT NULL,

       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备位置表';

DROP TABLE IF EXISTS `dev_device_network`;
CREATE TABLE `dev_device_network` (
      `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

      `device_id` INT(10) NOT NULL COMMENT 'ID',
      `dhcp` tinyint DEFAULT NULL,
      `ip` varchar(64) COMMENT 'IP',
      `netmask` varchar(64) COMMENT '子网掩码',
      `gateway` varchar(64) COMMENT '网关',
      `dns1` varchar(64) COMMENT 'DNS1',
      `dns2` varchar(64) COMMENT 'DNS1',
      `sync_time` datetime DEFAULT NULL COMMENT '同步时间',

      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备网络配置表';

DROP TABLE IF EXISTS `dev_device_person`;
CREATE TABLE `dev_device_person` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
     `device_id` INT(10) NOT NULL COMMENT '设备ID',
     `person_pid` varchar(64) NOT NULL COMMENT '名单ID',
     `face_image_id` INT(10) NOT NULL COMMENT '人脸ID',
     `task_id` varchar(64) DEFAULT NULL,
     `task_status` tinyint NOT NULL DEFAULT '0',
     `check_time` datetime NOT NULL,
     `sync_time` datetime NOT NULL,
     `sync_status` tinyint NOT NULL,

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`id`),
     UNIQUE KEY `uk` (`tenant_id`,`device_id`,`person_pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备名单库表';

DROP TABLE IF EXISTS `dev_device_secret`;
CREATE TABLE `dev_device_secret` (
     `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

     `device_id` INT(10) NOT NULL COMMENT '设备序列号',
     `client_id` varchar(64) NOT NULL,
     `uuid` varchar(64) NOT NULL COMMENT '设备UUID',
     `public_key` varchar(32) DEFAULT NULL COMMENT '公钥',
     `private_key` varchar(32) DEFAULT NULL COMMENT '私钥',
     `version` varchar(32) DEFAULT NULL COMMENT '版本',
     `username` varchar(64) NOT NULL COMMENT '用户名',
     `password` varchar(128) NOT NULL COMMENT '密码',

     `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
     `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
     `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
     `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
     `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
     `remark` varchar(100) DEFAULT NULL COMMENT '备注',

     PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备密钥表';

DROP TABLE IF EXISTS `dev_device_subscrib`;
CREATE TABLE `dev_device_subscrib` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `client_id` varchar(64) NOT NULL COMMENT 'client_id',
       `topic` varchar(128) NOT NULL COMMENT '主题',
       `qos` tinyint NOT NULL COMMENT 'qos',
       UNIQUE KEY `uk` (`client_id`,`topic`) USING BTREE,
       KEY `client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备订阅信息';

DROP TABLE IF EXISTS `dev_product`;
CREATE TABLE `dev_product` (
       `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

       `code` varchar(64) NOT NULL,
       `name` varchar(32) NOT NULL COMMENT '名称',
       `key` varchar(20) DEFAULT NULL COMMENT 'key',

       `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
       `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
       `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
       `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
       `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
       `remark` varchar(100) DEFAULT NULL COMMENT '备注',

       PRIMARY KEY (`id`),
       UNIQUE KEY `code` (`code`) USING BTREE,
       UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

DROP TABLE IF EXISTS `dev_product_firmware`;
CREATE TABLE `dev_product_firmware` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `product_id` INT(10) NOT NULL,
        `code` varchar(64) NOT NULL,
        `name` varchar(32) DEFAULT NULL COMMENT '名称',
        `md5_sum` varchar(64) DEFAULT NULL,
        `path` varchar(255) DEFAULT NULL,
        `download_url` varchar(255) DEFAULT NULL,
        `file_name` varchar(100) DEFAULT NULL,
        `size` INT(10) DEFAULT NULL,
        `release_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
        `change_log` text COMMENT '变更日志',

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',
        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

DROP TABLE IF EXISTS `dev_product_type`;
CREATE TABLE `dev_product_type` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `name` varchar(32) DEFAULT NULL COMMENT '名称',
        `channel` tinyint NOT NULL,
        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类型';

# 这个表和dev_device_subscrib一样
DROP TABLE IF EXISTS `dev_subscrib`;
CREATE TABLE `dev_subscrib` (
        `client_id` varchar(64) NOT NULL COMMENT 'client_id',
        `topic` varchar(128) NOT NULL COMMENT '主题',
        `qos` tinyint NOT NULL COMMENT 'qos',
        UNIQUE KEY `uk` (`client_id`,`topic`) USING BTREE,
        KEY `client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备订阅信息';

DROP TABLE IF EXISTS `iam_authority`;
CREATE TABLE `iam_authority` (
         `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

         `parent_id` INT(10) NOT NULL COMMENT '上级ID',
         `name` varchar(20) NOT NULL COMMENT '名称',
         `authority` varchar(20) NOT NULL COMMENT '权限标识,分隔符:',
         `platform_usable` tinyint NOT NULL DEFAULT '0' COMMENT '平台可用  1-是 ，0-否',
         `tenant_usable` tinyint NOT NULL DEFAULT '0' COMMENT '租户可用   1-是 ，0-否',
         `type` tinyint NOT NULL COMMENT '类型 1-组 ，2-权限',
         `order_value` tinyint NOT NULL COMMENT '排序值',
         `status` tinyint NOT NULL COMMENT '状态 1-可用，0-不可用',
         `remark` varchar(100) DEFAULT NULL COMMENT '备注',
         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限配置表';

DROP TABLE IF EXISTS `iam_role`;
CREATE TABLE `iam_role` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `tenant_id` INT(10) NOT NULL COMMENT '租户ID',
        `code` varchar(20) NOT NULL COMMENT ' 编码',
        `name` varchar(20) NOT NULL COMMENT '密码',
        `type` tinyint NOT NULL,

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

        PRIMARY KEY (`id`),
        UNIQUE KEY `tenant_id_code` (`tenant_id`,`code`) USING BTREE,
        KEY `tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

DROP TABLE IF EXISTS `iam_role_perm`;
CREATE TABLE `iam_role_perm` (
         `role_id` INT(10) NOT NULL,
         `perm_id` INT(10) NOT NULL,
         PRIMARY KEY (`role_id`,`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和权限关系表';

DROP TABLE IF EXISTS `iam_tenant`;
CREATE TABLE `iam_tenant` (
          `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

          `code` varchar(20) NOT NULL COMMENT '编码',
          `name` varchar(20) NOT NULL COMMENT '名称',
          `key` varchar(10) NOT NULL,
          `type` int NOT NULL DEFAULT '0' COMMENT '类型 ',
          `domain` varchar(20) DEFAULT NULL COMMENT '域',

          `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
          `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
          `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
          `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
          `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
          `remark` varchar(100) DEFAULT NULL COMMENT '备注',

          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户表';

DROP TABLE IF EXISTS `iam_user_account`;
CREATE TABLE `iam_user_account` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `username` varchar(20) NOT NULL COMMENT '用户名',
        `type` int NOT NULL COMMENT '用户类型',
        `tenant_id` INT(10) DEFAULT NULL,
        `school_id` INT(10) DEFAULT NULL,
        `password` varchar(100) NOT NULL COMMENT '密码',
        `fullname` varchar(20) DEFAULT NULL COMMENT '名称',
        `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
        `email` varchar(40) DEFAULT NULL COMMENT '邮箱',

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

        PRIMARY KEY (`id`),
        UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

DROP TABLE IF EXISTS `iam_user_role_rel`;
CREATE TABLE `iam_user_role_rel` (
         `user_id` INT(10) NOT NULL COMMENT '用户ID',
         `role_id` INT(10) NOT NULL COMMENT '角色ID',
         PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

DROP TABLE IF EXISTS `sdm_access_record`;
CREATE TABLE `sdm_access_record` (
         `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

         `tenant_id` INT(10) NOT NULL,
         `school_id` INT(10) NOT NULL,
         `device_id` INT(10) NOT NULL,
         `dorm_id` INT(10) NOT NULL,
         `student_id` INT(10) NOT NULL,
         `capture_id` varchar(64) NOT NULL COMMENT '抓拍记录ID',
         `face_picture` varchar(256) DEFAULT NULL COMMENT '抓拍图',
         `face_image_id` INT(10) NOT NULL COMMENT '底图ID',
         `type` tinyint NOT NULL COMMENT '1-进，2-出',
         `access_time` datetime NOT NULL COMMENT '时间',


         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿舍出入记录';

DROP TABLE IF EXISTS `sdm_device_config`;
CREATE TABLE `sdm_device_config` (
         `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

         `tenant_id` INT(10) NOT NULL,
         `school_id` INT(10) NOT NULL,
         `dorm_id` INT(10) NOT NULL,
         `device_id` INT(10) NOT NULL,
         `channel_no` int NOT NULL,
         `type` tinyint NOT NULL COMMENT '1-进，2-出',

         `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
         `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
         `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
         `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
         `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
         `remark` varchar(100) DEFAULT NULL COMMENT '备注',

         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿管设备关联表';

DROP TABLE IF EXISTS `sdm_dorm`;
CREATE TABLE `sdm_dorm` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `school_id` INT(10) NOT NULL,
        `code` varchar(20) NOT NULL,
        `name` varchar(64) NOT NULL COMMENT '名称',

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿舍楼';

DROP TABLE IF EXISTS `sdm_floor`;
CREATE TABLE `sdm_floor` (
         `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

         `school_id` INT(10) NOT NULL,
         `floor_id` INT(10) NOT NULL,
         `name` varchar(64) NOT NULL COMMENT '名称',

         `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
         `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
         `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
         `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
         `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
         `remark` varchar(100) DEFAULT NULL COMMENT '备注',

         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿舍楼层';

DROP TABLE IF EXISTS `sdm_room`;
CREATE TABLE `sdm_room` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `dorm_id` INT(10) NOT NULL,
        `code` varchar(20) NOT NULL,
        `name` varchar(20) NOT NULL,

        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='宿舍房间';

DROP TABLE IF EXISTS `sys_conf`;
CREATE TABLE `sys_conf` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `key` varchar(50) NOT NULL,
        `name` varchar(50) NOT NULL,
        `value` varchar(100) NOT NULL,
        `type` varchar(20) DEFAULT NULL,
        `validata` json DEFAULT NULL,

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

DROP TABLE IF EXISTS `sys_locks`;
CREATE TABLE `sys_locks` (
         `name` varchar(50) NOT NULL,
         `remark` varchar(20) DEFAULT NULL,
         PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
        `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',

        `key` varchar(50) NOT NULL,
        `name` varchar(50) NOT NULL,
        `cron` varchar(100) NOT NULL,
        `type` varchar(20) NOT NULL,
        `validata` json DEFAULT NULL,

        `create_id` INT(10) UNSIGNED NOT NULL COMMENT '创建人',
        `create_time` INT(10) UNSIGNED NOT NULL COMMENT '创建时间',
        `update_id` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新人',
        `update_time` INT(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
        `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：0无效 1有效',
        `remark` varchar(100) DEFAULT NULL COMMENT '备注',

        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: st
# ------------------------------------------------------
# Server version 5.0.18-nt

DROP DATABASE IF EXISTS `st`;
CREATE DATABASE `st` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `st`;

#
# Table structure for table person
#

CREATE TABLE `person` (
  `id` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `age` varchar(30) default NULL,
  `sex` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `person` VALUES ('null','null','null','null');
INSERT INTO `person` VALUES ('1305551113','é»ä¿æ°','32','å¥³');
INSERT INTO `person` VALUES ('1305551117','李灵勇','18','男');
INSERT INTO `person` VALUES ('ss','ss','ss','ss');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table st_admin
#

CREATE TABLE `st_admin` (
  `admin_id` varchar(100) NOT NULL COMMENT '用户ID（使用UUID，暂时只支持单管理员）',
  `admin_username` varchar(20) NOT NULL COMMENT '用户名(系统唯一，暂时只支持单管理员)',
  `admin_password` varchar(20) NOT NULL COMMENT '密码',
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台管理表';
INSERT INTO `st_admin` VALUES ('1','admin','admin123');
/*!40000 ALTER TABLE `st_admin` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table st_financial
#

CREATE TABLE `st_financial` (
  `f_id` varchar(100) NOT NULL COMMENT '财务id（使用UUID）',
  `f_type` varchar(10) NOT NULL COMMENT '类型（收入/支出）',
  `f_money` double(10,2) NOT NULL COMMENT '金额',
  `f_date` datetime NOT NULL COMMENT '日期',
  `f_associate` varchar(100) default NULL COMMENT '支出申报人/收入来源（if会费填会员名称）',
  `f_desc` varchar(1000) default NULL COMMENT '收支说明',
  `f_recorder` varchar(20) default NULL COMMENT '记录人',
  `st_id` int(11) NOT NULL COMMENT '社团id',
  PRIMARY KEY  (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务表';
INSERT INTO `st_financial` VALUES ('1ba30197-6d4d-4f21-b6e3-79656f4fc68a','收入',10000,'2015-11-25','李灵勇','获奖','李灵勇',1048);
INSERT INTO `st_financial` VALUES ('3b2430d5-f5d7-4dc5-866d-ff156d15988d','收入',45,'2015-10-11','52','','132',1045);
INSERT INTO `st_financial` VALUES ('99625593-1d5a-405d-a8fc-7d1f9c2f6562','支出',10,'2015-02-10','阿','','12',1045);
/*!40000 ALTER TABLE `st_financial` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table st_member
#

CREATE TABLE `st_member` (
  `m_id` varchar(100) NOT NULL COMMENT '会员id（使用UUID）',
  `m_name` varchar(20) NOT NULL COMMENT '姓名',
  `m_sex` varchar(10) default NULL COMMENT '性别',
  `m_major` varchar(100) default NULL COMMENT '院系专业班级',
  `m_dorm` varchar(100) default NULL COMMENT '宿舍',
  `m_qq` varchar(20) default NULL COMMENT 'qq',
  `m_email` varchar(100) default NULL COMMENT '邮箱',
  `m_phone` varchar(20) default NULL COMMENT '电话',
  `m_dept` varchar(20) default NULL COMMENT '部门',
  `m_post` varchar(20) default NULL COMMENT '职务',
  `m_money` varchar(20) NOT NULL COMMENT '会费缴纳情况：**年已交/未交/已毕业/已退出',
  `m_addtime` datetime default NULL COMMENT '入会时间',
  `m_state` varchar(10) NOT NULL COMMENT '会员状态（在册/已毕业/已退出）',
  `m_leavetime` datetime default NULL COMMENT '毕业时间/退出时间',
  `m_desc` varchar(1000) default NULL COMMENT '备注（如退出原因、毕业去向等）',
  `st_id` int(11) NOT NULL COMMENT '社团id',
  PRIMARY KEY  (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';
INSERT INTO `st_member` VALUES ('5b1bb168-f0a8-40bb-ad4b-a58674c3326a','吕少轩','男','信息工程学院-计算机科学与技术','9-326','666','666@qq.com','110','技术部','队长','已交','2015-11-15','在册','2017-09-01','',1045);
INSERT INTO `st_member` VALUES ('738f49d2-a0c3-4092-9b7f-03480677e63e','李灵勇','男','信息工程学院-计算机科学与技术','9栋','754798989','754798989@qq.com','18922292506','网络部','部长','已交','2013-10-10','已退出','2015-06-30','',1048);
/*!40000 ALTER TABLE `st_member` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table st_society
#

CREATE TABLE `st_society` (
  `st_id` int(11) NOT NULL auto_increment COMMENT '社团id（自增、从1000起）',
  `st_password` varchar(20) NOT NULL default '666666' COMMENT '社团登录密码，默认666666',
  `st_name` varchar(100) NOT NULL COMMENT '社团名称',
  `st_city` varchar(20) default NULL COMMENT '所在城市',
  `st_school` varchar(100) default NULL COMMENT '所属院校',
  `st_addtime` datetime NOT NULL COMMENT '注册时间',
  `st_desc` varchar(1000) default NULL COMMENT '简要说明',
  `lx_name` varchar(20) default NULL COMMENT '联系人姓名',
  `lx_phone` varchar(20) default NULL COMMENT '联系人电话',
  `lx_email` varchar(100) default NULL COMMENT '联系人邮箱',
  `lx_qq` varchar(20) default NULL COMMENT '联系人qq',
  PRIMARY KEY  (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社团信息表';
INSERT INTO `st_society` VALUES (1016,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1017,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1018,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1019,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1020,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1021,'1','1','1','1','2015-11-05 17:51:34','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1022,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1023,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1024,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1025,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1026,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1027,'1','1','1','1','2015-11-05 17:51:35','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1028,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1029,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1030,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1031,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1032,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1033,'1','1','1','1','2015-11-05 17:51:36','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1034,'1','1','1','1','2015-11-05 17:51:37','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1035,'1','1','1','1','2015-11-05 17:51:37','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1036,'1','1','1','1','2015-11-05 17:54:11','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1037,'1','1','1','1','2015-11-05 17:54:11','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1038,'1','1','1','1','2015-11-05 17:54:12','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1039,'1','1','1','1','2015-11-05 17:54:12','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1040,'1','1','1','1','2015-11-05 17:54:12','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1041,'1','1','1','1','2015-11-05 17:54:12','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1042,'1','1','1','1','2015-11-05 18:04:07','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1043,'1','1','1','1','2015-11-05 18:09:39','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1044,'1','1','1','1','2015-11-05 18:10:13','1','1','1','1','1');
INSERT INTO `st_society` VALUES (1045,'456','456','123','123','2015-11-05 23:22:01','123','123','123','123','123');
INSERT INTO `st_society` VALUES (1046,'456','计算机学生服务队','广东广州','广东药学院','2015-11-16 14:36:45','计算机学生服务队成立于---','吕少轩','110','666@qq.com','666');
INSERT INTO `st_society` VALUES (1048,'123456','计算机学生服务队','广东广州','广东药学院','2015-11-21 19:28:37','j','李灵勇','18922292506','754798989@qq.com','754798989');
/*!40000 ALTER TABLE `st_society` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table st_transaction
#

CREATE TABLE `st_transaction` (
  `t_id` varchar(100) NOT NULL COMMENT '事务id（使用UUID）',
  `t_title` varchar(200) NOT NULL COMMENT '事务标题',
  `t_recorder` varchar(20) default NULL COMMENT '记录人',
  `t_director` varchar(20) default NULL COMMENT '负责人',
  `t_attendance` varchar(200) default NULL COMMENT '出席人员',
  `t_desc` varchar(1000) default NULL COMMENT '事务描述',
  `t_time` datetime default NULL COMMENT '事务日期时间',
  `t_state` varchar(10) NOT NULL COMMENT '事务状态（未结束/已结束）',
  `st_id` int(11) NOT NULL COMMENT '社团id',
  PRIMARY KEY  (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社团事务表';
/*!40000 ALTER TABLE `st_transaction` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table tb_userlist
#

CREATE TABLE `tb_userlist` (
  `name` varchar(30) default NULL,
  `username` varchar(30) default NULL,
  `pass` varchar(30) default NULL,
  `quan` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `tb_userlist` VALUES ('liam','liam','root','q');
/*!40000 ALTER TABLE `tb_userlist` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

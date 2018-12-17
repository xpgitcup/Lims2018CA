/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-17 18:33:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `object_type`
-- ----------------------------
DROP TABLE IF EXISTS `object_type`;
CREATE TABLE `object_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gs42fxor6ekxo4qt4pspavjb` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object_type
-- ----------------------------
INSERT INTO `object_type` VALUES ('1', '0', '教授', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('2', '0', '副教授', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('3', '0', '讲师', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('4', '0', '助教', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('5', '0', '教授级高工', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('6', '0', '高工', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('7', '0', '工程师', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('8', '0', '助理工程师', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('9', '0', '技术员', 'cn.edu.cup.lims.TeacherTitle');
INSERT INTO `object_type` VALUES ('10', '0', '博士', 'cn.edu.cup.lims.StudentType');
INSERT INTO `object_type` VALUES ('11', '0', '学术硕士', 'cn.edu.cup.lims.StudentType');
INSERT INTO `object_type` VALUES ('12', '0', '专业硕士', 'cn.edu.cup.lims.StudentType');
INSERT INTO `object_type` VALUES ('13', '0', '工程硕士', 'cn.edu.cup.lims.StudentType');
INSERT INTO `object_type` VALUES ('14', '0', '本科', 'cn.edu.cup.lims.StudentType');
INSERT INTO `object_type` VALUES ('15', '0', '重大专项', 'cn.edu.cup.lims.ProjectType');
INSERT INTO `object_type` VALUES ('16', '0', '自然基金', 'cn.edu.cup.lims.ProjectType');
INSERT INTO `object_type` VALUES ('17', '0', '横向课题', 'cn.edu.cup.lims.ProjectType');
INSERT INTO `object_type` VALUES ('18', '0', '省级基金', 'cn.edu.cup.lims.ProjectType');
INSERT INTO `object_type` VALUES ('19', '0', '博士论文', 'cn.edu.cup.lims.ProjectType');
INSERT INTO `object_type` VALUES ('20', '0', '硕士论文', 'cn.edu.cup.lims.ProjectType');

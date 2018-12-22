/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-22 09:13:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `matter_type`
-- ----------------------------
DROP TABLE IF EXISTS `matter_type`;
CREATE TABLE `matter_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `up_type_id` bigint(20) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9xa6s2kg1inab6l0vkrai8sq5` (`name`),
  KEY `FK8cl3gydm9syjk1qa55nqnka2y` (`up_type_id`),
  CONSTRAINT `FK8cl3gydm9syjk1qa55nqnka2y` FOREIGN KEY (`up_type_id`) REFERENCES `matter_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matter_type
-- ----------------------------
INSERT INTO `matter_type` VALUES ('1', '0', '教师', null, 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('2', '0', '学生', null, 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('3', '0', '教授', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('4', '0', '副教授', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('5', '0', '讲师', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('6', '0', '助教', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('7', '0', '教授级高工', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('8', '0', '高工', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('9', '0', '工程师', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('10', '0', '助理工程师', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('11', '0', '技术员', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('12', '0', '研究员', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('13', '0', '副研究员', '1', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('14', '0', '博士', '2', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('15', '0', '硕士', '2', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('16', '1', '本科', '2', 'cn.edu.cup.lims.PersonTitle');
INSERT INTO `matter_type` VALUES ('17', '0', '科研任务', null, 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('18', '0', '教学任务', null, 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('19', '0', '重大专项', '17', 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('20', '0', '自然基金', '17', 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('21', '0', '横向课题', '17', 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('22', '0', '课程设计', '18', 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('23', '0', '横向项目', '17', 'cn.edu.cup.lims.ThingType');
INSERT INTO `matter_type` VALUES ('24', '0', '国家科技重大专项', '17', 'cn.edu.cup.lims.ThingType');

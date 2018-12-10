/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-10 11:15:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `project_type_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `companya` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3k75vvu7mevyvvb5may5lj8k7` (`name`),
  KEY `FKfijof1f591fo9kxddx5p1y4d2` (`project_type_id`),
  CONSTRAINT `FKfijof1f591fo9kxddx5p1y4d2` FOREIGN KEY (`project_type_id`) REFERENCES `object_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '0', '19', '单管水力模拟', '华北煤层气');
INSERT INTO `project` VALUES ('2', '0', '19', '管网水力学模拟', '华北煤层气');
INSERT INTO `project` VALUES ('3', '0', '16', '多气合采', '中联煤');

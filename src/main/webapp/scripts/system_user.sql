/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-12-10 21:13:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_attribute_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `append_attribute` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_204b9ercidw1baj3s3m9lnr33` (`user_name`),
  KEY `FKaiybevf5q198uok4va3p7b6wb` (`role_attribute_id`),
  CONSTRAINT `FKaiybevf5q198uok4va3p7b6wb` FOREIGN KEY (`role_attribute_id`) REFERENCES `system_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '0', '641d77dd5271fca28764612a028d9c8e', '1', '李晓平', '');
INSERT INTO `system_user` VALUES ('2', '0', 'ee26fc66b1369c7625333bedafbfcaf6', '1', '宫敬', '');
INSERT INTO `system_user` VALUES ('3', '0', 'f4aa0dd960521e045ae2f20621fb4ee9', '1', '吴海浩', '');
INSERT INTO `system_user` VALUES ('4', '0', '25d55ad283aa400af464c76d713c07ad', '1', '1552', 'Teacher=1');
INSERT INTO `system_user` VALUES ('5', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2151', 'Teacher=2');
INSERT INTO `system_user` VALUES ('6', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2152', 'Teacher=3');
INSERT INTO `system_user` VALUES ('7', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314014', 'Student=4');
INSERT INTO `system_user` VALUES ('8', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314013', 'Student=5');
INSERT INTO `system_user` VALUES ('9', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314019', 'Student=6');
INSERT INTO `system_user` VALUES ('10', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314016', 'Student=7');
INSERT INTO `system_user` VALUES ('11', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314022', 'Student=8');
INSERT INTO `system_user` VALUES ('12', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314023', 'Student=9');
INSERT INTO `system_user` VALUES ('13', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314017', 'Student=10');
INSERT INTO `system_user` VALUES ('14', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214549', 'Student=26');
INSERT INTO `system_user` VALUES ('15', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214571', 'Student=27');
INSERT INTO `system_user` VALUES ('16', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214557', 'Student=28');

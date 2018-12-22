/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-22 09:27:41
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '0', '641d77dd5271fca28764612a028d9c8e', '1', '李晓平', '');
INSERT INTO `system_user` VALUES ('2', '0', 'ee26fc66b1369c7625333bedafbfcaf6', '1', '宫敬', '');
INSERT INTO `system_user` VALUES ('3', '0', 'f4aa0dd960521e045ae2f20621fb4ee9', '1', '吴海浩', '');
INSERT INTO `system_user` VALUES ('4', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314014', 'Student=4');
INSERT INTO `system_user` VALUES ('5', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2014314013', 'Student=5');
INSERT INTO `system_user` VALUES ('6', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314019', 'Student=6');
INSERT INTO `system_user` VALUES ('7', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314016', 'Student=7');
INSERT INTO `system_user` VALUES ('8', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314022', 'Student=8');
INSERT INTO `system_user` VALUES ('9', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314023', 'Student=9');
INSERT INTO `system_user` VALUES ('10', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015314017', 'Student=10');
INSERT INTO `system_user` VALUES ('11', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214549', 'Student=26');
INSERT INTO `system_user` VALUES ('12', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214571', 'Student=27');
INSERT INTO `system_user` VALUES ('13', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2015214557', 'Student=28');
INSERT INTO `system_user` VALUES ('14', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018314016', 'Student=22');
INSERT INTO `system_user` VALUES ('15', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018314015', 'Student=23');
INSERT INTO `system_user` VALUES ('16', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018314026', 'Student=24');
INSERT INTO `system_user` VALUES ('17', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018314025', 'Student=25');
INSERT INTO `system_user` VALUES ('18', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214052', 'Student=78');
INSERT INTO `system_user` VALUES ('19', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214053', 'Student=79');
INSERT INTO `system_user` VALUES ('20', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214054', 'Student=80');
INSERT INTO `system_user` VALUES ('21', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214055', 'Student=81');
INSERT INTO `system_user` VALUES ('22', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214056', 'Student=82');
INSERT INTO `system_user` VALUES ('23', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214051', 'Student=83');
INSERT INTO `system_user` VALUES ('24', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214075', 'Student=84');
INSERT INTO `system_user` VALUES ('25', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214078', 'Student=85');
INSERT INTO `system_user` VALUES ('26', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214079', 'Student=86');
INSERT INTO `system_user` VALUES ('27', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214544', 'Student=87');
INSERT INTO `system_user` VALUES ('28', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214545', 'Student=88');
INSERT INTO `system_user` VALUES ('29', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214546', 'Student=89');
INSERT INTO `system_user` VALUES ('30', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214553', 'Student=90');
INSERT INTO `system_user` VALUES ('31', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214554', 'Student=91');
INSERT INTO `system_user` VALUES ('32', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214555', 'Student=92');
INSERT INTO `system_user` VALUES ('33', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214084', 'Student=93');
INSERT INTO `system_user` VALUES ('34', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214068', 'Student=94');
INSERT INTO `system_user` VALUES ('35', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214080', 'Student=95');
INSERT INTO `system_user` VALUES ('36', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2018214081', 'Student=96');
INSERT INTO `system_user` VALUES ('37', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314026', 'Student=16');
INSERT INTO `system_user` VALUES ('38', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314015', 'Student=17');
INSERT INTO `system_user` VALUES ('39', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314023', 'Student=18');
INSERT INTO `system_user` VALUES ('40', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314013', 'Student=19');
INSERT INTO `system_user` VALUES ('41', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314014', 'Student=20');
INSERT INTO `system_user` VALUES ('42', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017314024', 'Student=21');
INSERT INTO `system_user` VALUES ('43', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214552', 'Student=55');
INSERT INTO `system_user` VALUES ('44', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214564', 'Student=56');
INSERT INTO `system_user` VALUES ('45', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214553', 'Student=57');
INSERT INTO `system_user` VALUES ('46', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214565', 'Student=58');
INSERT INTO `system_user` VALUES ('47', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214554', 'Student=59');
INSERT INTO `system_user` VALUES ('48', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214558', 'Student=60');
INSERT INTO `system_user` VALUES ('49', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214584', 'Student=61');
INSERT INTO `system_user` VALUES ('50', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214050', 'Student=62');
INSERT INTO `system_user` VALUES ('51', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214052', 'Student=63');
INSERT INTO `system_user` VALUES ('52', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214555', 'Student=64');
INSERT INTO `system_user` VALUES ('53', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214053', 'Student=65');
INSERT INTO `system_user` VALUES ('54', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214054', 'Student=66');
INSERT INTO `system_user` VALUES ('55', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214081', 'Student=67');
INSERT INTO `system_user` VALUES ('56', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214078', 'Student=68');
INSERT INTO `system_user` VALUES ('57', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214070', 'Student=69');
INSERT INTO `system_user` VALUES ('58', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214082', 'Student=70');
INSERT INTO `system_user` VALUES ('59', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214570', 'Student=71');
INSERT INTO `system_user` VALUES ('60', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214566', 'Student=72');
INSERT INTO `system_user` VALUES ('61', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214556', 'Student=73');
INSERT INTO `system_user` VALUES ('62', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214055', 'Student=74');
INSERT INTO `system_user` VALUES ('63', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214557', 'Student=75');
INSERT INTO `system_user` VALUES ('64', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214056', 'Student=76');
INSERT INTO `system_user` VALUES ('65', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2017214069', 'Student=77');
INSERT INTO `system_user` VALUES ('66', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2151', 'Teacher=2');
INSERT INTO `system_user` VALUES ('67', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2152', 'Teacher=3');
INSERT INTO `system_user` VALUES ('68', '0', '25d55ad283aa400af464c76d713c07ad', '1', '1552', 'Teacher=1');

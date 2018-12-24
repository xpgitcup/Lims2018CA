/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-24 11:13:36
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
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

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
INSERT INTO `system_user` VALUES ('184', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2333', 'Teacher=2333');
INSERT INTO `system_user` VALUES ('185', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2013880073', 'Teacher=2013880073');
INSERT INTO `system_user` VALUES ('186', '0', '25d55ad283aa400af464c76d713c07ad', '1', '2012880012', 'Teacher=2012880012');
INSERT INTO `system_user` VALUES ('224', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015030065', 'Student=2015030065');
INSERT INTO `system_user` VALUES ('225', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015030066', 'Student=2015030066');
INSERT INTO `system_user` VALUES ('226', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015030067', 'Student=2015030067');
INSERT INTO `system_user` VALUES ('227', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015030068', 'Student=2015030068');
INSERT INTO `system_user` VALUES ('228', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015030069', 'Student=2015030069');
INSERT INTO `system_user` VALUES ('229', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2013010971', 'Student=2013010971');
INSERT INTO `system_user` VALUES ('230', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2014010805', 'Student=2014010805');
INSERT INTO `system_user` VALUES ('231', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010921', 'Student=2015010921');
INSERT INTO `system_user` VALUES ('232', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010922', 'Student=2015010922');
INSERT INTO `system_user` VALUES ('233', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010923', 'Student=2015010923');
INSERT INTO `system_user` VALUES ('234', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010924', 'Student=2015010924');
INSERT INTO `system_user` VALUES ('235', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010925', 'Student=2015010925');
INSERT INTO `system_user` VALUES ('236', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010926', 'Student=2015010926');
INSERT INTO `system_user` VALUES ('237', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010927', 'Student=2015010927');
INSERT INTO `system_user` VALUES ('238', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010928', 'Student=2015010928');
INSERT INTO `system_user` VALUES ('239', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010929', 'Student=2015010929');
INSERT INTO `system_user` VALUES ('240', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010930', 'Student=2015010930');
INSERT INTO `system_user` VALUES ('241', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010931', 'Student=2015010931');
INSERT INTO `system_user` VALUES ('242', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010932', 'Student=2015010932');
INSERT INTO `system_user` VALUES ('243', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010933', 'Student=2015010933');
INSERT INTO `system_user` VALUES ('244', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010934', 'Student=2015010934');
INSERT INTO `system_user` VALUES ('245', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010935', 'Student=2015010935');
INSERT INTO `system_user` VALUES ('246', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010936', 'Student=2015010936');
INSERT INTO `system_user` VALUES ('247', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010937', 'Student=2015010937');
INSERT INTO `system_user` VALUES ('248', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010938', 'Student=2015010938');
INSERT INTO `system_user` VALUES ('249', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010939', 'Student=2015010939');
INSERT INTO `system_user` VALUES ('250', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010940', 'Student=2015010940');
INSERT INTO `system_user` VALUES ('251', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010941', 'Student=2015010941');
INSERT INTO `system_user` VALUES ('252', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010942', 'Student=2015010942');
INSERT INTO `system_user` VALUES ('253', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010943', 'Student=2015010943');
INSERT INTO `system_user` VALUES ('254', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010944', 'Student=2015010944');
INSERT INTO `system_user` VALUES ('255', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010945', 'Student=2015010945');
INSERT INTO `system_user` VALUES ('256', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010946', 'Student=2015010946');
INSERT INTO `system_user` VALUES ('257', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010947', 'Student=2015010947');
INSERT INTO `system_user` VALUES ('258', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010948', 'Student=2015010948');
INSERT INTO `system_user` VALUES ('259', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010949', 'Student=2015010949');
INSERT INTO `system_user` VALUES ('260', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010950', 'Student=2015010950');
INSERT INTO `system_user` VALUES ('261', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010951', 'Student=2015010951');
INSERT INTO `system_user` VALUES ('262', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010952', 'Student=2015010952');
INSERT INTO `system_user` VALUES ('263', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010953', 'Student=2015010953');
INSERT INTO `system_user` VALUES ('264', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015011710', 'Student=2015011710');
INSERT INTO `system_user` VALUES ('265', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2013010935', 'Student=2013010935');
INSERT INTO `system_user` VALUES ('266', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2013011552', 'Student=2013011552');
INSERT INTO `system_user` VALUES ('267', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010125', 'Student=2015010125');
INSERT INTO `system_user` VALUES ('268', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010450', 'Student=2015010450');
INSERT INTO `system_user` VALUES ('269', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010888', 'Student=2015010888');
INSERT INTO `system_user` VALUES ('270', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010889', 'Student=2015010889');
INSERT INTO `system_user` VALUES ('271', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010890', 'Student=2015010890');
INSERT INTO `system_user` VALUES ('272', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010891', 'Student=2015010891');
INSERT INTO `system_user` VALUES ('273', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010892', 'Student=2015010892');
INSERT INTO `system_user` VALUES ('274', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010893', 'Student=2015010893');
INSERT INTO `system_user` VALUES ('275', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010894', 'Student=2015010894');
INSERT INTO `system_user` VALUES ('276', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010895', 'Student=2015010895');
INSERT INTO `system_user` VALUES ('277', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010897', 'Student=2015010897');
INSERT INTO `system_user` VALUES ('278', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010898', 'Student=2015010898');
INSERT INTO `system_user` VALUES ('279', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010900', 'Student=2015010900');
INSERT INTO `system_user` VALUES ('280', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010901', 'Student=2015010901');
INSERT INTO `system_user` VALUES ('281', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010902', 'Student=2015010902');
INSERT INTO `system_user` VALUES ('282', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010903', 'Student=2015010903');
INSERT INTO `system_user` VALUES ('283', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010904', 'Student=2015010904');
INSERT INTO `system_user` VALUES ('284', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010905', 'Student=2015010905');
INSERT INTO `system_user` VALUES ('285', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010906', 'Student=2015010906');
INSERT INTO `system_user` VALUES ('286', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010907', 'Student=2015010907');
INSERT INTO `system_user` VALUES ('287', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010908', 'Student=2015010908');
INSERT INTO `system_user` VALUES ('288', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010909', 'Student=2015010909');
INSERT INTO `system_user` VALUES ('289', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010910', 'Student=2015010910');
INSERT INTO `system_user` VALUES ('290', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010911', 'Student=2015010911');
INSERT INTO `system_user` VALUES ('291', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010912', 'Student=2015010912');
INSERT INTO `system_user` VALUES ('292', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010913', 'Student=2015010913');
INSERT INTO `system_user` VALUES ('293', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010914', 'Student=2015010914');
INSERT INTO `system_user` VALUES ('294', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010915', 'Student=2015010915');
INSERT INTO `system_user` VALUES ('295', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010917', 'Student=2015010917');
INSERT INTO `system_user` VALUES ('296', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010918', 'Student=2015010918');
INSERT INTO `system_user` VALUES ('297', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010919', 'Student=2015010919');
INSERT INTO `system_user` VALUES ('298', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010920', 'Student=2015010920');
INSERT INTO `system_user` VALUES ('299', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010954', 'Student=2015010954');
INSERT INTO `system_user` VALUES ('300', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010956', 'Student=2015010956');
INSERT INTO `system_user` VALUES ('301', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015011166', 'Student=2015011166');
INSERT INTO `system_user` VALUES ('302', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2014011043', 'Student=2014011043');
INSERT INTO `system_user` VALUES ('303', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010667', 'Student=2015010667');
INSERT INTO `system_user` VALUES ('304', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010743', 'Student=2015010743');
INSERT INTO `system_user` VALUES ('305', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010854', 'Student=2015010854');
INSERT INTO `system_user` VALUES ('306', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010855', 'Student=2015010855');
INSERT INTO `system_user` VALUES ('307', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010856', 'Student=2015010856');
INSERT INTO `system_user` VALUES ('308', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010857', 'Student=2015010857');
INSERT INTO `system_user` VALUES ('309', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010858', 'Student=2015010858');
INSERT INTO `system_user` VALUES ('310', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010859', 'Student=2015010859');
INSERT INTO `system_user` VALUES ('311', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010860', 'Student=2015010860');
INSERT INTO `system_user` VALUES ('312', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010861', 'Student=2015010861');
INSERT INTO `system_user` VALUES ('313', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010862', 'Student=2015010862');
INSERT INTO `system_user` VALUES ('314', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010863', 'Student=2015010863');
INSERT INTO `system_user` VALUES ('315', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010864', 'Student=2015010864');
INSERT INTO `system_user` VALUES ('316', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010865', 'Student=2015010865');
INSERT INTO `system_user` VALUES ('317', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010866', 'Student=2015010866');
INSERT INTO `system_user` VALUES ('318', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010867', 'Student=2015010867');
INSERT INTO `system_user` VALUES ('319', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010868', 'Student=2015010868');
INSERT INTO `system_user` VALUES ('320', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010869', 'Student=2015010869');
INSERT INTO `system_user` VALUES ('321', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010870', 'Student=2015010870');
INSERT INTO `system_user` VALUES ('322', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010871', 'Student=2015010871');
INSERT INTO `system_user` VALUES ('323', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010872', 'Student=2015010872');
INSERT INTO `system_user` VALUES ('324', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010873', 'Student=2015010873');
INSERT INTO `system_user` VALUES ('325', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010875', 'Student=2015010875');
INSERT INTO `system_user` VALUES ('326', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010876', 'Student=2015010876');
INSERT INTO `system_user` VALUES ('327', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010877', 'Student=2015010877');
INSERT INTO `system_user` VALUES ('328', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010878', 'Student=2015010878');
INSERT INTO `system_user` VALUES ('329', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010879', 'Student=2015010879');
INSERT INTO `system_user` VALUES ('330', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010880', 'Student=2015010880');
INSERT INTO `system_user` VALUES ('331', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010881', 'Student=2015010881');
INSERT INTO `system_user` VALUES ('332', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010882', 'Student=2015010882');
INSERT INTO `system_user` VALUES ('333', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010883', 'Student=2015010883');
INSERT INTO `system_user` VALUES ('334', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010884', 'Student=2015010884');
INSERT INTO `system_user` VALUES ('335', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010885', 'Student=2015010885');
INSERT INTO `system_user` VALUES ('336', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010886', 'Student=2015010886');
INSERT INTO `system_user` VALUES ('337', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015010887', 'Student=2015010887');
INSERT INTO `system_user` VALUES ('338', '0', '25d55ad283aa400af464c76d713c07ad', '10', '2015011149', 'Student=2015011149');

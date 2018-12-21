/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-21 08:44:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `matter`
-- ----------------------------
DROP TABLE IF EXISTS `matter`;
CREATE TABLE `matter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `thing_type_id` bigint(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `stop_date` datetime DEFAULT NULL,
  `companya` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `student_type_id` bigint(20) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  `teacher_title_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6jhh5dgcnlv79tld840hw80y` (`code`),
  KEY `FKcl85blmloap2qupq8eyoalrd` (`thing_type_id`),
  KEY `FKt8mfljq0od53nxs6ga509djxo` (`student_type_id`),
  KEY `FKbq1snas6c0btffe55o53d2ndd` (`major_id`),
  KEY `FK79k6wqprpvmj0l3gm8hiq64x9` (`supervisor_id`),
  KEY `FKbkekqadkbyceritbgqn7q4qqx` (`teacher_title_id`),
  CONSTRAINT `FK79k6wqprpvmj0l3gm8hiq64x9` FOREIGN KEY (`supervisor_id`) REFERENCES `matter` (`id`),
  CONSTRAINT `FKbkekqadkbyceritbgqn7q4qqx` FOREIGN KEY (`teacher_title_id`) REFERENCES `matter_type` (`id`),
  CONSTRAINT `FKbq1snas6c0btffe55o53d2ndd` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `FKcl85blmloap2qupq8eyoalrd` FOREIGN KEY (`thing_type_id`) REFERENCES `matter_type` (`id`),
  CONSTRAINT `FKt8mfljq0od53nxs6ga509djxo` FOREIGN KEY (`student_type_id`) REFERENCES `matter_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matter
-- ----------------------------
INSERT INTO `matter` VALUES ('1', '0', '宫敬', 'cn.edu.cup.lims.Teacher', null, null, null, null, '1552', null, null, null, null, '3');
INSERT INTO `matter` VALUES ('2', '0', '李晓平', 'cn.edu.cup.lims.Teacher', null, null, null, null, '2151', null, null, null, null, '4');
INSERT INTO `matter` VALUES ('3', '0', '邓道明', 'cn.edu.cup.lims.Teacher', null, null, null, null, '2152', null, null, null, null, '4');
INSERT INTO `matter` VALUES ('4', '0', '石国赟', 'cn.edu.cup.lims.Student', null, null, null, null, '2014314014', '2014', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('5', '0', '丁麟', 'cn.edu.cup.lims.Student', null, null, null, null, '2014314013', '2014', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('6', '0', '虞维超', 'cn.edu.cup.lims.Student', null, null, null, null, '2015314019', '2015', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('7', '0', '马千里', 'cn.edu.cup.lims.Student', null, null, null, null, '2015314016', '2015', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('8', '0', '靳航', 'cn.edu.cup.lims.Student', null, null, null, null, '2015314022', '2015', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('9', '0', '柳扬', 'cn.edu.cup.lims.Student', null, null, null, null, '2015314023', '2015', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('10', '0', '宋尚飞', 'cn.edu.cup.lims.Student', null, null, null, null, '2015314017', '2015', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('11', '0', '康琦', 'cn.edu.cup.lims.Student', null, null, null, null, '2016314026', '2016', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('12', '0', '洪炳沅', 'cn.edu.cup.lims.Student', null, null, null, null, '2016314018', '2016', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('13', '0', '黄辉荣', 'cn.edu.cup.lims.Student', null, null, null, null, '2016314025', '2016', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('14', '0', '王丹', 'cn.edu.cup.lims.Student', null, null, null, null, '2016314019', '2016', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('15', '0', '李昂', 'cn.edu.cup.lims.Student', null, null, null, null, '2016314017', '2016', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('16', '0', '樊迪', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314026', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('17', '0', '齐雪宇', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314015', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('18', '0', '于志鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314023', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('19', '0', '陈玉川', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314013', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('20', '0', '李熠辰', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314014', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('21', '0', '张盛楠', 'cn.edu.cup.lims.Student', null, null, null, null, '2017314024', '2017', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('22', '0', '段旭', 'cn.edu.cup.lims.Student', null, null, null, null, '2018314016', '2018', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('23', '0', '陈思杭', 'cn.edu.cup.lims.Student', null, null, null, null, '2018314015', '2018', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('24', '0', '彭泽恒', 'cn.edu.cup.lims.Student', null, null, null, null, '2018314026', '2018', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('25', '0', '李楷', 'cn.edu.cup.lims.Student', null, null, null, null, '2018314025', '2018', '14', '1', '1', null);
INSERT INTO `matter` VALUES ('26', '0', '金浩', 'cn.edu.cup.lims.Student', null, null, null, null, '2015214549', '2015', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('27', '0', '马晓旭', 'cn.edu.cup.lims.Student', null, null, null, null, '2015214571', '2015', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('28', '0', '朱梦琪', 'cn.edu.cup.lims.Student', null, null, null, null, '2015214557', '2015', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('29', '0', '陈新果', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214568', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('30', '0', '陈怡鸣', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214090', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('31', '0', '陈影', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214554', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('32', '0', '崔可心', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214555', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('33', '0', '丁凯', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214536', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('34', '0', '甘东英', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214091', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('35', '0', '高航', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214537', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('36', '0', '韩庆龙', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214541', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('37', '0', '黄璞', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214538', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('38', '0', '李梦瑶', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214539', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('39', '0', '李莎', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214086', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('40', '0', '李愚', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214556', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('41', '0', '王传硕', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214544', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('42', '0', '任亮', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214543', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('43', '0', '沈伟伟', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214060', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('44', '0', '沈允', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214092', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('45', '0', '苏越', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214076', '2016', '15', '1', '2', null);
INSERT INTO `matter` VALUES ('46', '0', '万洋洋', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214557', '2016', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('47', '0', '王茀玺', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214558', '2016', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('48', '0', '王君傲', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214057', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('49', '0', '吴停', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214093', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('50', '0', '夏子杰', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214096', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('51', '0', '许洁', 'cn.edu.cup.lims.Student', null, null, null, null, '2015214064', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('52', '0', '张若晨', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214063', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('53', '0', '赵云鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214065', '2016', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('54', '0', '周艳红', 'cn.edu.cup.lims.Student', null, null, null, null, '2016214560', '2016', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('55', '0', '邓坤', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214552', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('56', '0', '高晶晶', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214564', '2017', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('57', '0', '高振宇', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214553', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('58', '0', '何卓', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214565', '2017', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('59', '0', '胡杰', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214554', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('60', '0', '兰文萍', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214558', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('61', '0', '李根', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214584', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('62', '0', '李金潮', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214050', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('63', '0', '李立', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214052', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('64', '0', '林聿明', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214555', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('65', '0', '吕鹏飞', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214053', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('66', '0', '孙小喆', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214054', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('67', '0', '王振威', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214081', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('68', '0', '肖亚琪', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214078', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('69', '0', '谢平', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214070', '2017', '15', '1', '2', null);
INSERT INTO `matter` VALUES ('70', '0', '薛一菡', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214082', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('71', '0', '杨克', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214570', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('72', '0', '禹亚峰', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214566', '2017', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('73', '0', '张昊', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214556', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('74', '0', '张杰', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214055', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('75', '0', '张蒙丽', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214557', '2017', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('76', '0', '张佩颖', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214056', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('77', '0', '狄国佳', 'cn.edu.cup.lims.Student', null, null, null, null, '2017214069', '2017', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('78', '0', '丁陈陈', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214052', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('79', '0', '纪晨秋', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214053', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('80', '0', '廖清云', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214054', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('81', '0', '刘鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214055', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('82', '0', '刘轩章', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214056', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('83', '0', '李国豪', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214051', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('84', '0', '林德才', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214075', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('85', '0', '葛运通', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214078', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('86', '0', '杨晓鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214079', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('87', '0', '冯兴', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214544', '2018', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('88', '0', '王昕楚', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214545', '2018', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('89', '0', '王靖怡', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214546', '2018', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('90', '0', '崔雪萌', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214553', '2018', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('91', '0', '都兆楠', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214554', '2018', '15', '2', '1', null);
INSERT INTO `matter` VALUES ('92', '0', '谭遥', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214555', '2018', '15', '2', '2', null);
INSERT INTO `matter` VALUES ('93', '0', '周建伟', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214084', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('94', '0', '刘胜男', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214068', '2018', '15', '1', '2', null);
INSERT INTO `matter` VALUES ('95', '0', '喻伟婕', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214080', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('96', '0', '张璐瑶', 'cn.edu.cup.lims.Student', null, null, null, null, '2018214081', '2018', '15', '1', '1', null);
INSERT INTO `matter` VALUES ('97', '0', '单管水力模拟', 'cn.edu.cup.lims.Project', '23', null, null, '华北煤层气', null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('98', '0', '管网水力学模拟', 'cn.edu.cup.lims.Project', '23', null, null, '华北煤层气', null, null, null, null, null, null);

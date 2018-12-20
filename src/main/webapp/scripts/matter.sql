/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-20 18:22:25
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
  `code` varchar(255) DEFAULT NULL,
  `teacher_title_id` bigint(20) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `student_type_id` bigint(20) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  `thing_type_id` bigint(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `stop_date` datetime DEFAULT NULL,
  `companya` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6jhh5dgcnlv79tld840hw80y` (`code`),
  KEY `FKbkekqadkbyceritbgqn7q4qqx` (`teacher_title_id`),
  KEY `FKt8mfljq0od53nxs6ga509djxo` (`student_type_id`),
  KEY `FKbq1snas6c0btffe55o53d2ndd` (`major_id`),
  KEY `FK79k6wqprpvmj0l3gm8hiq64x9` (`supervisor_id`),
  KEY `FKcl85blmloap2qupq8eyoalrd` (`thing_type_id`),
  CONSTRAINT `FK79k6wqprpvmj0l3gm8hiq64x9` FOREIGN KEY (`supervisor_id`) REFERENCES `matter` (`id`),
  CONSTRAINT `FKbkekqadkbyceritbgqn7q4qqx` FOREIGN KEY (`teacher_title_id`) REFERENCES `matter_type` (`id`),
  CONSTRAINT `FKbq1snas6c0btffe55o53d2ndd` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `FKcl85blmloap2qupq8eyoalrd` FOREIGN KEY (`thing_type_id`) REFERENCES `matter_type` (`id`),
  CONSTRAINT `FKt8mfljq0od53nxs6ga509djxo` FOREIGN KEY (`student_type_id`) REFERENCES `matter_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matter
-- ----------------------------
INSERT INTO `matter` VALUES ('1', '0', '宫敬', 'cn.edu.cup.lims.Teacher', '1552', '3', null, null, null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('2', '0', '李晓平', 'cn.edu.cup.lims.Teacher', '2151', '4', null, null, null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('3', '0', '邓道明', 'cn.edu.cup.lims.Teacher', '2152', '4', null, null, null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('4', '0', '石国赟', 'cn.edu.cup.lims.Student', '2014314014', null, '2014', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('5', '0', '丁麟', 'cn.edu.cup.lims.Student', '2014314013', null, '2014', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('6', '0', '虞维超', 'cn.edu.cup.lims.Student', '2015314019', null, '2015', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('7', '0', '马千里', 'cn.edu.cup.lims.Student', '2015314016', null, '2015', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('8', '0', '靳航', 'cn.edu.cup.lims.Student', '2015314022', null, '2015', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('9', '0', '柳扬', 'cn.edu.cup.lims.Student', '2015314023', null, '2015', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('10', '0', '宋尚飞', 'cn.edu.cup.lims.Student', '2015314017', null, '2015', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('11', '0', '康琦', 'cn.edu.cup.lims.Student', '2016314026', null, '2016', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('12', '0', '洪炳沅', 'cn.edu.cup.lims.Student', '2016314018', null, '2016', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('13', '0', '黄辉荣', 'cn.edu.cup.lims.Student', '2016314025', null, '2016', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('14', '0', '王丹', 'cn.edu.cup.lims.Student', '2016314019', null, '2016', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('15', '0', '李昂', 'cn.edu.cup.lims.Student', '2016314017', null, '2016', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('16', '0', '樊迪', 'cn.edu.cup.lims.Student', '2017314026', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('17', '0', '齐雪宇', 'cn.edu.cup.lims.Student', '2017314015', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('18', '0', '于志鹏', 'cn.edu.cup.lims.Student', '2017314023', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('19', '0', '陈玉川', 'cn.edu.cup.lims.Student', '2017314013', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('20', '0', '李熠辰', 'cn.edu.cup.lims.Student', '2017314014', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('21', '0', '张盛楠', 'cn.edu.cup.lims.Student', '2017314024', null, '2017', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('22', '0', '段旭', 'cn.edu.cup.lims.Student', '2018314016', null, '2018', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('23', '0', '陈思杭', 'cn.edu.cup.lims.Student', '2018314015', null, '2018', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('24', '0', '彭泽恒', 'cn.edu.cup.lims.Student', '2018314026', null, '2018', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('25', '0', '李楷', 'cn.edu.cup.lims.Student', '2018314025', null, '2018', '11', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('26', '0', '金浩', 'cn.edu.cup.lims.Student', '2015214549', null, '2015', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('27', '0', '马晓旭', 'cn.edu.cup.lims.Student', '2015214571', null, '2015', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('28', '0', '朱梦琪', 'cn.edu.cup.lims.Student', '2015214557', null, '2015', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('29', '0', '陈新果', 'cn.edu.cup.lims.Student', '2016214568', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('30', '0', '陈怡鸣', 'cn.edu.cup.lims.Student', '2016214090', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('31', '0', '陈影', 'cn.edu.cup.lims.Student', '2016214554', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('32', '0', '崔可心', 'cn.edu.cup.lims.Student', '2016214555', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('33', '0', '丁凯', 'cn.edu.cup.lims.Student', '2016214536', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('34', '0', '甘东英', 'cn.edu.cup.lims.Student', '2016214091', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('35', '0', '高航', 'cn.edu.cup.lims.Student', '2016214537', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('36', '0', '韩庆龙', 'cn.edu.cup.lims.Student', '2016214541', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('37', '0', '黄璞', 'cn.edu.cup.lims.Student', '2016214538', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('38', '0', '李梦瑶', 'cn.edu.cup.lims.Student', '2016214539', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('39', '0', '李莎', 'cn.edu.cup.lims.Student', '2016214086', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('40', '0', '李愚', 'cn.edu.cup.lims.Student', '2016214556', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('41', '0', '王传硕', 'cn.edu.cup.lims.Student', '2016214544', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('42', '0', '任亮', 'cn.edu.cup.lims.Student', '2016214543', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('43', '0', '沈伟伟', 'cn.edu.cup.lims.Student', '2016214060', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('44', '0', '沈允', 'cn.edu.cup.lims.Student', '2016214092', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('45', '0', '苏越', 'cn.edu.cup.lims.Student', '2016214076', null, '2016', '26', '1', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('46', '0', '万洋洋', 'cn.edu.cup.lims.Student', '2016214557', null, '2016', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('47', '0', '王茀玺', 'cn.edu.cup.lims.Student', '2016214558', null, '2016', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('48', '0', '王君傲', 'cn.edu.cup.lims.Student', '2016214057', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('49', '0', '吴停', 'cn.edu.cup.lims.Student', '2016214093', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('50', '0', '夏子杰', 'cn.edu.cup.lims.Student', '2016214096', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('51', '0', '许洁', 'cn.edu.cup.lims.Student', '2015214064', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('52', '0', '张若晨', 'cn.edu.cup.lims.Student', '2016214063', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('53', '0', '赵云鹏', 'cn.edu.cup.lims.Student', '2016214065', null, '2016', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('54', '0', '周艳红', 'cn.edu.cup.lims.Student', '2016214560', null, '2016', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('55', '0', '邓坤', 'cn.edu.cup.lims.Student', '2017214552', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('56', '0', '高晶晶', 'cn.edu.cup.lims.Student', '2017214564', null, '2017', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('57', '0', '高振宇', 'cn.edu.cup.lims.Student', '2017214553', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('58', '0', '何卓', 'cn.edu.cup.lims.Student', '2017214565', null, '2017', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('59', '0', '胡杰', 'cn.edu.cup.lims.Student', '2017214554', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('60', '0', '兰文萍', 'cn.edu.cup.lims.Student', '2017214558', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('61', '0', '李根', 'cn.edu.cup.lims.Student', '2017214584', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('62', '0', '李金潮', 'cn.edu.cup.lims.Student', '2017214050', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('63', '0', '李立', 'cn.edu.cup.lims.Student', '2017214052', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('64', '0', '林聿明', 'cn.edu.cup.lims.Student', '2017214555', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('65', '0', '吕鹏飞', 'cn.edu.cup.lims.Student', '2017214053', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('66', '0', '孙小喆', 'cn.edu.cup.lims.Student', '2017214054', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('67', '0', '王振威', 'cn.edu.cup.lims.Student', '2017214081', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('68', '0', '肖亚琪', 'cn.edu.cup.lims.Student', '2017214078', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('69', '0', '谢平', 'cn.edu.cup.lims.Student', '2017214070', null, '2017', '26', '1', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('70', '0', '薛一菡', 'cn.edu.cup.lims.Student', '2017214082', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('71', '0', '杨克', 'cn.edu.cup.lims.Student', '2017214570', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('72', '0', '禹亚峰', 'cn.edu.cup.lims.Student', '2017214566', null, '2017', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('73', '0', '张昊', 'cn.edu.cup.lims.Student', '2017214556', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('74', '0', '张杰', 'cn.edu.cup.lims.Student', '2017214055', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('75', '0', '张蒙丽', 'cn.edu.cup.lims.Student', '2017214557', null, '2017', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('76', '0', '张佩颖', 'cn.edu.cup.lims.Student', '2017214056', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('77', '0', '狄国佳', 'cn.edu.cup.lims.Student', '2017214069', null, '2017', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('78', '0', '丁陈陈', 'cn.edu.cup.lims.Student', '2018214052', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('79', '0', '纪晨秋', 'cn.edu.cup.lims.Student', '2018214053', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('80', '0', '廖清云', 'cn.edu.cup.lims.Student', '2018214054', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('81', '0', '刘鹏', 'cn.edu.cup.lims.Student', '2018214055', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('82', '0', '刘轩章', 'cn.edu.cup.lims.Student', '2018214056', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('83', '0', '李国豪', 'cn.edu.cup.lims.Student', '2018214051', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('84', '0', '林德才', 'cn.edu.cup.lims.Student', '2018214075', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('85', '0', '葛运通', 'cn.edu.cup.lims.Student', '2018214078', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('86', '0', '杨晓鹏', 'cn.edu.cup.lims.Student', '2018214079', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('87', '0', '冯兴', 'cn.edu.cup.lims.Student', '2018214544', null, '2018', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('88', '0', '王昕楚', 'cn.edu.cup.lims.Student', '2018214545', null, '2018', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('89', '0', '王靖怡', 'cn.edu.cup.lims.Student', '2018214546', null, '2018', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('90', '0', '崔雪萌', 'cn.edu.cup.lims.Student', '2018214553', null, '2018', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('91', '0', '都兆楠', 'cn.edu.cup.lims.Student', '2018214554', null, '2018', '26', '2', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('92', '0', '谭遥', 'cn.edu.cup.lims.Student', '2018214555', null, '2018', '26', '2', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('93', '0', '周建伟', 'cn.edu.cup.lims.Student', '2018214084', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('94', '0', '刘胜男', 'cn.edu.cup.lims.Student', '2018214068', null, '2018', '26', '1', '2', null, null, null, null);
INSERT INTO `matter` VALUES ('95', '0', '喻伟婕', 'cn.edu.cup.lims.Student', '2018214080', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('96', '0', '张璐瑶', 'cn.edu.cup.lims.Student', '2018214081', null, '2018', '26', '1', '1', null, null, null, null);
INSERT INTO `matter` VALUES ('97', '0', '单管水力模拟', 'cn.edu.cup.lims.Project', null, null, null, null, null, null, '22', null, null, '华北煤层气');
INSERT INTO `matter` VALUES ('98', '0', '管网水力学模拟', 'cn.edu.cup.lims.Project', null, null, null, null, null, null, '22', null, null, '华北煤层气');
INSERT INTO `matter` VALUES ('99', '0', '多气合采', 'cn.edu.cup.lims.Project', null, null, null, null, null, null, '19', null, null, '中联煤');

/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-24 10:26:49
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
  `start_date` datetime DEFAULT NULL,
  `thing_type_id` bigint(20) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `companya` varchar(255) DEFAULT NULL,
  `person_title_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6jhh5dgcnlv79tld840hw80y` (`code`),
  KEY `FKcl85blmloap2qupq8eyoalrd` (`thing_type_id`),
  KEY `FKkpkhtvtuxvftpkiubog3dqx43` (`person_title_id`),
  KEY `FKbq1snas6c0btffe55o53d2ndd` (`major_id`),
  KEY `FK79k6wqprpvmj0l3gm8hiq64x9` (`supervisor_id`),
  CONSTRAINT `FK79k6wqprpvmj0l3gm8hiq64x9` FOREIGN KEY (`supervisor_id`) REFERENCES `matter` (`id`),
  CONSTRAINT `FKbq1snas6c0btffe55o53d2ndd` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `FKcl85blmloap2qupq8eyoalrd` FOREIGN KEY (`thing_type_id`) REFERENCES `matter_type` (`id`),
  CONSTRAINT `FKkpkhtvtuxvftpkiubog3dqx43` FOREIGN KEY (`person_title_id`) REFERENCES `matter_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matter
-- ----------------------------
INSERT INTO `matter` VALUES ('7', '0', '单管水力模拟', 'cn.edu.cup.lims.Project', '2018-10-01 00:00:00', '23', '1', '华北煤层气', null, null, null, null, null);
INSERT INTO `matter` VALUES ('8', '0', '管网水力学模拟', 'cn.edu.cup.lims.Project', '2018-10-01 00:00:00', '23', '1', '华北煤层气', null, null, null, null, null);
INSERT INTO `matter` VALUES ('9', '0', '多气合采', 'cn.edu.cup.lims.Project', '2016-01-01 00:00:00', '24', '5', '中联煤', null, null, null, null, null);
INSERT INTO `matter` VALUES ('10', '0', '宫敬', 'cn.edu.cup.lims.Teacher', null, null, null, null, '3', '1552', null, null, null);
INSERT INTO `matter` VALUES ('11', '0', '李晓平', 'cn.edu.cup.lims.Teacher', null, null, null, null, '4', '2151', null, null, null);
INSERT INTO `matter` VALUES ('12', '0', '邓道明', 'cn.edu.cup.lims.Teacher', null, null, null, null, '4', '2152', null, null, null);
INSERT INTO `matter` VALUES ('13', '0', '石国赟', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2014314014', '2014', '1', '10');
INSERT INTO `matter` VALUES ('14', '0', '丁麟', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2014314013', '2014', '1', '10');
INSERT INTO `matter` VALUES ('15', '0', '虞维超', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2015314019', '2015', '1', '10');
INSERT INTO `matter` VALUES ('16', '0', '马千里', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2015314016', '2015', '1', '10');
INSERT INTO `matter` VALUES ('17', '0', '靳航', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2015314022', '2015', '1', '10');
INSERT INTO `matter` VALUES ('18', '0', '柳扬', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2015314023', '2015', '1', '10');
INSERT INTO `matter` VALUES ('19', '0', '宋尚飞', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2015314017', '2015', '1', '10');
INSERT INTO `matter` VALUES ('20', '0', '康琦', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2016314026', '2016', '1', '10');
INSERT INTO `matter` VALUES ('21', '0', '洪炳沅', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2016314018', '2016', '1', '10');
INSERT INTO `matter` VALUES ('22', '0', '黄辉荣', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2016314025', '2016', '1', '10');
INSERT INTO `matter` VALUES ('23', '0', '王丹', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2016314019', '2016', '1', '10');
INSERT INTO `matter` VALUES ('24', '0', '李昂', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2016314017', '2016', '1', '10');
INSERT INTO `matter` VALUES ('25', '0', '樊迪', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314026', '2017', '1', '10');
INSERT INTO `matter` VALUES ('26', '0', '齐雪宇', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314015', '2017', '1', '10');
INSERT INTO `matter` VALUES ('27', '0', '于志鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314023', '2017', '1', '10');
INSERT INTO `matter` VALUES ('28', '0', '陈玉川', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314013', '2017', '1', '10');
INSERT INTO `matter` VALUES ('29', '0', '李熠辰', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314014', '2017', '1', '10');
INSERT INTO `matter` VALUES ('30', '0', '张盛楠', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2017314024', '2017', '1', '10');
INSERT INTO `matter` VALUES ('31', '0', '段旭', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2018314016', '2018', '1', '10');
INSERT INTO `matter` VALUES ('32', '0', '陈思杭', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2018314015', '2018', '1', '10');
INSERT INTO `matter` VALUES ('33', '0', '彭泽恒', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2018314026', '2018', '1', '10');
INSERT INTO `matter` VALUES ('34', '0', '李楷', 'cn.edu.cup.lims.Student', null, null, null, null, '14', '2018314025', '2018', '1', '10');
INSERT INTO `matter` VALUES ('35', '0', '金浩', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2015214549', '2015', '2', '10');
INSERT INTO `matter` VALUES ('36', '0', '马晓旭', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2015214571', '2015', '2', '10');
INSERT INTO `matter` VALUES ('37', '0', '朱梦琪', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2015214557', '2015', '2', '10');
INSERT INTO `matter` VALUES ('38', '0', '陈新果', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214568', '2016', '2', '10');
INSERT INTO `matter` VALUES ('39', '0', '陈怡鸣', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214090', '2016', '1', '10');
INSERT INTO `matter` VALUES ('40', '0', '陈影', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214554', '2016', '2', '10');
INSERT INTO `matter` VALUES ('41', '0', '崔可心', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214555', '2016', '2', '10');
INSERT INTO `matter` VALUES ('42', '0', '丁凯', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214536', '2016', '2', '10');
INSERT INTO `matter` VALUES ('43', '0', '甘东英', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214091', '2016', '1', '10');
INSERT INTO `matter` VALUES ('44', '0', '高航', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214537', '2016', '2', '10');
INSERT INTO `matter` VALUES ('45', '0', '韩庆龙', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214541', '2016', '2', '10');
INSERT INTO `matter` VALUES ('46', '0', '黄璞', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214538', '2016', '2', '10');
INSERT INTO `matter` VALUES ('47', '0', '李梦瑶', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214539', '2016', '2', '10');
INSERT INTO `matter` VALUES ('48', '0', '李莎', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214086', '2016', '1', '10');
INSERT INTO `matter` VALUES ('49', '0', '李愚', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214556', '2016', '2', '10');
INSERT INTO `matter` VALUES ('50', '0', '王传硕', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214544', '2016', '2', '10');
INSERT INTO `matter` VALUES ('51', '0', '任亮', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214543', '2016', '2', '10');
INSERT INTO `matter` VALUES ('52', '0', '沈伟伟', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214060', '2016', '1', '10');
INSERT INTO `matter` VALUES ('53', '0', '沈允', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214092', '2016', '1', '10');
INSERT INTO `matter` VALUES ('54', '0', '苏越', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214076', '2016', '1', '11');
INSERT INTO `matter` VALUES ('55', '0', '万洋洋', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214557', '2016', '2', '11');
INSERT INTO `matter` VALUES ('56', '0', '王茀玺', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214558', '2016', '2', '10');
INSERT INTO `matter` VALUES ('57', '0', '王君傲', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214057', '2016', '1', '10');
INSERT INTO `matter` VALUES ('58', '0', '吴停', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214093', '2016', '1', '10');
INSERT INTO `matter` VALUES ('59', '0', '夏子杰', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214096', '2016', '1', '10');
INSERT INTO `matter` VALUES ('60', '0', '许洁', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2015214064', '2016', '1', '10');
INSERT INTO `matter` VALUES ('61', '0', '张若晨', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214063', '2016', '1', '10');
INSERT INTO `matter` VALUES ('62', '0', '赵云鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214065', '2016', '1', '10');
INSERT INTO `matter` VALUES ('63', '0', '周艳红', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2016214560', '2016', '2', '11');
INSERT INTO `matter` VALUES ('64', '0', '邓坤', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214552', '2017', '2', '10');
INSERT INTO `matter` VALUES ('65', '0', '高晶晶', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214564', '2017', '2', '11');
INSERT INTO `matter` VALUES ('66', '0', '高振宇', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214553', '2017', '2', '10');
INSERT INTO `matter` VALUES ('67', '0', '何卓', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214565', '2017', '2', '11');
INSERT INTO `matter` VALUES ('68', '0', '胡杰', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214554', '2017', '2', '10');
INSERT INTO `matter` VALUES ('69', '0', '兰文萍', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214558', '2017', '2', '10');
INSERT INTO `matter` VALUES ('70', '0', '李根', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214584', '2017', '2', '10');
INSERT INTO `matter` VALUES ('71', '0', '李金潮', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214050', '2017', '1', '10');
INSERT INTO `matter` VALUES ('72', '0', '李立', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214052', '2017', '1', '10');
INSERT INTO `matter` VALUES ('73', '0', '林聿明', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214555', '2017', '2', '10');
INSERT INTO `matter` VALUES ('74', '0', '吕鹏飞', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214053', '2017', '1', '10');
INSERT INTO `matter` VALUES ('75', '0', '孙小喆', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214054', '2017', '1', '10');
INSERT INTO `matter` VALUES ('76', '0', '王振威', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214081', '2017', '1', '10');
INSERT INTO `matter` VALUES ('77', '0', '肖亚琪', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214078', '2017', '1', '10');
INSERT INTO `matter` VALUES ('78', '0', '谢平', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214070', '2017', '1', '11');
INSERT INTO `matter` VALUES ('79', '0', '薛一菡', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214082', '2017', '1', '10');
INSERT INTO `matter` VALUES ('80', '0', '杨克', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214570', '2017', '2', '10');
INSERT INTO `matter` VALUES ('81', '0', '禹亚峰', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214566', '2017', '2', '11');
INSERT INTO `matter` VALUES ('82', '0', '张昊', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214556', '2017', '2', '10');
INSERT INTO `matter` VALUES ('83', '0', '张杰', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214055', '2017', '1', '10');
INSERT INTO `matter` VALUES ('84', '0', '张蒙丽', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214557', '2017', '2', '10');
INSERT INTO `matter` VALUES ('85', '0', '张佩颖', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214056', '2017', '1', '10');
INSERT INTO `matter` VALUES ('86', '0', '狄国佳', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2017214069', '2017', '1', '10');
INSERT INTO `matter` VALUES ('87', '0', '丁陈陈', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214052', '2018', '1', '10');
INSERT INTO `matter` VALUES ('88', '0', '纪晨秋', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214053', '2018', '1', '10');
INSERT INTO `matter` VALUES ('89', '0', '廖清云', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214054', '2018', '1', '10');
INSERT INTO `matter` VALUES ('90', '0', '刘鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214055', '2018', '1', '10');
INSERT INTO `matter` VALUES ('91', '0', '刘轩章', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214056', '2018', '1', '10');
INSERT INTO `matter` VALUES ('92', '0', '李国豪', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214051', '2018', '1', '10');
INSERT INTO `matter` VALUES ('93', '0', '林德才', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214075', '2018', '1', '10');
INSERT INTO `matter` VALUES ('94', '0', '葛运通', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214078', '2018', '1', '10');
INSERT INTO `matter` VALUES ('95', '0', '杨晓鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214079', '2018', '1', '10');
INSERT INTO `matter` VALUES ('96', '0', '冯兴', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214544', '2018', '2', '10');
INSERT INTO `matter` VALUES ('97', '0', '王昕楚', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214545', '2018', '2', '10');
INSERT INTO `matter` VALUES ('98', '0', '王靖怡', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214546', '2018', '2', '10');
INSERT INTO `matter` VALUES ('99', '0', '崔雪萌', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214553', '2018', '2', '10');
INSERT INTO `matter` VALUES ('100', '0', '都兆楠', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214554', '2018', '2', '10');
INSERT INTO `matter` VALUES ('101', '0', '谭遥', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214555', '2018', '2', '11');
INSERT INTO `matter` VALUES ('102', '0', '周建伟', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214084', '2018', '1', '10');
INSERT INTO `matter` VALUES ('103', '0', '刘胜男', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214068', '2018', '1', '11');
INSERT INTO `matter` VALUES ('104', '0', '喻伟婕', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214080', '2018', '1', '10');
INSERT INTO `matter` VALUES ('105', '0', '张璐瑶', 'cn.edu.cup.lims.Student', null, null, null, null, '15', '2018214081', '2018', '1', '10');
INSERT INTO `matter` VALUES ('106', '0', '软件实训', 'cn.edu.cup.lims.Course', '2018-12-23 00:00:00', '24', '1', null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('107', '0', '软件概论', 'cn.edu.cup.lims.Course', '2018-12-23 00:00:00', '24', '1', null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('108', '0', '基金1', 'cn.edu.cup.lims.Project', null, '20', null, '国家', null, null, null, null, null);
INSERT INTO `matter` VALUES ('109', '0', '横向1', 'cn.edu.cup.lims.Project', null, '21', null, '公司', null, null, null, null, null);
INSERT INTO `matter` VALUES ('110', '0', '横向项目2', 'cn.edu.cup.lims.Project', null, '23', null, '公司2', null, null, null, null, null);
INSERT INTO `matter` VALUES ('111', '0', '冯志强', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2014011043', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('112', '0', '沈倩', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010667', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('113', '0', '王铁淞', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010743', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('114', '0', '德吉曲珍', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010854', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('115', '0', '胡瑾', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010855', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('116', '0', '贾羽茜', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010856', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('117', '0', '康雅倩', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010857', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('118', '0', '兰敏', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010858', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('119', '0', '李露露', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010859', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('120', '0', '李玥洁', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010860', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('121', '0', '柳佳丽', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010861', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('122', '0', '史安丁', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010862', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('123', '0', '张怡铭', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010863', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('124', '0', '艾斯卡尔·坎买尔', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010864', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('125', '0', '白宗翰', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010865', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('126', '0', '董佳鑫', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010866', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('127', '0', '付顺康', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010867', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('128', '0', '高经华', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010868', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('129', '0', '顾鹏程', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010869', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('130', '0', '贺国晏', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010870', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('131', '0', '侯富恒', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010871', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('132', '0', '姜铖', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010872', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('133', '0', '李致远', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010873', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('134', '0', '刘禹良', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010875', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('135', '0', '骆新斗', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010876', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('136', '0', '马克', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010877', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('137', '0', '马有财', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010878', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('138', '0', '邵文宏', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010879', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('139', '0', '王饕', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010880', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('140', '0', '伍彦松', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010881', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('141', '0', '熊泽华', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010882', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('142', '0', '严腾飞', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010883', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('143', '0', '杨宏慧', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010884', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('144', '0', '殷雄', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010885', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('145', '0', '张猛', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010886', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('146', '0', '张雄凯', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010887', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('147', '0', '张悦', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015011149', '储运15-1班', '1', null);
INSERT INTO `matter` VALUES ('148', '0', '李伟奇', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2013010935', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('149', '0', '柴兆杰', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2013011552', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('150', '0', '张扬', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010125', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('151', '0', '焦开拓', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010450', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('152', '0', '金晓琼', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010888', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('153', '0', '亢燕丽', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010889', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('154', '0', '刘学春', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010890', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('155', '0', '么娆', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010891', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('156', '0', '王玉婷', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010892', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('157', '0', '王智林', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010893', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('158', '0', '徐苗苗', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010894', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('159', '0', '徐则林', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010895', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('160', '0', '张昊月', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010897', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('161', '0', '戴材炜', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010898', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('162', '0', '何毅', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010900', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('163', '0', '贺禹铭', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010901', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('164', '0', '雷平', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010902', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('165', '0', '李彦博', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010903', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('166', '0', '李泽世', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010904', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('167', '0', '刘琪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010905', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('168', '0', '刘万琪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010906', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('169', '0', '刘志伟', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010907', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('170', '0', '石金波', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010908', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('171', '0', '宋燎东', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010909', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('172', '0', '隋金昊', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010910', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('173', '0', '邰昊', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010911', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('174', '0', '唐银宏', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010912', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('175', '0', '王怡博', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010913', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('176', '0', '徐帜', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010914', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('177', '0', '杨起', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010915', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('178', '0', '张兴强', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010917', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('179', '0', '赵鹏', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010918', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('180', '0', '赵伟', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010919', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('181', '0', '周小龙', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010920', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('182', '0', '李维嘉', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010954', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('183', '0', '吴紫月', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010956', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('184', '0', '肖帆', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015011166', '储运15-2班', '1', null);
INSERT INTO `matter` VALUES ('185', '0', '宋少雄', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2013010971', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('186', '0', '张艺馨', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2014010805', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('187', '0', '封叶', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010921', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('188', '0', '高维蔚', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010922', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('189', '0', '李姗姗', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010923', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('190', '0', '潘瑞雪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010924', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('191', '0', '索娜曲珍', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010925', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('192', '0', '席蔺璇', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010926', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('193', '0', '张琴', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010927', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('194', '0', '张婉', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010928', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('195', '0', '张鑫', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010929', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('196', '0', '郑衣珍', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010930', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('197', '0', '陈东宁', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010931', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('198', '0', '陈盼杰', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010932', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('199', '0', '陈枭', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010933', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('200', '0', '池弘睿', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010934', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('201', '0', '董高华', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010935', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('202', '0', '董兆豪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010936', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('203', '0', '高毅飞', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010937', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('204', '0', '何习渊', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010938', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('205', '0', '李睿麟', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010939', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('206', '0', '李伟浩', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010940', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('207', '0', '苗泽宇', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010941', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('208', '0', '宁立秋', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010942', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('209', '0', '田志刚', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010943', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('210', '0', '汪常翔', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010944', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('211', '0', '杨浩帆', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010945', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('212', '0', '张博', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010946', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('213', '0', '张财铄', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010947', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('214', '0', '张左旻', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010948', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('215', '0', '赵凯歌', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010949', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('216', '0', '赵文博', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010950', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('217', '0', '郑文川', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010951', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('218', '0', '周俊炜', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010952', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('219', '0', '朱跃强', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015010953', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('220', '0', '姜源', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015011710', '储运15-3班', '1', null);
INSERT INTO `matter` VALUES ('221', '0', '达意娜', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015030065', '储运15-4留学生班', '1', null);
INSERT INTO `matter` VALUES ('222', '0', '康迪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015030066', '储运15-4留学生班', '1', null);
INSERT INTO `matter` VALUES ('223', '0', '梅尔兰', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015030067', '储运15-4留学生班', '1', null);
INSERT INTO `matter` VALUES ('224', '0', '萨纳特', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015030068', '储运15-4留学生班', '1', null);
INSERT INTO `matter` VALUES ('225', '0', '桑迪', 'cn.edu.cup.lims.Student', null, null, null, null, '16', '2015030069', '储运15-4留学生班', '1', null);
INSERT INTO `matter` VALUES ('226', '0', '2018-软件实训，软件对比', 'cn.edu.cup.lims.Course', '2018-12-24 00:00:00', '18', '1', null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('227', '0', '2018-软件实训，软件综述', 'cn.edu.cup.lims.Course', '2018-12-24 00:00:00', '18', '1', null, null, null, null, null, null);
INSERT INTO `matter` VALUES ('228', '0', '左丽丽', 'cn.edu.cup.lims.Teacher', null, null, null, null, '4', '2333', null, null, null);
INSERT INTO `matter` VALUES ('229', '0', '史博会', 'cn.edu.cup.lims.Teacher', null, null, null, null, '4', '2013880073', null, null, null);
INSERT INTO `matter` VALUES ('230', '0', '温凯', 'cn.edu.cup.lims.Teacher', null, null, null, null, '5', '2012880012', null, null, null);

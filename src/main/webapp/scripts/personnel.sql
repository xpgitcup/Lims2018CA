/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lims2018bdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-10 14:50:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `personnel`
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `grade_name` varchar(255) DEFAULT NULL,
  `student_type_id` bigint(20) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  `title_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5jm646fglvj9mauwjymrrxca7` (`student_type_id`),
  KEY `FKec6jehlvg37i4u60uxykqmeu1` (`supervisor_id`),
  KEY `FKekdh53whxff5xk4fi4fhmj78a` (`title_id`),
  CONSTRAINT `FK5jm646fglvj9mauwjymrrxca7` FOREIGN KEY (`student_type_id`) REFERENCES `object_type` (`id`),
  CONSTRAINT `FKec6jehlvg37i4u60uxykqmeu1` FOREIGN KEY (`supervisor_id`) REFERENCES `personnel` (`id`),
  CONSTRAINT `FKekdh53whxff5xk4fi4fhmj78a` FOREIGN KEY (`title_id`) REFERENCES `object_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES ('1', '0', '1552', '宫敬', 'cn.edu.cup.lims.Teacher', null, null, null, null, '1');
INSERT INTO `personnel` VALUES ('2', '0', '2151', '李晓平', 'cn.edu.cup.lims.Teacher', null, null, null, null, '2');
INSERT INTO `personnel` VALUES ('3', '0', '2152', '邓道明', 'cn.edu.cup.lims.Teacher', null, null, null, null, '2');
INSERT INTO `personnel` VALUES ('4', '0', '2014314014', '石国赟', 'cn.edu.cup.lims.Student', '2014', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('5', '0', '2014314013', '丁麟', 'cn.edu.cup.lims.Student', '2014', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('6', '0', '2015314019', '虞维超', 'cn.edu.cup.lims.Student', '2015', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('7', '0', '2015314016', '马千里', 'cn.edu.cup.lims.Student', '2015', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('8', '0', '2015314022', '靳航', 'cn.edu.cup.lims.Student', '2015', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('9', '0', '2015314023', '柳扬', 'cn.edu.cup.lims.Student', '2015', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('10', '0', '2015314017', '宋尚飞', 'cn.edu.cup.lims.Student', '2015', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('11', '0', '2016314026', '康琦', 'cn.edu.cup.lims.Student', '2016', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('12', '0', '2016314018', '洪炳沅', 'cn.edu.cup.lims.Student', '2016', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('13', '0', '2016314025', '黄辉荣', 'cn.edu.cup.lims.Student', '2016', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('14', '0', '2016314019', '王丹', 'cn.edu.cup.lims.Student', '2016', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('15', '0', '2016314017', '李昂', 'cn.edu.cup.lims.Student', '2016', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('16', '0', '2017314026', '樊迪', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('17', '0', '2017314015', '齐雪宇', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('18', '0', '2017314023', '于志鹏', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('19', '0', '2017314013', '陈玉川', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('20', '0', '2017314014', '李熠辰', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('21', '0', '2017314024', '张盛楠', 'cn.edu.cup.lims.Student', '2017', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('22', '0', '2018314016', '段旭', 'cn.edu.cup.lims.Student', '2018', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('23', '0', '2018314015', '陈思杭', 'cn.edu.cup.lims.Student', '2018', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('24', '0', '2018314026', '彭泽恒', 'cn.edu.cup.lims.Student', '2018', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('25', '0', '2018314025', '李楷', 'cn.edu.cup.lims.Student', '2018', '11', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('26', '0', '2015214549', '金浩', 'cn.edu.cup.lims.Student', '2015', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('27', '0', '2015214571', '马晓旭', 'cn.edu.cup.lims.Student', '2015', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('28', '0', '2015214557', '朱梦琪', 'cn.edu.cup.lims.Student', '2015', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('29', '0', '2016214568', '陈新果', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('30', '0', '2016214090', '陈怡鸣', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('31', '0', '2016214554', '陈影', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('32', '0', '2016214555', '崔可心', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('33', '0', '2016214536', '丁凯', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('34', '0', '2016214091', '甘东英', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('35', '0', '2016214537', '高航', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('36', '0', '2016214541', '韩庆龙', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('37', '0', '2016214538', '黄璞', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('38', '0', '2016214539', '李梦瑶', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('39', '0', '2016214086', '李莎', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('40', '0', '2016214556', '李愚', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('41', '0', '2016214544', '王传硕', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('42', '0', '2016214543', '任亮', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('43', '0', '2016214060', '沈伟伟', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('44', '0', '2016214092', '沈允', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('45', '0', '2016214076', '苏越', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '2', null);
INSERT INTO `personnel` VALUES ('46', '0', '2016214557', '万洋洋', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('47', '0', '2016214558', '王茀玺', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('48', '0', '2016214057', '王君傲', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('49', '0', '2016214093', '吴停', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('50', '0', '2016214096', '夏子杰', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('51', '0', '2015214064', '许洁', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('52', '0', '2016214063', '张若晨', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('53', '0', '2016214065', '赵云鹏', 'cn.edu.cup.lims.Student', '2016', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('54', '0', '2016214560', '周艳红', 'cn.edu.cup.lims.Student', '2016', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('55', '0', '2017214552', '邓坤', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('56', '0', '2017214564', '高晶晶', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('57', '0', '2017214553', '高振宇', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('58', '0', '2017214565', '何卓', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('59', '0', '2017214554', '胡杰', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('60', '0', '2017214558', '兰文萍', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('61', '0', '2017214584', '李根', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('62', '0', '2017214050', '李金潮', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('63', '0', '2017214052', '李立', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('64', '0', '2017214555', '林聿明', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('65', '0', '2017214053', '吕鹏飞', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('66', '0', '2017214054', '孙小喆', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('67', '0', '2017214081', '王振威', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('68', '0', '2017214078', '肖亚琪', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('69', '0', '2017214070', '谢平', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '2', null);
INSERT INTO `personnel` VALUES ('70', '0', '2017214082', '薛一菡', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('71', '0', '2017214570', '杨克', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('72', '0', '2017214566', '禹亚峰', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('73', '0', '2017214556', '张昊', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('74', '0', '2017214055', '张杰', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('75', '0', '2017214557', '张蒙丽', 'cn.edu.cup.lims.Student', '2017', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('76', '0', '2017214056', '张佩颖', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('77', '0', '2017214069', '狄国佳', 'cn.edu.cup.lims.Student', '2017', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('78', '0', '2018214052', '丁陈陈', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('79', '0', '2018214053', '纪晨秋', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('80', '0', '2018214054', '廖清云', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('81', '0', '2018214055', '刘鹏', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('82', '0', '2018214056', '刘轩章', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('83', '0', '2018214051', '李国豪', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('84', '0', '2018214075', '林德才', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('85', '0', '2018214078', '葛运通', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('86', '0', '2018214079', '杨晓鹏', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('87', '0', '2018214544', '冯兴', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('88', '0', '2018214545', '王昕楚', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('89', '0', '2018214546', '王靖怡', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('90', '0', '2018214553', '崔雪萌', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('91', '0', '2018214554', '都兆楠', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '1', null);
INSERT INTO `personnel` VALUES ('92', '0', '2018214555', '谭遥', 'cn.edu.cup.lims.Student', '2018', '20', '石油与天然气工程', '2', null);
INSERT INTO `personnel` VALUES ('93', '0', '2018214084', '周建伟', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('94', '0', '2018214068', '刘胜男', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '2', null);
INSERT INTO `personnel` VALUES ('95', '0', '2018214080', '喻伟婕', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);
INSERT INTO `personnel` VALUES ('96', '0', '2018214081', '张璐瑶', 'cn.edu.cup.lims.Student', '2018', '20', '油气储运工程', '1', null);

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3308
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : reporting

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-03-08 18:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `address` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '小猪', '西安');
INSERT INTO `info` VALUES ('2', '小狗', '兰州');
INSERT INTO `info` VALUES ('3', '兔子', '兰州');
INSERT INTO `info` VALUES ('4', '小猫', '北京');
INSERT INTO `info` VALUES ('5', '小鸡', '北京');
INSERT INTO `info` VALUES ('6', '小鸭', '上海');
INSERT INTO `info` VALUES ('7', '小鸟', '深圳');
INSERT INTO `info` VALUES ('8', '老虎', '重庆');
INSERT INTO `info` VALUES ('9', '小花', '长沙');
INSERT INTO `info` VALUES ('10', '小草', '广州');
INSERT INTO `info` VALUES ('11', '小锅', '杭州');
INSERT INTO `info` VALUES ('12', '小碗', '苏州');
INSERT INTO `info` VALUES ('13', '小勺', '乌鲁木齐');
INSERT INTO `info` VALUES ('14', '小盆', '沈阳');
INSERT INTO `info` VALUES ('15', '铲子', '黑龙江');
INSERT INTO `info` VALUES ('16', '筷子', '齐齐哈尔');
INSERT INTO `info` VALUES ('17', '洗面奶', '天津');
INSERT INTO `info` VALUES ('18', '洗手液', '西安');
INSERT INTO `info` VALUES ('19', '爽肤水', '北京');
INSERT INTO `info` VALUES ('20', '面霜', '上海');

-- ----------------------------
-- Table structure for `risk`
-- ----------------------------
DROP TABLE IF EXISTS `risk`;
CREATE TABLE `risk` (
  `risk` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'no',
  `date` date DEFAULT NULL,
  `id` int(20) DEFAULT NULL,
  `num` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num`),
  KEY `id` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of risk
-- ----------------------------
INSERT INTO `risk` VALUES ('no', '2020-02-21', '1', '1');
INSERT INTO `risk` VALUES ('yes', '2020-02-21', '2', '2');
INSERT INTO `risk` VALUES ('yes', '2020-02-21', '3', '3');
INSERT INTO `risk` VALUES ('no', '2020-02-21', '4', '4');
INSERT INTO `risk` VALUES ('no', '2020-02-21', '5', '5');
INSERT INTO `risk` VALUES ('yes', '2020-02-21', '6', '6');
INSERT INTO `risk` VALUES ('no', '2020-02-21', '7', '7');
INSERT INTO `risk` VALUES ('no', '2020-02-21', '8', '8');
INSERT INTO `risk` VALUES ('yes', '2020-02-21', '9', '9');
INSERT INTO `risk` VALUES ('no', '2020-02-21', '10', '10');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '11', '11');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '12', '12');
INSERT INTO `risk` VALUES ('yes', '2020-02-22', '13', '13');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '14', '14');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '15', '15');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '16', '16');
INSERT INTO `risk` VALUES ('yes', '2020-02-22', '17', '17');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '18', '18');
INSERT INTO `risk` VALUES ('yes', '2020-02-22', '19', '19');
INSERT INTO `risk` VALUES ('no', '2020-02-22', '20', '20');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '1', '21');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '2', '22');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '3', '23');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '4', '24');
INSERT INTO `risk` VALUES ('yes', '2020-02-26', '5', '25');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '6', '26');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '7', '27');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '8', '28');
INSERT INTO `risk` VALUES ('yes', '2020-02-26', '9', '29');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '10', '30');
INSERT INTO `risk` VALUES ('no', '2020-02-26', '11', '31');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '12', '32');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '13', '33');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '14', '34');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '15', '35');
INSERT INTO `risk` VALUES ('yes', '2020-02-28', '16', '36');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '17', '37');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '18', '38');
INSERT INTO `risk` VALUES ('no', '2020-02-28', '19', '39');
INSERT INTO `risk` VALUES ('yes', '2020-02-28', '20', '40');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '1', '41');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '2', '42');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '3', '43');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '4', '44');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '5', '45');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '6', '46');
INSERT INTO `risk` VALUES ('yes', '2020-03-03', '7', '47');
INSERT INTO `risk` VALUES ('yes', '2020-03-03', '8', '48');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '9', '49');
INSERT INTO `risk` VALUES ('no', '2020-03-03', '10', '50');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '11', '51');
INSERT INTO `risk` VALUES ('yes', '2020-03-07', '12', '52');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '13', '53');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '14', '54');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '15', '55');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '16', '56');
INSERT INTO `risk` VALUES ('yes', '2020-03-07', '17', '57');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '18', '58');
INSERT INTO `risk` VALUES ('yes', '2020-03-07', '19', '59');
INSERT INTO `risk` VALUES ('no', '2020-03-07', '20', '60');

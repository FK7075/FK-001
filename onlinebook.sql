/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : onlinebook

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-06-21 13:26:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `Bid` int(4) NOT NULL AUTO_INCREMENT,
  `Bname` varchar(30) NOT NULL,
  `Author` varchar(20) NOT NULL,
  `BookType` varchar(20) NOT NULL,
  `Price` double(4,2) NOT NULL,
  `Inventory` int(4) NOT NULL,
  PRIMARY KEY (`Bid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('2', '《挪威的森林》', '村上春树', '课外读物', '45.00', '111');
INSERT INTO `books` VALUES ('3', '《美的历程》', '李泽厚', '课外读物', '32.22', '94');
INSERT INTO `books` VALUES ('4', '《根》', '亚力克黑尔', '课外读物', '23.00', '90');
INSERT INTO `books` VALUES ('5', '《活着》', '余华', '课外读物', '38.60', '120');
INSERT INTO `books` VALUES ('6', '《巴黎圣母院》', '雨果', '世界名著', '34.00', '125');
INSERT INTO `books` VALUES ('7', '《悲惨世界》', '雨果', '世界名著', '35.00', '91');
INSERT INTO `books` VALUES ('8', '《朝花夕拾》', '鲁迅', '世界名著', '34.70', '132');
INSERT INTO `books` VALUES ('9', '《野草》', '鲁迅', '世界名著', '24.88', '74');
INSERT INTO `books` VALUES ('10', '《呐喊》', '鲁迅', '世界名著', '33.00', '71');
INSERT INTO `books` VALUES ('11', '《斗破苍穹》', '天蚕土豆', '网络小说', '24.00', '82');
INSERT INTO `books` VALUES ('12', '《无限恐怖》', '张恒', '网络小说', '23.00', '67');
INSERT INTO `books` VALUES ('13', '《诛仙》', '萧鼎', '网络小说', '34.00', '84');
INSERT INTO `books` VALUES ('14', '《斗罗大陆》', '唐家三少', '网络小说', '35.00', '62');
INSERT INTO `books` VALUES ('15', '《狭义相对论》', '爱因斯坦', '科普读物', '32.00', '73');
INSERT INTO `books` VALUES ('16', '《广义相对论》', '爱因斯坦', '科普读物', '35.50', '106');
INSERT INTO `books` VALUES ('17', '《量子理论简介》', '波尔', '科普读物', '33.00', '122');
INSERT INTO `books` VALUES ('18', '《时间简史》', '霍金', '科普读物', '26.00', '137');
INSERT INTO `books` VALUES ('19', '《心理学与我们》', '费尔德曼', '心理学', '34.00', '155');
INSERT INTO `books` VALUES ('20', '《身体语言密码》', '皮斯', '心理学', '25.00', '144');
INSERT INTO `books` VALUES ('21', '《幻想即现实》', '曾奇峰', '心理学', '34.60', '118');
INSERT INTO `books` VALUES ('22', '《为何家会伤人》', '武志红', '心理学', '37.00', '144');
INSERT INTO `books` VALUES ('23', '《为何家会伤人》', '武志红', '心理学', '37.00', '100');
INSERT INTO `books` VALUES ('24', '《斯人独憔悴》', '冰心', '文学大咖', '37.00', '120');
INSERT INTO `books` VALUES ('25', '《武练巅峰》', '莫默', '网络小说', '23.50', '123');
INSERT INTO `books` VALUES ('26', '《论语》', '孔子', '中华文化', '34.50', '116');

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Uid` varchar(20) NOT NULL,
  `Bid` varchar(20) NOT NULL,
  `Bname` varchar(30) NOT NULL,
  `Price` double(4,2) NOT NULL,
  `BuyTime` varchar(30) NOT NULL,
  `BuyNumber` int(3) NOT NULL,
  `Amount` double(4,0) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Uid` (`Uid`),
  KEY `1` (`Bid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('22', '2015004', '14', '《斗罗大陆》', '35.00', 'Tue Jun 05 06:21:19 CST 2018', '5', '175');
INSERT INTO `buy` VALUES ('18', '2015001', '11', '《斗破苍穹》', '24.00', 'Tue Jun 05 06:18:55 CST 2018', '5', '120');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Uid` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Perm` int(2) NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2015001', '123456', '1');
INSERT INTO `users` VALUES ('2015002', '123456', '1');
INSERT INTO `users` VALUES ('2015003', '123456', '-1');
INSERT INTO `users` VALUES ('付康', '654321', '2');
INSERT INTO `users` VALUES ('gly001', '654321', '2');
INSERT INTO `users` VALUES ('gly002', '654321', '2');
INSERT INTO `users` VALUES ('gly003', '654321', '2');
INSERT INTO `users` VALUES ('gly004', '654321', '0');
INSERT INTO `users` VALUES ('2015004', '123456', '1');
INSERT INTO `users` VALUES ('成柳', '654321', '2');
INSERT INTO `users` VALUES ('2015005', '123456', '1');
INSERT INTO `users` VALUES ('gly010', '123', '2');

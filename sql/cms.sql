/*
Navicat MySQL Data Transfer

Source Server         : 66
Source Server Version : 50715
Source Host           : 192.168.58.66:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-12-04 18:23:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ic_ad
-- ----------------------------
DROP TABLE IF EXISTS `ic_ad`;
CREATE TABLE "ic_ad" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(30) NOT NULL DEFAULT '',
  "url" varchar(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  "ad_type" tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  "img" varchar(255) DEFAULT NULL,
  "sort" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of ic_ad
-- ----------------------------
INSERT INTO `ic_ad` VALUES ('5', 'bg1', 'http://www.amazeui.org/', '1', 'http://localhost:8080/r/upload/2016/12/31/1483165253633.jpg', '0');
INSERT INTO `ic_ad` VALUES ('6', 'bg2', 'http://www.amazeui.org/', '1', 'http://localhost:8080/r/upload/2016/12/31/1483165291017.jpg', '0');
INSERT INTO `ic_ad` VALUES ('7', 'bg3', 'http://www.amazeui.org/', '1', 'http://localhost:8080/r/upload/2016/12/31/1483165329154.jpg', '0');

-- ----------------------------
-- Table structure for ic_admin
-- ----------------------------
DROP TABLE IF EXISTS `ic_admin`;
CREATE TABLE "ic_admin" (
  "admin_id" int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  "username" varchar(255) DEFAULT NULL COMMENT '用户名',
  "password" varchar(255) DEFAULT NULL COMMENT '密码',
  "salt" char(64) DEFAULT NULL COMMENT '盐',
  "lastip" varchar(64) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登陆时间',
  "lastdate" varchar(64) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登陆时间',
  "createdate" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  "site_id" int(11) NOT NULL DEFAULT '0' COMMENT '站点id（0，为默认）',
  "loginsum" int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  "description" varchar(255) DEFAULT NULL COMMENT '描述',
  "status" tinyint(1) NOT NULL DEFAULT '1',
  "email" varchar(64) DEFAULT NULL,
  PRIMARY KEY ("admin_id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of ic_admin
-- ----------------------------
INSERT INTO `ic_admin` VALUES ('1', 'admin', '24b81da6640d91def35d33c7940a16c7e0631ff99d3060a491694866f1063fcc', 'admin', '127.0.0.1', '2017-06-15 15:15:24.917', '2017-05-22 15:39:09', '1', '1208', '超级管理员', '1', null);

-- ----------------------------
-- Table structure for ic_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ic_admin_role`;
CREATE TABLE "ic_admin_role" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "admin_id" int(11) NOT NULL DEFAULT '0',
  "role_id" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  KEY "admin_id" ("admin_id"),
  KEY "role_id" ("role_id")
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理员权限';

-- ----------------------------
-- Records of ic_admin_role
-- ----------------------------
INSERT INTO `ic_admin_role` VALUES ('1', '1', '1');
INSERT INTO `ic_admin_role` VALUES ('6', '8', '1');
INSERT INTO `ic_admin_role` VALUES ('7', '9', '1');

-- ----------------------------
-- Table structure for ic_area
-- ----------------------------
DROP TABLE IF EXISTS `ic_area`;
CREATE TABLE "ic_area" (
  "id" int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  "area_name" varchar(255) NOT NULL DEFAULT '' COMMENT '区域名称',
  "pid" int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父区域ID',
  "pname" varchar(255) NOT NULL DEFAULT '' COMMENT '父区域名称',
  "list_order" tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  "status" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有效标识',
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_area
-- ----------------------------
INSERT INTO `ic_area` VALUES ('1', '北京市', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('2', '天津市', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('3', '河北省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('4', '山西省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('5', '内蒙古自治区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('6', '辽宁省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('7', '吉林省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('8', '黑龙江省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('9', '上海市', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('10', '江苏省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('11', '浙江省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('12', '安徽省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('13', '福建省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('14', '江西省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('15', '山东省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('16', '河南省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('17', '湖北省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('18', '湖南省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('19', '广东省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('20', '广西壮族自治区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('21', '海南省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('22', '重庆市', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('23', '四川省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('24', '贵州省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('25', '云南省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('26', '西藏自治区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('27', '陕西省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('28', '甘肃省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('29', '青海省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('30', '宁夏回族自治区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('31', '新疆维吾尔自治区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('32', '台湾省', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('33', '香港特别行政区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('34', '澳门特别行政区', '0', '', '255', '1');
INSERT INTO `ic_area` VALUES ('35', '市辖区', '1', '北京市', '255', '1');
INSERT INTO `ic_area` VALUES ('36', '县', '1', '北京市', '255', '1');
INSERT INTO `ic_area` VALUES ('37', '市辖区', '2', '天津市', '255', '1');
INSERT INTO `ic_area` VALUES ('38', '县', '2', '天津市', '255', '1');
INSERT INTO `ic_area` VALUES ('39', '石家庄市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('40', '唐山市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('41', '秦皇岛市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('42', '邯郸市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('43', '邢台市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('44', '保定市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('45', '张家口市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('46', '承德市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('47', '沧州市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('48', '廊坊市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('49', '衡水市', '3', '河北省', '255', '1');
INSERT INTO `ic_area` VALUES ('50', '太原市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('51', '大同市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('52', '阳泉市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('53', '长治市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('54', '晋城市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('55', '朔州市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('56', '晋中市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('57', '运城市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('58', '忻州市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('59', '临汾市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('60', '吕梁市', '4', '山西省', '255', '1');
INSERT INTO `ic_area` VALUES ('61', '呼和浩特市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('62', '包头市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('63', '乌海市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('64', '赤峰市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('65', '通辽市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('66', '鄂尔多斯市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('67', '呼伦贝尔市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('68', '巴彦淖尔市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('69', '乌兰察布市', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('70', '兴安盟', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('71', '锡林郭勒盟', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('72', '阿拉善盟', '5', '内蒙古自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('73', '沈阳市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('74', '大连市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('75', '鞍山市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('76', '抚顺市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('77', '本溪市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('78', '丹东市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('79', '锦州市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('80', '营口市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('81', '阜新市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('82', '辽阳市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('83', '盘锦市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('84', '铁岭市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('85', '朝阳市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('86', '葫芦岛市', '6', '辽宁省', '255', '1');
INSERT INTO `ic_area` VALUES ('87', '长春市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('88', '吉林市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('89', '四平市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('90', '辽源市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('91', '通化市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('92', '白山市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('93', '松原市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('94', '白城市', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('95', '延边朝鲜族自治州', '7', '吉林省', '255', '1');
INSERT INTO `ic_area` VALUES ('96', '哈尔滨市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('97', '齐齐哈尔市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('98', '鸡西市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('99', '鹤岗市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('100', '双鸭山市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('101', '大庆市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('102', '伊春市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('103', '佳木斯市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('104', '七台河市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('105', '牡丹江市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('106', '黑河市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('107', '绥化市', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('108', '大兴安岭地区', '8', '黑龙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('109', '市辖区', '9', '上海市', '255', '1');
INSERT INTO `ic_area` VALUES ('110', '县', '9', '上海市', '255', '1');
INSERT INTO `ic_area` VALUES ('111', '南京市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('112', '无锡市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('113', '徐州市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('114', '常州市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('115', '苏州市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('116', '南通市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('117', '连云港市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('118', '淮安市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('119', '盐城市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('120', '扬州市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('121', '镇江市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('122', '泰州市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('123', '宿迁市', '10', '江苏省', '255', '1');
INSERT INTO `ic_area` VALUES ('124', '杭州市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('125', '宁波市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('126', '温州市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('127', '嘉兴市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('128', '湖州市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('129', '绍兴市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('130', '金华市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('131', '衢州市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('132', '舟山市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('133', '台州市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('134', '丽水市', '11', '浙江省', '255', '1');
INSERT INTO `ic_area` VALUES ('135', '合肥市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('136', '芜湖市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('137', '蚌埠市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('138', '淮南市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('139', '马鞍山市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('140', '淮北市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('141', '铜陵市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('142', '安庆市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('143', '黄山市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('144', '滁州市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('145', '阜阳市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('146', '宿州市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('147', '巢湖市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('148', '六安市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('149', '亳州市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('150', '池州市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('151', '宣城市', '12', '安徽省', '255', '1');
INSERT INTO `ic_area` VALUES ('152', '福州市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('153', '厦门市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('154', '莆田市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('155', '三明市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('156', '泉州市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('157', '漳州市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('158', '南平市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('159', '龙岩市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('160', '宁德市', '13', '福建省', '255', '1');
INSERT INTO `ic_area` VALUES ('161', '南昌市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('162', '景德镇市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('163', '萍乡市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('164', '九江市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('165', '新余市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('166', '鹰潭市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('167', '赣州市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('168', '吉安市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('169', '宜春市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('170', '抚州市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('171', '上饶市', '14', '江西省', '255', '1');
INSERT INTO `ic_area` VALUES ('172', '济南市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('173', '青岛市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('174', '淄博市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('175', '枣庄市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('176', '东营市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('177', '烟台市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('178', '潍坊市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('179', '济宁市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('180', '泰安市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('181', '威海市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('182', '日照市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('183', '莱芜市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('184', '临沂市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('185', '德州市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('186', '聊城市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('187', '滨州市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('188', '菏泽市', '15', '山东省', '255', '1');
INSERT INTO `ic_area` VALUES ('189', '郑州市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('190', '开封市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('191', '洛阳市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('192', '平顶山市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('193', '安阳市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('194', '鹤壁市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('195', '新乡市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('196', '焦作市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('197', '濮阳市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('198', '许昌市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('199', '漯河市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('200', '三门峡市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('201', '南阳市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('202', '商丘市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('203', '信阳市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('204', '周口市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('205', '驻马店市', '16', '河南省', '255', '1');
INSERT INTO `ic_area` VALUES ('206', '武汉市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('207', '黄石市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('208', '十堰市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('209', '宜昌市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('210', '襄樊市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('211', '鄂州市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('212', '荆门市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('213', '孝感市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('214', '荆州市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('215', '黄冈市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('216', '咸宁市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('217', '随州市', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('218', '恩施土家族苗族自治州', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('219', '省直辖行政单位', '17', '湖北省', '255', '1');
INSERT INTO `ic_area` VALUES ('220', '长沙市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('221', '株洲市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('222', '湘潭市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('223', '衡阳市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('224', '邵阳市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('225', '岳阳市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('226', '常德市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('227', '张家界市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('228', '益阳市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('229', '郴州市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('230', '永州市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('231', '怀化市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('232', '娄底市', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('233', '湘西土家族苗族自治州', '18', '湖南省', '255', '1');
INSERT INTO `ic_area` VALUES ('234', '广州市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('235', '韶关市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('236', '深圳市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('237', '珠海市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('238', '汕头市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('239', '佛山市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('240', '江门市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('241', '湛江市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('242', '茂名市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('243', '肇庆市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('244', '惠州市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('245', '梅州市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('246', '汕尾市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('247', '河源市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('248', '阳江市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('249', '清远市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('250', '东莞市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('251', '中山市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('252', '潮州市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('253', '揭阳市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('254', '云浮市', '19', '广东省', '255', '1');
INSERT INTO `ic_area` VALUES ('255', '南宁市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('256', '柳州市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('257', '桂林市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('258', '梧州市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('259', '北海市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('260', '防城港市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('261', '钦州市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('262', '贵港市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('263', '玉林市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('264', '百色市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('265', '贺州市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('266', '河池市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('267', '来宾市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('268', '崇左市', '20', '广西壮族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('269', '海口市', '21', '海南省', '255', '1');
INSERT INTO `ic_area` VALUES ('270', '三亚市', '21', '海南省', '255', '1');
INSERT INTO `ic_area` VALUES ('271', '省直辖县级行政单位', '21', '海南省', '255', '1');
INSERT INTO `ic_area` VALUES ('272', '市辖区', '22', '重庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('273', '县', '22', '重庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('274', '成都市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('275', '自贡市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('276', '攀枝花市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('277', '泸州市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('278', '德阳市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('279', '绵阳市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('280', '广元市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('281', '遂宁市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('282', '内江市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('283', '乐山市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('284', '南充市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('285', '眉山市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('286', '宜宾市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('287', '广安市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('288', '达州市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('289', '雅安市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('290', '巴中市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('291', '资阳市', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('292', '阿坝藏族羌族自治州', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('293', '甘孜藏族自治州', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('294', '凉山彝族自治州', '23', '四川省', '255', '1');
INSERT INTO `ic_area` VALUES ('295', '贵阳市', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('296', '六盘水市', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('297', '遵义市', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('298', '安顺市', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('299', '铜仁地区', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('300', '黔西南布依族苗族自治州', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('301', '毕节地区', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('302', '黔东南苗族侗族自治州', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('303', '黔南布依族苗族自治州', '24', '贵州省', '255', '1');
INSERT INTO `ic_area` VALUES ('304', '昆明市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('305', '曲靖市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('306', '玉溪市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('307', '保山市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('308', '昭通市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('309', '丽江市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('310', '思茅市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('311', '临沧市', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('312', '楚雄彝族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('313', '红河哈尼族彝族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('314', '文山壮族苗族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('315', '西双版纳傣族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('316', '大理白族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('317', '德宏傣族景颇族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('318', '怒江傈僳族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('319', '迪庆藏族自治州', '25', '云南省', '255', '1');
INSERT INTO `ic_area` VALUES ('320', '拉萨市', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('321', '昌都地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('322', '山南地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('323', '日喀则地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('324', '那曲地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('325', '阿里地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('326', '林芝地区', '26', '西藏自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('327', '西安市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('328', '铜川市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('329', '宝鸡市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('330', '咸阳市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('331', '渭南市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('332', '延安市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('333', '汉中市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('334', '榆林市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('335', '安康市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('336', '商洛市', '27', '陕西省', '255', '1');
INSERT INTO `ic_area` VALUES ('337', '兰州市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('338', '嘉峪关市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('339', '金昌市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('340', '白银市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('341', '天水市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('342', '武威市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('343', '张掖市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('344', '平凉市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('345', '酒泉市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('346', '庆阳市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('347', '定西市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('348', '陇南市', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('349', '临夏回族自治州', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('350', '甘南藏族自治州', '28', '甘肃省', '255', '1');
INSERT INTO `ic_area` VALUES ('351', '西宁市', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('352', '海东地区', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('353', '海北藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('354', '黄南藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('355', '海南藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('356', '果洛藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('357', '玉树藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('358', '海西蒙古族藏族自治州', '29', '青海省', '255', '1');
INSERT INTO `ic_area` VALUES ('359', '银川市', '30', '宁夏回族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('360', '石嘴山市', '30', '宁夏回族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('361', '吴忠市', '30', '宁夏回族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('362', '固原市', '30', '宁夏回族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('363', '中卫市', '30', '宁夏回族自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('364', '乌鲁木齐市', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('365', '克拉玛依市', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('366', '吐鲁番地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('367', '哈密地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('368', '昌吉回族自治州', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('369', '博尔塔拉蒙古自治州', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('370', '巴音郭楞蒙古自治州', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('371', '阿克苏地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('372', '克孜勒苏柯尔克孜自治州', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('373', '喀什地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('374', '和田地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('375', '伊犁哈萨克自治州', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('376', '塔城地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('377', '阿勒泰地区', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('378', '省直辖行政单位', '31', '新疆维吾尔自治区', '255', '1');
INSERT INTO `ic_area` VALUES ('379', '东城区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('380', '西城区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('381', '崇文区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('382', '宣武区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('383', '朝阳区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('384', '丰台区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('385', '石景山区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('386', '海淀区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('387', '门头沟区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('388', '房山区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('389', '通州区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('390', '顺义区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('391', '昌平区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('392', '大兴区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('393', '怀柔区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('394', '平谷区', '35', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('395', '密云县', '36', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('396', '延庆县', '36', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('397', '和平区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('398', '河东区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('399', '河西区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('400', '南开区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('401', '河北区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('402', '红桥区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('403', '塘沽区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('404', '汉沽区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('405', '大港区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('406', '东丽区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('407', '西青区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('408', '津南区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('409', '北辰区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('410', '武清区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('411', '宝坻区', '37', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('412', '宁河县', '38', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('413', '静海县', '38', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('414', '蓟县', '38', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('415', '市辖区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('416', '长安区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('417', '桥东区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('418', '桥西区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('419', '新华区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('420', '井陉矿区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('421', '裕华区', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('422', '井陉县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('423', '正定县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('424', '栾城县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('425', '行唐县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('426', '灵寿县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('427', '高邑县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('428', '深泽县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('429', '赞皇县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('430', '无极县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('431', '平山县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('432', '元氏县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('433', '赵县', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('434', '辛集市', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('435', '藁城市', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('436', '晋州市', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('437', '新乐市', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('438', '鹿泉市', '39', '石家庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('439', '市辖区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('440', '路南区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('441', '路北区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('442', '古冶区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('443', '开平区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('444', '丰南区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('445', '丰润区', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('446', '滦县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('447', '滦南县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('448', '乐亭县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('449', '迁西县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('450', '玉田县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('451', '唐海县', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('452', '遵化市', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('453', '迁安市', '40', '唐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('454', '市辖区', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('455', '海港区', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('456', '山海关区', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('457', '北戴河区', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('458', '青龙满族自治县', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('459', '昌黎县', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('460', '抚宁县', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('461', '卢龙县', '41', '秦皇岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('462', '市辖区', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('463', '邯山区', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('464', '丛台区', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('465', '复兴区', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('466', '峰峰矿区', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('467', '邯郸县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('468', '临漳县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('469', '成安县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('470', '大名县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('471', '涉县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('472', '磁县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('473', '肥乡县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('474', '永年县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('475', '邱县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('476', '鸡泽县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('477', '广平县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('478', '馆陶县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('479', '魏县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('480', '曲周县', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('481', '武安市', '42', '邯郸市', '255', '1');
INSERT INTO `ic_area` VALUES ('482', '市辖区', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('483', '桥东区', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('484', '桥西区', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('485', '邢台县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('486', '临城县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('487', '内丘县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('488', '柏乡县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('489', '隆尧县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('490', '任县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('491', '南和县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('492', '宁晋县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('493', '巨鹿县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('494', '新河县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('495', '广宗县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('496', '平乡县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('497', '威县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('498', '清河县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('499', '临西县', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('500', '南宫市', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('501', '沙河市', '43', '邢台市', '255', '1');
INSERT INTO `ic_area` VALUES ('502', '市辖区', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('503', '新市区', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('504', '北市区', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('505', '南市区', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('506', '满城县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('507', '清苑县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('508', '涞水县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('509', '阜平县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('510', '徐水县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('511', '定兴县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('512', '唐县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('513', '高阳县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('514', '容城县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('515', '涞源县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('516', '望都县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('517', '安新县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('518', '易县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('519', '曲阳县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('520', '蠡县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('521', '顺平县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('522', '博野县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('523', '雄县', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('524', '涿州市', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('525', '定州市', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('526', '安国市', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('527', '高碑店市', '44', '保定市', '255', '1');
INSERT INTO `ic_area` VALUES ('528', '市辖区', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('529', '桥东区', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('530', '桥西区', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('531', '宣化区', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('532', '下花园区', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('533', '宣化县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('534', '张北县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('535', '康保县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('536', '沽源县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('537', '尚义县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('538', '蔚县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('539', '阳原县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('540', '怀安县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('541', '万全县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('542', '怀来县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('543', '涿鹿县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('544', '赤城县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('545', '崇礼县', '45', '张家口市', '255', '1');
INSERT INTO `ic_area` VALUES ('546', '市辖区', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('547', '双桥区', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('548', '双滦区', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('549', '鹰手营子矿区', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('550', '承德县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('551', '兴隆县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('552', '平泉县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('553', '滦平县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('554', '隆化县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('555', '丰宁满族自治县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('556', '宽城满族自治县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('557', '围场满族蒙古族自治县', '46', '承德市', '255', '1');
INSERT INTO `ic_area` VALUES ('558', '市辖区', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('559', '新华区', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('560', '运河区', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('561', '沧县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('562', '青县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('563', '东光县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('564', '海兴县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('565', '盐山县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('566', '肃宁县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('567', '南皮县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('568', '吴桥县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('569', '献县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('570', '孟村回族自治县', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('571', '泊头市', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('572', '任丘市', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('573', '黄骅市', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('574', '河间市', '47', '沧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('575', '市辖区', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('576', '安次区', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('577', '广阳区', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('578', '固安县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('579', '永清县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('580', '香河县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('581', '大城县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('582', '文安县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('583', '大厂回族自治县', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('584', '霸州市', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('585', '三河市', '48', '廊坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('586', '市辖区', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('587', '桃城区', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('588', '枣强县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('589', '武邑县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('590', '武强县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('591', '饶阳县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('592', '安平县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('593', '故城县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('594', '景县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('595', '阜城县', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('596', '冀州市', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('597', '深州市', '49', '衡水市', '255', '1');
INSERT INTO `ic_area` VALUES ('598', '市辖区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('599', '小店区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('600', '迎泽区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('601', '杏花岭区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('602', '尖草坪区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('603', '万柏林区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('604', '晋源区', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('605', '清徐县', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('606', '阳曲县', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('607', '娄烦县', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('608', '古交市', '50', '太原市', '255', '1');
INSERT INTO `ic_area` VALUES ('609', '市辖区', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('610', '城区', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('611', '矿区', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('612', '南郊区', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('613', '新荣区', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('614', '阳高县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('615', '天镇县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('616', '广灵县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('617', '灵丘县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('618', '浑源县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('619', '左云县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('620', '大同县', '51', '大同市', '255', '1');
INSERT INTO `ic_area` VALUES ('621', '市辖区', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('622', '城区', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('623', '矿区', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('624', '郊区', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('625', '平定县', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('626', '盂县', '52', '阳泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('627', '市辖区', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('628', '城区', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('629', '郊区', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('630', '长治县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('631', '襄垣县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('632', '屯留县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('633', '平顺县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('634', '黎城县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('635', '壶关县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('636', '长子县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('637', '武乡县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('638', '沁县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('639', '沁源县', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('640', '潞城市', '53', '长治市', '255', '1');
INSERT INTO `ic_area` VALUES ('641', '市辖区', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('642', '城区', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('643', '沁水县', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('644', '阳城县', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('645', '陵川县', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('646', '泽州县', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('647', '高平市', '54', '晋城市', '255', '1');
INSERT INTO `ic_area` VALUES ('648', '市辖区', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('649', '朔城区', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('650', '平鲁区', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('651', '山阴县', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('652', '应县', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('653', '右玉县', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('654', '怀仁县', '55', '朔州市', '255', '1');
INSERT INTO `ic_area` VALUES ('655', '市辖区', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('656', '榆次区', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('657', '榆社县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('658', '左权县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('659', '和顺县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('660', '昔阳县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('661', '寿阳县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('662', '太谷县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('663', '祁县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('664', '平遥县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('665', '灵石县', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('666', '介休市', '56', '晋中市', '255', '1');
INSERT INTO `ic_area` VALUES ('667', '市辖区', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('668', '盐湖区', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('669', '临猗县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('670', '万荣县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('671', '闻喜县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('672', '稷山县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('673', '新绛县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('674', '绛县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('675', '垣曲县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('676', '夏县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('677', '平陆县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('678', '芮城县', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('679', '永济市', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('680', '河津市', '57', '运城市', '255', '1');
INSERT INTO `ic_area` VALUES ('681', '市辖区', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('682', '忻府区', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('683', '定襄县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('684', '五台县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('685', '代县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('686', '繁峙县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('687', '宁武县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('688', '静乐县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('689', '神池县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('690', '五寨县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('691', '岢岚县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('692', '河曲县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('693', '保德县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('694', '偏关县', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('695', '原平市', '58', '忻州市', '255', '1');
INSERT INTO `ic_area` VALUES ('696', '市辖区', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('697', '尧都区', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('698', '曲沃县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('699', '翼城县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('700', '襄汾县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('701', '洪洞县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('702', '古县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('703', '安泽县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('704', '浮山县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('705', '吉县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('706', '乡宁县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('707', '大宁县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('708', '隰县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('709', '永和县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('710', '蒲县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('711', '汾西县', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('712', '侯马市', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('713', '霍州市', '59', '临汾市', '255', '1');
INSERT INTO `ic_area` VALUES ('714', '市辖区', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('715', '离石区', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('716', '文水县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('717', '交城县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('718', '兴县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('719', '临县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('720', '柳林县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('721', '石楼县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('722', '岚县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('723', '方山县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('724', '中阳县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('725', '交口县', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('726', '孝义市', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('727', '汾阳市', '60', '吕梁市', '255', '1');
INSERT INTO `ic_area` VALUES ('728', '市辖区', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('729', '新城区', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('730', '回民区', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('731', '玉泉区', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('732', '赛罕区', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('733', '土默特左旗', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('734', '托克托县', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('735', '和林格尔县', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('736', '清水河县', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('737', '武川县', '61', '呼和浩特市', '255', '1');
INSERT INTO `ic_area` VALUES ('738', '市辖区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('739', '东河区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('740', '昆都仑区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('741', '青山区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('742', '石拐区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('743', '白云矿区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('744', '九原区', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('745', '土默特右旗', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('746', '固阳县', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('747', '达尔罕茂明安联合旗', '62', '包头市', '255', '1');
INSERT INTO `ic_area` VALUES ('748', '市辖区', '63', '乌海市', '255', '1');
INSERT INTO `ic_area` VALUES ('749', '海勃湾区', '63', '乌海市', '255', '1');
INSERT INTO `ic_area` VALUES ('750', '海南区', '63', '乌海市', '255', '1');
INSERT INTO `ic_area` VALUES ('751', '乌达区', '63', '乌海市', '255', '1');
INSERT INTO `ic_area` VALUES ('752', '市辖区', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('753', '红山区', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('754', '元宝山区', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('755', '松山区', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('756', '阿鲁科尔沁旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('757', '巴林左旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('758', '巴林右旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('759', '林西县', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('760', '克什克腾旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('761', '翁牛特旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('762', '喀喇沁旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('763', '宁城县', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('764', '敖汉旗', '64', '赤峰市', '255', '1');
INSERT INTO `ic_area` VALUES ('765', '市辖区', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('766', '科尔沁区', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('767', '科尔沁左翼中旗', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('768', '科尔沁左翼后旗', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('769', '开鲁县', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('770', '库伦旗', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('771', '奈曼旗', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('772', '扎鲁特旗', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('773', '霍林郭勒市', '65', '通辽市', '255', '1');
INSERT INTO `ic_area` VALUES ('774', '东胜区', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('775', '达拉特旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('776', '准格尔旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('777', '鄂托克前旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('778', '鄂托克旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('779', '杭锦旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('780', '乌审旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('781', '伊金霍洛旗', '66', '鄂尔多斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('782', '市辖区', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('783', '海拉尔区', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('784', '阿荣旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('785', '莫力达瓦达斡尔族自治旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('786', '鄂伦春自治旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('787', '鄂温克族自治旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('788', '陈巴尔虎旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('789', '新巴尔虎左旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('790', '新巴尔虎右旗', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('791', '满洲里市', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('792', '牙克石市', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('793', '扎兰屯市', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('794', '额尔古纳市', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('795', '根河市', '67', '呼伦贝尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('796', '市辖区', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('797', '临河区', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('798', '五原县', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('799', '磴口县', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('800', '乌拉特前旗', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('801', '乌拉特中旗', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('802', '乌拉特后旗', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('803', '杭锦后旗', '68', '巴彦淖尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('804', '市辖区', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('805', '集宁区', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('806', '卓资县', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('807', '化德县', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('808', '商都县', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('809', '兴和县', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('810', '凉城县', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('811', '察哈尔右翼前旗', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('812', '察哈尔右翼中旗', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('813', '察哈尔右翼后旗', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('814', '四子王旗', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('815', '丰镇市', '69', '乌兰察布市', '255', '1');
INSERT INTO `ic_area` VALUES ('816', '乌兰浩特市', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('817', '阿尔山市', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('818', '科尔沁右翼前旗', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('819', '科尔沁右翼中旗', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('820', '扎赉特旗', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('821', '突泉县', '70', '兴安盟', '255', '1');
INSERT INTO `ic_area` VALUES ('822', '二连浩特市', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('823', '锡林浩特市', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('824', '阿巴嘎旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('825', '苏尼特左旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('826', '苏尼特右旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('827', '东乌珠穆沁旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('828', '西乌珠穆沁旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('829', '太仆寺旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('830', '镶黄旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('831', '正镶白旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('832', '正蓝旗', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('833', '多伦县', '71', '锡林郭勒盟', '255', '1');
INSERT INTO `ic_area` VALUES ('834', '阿拉善左旗', '72', '阿拉善盟', '255', '1');
INSERT INTO `ic_area` VALUES ('835', '阿拉善右旗', '72', '阿拉善盟', '255', '1');
INSERT INTO `ic_area` VALUES ('836', '额济纳旗', '72', '阿拉善盟', '255', '1');
INSERT INTO `ic_area` VALUES ('837', '市辖区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('838', '和平区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('839', '沈河区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('840', '大东区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('841', '皇姑区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('842', '铁西区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('843', '苏家屯区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('844', '东陵区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('845', '沈北新区*', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('846', '于洪区', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('847', '辽中县', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('848', '康平县', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('849', '法库县', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('850', '新民市', '73', '沈阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('851', '市辖区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('852', '中山区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('853', '西岗区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('854', '沙河口区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('855', '甘井子区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('856', '旅顺口区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('857', '金州区', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('858', '长海县', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('859', '瓦房店市', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('860', '普兰店市', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('861', '庄河市', '74', '大连市', '255', '1');
INSERT INTO `ic_area` VALUES ('862', '市辖区', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('863', '铁东区', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('864', '铁西区', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('865', '立山区', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('866', '千山区', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('867', '台安县', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('868', '岫岩满族自治县', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('869', '海城市', '75', '鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('870', '市辖区', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('871', '新抚区', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('872', '东洲区', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('873', '望花区', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('874', '顺城区', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('875', '抚顺县', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('876', '新宾满族自治县', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('877', '清原满族自治县', '76', '抚顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('878', '市辖区', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('879', '平山区', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('880', '溪湖区', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('881', '明山区', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('882', '南芬区', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('883', '本溪满族自治县', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('884', '桓仁满族自治县', '77', '本溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('885', '市辖区', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('886', '元宝区', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('887', '振兴区', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('888', '振安区', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('889', '宽甸满族自治县', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('890', '东港市', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('891', '凤城市', '78', '丹东市', '255', '1');
INSERT INTO `ic_area` VALUES ('892', '市辖区', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('893', '古塔区', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('894', '凌河区', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('895', '太和区', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('896', '黑山县', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('897', '义县', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('898', '凌海市', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('899', '北镇市*', '79', '锦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('900', '市辖区', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('901', '站前区', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('902', '西市区', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('903', '鲅鱼圈区', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('904', '老边区', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('905', '盖州市', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('906', '大石桥市', '80', '营口市', '255', '1');
INSERT INTO `ic_area` VALUES ('907', '市辖区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('908', '海州区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('909', '新邱区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('910', '太平区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('911', '清河门区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('912', '细河区', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('913', '阜新蒙古族自治县', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('914', '彰武县', '81', '阜新市', '255', '1');
INSERT INTO `ic_area` VALUES ('915', '市辖区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('916', '白塔区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('917', '文圣区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('918', '宏伟区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('919', '弓长岭区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('920', '太子河区', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('921', '辽阳县', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('922', '灯塔市', '82', '辽阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('923', '市辖区', '83', '盘锦市', '255', '1');
INSERT INTO `ic_area` VALUES ('924', '双台子区', '83', '盘锦市', '255', '1');
INSERT INTO `ic_area` VALUES ('925', '兴隆台区', '83', '盘锦市', '255', '1');
INSERT INTO `ic_area` VALUES ('926', '大洼县', '83', '盘锦市', '255', '1');
INSERT INTO `ic_area` VALUES ('927', '盘山县', '83', '盘锦市', '255', '1');
INSERT INTO `ic_area` VALUES ('928', '市辖区', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('929', '银州区', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('930', '清河区', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('931', '铁岭县', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('932', '西丰县', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('933', '昌图县', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('934', '调兵山市', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('935', '开原市', '84', '铁岭市', '255', '1');
INSERT INTO `ic_area` VALUES ('936', '市辖区', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('937', '双塔区', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('938', '龙城区', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('939', '朝阳县', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('940', '建平县', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('941', '喀喇沁左翼蒙古族自治县', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('942', '北票市', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('943', '凌源市', '85', '朝阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('944', '市辖区', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('945', '连山区', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('946', '龙港区', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('947', '南票区', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('948', '绥中县', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('949', '建昌县', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('950', '兴城市', '86', '葫芦岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('951', '市辖区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('952', '南关区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('953', '宽城区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('954', '朝阳区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('955', '二道区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('956', '绿园区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('957', '双阳区', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('958', '农安县', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('959', '九台市', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('960', '榆树市', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('961', '德惠市', '87', '长春市', '255', '1');
INSERT INTO `ic_area` VALUES ('962', '市辖区', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('963', '昌邑区', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('964', '龙潭区', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('965', '船营区', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('966', '丰满区', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('967', '永吉县', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('968', '蛟河市', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('969', '桦甸市', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('970', '舒兰市', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('971', '磐石市', '88', '吉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('972', '市辖区', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('973', '铁西区', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('974', '铁东区', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('975', '梨树县', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('976', '伊通满族自治县', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('977', '公主岭市', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('978', '双辽市', '89', '四平市', '255', '1');
INSERT INTO `ic_area` VALUES ('979', '市辖区', '90', '辽源市', '255', '1');
INSERT INTO `ic_area` VALUES ('980', '龙山区', '90', '辽源市', '255', '1');
INSERT INTO `ic_area` VALUES ('981', '西安区', '90', '辽源市', '255', '1');
INSERT INTO `ic_area` VALUES ('982', '东丰县', '90', '辽源市', '255', '1');
INSERT INTO `ic_area` VALUES ('983', '东辽县', '90', '辽源市', '255', '1');
INSERT INTO `ic_area` VALUES ('984', '市辖区', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('985', '东昌区', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('986', '二道江区', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('987', '通化县', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('988', '辉南县', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('989', '柳河县', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('990', '梅河口市', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('991', '集安市', '91', '通化市', '255', '1');
INSERT INTO `ic_area` VALUES ('992', '市辖区', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('993', '八道江区', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('994', '抚松县', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('995', '靖宇县', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('996', '长白朝鲜族自治县', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('997', '临江市', '92', '白山市', '255', '1');
INSERT INTO `ic_area` VALUES ('998', '市辖区', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('999', '宁江区', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('1000', '前郭尔罗斯蒙古族自治县', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('1001', '长岭县', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('1002', '乾安县', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('1003', '扶余县', '93', '松原市', '255', '1');
INSERT INTO `ic_area` VALUES ('1004', '市辖区', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1005', '洮北区', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1006', '镇赉县', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1007', '通榆县', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1008', '洮南市', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1009', '大安市', '94', '白城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1010', '延吉市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1011', '图们市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1012', '敦化市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1013', '珲春市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1014', '龙井市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1015', '和龙市', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1016', '汪清县', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1017', '安图县', '95', '延边朝鲜族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('1018', '市辖区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1019', '道里区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1020', '南岗区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1021', '道外区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1022', '平房区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1023', '松北区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1024', '香坊区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1025', '呼兰区', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1026', '依兰县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1027', '方正县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1028', '宾县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1029', '巴彦县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1030', '木兰县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1031', '通河县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1032', '延寿县', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1033', '双城市', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1034', '尚志市', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1035', '五常市', '96', '哈尔滨市', '255', '1');
INSERT INTO `ic_area` VALUES ('1036', '市辖区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1037', '龙沙区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1038', '建华区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1039', '铁锋区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1040', '昂昂溪区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1041', '富拉尔基区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1042', '碾子山区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1043', '梅里斯达斡尔族区', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1044', '龙江县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1045', '依安县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1046', '泰来县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1047', '甘南县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1048', '富裕县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1049', '克山县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1050', '克东县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1051', '拜泉县', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1052', '讷河市', '97', '齐齐哈尔市', '255', '1');
INSERT INTO `ic_area` VALUES ('1053', '市辖区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1054', '鸡冠区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1055', '恒山区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1056', '滴道区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1057', '梨树区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1058', '城子河区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1059', '麻山区', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1060', '鸡东县', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1061', '虎林市', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1062', '密山市', '98', '鸡西市', '255', '1');
INSERT INTO `ic_area` VALUES ('1063', '市辖区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1064', '向阳区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1065', '工农区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1066', '南山区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1067', '兴安区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1068', '东山区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1069', '兴山区', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1070', '萝北县', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1071', '绥滨县', '99', '鹤岗市', '255', '1');
INSERT INTO `ic_area` VALUES ('1072', '市辖区', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1073', '尖山区', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1074', '岭东区', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1075', '四方台区', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1076', '宝山区', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1077', '集贤县', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1078', '友谊县', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1079', '宝清县', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1080', '饶河县', '100', '双鸭山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1081', '市辖区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1082', '萨尔图区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1083', '龙凤区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1084', '让胡路区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1085', '红岗区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1086', '大同区', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1087', '肇州县', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1088', '肇源县', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1089', '林甸县', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1090', '杜尔伯特蒙古族自治县', '101', '大庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1091', '市辖区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1092', '伊春区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1093', '南岔区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1094', '友好区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1095', '西林区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1096', '翠峦区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1097', '新青区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1098', '美溪区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1099', '金山屯区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1100', '五营区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1101', '乌马河区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1102', '汤旺河区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1103', '带岭区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1104', '乌伊岭区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1105', '红星区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1106', '上甘岭区', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1107', '嘉荫县', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1108', '铁力市', '102', '伊春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1109', '市辖区', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1110', '向阳区', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1111', '前进区', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1112', '东风区', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1113', '郊区', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1114', '桦南县', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1115', '桦川县', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1116', '汤原县', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1117', '抚远县', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1118', '同江市', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1119', '富锦市', '103', '佳木斯市', '255', '1');
INSERT INTO `ic_area` VALUES ('1120', '市辖区', '104', '七台河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1121', '新兴区', '104', '七台河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1122', '桃山区', '104', '七台河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1123', '茄子河区', '104', '七台河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1124', '勃利县', '104', '七台河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1125', '市辖区', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1126', '东安区', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1127', '阳明区', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1128', '爱民区', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1129', '西安区', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1130', '东宁县', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1131', '林口县', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1132', '绥芬河市', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1133', '海林市', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1134', '宁安市', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1135', '穆棱市', '105', '牡丹江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1136', '市辖区', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1137', '爱辉区', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1138', '嫩江县', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1139', '逊克县', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1140', '孙吴县', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1141', '北安市', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1142', '五大连池市', '106', '黑河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1143', '市辖区', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1144', '北林区', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1145', '望奎县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1146', '兰西县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1147', '青冈县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1148', '庆安县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1149', '明水县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1150', '绥棱县', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1151', '安达市', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1152', '肇东市', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1153', '海伦市', '107', '绥化市', '255', '1');
INSERT INTO `ic_area` VALUES ('1154', '加格达奇区', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1155', '松岭区', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1156', '新林区', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1157', '呼中区', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1158', '呼玛县', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1159', '塔河县', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1160', '漠河县', '108', '大兴安岭地区', '255', '1');
INSERT INTO `ic_area` VALUES ('1161', '黄浦区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1162', '卢湾区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1163', '徐汇区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1164', '长宁区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1165', '静安区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1166', '普陀区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1167', '闸北区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1168', '虹口区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1169', '杨浦区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1170', '闵行区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1171', '宝山区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1172', '嘉定区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1173', '浦东新区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1174', '金山区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1175', '松江区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1176', '青浦区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1177', '南汇区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1178', '奉贤区', '109', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('1179', '崇明县', '110', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('1180', '市辖区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1181', '玄武区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1182', '白下区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1183', '秦淮区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1184', '建邺区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1185', '鼓楼区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1186', '下关区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1187', '浦口区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1188', '栖霞区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1189', '雨花台区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1190', '江宁区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1191', '六合区', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1192', '溧水县', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1193', '高淳县', '111', '南京市', '255', '1');
INSERT INTO `ic_area` VALUES ('1194', '市辖区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1195', '崇安区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1196', '南长区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1197', '北塘区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1198', '锡山区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1199', '惠山区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1200', '滨湖区', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1201', '江阴市', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1202', '宜兴市', '112', '无锡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1203', '市辖区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1204', '鼓楼区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1205', '云龙区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1206', '九里区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1207', '贾汪区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1208', '泉山区', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1209', '丰县', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1210', '沛县', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1211', '铜山县', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1212', '睢宁县', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1213', '新沂市', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1214', '邳州市', '113', '徐州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1215', '市辖区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1216', '天宁区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1217', '钟楼区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1218', '戚墅堰区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1219', '新北区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1220', '武进区', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1221', '溧阳市', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1222', '金坛市', '114', '常州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1223', '市辖区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1224', '沧浪区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1225', '平江区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1226', '金阊区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1227', '虎丘区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1228', '吴中区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1229', '相城区', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1230', '常熟市', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1231', '张家港市', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1232', '昆山市', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1233', '吴江市', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1234', '太仓市', '115', '苏州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1235', '市辖区', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1236', '崇川区', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1237', '港闸区', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1238', '海安县', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1239', '如东县', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1240', '启东市', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1241', '如皋市', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1242', '通州市', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1243', '海门市', '116', '南通市', '255', '1');
INSERT INTO `ic_area` VALUES ('1244', '市辖区', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1245', '连云区', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1246', '新浦区', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1247', '海州区', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1248', '赣榆县', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1249', '东海县', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1250', '灌云县', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1251', '灌南县', '117', '连云港市', '255', '1');
INSERT INTO `ic_area` VALUES ('1252', '市辖区', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1253', '清河区', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1254', '楚州区', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1255', '淮阴区', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1256', '清浦区', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1257', '涟水县', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1258', '洪泽县', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1259', '盱眙县', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1260', '金湖县', '118', '淮安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1261', '市辖区', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1262', '亭湖区', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1263', '盐都区', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1264', '响水县', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1265', '滨海县', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1266', '阜宁县', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1267', '射阳县', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1268', '建湖县', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1269', '东台市', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1270', '大丰市', '119', '盐城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1271', '市辖区', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1272', '广陵区', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1273', '邗江区', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1274', '维扬区', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1275', '宝应县', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1276', '仪征市', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1277', '高邮市', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1278', '江都市', '120', '扬州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1279', '市辖区', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1280', '京口区', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1281', '润州区', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1282', '丹徒区', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1283', '丹阳市', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1284', '扬中市', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1285', '句容市', '121', '镇江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1286', '市辖区', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1287', '海陵区', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1288', '高港区', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1289', '兴化市', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1290', '靖江市', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1291', '泰兴市', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1292', '姜堰市', '122', '泰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1293', '市辖区', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1294', '宿城区', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1295', '宿豫区', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1296', '沭阳县', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1297', '泗阳县', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1298', '泗洪县', '123', '宿迁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1299', '市辖区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1300', '上城区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1301', '下城区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1302', '江干区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1303', '拱墅区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1304', '西湖区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1305', '滨江区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1306', '萧山区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1307', '余杭区', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1308', '桐庐县', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1309', '淳安县', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1310', '建德市', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1311', '富阳市', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1312', '临安市', '124', '杭州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1313', '市辖区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1314', '海曙区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1315', '江东区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1316', '江北区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1317', '北仑区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1318', '镇海区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1319', '鄞州区', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1320', '象山县', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1321', '宁海县', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1322', '余姚市', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1323', '慈溪市', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1324', '奉化市', '125', '宁波市', '255', '1');
INSERT INTO `ic_area` VALUES ('1325', '市辖区', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1326', '鹿城区', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1327', '龙湾区', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1328', '瓯海区', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1329', '洞头县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1330', '永嘉县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1331', '平阳县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1332', '苍南县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1333', '文成县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1334', '泰顺县', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1335', '瑞安市', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1336', '乐清市', '126', '温州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1337', '市辖区', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1338', '秀城区', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1339', '秀洲区', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1340', '嘉善县', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1341', '海盐县', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1342', '海宁市', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1343', '平湖市', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1344', '桐乡市', '127', '嘉兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1345', '市辖区', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1346', '吴兴区', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1347', '南浔区', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1348', '德清县', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1349', '长兴县', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1350', '安吉县', '128', '湖州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1351', '市辖区', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1352', '越城区', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1353', '绍兴县', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1354', '新昌县', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1355', '诸暨市', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1356', '上虞市', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1357', '嵊州市', '129', '绍兴市', '255', '1');
INSERT INTO `ic_area` VALUES ('1358', '市辖区', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1359', '婺城区', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1360', '金东区', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1361', '武义县', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1362', '浦江县', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1363', '磐安县', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1364', '兰溪市', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1365', '义乌市', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1366', '东阳市', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1367', '永康市', '130', '金华市', '255', '1');
INSERT INTO `ic_area` VALUES ('1368', '市辖区', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1369', '柯城区', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1370', '衢江区', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1371', '常山县', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1372', '开化县', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1373', '龙游县', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1374', '江山市', '131', '衢州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1375', '市辖区', '132', '舟山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1376', '定海区', '132', '舟山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1377', '普陀区', '132', '舟山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1378', '岱山县', '132', '舟山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1379', '嵊泗县', '132', '舟山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1380', '市辖区', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1381', '椒江区', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1382', '黄岩区', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1383', '路桥区', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1384', '玉环县', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1385', '三门县', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1386', '天台县', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1387', '仙居县', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1388', '温岭市', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1389', '临海市', '133', '台州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1390', '市辖区', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1391', '莲都区', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1392', '青田县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1393', '缙云县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1394', '遂昌县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1395', '松阳县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1396', '云和县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1397', '庆元县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1398', '景宁畲族自治县', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1399', '龙泉市', '134', '丽水市', '255', '1');
INSERT INTO `ic_area` VALUES ('1400', '市辖区', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1401', '瑶海区', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1402', '庐阳区', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1403', '蜀山区', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1404', '包河区', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1405', '长丰县', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1406', '肥东县', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1407', '肥西县', '135', '合肥市', '255', '1');
INSERT INTO `ic_area` VALUES ('1408', '市辖区', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1409', '镜湖区', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1410', '弋江区', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1411', '鸠江区', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1412', '三山区', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1413', '芜湖县', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1414', '繁昌县', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1415', '南陵县', '136', '芜湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1416', '市辖区', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1417', '龙子湖区', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1418', '蚌山区', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1419', '禹会区', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1420', '淮上区', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1421', '怀远县', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1422', '五河县', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1423', '固镇县', '137', '蚌埠市', '255', '1');
INSERT INTO `ic_area` VALUES ('1424', '市辖区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1425', '大通区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1426', '田家庵区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1427', '谢家集区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1428', '八公山区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1429', '潘集区', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1430', '凤台县', '138', '淮南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1431', '市辖区', '139', '马鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1432', '金家庄区', '139', '马鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1433', '花山区', '139', '马鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1434', '雨山区', '139', '马鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1435', '当涂县', '139', '马鞍山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1436', '市辖区', '140', '淮北市', '255', '1');
INSERT INTO `ic_area` VALUES ('1437', '杜集区', '140', '淮北市', '255', '1');
INSERT INTO `ic_area` VALUES ('1438', '相山区', '140', '淮北市', '255', '1');
INSERT INTO `ic_area` VALUES ('1439', '烈山区', '140', '淮北市', '255', '1');
INSERT INTO `ic_area` VALUES ('1440', '濉溪县', '140', '淮北市', '255', '1');
INSERT INTO `ic_area` VALUES ('1441', '市辖区', '141', '铜陵市', '255', '1');
INSERT INTO `ic_area` VALUES ('1442', '铜官山区', '141', '铜陵市', '255', '1');
INSERT INTO `ic_area` VALUES ('1443', '狮子山区', '141', '铜陵市', '255', '1');
INSERT INTO `ic_area` VALUES ('1444', '郊区', '141', '铜陵市', '255', '1');
INSERT INTO `ic_area` VALUES ('1445', '铜陵县', '141', '铜陵市', '255', '1');
INSERT INTO `ic_area` VALUES ('1446', '市辖区', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1447', '迎江区', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1448', '大观区', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1449', '宜秀区', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1450', '怀宁县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1451', '枞阳县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1452', '潜山县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1453', '太湖县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1454', '宿松县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1455', '望江县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1456', '岳西县', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1457', '桐城市', '142', '安庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('1458', '市辖区', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1459', '屯溪区', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1460', '黄山区', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1461', '徽州区', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1462', '歙县', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1463', '休宁县', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1464', '黟县', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1465', '祁门县', '143', '黄山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1466', '市辖区', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1467', '琅琊区', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1468', '南谯区', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1469', '来安县', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1470', '全椒县', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1471', '定远县', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1472', '凤阳县', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1473', '天长市', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1474', '明光市', '144', '滁州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1475', '市辖区', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1476', '颍州区', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1477', '颍东区', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1478', '颍泉区', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1479', '临泉县', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1480', '太和县', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1481', '阜南县', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1482', '颍上县', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1483', '界首市', '145', '阜阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1484', '市辖区', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1485', '埇桥区', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1486', '砀山县', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1487', '萧县', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1488', '灵璧县', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1489', '泗县', '146', '宿州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1490', '市辖区', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1491', '居巢区', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1492', '庐江县', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1493', '无为县', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1494', '含山县', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1495', '和县', '147', '巢湖市', '255', '1');
INSERT INTO `ic_area` VALUES ('1496', '市辖区', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1497', '金安区', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1498', '裕安区', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1499', '寿县', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1500', '霍邱县', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1501', '舒城县', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1502', '金寨县', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1503', '霍山县', '148', '六安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1504', '市辖区', '149', '亳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1505', '谯城区', '149', '亳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1506', '涡阳县', '149', '亳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1507', '蒙城县', '149', '亳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1508', '利辛县', '149', '亳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1509', '市辖区', '150', '池州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1510', '贵池区', '150', '池州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1511', '东至县', '150', '池州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1512', '石台县', '150', '池州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1513', '青阳县', '150', '池州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1514', '市辖区', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1515', '宣州区', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1516', '郎溪县', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1517', '广德县', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1518', '泾县', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1519', '绩溪县', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1520', '旌德县', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1521', '宁国市', '151', '宣城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1522', '市辖区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1523', '鼓楼区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1524', '台江区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1525', '仓山区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1526', '马尾区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1527', '晋安区', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1528', '闽侯县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1529', '连江县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1530', '罗源县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1531', '闽清县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1532', '永泰县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1533', '平潭县', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1534', '福清市', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1535', '长乐市', '152', '福州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1536', '市辖区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1537', '思明区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1538', '海沧区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1539', '湖里区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1540', '集美区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1541', '同安区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1542', '翔安区', '153', '厦门市', '255', '1');
INSERT INTO `ic_area` VALUES ('1543', '市辖区', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1544', '城厢区', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1545', '涵江区', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1546', '荔城区', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1547', '秀屿区', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1548', '仙游县', '154', '莆田市', '255', '1');
INSERT INTO `ic_area` VALUES ('1549', '市辖区', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1550', '梅列区', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1551', '三元区', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1552', '明溪县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1553', '清流县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1554', '宁化县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1555', '大田县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1556', '尤溪县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1557', '沙县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1558', '将乐县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1559', '泰宁县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1560', '建宁县', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1561', '永安市', '155', '三明市', '255', '1');
INSERT INTO `ic_area` VALUES ('1562', '市辖区', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1563', '鲤城区', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1564', '丰泽区', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1565', '洛江区', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1566', '泉港区', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1567', '惠安县', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1568', '安溪县', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1569', '永春县', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1570', '德化县', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1571', '金门县', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1572', '石狮市', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1573', '晋江市', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1574', '南安市', '156', '泉州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1575', '市辖区', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1576', '芗城区', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1577', '龙文区', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1578', '云霄县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1579', '漳浦县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1580', '诏安县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1581', '长泰县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1582', '东山县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1583', '南靖县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1584', '平和县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1585', '华安县', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1586', '龙海市', '157', '漳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1587', '市辖区', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1588', '延平区', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1589', '顺昌县', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1590', '浦城县', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1591', '光泽县', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1592', '松溪县', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1593', '政和县', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1594', '邵武市', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1595', '武夷山市', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1596', '建瓯市', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1597', '建阳市', '158', '南平市', '255', '1');
INSERT INTO `ic_area` VALUES ('1598', '市辖区', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1599', '新罗区', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1600', '长汀县', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1601', '永定县', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1602', '上杭县', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1603', '武平县', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1604', '连城县', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1605', '漳平市', '159', '龙岩市', '255', '1');
INSERT INTO `ic_area` VALUES ('1606', '市辖区', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1607', '蕉城区', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1608', '霞浦县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1609', '古田县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1610', '屏南县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1611', '寿宁县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1612', '周宁县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1613', '柘荣县', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1614', '福安市', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1615', '福鼎市', '160', '宁德市', '255', '1');
INSERT INTO `ic_area` VALUES ('1616', '市辖区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1617', '东湖区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1618', '西湖区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1619', '青云谱区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1620', '湾里区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1621', '青山湖区', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1622', '南昌县', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1623', '新建县', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1624', '安义县', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1625', '进贤县', '161', '南昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1626', '市辖区', '162', '景德镇市', '255', '1');
INSERT INTO `ic_area` VALUES ('1627', '昌江区', '162', '景德镇市', '255', '1');
INSERT INTO `ic_area` VALUES ('1628', '珠山区', '162', '景德镇市', '255', '1');
INSERT INTO `ic_area` VALUES ('1629', '浮梁县', '162', '景德镇市', '255', '1');
INSERT INTO `ic_area` VALUES ('1630', '乐平市', '162', '景德镇市', '255', '1');
INSERT INTO `ic_area` VALUES ('1631', '市辖区', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1632', '安源区', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1633', '湘东区', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1634', '莲花县', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1635', '上栗县', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1636', '芦溪县', '163', '萍乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1637', '市辖区', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1638', '庐山区', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1639', '浔阳区', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1640', '九江县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1641', '武宁县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1642', '修水县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1643', '永修县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1644', '德安县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1645', '星子县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1646', '都昌县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1647', '湖口县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1648', '彭泽县', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1649', '瑞昌市', '164', '九江市', '255', '1');
INSERT INTO `ic_area` VALUES ('1650', '市辖区', '165', '新余市', '255', '1');
INSERT INTO `ic_area` VALUES ('1651', '渝水区', '165', '新余市', '255', '1');
INSERT INTO `ic_area` VALUES ('1652', '分宜县', '165', '新余市', '255', '1');
INSERT INTO `ic_area` VALUES ('1653', '市辖区', '166', '鹰潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('1654', '月湖区', '166', '鹰潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('1655', '余江县', '166', '鹰潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('1656', '贵溪市', '166', '鹰潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('1657', '市辖区', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1658', '章贡区', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1659', '赣县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1660', '信丰县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1661', '大余县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1662', '上犹县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1663', '崇义县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1664', '安远县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1665', '龙南县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1666', '定南县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1667', '全南县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1668', '宁都县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1669', '于都县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1670', '兴国县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1671', '会昌县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1672', '寻乌县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1673', '石城县', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1674', '瑞金市', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1675', '南康市', '167', '赣州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1676', '市辖区', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1677', '吉州区', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1678', '青原区', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1679', '吉安县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1680', '吉水县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1681', '峡江县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1682', '新干县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1683', '永丰县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1684', '泰和县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1685', '遂川县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1686', '万安县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1687', '安福县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1688', '永新县', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1689', '井冈山市', '168', '吉安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1690', '市辖区', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1691', '袁州区', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1692', '奉新县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1693', '万载县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1694', '上高县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1695', '宜丰县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1696', '靖安县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1697', '铜鼓县', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1698', '丰城市', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1699', '樟树市', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1700', '高安市', '169', '宜春市', '255', '1');
INSERT INTO `ic_area` VALUES ('1701', '市辖区', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1702', '临川区', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1703', '南城县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1704', '黎川县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1705', '南丰县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1706', '崇仁县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1707', '乐安县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1708', '宜黄县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1709', '金溪县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1710', '资溪县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1711', '东乡县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1712', '广昌县', '170', '抚州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1713', '市辖区', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1714', '信州区', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1715', '上饶县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1716', '广丰县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1717', '玉山县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1718', '铅山县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1719', '横峰县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1720', '弋阳县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1721', '余干县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1722', '鄱阳县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1723', '万年县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1724', '婺源县', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1725', '德兴市', '171', '上饶市', '255', '1');
INSERT INTO `ic_area` VALUES ('1726', '市辖区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1727', '历下区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1728', '市中区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1729', '槐荫区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1730', '天桥区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1731', '历城区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1732', '长清区', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1733', '平阴县', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1734', '济阳县', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1735', '商河县', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1736', '章丘市', '172', '济南市', '255', '1');
INSERT INTO `ic_area` VALUES ('1737', '市辖区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1738', '市南区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1739', '市北区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1740', '四方区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1741', '黄岛区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1742', '崂山区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1743', '李沧区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1744', '城阳区', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1745', '胶州市', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1746', '即墨市', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1747', '平度市', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1748', '胶南市', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1749', '莱西市', '173', '青岛市', '255', '1');
INSERT INTO `ic_area` VALUES ('1750', '市辖区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1751', '淄川区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1752', '张店区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1753', '博山区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1754', '临淄区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1755', '周村区', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1756', '桓台县', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1757', '高青县', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1758', '沂源县', '174', '淄博市', '255', '1');
INSERT INTO `ic_area` VALUES ('1759', '市辖区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1760', '市中区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1761', '薛城区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1762', '峄城区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1763', '台儿庄区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1764', '山亭区', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1765', '滕州市', '175', '枣庄市', '255', '1');
INSERT INTO `ic_area` VALUES ('1766', '市辖区', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1767', '东营区', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1768', '河口区', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1769', '垦利县', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1770', '利津县', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1771', '广饶县', '176', '东营市', '255', '1');
INSERT INTO `ic_area` VALUES ('1772', '市辖区', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1773', '芝罘区', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1774', '福山区', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1775', '牟平区', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1776', '莱山区', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1777', '长岛县', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1778', '龙口市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1779', '莱阳市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1780', '莱州市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1781', '蓬莱市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1782', '招远市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1783', '栖霞市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1784', '海阳市', '177', '烟台市', '255', '1');
INSERT INTO `ic_area` VALUES ('1785', '市辖区', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1786', '潍城区', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1787', '寒亭区', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1788', '坊子区', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1789', '奎文区', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1790', '临朐县', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1791', '昌乐县', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1792', '青州市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1793', '诸城市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1794', '寿光市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1795', '安丘市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1796', '高密市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1797', '昌邑市', '178', '潍坊市', '255', '1');
INSERT INTO `ic_area` VALUES ('1798', '市辖区', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1799', '市中区', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1800', '任城区', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1801', '微山县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1802', '鱼台县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1803', '金乡县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1804', '嘉祥县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1805', '汶上县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1806', '泗水县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1807', '梁山县', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1808', '曲阜市', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1809', '兖州市', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1810', '邹城市', '179', '济宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1811', '市辖区', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1812', '泰山区', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1813', '岱岳区', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1814', '宁阳县', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1815', '东平县', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1816', '新泰市', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1817', '肥城市', '180', '泰安市', '255', '1');
INSERT INTO `ic_area` VALUES ('1818', '市辖区', '181', '威海市', '255', '1');
INSERT INTO `ic_area` VALUES ('1819', '环翠区', '181', '威海市', '255', '1');
INSERT INTO `ic_area` VALUES ('1820', '文登市', '181', '威海市', '255', '1');
INSERT INTO `ic_area` VALUES ('1821', '荣成市', '181', '威海市', '255', '1');
INSERT INTO `ic_area` VALUES ('1822', '乳山市', '181', '威海市', '255', '1');
INSERT INTO `ic_area` VALUES ('1823', '市辖区', '182', '日照市', '255', '1');
INSERT INTO `ic_area` VALUES ('1824', '东港区', '182', '日照市', '255', '1');
INSERT INTO `ic_area` VALUES ('1825', '岚山区', '182', '日照市', '255', '1');
INSERT INTO `ic_area` VALUES ('1826', '五莲县', '182', '日照市', '255', '1');
INSERT INTO `ic_area` VALUES ('1827', '莒县', '182', '日照市', '255', '1');
INSERT INTO `ic_area` VALUES ('1828', '市辖区', '183', '莱芜市', '255', '1');
INSERT INTO `ic_area` VALUES ('1829', '莱城区', '183', '莱芜市', '255', '1');
INSERT INTO `ic_area` VALUES ('1830', '钢城区', '183', '莱芜市', '255', '1');
INSERT INTO `ic_area` VALUES ('1831', '市辖区', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1832', '兰山区', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1833', '罗庄区', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1834', '河东区', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1835', '沂南县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1836', '郯城县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1837', '沂水县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1838', '苍山县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1839', '费县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1840', '平邑县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1841', '莒南县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1842', '蒙阴县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1843', '临沭县', '184', '临沂市', '255', '1');
INSERT INTO `ic_area` VALUES ('1844', '市辖区', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1845', '德城区', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1846', '陵县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1847', '宁津县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1848', '庆云县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1849', '临邑县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1850', '齐河县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1851', '平原县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1852', '夏津县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1853', '武城县', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1854', '乐陵市', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1855', '禹城市', '185', '德州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1856', '市辖区', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1857', '东昌府区', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1858', '阳谷县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1859', '莘县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1860', '茌平县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1861', '东阿县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1862', '冠县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1863', '高唐县', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1864', '临清市', '186', '聊城市', '255', '1');
INSERT INTO `ic_area` VALUES ('1865', '市辖区', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1866', '滨城区', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1867', '惠民县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1868', '阳信县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1869', '无棣县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1870', '沾化县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1871', '博兴县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1872', '邹平县', '187', '滨州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1873', '市辖区', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1874', '牡丹区', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1875', '曹县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1876', '单县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1877', '成武县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1878', '巨野县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1879', '郓城县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1880', '鄄城县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1881', '定陶县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1882', '东明县', '188', '菏泽市', '255', '1');
INSERT INTO `ic_area` VALUES ('1883', '市辖区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1884', '中原区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1885', '二七区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1886', '管城回族区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1887', '金水区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1888', '上街区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1889', '惠济区', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1890', '中牟县', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1891', '巩义市', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1892', '荥阳市', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1893', '新密市', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1894', '新郑市', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1895', '登封市', '189', '郑州市', '255', '1');
INSERT INTO `ic_area` VALUES ('1896', '市辖区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1897', '龙亭区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1898', '顺河回族区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1899', '鼓楼区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1900', '禹王台区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1901', '金明区', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1902', '杞县', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1903', '通许县', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1904', '尉氏县', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1905', '开封县', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1906', '兰考县', '190', '开封市', '255', '1');
INSERT INTO `ic_area` VALUES ('1907', '市辖区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1908', '老城区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1909', '西工区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1910', '廛河回族区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1911', '涧西区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1912', '吉利区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1913', '洛龙区', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1914', '孟津县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1915', '新安县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1916', '栾川县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1917', '嵩县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1918', '汝阳县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1919', '宜阳县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1920', '洛宁县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1921', '伊川县', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1922', '偃师市', '191', '洛阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1923', '市辖区', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1924', '新华区', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1925', '卫东区', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1926', '石龙区', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1927', '湛河区', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1928', '宝丰县', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1929', '叶县', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1930', '鲁山县', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1931', '郏县', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1932', '舞钢市', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1933', '汝州市', '192', '平顶山市', '255', '1');
INSERT INTO `ic_area` VALUES ('1934', '市辖区', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1935', '文峰区', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1936', '北关区', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1937', '殷都区', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1938', '龙安区', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1939', '安阳县', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1940', '汤阴县', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1941', '滑县', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1942', '内黄县', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1943', '林州市', '193', '安阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1944', '市辖区', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1945', '鹤山区', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1946', '山城区', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1947', '淇滨区', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1948', '浚县', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1949', '淇县', '194', '鹤壁市', '255', '1');
INSERT INTO `ic_area` VALUES ('1950', '市辖区', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1951', '红旗区', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1952', '卫滨区', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1953', '凤泉区', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1954', '牧野区', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1955', '新乡县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1956', '获嘉县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1957', '原阳县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1958', '延津县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1959', '封丘县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1960', '长垣县', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1961', '卫辉市', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1962', '辉县市', '195', '新乡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1963', '市辖区', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1964', '解放区', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1965', '中站区', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1966', '马村区', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1967', '山阳区', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1968', '修武县', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1969', '博爱县', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1970', '武陟县', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1971', '温县', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1972', '济源市', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1973', '沁阳市', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1974', '孟州市', '196', '焦作市', '255', '1');
INSERT INTO `ic_area` VALUES ('1975', '市辖区', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1976', '华龙区', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1977', '清丰县', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1978', '南乐县', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1979', '范县', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1980', '台前县', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1981', '濮阳县', '197', '濮阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('1982', '市辖区', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1983', '魏都区', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1984', '许昌县', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1985', '鄢陵县', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1986', '襄城县', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1987', '禹州市', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1988', '长葛市', '198', '许昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('1989', '市辖区', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1990', '源汇区', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1991', '郾城区', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1992', '召陵区', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1993', '舞阳县', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1994', '临颍县', '199', '漯河市', '255', '1');
INSERT INTO `ic_area` VALUES ('1995', '市辖区', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1996', '湖滨区', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1997', '渑池县', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1998', '陕县', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('1999', '卢氏县', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2000', '义马市', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2001', '灵宝市', '200', '三门峡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2002', '市辖区', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2003', '宛城区', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2004', '卧龙区', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2005', '南召县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2006', '方城县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2007', '西峡县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2008', '镇平县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2009', '内乡县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2010', '淅川县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2011', '社旗县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2012', '唐河县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2013', '新野县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2014', '桐柏县', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2015', '邓州市', '201', '南阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2016', '市辖区', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2017', '梁园区', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2018', '睢阳区', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2019', '民权县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2020', '睢县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2021', '宁陵县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2022', '柘城县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2023', '虞城县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2024', '夏邑县', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2025', '永城市', '202', '商丘市', '255', '1');
INSERT INTO `ic_area` VALUES ('2026', '市辖区', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2027', '浉河区', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2028', '平桥区', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2029', '罗山县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2030', '光山县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2031', '新县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2032', '商城县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2033', '固始县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2034', '潢川县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2035', '淮滨县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2036', '息县', '203', '信阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2037', '市辖区', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2038', '川汇区', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2039', '扶沟县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2040', '西华县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2041', '商水县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2042', '沈丘县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2043', '郸城县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2044', '淮阳县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2045', '太康县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2046', '鹿邑县', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2047', '项城市', '204', '周口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2048', '市辖区', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2049', '驿城区', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2050', '西平县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2051', '上蔡县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2052', '平舆县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2053', '正阳县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2054', '确山县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2055', '泌阳县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2056', '汝南县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2057', '遂平县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2058', '新蔡县', '205', '驻马店市', '255', '1');
INSERT INTO `ic_area` VALUES ('2059', '市辖区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2060', '江岸区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2061', '江汉区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2062', '硚口区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2063', '汉阳区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2064', '武昌区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2065', '青山区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2066', '洪山区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2067', '东西湖区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2068', '汉南区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2069', '蔡甸区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2070', '江夏区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2071', '黄陂区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2072', '新洲区', '206', '武汉市', '255', '1');
INSERT INTO `ic_area` VALUES ('2073', '市辖区', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2074', '黄石港区', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2075', '西塞山区', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2076', '下陆区', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2077', '铁山区', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2078', '阳新县', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2079', '大冶市', '207', '黄石市', '255', '1');
INSERT INTO `ic_area` VALUES ('2080', '市辖区', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2081', '茅箭区', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2082', '张湾区', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2083', '郧县', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2084', '郧西县', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2085', '竹山县', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2086', '竹溪县', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2087', '房县', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2088', '丹江口市', '208', '十堰市', '255', '1');
INSERT INTO `ic_area` VALUES ('2089', '市辖区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2090', '西陵区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2091', '伍家岗区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2092', '点军区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2093', '猇亭区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2094', '夷陵区', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2095', '远安县', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2096', '兴山县', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2097', '秭归县', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2098', '长阳土家族自治县', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2099', '五峰土家族自治县', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2100', '宜都市', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2101', '当阳市', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2102', '枝江市', '209', '宜昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('2103', '市辖区', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2104', '襄城区', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2105', '樊城区', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2106', '襄阳区', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2107', '南漳县', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2108', '谷城县', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2109', '保康县', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2110', '老河口市', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2111', '枣阳市', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2112', '宜城市', '210', '襄樊市', '255', '1');
INSERT INTO `ic_area` VALUES ('2113', '市辖区', '211', '鄂州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2114', '梁子湖区', '211', '鄂州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2115', '华容区', '211', '鄂州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2116', '鄂城区', '211', '鄂州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2117', '市辖区', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2118', '东宝区', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2119', '掇刀区', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2120', '京山县', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2121', '沙洋县', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2122', '钟祥市', '212', '荆门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2123', '市辖区', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2124', '孝南区', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2125', '孝昌县', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2126', '大悟县', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2127', '云梦县', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2128', '应城市', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2129', '安陆市', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2130', '汉川市', '213', '孝感市', '255', '1');
INSERT INTO `ic_area` VALUES ('2131', '市辖区', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2132', '沙市区', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2133', '荆州区', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2134', '公安县', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2135', '监利县', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2136', '江陵县', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2137', '石首市', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2138', '洪湖市', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2139', '松滋市', '214', '荆州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2140', '市辖区', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2141', '黄州区', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2142', '团风县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2143', '红安县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2144', '罗田县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2145', '英山县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2146', '浠水县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2147', '蕲春县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2148', '黄梅县', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2149', '麻城市', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2150', '武穴市', '215', '黄冈市', '255', '1');
INSERT INTO `ic_area` VALUES ('2151', '市辖区', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2152', '咸安区', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2153', '嘉鱼县', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2154', '通城县', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2155', '崇阳县', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2156', '通山县', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2157', '赤壁市', '216', '咸宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2158', '市辖区', '217', '随州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2159', '曾都区', '217', '随州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2160', '广水市', '217', '随州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2161', '恩施市', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2162', '利川市', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2163', '建始县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2164', '巴东县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2165', '宣恩县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2166', '咸丰县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2167', '来凤县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2168', '鹤峰县', '218', '恩施土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2169', '仙桃市', '219', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2170', '潜江市', '219', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2171', '天门市', '219', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2172', '神农架林区', '219', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2173', '市辖区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2174', '芙蓉区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2175', '天心区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2176', '岳麓区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2177', '开福区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2178', '雨花区', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2179', '长沙县', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2180', '望城县', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2181', '宁乡县', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2182', '浏阳市', '220', '长沙市', '255', '1');
INSERT INTO `ic_area` VALUES ('2183', '市辖区', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2184', '荷塘区', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2185', '芦淞区', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2186', '石峰区', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2187', '天元区', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2188', '株洲县', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2189', '攸县', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2190', '茶陵县', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2191', '炎陵县', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2192', '醴陵市', '221', '株洲市', '255', '1');
INSERT INTO `ic_area` VALUES ('2193', '市辖区', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2194', '雨湖区', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2195', '岳塘区', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2196', '湘潭县', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2197', '湘乡市', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2198', '韶山市', '222', '湘潭市', '255', '1');
INSERT INTO `ic_area` VALUES ('2199', '市辖区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2200', '珠晖区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2201', '雁峰区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2202', '石鼓区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2203', '蒸湘区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2204', '南岳区', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2205', '衡阳县', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2206', '衡南县', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2207', '衡山县', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2208', '衡东县', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2209', '祁东县', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2210', '耒阳市', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2211', '常宁市', '223', '衡阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2212', '市辖区', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2213', '双清区', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2214', '大祥区', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2215', '北塔区', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2216', '邵东县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2217', '新邵县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2218', '邵阳县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2219', '隆回县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2220', '洞口县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2221', '绥宁县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2222', '新宁县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2223', '城步苗族自治县', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2224', '武冈市', '224', '邵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2225', '市辖区', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2226', '岳阳楼区', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2227', '云溪区', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2228', '君山区', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2229', '岳阳县', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2230', '华容县', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2231', '湘阴县', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2232', '平江县', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2233', '汨罗市', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2234', '临湘市', '225', '岳阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2235', '市辖区', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2236', '武陵区', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2237', '鼎城区', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2238', '安乡县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2239', '汉寿县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2240', '澧县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2241', '临澧县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2242', '桃源县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2243', '石门县', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2244', '津市市', '226', '常德市', '255', '1');
INSERT INTO `ic_area` VALUES ('2245', '市辖区', '227', '张家界市', '255', '1');
INSERT INTO `ic_area` VALUES ('2246', '永定区', '227', '张家界市', '255', '1');
INSERT INTO `ic_area` VALUES ('2247', '武陵源区', '227', '张家界市', '255', '1');
INSERT INTO `ic_area` VALUES ('2248', '慈利县', '227', '张家界市', '255', '1');
INSERT INTO `ic_area` VALUES ('2249', '桑植县', '227', '张家界市', '255', '1');
INSERT INTO `ic_area` VALUES ('2250', '市辖区', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2251', '资阳区', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2252', '赫山区', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2253', '南县', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2254', '桃江县', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2255', '安化县', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2256', '沅江市', '228', '益阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2257', '市辖区', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2258', '北湖区', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2259', '苏仙区', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2260', '桂阳县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2261', '宜章县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2262', '永兴县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2263', '嘉禾县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2264', '临武县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2265', '汝城县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2266', '桂东县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2267', '安仁县', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2268', '资兴市', '229', '郴州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2269', '市辖区', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2270', '零陵区', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2271', '冷水滩区', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2272', '祁阳县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2273', '东安县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2274', '双牌县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2275', '道县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2276', '江永县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2277', '宁远县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2278', '蓝山县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2279', '新田县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2280', '江华瑶族自治县', '230', '永州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2281', '市辖区', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2282', '鹤城区', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2283', '中方县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2284', '沅陵县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2285', '辰溪县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2286', '溆浦县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2287', '会同县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2288', '麻阳苗族自治县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2289', '新晃侗族自治县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2290', '芷江侗族自治县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2291', '靖州苗族侗族自治县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2292', '通道侗族自治县', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2293', '洪江市', '231', '怀化市', '255', '1');
INSERT INTO `ic_area` VALUES ('2294', '市辖区', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2295', '娄星区', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2296', '双峰县', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2297', '新化县', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2298', '冷水江市', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2299', '涟源市', '232', '娄底市', '255', '1');
INSERT INTO `ic_area` VALUES ('2300', '吉首市', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2301', '泸溪县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2302', '凤凰县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2303', '花垣县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2304', '保靖县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2305', '古丈县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2306', '永顺县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2307', '龙山县', '233', '湘西土家族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2308', '市辖区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2309', '荔湾区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2310', '越秀区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2311', '海珠区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2312', '天河区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2313', '白云区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2314', '黄埔区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2315', '番禺区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2316', '花都区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2317', '南沙区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2318', '萝岗区', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2319', '增城市', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2320', '从化市', '234', '广州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2321', '市辖区', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2322', '武江区', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2323', '浈江区', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2324', '曲江区', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2325', '始兴县', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2326', '仁化县', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2327', '翁源县', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2328', '乳源瑶族自治县', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2329', '新丰县', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2330', '乐昌市', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2331', '南雄市', '235', '韶关市', '255', '1');
INSERT INTO `ic_area` VALUES ('2332', '市辖区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2333', '罗湖区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2334', '福田区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2335', '南山区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2336', '宝安区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2337', '龙岗区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2338', '盐田区', '236', '深圳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2339', '市辖区', '237', '珠海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2340', '香洲区', '237', '珠海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2341', '斗门区', '237', '珠海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2342', '金湾区', '237', '珠海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2343', '市辖区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2344', '龙湖区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2345', '金平区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2346', '濠江区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2347', '潮阳区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2348', '潮南区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2349', '澄海区', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2350', '南澳县', '238', '汕头市', '255', '1');
INSERT INTO `ic_area` VALUES ('2351', '市辖区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2352', '禅城区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2353', '南海区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2354', '顺德区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2355', '三水区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2356', '高明区', '239', '佛山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2357', '市辖区', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2358', '蓬江区', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2359', '江海区', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2360', '新会区', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2361', '台山市', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2362', '开平市', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2363', '鹤山市', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2364', '恩平市', '240', '江门市', '255', '1');
INSERT INTO `ic_area` VALUES ('2365', '市辖区', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2366', '赤坎区', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2367', '霞山区', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2368', '坡头区', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2369', '麻章区', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2370', '遂溪县', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2371', '徐闻县', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2372', '廉江市', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2373', '雷州市', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2374', '吴川市', '241', '湛江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2375', '市辖区', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2376', '茂南区', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2377', '茂港区', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2378', '电白县', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2379', '高州市', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2380', '化州市', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2381', '信宜市', '242', '茂名市', '255', '1');
INSERT INTO `ic_area` VALUES ('2382', '市辖区', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2383', '端州区', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2384', '鼎湖区', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2385', '广宁县', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2386', '怀集县', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2387', '封开县', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2388', '德庆县', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2389', '高要市', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2390', '四会市', '243', '肇庆市', '255', '1');
INSERT INTO `ic_area` VALUES ('2391', '市辖区', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2392', '惠城区', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2393', '惠阳区', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2394', '博罗县', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2395', '惠东县', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2396', '龙门县', '244', '惠州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2397', '市辖区', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2398', '梅江区', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2399', '梅县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2400', '大埔县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2401', '丰顺县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2402', '五华县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2403', '平远县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2404', '蕉岭县', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2405', '兴宁市', '245', '梅州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2406', '市辖区', '246', '汕尾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2407', '城区', '246', '汕尾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2408', '海丰县', '246', '汕尾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2409', '陆河县', '246', '汕尾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2410', '陆丰市', '246', '汕尾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2411', '市辖区', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2412', '源城区', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2413', '紫金县', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2414', '龙川县', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2415', '连平县', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2416', '和平县', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2417', '东源县', '247', '河源市', '255', '1');
INSERT INTO `ic_area` VALUES ('2418', '市辖区', '248', '阳江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2419', '江城区', '248', '阳江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2420', '阳西县', '248', '阳江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2421', '阳东县', '248', '阳江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2422', '阳春市', '248', '阳江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2423', '市辖区', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2424', '清城区', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2425', '佛冈县', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2426', '阳山县', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2427', '连山壮族瑶族自治县', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2428', '连南瑶族自治县', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2429', '清新县', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2430', '英德市', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2431', '连州市', '249', '清远市', '255', '1');
INSERT INTO `ic_area` VALUES ('2432', '市辖区', '252', '潮州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2433', '湘桥区', '252', '潮州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2434', '潮安县', '252', '潮州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2435', '饶平县', '252', '潮州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2436', '市辖区', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2437', '榕城区', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2438', '揭东县', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2439', '揭西县', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2440', '惠来县', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2441', '普宁市', '253', '揭阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2442', '市辖区', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2443', '云城区', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2444', '新兴县', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2445', '郁南县', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2446', '云安县', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2447', '罗定市', '254', '云浮市', '255', '1');
INSERT INTO `ic_area` VALUES ('2448', '市辖区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2449', '兴宁区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2450', '青秀区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2451', '江南区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2452', '西乡塘区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2453', '良庆区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2454', '邕宁区', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2455', '武鸣县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2456', '隆安县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2457', '马山县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2458', '上林县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2459', '宾阳县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2460', '横县', '255', '南宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2461', '市辖区', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2462', '城中区', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2463', '鱼峰区', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2464', '柳南区', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2465', '柳北区', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2466', '柳江县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2467', '柳城县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2468', '鹿寨县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2469', '融安县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2470', '融水苗族自治县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2471', '三江侗族自治县', '256', '柳州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2472', '市辖区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2473', '秀峰区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2474', '叠彩区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2475', '象山区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2476', '七星区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2477', '雁山区', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2478', '阳朔县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2479', '临桂县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2480', '灵川县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2481', '全州县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2482', '兴安县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2483', '永福县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2484', '灌阳县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2485', '龙胜各族自治县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2486', '资源县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2487', '平乐县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2488', '荔蒲县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2489', '恭城瑶族自治县', '257', '桂林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2490', '市辖区', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2491', '万秀区', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2492', '蝶山区', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2493', '长洲区', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2494', '苍梧县', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2495', '藤县', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2496', '蒙山县', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2497', '岑溪市', '258', '梧州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2498', '市辖区', '259', '北海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2499', '海城区', '259', '北海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2500', '银海区', '259', '北海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2501', '铁山港区', '259', '北海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2502', '合浦县', '259', '北海市', '255', '1');
INSERT INTO `ic_area` VALUES ('2503', '市辖区', '260', '防城港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2504', '港口区', '260', '防城港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2505', '防城区', '260', '防城港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2506', '上思县', '260', '防城港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2507', '东兴市', '260', '防城港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2508', '市辖区', '261', '钦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2509', '钦南区', '261', '钦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2510', '钦北区', '261', '钦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2511', '灵山县', '261', '钦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2512', '浦北县', '261', '钦州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2513', '市辖区', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2514', '港北区', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2515', '港南区', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2516', '覃塘区', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2517', '平南县', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2518', '桂平市', '262', '贵港市', '255', '1');
INSERT INTO `ic_area` VALUES ('2519', '市辖区', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2520', '玉州区', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2521', '容县', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2522', '陆川县', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2523', '博白县', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2524', '兴业县', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2525', '北流市', '263', '玉林市', '255', '1');
INSERT INTO `ic_area` VALUES ('2526', '市辖区', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2527', '右江区', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2528', '田阳县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2529', '田东县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2530', '平果县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2531', '德保县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2532', '靖西县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2533', '那坡县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2534', '凌云县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2535', '乐业县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2536', '田林县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2537', '西林县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2538', '隆林各族自治县', '264', '百色市', '255', '1');
INSERT INTO `ic_area` VALUES ('2539', '市辖区', '265', '贺州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2540', '八步区', '265', '贺州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2541', '昭平县', '265', '贺州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2542', '钟山县', '265', '贺州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2543', '富川瑶族自治县', '265', '贺州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2544', '市辖区', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2545', '金城江区', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2546', '南丹县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2547', '天峨县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2548', '凤山县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2549', '东兰县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2550', '罗城仫佬族自治县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2551', '环江毛南族自治县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2552', '巴马瑶族自治县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2553', '都安瑶族自治县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2554', '大化瑶族自治县', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2555', '宜州市', '266', '河池市', '255', '1');
INSERT INTO `ic_area` VALUES ('2556', '市辖区', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2557', '兴宾区', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2558', '忻城县', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2559', '象州县', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2560', '武宣县', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2561', '金秀瑶族自治县', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2562', '合山市', '267', '来宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2563', '市辖区', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2564', '江洲区', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2565', '扶绥县', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2566', '宁明县', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2567', '龙州县', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2568', '大新县', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2569', '天等县', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2570', '凭祥市', '268', '崇左市', '255', '1');
INSERT INTO `ic_area` VALUES ('2571', '市辖区', '269', '海口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2572', '秀英区', '269', '海口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2573', '龙华区', '269', '海口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2574', '琼山区', '269', '海口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2575', '美兰区', '269', '海口市', '255', '1');
INSERT INTO `ic_area` VALUES ('2576', '市辖区', '270', '三亚市', '255', '1');
INSERT INTO `ic_area` VALUES ('2577', '五指山市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2578', '琼海市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2579', '儋州市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2580', '文昌市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2581', '万宁市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2582', '东方市', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2583', '定安县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2584', '屯昌县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2585', '澄迈县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2586', '临高县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2587', '白沙黎族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2588', '昌江黎族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2589', '乐东黎族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2590', '陵水黎族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2591', '保亭黎族苗族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2592', '琼中黎族苗族自治县', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2593', '西沙群岛', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2594', '南沙群岛', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2595', '中沙群岛的岛礁及其海域', '271', '省直辖县级行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('2596', '万州区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2597', '涪陵区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2598', '渝中区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2599', '大渡口区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2600', '江北区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2601', '沙坪坝区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2602', '九龙坡区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2603', '南岸区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2604', '北碚区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2605', '万盛区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2606', '双桥区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2607', '渝北区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2608', '巴南区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2609', '黔江区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2610', '长寿区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2611', '江津区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2612', '合川区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2613', '永川区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2614', '南川区', '272', '市辖区', '255', '1');
INSERT INTO `ic_area` VALUES ('2615', '綦江县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2616', '潼南县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2617', '铜梁县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2618', '大足县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2619', '荣昌县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2620', '璧山县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2621', '梁平县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2622', '城口县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2623', '丰都县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2624', '垫江县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2625', '武隆县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2626', '忠县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2627', '开县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2628', '云阳县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2629', '奉节县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2630', '巫山县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2631', '巫溪县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2632', '石柱土家族自治县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2633', '秀山土家族苗族自治县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2634', '酉阳土家族苗族自治县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2635', '彭水苗族土家族自治县', '273', '县', '255', '1');
INSERT INTO `ic_area` VALUES ('2636', '市辖区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2637', '锦江区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2638', '青羊区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2639', '金牛区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2640', '武侯区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2641', '成华区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2642', '龙泉驿区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2643', '青白江区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2644', '新都区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2645', '温江区', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2646', '金堂县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2647', '双流县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2648', '郫县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2649', '大邑县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2650', '蒲江县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2651', '新津县', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2652', '都江堰市', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2653', '彭州市', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2654', '邛崃市', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2655', '崇州市', '274', '成都市', '255', '1');
INSERT INTO `ic_area` VALUES ('2656', '市辖区', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2657', '自流井区', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2658', '贡井区', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2659', '大安区', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2660', '沿滩区', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2661', '荣县', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2662', '富顺县', '275', '自贡市', '255', '1');
INSERT INTO `ic_area` VALUES ('2663', '市辖区', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2664', '东区', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2665', '西区', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2666', '仁和区', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2667', '米易县', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2668', '盐边县', '276', '攀枝花市', '255', '1');
INSERT INTO `ic_area` VALUES ('2669', '市辖区', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2670', '江阳区', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2671', '纳溪区', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2672', '龙马潭区', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2673', '泸县', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2674', '合江县', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2675', '叙永县', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2676', '古蔺县', '277', '泸州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2677', '市辖区', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2678', '旌阳区', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2679', '中江县', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2680', '罗江县', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2681', '广汉市', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2682', '什邡市', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2683', '绵竹市', '278', '德阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2684', '市辖区', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2685', '涪城区', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2686', '游仙区', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2687', '三台县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2688', '盐亭县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2689', '安县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2690', '梓潼县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2691', '北川羌族自治县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2692', '平武县', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2693', '江油市', '279', '绵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2694', '市辖区', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2695', '市中区', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2696', '元坝区', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2697', '朝天区', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2698', '旺苍县', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2699', '青川县', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2700', '剑阁县', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2701', '苍溪县', '280', '广元市', '255', '1');
INSERT INTO `ic_area` VALUES ('2702', '市辖区', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2703', '船山区', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2704', '安居区', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2705', '蓬溪县', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2706', '射洪县', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2707', '大英县', '281', '遂宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('2708', '市辖区', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2709', '市中区', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2710', '东兴区', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2711', '威远县', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2712', '资中县', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2713', '隆昌县', '282', '内江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2714', '市辖区', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2715', '市中区', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2716', '沙湾区', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2717', '五通桥区', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2718', '金口河区', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2719', '犍为县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2720', '井研县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2721', '夹江县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2722', '沐川县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2723', '峨边彝族自治县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2724', '马边彝族自治县', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2725', '峨眉山市', '283', '乐山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2726', '市辖区', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2727', '顺庆区', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2728', '高坪区', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2729', '嘉陵区', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2730', '南部县', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2731', '营山县', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2732', '蓬安县', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2733', '仪陇县', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2734', '西充县', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2735', '阆中市', '284', '南充市', '255', '1');
INSERT INTO `ic_area` VALUES ('2736', '市辖区', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2737', '东坡区', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2738', '仁寿县', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2739', '彭山县', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2740', '洪雅县', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2741', '丹棱县', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2742', '青神县', '285', '眉山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2743', '市辖区', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2744', '翠屏区', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2745', '宜宾县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2746', '南溪县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2747', '江安县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2748', '长宁县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2749', '高县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2750', '珙县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2751', '筠连县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2752', '兴文县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2753', '屏山县', '286', '宜宾市', '255', '1');
INSERT INTO `ic_area` VALUES ('2754', '市辖区', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2755', '广安区', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2756', '岳池县', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2757', '武胜县', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2758', '邻水县', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2759', '华蓥市', '287', '广安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2760', '市辖区', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2761', '通川区', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2762', '达县', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2763', '宣汉县', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2764', '开江县', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2765', '大竹县', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2766', '渠县', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2767', '万源市', '288', '达州市', '255', '1');
INSERT INTO `ic_area` VALUES ('2768', '市辖区', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2769', '雨城区', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2770', '名山县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2771', '荥经县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2772', '汉源县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2773', '石棉县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2774', '天全县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2775', '芦山县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2776', '宝兴县', '289', '雅安市', '255', '1');
INSERT INTO `ic_area` VALUES ('2777', '市辖区', '290', '巴中市', '255', '1');
INSERT INTO `ic_area` VALUES ('2778', '巴州区', '290', '巴中市', '255', '1');
INSERT INTO `ic_area` VALUES ('2779', '通江县', '290', '巴中市', '255', '1');
INSERT INTO `ic_area` VALUES ('2780', '南江县', '290', '巴中市', '255', '1');
INSERT INTO `ic_area` VALUES ('2781', '平昌县', '290', '巴中市', '255', '1');
INSERT INTO `ic_area` VALUES ('2782', '市辖区', '291', '资阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2783', '雁江区', '291', '资阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2784', '安岳县', '291', '资阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2785', '乐至县', '291', '资阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2786', '简阳市', '291', '资阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2787', '汶川县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2788', '理县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2789', '茂县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2790', '松潘县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2791', '九寨沟县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2792', '金川县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2793', '小金县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2794', '黑水县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2795', '马尔康县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2796', '壤塘县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2797', '阿坝县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2798', '若尔盖县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2799', '红原县', '292', '阿坝藏族羌族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2800', '康定县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2801', '泸定县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2802', '丹巴县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2803', '九龙县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2804', '雅江县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2805', '道孚县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2806', '炉霍县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2807', '甘孜县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2808', '新龙县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2809', '德格县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2810', '白玉县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2811', '石渠县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2812', '色达县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2813', '理塘县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2814', '巴塘县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2815', '乡城县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2816', '稻城县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2817', '得荣县', '293', '甘孜藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2818', '西昌市', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2819', '木里藏族自治县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2820', '盐源县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2821', '德昌县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2822', '会理县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2823', '会东县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2824', '宁南县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2825', '普格县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2826', '布拖县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2827', '金阳县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2828', '昭觉县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2829', '喜德县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2830', '冕宁县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2831', '越西县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2832', '甘洛县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2833', '美姑县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2834', '雷波县', '294', '凉山彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2835', '市辖区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2836', '南明区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2837', '云岩区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2838', '花溪区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2839', '乌当区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2840', '白云区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2841', '小河区', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2842', '开阳县', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2843', '息烽县', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2844', '修文县', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2845', '清镇市', '295', '贵阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('2846', '钟山区', '296', '六盘水市', '255', '1');
INSERT INTO `ic_area` VALUES ('2847', '六枝特区', '296', '六盘水市', '255', '1');
INSERT INTO `ic_area` VALUES ('2848', '水城县', '296', '六盘水市', '255', '1');
INSERT INTO `ic_area` VALUES ('2849', '盘县', '296', '六盘水市', '255', '1');
INSERT INTO `ic_area` VALUES ('2850', '市辖区', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2851', '红花岗区', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2852', '汇川区', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2853', '遵义县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2854', '桐梓县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2855', '绥阳县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2856', '正安县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2857', '道真仡佬族苗族自治县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2858', '务川仡佬族苗族自治县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2859', '凤冈县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2860', '湄潭县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2861', '余庆县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2862', '习水县', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2863', '赤水市', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2864', '仁怀市', '297', '遵义市', '255', '1');
INSERT INTO `ic_area` VALUES ('2865', '市辖区', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2866', '西秀区', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2867', '平坝县', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2868', '普定县', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2869', '镇宁布依族苗族自治县', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2870', '关岭布依族苗族自治县', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2871', '紫云苗族布依族自治县', '298', '安顺市', '255', '1');
INSERT INTO `ic_area` VALUES ('2872', '铜仁市', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2873', '江口县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2874', '玉屏侗族自治县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2875', '石阡县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2876', '思南县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2877', '印江土家族苗族自治县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2878', '德江县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2879', '沿河土家族自治县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2880', '松桃苗族自治县', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2881', '万山特区', '299', '铜仁地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2882', '兴义市', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2883', '兴仁县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2884', '普安县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2885', '晴隆县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2886', '贞丰县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2887', '望谟县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2888', '册亨县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2889', '安龙县', '300', '黔西南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2890', '毕节市', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2891', '大方县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2892', '黔西县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2893', '金沙县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2894', '织金县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2895', '纳雍县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2896', '威宁彝族回族苗族自治县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2897', '赫章县', '301', '毕节地区', '255', '1');
INSERT INTO `ic_area` VALUES ('2898', '凯里市', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2899', '黄平县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2900', '施秉县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2901', '三穗县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2902', '镇远县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2903', '岑巩县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2904', '天柱县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2905', '锦屏县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2906', '剑河县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2907', '台江县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2908', '黎平县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2909', '榕江县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2910', '从江县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2911', '雷山县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2912', '麻江县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2913', '丹寨县', '302', '黔东南苗族侗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2914', '都匀市', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2915', '福泉市', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2916', '荔波县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2917', '贵定县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2918', '瓮安县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2919', '独山县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2920', '平塘县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2921', '罗甸县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2922', '长顺县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2923', '龙里县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2924', '惠水县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2925', '三都水族自治县', '303', '黔南布依族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('2926', '市辖区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2927', '五华区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2928', '盘龙区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2929', '官渡区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2930', '西山区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2931', '东川区', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2932', '呈贡县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2933', '晋宁县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2934', '富民县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2935', '宜良县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2936', '石林彝族自治县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2937', '嵩明县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2938', '禄劝彝族苗族自治县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2939', '寻甸回族彝族自治县', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2940', '安宁市', '304', '昆明市', '255', '1');
INSERT INTO `ic_area` VALUES ('2941', '市辖区', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2942', '麒麟区', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2943', '马龙县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2944', '陆良县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2945', '师宗县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2946', '罗平县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2947', '富源县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2948', '会泽县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2949', '沾益县', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2950', '宣威市', '305', '曲靖市', '255', '1');
INSERT INTO `ic_area` VALUES ('2951', '市辖区', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2952', '红塔区', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2953', '江川县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2954', '澄江县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2955', '通海县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2956', '华宁县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2957', '易门县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2958', '峨山彝族自治县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2959', '新平彝族傣族自治县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2960', '元江哈尼族彝族傣族自治县', '306', '玉溪市', '255', '1');
INSERT INTO `ic_area` VALUES ('2961', '市辖区', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2962', '隆阳区', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2963', '施甸县', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2964', '腾冲县', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2965', '龙陵县', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2966', '昌宁县', '307', '保山市', '255', '1');
INSERT INTO `ic_area` VALUES ('2967', '市辖区', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2968', '昭阳区', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2969', '鲁甸县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2970', '巧家县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2971', '盐津县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2972', '大关县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2973', '永善县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2974', '绥江县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2975', '镇雄县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2976', '彝良县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2977', '威信县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2978', '水富县', '308', '昭通市', '255', '1');
INSERT INTO `ic_area` VALUES ('2979', '市辖区', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2980', '古城区', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2981', '玉龙纳西族自治县', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2982', '永胜县', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2983', '华坪县', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2984', '宁蒗彝族自治县', '309', '丽江市', '255', '1');
INSERT INTO `ic_area` VALUES ('2985', '市辖区', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2986', '翠云区', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2987', '普洱哈尼族彝族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2988', '墨江哈尼族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2989', '景东彝族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2990', '景谷傣族彝族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2991', '镇沅彝族哈尼族拉祜族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2992', '江城哈尼族彝族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2993', '孟连傣族拉祜族佤族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2994', '澜沧拉祜族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2995', '西盟佤族自治县', '310', '思茅市', '255', '1');
INSERT INTO `ic_area` VALUES ('2996', '市辖区', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('2997', '临翔区', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('2998', '凤庆县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('2999', '云县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3000', '永德县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3001', '镇康县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3002', '双江拉祜族佤族布朗族傣族自治县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3003', '耿马傣族佤族自治县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3004', '沧源佤族自治县', '311', '临沧市', '255', '1');
INSERT INTO `ic_area` VALUES ('3005', '楚雄市', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3006', '双柏县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3007', '牟定县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3008', '南华县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3009', '姚安县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3010', '大姚县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3011', '永仁县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3012', '元谋县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3013', '武定县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3014', '禄丰县', '312', '楚雄彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3015', '个旧市', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3016', '开远市', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3017', '蒙自县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3018', '屏边苗族自治县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3019', '建水县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3020', '石屏县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3021', '弥勒县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3022', '泸西县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3023', '元阳县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3024', '红河县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3025', '金平苗族瑶族傣族自治县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3026', '绿春县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3027', '河口瑶族自治县', '313', '红河哈尼族彝族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3028', '文山县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3029', '砚山县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3030', '西畴县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3031', '麻栗坡县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3032', '马关县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3033', '丘北县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3034', '广南县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3035', '富宁县', '314', '文山壮族苗族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3036', '景洪市', '315', '西双版纳傣族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3037', '勐海县', '315', '西双版纳傣族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3038', '勐腊县', '315', '西双版纳傣族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3039', '大理市', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3040', '漾濞彝族自治县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3041', '祥云县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3042', '宾川县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3043', '弥渡县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3044', '南涧彝族自治县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3045', '巍山彝族回族自治县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3046', '永平县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3047', '云龙县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3048', '洱源县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3049', '剑川县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3050', '鹤庆县', '316', '大理白族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3051', '瑞丽市', '317', '德宏傣族景颇族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3052', '潞西市', '317', '德宏傣族景颇族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3053', '梁河县', '317', '德宏傣族景颇族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3054', '盈江县', '317', '德宏傣族景颇族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3055', '陇川县', '317', '德宏傣族景颇族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3056', '泸水县', '318', '怒江傈僳族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3057', '福贡县', '318', '怒江傈僳族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3058', '贡山独龙族怒族自治县', '318', '怒江傈僳族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3059', '兰坪白族普米族自治县', '318', '怒江傈僳族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3060', '香格里拉县', '319', '迪庆藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3061', '德钦县', '319', '迪庆藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3062', '维西傈僳族自治县', '319', '迪庆藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3063', '市辖区', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3064', '城关区', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3065', '林周县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3066', '当雄县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3067', '尼木县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3068', '曲水县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3069', '堆龙德庆县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3070', '达孜县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3071', '墨竹工卡县', '320', '拉萨市', '255', '1');
INSERT INTO `ic_area` VALUES ('3072', '昌都县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3073', '江达县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3074', '贡觉县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3075', '类乌齐县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3076', '丁青县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3077', '察雅县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3078', '八宿县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3079', '左贡县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3080', '芒康县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3081', '洛隆县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3082', '边坝县', '321', '昌都地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3083', '乃东县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3084', '扎囊县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3085', '贡嘎县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3086', '桑日县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3087', '琼结县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3088', '曲松县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3089', '措美县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3090', '洛扎县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3091', '加查县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3092', '隆子县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3093', '错那县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3094', '浪卡子县', '322', '山南地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3095', '日喀则市', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3096', '南木林县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3097', '江孜县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3098', '定日县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3099', '萨迦县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3100', '拉孜县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3101', '昂仁县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3102', '谢通门县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3103', '白朗县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3104', '仁布县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3105', '康马县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3106', '定结县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3107', '仲巴县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3108', '亚东县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3109', '吉隆县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3110', '聂拉木县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3111', '萨嘎县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3112', '岗巴县', '323', '日喀则地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3113', '那曲县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3114', '嘉黎县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3115', '比如县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3116', '聂荣县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3117', '安多县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3118', '申扎县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3119', '索县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3120', '班戈县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3121', '巴青县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3122', '尼玛县', '324', '那曲地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3123', '普兰县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3124', '札达县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3125', '噶尔县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3126', '日土县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3127', '革吉县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3128', '改则县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3129', '措勤县', '325', '阿里地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3130', '林芝县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3131', '工布江达县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3132', '米林县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3133', '墨脱县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3134', '波密县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3135', '察隅县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3136', '朗县', '326', '林芝地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3137', '市辖区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3138', '新城区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3139', '碑林区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3140', '莲湖区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3141', '灞桥区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3142', '未央区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3143', '雁塔区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3144', '阎良区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3145', '临潼区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3146', '长安区', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3147', '蓝田县', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3148', '周至县', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3149', '户县', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3150', '高陵县', '327', '西安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3151', '市辖区', '328', '铜川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3152', '王益区', '328', '铜川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3153', '印台区', '328', '铜川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3154', '耀州区', '328', '铜川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3155', '宜君县', '328', '铜川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3156', '市辖区', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3157', '渭滨区', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3158', '金台区', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3159', '陈仓区', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3160', '凤翔县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3161', '岐山县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3162', '扶风县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3163', '眉县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3164', '陇县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3165', '千阳县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3166', '麟游县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3167', '凤县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3168', '太白县', '329', '宝鸡市', '255', '1');
INSERT INTO `ic_area` VALUES ('3169', '市辖区', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3170', '秦都区', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3171', '杨凌区', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3172', '渭城区', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3173', '三原县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3174', '泾阳县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3175', '乾县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3176', '礼泉县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3177', '永寿县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3178', '彬县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3179', '长武县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3180', '旬邑县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3181', '淳化县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3182', '武功县', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3183', '兴平市', '330', '咸阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3184', '市辖区', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3185', '临渭区', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3186', '华县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3187', '潼关县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3188', '大荔县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3189', '合阳县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3190', '澄城县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3191', '蒲城县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3192', '白水县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3193', '富平县', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3194', '韩城市', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3195', '华阴市', '331', '渭南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3196', '市辖区', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3197', '宝塔区', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3198', '延长县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3199', '延川县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3200', '子长县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3201', '安塞县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3202', '志丹县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3203', '吴起县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3204', '甘泉县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3205', '富县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3206', '洛川县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3207', '宜川县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3208', '黄龙县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3209', '黄陵县', '332', '延安市', '255', '1');
INSERT INTO `ic_area` VALUES ('3210', '市辖区', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3211', '汉台区', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3212', '南郑县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3213', '城固县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3214', '洋县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3215', '西乡县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3216', '勉县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3217', '宁强县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3218', '略阳县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3219', '镇巴县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3220', '留坝县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3221', '佛坪县', '333', '汉中市', '255', '1');
INSERT INTO `ic_area` VALUES ('3222', '市辖区', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3223', '榆阳区', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3224', '神木县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3225', '府谷县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3226', '横山县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3227', '靖边县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3228', '定边县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3229', '绥德县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3230', '米脂县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3231', '佳县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3232', '吴堡县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3233', '清涧县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3234', '子洲县', '334', '榆林市', '255', '1');
INSERT INTO `ic_area` VALUES ('3235', '市辖区', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3236', '汉滨区', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3237', '汉阴县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3238', '石泉县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3239', '宁陕县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3240', '紫阳县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3241', '岚皋县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3242', '平利县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3243', '镇坪县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3244', '旬阳县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3245', '白河县', '335', '安康市', '255', '1');
INSERT INTO `ic_area` VALUES ('3246', '市辖区', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3247', '商州区', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3248', '洛南县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3249', '丹凤县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3250', '商南县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3251', '山阳县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3252', '镇安县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3253', '柞水县', '336', '商洛市', '255', '1');
INSERT INTO `ic_area` VALUES ('3254', '市辖区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3255', '城关区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3256', '七里河区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3257', '西固区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3258', '安宁区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3259', '红古区', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3260', '永登县', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3261', '皋兰县', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3262', '榆中县', '337', '兰州市', '255', '1');
INSERT INTO `ic_area` VALUES ('3263', '市辖区', '338', '嘉峪关市', '255', '1');
INSERT INTO `ic_area` VALUES ('3264', '市辖区', '339', '金昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('3265', '金川区', '339', '金昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('3266', '永昌县', '339', '金昌市', '255', '1');
INSERT INTO `ic_area` VALUES ('3267', '市辖区', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3268', '白银区', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3269', '平川区', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3270', '靖远县', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3271', '会宁县', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3272', '景泰县', '340', '白银市', '255', '1');
INSERT INTO `ic_area` VALUES ('3273', '市辖区', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3274', '秦城区', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3275', '北道区', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3276', '清水县', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3277', '秦安县', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3278', '甘谷县', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3279', '武山县', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3280', '张家川回族自治县', '341', '天水市', '255', '1');
INSERT INTO `ic_area` VALUES ('3281', '市辖区', '342', '武威市', '255', '1');
INSERT INTO `ic_area` VALUES ('3282', '凉州区', '342', '武威市', '255', '1');
INSERT INTO `ic_area` VALUES ('3283', '民勤县', '342', '武威市', '255', '1');
INSERT INTO `ic_area` VALUES ('3284', '古浪县', '342', '武威市', '255', '1');
INSERT INTO `ic_area` VALUES ('3285', '天祝藏族自治县', '342', '武威市', '255', '1');
INSERT INTO `ic_area` VALUES ('3286', '市辖区', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3287', '甘州区', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3288', '肃南裕固族自治县', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3289', '民乐县', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3290', '临泽县', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3291', '高台县', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3292', '山丹县', '343', '张掖市', '255', '1');
INSERT INTO `ic_area` VALUES ('3293', '市辖区', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3294', '崆峒区', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3295', '泾川县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3296', '灵台县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3297', '崇信县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3298', '华亭县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3299', '庄浪县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3300', '静宁县', '344', '平凉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3301', '市辖区', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3302', '肃州区', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3303', '金塔县', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3304', '瓜州县*', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3305', '肃北蒙古族自治县', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3306', '阿克塞哈萨克族自治县', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3307', '玉门市', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3308', '敦煌市', '345', '酒泉市', '255', '1');
INSERT INTO `ic_area` VALUES ('3309', '市辖区', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3310', '西峰区', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3311', '庆城县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3312', '环县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3313', '华池县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3314', '合水县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3315', '正宁县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3316', '宁县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3317', '镇原县', '346', '庆阳市', '255', '1');
INSERT INTO `ic_area` VALUES ('3318', '市辖区', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3319', '安定区', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3320', '通渭县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3321', '陇西县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3322', '渭源县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3323', '临洮县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3324', '漳县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3325', '岷县', '347', '定西市', '255', '1');
INSERT INTO `ic_area` VALUES ('3326', '市辖区', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3327', '武都区', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3328', '成县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3329', '文县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3330', '宕昌县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3331', '康县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3332', '西和县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3333', '礼县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3334', '徽县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3335', '两当县', '348', '陇南市', '255', '1');
INSERT INTO `ic_area` VALUES ('3336', '临夏市', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3337', '临夏县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3338', '康乐县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3339', '永靖县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3340', '广河县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3341', '和政县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3342', '东乡族自治县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3343', '积石山保安族东乡族撒拉族自治县', '349', '临夏回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3344', '合作市', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3345', '临潭县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3346', '卓尼县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3347', '舟曲县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3348', '迭部县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3349', '玛曲县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3350', '碌曲县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3351', '夏河县', '350', '甘南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3352', '市辖区', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3353', '城东区', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3354', '城中区', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3355', '城西区', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3356', '城北区', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3357', '大通回族土族自治县', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3358', '湟中县', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3359', '湟源县', '351', '西宁市', '255', '1');
INSERT INTO `ic_area` VALUES ('3360', '平安县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3361', '民和回族土族自治县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3362', '乐都县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3363', '互助土族自治县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3364', '化隆回族自治县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3365', '循化撒拉族自治县', '352', '海东地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3366', '门源回族自治县', '353', '海北藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3367', '祁连县', '353', '海北藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3368', '海晏县', '353', '海北藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3369', '刚察县', '353', '海北藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3370', '同仁县', '354', '黄南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3371', '尖扎县', '354', '黄南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3372', '泽库县', '354', '黄南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3373', '河南蒙古族自治县', '354', '黄南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3374', '共和县', '355', '海南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3375', '同德县', '355', '海南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3376', '贵德县', '355', '海南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3377', '兴海县', '355', '海南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3378', '贵南县', '355', '海南藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3379', '玛沁县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3380', '班玛县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3381', '甘德县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3382', '达日县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3383', '久治县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3384', '玛多县', '356', '果洛藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3385', '玉树县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3386', '杂多县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3387', '称多县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3388', '治多县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3389', '囊谦县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3390', '曲麻莱县', '357', '玉树藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3391', '格尔木市', '358', '海西蒙古族藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3392', '德令哈市', '358', '海西蒙古族藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3393', '乌兰县', '358', '海西蒙古族藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3394', '都兰县', '358', '海西蒙古族藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3395', '天峻县', '358', '海西蒙古族藏族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3396', '市辖区', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3397', '兴庆区', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3398', '西夏区', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3399', '金凤区', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3400', '永宁县', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3401', '贺兰县', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3402', '灵武市', '359', '银川市', '255', '1');
INSERT INTO `ic_area` VALUES ('3403', '市辖区', '360', '石嘴山市', '255', '1');
INSERT INTO `ic_area` VALUES ('3404', '大武口区', '360', '石嘴山市', '255', '1');
INSERT INTO `ic_area` VALUES ('3405', '惠农区', '360', '石嘴山市', '255', '1');
INSERT INTO `ic_area` VALUES ('3406', '平罗县', '360', '石嘴山市', '255', '1');
INSERT INTO `ic_area` VALUES ('3407', '市辖区', '361', '吴忠市', '255', '1');
INSERT INTO `ic_area` VALUES ('3408', '利通区', '361', '吴忠市', '255', '1');
INSERT INTO `ic_area` VALUES ('3409', '盐池县', '361', '吴忠市', '255', '1');
INSERT INTO `ic_area` VALUES ('3410', '同心县', '361', '吴忠市', '255', '1');
INSERT INTO `ic_area` VALUES ('3411', '青铜峡市', '361', '吴忠市', '255', '1');
INSERT INTO `ic_area` VALUES ('3412', '市辖区', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3413', '原州区', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3414', '西吉县', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3415', '隆德县', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3416', '泾源县', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3417', '彭阳县', '362', '固原市', '255', '1');
INSERT INTO `ic_area` VALUES ('3418', '市辖区', '363', '中卫市', '255', '1');
INSERT INTO `ic_area` VALUES ('3419', '沙坡头区', '363', '中卫市', '255', '1');
INSERT INTO `ic_area` VALUES ('3420', '中宁县', '363', '中卫市', '255', '1');
INSERT INTO `ic_area` VALUES ('3421', '海原县', '363', '中卫市', '255', '1');
INSERT INTO `ic_area` VALUES ('3422', '市辖区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3423', '天山区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3424', '沙依巴克区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3425', '新市区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3426', '水磨沟区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3427', '头屯河区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3428', '达坂城区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3429', '东山区', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3430', '乌鲁木齐县', '364', '乌鲁木齐市', '255', '1');
INSERT INTO `ic_area` VALUES ('3431', '市辖区', '365', '克拉玛依市', '255', '1');
INSERT INTO `ic_area` VALUES ('3432', '独山子区', '365', '克拉玛依市', '255', '1');
INSERT INTO `ic_area` VALUES ('3433', '克拉玛依区', '365', '克拉玛依市', '255', '1');
INSERT INTO `ic_area` VALUES ('3434', '白碱滩区', '365', '克拉玛依市', '255', '1');
INSERT INTO `ic_area` VALUES ('3435', '乌尔禾区', '365', '克拉玛依市', '255', '1');
INSERT INTO `ic_area` VALUES ('3436', '吐鲁番市', '366', '吐鲁番地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3437', '鄯善县', '366', '吐鲁番地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3438', '托克逊县', '366', '吐鲁番地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3439', '哈密市', '367', '哈密地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3440', '巴里坤哈萨克自治县', '367', '哈密地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3441', '伊吾县', '367', '哈密地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3442', '昌吉市', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3443', '阜康市', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3444', '米泉市', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3445', '呼图壁县', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3446', '玛纳斯县', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3447', '奇台县', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3448', '吉木萨尔县', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3449', '木垒哈萨克自治县', '368', '昌吉回族自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3450', '博乐市', '369', '博尔塔拉蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3451', '精河县', '369', '博尔塔拉蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3452', '温泉县', '369', '博尔塔拉蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3453', '库尔勒市', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3454', '轮台县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3455', '尉犁县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3456', '若羌县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3457', '且末县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3458', '焉耆回族自治县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3459', '和静县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3460', '和硕县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3461', '博湖县', '370', '巴音郭楞蒙古自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3462', '阿克苏市', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3463', '温宿县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3464', '库车县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3465', '沙雅县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3466', '新和县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3467', '拜城县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3468', '乌什县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3469', '阿瓦提县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3470', '柯坪县', '371', '阿克苏地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3471', '阿图什市', '372', '克孜勒苏柯尔克孜自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3472', '阿克陶县', '372', '克孜勒苏柯尔克孜自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3473', '阿合奇县', '372', '克孜勒苏柯尔克孜自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3474', '乌恰县', '372', '克孜勒苏柯尔克孜自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3475', '喀什市', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3476', '疏附县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3477', '疏勒县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3478', '英吉沙县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3479', '泽普县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3480', '莎车县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3481', '叶城县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3482', '麦盖提县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3483', '岳普湖县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3484', '伽师县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3485', '巴楚县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3486', '塔什库尔干塔吉克自治县', '373', '喀什地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3487', '和田市', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3488', '和田县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3489', '墨玉县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3490', '皮山县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3491', '洛浦县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3492', '策勒县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3493', '于田县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3494', '民丰县', '374', '和田地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3495', '伊宁市', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3496', '奎屯市', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3497', '伊宁县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3498', '察布查尔锡伯自治县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3499', '霍城县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3500', '巩留县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3501', '新源县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3502', '昭苏县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3503', '特克斯县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3504', '尼勒克县', '375', '伊犁哈萨克自治州', '255', '1');
INSERT INTO `ic_area` VALUES ('3505', '塔城市', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3506', '乌苏市', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3507', '额敏县', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3508', '沙湾县', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3509', '托里县', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3510', '裕民县', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3511', '和布克赛尔蒙古自治县', '376', '塔城地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3512', '阿勒泰市', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3513', '布尔津县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3514', '富蕴县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3515', '福海县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3516', '哈巴河县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3517', '青河县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3518', '吉木乃县', '377', '阿勒泰地区', '255', '1');
INSERT INTO `ic_area` VALUES ('3519', '石河子市', '378', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('3520', '阿拉尔市', '378', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('3521', '图木舒克市', '378', '省直辖行政单位', '255', '1');
INSERT INTO `ic_area` VALUES ('3522', '五家渠市', '378', '省直辖行政单位', '255', '1');

-- ----------------------------
-- Table structure for ic_category
-- ----------------------------
DROP TABLE IF EXISTS `ic_category`;
CREATE TABLE "ic_category" (
  "category_id" bigint(20) NOT NULL AUTO_INCREMENT,
  "shortname" varchar(255) NOT NULL DEFAULT '' COMMENT '短名称',
  "category_name" varchar(255) NOT NULL DEFAULT '' COMMENT '分类明细',
  "site_id" int(11) NOT NULL DEFAULT '0' COMMENT '站点编号',
  "parent_id" bigint(20) NOT NULL DEFAULT '0' COMMENT '父类编号',
  "model_id" int(11) DEFAULT NULL COMMENT '模型编号',
  "alone" tinyint(1) DEFAULT '0' COMMENT '单页（0：不是，1：是）',
  "content" mediumtext COMMENT '文本',
  "index_tpl" varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  "list_tpl" varchar(255) NOT NULL DEFAULT '' COMMENT '列表页面',
  "content_tpl" varchar(255) NOT NULL DEFAULT '' COMMENT '内容页面',
  "is_nav" tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航',
  "allow_front_post" tinyint(1) DEFAULT '0',
  "url" varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY ("category_id"),
  KEY "category_id" ("category_id"),
  KEY "short_name" ("shortname")
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of ic_category
-- ----------------------------
INSERT INTO `ic_category` VALUES ('31', 'help', '帮助中心', '1', '0', '73', '0', '			    \r\n			    ', 'help.html', 'help.html', 'help.html', '0', '0', null);
INSERT INTO `ic_category` VALUES ('34', 'aboutus', '关于我们', '1', '0', '72', '0', '			    \r\n			    \r\n			    ', 'aboutus.html', 'aboutus.html', 'aboutus.html', '0', '0', null);
INSERT INTO `ic_category` VALUES ('35', 'team', '团队风采', '1', '0', '78', '0', '			    \r\n			    \r\n			    ', 'team.html', 'team.html', 'team.html', '0', '0', null);
INSERT INTO `ic_category` VALUES ('36', 'product', '产品详情', '1', '0', '72', '0', '			    ', 'product.html', 'product.html', 'product.html', '0', '0', null);
INSERT INTO `ic_category` VALUES ('37', 'index', '首页', '1', '0', '78', '0', '			    ', 'index.html', 'index.html', 'index.html', '0', '0', null);

-- ----------------------------
-- Table structure for ic_commont
-- ----------------------------
DROP TABLE IF EXISTS `ic_commont`;
CREATE TABLE "ic_commont" (
  "commont_id" int(11) NOT NULL AUTO_INCREMENT,
  "article_id" bigint(20) NOT NULL DEFAULT '0' COMMENT '文章id',
  "reply_id" int(11) NOT NULL DEFAULT '0' COMMENT '回复id',
  "username" varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  "post_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  "content" varchar(255) DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY ("commont_id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='评论留言';

-- ----------------------------
-- Records of ic_commont
-- ----------------------------
INSERT INTO `ic_commont` VALUES ('1', '1', '0', '123', '2016-10-02 00:38:14', '123');
INSERT INTO `ic_commont` VALUES ('2', '1', '1', '456', '2016-10-02 00:38:14', '456');
INSERT INTO `ic_commont` VALUES ('3', '1', '1', '789', '2016-10-02 00:38:14', '789');

-- ----------------------------
-- Table structure for ic_config
-- ----------------------------
DROP TABLE IF EXISTS `ic_config`;
CREATE TABLE "ic_config" (
  "Id" int(11) NOT NULL AUTO_INCREMENT,
  "admin_path" varchar(64) NOT NULL DEFAULT '',
  "upload_allowType" varchar(255) NOT NULL DEFAULT '',
  "upload_max" varchar(50) DEFAULT NULL COMMENT '文件上传最大值',
  "http_protocol" varchar(16) NOT NULL DEFAULT '',
  "dynamic_suffix" varchar(255) NOT NULL DEFAULT '',
  "allow_member_reg" tinyint(1) NOT NULL DEFAULT '0',
  "member_email_check" tinyint(1) NOT NULL DEFAULT '0',
  "email_ssl" tinyint(1) NOT NULL DEFAULT '0',
  "email_host" varchar(128) NOT NULL DEFAULT '',
  "email_port" int(11) NOT NULL DEFAULT '0',
  "email_username" varchar(64) NOT NULL DEFAULT '',
  "email_password" varchar(128) NOT NULL DEFAULT '',
  "email_address" varchar(100) DEFAULT NULL,
  "qiniu_on" tinyint(1) NOT NULL DEFAULT '0',
  "qiniu_url" varchar(128) NOT NULL DEFAULT '',
  "qiniu_bucketName" varchar(64) NOT NULL DEFAULT '',
  "qiniu_accessKey" varchar(255) NOT NULL DEFAULT '',
  "qiniu_secretKey" varchar(128) NOT NULL DEFAULT '',
  "sms_type" int(11) NOT NULL DEFAULT '0',
  "sms_username" varchar(64) NOT NULL DEFAULT '',
  "sms_password" varchar(128) NOT NULL DEFAULT '',
  "oauth_on" tinyint(1) NOT NULL DEFAULT '0',
  "oauth_sina_on" tinyint(1) NOT NULL DEFAULT '0',
  "oauth_sina_openid" varchar(128) DEFAULT NULL,
  "oauth_sina_openkey" varchar(128) DEFAULT NULL,
  "oauth_sina_redirect" varchar(100) DEFAULT NULL,
  "oauth_qq_on" tinyint(1) NOT NULL DEFAULT '0',
  "oauth_qq_openid" varchar(128) DEFAULT NULL,
  "oauth_qq_openkey" varchar(128) DEFAULT NULL,
  "oauth_qq_redirect" varchar(128) DEFAULT NULL,
  "is_dev" tinyint(1) NOT NULL DEFAULT '0',
  "is_demo" tinyint(1) NOT NULL DEFAULT '0',
  "beian" varchar(20) DEFAULT NULL,
  "copyright" varchar(255) DEFAULT '',
  "refuse_ip" text COMMENT '过滤ip',
  "allow_login_error" int(11) NOT NULL DEFAULT '10',
  "mark_on" tinyint(1) NOT NULL DEFAULT '0',
  "mark_content" varchar(255) DEFAULT NULL,
  "mark_width" int(11) DEFAULT '0',
  "mark_hight" int(11) NOT NULL DEFAULT '0',
  "mark_color" varchar(255) DEFAULT '',
  "page_size" int(11) DEFAULT NULL COMMENT '分页大小',
  PRIMARY KEY ("Id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_config
-- ----------------------------
INSERT INTO `ic_config` VALUES ('1', 'system', '.jpg|.jepg|.gif|.png|.bmp|.gz|.rar|.zip|.pdf|.txt|.swf|.wmv|.doc|.html', '10', 'http', '.shtml', '1', '0', '1', 'smtp.mxhichina.com', '465', 'system@gs365.net', '001Asd11', 'jin@westboy.net', '0', 'http://westboy.qiniudn.com', ' westboy', 'AweTtABDm6QPqAq_zfNxfHMdPgCyVDk0ohAkZRW_', 'DX16qKFvbhdElM-pTrMs8_mecKpHnjrk-GerKAij', '0', '', '', '1', '0', '4193705357', 'bc7bbdfe92be06b42b38206f8bca3645', 'http://www.dreamlu.net/api/sina/callback', '1', 'xwKOgtKjbbrn9dOb7ZkGrAo5', 'dNlKN4vVqgZvROrWW8twc4wESGWkSfF8', 'http://www.dreamlu.net/api/baidu/callback', '1', '0', 'longÃ¥Â¤ÂÃ¦Â¡Â', 'Ã§ÂÂÃ¦ÂÂÃ¤Â¿Â¡Ã¦ÂÂ¯', '127.0.0.1', '0', '0', 'icms', '40', '100', 'red', '20');

-- ----------------------------
-- Table structure for ic_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `ic_config_attr`;
CREATE TABLE "ic_config_attr" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "key" varchar(64) NOT NULL DEFAULT '',
  "value" varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY ("id"),
  KEY "key" ("value")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局配置表';

-- ----------------------------
-- Records of ic_config_attr
-- ----------------------------

-- ----------------------------
-- Table structure for ic_content
-- ----------------------------
DROP TABLE IF EXISTS `ic_content`;
CREATE TABLE "ic_content" (
  "content_id" bigint(20) NOT NULL AUTO_INCREMENT,
  "category_id" bigint(20) NOT NULL DEFAULT '0',
  "model_id" int(11) NOT NULL DEFAULT '0' COMMENT '模型id',
  "title" varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  "keywords" char(40) DEFAULT '' COMMENT '关键字',
  "description" text COMMENT '描述',
  "top" tinyint(1) DEFAULT NULL COMMENT '顶置',
  "recommend" tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  "thumb" varchar(255) DEFAULT NULL COMMENT '封面',
  "status" tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  "inputdate" timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  "updatedate" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  "url" char(100) DEFAULT '' COMMENT '文章地址',
  "username" char(20) NOT NULL DEFAULT '' COMMENT '用户名',
  "user_id" int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  "is_del" tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  "view_num" int(11) NOT NULL DEFAULT '0' COMMENT '查看次数',
  "content" text COMMENT '内容',
  PRIMARY KEY ("content_id"),
  KEY "catid" ("category_id","model_id")
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of ic_content
-- ----------------------------
INSERT INTO `ic_content` VALUES ('56', '34', '72', '关于云逸宝', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:44:39', '2017-07-17 10:44:39', null, 'sy', '0', '0', '1', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('57', '34', '72', '愿景和使命', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:45:16', '2017-07-17 10:45:16', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('58', '34', '72', '云逸宝发展史', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:46:34', '2017-07-17 10:46:34', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('59', '34', '72', '胡晓', null, '												\r\n						\r\n						', null, '0', null, '1', '2017-07-17 10:50:41', '2017-07-17 10:50:41', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('60', '34', '72', '丁海霞', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:51:59', '2017-07-17 10:51:59', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('61', '34', '72', '王毅', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:53:15', '2017-07-17 10:53:15', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('62', '34', '72', '李耀', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:54:21', '2017-07-17 10:54:21', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('63', '34', '72', '加入我们', null, '						\r\n						', null, '0', null, '1', '2017-07-17 10:55:17', '2017-07-17 10:55:17', null, 'sy', '0', '1', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('64', '31', '73', '测试', null, '												\r\n						\r\n						', null, '0', null, '1', '2017-07-17 11:36:18', '2017-07-17 11:36:18', null, 'sy', '0', '0', '1', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('65', '35', '78', '首页', null, '						首页轮播图\r\n						', null, '0', null, '1', '2017-07-20 10:03:35', '2017-07-20 10:03:35', null, 'sy', '0', '1', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('66', '31', '73', '测试2', null, '																		\r\n						\r\n						\r\n						', null, '0', null, '1', '2017-07-20 13:50:25', '2017-07-20 13:50:25', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('69', '34', '72', '招聘信息1', null, '																																										\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						', null, '0', null, '1', '2017-07-20 14:13:41', '2017-07-20 14:13:41', null, '1', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('70', '34', '72', '招聘2', null, '																		\r\n						\r\n						\r\n						', null, '0', null, '1', '2017-07-20 14:35:38', '2017-07-20 14:35:38', null, 'sy', '0', '0', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('71', '37', '78', '轮播图', null, '						\r\n						', null, '0', null, '1', '2017-07-20 14:44:39', '2017-07-20 14:44:39', null, 'sy', '0', '1', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('74', '37', '78', 'lunbo1', null, '																		\r\n						\r\n						\r\n						', null, '0', null, '1', '2017-07-26 17:33:16', '2017-07-26 17:33:16', null, 'sy', '0', '0', '3', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('75', '35', '78', '2', null, '						\r\n						', null, '0', null, '1', '2017-07-26 17:41:54', '2017-07-26 17:41:54', null, '2', '0', '1', '0', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('76', '35', '78', '苏州', null, '						\r\n						', null, '0', null, '1', '2017-07-27 11:33:09', '2017-07-27 11:33:09', null, 'sy', '0', '0', '3', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('77', '35', '78', '大明山之行', null, '						\r\n						', null, '0', null, '1', '2017-07-27 11:33:51', '2017-07-27 11:33:51', null, 'sy', '0', '0', '6', '                     \r\n                    ');
INSERT INTO `ic_content` VALUES ('90', '35', '78', '下次去玩', null, '																								\r\n						\r\n						\r\n						\r\n						', null, '0', null, '1', '2017-07-29 13:58:48', '2017-07-29 13:58:48', null, 'sy', '0', '0', '1', '                     \r\n                    ');

-- ----------------------------
-- Table structure for ic_content_help
-- ----------------------------
DROP TABLE IF EXISTS `ic_content_help`;
CREATE TABLE "ic_content_help" (
  "content_id" bigint(20) NOT NULL,
  "answer" varchar(600) DEFAULT NULL,
  "question" varchar(600) DEFAULT NULL,
  "descPic" char(50) DEFAULT NULL,
  "ID" char(50) DEFAULT NULL,
  PRIMARY KEY ("content_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_content_help
-- ----------------------------
INSERT INTO `ic_content_help` VALUES ('64', '                          测试\r\n                    ', '                          测试\r\n                    ', '/123', '1');
INSERT INTO `ic_content_help` VALUES ('66', '                                                    第二个问题\r\n                    \r\n                    ', '                                                    回答************15154adda<p><br></p>', null, '2');
INSERT INTO `ic_content_help` VALUES ('78', '123456', '                          \r\n                    <p>4564654</p>', '1', '1');
INSERT INTO `ic_content_help` VALUES ('79', '                          \r\n                    <p>111<br></p>', '                          \r\n                    <p>1111<br></p>', null, null);
INSERT INTO `ic_content_help` VALUES ('81', '                          \r\n                    <p>1</p>', '                          \r\n                    <p>1</p>', null, null);
INSERT INTO `ic_content_help` VALUES ('82', '                          \r\n                    <p>1</p>', '                          \r\n                    <p>1</p>', '1', '1');

-- ----------------------------
-- Table structure for ic_content_join
-- ----------------------------
DROP TABLE IF EXISTS `ic_content_join`;
CREATE TABLE "ic_content_join" (
  "content_id" bigint(20) NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "message" varchar(5000) DEFAULT '',
  "choose" int(11) DEFAULT NULL,
  "zhiwu" varchar(255) DEFAULT NULL,
  "picurl" varchar(255) DEFAULT NULL,
  "picnum" varchar(255) DEFAULT NULL,
  "loadhtml" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("content_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_content_join
-- ----------------------------
INSERT INTO `ic_content_join` VALUES ('56', '关于云逸宝', '<p>\r\n云逸宝随身WiFi，是一款集随身wifi与充电宝功能于一体的产品，mini版本外形小巧，可轻松掌握手中。使用\r\n<br>\r\n云SIM卡等专利科技与前沿技术，解决4G时代手机用户高速上网流量和电量问题。\r\n<br>\r\n产品分为充电宝版本和mini版本（无充电宝功能），小巧的机身，可以轻松掌握手中。无需插卡，无论何时何\r\n<br>\r\n地，手机有信号的地方你都可以轻松享用wifi。云逸宝采用的4G网的网速是3G的10-30倍，下载速度达150m\r\n<br>\r\nbps，上传速度达50mbps。同时接收移动、联通、电信三大运营商的信号，全国400万基站，自动为您切换到\r\n<br>\r\n最强的网络。提供安全的无线网络，过滤病毒网站，在app里还可以禁止不明设备访问。\r\n</p>', '1', null, null, null, '1');
INSERT INTO `ic_content_join` VALUES ('57', '愿景和使命', '<p>\r\n公司始终秉承“人才第一，追求一流，引领变革， 正道经营，共存共赢”的企业文化。\r\n<br>\r\n公司始终站在用户的角度做研发，立志要做科技服务行业里受用户喜爱的企业，顾客的便利才是公司团队进步的\r\n<br>\r\n不竭动力！\r\n</p>', '1', null, null, null, '1');
INSERT INTO `ic_content_join` VALUES ('58', '云逸宝发展史', '<p>\r\n杭州瀚隆网络科技有限公司诞生在网络科技云集的杭州，网罗了经历新科技浪潮洗礼的前沿技术人才，立志要做\r\n<br>\r\n科技行业里受用户喜爱的企业，一直站在用户的角度做研发，顾客的便利才是瀚隆团队进步的不竭动力！正是瀚\r\n<br>\r\n隆的用心、务实和强大的技术支持，促使瀚隆团队在无数的创业公司中突出重围。\r\n</p>', '2', null, null, null, '1');
INSERT INTO `ic_content_join` VALUES ('59', '胡晓', '                          <p>\r\n毕业于中国计量大学，工商管理专业\r\n<br>\r\n曾就职于浙江广播电视集团，2004年加入淘宝，\r\n<br>\r\n2011年开始自主创业，2015年创立杭州瀚隆网\r\n<br>\r\n络科技有限公司。\r\n</p>\r\n                    ', '3', '云逸宝创始人、总裁', 'img/ding.png', '1', '1');
INSERT INTO `ic_content_join` VALUES ('60', '丁海霞', '<p>\r\n毕业于浙江大学，硕士学位\r\n<br>\r\n拥有人力资源管理师(二级)证书。2004年至200\r\n<br>\r\n8年就职于浙大网新。2011年开始从事财务相关\r\n<br>\r\n工作。\r\n</p>', '3', 'ＨＲ兼财务总监', 'img/ding.png', '2', '1');
INSERT INTO `ic_content_join` VALUES ('61', '王毅', '<p>\r\n毕业于浙江工商大学，电子信息工程专业\r\n<br>\r\n原杭州时代银通软件有限公司工程师，2005年进\r\n<br>\r\n入互联网行业，10余年间积累了丰富的互联网行\r\n<br>\r\n业技术和管理经验，对传统互联网产品和移动互\r\n<br>\r\n联网产品有着独到的认识。\r\n</p>', '3', '联合创始人、副总', 'img/ding.png', '1', '1');
INSERT INTO `ic_content_join` VALUES ('62', '李耀', '<p>\r\n毕业于华东理工大学，计算机专业\r\n<br>\r\n原南威软件股份有限公司数据工程师，近十年互\r\n<br>\r\n联网搜索相关领域技术工作经验，跨越多种技术\r\n<br>\r\n领域的经验。对算法模型有深刻的认识。\r\n</p>', '3', '联合创始人、副总经理', 'img/ding.png', '2', '1');
INSERT INTO `ic_content_join` VALUES ('69', '用户运营', '                                                    <p><br></p><p>职位描述</p><p>一、岗位要求：\r\n</p><p>&nbsp;女，相貌端正&nbsp;有无经验都可以，欢迎毕业生，实习生（全职）\r\n</p><p>享受同等待遇。追求高薪，有团队协作精神。&nbsp;省内户籍优先！\r\n</p><p><br></p><p>二、岗位职责：\r\n</p><p>1、根据公司销售订单，进行数据录入及对进度进行追踪，并进行文档数据整理、存档；&nbsp;\r\n</p><p>2、销售信息的整理；&nbsp;\r\n</p><p>3、客户资料管理；&nbsp;\r\n</p><p>4、整理会议纪要和内部报告；&nbsp;\r\n</p><p>5、外来客户的一般接待；&nbsp;\r\n</p><p><br></p><p>三、任职要求：&nbsp;\r\n</p><p>1、具备良好的沟通能力，工作态度认真负责，工作主动积极向上，善于学习；&nbsp;\r\n</p><p>2、可以操作各种办公软件,熟练掌握excel操作；&nbsp;\r\n</p><p><br></p><p>三、薪资福利：&nbsp;\r\n</p><p>1、试用期1-3个月，&nbsp;\r\n</p><p>2、薪资范围：试用期3500元+补贴500，转正4500元+补贴500元（工作努力还有较大提薪空间）&nbsp;\r\n</p><p>3、工作时间：9：00-18：00，&nbsp;单休+法定节假日&nbsp;\r\n</p><p>4、转正后五险&nbsp;\r\n</p><p>5、餐补&nbsp;\r\n</p><p>6、年底双薪&nbsp;\r\n</p><p><br></p><p>四、地址：&nbsp;杭州市滨江区滨安路650号C座705（靠近1号线西兴站）,&nbsp;高薪诚聘</p>\r\n                    \r\n                    \r\n                    <p><br></p>\r\n                    \r\n                    ', '4', null, null, null, '1');
INSERT INTO `ic_content_join` VALUES ('70', '嵌入式软件开发', '                          <div><br></div><p>职位描述</p><p>一、岗位要求：&nbsp;\r\n</p><p>1.&nbsp;计算机、通信、电子类相关专业，大专及以上学历\r\n</p><p>2.&nbsp;精通C语言，有Linux环境下C/C++语言程序开发经验者优先\r\n</p><p>3.&nbsp;了解嵌入式Linux驱动开发,&nbsp;有外设驱动开发经验优先\r\n</p><p>4.&nbsp;能熟练阅读英文技术文档和专业文献\r\n</p><p>5.&nbsp;为人踏实、责任心强，有较强的钻研精神和团队合作意识\r\n</p><p><br></p><p>二、满足如下条件之一者优先考虑:\r\n</p><p>1、熟悉arm-linux平台，有实际的项目开发经验者\r\n</p><p>2、熟悉任意一款ARM9、ARM11、Cortex-A系列处理器\r\n</p><p><br></p><p>三、岗位职责：&nbsp;\r\n</p><p>1、基于Linux/FreeRTOS的嵌入式软件开发\r\n</p><p>2、负责系统底层的BSP相关工作，如Linux&nbsp;Kernel移植优化，设备驱动开发、移植\r\n</p><p>3、负责文档与源码的开发、维护\r\n</p><p>4、与硬件工程师配合一起完成系统级软硬件调试\r\n</p><p><br></p><p>四工作时间：周一到周六，弹性工作制\r\n</p><p><br></p><p>五福利待遇：五险，餐补，通信补，交通补</p><p><br></p>\r\n                    ', '4', null, null, null, '1');

-- ----------------------------
-- Table structure for ic_content_join_name
-- ----------------------------
DROP TABLE IF EXISTS `ic_content_join_name`;
CREATE TABLE "ic_content_join_name" (
  "ID" int(10) NOT NULL,
  "name" varchar(255) NOT NULL,
  "title1" varchar(255) NOT NULL,
  "title2" varchar(255) NOT NULL,
  "url" varchar(255) NOT NULL,
  "liID" varchar(255) NOT NULL,
  "divID" varchar(255) NOT NULL,
  PRIMARY KEY ("ID")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_content_join_name
-- ----------------------------
INSERT INTO `ic_content_join_name` VALUES ('1', '关于云逸宝', '关于', '关于云逸宝', 'aboutus-iebox.html', 'li1', 'div1');
INSERT INTO `ic_content_join_name` VALUES ('2', '企业发展史', '发展史', '云逸宝发展史', 'aboutus-develop.html', 'li2', 'div2');
INSERT INTO `ic_content_join_name` VALUES ('3', '团队成员', '团队', '云逸宝团队', 'aboutus-team.html', 'li3', 'div3');
INSERT INTO `ic_content_join_name` VALUES ('4', '加入我们', '加入', '加入我们', 'aboutus-join.html', 'li4', 'div4');

-- ----------------------------
-- Table structure for ic_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `ic_content_picture`;
CREATE TABLE "ic_content_picture" (
  "content_id" bigint(20) NOT NULL,
  "ur" char(100) DEFAULT NULL,
  "upload" varchar(255) DEFAULT NULL,
  "place" char(50) DEFAULT NULL,
  "weather" char(50) DEFAULT NULL,
  "time" char(50) DEFAULT NULL,
  "URLtwp" char(50) DEFAULT NULL,
  PRIMARY KEY ("content_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_content_picture
-- ----------------------------
INSERT INTO `ic_content_picture` VALUES ('74', '首页', '/img/shouyelunbo.png', null, null, null, '/product');
INSERT INTO `ic_content_picture` VALUES ('76', '团队风采', 'http://localhost:8080/r/upload/2017/7/28/1501208335717.png', '千岛湖之行', '晴朗', '2017年3月04日', '/active/2');
INSERT INTO `ic_content_picture` VALUES ('77', '团队风采', 'http://localhost:8080/r/upload/2017/7/28/1501208363086.png', '大明山之行', '晴朗', '2017年7月01日', '/active/1');

-- ----------------------------
-- Table structure for ic_form
-- ----------------------------
DROP TABLE IF EXISTS `ic_form`;
CREATE TABLE "ic_form" (
  "form_id" int(11) NOT NULL AUTO_INCREMENT,
  "model_id" int(11) NOT NULL DEFAULT '0' COMMENT '模型id',
  "actionkey" varchar(64) NOT NULL DEFAULT '',
  "name" varchar(255) NOT NULL DEFAULT '',
  "is_auth" tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要用户登陆',
  PRIMARY KEY ("form_id"),
  KEY "form_id" ("model_id"),
  KEY "actionkey" ("actionkey")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='表单';

-- ----------------------------
-- Records of ic_form
-- ----------------------------
INSERT INTO `ic_form` VALUES ('1', '59', '6df7a549ecf74f7b8a4fda7e9d2f821a', '留言', '1');
INSERT INTO `ic_form` VALUES ('2', '75', 'be30b4081540478abd3a625842158e3d', 'AAAA', '0');

-- ----------------------------
-- Table structure for ic_link
-- ----------------------------
DROP TABLE IF EXISTS `ic_link`;
CREATE TABLE "ic_link" (
  "link_id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(30) NOT NULL DEFAULT '',
  "url" varchar(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  "status" tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  "img" varchar(128) DEFAULT NULL,
  "sort" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("link_id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of ic_link
-- ----------------------------
INSERT INTO `ic_link` VALUES ('1', 'baidu', 'https://ss0.bdstatic.com', '1', 'http://127.0.0.1:8080/r/upload/2016/10/28/1477662576889.jpg', '100');

-- ----------------------------
-- Table structure for ic_member
-- ----------------------------
DROP TABLE IF EXISTS `ic_member`;
CREATE TABLE "ic_member" (
  "member_id" int(11) NOT NULL AUTO_INCREMENT,
  "username" varchar(255) DEFAULT NULL,
  "password" varchar(255) DEFAULT NULL,
  "mobile" varchar(255) DEFAULT NULL,
  "realname" varchar(255) DEFAULT NULL,
  "grade" varchar(255) DEFAULT NULL COMMENT '级别',
  "integral" int(11) DEFAULT NULL COMMENT '积分',
  "salt" char(64) DEFAULT NULL COMMENT '盐',
  "group_id" int(11) NOT NULL DEFAULT '0',
  "email" varchar(128) NOT NULL DEFAULT '',
  "avatar" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("member_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ic_member
-- ----------------------------

-- ----------------------------
-- Table structure for ic_member_group
-- ----------------------------
DROP TABLE IF EXISTS `ic_member_group`;
CREATE TABLE "ic_member_group" (
  "Id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(100) NOT NULL DEFAULT '',
  "need_audit" tinyint(1) NOT NULL DEFAULT '0' COMMENT '需要审核',
  "need_verify" tinyint(1) NOT NULL DEFAULT '0' COMMENT '需要验证码',
  PRIMARY KEY ("Id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组别';

-- ----------------------------
-- Records of ic_member_group
-- ----------------------------

-- ----------------------------
-- Table structure for ic_member_session
-- ----------------------------
DROP TABLE IF EXISTS `ic_member_session`;
CREATE TABLE "ic_member_session" (
  "session_id" varchar(32) NOT NULL DEFAULT '',
  "session_obj" blob NOT NULL,
  "last_active_time" bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("session_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员会话表';

-- ----------------------------
-- Records of ic_member_session
-- ----------------------------

-- ----------------------------
-- Table structure for ic_menu
-- ----------------------------
DROP TABLE IF EXISTS `ic_menu`;
CREATE TABLE "ic_menu" (
  "menu_id" int(11) NOT NULL AUTO_INCREMENT,
  "menu_name" varchar(100) NOT NULL DEFAULT '',
  "menu_url" varchar(50) DEFAULT NULL,
  "permission" varchar(50) DEFAULT NULL,
  "icon" varchar(10) DEFAULT NULL,
  "sort" int(11) NOT NULL DEFAULT '0',
  "pid" int(11) NOT NULL DEFAULT '0',
  "is_open" tinyint(1) NOT NULL DEFAULT '0',
  "status" tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY ("menu_id")
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='自定义菜单';

-- ----------------------------
-- Records of ic_menu
-- ----------------------------
INSERT INTO `ic_menu` VALUES ('1', '内容管理', null, 'content', '&#xe616;', '0', '0', '1', '1');
INSERT INTO `ic_menu` VALUES ('2', '维护更新', null, 'config', '&#xe68f;', '0', '0', '0', '1');
INSERT INTO `ic_menu` VALUES ('3', '用户管理', null, 'admin', '&#xe62d;', '0', '0', '0', '1');
INSERT INTO `ic_menu` VALUES ('4', '系统管理', null, 'config', '&#xe62e;', '0', '0', '0', '1');
INSERT INTO `ic_menu` VALUES ('6', '内容管理', 'content', 'content', null, '1', '1', '0', '1');
INSERT INTO `ic_menu` VALUES ('7', '专题管理', 'topic', 'topic', null, '2', '1', '0', '1');
INSERT INTO `ic_menu` VALUES ('8', '栏目管理', 'category', 'category', null, '3', '1', '0', '1');
INSERT INTO `ic_menu` VALUES ('9', '表单管理', 'form', 'form', null, '4', '1', '0', '1');
INSERT INTO `ic_menu` VALUES ('10', '模型管理', 'model', 'model', null, '5', '1', '0', '1');
INSERT INTO `ic_menu` VALUES ('12', '生成静态', 'static', 'static', null, '12', '2', '0', '1');
INSERT INTO `ic_menu` VALUES ('13', '缓存清理', 'cache', 'cache', null, '3', '2', '0', '1');
INSERT INTO `ic_menu` VALUES ('16', '成员管理', 'admin', 'admin', null, '4', '3', '0', '1');
INSERT INTO `ic_menu` VALUES ('17', '角色管理', 'role', 'role', null, '5', '3', '0', '1');
INSERT INTO `ic_menu` VALUES ('18', '系统管理', 'input', 'config', null, '0', '4', '0', '1');
INSERT INTO `ic_menu` VALUES ('19', '站点管理', 'site', 'site', null, '0', '4', '0', '1');
INSERT INTO `ic_menu` VALUES ('21', 'TAG管理', 'tag', 'tag', null, '0', '4', '0', '1');
INSERT INTO `ic_menu` VALUES ('22', '内容回收', 'recovery', 'recovery', null, '0', '4', '0', '1');
INSERT INTO `ic_menu` VALUES ('23', '友情链接', 'link', 'admin', null, '0', '2', '0', '1');
INSERT INTO `ic_menu` VALUES ('24', '权限管理', 'permission', 'admin', null, '0', '3', '0', '1');
INSERT INTO `ic_menu` VALUES ('25', '菜单管理', 'menu', 'config', null, '0', '4', '0', '1');
INSERT INTO `ic_menu` VALUES ('27', '广告管理', 'ad', 'config', null, '0', '2', '0', '1');

-- ----------------------------
-- Table structure for ic_model
-- ----------------------------
DROP TABLE IF EXISTS `ic_model`;
CREATE TABLE "ic_model" (
  "model_id" int(11) NOT NULL AUTO_INCREMENT,
  "model_name" varchar(255) DEFAULT NULL COMMENT '模型名称',
  "table_name" varchar(255) DEFAULT NULL COMMENT '模型表名称',
  "front_submit" tinyint(1) NOT NULL DEFAULT '0' COMMENT '前台投稿',
  "admin_submit" tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台投稿',
  "site_id" bigint(20) DEFAULT NULL COMMENT '站点id',
  "desc" varchar(255) DEFAULT '' COMMENT '字段描述',
  "status" tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  "is_content" tinyint(1) NOT NULL DEFAULT '1' COMMENT '判断是否为内容模型',
  PRIMARY KEY ("model_id")
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of ic_model
-- ----------------------------
INSERT INTO `ic_model` VALUES ('72', '加入我们', 'join', '0', '0', '1', '**', '1', '1');
INSERT INTO `ic_model` VALUES ('73', '帮助中心', 'help', '0', '0', '1', '**', '1', '1');
INSERT INTO `ic_model` VALUES ('78', '首页', 'picture', '0', '0', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for ic_model_filed
-- ----------------------------
DROP TABLE IF EXISTS `ic_model_filed`;
CREATE TABLE "ic_model_filed" (
  "filed_id" int(11) NOT NULL AUTO_INCREMENT COMMENT '字段编号',
  "model_id" int(11) NOT NULL DEFAULT '0' COMMENT '模型编号',
  "filed_name" varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  "filed_class" varchar(255) NOT NULL DEFAULT '' COMMENT '字段类型（如文本）',
  "filed_value" text COMMENT '字段值',
  "filed_type" varchar(255) NOT NULL DEFAULT '0' COMMENT '字段类别（数据库类别）',
  "alias" varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  "not_null" tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为空',
  "filed_length" int(11) DEFAULT '0',
  PRIMARY KEY ("filed_id")
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='模型字段';

-- ----------------------------
-- Records of ic_model_filed
-- ----------------------------
INSERT INTO `ic_model_filed` VALUES ('48', '72', 'name', 'input', null, 'varchar', '姓名', '0', '255');
INSERT INTO `ic_model_filed` VALUES ('49', '72', 'message', 'editor', null, 'varchar', '信息', '0', '600');
INSERT INTO `ic_model_filed` VALUES ('50', '73', 'answer', 'editor', null, 'varchar', '问题', '1', '600');
INSERT INTO `ic_model_filed` VALUES ('51', '73', 'question', 'editor', null, 'varchar', '回答', '1', '600');
INSERT INTO `ic_model_filed` VALUES ('55', '72', 'choose', 'input', null, 'int', '位置', '0', null);
INSERT INTO `ic_model_filed` VALUES ('63', '72', 'zhiwu', 'input', null, 'varchar', '职务', '0', '255');
INSERT INTO `ic_model_filed` VALUES ('64', '72', 'picurl', 'input', null, 'varchar', '图片链接', '0', '255');
INSERT INTO `ic_model_filed` VALUES ('65', '72', 'picnum', 'input', null, 'varchar', '图片位置', '0', '255');
INSERT INTO `ic_model_filed` VALUES ('67', '72', 'loadhtml', 'file', 'html', 'none', '上传文件', '0', '0');
INSERT INTO `ic_model_filed` VALUES ('73', '73', 'descPic', 'input', null, 'char', '描述', '0', '50');
INSERT INTO `ic_model_filed` VALUES ('74', '73', 'ID', 'input', null, 'char', 'ID', '0', '50');
INSERT INTO `ic_model_filed` VALUES ('78', '78', 'upload', 'picture', null, 'none', '图片上传', '0', '0');
INSERT INTO `ic_model_filed` VALUES ('79', '78', 'ur', 'input', null, 'char', '展示位置', '0', '100');
INSERT INTO `ic_model_filed` VALUES ('81', '78', 'place', 'input', null, 'char', '游玩地点', '0', '50');
INSERT INTO `ic_model_filed` VALUES ('82', '78', 'weather', 'input', null, 'char', '天气', '0', '50');
INSERT INTO `ic_model_filed` VALUES ('83', '78', 'time', 'input', null, 'char', '时间', '0', '50');
INSERT INTO `ic_model_filed` VALUES ('84', '78', 'URLtwp', 'input', null, 'char', '超链接地址', '0', '50');

-- ----------------------------
-- Table structure for ic_permission
-- ----------------------------
DROP TABLE IF EXISTS `ic_permission`;
CREATE TABLE "ic_permission" (
  "permission_id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL DEFAULT '',
  "description" varchar(255) DEFAULT NULL,
  "pid" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("permission_id")
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of ic_permission
-- ----------------------------
INSERT INTO `ic_permission` VALUES ('1', 'admin', '管理员', '0');
INSERT INTO `ic_permission` VALUES ('2', 'admin:input', '添加', '1');
INSERT INTO `ic_permission` VALUES ('3', 'admin:delete', '删除', '1');
INSERT INTO `ic_permission` VALUES ('4', 'site', '站点管理', '0');
INSERT INTO `ic_permission` VALUES ('5', 'site:add', '添加', '4');
INSERT INTO `ic_permission` VALUES ('6', 'site:delete', '删除', '4');
INSERT INTO `ic_permission` VALUES ('7', 'content', '内容管理', '0');
INSERT INTO `ic_permission` VALUES ('8', 'content:add', '添加', '7');
INSERT INTO `ic_permission` VALUES ('9', 'content:delete', '删除', '7');
INSERT INTO `ic_permission` VALUES ('10', 'model', '模型设置', '0');
INSERT INTO `ic_permission` VALUES ('11', 'model:add', '添加', '10');
INSERT INTO `ic_permission` VALUES ('12', 'model:delete', '删除', '10');
INSERT INTO `ic_permission` VALUES ('13', 'config', '系统设置', '0');
INSERT INTO `ic_permission` VALUES ('14', 'config:view', '查看', '13');
INSERT INTO `ic_permission` VALUES ('15', 'config:edit', '修改', '13');
INSERT INTO `ic_permission` VALUES ('16', 'category', '栏目设置', '0');
INSERT INTO `ic_permission` VALUES ('17', 'category:add', '添加', '16');
INSERT INTO `ic_permission` VALUES ('18', 'category:delete', '删除', '16');
INSERT INTO `ic_permission` VALUES ('22', 'role', '角色管理', '0');
INSERT INTO `ic_permission` VALUES ('23', 'role:add', '添加', '22');
INSERT INTO `ic_permission` VALUES ('24', 'role:delete', '删除', '22');
INSERT INTO `ic_permission` VALUES ('25', 'content:verify', '审核', '7');
INSERT INTO `ic_permission` VALUES ('26', 'tag', 'Tag管理', '0');
INSERT INTO `ic_permission` VALUES ('27', 'tag:view', '查看', '26');
INSERT INTO `ic_permission` VALUES ('28', 'tag:delete', '删除', '26');
INSERT INTO `ic_permission` VALUES ('29', 'content:recovery', '回收站', '7');
INSERT INTO `ic_permission` VALUES ('30', 'model:modelfiled', '字段', '10');
INSERT INTO `ic_permission` VALUES ('31', 'test', '测试', '0');
INSERT INTO `ic_permission` VALUES ('32', 'topic', '专题管理', '7');
INSERT INTO `ic_permission` VALUES ('33', 'topic:input', '专题添加', '32');
INSERT INTO `ic_permission` VALUES ('34', 'topic:del', '专题删除', '32');
INSERT INTO `ic_permission` VALUES ('35', 'form', '表单', '7');

-- ----------------------------
-- Table structure for ic_role
-- ----------------------------
DROP TABLE IF EXISTS `ic_role`;
CREATE TABLE "ic_role" (
  "role_id" int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  "rolename" varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  "description" text COMMENT '描述',
  PRIMARY KEY ("role_id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ic_role
-- ----------------------------
INSERT INTO `ic_role` VALUES ('1', '超级管理员', '测试');

-- ----------------------------
-- Table structure for ic_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ic_role_permission`;
CREATE TABLE "ic_role_permission" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "role_id" int(11) NOT NULL DEFAULT '0',
  "permisson_id" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  KEY "rid" ("role_id"),
  KEY "pid" ("permisson_id")
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_role_permission
-- ----------------------------
INSERT INTO `ic_role_permission` VALUES ('379', '1', '1');
INSERT INTO `ic_role_permission` VALUES ('380', '1', '2');
INSERT INTO `ic_role_permission` VALUES ('381', '1', '3');
INSERT INTO `ic_role_permission` VALUES ('382', '1', '4');
INSERT INTO `ic_role_permission` VALUES ('383', '1', '5');
INSERT INTO `ic_role_permission` VALUES ('384', '1', '6');
INSERT INTO `ic_role_permission` VALUES ('385', '1', '7');
INSERT INTO `ic_role_permission` VALUES ('386', '1', '8');
INSERT INTO `ic_role_permission` VALUES ('387', '1', '9');
INSERT INTO `ic_role_permission` VALUES ('388', '1', '25');
INSERT INTO `ic_role_permission` VALUES ('389', '1', '29');
INSERT INTO `ic_role_permission` VALUES ('390', '1', '32');
INSERT INTO `ic_role_permission` VALUES ('391', '1', '35');
INSERT INTO `ic_role_permission` VALUES ('392', '1', '10');
INSERT INTO `ic_role_permission` VALUES ('393', '1', '11');
INSERT INTO `ic_role_permission` VALUES ('394', '1', '12');
INSERT INTO `ic_role_permission` VALUES ('395', '1', '30');
INSERT INTO `ic_role_permission` VALUES ('396', '1', '13');
INSERT INTO `ic_role_permission` VALUES ('397', '1', '14');
INSERT INTO `ic_role_permission` VALUES ('398', '1', '15');
INSERT INTO `ic_role_permission` VALUES ('399', '1', '16');
INSERT INTO `ic_role_permission` VALUES ('400', '1', '17');
INSERT INTO `ic_role_permission` VALUES ('401', '1', '18');
INSERT INTO `ic_role_permission` VALUES ('402', '1', '22');
INSERT INTO `ic_role_permission` VALUES ('403', '1', '23');
INSERT INTO `ic_role_permission` VALUES ('404', '1', '24');
INSERT INTO `ic_role_permission` VALUES ('405', '1', '26');
INSERT INTO `ic_role_permission` VALUES ('406', '1', '27');
INSERT INTO `ic_role_permission` VALUES ('407', '1', '28');

-- ----------------------------
-- Table structure for ic_search_words
-- ----------------------------
DROP TABLE IF EXISTS `ic_search_words`;
CREATE TABLE "ic_search_words" (
  "word_id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL COMMENT '搜索词汇',
  "hit_count" int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  "is_recommend" tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  "site_id" int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  PRIMARY KEY ("word_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索热词';

-- ----------------------------
-- Records of ic_search_words
-- ----------------------------

-- ----------------------------
-- Table structure for ic_tag
-- ----------------------------
DROP TABLE IF EXISTS `ic_tag`;
CREATE TABLE "ic_tag" (
  "tag_id" int(11) NOT NULL AUTO_INCREMENT,
  "tag_name" varchar(64) NOT NULL DEFAULT '',
  "letter" varchar(255) NOT NULL DEFAULT '',
  "count" int(11) DEFAULT '0',
  PRIMARY KEY ("tag_id"),
  KEY "name" ("tag_name"),
  KEY "letter" ("letter")
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='标记';

-- ----------------------------
-- Records of ic_tag
-- ----------------------------
INSERT INTO `ic_tag` VALUES ('7', 'DFSF', 'DFSF', '1');
INSERT INTO `ic_tag` VALUES ('8', '内容', 'neirong', '2');
INSERT INTO `ic_tag` VALUES ('9', '测试', 'ceshi', '3');
INSERT INTO `ic_tag` VALUES ('11', '测试2', 'ceshi2', '2');
INSERT INTO `ic_tag` VALUES ('12', '多福多壽', 'duofuduoshou', '1');
INSERT INTO `ic_tag` VALUES ('13', '都放到沙發上', 'doufangdaoshafashang', '1');
INSERT INTO `ic_tag` VALUES ('14', '新闻测试', 'xinwenceshi', '4');
INSERT INTO `ic_tag` VALUES ('15', 'REWREW', 'REWREW', '1');
INSERT INTO `ic_tag` VALUES ('16', '打撒', 'dasa', '2');
INSERT INTO `ic_tag` VALUES ('17', '反反复复', 'fanfanfufu', '2');
INSERT INTO `ic_tag` VALUES ('18', '发生的', 'fashengde', '1');
INSERT INTO `ic_tag` VALUES ('19', '撒旦 ', 'sadan', '3');
INSERT INTO `ic_tag` VALUES ('20', '关于集团召开年会的通知', 'guanyujituanzhaokainianhuidetongzhi', '1');
INSERT INTO `ic_tag` VALUES ('21', 'Android', 'Android', '1');
INSERT INTO `ic_tag` VALUES ('22', '腾讯', 'tengxun', '1');
INSERT INTO `ic_tag` VALUES ('23', '响应式商城', 'xiangyingshishangcheng', '2');
INSERT INTO `ic_tag` VALUES ('24', '软件测试人员', 'ruanjianceshirenyuan', '1');
INSERT INTO `ic_tag` VALUES ('25', 'join ', 'join', '3');
INSERT INTO `ic_tag` VALUES ('26', '1', '1', '2');

-- ----------------------------
-- Table structure for ic_tag_content
-- ----------------------------
DROP TABLE IF EXISTS `ic_tag_content`;
CREATE TABLE "ic_tag_content" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "tag_id" int(11) NOT NULL DEFAULT '0',
  "content_id" bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY ("id"),
  KEY "content_id" ("content_id"),
  KEY "tag_Id" ("tag_id")
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='标签内容';

-- ----------------------------
-- Records of ic_tag_content
-- ----------------------------
INSERT INTO `ic_tag_content` VALUES ('1', '12', '5');
INSERT INTO `ic_tag_content` VALUES ('2', '13', '5');
INSERT INTO `ic_tag_content` VALUES ('3', '14', '5');
INSERT INTO `ic_tag_content` VALUES ('4', '14', '7');
INSERT INTO `ic_tag_content` VALUES ('5', '15', '7');
INSERT INTO `ic_tag_content` VALUES ('6', '16', '7');
INSERT INTO `ic_tag_content` VALUES ('7', '17', '7');
INSERT INTO `ic_tag_content` VALUES ('8', '18', '38');
INSERT INTO `ic_tag_content` VALUES ('9', '19', '38');
INSERT INTO `ic_tag_content` VALUES ('10', '19', '8');
INSERT INTO `ic_tag_content` VALUES ('11', '19', '41');
INSERT INTO `ic_tag_content` VALUES ('12', '8', '1');
INSERT INTO `ic_tag_content` VALUES ('13', '9', '1');
INSERT INTO `ic_tag_content` VALUES ('14', '20', '2');
INSERT INTO `ic_tag_content` VALUES ('15', '21', '3');
INSERT INTO `ic_tag_content` VALUES ('16', '22', '4');
INSERT INTO `ic_tag_content` VALUES ('17', '23', '5');
INSERT INTO `ic_tag_content` VALUES ('18', '23', '6');
INSERT INTO `ic_tag_content` VALUES ('19', '24', '8');
INSERT INTO `ic_tag_content` VALUES ('20', '25', '25');
INSERT INTO `ic_tag_content` VALUES ('21', '25', '28');
INSERT INTO `ic_tag_content` VALUES ('22', '25', '33');
INSERT INTO `ic_tag_content` VALUES ('23', '26', '42');
INSERT INTO `ic_tag_content` VALUES ('24', '26', '90');

-- ----------------------------
-- Table structure for ic_task_content
-- ----------------------------
DROP TABLE IF EXISTS `ic_task_content`;
CREATE TABLE "ic_task_content" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "content_id" bigint(20) NOT NULL DEFAULT '0' COMMENT '名称',
  "exp" varchar(50) NOT NULL COMMENT '表达式',
  "status" tinyint(1) NOT NULL DEFAULT '1',
  "date_time" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  KEY "content_id" ("content_id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ic_task_content
-- ----------------------------
INSERT INTO `ic_task_content` VALUES ('3', '5', '59 59 23 * * ?', '0', '2016-10-11 19:36:28');

-- ----------------------------
-- Table structure for ic_topic
-- ----------------------------
DROP TABLE IF EXISTS `ic_topic`;
CREATE TABLE "ic_topic" (
  "topic_id" int(11) NOT NULL AUTO_INCREMENT,
  "category_ids" varchar(128) DEFAULT '',
  "topic_name" varchar(150) NOT NULL COMMENT '名称',
  "short_name" varchar(150) DEFAULT NULL COMMENT '简称',
  "keywords" varchar(255) DEFAULT NULL COMMENT '关键字',
  "description" varchar(255) DEFAULT NULL COMMENT '描述',
  "title_img" varchar(100) DEFAULT NULL COMMENT '标题图',
  "content_img" varchar(100) DEFAULT NULL COMMENT '内容图',
  "tpl_content" varchar(100) DEFAULT NULL COMMENT '专题模板',
  "priority" int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  "is_recommend" tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY ("topic_id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of ic_topic
-- ----------------------------
INSERT INTO `ic_topic` VALUES ('2', '8,9', '测试颠倒是非', '测试的说法的事', '测试', '测试', 'http://127.0.0.1:8080/r/upload/2016/10/24/1477310411395.jpg', 'http://127.0.0.1:8080/r/upload/2016/10/24/1477310413247.jpg', '/topic.html', '0', '0');
INSERT INTO `ic_topic` VALUES ('3', '0', '打撒撒旦', '达到大时代', '打撒', '达到阿斯顿撒旦爱的', 'http://127.0.0.1:8080/r/upload/2016/10/24/1477310608572.jpg', 'http://127.0.0.1:8080/r/upload/2016/10/24/1477310612981.jpg', '/topic.html', '0', '1');

-- ----------------------------
-- Table structure for ic_website
-- ----------------------------
DROP TABLE IF EXISTS `ic_website`;
CREATE TABLE "ic_website" (
  "site_id" int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  "sitename" varchar(255) DEFAULT NULL COMMENT '站点名称',
  "domain" varchar(255) NOT NULL DEFAULT '' COMMENT '域名',
  "language" char(10) DEFAULT '' COMMENT '语言',
  "template" varchar(20) DEFAULT '' COMMENT '模板',
  "title" varchar(64) DEFAULT NULL,
  "keyword" varchar(60) DEFAULT '' COMMENT '关键字',
  "description" text COMMENT '描述',
  "is_mobile" tinyint(1) DEFAULT '0' COMMENT '移动是否开启',
  "mobile_tpl" varchar(255) DEFAULT 'mobile' COMMENT '手机模板',
  PRIMARY KEY ("site_id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点';

-- ----------------------------
-- Records of ic_website
-- ----------------------------
INSERT INTO `ic_website` VALUES ('1', '主站', 'localhost:8080', '', 'default', null, '关键字', '首页', '0', 'mobile');

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : little_devil

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-08-19 22:28:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_apply_info
-- ----------------------------
DROP TABLE IF EXISTS `t_apply_info`;
CREATE TABLE `t_apply_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL COMMENT '申请类型 1：业务员申请 2：商户申请',
  `state` varchar(2) DEFAULT NULL COMMENT '申请状态',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='所有申请信息表';

-- ----------------------------
-- Records of t_apply_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_app_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `t_app_extend_info`;
CREATE TABLE `t_app_extend_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='应用扩展表（应用关联用户类型）';

-- ----------------------------
-- Records of t_app_extend_info
-- ----------------------------
INSERT INTO `t_app_extend_info` VALUES ('11', 'sys', '24');
INSERT INTO `t_app_extend_info` VALUES ('24', 'sys', '6');
INSERT INTO `t_app_extend_info` VALUES ('27', 'sys', '1');
INSERT INTO `t_app_extend_info` VALUES ('28', 'sys', '7');
INSERT INTO `t_app_extend_info` VALUES ('29', 'company', '7');

-- ----------------------------
-- Table structure for t_app_info
-- ----------------------------
DROP TABLE IF EXISTS `t_app_info`;
CREATE TABLE `t_app_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_name` varchar(200) DEFAULT NULL COMMENT '应用名称',
  `app_code` varchar(20) DEFAULT NULL COMMENT '应用编码',
  `request_url` varchar(100) DEFAULT NULL COMMENT '访问地址',
  `app_logo` varchar(200) DEFAULT NULL COMMENT '图标',
  `app_sort` int(11) DEFAULT '0' COMMENT '排序号',
  `is_pay` varchar(2) DEFAULT '0' COMMENT '是否付费：0免费；1付费',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：0下架；1上架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of t_app_info
-- ----------------------------
INSERT INTO `t_app_info` VALUES ('1', '商户管理', 'SHGL', '/companyInfo/toCompanyList', '222', '4', '0', '1');
INSERT INTO `t_app_info` VALUES ('6', '系统用户管理', 'XTYHGL', '/admin/userList', '111', '2', '1', '0');
INSERT INTO `t_app_info` VALUES ('7', '个人用户管理', 'GRYHGL', '/person/userList', '111', '3', '1', '1');

-- ----------------------------
-- Table structure for t_app_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_app_operation`;
CREATE TABLE `t_app_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operation_name` varchar(100) NOT NULL COMMENT '操作名称',
  `app_id` int(11) NOT NULL COMMENT '应用ID',
  `operation_code` varchar(20) DEFAULT NULL COMMENT '操作编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='应用权限表';

-- ----------------------------
-- Records of t_app_operation
-- ----------------------------
INSERT INTO `t_app_operation` VALUES ('7', '添加', '1', 'add');
INSERT INTO `t_app_operation` VALUES ('8', '查询', '1', 'select');
INSERT INTO `t_app_operation` VALUES ('10', '查看', '6', 'look');
INSERT INTO `t_app_operation` VALUES ('12', '添加', '6', 'add');
INSERT INTO `t_app_operation` VALUES ('13', '删除', '1', 'delete');
INSERT INTO `t_app_operation` VALUES ('14', '删除', '6', 'delete');

-- ----------------------------
-- Table structure for t_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth` (
  `id` int(11) NOT NULL COMMENT '认证表',
  `user_id` int(11) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL COMMENT '状态',
  `creat_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth
-- ----------------------------

-- ----------------------------
-- Table structure for t_commodity_category
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_category`;
CREATE TABLE `t_commodity_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `commodity_ids` varchar(11) DEFAULT NULL COMMENT '商品id(多个,以逗号隔开)',
  `category_name` varchar(255) DEFAULT NULL,
  `creat_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `state` varchar(2) DEFAULT NULL COMMENT '状态  0：下线 1：上线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品种类';

-- ----------------------------
-- Records of t_commodity_category
-- ----------------------------
INSERT INTO `t_commodity_category` VALUES ('2', '6', '1,2', '你懂得', '2017-09-11 20:21:52', '2017-09-17 20:28:52', '1');
INSERT INTO `t_commodity_category` VALUES ('3', '6', '1', '高端', '2017-09-12 20:22:46', '2017-09-17 20:29:03', '0');

-- ----------------------------
-- Table structure for t_commodity_promotion
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_promotion`;
CREATE TABLE `t_commodity_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `company_id` int(11) DEFAULT NULL COMMENT '公司id',
  `commodity_id` int(11) DEFAULT NULL COMMENT '商品id',
  `promotion_id` int(11) DEFAULT NULL COMMENT '活动id ',
  `creat_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品活动';

-- ----------------------------
-- Records of t_commodity_promotion
-- ----------------------------
INSERT INTO `t_commodity_promotion` VALUES ('2', '6', null, null, '2017-09-11 20:21:52', '2017-09-17 20:28:52');
INSERT INTO `t_commodity_promotion` VALUES ('3', '6', '1', null, '2017-09-12 20:22:46', '2018-05-08 21:40:42');

-- ----------------------------
-- Table structure for t_company_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_company_auth`;
CREATE TABLE `t_company_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleman_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `invitation_code` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT '1' COMMENT '0：通过,1：不通过',
  `creat_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `validity_time` timestamp NULL DEFAULT NULL COMMENT '有效期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家认证表';

-- ----------------------------
-- Records of t_company_auth
-- ----------------------------

-- ----------------------------
-- Table structure for t_company_commodity
-- ----------------------------
DROP TABLE IF EXISTS `t_company_commodity`;
CREATE TABLE `t_company_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` int(11) NOT NULL COMMENT '企业ID',
  `commodity_name` varchar(11) DEFAULT NULL COMMENT '商品名称',
  `commodity_price` double(20,2) DEFAULT NULL COMMENT '商品价格',
  `commodity_note` text COMMENT '商品简介',
  `commodity_logo` varchar(500) DEFAULT NULL COMMENT '商品图标',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：0下线；1上线',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `unit` int(2) DEFAULT NULL COMMENT '单位',
  `is_delete` varchar(2) DEFAULT NULL COMMENT '是否删除：0是1否',
  `collection_number` int(11) DEFAULT NULL COMMENT '收藏次数',
  `follow_number` int(11) DEFAULT NULL COMMENT '关注次数',
  `browse_number` int(11) DEFAULT NULL COMMENT '浏览次数',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买次数',
  `binding_number` int(11) DEFAULT NULL COMMENT '捆绑次数',
  `top` int(2) DEFAULT NULL COMMENT '置顶',
  `recommend` int(2) DEFAULT NULL COMMENT '推荐',
  `creat_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商户商品表';

-- ----------------------------
-- Records of t_company_commodity
-- ----------------------------
INSERT INTO `t_company_commodity` VALUES ('1', '6', '900套餐：买一送一', '900.00', '900套餐：全套', '11111', '1', null, '0', null, null, null, null, null, null, null, null, '2017-08-22 21:00:55');
INSERT INTO `t_company_commodity` VALUES ('2', '6', '300全套：特价优惠', '300.00', '300全套', '11111', '0', null, '0', null, null, null, null, null, null, null, null, '2017-08-12 19:29:12');
INSERT INTO `t_company_commodity` VALUES ('3', '0', '现金', '0.00', '现金', null, '1', null, '0', null, null, null, null, null, null, null, null, '2017-09-04 20:58:12');
INSERT INTO `t_company_commodity` VALUES ('4', '6', '限时优惠', '111.00', '11111', '111', '1', null, null, null, null, null, null, null, null, null, null, '2017-09-07 22:06:41');

-- ----------------------------
-- Table structure for t_company_info
-- ----------------------------
DROP TABLE IF EXISTS `t_company_info`;
CREATE TABLE `t_company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL COMMENT '企业名称',
  `company_logo` varchar(500) DEFAULT NULL COMMENT '企业图标',
  `company_type` int(11) DEFAULT NULL COMMENT '企业类型',
  `link_person` varchar(200) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `provice_code` varchar(20) DEFAULT NULL COMMENT '省编码',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市编码',
  `county_code` varchar(20) DEFAULT NULL COMMENT '区县编码',
  `area_string` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `latitude` varchar(100) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(100) DEFAULT NULL COMMENT '精度',
  `coordinate` varchar(100) DEFAULT NULL COMMENT '坐标',
  `register_time` timestamp NULL DEFAULT NULL,
  `is_state` varchar(2) DEFAULT NULL COMMENT '认证状态(1启用，0禁用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商户信息表';

-- ----------------------------
-- Records of t_company_info
-- ----------------------------
INSERT INTO `t_company_info` VALUES ('6', '6', '大唐店', 'res/upload/111.jpg', '1', '222', '15111111111', '420000', '420100', '420102', '湖北省武汉市江岸区', '复兴路', '30.5258600000', '114.3298900000', null, '2018-08-08 10:14:24', null);
INSERT INTO `t_company_info` VALUES ('7', '6', '大浪店', 'res/upload/444.jpg', '2', '222', '15111111112', '420000', '420100', '420103', '湖北省武汉市江汉区', '长征街', '30.5274261012', '114.3216919899', null, '2018-08-08 10:14:33', null);
INSERT INTO `t_company_info` VALUES ('8', '8', '天健店', 'res/upload/333.jpg', '3', '222', '15111111113', null, null, null, '湖北省武汉市江汉区', null, null, null, null, '2018-08-08 10:14:27', null);
INSERT INTO `t_company_info` VALUES ('9', '9', '金币店', 'res/upload/222.jpg', '4', '222', '15111111114', null, null, null, '湖北省武汉市江岸区', null, null, null, null, '2017-06-13 16:22:46', null);
INSERT INTO `t_company_info` VALUES ('10', '10', '隐蔽店', 'res/upload/333.jpg', '5', '222', '15111111115', null, null, null, '湖北省武汉市江岸区', null, null, null, null, '2017-06-15 11:14:23', null);

-- ----------------------------
-- Table structure for t_company_member
-- ----------------------------
DROP TABLE IF EXISTS `t_company_member`;
CREATE TABLE `t_company_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `company_id` int(11) NOT NULL COMMENT '企业ID',
  `member_type` int(11) DEFAULT '0' COMMENT '会员类型',
  `member_card` varchar(11) DEFAULT NULL,
  `is_delete` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否删除：0是1否',
  `cash` double(8,0) DEFAULT NULL COMMENT '剩余金额',
  `remark` varchar(255) DEFAULT NULL,
  `creat_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商户会员表';

-- ----------------------------
-- Records of t_company_member
-- ----------------------------
INSERT INTO `t_company_member` VALUES ('3', '14', '6', null, null, '1', '20000', null, '2017-07-11 21:22:19');
INSERT INTO `t_company_member` VALUES ('4', '14', '0', null, null, '1', '24555', null, '2017-07-03 21:22:24');
INSERT INTO `t_company_member` VALUES ('8', '22', '0', null, null, '1', '1000', null, '2017-07-05 21:22:27');
INSERT INTO `t_company_member` VALUES ('9', '17', '6', null, null, '1', '8999', null, '2017-07-01 21:22:31');
INSERT INTO `t_company_member` VALUES ('10', '19', '6', null, null, '1', '600', null, '2017-07-13 21:22:34');
INSERT INTO `t_company_member` VALUES ('11', '19', '0', null, null, '1', '7999', null, '2017-07-06 21:22:37');
INSERT INTO `t_company_member` VALUES ('12', '17', '7', null, null, '1', '6', null, '2017-07-05 21:22:40');

-- ----------------------------
-- Table structure for t_company_paytype
-- ----------------------------
DROP TABLE IF EXISTS `t_company_paytype`;
CREATE TABLE `t_company_paytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_type` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `company_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `pay_type_pictrue` varchar(500) DEFAULT NULL COMMENT '支付二维码',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：0禁止；1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company_paytype
-- ----------------------------

-- ----------------------------
-- Table structure for t_company_promotion
-- ----------------------------
DROP TABLE IF EXISTS `t_company_promotion`;
CREATE TABLE `t_company_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` int(11) NOT NULL COMMENT '企业ID',
  `promotion_name` varchar(11) DEFAULT NULL COMMENT '活动名称',
  `promotion_price` double(20,2) DEFAULT NULL COMMENT '活动价格',
  `promotion_note` text COMMENT '活动简介',
  `promotion_logo` varchar(500) DEFAULT NULL COMMENT '活动图标',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：0通过，1未通过，2未审核',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `unit` int(2) DEFAULT NULL COMMENT '单位',
  `is_delete` varchar(2) DEFAULT NULL COMMENT '是否删除：0是1否',
  `collection_number` int(11) DEFAULT NULL COMMENT '收藏次数',
  `follow_number` int(11) DEFAULT NULL COMMENT '关注次数',
  `browse_number` int(11) DEFAULT NULL COMMENT '浏览次数',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买次数',
  `binding_number` int(11) DEFAULT NULL COMMENT '捆绑次数',
  `top` int(2) DEFAULT NULL COMMENT '置顶',
  `recommend` int(2) DEFAULT NULL COMMENT '推荐',
  `creat_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `active_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '有效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商户商品表';

-- ----------------------------
-- Records of t_company_promotion
-- ----------------------------
INSERT INTO `t_company_promotion` VALUES ('1', '6', '900套餐：买一送一', '899.00', '900套餐：全套', '11111', '1', null, '0', null, null, null, null, null, null, null, null, '2018-03-19 20:57:34', null);
INSERT INTO `t_company_promotion` VALUES ('2', '6', '300全套：特价优惠', '300.00', '300全套', '11111', '0', null, '0', null, null, null, null, null, null, null, null, '2017-08-12 19:29:12', null);
INSERT INTO `t_company_promotion` VALUES ('3', '0', '现金', '0.00', '现金', null, '1', null, '0', null, null, null, null, null, null, null, null, '2017-09-04 20:58:12', null);
INSERT INTO `t_company_promotion` VALUES ('4', '6', '限时优惠', '111.00', '11111', '111', '1', null, null, null, null, null, null, null, null, null, null, '2017-09-07 22:06:41', null);

-- ----------------------------
-- Table structure for t_company_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `t_company_recharge_log`;
CREATE TABLE `t_company_recharge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `validity_date` varchar(11) DEFAULT NULL COMMENT '天数',
  `creat_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户充值流水';

-- ----------------------------
-- Records of t_company_recharge_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_company_role
-- ----------------------------
DROP TABLE IF EXISTS `t_company_role`;
CREATE TABLE `t_company_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `role_name` varchar(200) DEFAULT NULL COMMENT '角色名称',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：0禁用；1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商户角色表';

-- ----------------------------
-- Records of t_company_role
-- ----------------------------
INSERT INTO `t_company_role` VALUES ('1', '0', '超管', '1');
INSERT INTO `t_company_role` VALUES ('2', '0', '财务', '1');
INSERT INTO `t_company_role` VALUES ('3', '0', '普通', '1');
INSERT INTO `t_company_role` VALUES ('4', '0', 'admin', '1');
INSERT INTO `t_company_role` VALUES ('5', '0', '平台普通会员', '1');

-- ----------------------------
-- Table structure for t_company_role_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_company_role_operation`;
CREATE TABLE `t_company_role_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商户角色权限关联表';

-- ----------------------------
-- Records of t_company_role_operation
-- ----------------------------
INSERT INTO `t_company_role_operation` VALUES ('8', '1', '1', '7');
INSERT INTO `t_company_role_operation` VALUES ('9', '1', '1', '9');
INSERT INTO `t_company_role_operation` VALUES ('10', '1', '6', '11');
INSERT INTO `t_company_role_operation` VALUES ('11', '1', '6', '12');

-- ----------------------------
-- Table structure for t_company_staff
-- ----------------------------
DROP TABLE IF EXISTS `t_company_staff`;
CREATE TABLE `t_company_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `company_id` int(11) NOT NULL COMMENT '企业ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `is_delete` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否删除：0是1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商户员工表';

-- ----------------------------
-- Records of t_company_staff
-- ----------------------------
INSERT INTO `t_company_staff` VALUES ('1', '19', '0', '1', '1');
INSERT INTO `t_company_staff` VALUES ('2', '16', '0', '4', '1');
INSERT INTO `t_company_staff` VALUES ('3', '25', '0', '5', '1');

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DIC_NAME` varchar(100) NOT NULL COMMENT '名称',
  `DIC_CODE` varchar(20) NOT NULL COMMENT '编码值',
  `PARENT_ID` int(11) unsigned DEFAULT NULL COMMENT '父节点--关联字典表ID',
  `IS_TOP` varchar(2) DEFAULT NULL COMMENT '是否顶级 01是；02不是',
  `IS_LAST` varchar(2) DEFAULT NULL COMMENT '是否最后一级 01是；02不是',
  `LVL` varchar(2) DEFAULT NULL COMMENT '级别',
  `CONTENT` varchar(200) DEFAULT NULL COMMENT '内容值',
  `SORT` varchar(12) DEFAULT NULL COMMENT '排序序号',
  `STATE` varchar(2) DEFAULT NULL COMMENT '状态 1启用；0停用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典表';

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for t_district
-- ----------------------------
DROP TABLE IF EXISTS `t_district`;
CREATE TABLE `t_district` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DISTRICT_CODE` varchar(6) NOT NULL COMMENT '区域编码',
  `DISTRICT_NAME` varchar(32) NOT NULL COMMENT '名称',
  `PARENT_CODE` varchar(32) NOT NULL COMMENT '上级区域ID',
  `SORT` varchar(12) DEFAULT '0' COMMENT '排序序号',
  `STATE` varchar(2) NOT NULL DEFAULT '1' COMMENT '状态 0停用；1启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4085 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全国区域表';

-- ----------------------------
-- Records of t_district
-- ----------------------------
INSERT INTO `t_district` VALUES ('1', '110000', '北京市', '000000', '1', '1');
INSERT INTO `t_district` VALUES ('2', '120000', '天津市', '000000', '2', '1');
INSERT INTO `t_district` VALUES ('3', '130000', '河北省', '000000', '3', '1');
INSERT INTO `t_district` VALUES ('4', '140000', '山西省', '000000', '4', '1');
INSERT INTO `t_district` VALUES ('5', '150000', '内蒙古自治区', '000000', '5', '1');
INSERT INTO `t_district` VALUES ('6', '210000', '辽宁省', '000000', '6', '1');
INSERT INTO `t_district` VALUES ('7', '220000', '吉林省', '000000', '7', '1');
INSERT INTO `t_district` VALUES ('8', '230000', '黑龙江省', '000000', '8', '1');
INSERT INTO `t_district` VALUES ('9', '310000', '上海市', '000000', '9', '1');
INSERT INTO `t_district` VALUES ('10', '320000', '江苏省', '000000', '10', '1');
INSERT INTO `t_district` VALUES ('11', '330000', '浙江省', '000000', '11', '1');
INSERT INTO `t_district` VALUES ('12', '340000', '安徽省', '000000', '12', '1');
INSERT INTO `t_district` VALUES ('13', '350000', '福建省', '000000', '13', '1');
INSERT INTO `t_district` VALUES ('14', '360000', '江西省', '000000', '14', '1');
INSERT INTO `t_district` VALUES ('15', '370000', '山东省', '000000', '15', '1');
INSERT INTO `t_district` VALUES ('16', '410000', '河南省', '000000', '16', '1');
INSERT INTO `t_district` VALUES ('17', '420000', '湖北省', '000000', '17', '1');
INSERT INTO `t_district` VALUES ('18', '430000', '湖南省', '000000', '18', '1');
INSERT INTO `t_district` VALUES ('19', '440000', '广东省', '000000', '19', '1');
INSERT INTO `t_district` VALUES ('20', '450000', '广西壮族自治区', '000000', '20', '1');
INSERT INTO `t_district` VALUES ('21', '460000', '海南省', '000000', '21', '1');
INSERT INTO `t_district` VALUES ('22', '500000', '重庆市', '000000', '22', '1');
INSERT INTO `t_district` VALUES ('23', '510000', '四川省', '000000', '23', '1');
INSERT INTO `t_district` VALUES ('24', '520000', '贵州省', '000000', '24', '1');
INSERT INTO `t_district` VALUES ('25', '530000', '云南省', '000000', '25', '1');
INSERT INTO `t_district` VALUES ('26', '540000', '西藏自治区', '000000', '26', '1');
INSERT INTO `t_district` VALUES ('27', '610000', '陕西省', '000000', '27', '1');
INSERT INTO `t_district` VALUES ('28', '620000', '甘肃省', '000000', '28', '1');
INSERT INTO `t_district` VALUES ('29', '630000', '青海省', '000000', '29', '1');
INSERT INTO `t_district` VALUES ('30', '640000', '宁夏回族自治区', '000000', '30', '1');
INSERT INTO `t_district` VALUES ('31', '650000', '新疆维吾尔自治区', '000000', '31', '1');
INSERT INTO `t_district` VALUES ('32', '710000', '台湾省', '000000', '32', '1');
INSERT INTO `t_district` VALUES ('33', '810000', '香港特别行政区', '000000', '33', '1');
INSERT INTO `t_district` VALUES ('34', '820000', '澳门特别行政区', '000000', '34', '1');
INSERT INTO `t_district` VALUES ('35', '110100', '市辖区', '110000', '35', '1');
INSERT INTO `t_district` VALUES ('36', '110200', '县', '110000', '36', '1');
INSERT INTO `t_district` VALUES ('37', '120100', '市辖区', '120000', '37', '1');
INSERT INTO `t_district` VALUES ('38', '120200', '县', '120000', '38', '1');
INSERT INTO `t_district` VALUES ('39', '130100', '石家庄市', '130000', '39', '1');
INSERT INTO `t_district` VALUES ('40', '130200', '唐山市', '130000', '40', '1');
INSERT INTO `t_district` VALUES ('41', '130300', '秦皇岛市', '130000', '41', '1');
INSERT INTO `t_district` VALUES ('42', '130400', '邯郸市', '130000', '42', '1');
INSERT INTO `t_district` VALUES ('43', '130500', '邢台市', '130000', '43', '1');
INSERT INTO `t_district` VALUES ('44', '130600', '保定市', '130000', '44', '1');
INSERT INTO `t_district` VALUES ('45', '130700', '张家口市', '130000', '45', '1');
INSERT INTO `t_district` VALUES ('46', '130800', '承德市', '130000', '46', '1');
INSERT INTO `t_district` VALUES ('47', '130900', '沧州市', '130000', '47', '1');
INSERT INTO `t_district` VALUES ('48', '131000', '廊坊市', '130000', '48', '1');
INSERT INTO `t_district` VALUES ('49', '131100', '衡水市', '130000', '49', '1');
INSERT INTO `t_district` VALUES ('50', '140100', '太原市', '140000', '50', '1');
INSERT INTO `t_district` VALUES ('51', '140200', '大同市', '140000', '51', '1');
INSERT INTO `t_district` VALUES ('52', '140300', '阳泉市', '140000', '52', '1');
INSERT INTO `t_district` VALUES ('53', '140400', '长治市', '140000', '53', '1');
INSERT INTO `t_district` VALUES ('54', '140500', '晋城市', '140000', '54', '1');
INSERT INTO `t_district` VALUES ('55', '140600', '朔州市', '140000', '55', '1');
INSERT INTO `t_district` VALUES ('56', '140700', '晋中市', '140000', '56', '1');
INSERT INTO `t_district` VALUES ('57', '140800', '运城市', '140000', '57', '1');
INSERT INTO `t_district` VALUES ('58', '140900', '忻州市', '140000', '58', '1');
INSERT INTO `t_district` VALUES ('59', '141000', '临汾市', '140000', '59', '1');
INSERT INTO `t_district` VALUES ('60', '141100', '吕梁市', '140000', '60', '1');
INSERT INTO `t_district` VALUES ('61', '150100', '呼和浩特市', '150000', '61', '1');
INSERT INTO `t_district` VALUES ('62', '150200', '包头市', '150000', '62', '1');
INSERT INTO `t_district` VALUES ('63', '150300', '乌海市', '150000', '63', '1');
INSERT INTO `t_district` VALUES ('64', '150400', '赤峰市', '150000', '64', '1');
INSERT INTO `t_district` VALUES ('65', '150500', '通辽市', '150000', '65', '1');
INSERT INTO `t_district` VALUES ('66', '150600', '鄂尔多斯市', '150000', '66', '1');
INSERT INTO `t_district` VALUES ('67', '150700', '呼伦贝尔市', '150000', '67', '1');
INSERT INTO `t_district` VALUES ('68', '150800', '巴彦淖尔市', '150000', '68', '1');
INSERT INTO `t_district` VALUES ('69', '150900', '乌兰察布市', '150000', '69', '1');
INSERT INTO `t_district` VALUES ('70', '152200', '兴安盟', '150000', '70', '1');
INSERT INTO `t_district` VALUES ('71', '152500', '锡林郭勒盟', '150000', '71', '1');
INSERT INTO `t_district` VALUES ('72', '152900', '阿拉善盟', '150000', '72', '1');
INSERT INTO `t_district` VALUES ('73', '210100', '沈阳市', '210000', '73', '1');
INSERT INTO `t_district` VALUES ('74', '210200', '大连市', '210000', '74', '1');
INSERT INTO `t_district` VALUES ('75', '210300', '鞍山市', '210000', '75', '1');
INSERT INTO `t_district` VALUES ('76', '210400', '抚顺市', '210000', '76', '1');
INSERT INTO `t_district` VALUES ('77', '210500', '本溪市', '210000', '77', '1');
INSERT INTO `t_district` VALUES ('78', '210600', '丹东市', '210000', '78', '1');
INSERT INTO `t_district` VALUES ('79', '210700', '锦州市', '210000', '79', '1');
INSERT INTO `t_district` VALUES ('80', '210800', '营口市', '210000', '80', '1');
INSERT INTO `t_district` VALUES ('81', '210900', '阜新市', '210000', '81', '1');
INSERT INTO `t_district` VALUES ('82', '211000', '辽阳市', '210000', '82', '1');
INSERT INTO `t_district` VALUES ('83', '211100', '盘锦市', '210000', '83', '1');
INSERT INTO `t_district` VALUES ('84', '211200', '铁岭市', '210000', '84', '1');
INSERT INTO `t_district` VALUES ('85', '211300', '朝阳市', '210000', '85', '1');
INSERT INTO `t_district` VALUES ('86', '211400', '葫芦岛市', '210000', '86', '1');
INSERT INTO `t_district` VALUES ('87', '220100', '长春市', '220000', '87', '1');
INSERT INTO `t_district` VALUES ('88', '220200', '吉林市', '220000', '88', '1');
INSERT INTO `t_district` VALUES ('89', '220300', '四平市', '220000', '89', '1');
INSERT INTO `t_district` VALUES ('90', '220400', '辽源市', '220000', '90', '1');
INSERT INTO `t_district` VALUES ('91', '220500', '通化市', '220000', '91', '1');
INSERT INTO `t_district` VALUES ('92', '220600', '白山市', '220000', '92', '1');
INSERT INTO `t_district` VALUES ('93', '220700', '松原市', '220000', '93', '1');
INSERT INTO `t_district` VALUES ('94', '220800', '白城市', '220000', '94', '1');
INSERT INTO `t_district` VALUES ('95', '222400', '延边朝鲜族自治州', '220000', '95', '1');
INSERT INTO `t_district` VALUES ('96', '230100', '哈尔滨市', '230000', '96', '1');
INSERT INTO `t_district` VALUES ('97', '230200', '齐齐哈尔市', '230000', '97', '1');
INSERT INTO `t_district` VALUES ('98', '230300', '鸡西市', '230000', '98', '1');
INSERT INTO `t_district` VALUES ('99', '230400', '鹤岗市', '230000', '99', '1');
INSERT INTO `t_district` VALUES ('100', '230500', '双鸭山市', '230000', '100', '1');
INSERT INTO `t_district` VALUES ('101', '230600', '大庆市', '230000', '101', '1');
INSERT INTO `t_district` VALUES ('102', '230700', '伊春市', '230000', '102', '1');
INSERT INTO `t_district` VALUES ('103', '230800', '佳木斯市', '230000', '103', '1');
INSERT INTO `t_district` VALUES ('104', '230900', '七台河市', '230000', '104', '1');
INSERT INTO `t_district` VALUES ('105', '231000', '牡丹江市', '230000', '105', '1');
INSERT INTO `t_district` VALUES ('106', '231100', '黑河市', '230000', '106', '1');
INSERT INTO `t_district` VALUES ('107', '231200', '绥化市', '230000', '107', '1');
INSERT INTO `t_district` VALUES ('108', '232700', '大兴安岭地区', '230000', '108', '1');
INSERT INTO `t_district` VALUES ('109', '310100', '市辖区', '310000', '109', '1');
INSERT INTO `t_district` VALUES ('110', '310200', '县', '310000', '110', '1');
INSERT INTO `t_district` VALUES ('111', '320100', '南京市', '320000', '111', '1');
INSERT INTO `t_district` VALUES ('112', '320200', '无锡市', '320000', '112', '1');
INSERT INTO `t_district` VALUES ('113', '320300', '徐州市', '320000', '113', '1');
INSERT INTO `t_district` VALUES ('114', '320400', '常州市', '320000', '114', '1');
INSERT INTO `t_district` VALUES ('115', '320500', '苏州市', '320000', '115', '1');
INSERT INTO `t_district` VALUES ('116', '320600', '南通市', '320000', '116', '1');
INSERT INTO `t_district` VALUES ('117', '320700', '连云港市', '320000', '117', '1');
INSERT INTO `t_district` VALUES ('118', '320800', '淮安市', '320000', '118', '1');
INSERT INTO `t_district` VALUES ('119', '320900', '盐城市', '320000', '119', '1');
INSERT INTO `t_district` VALUES ('120', '321000', '扬州市', '320000', '120', '1');
INSERT INTO `t_district` VALUES ('121', '321100', '镇江市', '320000', '121', '1');
INSERT INTO `t_district` VALUES ('122', '321200', '泰州市', '320000', '122', '1');
INSERT INTO `t_district` VALUES ('123', '321300', '宿迁市', '320000', '123', '1');
INSERT INTO `t_district` VALUES ('124', '330100', '杭州市', '330000', '124', '1');
INSERT INTO `t_district` VALUES ('125', '330200', '宁波市', '330000', '125', '1');
INSERT INTO `t_district` VALUES ('126', '330300', '温州市', '330000', '126', '1');
INSERT INTO `t_district` VALUES ('127', '330400', '嘉兴市', '330000', '127', '1');
INSERT INTO `t_district` VALUES ('128', '330500', '湖州市', '330000', '128', '1');
INSERT INTO `t_district` VALUES ('129', '330600', '绍兴市', '330000', '129', '1');
INSERT INTO `t_district` VALUES ('130', '330700', '金华市', '330000', '130', '1');
INSERT INTO `t_district` VALUES ('131', '330800', '衢州市', '330000', '131', '1');
INSERT INTO `t_district` VALUES ('132', '330900', '舟山市', '330000', '132', '1');
INSERT INTO `t_district` VALUES ('133', '331000', '台州市', '330000', '133', '1');
INSERT INTO `t_district` VALUES ('134', '331100', '丽水市', '330000', '134', '1');
INSERT INTO `t_district` VALUES ('135', '340100', '合肥市', '340000', '135', '1');
INSERT INTO `t_district` VALUES ('136', '340200', '芜湖市', '340000', '136', '1');
INSERT INTO `t_district` VALUES ('137', '340300', '蚌埠市', '340000', '137', '1');
INSERT INTO `t_district` VALUES ('138', '340400', '淮南市', '340000', '138', '1');
INSERT INTO `t_district` VALUES ('139', '340500', '马鞍山市', '340000', '139', '1');
INSERT INTO `t_district` VALUES ('140', '340600', '淮北市', '340000', '140', '1');
INSERT INTO `t_district` VALUES ('141', '340700', '铜陵市', '340000', '141', '1');
INSERT INTO `t_district` VALUES ('142', '340800', '安庆市', '340000', '142', '1');
INSERT INTO `t_district` VALUES ('143', '341000', '黄山市', '340000', '143', '1');
INSERT INTO `t_district` VALUES ('144', '341100', '滁州市', '340000', '144', '1');
INSERT INTO `t_district` VALUES ('145', '341200', '阜阳市', '340000', '145', '1');
INSERT INTO `t_district` VALUES ('146', '341300', '宿州市', '340000', '146', '1');
INSERT INTO `t_district` VALUES ('147', '341400', '巢湖市', '340000', '147', '1');
INSERT INTO `t_district` VALUES ('148', '341500', '六安市', '340000', '148', '1');
INSERT INTO `t_district` VALUES ('149', '341600', '亳州市', '340000', '149', '1');
INSERT INTO `t_district` VALUES ('150', '341700', '池州市', '340000', '150', '1');
INSERT INTO `t_district` VALUES ('151', '341800', '宣城市', '340000', '151', '1');
INSERT INTO `t_district` VALUES ('152', '350100', '福州市', '350000', '152', '1');
INSERT INTO `t_district` VALUES ('153', '350200', '厦门市', '350000', '153', '1');
INSERT INTO `t_district` VALUES ('154', '350300', '莆田市', '350000', '154', '1');
INSERT INTO `t_district` VALUES ('155', '350400', '三明市', '350000', '155', '1');
INSERT INTO `t_district` VALUES ('156', '350500', '泉州市', '350000', '156', '1');
INSERT INTO `t_district` VALUES ('157', '350600', '漳州市', '350000', '157', '1');
INSERT INTO `t_district` VALUES ('158', '350700', '南平市', '350000', '158', '1');
INSERT INTO `t_district` VALUES ('159', '350800', '龙岩市', '350000', '159', '1');
INSERT INTO `t_district` VALUES ('160', '350900', '宁德市', '350000', '160', '1');
INSERT INTO `t_district` VALUES ('161', '360100', '南昌市', '360000', '161', '1');
INSERT INTO `t_district` VALUES ('162', '360200', '景德镇市', '360000', '162', '1');
INSERT INTO `t_district` VALUES ('163', '360300', '萍乡市', '360000', '163', '1');
INSERT INTO `t_district` VALUES ('164', '360400', '九江市', '360000', '164', '1');
INSERT INTO `t_district` VALUES ('165', '360500', '新余市', '360000', '165', '1');
INSERT INTO `t_district` VALUES ('166', '360600', '鹰潭市', '360000', '166', '1');
INSERT INTO `t_district` VALUES ('167', '360700', '赣州市', '360000', '167', '1');
INSERT INTO `t_district` VALUES ('168', '360800', '吉安市', '360000', '168', '1');
INSERT INTO `t_district` VALUES ('169', '360900', '宜春市', '360000', '169', '1');
INSERT INTO `t_district` VALUES ('170', '361000', '抚州市', '360000', '170', '1');
INSERT INTO `t_district` VALUES ('171', '361100', '上饶市', '360000', '171', '1');
INSERT INTO `t_district` VALUES ('172', '370100', '济南市', '370000', '172', '1');
INSERT INTO `t_district` VALUES ('173', '370200', '青岛市', '370000', '173', '1');
INSERT INTO `t_district` VALUES ('174', '370300', '淄博市', '370000', '174', '1');
INSERT INTO `t_district` VALUES ('175', '370400', '枣庄市', '370000', '175', '1');
INSERT INTO `t_district` VALUES ('176', '370500', '东营市', '370000', '176', '1');
INSERT INTO `t_district` VALUES ('177', '370600', '烟台市', '370000', '177', '1');
INSERT INTO `t_district` VALUES ('178', '370700', '潍坊市', '370000', '178', '1');
INSERT INTO `t_district` VALUES ('179', '370800', '济宁市', '370000', '179', '1');
INSERT INTO `t_district` VALUES ('180', '370900', '泰安市', '370000', '180', '1');
INSERT INTO `t_district` VALUES ('181', '371000', '威海市', '370000', '181', '1');
INSERT INTO `t_district` VALUES ('182', '371100', '日照市', '370000', '182', '1');
INSERT INTO `t_district` VALUES ('183', '371200', '莱芜市', '370000', '183', '1');
INSERT INTO `t_district` VALUES ('184', '371300', '临沂市', '370000', '184', '1');
INSERT INTO `t_district` VALUES ('185', '371400', '德州市', '370000', '185', '1');
INSERT INTO `t_district` VALUES ('186', '371500', '聊城市', '370000', '186', '1');
INSERT INTO `t_district` VALUES ('187', '371600', '滨州市', '370000', '187', '1');
INSERT INTO `t_district` VALUES ('188', '371700', '荷泽市', '370000', '188', '1');
INSERT INTO `t_district` VALUES ('189', '410100', '郑州市', '410000', '189', '1');
INSERT INTO `t_district` VALUES ('190', '410200', '开封市', '410000', '190', '1');
INSERT INTO `t_district` VALUES ('191', '410300', '洛阳市', '410000', '191', '1');
INSERT INTO `t_district` VALUES ('192', '410400', '平顶山市', '410000', '192', '1');
INSERT INTO `t_district` VALUES ('193', '410500', '安阳市', '410000', '193', '1');
INSERT INTO `t_district` VALUES ('194', '410600', '鹤壁市', '410000', '194', '1');
INSERT INTO `t_district` VALUES ('195', '410700', '新乡市', '410000', '195', '1');
INSERT INTO `t_district` VALUES ('196', '410800', '焦作市', '410000', '196', '1');
INSERT INTO `t_district` VALUES ('197', '410900', '濮阳市', '410000', '197', '1');
INSERT INTO `t_district` VALUES ('198', '411000', '许昌市', '410000', '198', '1');
INSERT INTO `t_district` VALUES ('199', '411100', '漯河市', '410000', '199', '1');
INSERT INTO `t_district` VALUES ('200', '411200', '三门峡市', '410000', '200', '1');
INSERT INTO `t_district` VALUES ('201', '411300', '南阳市', '410000', '201', '1');
INSERT INTO `t_district` VALUES ('202', '411400', '商丘市', '410000', '202', '1');
INSERT INTO `t_district` VALUES ('203', '411500', '信阳市', '410000', '203', '1');
INSERT INTO `t_district` VALUES ('204', '411600', '周口市', '410000', '204', '1');
INSERT INTO `t_district` VALUES ('205', '411700', '驻马店市', '410000', '205', '1');
INSERT INTO `t_district` VALUES ('206', '420100', '武汉市', '420000', '206', '1');
INSERT INTO `t_district` VALUES ('207', '420200', '黄石市', '420000', '207', '1');
INSERT INTO `t_district` VALUES ('208', '420300', '十堰市', '420000', '208', '1');
INSERT INTO `t_district` VALUES ('209', '420500', '宜昌市', '420000', '209', '1');
INSERT INTO `t_district` VALUES ('210', '420600', '襄樊市', '420000', '210', '1');
INSERT INTO `t_district` VALUES ('211', '420700', '鄂州市', '420000', '211', '1');
INSERT INTO `t_district` VALUES ('212', '420800', '荆门市', '420000', '212', '1');
INSERT INTO `t_district` VALUES ('213', '420900', '孝感市', '420000', '213', '1');
INSERT INTO `t_district` VALUES ('214', '421000', '荆州市', '420000', '214', '1');
INSERT INTO `t_district` VALUES ('215', '421100', '黄冈市', '420000', '215', '1');
INSERT INTO `t_district` VALUES ('216', '421200', '咸宁市', '420000', '216', '1');
INSERT INTO `t_district` VALUES ('217', '421300', '随州市', '420000', '217', '1');
INSERT INTO `t_district` VALUES ('218', '422800', '恩施土家族苗族自治州', '420000', '218', '1');
INSERT INTO `t_district` VALUES ('219', '429000', '省直辖行政单位', '420000', '219', '1');
INSERT INTO `t_district` VALUES ('220', '430100', '长沙市', '430000', '220', '1');
INSERT INTO `t_district` VALUES ('221', '430200', '株洲市', '430000', '221', '1');
INSERT INTO `t_district` VALUES ('222', '430300', '湘潭市', '430000', '222', '1');
INSERT INTO `t_district` VALUES ('223', '430400', '衡阳市', '430000', '223', '1');
INSERT INTO `t_district` VALUES ('224', '430500', '邵阳市', '430000', '224', '1');
INSERT INTO `t_district` VALUES ('225', '430600', '岳阳市', '430000', '225', '1');
INSERT INTO `t_district` VALUES ('226', '430700', '常德市', '430000', '226', '1');
INSERT INTO `t_district` VALUES ('227', '430800', '张家界市', '430000', '227', '1');
INSERT INTO `t_district` VALUES ('228', '430900', '益阳市', '430000', '228', '1');
INSERT INTO `t_district` VALUES ('229', '431000', '郴州市', '430000', '229', '1');
INSERT INTO `t_district` VALUES ('230', '431100', '永州市', '430000', '230', '1');
INSERT INTO `t_district` VALUES ('231', '431200', '怀化市', '430000', '231', '1');
INSERT INTO `t_district` VALUES ('232', '431300', '娄底市', '430000', '232', '1');
INSERT INTO `t_district` VALUES ('233', '433100', '湘西土家族苗族自治州', '430000', '233', '1');
INSERT INTO `t_district` VALUES ('234', '440100', '广州市', '440000', '234', '1');
INSERT INTO `t_district` VALUES ('235', '440200', '韶关市', '440000', '235', '1');
INSERT INTO `t_district` VALUES ('236', '440300', '深圳市', '440000', '236', '1');
INSERT INTO `t_district` VALUES ('237', '440400', '珠海市', '440000', '237', '1');
INSERT INTO `t_district` VALUES ('238', '440500', '汕头市', '440000', '238', '1');
INSERT INTO `t_district` VALUES ('239', '440600', '佛山市', '440000', '239', '1');
INSERT INTO `t_district` VALUES ('240', '440700', '江门市', '440000', '240', '1');
INSERT INTO `t_district` VALUES ('241', '440800', '湛江市', '440000', '241', '1');
INSERT INTO `t_district` VALUES ('242', '440900', '茂名市', '440000', '242', '1');
INSERT INTO `t_district` VALUES ('243', '441200', '肇庆市', '440000', '243', '1');
INSERT INTO `t_district` VALUES ('244', '441300', '惠州市', '440000', '244', '1');
INSERT INTO `t_district` VALUES ('245', '441400', '梅州市', '440000', '245', '1');
INSERT INTO `t_district` VALUES ('246', '441500', '汕尾市', '440000', '246', '1');
INSERT INTO `t_district` VALUES ('247', '441600', '河源市', '440000', '247', '1');
INSERT INTO `t_district` VALUES ('248', '441700', '阳江市', '440000', '248', '1');
INSERT INTO `t_district` VALUES ('249', '441800', '清远市', '440000', '249', '1');
INSERT INTO `t_district` VALUES ('250', '441900', '东莞市', '440000', '250', '1');
INSERT INTO `t_district` VALUES ('251', '442000', '中山市', '440000', '251', '1');
INSERT INTO `t_district` VALUES ('252', '445100', '潮州市', '440000', '252', '1');
INSERT INTO `t_district` VALUES ('253', '445200', '揭阳市', '440000', '253', '1');
INSERT INTO `t_district` VALUES ('254', '445300', '云浮市', '440000', '254', '1');
INSERT INTO `t_district` VALUES ('255', '450100', '南宁市', '450000', '255', '1');
INSERT INTO `t_district` VALUES ('256', '450200', '柳州市', '450000', '256', '1');
INSERT INTO `t_district` VALUES ('257', '450300', '桂林市', '450000', '257', '1');
INSERT INTO `t_district` VALUES ('258', '450400', '梧州市', '450000', '258', '1');
INSERT INTO `t_district` VALUES ('259', '450500', '北海市', '450000', '259', '1');
INSERT INTO `t_district` VALUES ('260', '450600', '防城港市', '450000', '260', '1');
INSERT INTO `t_district` VALUES ('261', '450700', '钦州市', '450000', '261', '1');
INSERT INTO `t_district` VALUES ('262', '450800', '贵港市', '450000', '262', '1');
INSERT INTO `t_district` VALUES ('263', '450900', '玉林市', '450000', '263', '1');
INSERT INTO `t_district` VALUES ('264', '451000', '百色市', '450000', '264', '1');
INSERT INTO `t_district` VALUES ('265', '451100', '贺州市', '450000', '265', '1');
INSERT INTO `t_district` VALUES ('266', '451200', '河池市', '450000', '266', '1');
INSERT INTO `t_district` VALUES ('267', '451300', '来宾市', '450000', '267', '1');
INSERT INTO `t_district` VALUES ('268', '451400', '崇左市', '450000', '268', '1');
INSERT INTO `t_district` VALUES ('269', '460100', '海口市', '460000', '269', '1');
INSERT INTO `t_district` VALUES ('270', '460200', '三亚市', '460000', '270', '1');
INSERT INTO `t_district` VALUES ('271', '469000', '省直辖县级行政单位', '460000', '271', '1');
INSERT INTO `t_district` VALUES ('272', '500100', '市辖区', '500000', '272', '1');
INSERT INTO `t_district` VALUES ('273', '500200', '县', '500000', '273', '1');
INSERT INTO `t_district` VALUES ('274', '500300', '市', '500000', '274', '1');
INSERT INTO `t_district` VALUES ('275', '510100', '成都市', '510000', '275', '1');
INSERT INTO `t_district` VALUES ('276', '510300', '自贡市', '510000', '276', '1');
INSERT INTO `t_district` VALUES ('277', '510400', '攀枝花市', '510000', '277', '1');
INSERT INTO `t_district` VALUES ('278', '510500', '泸州市', '510000', '278', '1');
INSERT INTO `t_district` VALUES ('279', '510600', '德阳市', '510000', '279', '1');
INSERT INTO `t_district` VALUES ('280', '510700', '绵阳市', '510000', '280', '1');
INSERT INTO `t_district` VALUES ('281', '510800', '广元市', '510000', '281', '1');
INSERT INTO `t_district` VALUES ('282', '510900', '遂宁市', '510000', '282', '1');
INSERT INTO `t_district` VALUES ('283', '511000', '内江市', '510000', '283', '1');
INSERT INTO `t_district` VALUES ('284', '511100', '乐山市', '510000', '284', '1');
INSERT INTO `t_district` VALUES ('285', '511300', '南充市', '510000', '285', '1');
INSERT INTO `t_district` VALUES ('286', '511400', '眉山市', '510000', '286', '1');
INSERT INTO `t_district` VALUES ('287', '511500', '宜宾市', '510000', '287', '1');
INSERT INTO `t_district` VALUES ('288', '511600', '广安市', '510000', '288', '1');
INSERT INTO `t_district` VALUES ('289', '511700', '达州市', '510000', '289', '1');
INSERT INTO `t_district` VALUES ('290', '511800', '雅安市', '510000', '290', '1');
INSERT INTO `t_district` VALUES ('291', '511900', '巴中市', '510000', '291', '1');
INSERT INTO `t_district` VALUES ('292', '512000', '资阳市', '510000', '292', '1');
INSERT INTO `t_district` VALUES ('293', '513200', '阿坝藏族羌族自治州', '510000', '293', '1');
INSERT INTO `t_district` VALUES ('294', '513300', '甘孜藏族自治州', '510000', '294', '1');
INSERT INTO `t_district` VALUES ('295', '513400', '凉山彝族自治州', '510000', '295', '1');
INSERT INTO `t_district` VALUES ('296', '520100', '贵阳市', '520000', '296', '1');
INSERT INTO `t_district` VALUES ('297', '520200', '六盘水市', '520000', '297', '1');
INSERT INTO `t_district` VALUES ('298', '520300', '遵义市', '520000', '298', '1');
INSERT INTO `t_district` VALUES ('299', '520400', '安顺市', '520000', '299', '1');
INSERT INTO `t_district` VALUES ('300', '522200', '铜仁地区', '520000', '300', '1');
INSERT INTO `t_district` VALUES ('301', '522300', '黔西南布依族苗族自治州', '520000', '301', '1');
INSERT INTO `t_district` VALUES ('302', '522400', '毕节地区', '520000', '302', '1');
INSERT INTO `t_district` VALUES ('303', '522600', '黔东南苗族侗族自治州', '520000', '303', '1');
INSERT INTO `t_district` VALUES ('304', '522700', '黔南布依族苗族自治州', '520000', '304', '1');
INSERT INTO `t_district` VALUES ('305', '530100', '昆明市', '530000', '305', '1');
INSERT INTO `t_district` VALUES ('306', '530300', '曲靖市', '530000', '306', '1');
INSERT INTO `t_district` VALUES ('307', '530400', '玉溪市', '530000', '307', '1');
INSERT INTO `t_district` VALUES ('308', '530500', '保山市', '530000', '308', '1');
INSERT INTO `t_district` VALUES ('309', '530600', '昭通市', '530000', '309', '1');
INSERT INTO `t_district` VALUES ('310', '530700', '丽江市', '530000', '310', '1');
INSERT INTO `t_district` VALUES ('311', '530800', '思茅市', '530000', '311', '1');
INSERT INTO `t_district` VALUES ('312', '530900', '临沧市', '530000', '312', '1');
INSERT INTO `t_district` VALUES ('313', '532300', '楚雄彝族自治州', '530000', '313', '1');
INSERT INTO `t_district` VALUES ('314', '532500', '红河哈尼族彝族自治州', '530000', '314', '1');
INSERT INTO `t_district` VALUES ('315', '532600', '文山壮族苗族自治州', '530000', '315', '1');
INSERT INTO `t_district` VALUES ('316', '532800', '西双版纳傣族自治州', '530000', '316', '1');
INSERT INTO `t_district` VALUES ('317', '532900', '大理白族自治州', '530000', '317', '1');
INSERT INTO `t_district` VALUES ('318', '533100', '德宏傣族景颇族自治州', '530000', '318', '1');
INSERT INTO `t_district` VALUES ('319', '533300', '怒江傈僳族自治州', '530000', '319', '1');
INSERT INTO `t_district` VALUES ('320', '533400', '迪庆藏族自治州', '530000', '320', '1');
INSERT INTO `t_district` VALUES ('321', '540100', '拉萨市', '540000', '321', '1');
INSERT INTO `t_district` VALUES ('322', '542100', '昌都地区', '540000', '322', '1');
INSERT INTO `t_district` VALUES ('323', '542200', '山南地区', '540000', '323', '1');
INSERT INTO `t_district` VALUES ('324', '542300', '日喀则地区', '540000', '324', '1');
INSERT INTO `t_district` VALUES ('325', '542400', '那曲地区', '540000', '325', '1');
INSERT INTO `t_district` VALUES ('326', '542500', '阿里地区', '540000', '326', '1');
INSERT INTO `t_district` VALUES ('327', '542600', '林芝地区', '540000', '327', '1');
INSERT INTO `t_district` VALUES ('328', '610100', '西安市', '610000', '328', '1');
INSERT INTO `t_district` VALUES ('329', '610200', '铜川市', '610000', '329', '1');
INSERT INTO `t_district` VALUES ('330', '610300', '宝鸡市', '610000', '330', '1');
INSERT INTO `t_district` VALUES ('331', '610400', '咸阳市', '610000', '331', '1');
INSERT INTO `t_district` VALUES ('332', '610500', '渭南市', '610000', '332', '1');
INSERT INTO `t_district` VALUES ('333', '610600', '延安市', '610000', '333', '1');
INSERT INTO `t_district` VALUES ('334', '610700', '汉中市', '610000', '334', '1');
INSERT INTO `t_district` VALUES ('335', '610800', '榆林市', '610000', '335', '1');
INSERT INTO `t_district` VALUES ('336', '610900', '安康市', '610000', '336', '1');
INSERT INTO `t_district` VALUES ('337', '611000', '商洛市', '610000', '337', '1');
INSERT INTO `t_district` VALUES ('338', '620100', '兰州市', '620000', '338', '1');
INSERT INTO `t_district` VALUES ('339', '620200', '嘉峪关市', '620000', '339', '1');
INSERT INTO `t_district` VALUES ('340', '620300', '金昌市', '620000', '340', '1');
INSERT INTO `t_district` VALUES ('341', '620400', '白银市', '620000', '341', '1');
INSERT INTO `t_district` VALUES ('342', '620500', '天水市', '620000', '342', '1');
INSERT INTO `t_district` VALUES ('343', '620600', '武威市', '620000', '343', '1');
INSERT INTO `t_district` VALUES ('344', '620700', '张掖市', '620000', '344', '1');
INSERT INTO `t_district` VALUES ('345', '620800', '平凉市', '620000', '345', '1');
INSERT INTO `t_district` VALUES ('346', '620900', '酒泉市', '620000', '346', '1');
INSERT INTO `t_district` VALUES ('347', '621000', '庆阳市', '620000', '347', '1');
INSERT INTO `t_district` VALUES ('348', '621100', '定西市', '620000', '348', '1');
INSERT INTO `t_district` VALUES ('349', '621200', '陇南市', '620000', '349', '1');
INSERT INTO `t_district` VALUES ('350', '622900', '临夏回族自治州', '620000', '350', '1');
INSERT INTO `t_district` VALUES ('351', '623000', '甘南藏族自治州', '620000', '351', '1');
INSERT INTO `t_district` VALUES ('352', '630100', '西宁市', '630000', '352', '1');
INSERT INTO `t_district` VALUES ('353', '632100', '海东地区', '630000', '353', '1');
INSERT INTO `t_district` VALUES ('354', '632200', '海北藏族自治州', '630000', '354', '1');
INSERT INTO `t_district` VALUES ('355', '632300', '黄南藏族自治州', '630000', '355', '1');
INSERT INTO `t_district` VALUES ('356', '632500', '海南藏族自治州', '630000', '356', '1');
INSERT INTO `t_district` VALUES ('357', '632600', '果洛藏族自治州', '630000', '357', '1');
INSERT INTO `t_district` VALUES ('358', '632700', '玉树藏族自治州', '630000', '358', '1');
INSERT INTO `t_district` VALUES ('359', '632800', '海西蒙古族藏族自治州', '630000', '359', '1');
INSERT INTO `t_district` VALUES ('360', '640100', '银川市', '640000', '360', '1');
INSERT INTO `t_district` VALUES ('361', '640200', '石嘴山市', '640000', '361', '1');
INSERT INTO `t_district` VALUES ('362', '640300', '吴忠市', '640000', '362', '1');
INSERT INTO `t_district` VALUES ('363', '640400', '固原市', '640000', '363', '1');
INSERT INTO `t_district` VALUES ('364', '640500', '中卫市', '640000', '364', '1');
INSERT INTO `t_district` VALUES ('365', '650100', '乌鲁木齐市', '650000', '365', '1');
INSERT INTO `t_district` VALUES ('366', '650200', '克拉玛依市', '650000', '366', '1');
INSERT INTO `t_district` VALUES ('367', '652100', '吐鲁番地区', '650000', '367', '1');
INSERT INTO `t_district` VALUES ('368', '652200', '哈密地区', '650000', '368', '1');
INSERT INTO `t_district` VALUES ('369', '652300', '昌吉回族自治州', '650000', '369', '1');
INSERT INTO `t_district` VALUES ('370', '652700', '博尔塔拉蒙古自治州', '650000', '370', '1');
INSERT INTO `t_district` VALUES ('371', '652800', '巴音郭楞蒙古自治州', '650000', '371', '1');
INSERT INTO `t_district` VALUES ('372', '652900', '阿克苏地区', '650000', '372', '1');
INSERT INTO `t_district` VALUES ('373', '653000', '克孜勒苏柯尔克孜自治州', '650000', '373', '1');
INSERT INTO `t_district` VALUES ('374', '653100', '喀什地区', '650000', '374', '1');
INSERT INTO `t_district` VALUES ('375', '653200', '和田地区', '650000', '375', '1');
INSERT INTO `t_district` VALUES ('376', '654000', '伊犁哈萨克自治州', '650000', '376', '1');
INSERT INTO `t_district` VALUES ('377', '654200', '塔城地区', '650000', '377', '1');
INSERT INTO `t_district` VALUES ('378', '654300', '阿勒泰地区', '650000', '378', '1');
INSERT INTO `t_district` VALUES ('379', '659000', '省直辖行政单位', '650000', '379', '1');
INSERT INTO `t_district` VALUES ('380', '110101', '东城区', '110100', '380', '1');
INSERT INTO `t_district` VALUES ('381', '110102', '西城区', '110100', '381', '1');
INSERT INTO `t_district` VALUES ('382', '110103', '崇文区', '110100', '382', '1');
INSERT INTO `t_district` VALUES ('383', '110104', '宣武区', '110100', '383', '1');
INSERT INTO `t_district` VALUES ('384', '110105', '朝阳区', '110100', '384', '1');
INSERT INTO `t_district` VALUES ('385', '110106', '丰台区', '110100', '385', '1');
INSERT INTO `t_district` VALUES ('386', '110107', '石景山区', '110100', '386', '1');
INSERT INTO `t_district` VALUES ('387', '110108', '海淀区', '110100', '387', '1');
INSERT INTO `t_district` VALUES ('388', '110109', '门头沟区', '110100', '388', '1');
INSERT INTO `t_district` VALUES ('389', '110111', '房山区', '110100', '389', '1');
INSERT INTO `t_district` VALUES ('390', '110112', '通州区', '110100', '390', '1');
INSERT INTO `t_district` VALUES ('391', '110113', '顺义区', '110100', '391', '1');
INSERT INTO `t_district` VALUES ('392', '110114', '昌平区', '110100', '392', '1');
INSERT INTO `t_district` VALUES ('393', '110115', '大兴区', '110100', '393', '1');
INSERT INTO `t_district` VALUES ('394', '110116', '怀柔区', '110100', '394', '1');
INSERT INTO `t_district` VALUES ('395', '110117', '平谷区', '110100', '395', '1');
INSERT INTO `t_district` VALUES ('396', '110228', '密云县', '110200', '396', '1');
INSERT INTO `t_district` VALUES ('397', '110229', '延庆县', '110200', '397', '1');
INSERT INTO `t_district` VALUES ('398', '120101', '和平区', '120100', '398', '1');
INSERT INTO `t_district` VALUES ('399', '120102', '河东区', '120100', '399', '1');
INSERT INTO `t_district` VALUES ('400', '120103', '河西区', '120100', '400', '1');
INSERT INTO `t_district` VALUES ('401', '120104', '南开区', '120100', '401', '1');
INSERT INTO `t_district` VALUES ('402', '120105', '河北区', '120100', '402', '1');
INSERT INTO `t_district` VALUES ('403', '120106', '红桥区', '120100', '403', '1');
INSERT INTO `t_district` VALUES ('404', '120107', '塘沽区', '120100', '404', '1');
INSERT INTO `t_district` VALUES ('405', '120108', '汉沽区', '120100', '405', '1');
INSERT INTO `t_district` VALUES ('406', '120109', '大港区', '120100', '406', '1');
INSERT INTO `t_district` VALUES ('407', '120110', '东丽区', '120100', '407', '1');
INSERT INTO `t_district` VALUES ('408', '120111', '西青区', '120100', '408', '1');
INSERT INTO `t_district` VALUES ('409', '120112', '津南区', '120100', '409', '1');
INSERT INTO `t_district` VALUES ('410', '120113', '北辰区', '120100', '410', '1');
INSERT INTO `t_district` VALUES ('411', '120114', '武清区', '120100', '411', '1');
INSERT INTO `t_district` VALUES ('412', '120115', '宝坻区', '120100', '412', '1');
INSERT INTO `t_district` VALUES ('413', '120221', '宁河县', '120200', '413', '1');
INSERT INTO `t_district` VALUES ('414', '120223', '静海县', '120200', '414', '1');
INSERT INTO `t_district` VALUES ('415', '120225', '蓟　县', '120200', '415', '1');
INSERT INTO `t_district` VALUES ('416', '130101', '市辖区', '130100', '416', '1');
INSERT INTO `t_district` VALUES ('417', '130102', '长安区', '130100', '417', '1');
INSERT INTO `t_district` VALUES ('418', '130103', '桥东区', '130100', '418', '1');
INSERT INTO `t_district` VALUES ('419', '130104', '桥西区', '130100', '419', '1');
INSERT INTO `t_district` VALUES ('420', '130105', '新华区', '130100', '420', '1');
INSERT INTO `t_district` VALUES ('421', '130107', '井陉矿区', '130100', '421', '1');
INSERT INTO `t_district` VALUES ('422', '130108', '裕华区', '130100', '422', '1');
INSERT INTO `t_district` VALUES ('423', '130121', '井陉县', '130100', '423', '1');
INSERT INTO `t_district` VALUES ('424', '130123', '正定县', '130100', '424', '1');
INSERT INTO `t_district` VALUES ('425', '130124', '栾城县', '130100', '425', '1');
INSERT INTO `t_district` VALUES ('426', '130125', '行唐县', '130100', '426', '1');
INSERT INTO `t_district` VALUES ('427', '130126', '灵寿县', '130100', '427', '1');
INSERT INTO `t_district` VALUES ('428', '130127', '高邑县', '130100', '428', '1');
INSERT INTO `t_district` VALUES ('429', '130128', '深泽县', '130100', '429', '1');
INSERT INTO `t_district` VALUES ('430', '130129', '赞皇县', '130100', '430', '1');
INSERT INTO `t_district` VALUES ('431', '130130', '无极县', '130100', '431', '1');
INSERT INTO `t_district` VALUES ('432', '130131', '平山县', '130100', '432', '1');
INSERT INTO `t_district` VALUES ('433', '130132', '元氏县', '130100', '433', '1');
INSERT INTO `t_district` VALUES ('434', '130133', '赵　县', '130100', '434', '1');
INSERT INTO `t_district` VALUES ('435', '130181', '辛集市', '130100', '435', '1');
INSERT INTO `t_district` VALUES ('436', '130182', '藁城市', '130100', '436', '1');
INSERT INTO `t_district` VALUES ('437', '130183', '晋州市', '130100', '437', '1');
INSERT INTO `t_district` VALUES ('438', '130184', '新乐市', '130100', '438', '1');
INSERT INTO `t_district` VALUES ('439', '130185', '鹿泉市', '130100', '439', '1');
INSERT INTO `t_district` VALUES ('440', '130201', '市辖区', '130200', '440', '1');
INSERT INTO `t_district` VALUES ('441', '130202', '路南区', '130200', '441', '1');
INSERT INTO `t_district` VALUES ('442', '130203', '路北区', '130200', '442', '1');
INSERT INTO `t_district` VALUES ('443', '130204', '古冶区', '130200', '443', '1');
INSERT INTO `t_district` VALUES ('444', '130205', '开平区', '130200', '444', '1');
INSERT INTO `t_district` VALUES ('445', '130207', '丰南区', '130200', '445', '1');
INSERT INTO `t_district` VALUES ('446', '130208', '丰润区', '130200', '446', '1');
INSERT INTO `t_district` VALUES ('447', '130223', '滦　县', '130200', '447', '1');
INSERT INTO `t_district` VALUES ('448', '130224', '滦南县', '130200', '448', '1');
INSERT INTO `t_district` VALUES ('449', '130225', '乐亭县', '130200', '449', '1');
INSERT INTO `t_district` VALUES ('450', '130227', '迁西县', '130200', '450', '1');
INSERT INTO `t_district` VALUES ('451', '130229', '玉田县', '130200', '451', '1');
INSERT INTO `t_district` VALUES ('452', '130230', '唐海县', '130200', '452', '1');
INSERT INTO `t_district` VALUES ('453', '130281', '遵化市', '130200', '453', '1');
INSERT INTO `t_district` VALUES ('454', '130283', '迁安市', '130200', '454', '1');
INSERT INTO `t_district` VALUES ('455', '130301', '市辖区', '130300', '455', '1');
INSERT INTO `t_district` VALUES ('456', '130302', '海港区', '130300', '456', '1');
INSERT INTO `t_district` VALUES ('457', '130303', '山海关区', '130300', '457', '1');
INSERT INTO `t_district` VALUES ('458', '130304', '北戴河区', '130300', '458', '1');
INSERT INTO `t_district` VALUES ('459', '130321', '青龙满族自治县', '130300', '459', '1');
INSERT INTO `t_district` VALUES ('460', '130322', '昌黎县', '130300', '460', '1');
INSERT INTO `t_district` VALUES ('461', '130323', '抚宁县', '130300', '461', '1');
INSERT INTO `t_district` VALUES ('462', '130324', '卢龙县', '130300', '462', '1');
INSERT INTO `t_district` VALUES ('463', '130401', '市辖区', '130400', '463', '1');
INSERT INTO `t_district` VALUES ('464', '130402', '邯山区', '130400', '464', '1');
INSERT INTO `t_district` VALUES ('465', '130403', '丛台区', '130400', '465', '1');
INSERT INTO `t_district` VALUES ('466', '130404', '复兴区', '130400', '466', '1');
INSERT INTO `t_district` VALUES ('467', '130406', '峰峰矿区', '130400', '467', '1');
INSERT INTO `t_district` VALUES ('468', '130421', '邯郸县', '130400', '468', '1');
INSERT INTO `t_district` VALUES ('469', '130423', '临漳县', '130400', '469', '1');
INSERT INTO `t_district` VALUES ('470', '130424', '成安县', '130400', '470', '1');
INSERT INTO `t_district` VALUES ('471', '130425', '大名县', '130400', '471', '1');
INSERT INTO `t_district` VALUES ('472', '130426', '涉　县', '130400', '472', '1');
INSERT INTO `t_district` VALUES ('473', '130427', '磁　县', '130400', '473', '1');
INSERT INTO `t_district` VALUES ('474', '130428', '肥乡县', '130400', '474', '1');
INSERT INTO `t_district` VALUES ('475', '130429', '永年县', '130400', '475', '1');
INSERT INTO `t_district` VALUES ('476', '130430', '邱　县', '130400', '476', '1');
INSERT INTO `t_district` VALUES ('477', '130431', '鸡泽县', '130400', '477', '1');
INSERT INTO `t_district` VALUES ('478', '130432', '广平县', '130400', '478', '1');
INSERT INTO `t_district` VALUES ('479', '130433', '馆陶县', '130400', '479', '1');
INSERT INTO `t_district` VALUES ('480', '130434', '魏　县', '130400', '480', '1');
INSERT INTO `t_district` VALUES ('481', '130435', '曲周县', '130400', '481', '1');
INSERT INTO `t_district` VALUES ('482', '130481', '武安市', '130400', '482', '1');
INSERT INTO `t_district` VALUES ('483', '130501', '市辖区', '130500', '483', '1');
INSERT INTO `t_district` VALUES ('484', '130502', '桥东区', '130500', '484', '1');
INSERT INTO `t_district` VALUES ('485', '130503', '桥西区', '130500', '485', '1');
INSERT INTO `t_district` VALUES ('486', '130521', '邢台县', '130500', '486', '1');
INSERT INTO `t_district` VALUES ('487', '130522', '临城县', '130500', '487', '1');
INSERT INTO `t_district` VALUES ('488', '130523', '内丘县', '130500', '488', '1');
INSERT INTO `t_district` VALUES ('489', '130524', '柏乡县', '130500', '489', '1');
INSERT INTO `t_district` VALUES ('490', '130525', '隆尧县', '130500', '490', '1');
INSERT INTO `t_district` VALUES ('491', '130526', '任　县', '130500', '491', '1');
INSERT INTO `t_district` VALUES ('492', '130527', '南和县', '130500', '492', '1');
INSERT INTO `t_district` VALUES ('493', '130528', '宁晋县', '130500', '493', '1');
INSERT INTO `t_district` VALUES ('494', '130529', '巨鹿县', '130500', '494', '1');
INSERT INTO `t_district` VALUES ('495', '130530', '新河县', '130500', '495', '1');
INSERT INTO `t_district` VALUES ('496', '130531', '广宗县', '130500', '496', '1');
INSERT INTO `t_district` VALUES ('497', '130532', '平乡县', '130500', '497', '1');
INSERT INTO `t_district` VALUES ('498', '130533', '威　县', '130500', '498', '1');
INSERT INTO `t_district` VALUES ('499', '130534', '清河县', '130500', '499', '1');
INSERT INTO `t_district` VALUES ('500', '130535', '临西县', '130500', '500', '1');
INSERT INTO `t_district` VALUES ('501', '130581', '南宫市', '130500', '501', '1');
INSERT INTO `t_district` VALUES ('502', '130582', '沙河市', '130500', '502', '1');
INSERT INTO `t_district` VALUES ('503', '130601', '市辖区', '130600', '503', '1');
INSERT INTO `t_district` VALUES ('504', '130602', '新市区', '130600', '504', '1');
INSERT INTO `t_district` VALUES ('505', '130603', '北市区', '130600', '505', '1');
INSERT INTO `t_district` VALUES ('506', '130604', '南市区', '130600', '506', '1');
INSERT INTO `t_district` VALUES ('507', '130621', '满城县', '130600', '507', '1');
INSERT INTO `t_district` VALUES ('508', '130622', '清苑县', '130600', '508', '1');
INSERT INTO `t_district` VALUES ('509', '130623', '涞水县', '130600', '509', '1');
INSERT INTO `t_district` VALUES ('510', '130624', '阜平县', '130600', '510', '1');
INSERT INTO `t_district` VALUES ('511', '130625', '徐水县', '130600', '511', '1');
INSERT INTO `t_district` VALUES ('512', '130626', '定兴县', '130600', '512', '1');
INSERT INTO `t_district` VALUES ('513', '130627', '唐　县', '130600', '513', '1');
INSERT INTO `t_district` VALUES ('514', '130628', '高阳县', '130600', '514', '1');
INSERT INTO `t_district` VALUES ('515', '130629', '容城县', '130600', '515', '1');
INSERT INTO `t_district` VALUES ('516', '130630', '涞源县', '130600', '516', '1');
INSERT INTO `t_district` VALUES ('517', '130631', '望都县', '130600', '517', '1');
INSERT INTO `t_district` VALUES ('518', '130632', '安新县', '130600', '518', '1');
INSERT INTO `t_district` VALUES ('519', '130633', '易　县', '130600', '519', '1');
INSERT INTO `t_district` VALUES ('520', '130634', '曲阳县', '130600', '520', '1');
INSERT INTO `t_district` VALUES ('521', '130635', '蠡　县', '130600', '521', '1');
INSERT INTO `t_district` VALUES ('522', '130636', '顺平县', '130600', '522', '1');
INSERT INTO `t_district` VALUES ('523', '130637', '博野县', '130600', '523', '1');
INSERT INTO `t_district` VALUES ('524', '130638', '雄　县', '130600', '524', '1');
INSERT INTO `t_district` VALUES ('525', '130681', '涿州市', '130600', '525', '1');
INSERT INTO `t_district` VALUES ('526', '130682', '定州市', '130600', '526', '1');
INSERT INTO `t_district` VALUES ('527', '130683', '安国市', '130600', '527', '1');
INSERT INTO `t_district` VALUES ('528', '130684', '高碑店市', '130600', '528', '1');
INSERT INTO `t_district` VALUES ('529', '130701', '市辖区', '130700', '529', '1');
INSERT INTO `t_district` VALUES ('530', '130702', '桥东区', '130700', '530', '1');
INSERT INTO `t_district` VALUES ('531', '130703', '桥西区', '130700', '531', '1');
INSERT INTO `t_district` VALUES ('532', '130705', '宣化区', '130700', '532', '1');
INSERT INTO `t_district` VALUES ('533', '130706', '下花园区', '130700', '533', '1');
INSERT INTO `t_district` VALUES ('534', '130721', '宣化县', '130700', '534', '1');
INSERT INTO `t_district` VALUES ('535', '130722', '张北县', '130700', '535', '1');
INSERT INTO `t_district` VALUES ('536', '130723', '康保县', '130700', '536', '1');
INSERT INTO `t_district` VALUES ('537', '130724', '沽源县', '130700', '537', '1');
INSERT INTO `t_district` VALUES ('538', '130725', '尚义县', '130700', '538', '1');
INSERT INTO `t_district` VALUES ('539', '130726', '蔚　县', '130700', '539', '1');
INSERT INTO `t_district` VALUES ('540', '130727', '阳原县', '130700', '540', '1');
INSERT INTO `t_district` VALUES ('541', '130728', '怀安县', '130700', '541', '1');
INSERT INTO `t_district` VALUES ('542', '130729', '万全县', '130700', '542', '1');
INSERT INTO `t_district` VALUES ('543', '130730', '怀来县', '130700', '543', '1');
INSERT INTO `t_district` VALUES ('544', '130731', '涿鹿县', '130700', '544', '1');
INSERT INTO `t_district` VALUES ('545', '130732', '赤城县', '130700', '545', '1');
INSERT INTO `t_district` VALUES ('546', '130733', '崇礼县', '130700', '546', '1');
INSERT INTO `t_district` VALUES ('547', '130801', '市辖区', '130800', '547', '1');
INSERT INTO `t_district` VALUES ('548', '130802', '双桥区', '130800', '548', '1');
INSERT INTO `t_district` VALUES ('549', '130803', '双滦区', '130800', '549', '1');
INSERT INTO `t_district` VALUES ('550', '130804', '鹰手营子矿区', '130800', '550', '1');
INSERT INTO `t_district` VALUES ('551', '130821', '承德县', '130800', '551', '1');
INSERT INTO `t_district` VALUES ('552', '130822', '兴隆县', '130800', '552', '1');
INSERT INTO `t_district` VALUES ('553', '130823', '平泉县', '130800', '553', '1');
INSERT INTO `t_district` VALUES ('554', '130824', '滦平县', '130800', '554', '1');
INSERT INTO `t_district` VALUES ('555', '130825', '隆化县', '130800', '555', '1');
INSERT INTO `t_district` VALUES ('556', '130826', '丰宁满族自治县', '130800', '556', '1');
INSERT INTO `t_district` VALUES ('557', '130827', '宽城满族自治县', '130800', '557', '1');
INSERT INTO `t_district` VALUES ('558', '130828', '围场满族蒙古族自治县', '130800', '558', '1');
INSERT INTO `t_district` VALUES ('559', '130901', '市辖区', '130900', '559', '1');
INSERT INTO `t_district` VALUES ('560', '130902', '新华区', '130900', '560', '1');
INSERT INTO `t_district` VALUES ('561', '130903', '运河区', '130900', '561', '1');
INSERT INTO `t_district` VALUES ('562', '130921', '沧　县', '130900', '562', '1');
INSERT INTO `t_district` VALUES ('563', '130922', '青　县', '130900', '563', '1');
INSERT INTO `t_district` VALUES ('564', '130923', '东光县', '130900', '564', '1');
INSERT INTO `t_district` VALUES ('565', '130924', '海兴县', '130900', '565', '1');
INSERT INTO `t_district` VALUES ('566', '130925', '盐山县', '130900', '566', '1');
INSERT INTO `t_district` VALUES ('567', '130926', '肃宁县', '130900', '567', '1');
INSERT INTO `t_district` VALUES ('568', '130927', '南皮县', '130900', '568', '1');
INSERT INTO `t_district` VALUES ('569', '130928', '吴桥县', '130900', '569', '1');
INSERT INTO `t_district` VALUES ('570', '130929', '献　县', '130900', '570', '1');
INSERT INTO `t_district` VALUES ('571', '130930', '孟村回族自治县', '130900', '571', '1');
INSERT INTO `t_district` VALUES ('572', '130981', '泊头市', '130900', '572', '1');
INSERT INTO `t_district` VALUES ('573', '130982', '任丘市', '130900', '573', '1');
INSERT INTO `t_district` VALUES ('574', '130983', '黄骅市', '130900', '574', '1');
INSERT INTO `t_district` VALUES ('575', '130984', '河间市', '130900', '575', '1');
INSERT INTO `t_district` VALUES ('576', '131001', '市辖区', '131000', '576', '1');
INSERT INTO `t_district` VALUES ('577', '131002', '安次区', '131000', '577', '1');
INSERT INTO `t_district` VALUES ('578', '131003', '广阳区', '131000', '578', '1');
INSERT INTO `t_district` VALUES ('579', '131022', '固安县', '131000', '579', '1');
INSERT INTO `t_district` VALUES ('580', '131023', '永清县', '131000', '580', '1');
INSERT INTO `t_district` VALUES ('581', '131024', '香河县', '131000', '581', '1');
INSERT INTO `t_district` VALUES ('582', '131025', '大城县', '131000', '582', '1');
INSERT INTO `t_district` VALUES ('583', '131026', '文安县', '131000', '583', '1');
INSERT INTO `t_district` VALUES ('584', '131028', '大厂回族自治县', '131000', '584', '1');
INSERT INTO `t_district` VALUES ('585', '131081', '霸州市', '131000', '585', '1');
INSERT INTO `t_district` VALUES ('586', '131082', '三河市', '131000', '586', '1');
INSERT INTO `t_district` VALUES ('587', '131101', '市辖区', '131100', '587', '1');
INSERT INTO `t_district` VALUES ('588', '131102', '桃城区', '131100', '588', '1');
INSERT INTO `t_district` VALUES ('589', '131121', '枣强县', '131100', '589', '1');
INSERT INTO `t_district` VALUES ('590', '131122', '武邑县', '131100', '590', '1');
INSERT INTO `t_district` VALUES ('591', '131123', '武强县', '131100', '591', '1');
INSERT INTO `t_district` VALUES ('592', '131124', '饶阳县', '131100', '592', '1');
INSERT INTO `t_district` VALUES ('593', '131125', '安平县', '131100', '593', '1');
INSERT INTO `t_district` VALUES ('594', '131126', '故城县', '131100', '594', '1');
INSERT INTO `t_district` VALUES ('595', '131127', '景　县', '131100', '595', '1');
INSERT INTO `t_district` VALUES ('596', '131128', '阜城县', '131100', '596', '1');
INSERT INTO `t_district` VALUES ('597', '131181', '冀州市', '131100', '597', '1');
INSERT INTO `t_district` VALUES ('598', '131182', '深州市', '131100', '598', '1');
INSERT INTO `t_district` VALUES ('599', '140101', '市辖区', '140100', '599', '1');
INSERT INTO `t_district` VALUES ('600', '140105', '小店区', '140100', '600', '1');
INSERT INTO `t_district` VALUES ('601', '140106', '迎泽区', '140100', '601', '1');
INSERT INTO `t_district` VALUES ('602', '140107', '杏花岭区', '140100', '602', '1');
INSERT INTO `t_district` VALUES ('603', '140108', '尖草坪区', '140100', '603', '1');
INSERT INTO `t_district` VALUES ('604', '140109', '万柏林区', '140100', '604', '1');
INSERT INTO `t_district` VALUES ('605', '140110', '晋源区', '140100', '605', '1');
INSERT INTO `t_district` VALUES ('606', '140121', '清徐县', '140100', '606', '1');
INSERT INTO `t_district` VALUES ('607', '140122', '阳曲县', '140100', '607', '1');
INSERT INTO `t_district` VALUES ('608', '140123', '娄烦县', '140100', '608', '1');
INSERT INTO `t_district` VALUES ('609', '140181', '古交市', '140100', '609', '1');
INSERT INTO `t_district` VALUES ('610', '140201', '市辖区', '140200', '610', '1');
INSERT INTO `t_district` VALUES ('611', '140202', '城　区', '140200', '611', '1');
INSERT INTO `t_district` VALUES ('612', '140203', '矿　区', '140200', '612', '1');
INSERT INTO `t_district` VALUES ('613', '140211', '南郊区', '140200', '613', '1');
INSERT INTO `t_district` VALUES ('614', '140212', '新荣区', '140200', '614', '1');
INSERT INTO `t_district` VALUES ('615', '140221', '阳高县', '140200', '615', '1');
INSERT INTO `t_district` VALUES ('616', '140222', '天镇县', '140200', '616', '1');
INSERT INTO `t_district` VALUES ('617', '140223', '广灵县', '140200', '617', '1');
INSERT INTO `t_district` VALUES ('618', '140224', '灵丘县', '140200', '618', '1');
INSERT INTO `t_district` VALUES ('619', '140225', '浑源县', '140200', '619', '1');
INSERT INTO `t_district` VALUES ('620', '140226', '左云县', '140200', '620', '1');
INSERT INTO `t_district` VALUES ('621', '140227', '大同县', '140200', '621', '1');
INSERT INTO `t_district` VALUES ('622', '140301', '市辖区', '140300', '622', '1');
INSERT INTO `t_district` VALUES ('623', '140302', '城　区', '140300', '623', '1');
INSERT INTO `t_district` VALUES ('624', '140303', '矿　区', '140300', '624', '1');
INSERT INTO `t_district` VALUES ('625', '140311', '郊　区', '140300', '625', '1');
INSERT INTO `t_district` VALUES ('626', '140321', '平定县', '140300', '626', '1');
INSERT INTO `t_district` VALUES ('627', '140322', '盂　县', '140300', '627', '1');
INSERT INTO `t_district` VALUES ('628', '140401', '市辖区', '140400', '628', '1');
INSERT INTO `t_district` VALUES ('629', '140402', '城　区', '140400', '629', '1');
INSERT INTO `t_district` VALUES ('630', '140411', '郊　区', '140400', '630', '1');
INSERT INTO `t_district` VALUES ('631', '140421', '长治县', '140400', '631', '1');
INSERT INTO `t_district` VALUES ('632', '140423', '襄垣县', '140400', '632', '1');
INSERT INTO `t_district` VALUES ('633', '140424', '屯留县', '140400', '633', '1');
INSERT INTO `t_district` VALUES ('634', '140425', '平顺县', '140400', '634', '1');
INSERT INTO `t_district` VALUES ('635', '140426', '黎城县', '140400', '635', '1');
INSERT INTO `t_district` VALUES ('636', '140427', '壶关县', '140400', '636', '1');
INSERT INTO `t_district` VALUES ('637', '140428', '长子县', '140400', '637', '1');
INSERT INTO `t_district` VALUES ('638', '140429', '武乡县', '140400', '638', '1');
INSERT INTO `t_district` VALUES ('639', '140430', '沁　县', '140400', '639', '1');
INSERT INTO `t_district` VALUES ('640', '140431', '沁源县', '140400', '640', '1');
INSERT INTO `t_district` VALUES ('641', '140481', '潞城市', '140400', '641', '1');
INSERT INTO `t_district` VALUES ('642', '140501', '市辖区', '140500', '642', '1');
INSERT INTO `t_district` VALUES ('643', '140502', '城　区', '140500', '643', '1');
INSERT INTO `t_district` VALUES ('644', '140521', '沁水县', '140500', '644', '1');
INSERT INTO `t_district` VALUES ('645', '140522', '阳城县', '140500', '645', '1');
INSERT INTO `t_district` VALUES ('646', '140524', '陵川县', '140500', '646', '1');
INSERT INTO `t_district` VALUES ('647', '140525', '泽州县', '140500', '647', '1');
INSERT INTO `t_district` VALUES ('648', '140581', '高平市', '140500', '648', '1');
INSERT INTO `t_district` VALUES ('649', '140601', '市辖区', '140600', '649', '1');
INSERT INTO `t_district` VALUES ('650', '140602', '朔城区', '140600', '650', '1');
INSERT INTO `t_district` VALUES ('651', '140603', '平鲁区', '140600', '651', '1');
INSERT INTO `t_district` VALUES ('652', '140621', '山阴县', '140600', '652', '1');
INSERT INTO `t_district` VALUES ('653', '140622', '应　县', '140600', '653', '1');
INSERT INTO `t_district` VALUES ('654', '140623', '右玉县', '140600', '654', '1');
INSERT INTO `t_district` VALUES ('655', '140624', '怀仁县', '140600', '655', '1');
INSERT INTO `t_district` VALUES ('656', '140701', '市辖区', '140700', '656', '1');
INSERT INTO `t_district` VALUES ('657', '140702', '榆次区', '140700', '657', '1');
INSERT INTO `t_district` VALUES ('658', '140721', '榆社县', '140700', '658', '1');
INSERT INTO `t_district` VALUES ('659', '140722', '左权县', '140700', '659', '1');
INSERT INTO `t_district` VALUES ('660', '140723', '和顺县', '140700', '660', '1');
INSERT INTO `t_district` VALUES ('661', '140724', '昔阳县', '140700', '661', '1');
INSERT INTO `t_district` VALUES ('662', '140725', '寿阳县', '140700', '662', '1');
INSERT INTO `t_district` VALUES ('663', '140726', '太谷县', '140700', '663', '1');
INSERT INTO `t_district` VALUES ('664', '140727', '祁　县', '140700', '664', '1');
INSERT INTO `t_district` VALUES ('665', '140728', '平遥县', '140700', '665', '1');
INSERT INTO `t_district` VALUES ('666', '140729', '灵石县', '140700', '666', '1');
INSERT INTO `t_district` VALUES ('667', '140781', '介休市', '140700', '667', '1');
INSERT INTO `t_district` VALUES ('668', '140801', '市辖区', '140800', '668', '1');
INSERT INTO `t_district` VALUES ('669', '140802', '盐湖区', '140800', '669', '1');
INSERT INTO `t_district` VALUES ('670', '140821', '临猗县', '140800', '670', '1');
INSERT INTO `t_district` VALUES ('671', '140822', '万荣县', '140800', '671', '1');
INSERT INTO `t_district` VALUES ('672', '140823', '闻喜县', '140800', '672', '1');
INSERT INTO `t_district` VALUES ('673', '140824', '稷山县', '140800', '673', '1');
INSERT INTO `t_district` VALUES ('674', '140825', '新绛县', '140800', '674', '1');
INSERT INTO `t_district` VALUES ('675', '140826', '绛　县', '140800', '675', '1');
INSERT INTO `t_district` VALUES ('676', '140827', '垣曲县', '140800', '676', '1');
INSERT INTO `t_district` VALUES ('677', '140828', '夏　县', '140800', '677', '1');
INSERT INTO `t_district` VALUES ('678', '140829', '平陆县', '140800', '678', '1');
INSERT INTO `t_district` VALUES ('679', '140830', '芮城县', '140800', '679', '1');
INSERT INTO `t_district` VALUES ('680', '140881', '永济市', '140800', '680', '1');
INSERT INTO `t_district` VALUES ('681', '140882', '河津市', '140800', '681', '1');
INSERT INTO `t_district` VALUES ('682', '140901', '市辖区', '140900', '682', '1');
INSERT INTO `t_district` VALUES ('683', '140902', '忻府区', '140900', '683', '1');
INSERT INTO `t_district` VALUES ('684', '140921', '定襄县', '140900', '684', '1');
INSERT INTO `t_district` VALUES ('685', '140922', '五台县', '140900', '685', '1');
INSERT INTO `t_district` VALUES ('686', '140923', '代　县', '140900', '686', '1');
INSERT INTO `t_district` VALUES ('687', '140924', '繁峙县', '140900', '687', '1');
INSERT INTO `t_district` VALUES ('688', '140925', '宁武县', '140900', '688', '1');
INSERT INTO `t_district` VALUES ('689', '140926', '静乐县', '140900', '689', '1');
INSERT INTO `t_district` VALUES ('690', '140927', '神池县', '140900', '690', '1');
INSERT INTO `t_district` VALUES ('691', '140928', '五寨县', '140900', '691', '1');
INSERT INTO `t_district` VALUES ('692', '140929', '岢岚县', '140900', '692', '1');
INSERT INTO `t_district` VALUES ('693', '140930', '河曲县', '140900', '693', '1');
INSERT INTO `t_district` VALUES ('694', '140931', '保德县', '140900', '694', '1');
INSERT INTO `t_district` VALUES ('695', '140932', '偏关县', '140900', '695', '1');
INSERT INTO `t_district` VALUES ('696', '140981', '原平市', '140900', '696', '1');
INSERT INTO `t_district` VALUES ('697', '141001', '市辖区', '141000', '697', '1');
INSERT INTO `t_district` VALUES ('698', '141002', '尧都区', '141000', '698', '1');
INSERT INTO `t_district` VALUES ('699', '141021', '曲沃县', '141000', '699', '1');
INSERT INTO `t_district` VALUES ('700', '141022', '翼城县', '141000', '700', '1');
INSERT INTO `t_district` VALUES ('701', '141023', '襄汾县', '141000', '701', '1');
INSERT INTO `t_district` VALUES ('702', '141024', '洪洞县', '141000', '702', '1');
INSERT INTO `t_district` VALUES ('703', '141025', '古　县', '141000', '703', '1');
INSERT INTO `t_district` VALUES ('704', '141026', '安泽县', '141000', '704', '1');
INSERT INTO `t_district` VALUES ('705', '141027', '浮山县', '141000', '705', '1');
INSERT INTO `t_district` VALUES ('706', '141028', '吉　县', '141000', '706', '1');
INSERT INTO `t_district` VALUES ('707', '141029', '乡宁县', '141000', '707', '1');
INSERT INTO `t_district` VALUES ('708', '141030', '大宁县', '141000', '708', '1');
INSERT INTO `t_district` VALUES ('709', '141031', '隰　县', '141000', '709', '1');
INSERT INTO `t_district` VALUES ('710', '141032', '永和县', '141000', '710', '1');
INSERT INTO `t_district` VALUES ('711', '141033', '蒲　县', '141000', '711', '1');
INSERT INTO `t_district` VALUES ('712', '141034', '汾西县', '141000', '712', '1');
INSERT INTO `t_district` VALUES ('713', '141081', '侯马市', '141000', '713', '1');
INSERT INTO `t_district` VALUES ('714', '141082', '霍州市', '141000', '714', '1');
INSERT INTO `t_district` VALUES ('715', '141101', '市辖区', '141100', '715', '1');
INSERT INTO `t_district` VALUES ('716', '141102', '离石区', '141100', '716', '1');
INSERT INTO `t_district` VALUES ('717', '141121', '文水县', '141100', '717', '1');
INSERT INTO `t_district` VALUES ('718', '141122', '交城县', '141100', '718', '1');
INSERT INTO `t_district` VALUES ('719', '141123', '兴　县', '141100', '719', '1');
INSERT INTO `t_district` VALUES ('720', '141124', '临　县', '141100', '720', '1');
INSERT INTO `t_district` VALUES ('721', '141125', '柳林县', '141100', '721', '1');
INSERT INTO `t_district` VALUES ('722', '141126', '石楼县', '141100', '722', '1');
INSERT INTO `t_district` VALUES ('723', '141127', '岚　县', '141100', '723', '1');
INSERT INTO `t_district` VALUES ('724', '141128', '方山县', '141100', '724', '1');
INSERT INTO `t_district` VALUES ('725', '141129', '中阳县', '141100', '725', '1');
INSERT INTO `t_district` VALUES ('726', '141130', '交口县', '141100', '726', '1');
INSERT INTO `t_district` VALUES ('727', '141181', '孝义市', '141100', '727', '1');
INSERT INTO `t_district` VALUES ('728', '141182', '汾阳市', '141100', '728', '1');
INSERT INTO `t_district` VALUES ('729', '150101', '市辖区', '150100', '729', '1');
INSERT INTO `t_district` VALUES ('730', '150102', '新城区', '150100', '730', '1');
INSERT INTO `t_district` VALUES ('731', '150103', '回民区', '150100', '731', '1');
INSERT INTO `t_district` VALUES ('732', '150104', '玉泉区', '150100', '732', '1');
INSERT INTO `t_district` VALUES ('733', '150105', '赛罕区', '150100', '733', '1');
INSERT INTO `t_district` VALUES ('734', '150121', '土默特左旗', '150100', '734', '1');
INSERT INTO `t_district` VALUES ('735', '150122', '托克托县', '150100', '735', '1');
INSERT INTO `t_district` VALUES ('736', '150123', '和林格尔县', '150100', '736', '1');
INSERT INTO `t_district` VALUES ('737', '150124', '清水河县', '150100', '737', '1');
INSERT INTO `t_district` VALUES ('738', '150125', '武川县', '150100', '738', '1');
INSERT INTO `t_district` VALUES ('739', '150201', '市辖区', '150200', '739', '1');
INSERT INTO `t_district` VALUES ('740', '150202', '东河区', '150200', '740', '1');
INSERT INTO `t_district` VALUES ('741', '150203', '昆都仑区', '150200', '741', '1');
INSERT INTO `t_district` VALUES ('742', '150204', '青山区', '150200', '742', '1');
INSERT INTO `t_district` VALUES ('743', '150205', '石拐区', '150200', '743', '1');
INSERT INTO `t_district` VALUES ('744', '150206', '白云矿区', '150200', '744', '1');
INSERT INTO `t_district` VALUES ('745', '150207', '九原区', '150200', '745', '1');
INSERT INTO `t_district` VALUES ('746', '150221', '土默特右旗', '150200', '746', '1');
INSERT INTO `t_district` VALUES ('747', '150222', '固阳县', '150200', '747', '1');
INSERT INTO `t_district` VALUES ('748', '150223', '达尔罕茂明安联合旗', '150200', '748', '1');
INSERT INTO `t_district` VALUES ('749', '150301', '市辖区', '150300', '749', '1');
INSERT INTO `t_district` VALUES ('750', '150302', '海勃湾区', '150300', '750', '1');
INSERT INTO `t_district` VALUES ('751', '150303', '海南区', '150300', '751', '1');
INSERT INTO `t_district` VALUES ('752', '150304', '乌达区', '150300', '752', '1');
INSERT INTO `t_district` VALUES ('753', '150401', '市辖区', '150400', '753', '1');
INSERT INTO `t_district` VALUES ('754', '150402', '红山区', '150400', '754', '1');
INSERT INTO `t_district` VALUES ('755', '150403', '元宝山区', '150400', '755', '1');
INSERT INTO `t_district` VALUES ('756', '150404', '松山区', '150400', '756', '1');
INSERT INTO `t_district` VALUES ('757', '150421', '阿鲁科尔沁旗', '150400', '757', '1');
INSERT INTO `t_district` VALUES ('758', '150422', '巴林左旗', '150400', '758', '1');
INSERT INTO `t_district` VALUES ('759', '150423', '巴林右旗', '150400', '759', '1');
INSERT INTO `t_district` VALUES ('760', '150424', '林西县', '150400', '760', '1');
INSERT INTO `t_district` VALUES ('761', '150425', '克什克腾旗', '150400', '761', '1');
INSERT INTO `t_district` VALUES ('762', '150426', '翁牛特旗', '150400', '762', '1');
INSERT INTO `t_district` VALUES ('763', '150428', '喀喇沁旗', '150400', '763', '1');
INSERT INTO `t_district` VALUES ('764', '150429', '宁城县', '150400', '764', '1');
INSERT INTO `t_district` VALUES ('765', '150430', '敖汉旗', '150400', '765', '1');
INSERT INTO `t_district` VALUES ('766', '150501', '市辖区', '150500', '766', '1');
INSERT INTO `t_district` VALUES ('767', '150502', '科尔沁区', '150500', '767', '1');
INSERT INTO `t_district` VALUES ('768', '150521', '科尔沁左翼中旗', '150500', '768', '1');
INSERT INTO `t_district` VALUES ('769', '150522', '科尔沁左翼后旗', '150500', '769', '1');
INSERT INTO `t_district` VALUES ('770', '150523', '开鲁县', '150500', '770', '1');
INSERT INTO `t_district` VALUES ('771', '150524', '库伦旗', '150500', '771', '1');
INSERT INTO `t_district` VALUES ('772', '150525', '奈曼旗', '150500', '772', '1');
INSERT INTO `t_district` VALUES ('773', '150526', '扎鲁特旗', '150500', '773', '1');
INSERT INTO `t_district` VALUES ('774', '150581', '霍林郭勒市', '150500', '774', '1');
INSERT INTO `t_district` VALUES ('775', '150602', '东胜区', '150600', '775', '1');
INSERT INTO `t_district` VALUES ('776', '150621', '达拉特旗', '150600', '776', '1');
INSERT INTO `t_district` VALUES ('777', '150622', '准格尔旗', '150600', '777', '1');
INSERT INTO `t_district` VALUES ('778', '150623', '鄂托克前旗', '150600', '778', '1');
INSERT INTO `t_district` VALUES ('779', '150624', '鄂托克旗', '150600', '779', '1');
INSERT INTO `t_district` VALUES ('780', '150625', '杭锦旗', '150600', '780', '1');
INSERT INTO `t_district` VALUES ('781', '150626', '乌审旗', '150600', '781', '1');
INSERT INTO `t_district` VALUES ('782', '150627', '伊金霍洛旗', '150600', '782', '1');
INSERT INTO `t_district` VALUES ('783', '150701', '市辖区', '150700', '783', '1');
INSERT INTO `t_district` VALUES ('784', '150702', '海拉尔区', '150700', '784', '1');
INSERT INTO `t_district` VALUES ('785', '150721', '阿荣旗', '150700', '785', '1');
INSERT INTO `t_district` VALUES ('786', '150722', '莫力达瓦达斡尔族自治旗', '150700', '786', '1');
INSERT INTO `t_district` VALUES ('787', '150723', '鄂伦春自治旗', '150700', '787', '1');
INSERT INTO `t_district` VALUES ('788', '150724', '鄂温克族自治旗', '150700', '788', '1');
INSERT INTO `t_district` VALUES ('789', '150725', '陈巴尔虎旗', '150700', '789', '1');
INSERT INTO `t_district` VALUES ('790', '150726', '新巴尔虎左旗', '150700', '790', '1');
INSERT INTO `t_district` VALUES ('791', '150727', '新巴尔虎右旗', '150700', '791', '1');
INSERT INTO `t_district` VALUES ('792', '150781', '满洲里市', '150700', '792', '1');
INSERT INTO `t_district` VALUES ('793', '150782', '牙克石市', '150700', '793', '1');
INSERT INTO `t_district` VALUES ('794', '150783', '扎兰屯市', '150700', '794', '1');
INSERT INTO `t_district` VALUES ('795', '150784', '额尔古纳市', '150700', '795', '1');
INSERT INTO `t_district` VALUES ('796', '150785', '根河市', '150700', '796', '1');
INSERT INTO `t_district` VALUES ('797', '150801', '市辖区', '150800', '797', '1');
INSERT INTO `t_district` VALUES ('798', '150802', '临河区', '150800', '798', '1');
INSERT INTO `t_district` VALUES ('799', '150821', '五原县', '150800', '799', '1');
INSERT INTO `t_district` VALUES ('800', '150822', '磴口县', '150800', '800', '1');
INSERT INTO `t_district` VALUES ('801', '150823', '乌拉特前旗', '150800', '801', '1');
INSERT INTO `t_district` VALUES ('802', '150824', '乌拉特中旗', '150800', '802', '1');
INSERT INTO `t_district` VALUES ('803', '150825', '乌拉特后旗', '150800', '803', '1');
INSERT INTO `t_district` VALUES ('804', '150826', '杭锦后旗', '150800', '804', '1');
INSERT INTO `t_district` VALUES ('805', '150901', '市辖区', '150900', '805', '1');
INSERT INTO `t_district` VALUES ('806', '150902', '集宁区', '150900', '806', '1');
INSERT INTO `t_district` VALUES ('807', '150921', '卓资县', '150900', '807', '1');
INSERT INTO `t_district` VALUES ('808', '150922', '化德县', '150900', '808', '1');
INSERT INTO `t_district` VALUES ('809', '150923', '商都县', '150900', '809', '1');
INSERT INTO `t_district` VALUES ('810', '150924', '兴和县', '150900', '810', '1');
INSERT INTO `t_district` VALUES ('811', '150925', '凉城县', '150900', '811', '1');
INSERT INTO `t_district` VALUES ('812', '150926', '察哈尔右翼前旗', '150900', '812', '1');
INSERT INTO `t_district` VALUES ('813', '150927', '察哈尔右翼中旗', '150900', '813', '1');
INSERT INTO `t_district` VALUES ('814', '150928', '察哈尔右翼后旗', '150900', '814', '1');
INSERT INTO `t_district` VALUES ('815', '150929', '四子王旗', '150900', '815', '1');
INSERT INTO `t_district` VALUES ('816', '150981', '丰镇市', '150900', '816', '1');
INSERT INTO `t_district` VALUES ('817', '152201', '乌兰浩特市', '152200', '817', '1');
INSERT INTO `t_district` VALUES ('818', '152202', '阿尔山市', '152200', '818', '1');
INSERT INTO `t_district` VALUES ('819', '152221', '科尔沁右翼前旗', '152200', '819', '1');
INSERT INTO `t_district` VALUES ('820', '152222', '科尔沁右翼中旗', '152200', '820', '1');
INSERT INTO `t_district` VALUES ('821', '152223', '扎赉特旗', '152200', '821', '1');
INSERT INTO `t_district` VALUES ('822', '152224', '突泉县', '152200', '822', '1');
INSERT INTO `t_district` VALUES ('823', '152501', '二连浩特市', '152500', '823', '1');
INSERT INTO `t_district` VALUES ('824', '152502', '锡林浩特市', '152500', '824', '1');
INSERT INTO `t_district` VALUES ('825', '152522', '阿巴嘎旗', '152500', '825', '1');
INSERT INTO `t_district` VALUES ('826', '152523', '苏尼特左旗', '152500', '826', '1');
INSERT INTO `t_district` VALUES ('827', '152524', '苏尼特右旗', '152500', '827', '1');
INSERT INTO `t_district` VALUES ('828', '152525', '东乌珠穆沁旗', '152500', '828', '1');
INSERT INTO `t_district` VALUES ('829', '152526', '西乌珠穆沁旗', '152500', '829', '1');
INSERT INTO `t_district` VALUES ('830', '152527', '太仆寺旗', '152500', '830', '1');
INSERT INTO `t_district` VALUES ('831', '152528', '镶黄旗', '152500', '831', '1');
INSERT INTO `t_district` VALUES ('832', '152529', '正镶白旗', '152500', '832', '1');
INSERT INTO `t_district` VALUES ('833', '152530', '正蓝旗', '152500', '833', '1');
INSERT INTO `t_district` VALUES ('834', '152531', '多伦县', '152500', '834', '1');
INSERT INTO `t_district` VALUES ('835', '152921', '阿拉善左旗', '152900', '835', '1');
INSERT INTO `t_district` VALUES ('836', '152922', '阿拉善右旗', '152900', '836', '1');
INSERT INTO `t_district` VALUES ('837', '152923', '额济纳旗', '152900', '837', '1');
INSERT INTO `t_district` VALUES ('838', '210101', '市辖区', '210100', '838', '1');
INSERT INTO `t_district` VALUES ('839', '210102', '和平区', '210100', '839', '1');
INSERT INTO `t_district` VALUES ('840', '210103', '沈河区', '210100', '840', '1');
INSERT INTO `t_district` VALUES ('841', '210104', '大东区', '210100', '841', '1');
INSERT INTO `t_district` VALUES ('842', '210105', '皇姑区', '210100', '842', '1');
INSERT INTO `t_district` VALUES ('843', '210106', '铁西区', '210100', '843', '1');
INSERT INTO `t_district` VALUES ('844', '210111', '苏家屯区', '210100', '844', '1');
INSERT INTO `t_district` VALUES ('845', '210112', '东陵区', '210100', '845', '1');
INSERT INTO `t_district` VALUES ('846', '210113', '新城子区', '210100', '846', '1');
INSERT INTO `t_district` VALUES ('847', '210114', '于洪区', '210100', '847', '1');
INSERT INTO `t_district` VALUES ('848', '210122', '辽中县', '210100', '848', '1');
INSERT INTO `t_district` VALUES ('849', '210123', '康平县', '210100', '849', '1');
INSERT INTO `t_district` VALUES ('850', '210124', '法库县', '210100', '850', '1');
INSERT INTO `t_district` VALUES ('851', '210181', '新民市', '210100', '851', '1');
INSERT INTO `t_district` VALUES ('852', '210201', '市辖区', '210200', '852', '1');
INSERT INTO `t_district` VALUES ('853', '210202', '中山区', '210200', '853', '1');
INSERT INTO `t_district` VALUES ('854', '210203', '西岗区', '210200', '854', '1');
INSERT INTO `t_district` VALUES ('855', '210204', '沙河口区', '210200', '855', '1');
INSERT INTO `t_district` VALUES ('856', '210211', '甘井子区', '210200', '856', '1');
INSERT INTO `t_district` VALUES ('857', '210212', '旅顺口区', '210200', '857', '1');
INSERT INTO `t_district` VALUES ('858', '210213', '金州区', '210200', '858', '1');
INSERT INTO `t_district` VALUES ('859', '210224', '长海县', '210200', '859', '1');
INSERT INTO `t_district` VALUES ('860', '210281', '瓦房店市', '210200', '860', '1');
INSERT INTO `t_district` VALUES ('861', '210282', '普兰店市', '210200', '861', '1');
INSERT INTO `t_district` VALUES ('862', '210283', '庄河市', '210200', '862', '1');
INSERT INTO `t_district` VALUES ('863', '210301', '市辖区', '210300', '863', '1');
INSERT INTO `t_district` VALUES ('864', '210302', '铁东区', '210300', '864', '1');
INSERT INTO `t_district` VALUES ('865', '210303', '铁西区', '210300', '865', '1');
INSERT INTO `t_district` VALUES ('866', '210304', '立山区', '210300', '866', '1');
INSERT INTO `t_district` VALUES ('867', '210311', '千山区', '210300', '867', '1');
INSERT INTO `t_district` VALUES ('868', '210321', '台安县', '210300', '868', '1');
INSERT INTO `t_district` VALUES ('869', '210323', '岫岩满族自治县', '210300', '869', '1');
INSERT INTO `t_district` VALUES ('870', '210381', '海城市', '210300', '870', '1');
INSERT INTO `t_district` VALUES ('871', '210401', '市辖区', '210400', '871', '1');
INSERT INTO `t_district` VALUES ('872', '210402', '新抚区', '210400', '872', '1');
INSERT INTO `t_district` VALUES ('873', '210403', '东洲区', '210400', '873', '1');
INSERT INTO `t_district` VALUES ('874', '210404', '望花区', '210400', '874', '1');
INSERT INTO `t_district` VALUES ('875', '210411', '顺城区', '210400', '875', '1');
INSERT INTO `t_district` VALUES ('876', '210421', '抚顺县', '210400', '876', '1');
INSERT INTO `t_district` VALUES ('877', '210422', '新宾满族自治县', '210400', '877', '1');
INSERT INTO `t_district` VALUES ('878', '210423', '清原满族自治县', '210400', '878', '1');
INSERT INTO `t_district` VALUES ('879', '210501', '市辖区', '210500', '879', '1');
INSERT INTO `t_district` VALUES ('880', '210502', '平山区', '210500', '880', '1');
INSERT INTO `t_district` VALUES ('881', '210503', '溪湖区', '210500', '881', '1');
INSERT INTO `t_district` VALUES ('882', '210504', '明山区', '210500', '882', '1');
INSERT INTO `t_district` VALUES ('883', '210505', '南芬区', '210500', '883', '1');
INSERT INTO `t_district` VALUES ('884', '210521', '本溪满族自治县', '210500', '884', '1');
INSERT INTO `t_district` VALUES ('885', '210522', '桓仁满族自治县', '210500', '885', '1');
INSERT INTO `t_district` VALUES ('886', '210601', '市辖区', '210600', '886', '1');
INSERT INTO `t_district` VALUES ('887', '210602', '元宝区', '210600', '887', '1');
INSERT INTO `t_district` VALUES ('888', '210603', '振兴区', '210600', '888', '1');
INSERT INTO `t_district` VALUES ('889', '210604', '振安区', '210600', '889', '1');
INSERT INTO `t_district` VALUES ('890', '210624', '宽甸满族自治县', '210600', '890', '1');
INSERT INTO `t_district` VALUES ('891', '210681', '东港市', '210600', '891', '1');
INSERT INTO `t_district` VALUES ('892', '210682', '凤城市', '210600', '892', '1');
INSERT INTO `t_district` VALUES ('893', '210701', '市辖区', '210700', '893', '1');
INSERT INTO `t_district` VALUES ('894', '210702', '古塔区', '210700', '894', '1');
INSERT INTO `t_district` VALUES ('895', '210703', '凌河区', '210700', '895', '1');
INSERT INTO `t_district` VALUES ('896', '210711', '太和区', '210700', '896', '1');
INSERT INTO `t_district` VALUES ('897', '210726', '黑山县', '210700', '897', '1');
INSERT INTO `t_district` VALUES ('898', '210727', '义　县', '210700', '898', '1');
INSERT INTO `t_district` VALUES ('899', '210781', '凌海市', '210700', '899', '1');
INSERT INTO `t_district` VALUES ('900', '210782', '北宁市', '210700', '900', '1');
INSERT INTO `t_district` VALUES ('901', '210801', '市辖区', '210800', '901', '1');
INSERT INTO `t_district` VALUES ('902', '210802', '站前区', '210800', '902', '1');
INSERT INTO `t_district` VALUES ('903', '210803', '西市区', '210800', '903', '1');
INSERT INTO `t_district` VALUES ('904', '210804', '鲅鱼圈区', '210800', '904', '1');
INSERT INTO `t_district` VALUES ('905', '210811', '老边区', '210800', '905', '1');
INSERT INTO `t_district` VALUES ('906', '210881', '盖州市', '210800', '906', '1');
INSERT INTO `t_district` VALUES ('907', '210882', '大石桥市', '210800', '907', '1');
INSERT INTO `t_district` VALUES ('908', '210901', '市辖区', '210900', '908', '1');
INSERT INTO `t_district` VALUES ('909', '210902', '海州区', '210900', '909', '1');
INSERT INTO `t_district` VALUES ('910', '210903', '新邱区', '210900', '910', '1');
INSERT INTO `t_district` VALUES ('911', '210904', '太平区', '210900', '911', '1');
INSERT INTO `t_district` VALUES ('912', '210905', '清河门区', '210900', '912', '1');
INSERT INTO `t_district` VALUES ('913', '210911', '细河区', '210900', '913', '1');
INSERT INTO `t_district` VALUES ('914', '210921', '阜新蒙古族自治县', '210900', '914', '1');
INSERT INTO `t_district` VALUES ('915', '210922', '彰武县', '210900', '915', '1');
INSERT INTO `t_district` VALUES ('916', '211001', '市辖区', '211000', '916', '1');
INSERT INTO `t_district` VALUES ('917', '211002', '白塔区', '211000', '917', '1');
INSERT INTO `t_district` VALUES ('918', '211003', '文圣区', '211000', '918', '1');
INSERT INTO `t_district` VALUES ('919', '211004', '宏伟区', '211000', '919', '1');
INSERT INTO `t_district` VALUES ('920', '211005', '弓长岭区', '211000', '920', '1');
INSERT INTO `t_district` VALUES ('921', '211011', '太子河区', '211000', '921', '1');
INSERT INTO `t_district` VALUES ('922', '211021', '辽阳县', '211000', '922', '1');
INSERT INTO `t_district` VALUES ('923', '211081', '灯塔市', '211000', '923', '1');
INSERT INTO `t_district` VALUES ('924', '211101', '市辖区', '211100', '924', '1');
INSERT INTO `t_district` VALUES ('925', '211102', '双台子区', '211100', '925', '1');
INSERT INTO `t_district` VALUES ('926', '211103', '兴隆台区', '211100', '926', '1');
INSERT INTO `t_district` VALUES ('927', '211121', '大洼县', '211100', '927', '1');
INSERT INTO `t_district` VALUES ('928', '211122', '盘山县', '211100', '928', '1');
INSERT INTO `t_district` VALUES ('929', '211201', '市辖区', '211200', '929', '1');
INSERT INTO `t_district` VALUES ('930', '211202', '银州区', '211200', '930', '1');
INSERT INTO `t_district` VALUES ('931', '211204', '清河区', '211200', '931', '1');
INSERT INTO `t_district` VALUES ('932', '211221', '铁岭县', '211200', '932', '1');
INSERT INTO `t_district` VALUES ('933', '211223', '西丰县', '211200', '933', '1');
INSERT INTO `t_district` VALUES ('934', '211224', '昌图县', '211200', '934', '1');
INSERT INTO `t_district` VALUES ('935', '211281', '调兵山市', '211200', '935', '1');
INSERT INTO `t_district` VALUES ('936', '211282', '开原市', '211200', '936', '1');
INSERT INTO `t_district` VALUES ('937', '211301', '市辖区', '211300', '937', '1');
INSERT INTO `t_district` VALUES ('938', '211302', '双塔区', '211300', '938', '1');
INSERT INTO `t_district` VALUES ('939', '211303', '龙城区', '211300', '939', '1');
INSERT INTO `t_district` VALUES ('940', '211321', '朝阳县', '211300', '940', '1');
INSERT INTO `t_district` VALUES ('941', '211322', '建平县', '211300', '941', '1');
INSERT INTO `t_district` VALUES ('942', '211324', '喀喇沁左翼蒙古族自治县', '211300', '942', '1');
INSERT INTO `t_district` VALUES ('943', '211381', '北票市', '211300', '943', '1');
INSERT INTO `t_district` VALUES ('944', '211382', '凌源市', '211300', '944', '1');
INSERT INTO `t_district` VALUES ('945', '211401', '市辖区', '211400', '945', '1');
INSERT INTO `t_district` VALUES ('946', '211402', '连山区', '211400', '946', '1');
INSERT INTO `t_district` VALUES ('947', '211403', '龙港区', '211400', '947', '1');
INSERT INTO `t_district` VALUES ('948', '211404', '南票区', '211400', '948', '1');
INSERT INTO `t_district` VALUES ('949', '211421', '绥中县', '211400', '949', '1');
INSERT INTO `t_district` VALUES ('950', '211422', '建昌县', '211400', '950', '1');
INSERT INTO `t_district` VALUES ('951', '211481', '兴城市', '211400', '951', '1');
INSERT INTO `t_district` VALUES ('952', '220101', '市辖区', '220100', '952', '1');
INSERT INTO `t_district` VALUES ('953', '220102', '南关区', '220100', '953', '1');
INSERT INTO `t_district` VALUES ('954', '220103', '宽城区', '220100', '954', '1');
INSERT INTO `t_district` VALUES ('955', '220104', '朝阳区', '220100', '955', '1');
INSERT INTO `t_district` VALUES ('956', '220105', '二道区', '220100', '956', '1');
INSERT INTO `t_district` VALUES ('957', '220106', '绿园区', '220100', '957', '1');
INSERT INTO `t_district` VALUES ('958', '220112', '双阳区', '220100', '958', '1');
INSERT INTO `t_district` VALUES ('959', '220122', '农安县', '220100', '959', '1');
INSERT INTO `t_district` VALUES ('960', '220181', '九台市', '220100', '960', '1');
INSERT INTO `t_district` VALUES ('961', '220182', '榆树市', '220100', '961', '1');
INSERT INTO `t_district` VALUES ('962', '220183', '德惠市', '220100', '962', '1');
INSERT INTO `t_district` VALUES ('963', '220201', '市辖区', '220200', '963', '1');
INSERT INTO `t_district` VALUES ('964', '220202', '昌邑区', '220200', '964', '1');
INSERT INTO `t_district` VALUES ('965', '220203', '龙潭区', '220200', '965', '1');
INSERT INTO `t_district` VALUES ('966', '220204', '船营区', '220200', '966', '1');
INSERT INTO `t_district` VALUES ('967', '220211', '丰满区', '220200', '967', '1');
INSERT INTO `t_district` VALUES ('968', '220221', '永吉县', '220200', '968', '1');
INSERT INTO `t_district` VALUES ('969', '220281', '蛟河市', '220200', '969', '1');
INSERT INTO `t_district` VALUES ('970', '220282', '桦甸市', '220200', '970', '1');
INSERT INTO `t_district` VALUES ('971', '220283', '舒兰市', '220200', '971', '1');
INSERT INTO `t_district` VALUES ('972', '220284', '磐石市', '220200', '972', '1');
INSERT INTO `t_district` VALUES ('973', '220301', '市辖区', '220300', '973', '1');
INSERT INTO `t_district` VALUES ('974', '220302', '铁西区', '220300', '974', '1');
INSERT INTO `t_district` VALUES ('975', '220303', '铁东区', '220300', '975', '1');
INSERT INTO `t_district` VALUES ('976', '220322', '梨树县', '220300', '976', '1');
INSERT INTO `t_district` VALUES ('977', '220323', '伊通满族自治县', '220300', '977', '1');
INSERT INTO `t_district` VALUES ('978', '220381', '公主岭市', '220300', '978', '1');
INSERT INTO `t_district` VALUES ('979', '220382', '双辽市', '220300', '979', '1');
INSERT INTO `t_district` VALUES ('980', '220401', '市辖区', '220400', '980', '1');
INSERT INTO `t_district` VALUES ('981', '220402', '龙山区', '220400', '981', '1');
INSERT INTO `t_district` VALUES ('982', '220403', '西安区', '220400', '982', '1');
INSERT INTO `t_district` VALUES ('983', '220421', '东丰县', '220400', '983', '1');
INSERT INTO `t_district` VALUES ('984', '220422', '东辽县', '220400', '984', '1');
INSERT INTO `t_district` VALUES ('985', '220501', '市辖区', '220500', '985', '1');
INSERT INTO `t_district` VALUES ('986', '220502', '东昌区', '220500', '986', '1');
INSERT INTO `t_district` VALUES ('987', '220503', '二道江区', '220500', '987', '1');
INSERT INTO `t_district` VALUES ('988', '220521', '通化县', '220500', '988', '1');
INSERT INTO `t_district` VALUES ('989', '220523', '辉南县', '220500', '989', '1');
INSERT INTO `t_district` VALUES ('990', '220524', '柳河县', '220500', '990', '1');
INSERT INTO `t_district` VALUES ('991', '220581', '梅河口市', '220500', '991', '1');
INSERT INTO `t_district` VALUES ('992', '220582', '集安市', '220500', '992', '1');
INSERT INTO `t_district` VALUES ('993', '220601', '市辖区', '220600', '993', '1');
INSERT INTO `t_district` VALUES ('994', '220602', '八道江区', '220600', '994', '1');
INSERT INTO `t_district` VALUES ('995', '220621', '抚松县', '220600', '995', '1');
INSERT INTO `t_district` VALUES ('996', '220622', '靖宇县', '220600', '996', '1');
INSERT INTO `t_district` VALUES ('997', '220623', '长白朝鲜族自治县', '220600', '997', '1');
INSERT INTO `t_district` VALUES ('998', '220625', '江源县', '220600', '998', '1');
INSERT INTO `t_district` VALUES ('999', '220681', '临江市', '220600', '999', '1');
INSERT INTO `t_district` VALUES ('1000', '220701', '市辖区', '220700', '1000', '1');
INSERT INTO `t_district` VALUES ('1001', '220702', '宁江区', '220700', '1001', '1');
INSERT INTO `t_district` VALUES ('1002', '220721', '前郭尔罗斯蒙古族自治县', '220700', '1002', '1');
INSERT INTO `t_district` VALUES ('1003', '220722', '长岭县', '220700', '1003', '1');
INSERT INTO `t_district` VALUES ('1004', '220723', '乾安县', '220700', '1004', '1');
INSERT INTO `t_district` VALUES ('1005', '220724', '扶余县', '220700', '1005', '1');
INSERT INTO `t_district` VALUES ('1006', '220801', '市辖区', '220800', '1006', '1');
INSERT INTO `t_district` VALUES ('1007', '220802', '洮北区', '220800', '1007', '1');
INSERT INTO `t_district` VALUES ('1008', '220821', '镇赉县', '220800', '1008', '1');
INSERT INTO `t_district` VALUES ('1009', '220822', '通榆县', '220800', '1009', '1');
INSERT INTO `t_district` VALUES ('1010', '220881', '洮南市', '220800', '1010', '1');
INSERT INTO `t_district` VALUES ('1011', '220882', '大安市', '220800', '1011', '1');
INSERT INTO `t_district` VALUES ('1012', '222401', '延吉市', '222400', '1012', '1');
INSERT INTO `t_district` VALUES ('1013', '222402', '图们市', '222400', '1013', '1');
INSERT INTO `t_district` VALUES ('1014', '222403', '敦化市', '222400', '1014', '1');
INSERT INTO `t_district` VALUES ('1015', '222404', '珲春市', '222400', '1015', '1');
INSERT INTO `t_district` VALUES ('1016', '222405', '龙井市', '222400', '1016', '1');
INSERT INTO `t_district` VALUES ('1017', '222406', '和龙市', '222400', '1017', '1');
INSERT INTO `t_district` VALUES ('1018', '222424', '汪清县', '222400', '1018', '1');
INSERT INTO `t_district` VALUES ('1019', '222426', '安图县', '222400', '1019', '1');
INSERT INTO `t_district` VALUES ('1020', '230101', '市辖区', '230100', '1020', '1');
INSERT INTO `t_district` VALUES ('1021', '230102', '道里区', '230100', '1021', '1');
INSERT INTO `t_district` VALUES ('1022', '230103', '南岗区', '230100', '1022', '1');
INSERT INTO `t_district` VALUES ('1023', '230104', '道外区', '230100', '1023', '1');
INSERT INTO `t_district` VALUES ('1024', '230106', '香坊区', '230100', '1024', '1');
INSERT INTO `t_district` VALUES ('1025', '230107', '动力区', '230100', '1025', '1');
INSERT INTO `t_district` VALUES ('1026', '230108', '平房区', '230100', '1026', '1');
INSERT INTO `t_district` VALUES ('1027', '230109', '松北区', '230100', '1027', '1');
INSERT INTO `t_district` VALUES ('1028', '230111', '呼兰区', '230100', '1028', '1');
INSERT INTO `t_district` VALUES ('1029', '230123', '依兰县', '230100', '1029', '1');
INSERT INTO `t_district` VALUES ('1030', '230124', '方正县', '230100', '1030', '1');
INSERT INTO `t_district` VALUES ('1031', '230125', '宾　县', '230100', '1031', '1');
INSERT INTO `t_district` VALUES ('1032', '230126', '巴彦县', '230100', '1032', '1');
INSERT INTO `t_district` VALUES ('1033', '230127', '木兰县', '230100', '1033', '1');
INSERT INTO `t_district` VALUES ('1034', '230128', '通河县', '230100', '1034', '1');
INSERT INTO `t_district` VALUES ('1035', '230129', '延寿县', '230100', '1035', '1');
INSERT INTO `t_district` VALUES ('1036', '230181', '阿城市', '230100', '1036', '1');
INSERT INTO `t_district` VALUES ('1037', '230182', '双城市', '230100', '1037', '1');
INSERT INTO `t_district` VALUES ('1038', '230183', '尚志市', '230100', '1038', '1');
INSERT INTO `t_district` VALUES ('1039', '230184', '五常市', '230100', '1039', '1');
INSERT INTO `t_district` VALUES ('1040', '230201', '市辖区', '230200', '1040', '1');
INSERT INTO `t_district` VALUES ('1041', '230202', '龙沙区', '230200', '1041', '1');
INSERT INTO `t_district` VALUES ('1042', '230203', '建华区', '230200', '1042', '1');
INSERT INTO `t_district` VALUES ('1043', '230204', '铁锋区', '230200', '1043', '1');
INSERT INTO `t_district` VALUES ('1044', '230205', '昂昂溪区', '230200', '1044', '1');
INSERT INTO `t_district` VALUES ('1045', '230206', '富拉尔基区', '230200', '1045', '1');
INSERT INTO `t_district` VALUES ('1046', '230207', '碾子山区', '230200', '1046', '1');
INSERT INTO `t_district` VALUES ('1047', '230208', '梅里斯达斡尔族区', '230200', '1047', '1');
INSERT INTO `t_district` VALUES ('1048', '230221', '龙江县', '230200', '1048', '1');
INSERT INTO `t_district` VALUES ('1049', '230223', '依安县', '230200', '1049', '1');
INSERT INTO `t_district` VALUES ('1050', '230224', '泰来县', '230200', '1050', '1');
INSERT INTO `t_district` VALUES ('1051', '230225', '甘南县', '230200', '1051', '1');
INSERT INTO `t_district` VALUES ('1052', '230227', '富裕县', '230200', '1052', '1');
INSERT INTO `t_district` VALUES ('1053', '230229', '克山县', '230200', '1053', '1');
INSERT INTO `t_district` VALUES ('1054', '230230', '克东县', '230200', '1054', '1');
INSERT INTO `t_district` VALUES ('1055', '230231', '拜泉县', '230200', '1055', '1');
INSERT INTO `t_district` VALUES ('1056', '230281', '讷河市', '230200', '1056', '1');
INSERT INTO `t_district` VALUES ('1057', '230301', '市辖区', '230300', '1057', '1');
INSERT INTO `t_district` VALUES ('1058', '230302', '鸡冠区', '230300', '1058', '1');
INSERT INTO `t_district` VALUES ('1059', '230303', '恒山区', '230300', '1059', '1');
INSERT INTO `t_district` VALUES ('1060', '230304', '滴道区', '230300', '1060', '1');
INSERT INTO `t_district` VALUES ('1061', '230305', '梨树区', '230300', '1061', '1');
INSERT INTO `t_district` VALUES ('1062', '230306', '城子河区', '230300', '1062', '1');
INSERT INTO `t_district` VALUES ('1063', '230307', '麻山区', '230300', '1063', '1');
INSERT INTO `t_district` VALUES ('1064', '230321', '鸡东县', '230300', '1064', '1');
INSERT INTO `t_district` VALUES ('1065', '230381', '虎林市', '230300', '1065', '1');
INSERT INTO `t_district` VALUES ('1066', '230382', '密山市', '230300', '1066', '1');
INSERT INTO `t_district` VALUES ('1067', '230401', '市辖区', '230400', '1067', '1');
INSERT INTO `t_district` VALUES ('1068', '230402', '向阳区', '230400', '1068', '1');
INSERT INTO `t_district` VALUES ('1069', '230403', '工农区', '230400', '1069', '1');
INSERT INTO `t_district` VALUES ('1070', '230404', '南山区', '230400', '1070', '1');
INSERT INTO `t_district` VALUES ('1071', '230405', '兴安区', '230400', '1071', '1');
INSERT INTO `t_district` VALUES ('1072', '230406', '东山区', '230400', '1072', '1');
INSERT INTO `t_district` VALUES ('1073', '230407', '兴山区', '230400', '1073', '1');
INSERT INTO `t_district` VALUES ('1074', '230421', '萝北县', '230400', '1074', '1');
INSERT INTO `t_district` VALUES ('1075', '230422', '绥滨县', '230400', '1075', '1');
INSERT INTO `t_district` VALUES ('1076', '230501', '市辖区', '230500', '1076', '1');
INSERT INTO `t_district` VALUES ('1077', '230502', '尖山区', '230500', '1077', '1');
INSERT INTO `t_district` VALUES ('1078', '230503', '岭东区', '230500', '1078', '1');
INSERT INTO `t_district` VALUES ('1079', '230505', '四方台区', '230500', '1079', '1');
INSERT INTO `t_district` VALUES ('1080', '230506', '宝山区', '230500', '1080', '1');
INSERT INTO `t_district` VALUES ('1081', '230521', '集贤县', '230500', '1081', '1');
INSERT INTO `t_district` VALUES ('1082', '230522', '友谊县', '230500', '1082', '1');
INSERT INTO `t_district` VALUES ('1083', '230523', '宝清县', '230500', '1083', '1');
INSERT INTO `t_district` VALUES ('1084', '230524', '饶河县', '230500', '1084', '1');
INSERT INTO `t_district` VALUES ('1085', '230601', '市辖区', '230600', '1085', '1');
INSERT INTO `t_district` VALUES ('1086', '230602', '萨尔图区', '230600', '1086', '1');
INSERT INTO `t_district` VALUES ('1087', '230603', '龙凤区', '230600', '1087', '1');
INSERT INTO `t_district` VALUES ('1088', '230604', '让胡路区', '230600', '1088', '1');
INSERT INTO `t_district` VALUES ('1089', '230605', '红岗区', '230600', '1089', '1');
INSERT INTO `t_district` VALUES ('1090', '230606', '大同区', '230600', '1090', '1');
INSERT INTO `t_district` VALUES ('1091', '230621', '肇州县', '230600', '1091', '1');
INSERT INTO `t_district` VALUES ('1092', '230622', '肇源县', '230600', '1092', '1');
INSERT INTO `t_district` VALUES ('1093', '230623', '林甸县', '230600', '1093', '1');
INSERT INTO `t_district` VALUES ('1094', '230624', '杜尔伯特蒙古族自治县', '230600', '1094', '1');
INSERT INTO `t_district` VALUES ('1095', '230701', '市辖区', '230700', '1095', '1');
INSERT INTO `t_district` VALUES ('1096', '230702', '伊春区', '230700', '1096', '1');
INSERT INTO `t_district` VALUES ('1097', '230703', '南岔区', '230700', '1097', '1');
INSERT INTO `t_district` VALUES ('1098', '230704', '友好区', '230700', '1098', '1');
INSERT INTO `t_district` VALUES ('1099', '230705', '西林区', '230700', '1099', '1');
INSERT INTO `t_district` VALUES ('1100', '230706', '翠峦区', '230700', '1100', '1');
INSERT INTO `t_district` VALUES ('1101', '230707', '新青区', '230700', '1101', '1');
INSERT INTO `t_district` VALUES ('1102', '230708', '美溪区', '230700', '1102', '1');
INSERT INTO `t_district` VALUES ('1103', '230709', '金山屯区', '230700', '1103', '1');
INSERT INTO `t_district` VALUES ('1104', '230710', '五营区', '230700', '1104', '1');
INSERT INTO `t_district` VALUES ('1105', '230711', '乌马河区', '230700', '1105', '1');
INSERT INTO `t_district` VALUES ('1106', '230712', '汤旺河区', '230700', '1106', '1');
INSERT INTO `t_district` VALUES ('1107', '230713', '带岭区', '230700', '1107', '1');
INSERT INTO `t_district` VALUES ('1108', '230714', '乌伊岭区', '230700', '1108', '1');
INSERT INTO `t_district` VALUES ('1109', '230715', '红星区', '230700', '1109', '1');
INSERT INTO `t_district` VALUES ('1110', '230716', '上甘岭区', '230700', '1110', '1');
INSERT INTO `t_district` VALUES ('1111', '230722', '嘉荫县', '230700', '1111', '1');
INSERT INTO `t_district` VALUES ('1112', '230781', '铁力市', '230700', '1112', '1');
INSERT INTO `t_district` VALUES ('1113', '230801', '市辖区', '230800', '1113', '1');
INSERT INTO `t_district` VALUES ('1114', '230802', '永红区', '230800', '1114', '1');
INSERT INTO `t_district` VALUES ('1115', '230803', '向阳区', '230800', '1115', '1');
INSERT INTO `t_district` VALUES ('1116', '230804', '前进区', '230800', '1116', '1');
INSERT INTO `t_district` VALUES ('1117', '230805', '东风区', '230800', '1117', '1');
INSERT INTO `t_district` VALUES ('1118', '230811', '郊　区', '230800', '1118', '1');
INSERT INTO `t_district` VALUES ('1119', '230822', '桦南县', '230800', '1119', '1');
INSERT INTO `t_district` VALUES ('1120', '230826', '桦川县', '230800', '1120', '1');
INSERT INTO `t_district` VALUES ('1121', '230828', '汤原县', '230800', '1121', '1');
INSERT INTO `t_district` VALUES ('1122', '230833', '抚远县', '230800', '1122', '1');
INSERT INTO `t_district` VALUES ('1123', '230881', '同江市', '230800', '1123', '1');
INSERT INTO `t_district` VALUES ('1124', '230882', '富锦市', '230800', '1124', '1');
INSERT INTO `t_district` VALUES ('1125', '230901', '市辖区', '230900', '1125', '1');
INSERT INTO `t_district` VALUES ('1126', '230902', '新兴区', '230900', '1126', '1');
INSERT INTO `t_district` VALUES ('1127', '230903', '桃山区', '230900', '1127', '1');
INSERT INTO `t_district` VALUES ('1128', '230904', '茄子河区', '230900', '1128', '1');
INSERT INTO `t_district` VALUES ('1129', '230921', '勃利县', '230900', '1129', '1');
INSERT INTO `t_district` VALUES ('1130', '231001', '市辖区', '231000', '1130', '1');
INSERT INTO `t_district` VALUES ('1131', '231002', '东安区', '231000', '1131', '1');
INSERT INTO `t_district` VALUES ('1132', '231003', '阳明区', '231000', '1132', '1');
INSERT INTO `t_district` VALUES ('1133', '231004', '爱民区', '231000', '1133', '1');
INSERT INTO `t_district` VALUES ('1134', '231005', '西安区', '231000', '1134', '1');
INSERT INTO `t_district` VALUES ('1135', '231024', '东宁县', '231000', '1135', '1');
INSERT INTO `t_district` VALUES ('1136', '231025', '林口县', '231000', '1136', '1');
INSERT INTO `t_district` VALUES ('1137', '231081', '绥芬河市', '231000', '1137', '1');
INSERT INTO `t_district` VALUES ('1138', '231083', '海林市', '231000', '1138', '1');
INSERT INTO `t_district` VALUES ('1139', '231084', '宁安市', '231000', '1139', '1');
INSERT INTO `t_district` VALUES ('1140', '231085', '穆棱市', '231000', '1140', '1');
INSERT INTO `t_district` VALUES ('1141', '231101', '市辖区', '231100', '1141', '1');
INSERT INTO `t_district` VALUES ('1142', '231102', '爱辉区', '231100', '1142', '1');
INSERT INTO `t_district` VALUES ('1143', '231121', '嫩江县', '231100', '1143', '1');
INSERT INTO `t_district` VALUES ('1144', '231123', '逊克县', '231100', '1144', '1');
INSERT INTO `t_district` VALUES ('1145', '231124', '孙吴县', '231100', '1145', '1');
INSERT INTO `t_district` VALUES ('1146', '231181', '北安市', '231100', '1146', '1');
INSERT INTO `t_district` VALUES ('1147', '231182', '五大连池市', '231100', '1147', '1');
INSERT INTO `t_district` VALUES ('1148', '231201', '市辖区', '231200', '1148', '1');
INSERT INTO `t_district` VALUES ('1149', '231202', '北林区', '231200', '1149', '1');
INSERT INTO `t_district` VALUES ('1150', '231221', '望奎县', '231200', '1150', '1');
INSERT INTO `t_district` VALUES ('1151', '231222', '兰西县', '231200', '1151', '1');
INSERT INTO `t_district` VALUES ('1152', '231223', '青冈县', '231200', '1152', '1');
INSERT INTO `t_district` VALUES ('1153', '231224', '庆安县', '231200', '1153', '1');
INSERT INTO `t_district` VALUES ('1154', '231225', '明水县', '231200', '1154', '1');
INSERT INTO `t_district` VALUES ('1155', '231226', '绥棱县', '231200', '1155', '1');
INSERT INTO `t_district` VALUES ('1156', '231281', '安达市', '231200', '1156', '1');
INSERT INTO `t_district` VALUES ('1157', '231282', '肇东市', '231200', '1157', '1');
INSERT INTO `t_district` VALUES ('1158', '231283', '海伦市', '231200', '1158', '1');
INSERT INTO `t_district` VALUES ('1159', '232721', '呼玛县', '232700', '1159', '1');
INSERT INTO `t_district` VALUES ('1160', '232722', '塔河县', '232700', '1160', '1');
INSERT INTO `t_district` VALUES ('1161', '232723', '漠河县', '232700', '1161', '1');
INSERT INTO `t_district` VALUES ('1162', '310101', '黄浦区', '310100', '1162', '1');
INSERT INTO `t_district` VALUES ('1163', '310103', '卢湾区', '310100', '1163', '1');
INSERT INTO `t_district` VALUES ('1164', '310104', '徐汇区', '310100', '1164', '1');
INSERT INTO `t_district` VALUES ('1165', '310105', '长宁区', '310100', '1165', '1');
INSERT INTO `t_district` VALUES ('1166', '310106', '静安区', '310100', '1166', '1');
INSERT INTO `t_district` VALUES ('1167', '310107', '普陀区', '310100', '1167', '1');
INSERT INTO `t_district` VALUES ('1168', '310108', '闸北区', '310100', '1168', '1');
INSERT INTO `t_district` VALUES ('1169', '310109', '虹口区', '310100', '1169', '1');
INSERT INTO `t_district` VALUES ('1170', '310110', '杨浦区', '310100', '1170', '1');
INSERT INTO `t_district` VALUES ('1171', '310112', '闵行区', '310100', '1171', '1');
INSERT INTO `t_district` VALUES ('1172', '310113', '宝山区', '310100', '1172', '1');
INSERT INTO `t_district` VALUES ('1173', '310114', '嘉定区', '310100', '1173', '1');
INSERT INTO `t_district` VALUES ('1174', '310115', '浦东新区', '310100', '1174', '1');
INSERT INTO `t_district` VALUES ('1175', '310116', '金山区', '310100', '1175', '1');
INSERT INTO `t_district` VALUES ('1176', '310117', '松江区', '310100', '1176', '1');
INSERT INTO `t_district` VALUES ('1177', '310118', '青浦区', '310100', '1177', '1');
INSERT INTO `t_district` VALUES ('1178', '310119', '南汇区', '310100', '1178', '1');
INSERT INTO `t_district` VALUES ('1179', '310120', '奉贤区', '310100', '1179', '1');
INSERT INTO `t_district` VALUES ('1180', '310230', '崇明县', '310200', '1180', '1');
INSERT INTO `t_district` VALUES ('1181', '320101', '市辖区', '320100', '1181', '1');
INSERT INTO `t_district` VALUES ('1182', '320102', '玄武区', '320100', '1182', '1');
INSERT INTO `t_district` VALUES ('1183', '320103', '白下区', '320100', '1183', '1');
INSERT INTO `t_district` VALUES ('1184', '320104', '秦淮区', '320100', '1184', '1');
INSERT INTO `t_district` VALUES ('1185', '320105', '建邺区', '320100', '1185', '1');
INSERT INTO `t_district` VALUES ('1186', '320106', '鼓楼区', '320100', '1186', '1');
INSERT INTO `t_district` VALUES ('1187', '320107', '下关区', '320100', '1187', '1');
INSERT INTO `t_district` VALUES ('1188', '320111', '浦口区', '320100', '1188', '1');
INSERT INTO `t_district` VALUES ('1189', '320113', '栖霞区', '320100', '1189', '1');
INSERT INTO `t_district` VALUES ('1190', '320114', '雨花台区', '320100', '1190', '1');
INSERT INTO `t_district` VALUES ('1191', '320115', '江宁区', '320100', '1191', '1');
INSERT INTO `t_district` VALUES ('1192', '320116', '六合区', '320100', '1192', '1');
INSERT INTO `t_district` VALUES ('1193', '320124', '溧水县', '320100', '1193', '1');
INSERT INTO `t_district` VALUES ('1194', '320125', '高淳县', '320100', '1194', '1');
INSERT INTO `t_district` VALUES ('1195', '320201', '市辖区', '320200', '1195', '1');
INSERT INTO `t_district` VALUES ('1196', '320202', '崇安区', '320200', '1196', '1');
INSERT INTO `t_district` VALUES ('1197', '320203', '南长区', '320200', '1197', '1');
INSERT INTO `t_district` VALUES ('1198', '320204', '北塘区', '320200', '1198', '1');
INSERT INTO `t_district` VALUES ('1199', '320205', '锡山区', '320200', '1199', '1');
INSERT INTO `t_district` VALUES ('1200', '320206', '惠山区', '320200', '1200', '1');
INSERT INTO `t_district` VALUES ('1201', '320211', '滨湖区', '320200', '1201', '1');
INSERT INTO `t_district` VALUES ('1202', '320281', '江阴市', '320200', '1202', '1');
INSERT INTO `t_district` VALUES ('1203', '320282', '宜兴市', '320200', '1203', '1');
INSERT INTO `t_district` VALUES ('1204', '320301', '市辖区', '320300', '1204', '1');
INSERT INTO `t_district` VALUES ('1205', '320302', '鼓楼区', '320300', '1205', '1');
INSERT INTO `t_district` VALUES ('1206', '320303', '云龙区', '320300', '1206', '1');
INSERT INTO `t_district` VALUES ('1207', '320304', '九里区', '320300', '1207', '1');
INSERT INTO `t_district` VALUES ('1208', '320305', '贾汪区', '320300', '1208', '1');
INSERT INTO `t_district` VALUES ('1209', '320311', '泉山区', '320300', '1209', '1');
INSERT INTO `t_district` VALUES ('1210', '320321', '丰　县', '320300', '1210', '1');
INSERT INTO `t_district` VALUES ('1211', '320322', '沛　县', '320300', '1211', '1');
INSERT INTO `t_district` VALUES ('1212', '320323', '铜山县', '320300', '1212', '1');
INSERT INTO `t_district` VALUES ('1213', '320324', '睢宁县', '320300', '1213', '1');
INSERT INTO `t_district` VALUES ('1214', '320381', '新沂市', '320300', '1214', '1');
INSERT INTO `t_district` VALUES ('1215', '320382', '邳州市', '320300', '1215', '1');
INSERT INTO `t_district` VALUES ('1216', '320401', '市辖区', '320400', '1216', '1');
INSERT INTO `t_district` VALUES ('1217', '320402', '天宁区', '320400', '1217', '1');
INSERT INTO `t_district` VALUES ('1218', '320404', '钟楼区', '320400', '1218', '1');
INSERT INTO `t_district` VALUES ('1219', '320405', '戚墅堰区', '320400', '1219', '1');
INSERT INTO `t_district` VALUES ('1220', '320411', '新北区', '320400', '1220', '1');
INSERT INTO `t_district` VALUES ('1221', '320412', '武进区', '320400', '1221', '1');
INSERT INTO `t_district` VALUES ('1222', '320481', '溧阳市', '320400', '1222', '1');
INSERT INTO `t_district` VALUES ('1223', '320482', '金坛市', '320400', '1223', '1');
INSERT INTO `t_district` VALUES ('1224', '320501', '市辖区', '320500', '1224', '1');
INSERT INTO `t_district` VALUES ('1225', '320502', '沧浪区', '320500', '1225', '1');
INSERT INTO `t_district` VALUES ('1226', '320503', '平江区', '320500', '1226', '1');
INSERT INTO `t_district` VALUES ('1227', '320504', '金阊区', '320500', '1227', '1');
INSERT INTO `t_district` VALUES ('1228', '320505', '虎丘区', '320500', '1228', '1');
INSERT INTO `t_district` VALUES ('1229', '320506', '吴中区', '320500', '1229', '1');
INSERT INTO `t_district` VALUES ('1230', '320507', '相城区', '320500', '1230', '1');
INSERT INTO `t_district` VALUES ('1231', '320581', '常熟市', '320500', '1231', '1');
INSERT INTO `t_district` VALUES ('1232', '320582', '张家港市', '320500', '1232', '1');
INSERT INTO `t_district` VALUES ('1233', '320583', '昆山市', '320500', '1233', '1');
INSERT INTO `t_district` VALUES ('1234', '320584', '吴江市', '320500', '1234', '1');
INSERT INTO `t_district` VALUES ('1235', '320585', '太仓市', '320500', '1235', '1');
INSERT INTO `t_district` VALUES ('1236', '320601', '市辖区', '320600', '1236', '1');
INSERT INTO `t_district` VALUES ('1237', '320602', '崇川区', '320600', '1237', '1');
INSERT INTO `t_district` VALUES ('1238', '320611', '港闸区', '320600', '1238', '1');
INSERT INTO `t_district` VALUES ('1239', '320621', '海安县', '320600', '1239', '1');
INSERT INTO `t_district` VALUES ('1240', '320623', '如东县', '320600', '1240', '1');
INSERT INTO `t_district` VALUES ('1241', '320681', '启东市', '320600', '1241', '1');
INSERT INTO `t_district` VALUES ('1242', '320682', '如皋市', '320600', '1242', '1');
INSERT INTO `t_district` VALUES ('1243', '320683', '通州市', '320600', '1243', '1');
INSERT INTO `t_district` VALUES ('1244', '320684', '海门市', '320600', '1244', '1');
INSERT INTO `t_district` VALUES ('1245', '320701', '市辖区', '320700', '1245', '1');
INSERT INTO `t_district` VALUES ('1246', '320703', '连云区', '320700', '1246', '1');
INSERT INTO `t_district` VALUES ('1247', '320705', '新浦区', '320700', '1247', '1');
INSERT INTO `t_district` VALUES ('1248', '320706', '海州区', '320700', '1248', '1');
INSERT INTO `t_district` VALUES ('1249', '320721', '赣榆县', '320700', '1249', '1');
INSERT INTO `t_district` VALUES ('1250', '320722', '东海县', '320700', '1250', '1');
INSERT INTO `t_district` VALUES ('1251', '320723', '灌云县', '320700', '1251', '1');
INSERT INTO `t_district` VALUES ('1252', '320724', '灌南县', '320700', '1252', '1');
INSERT INTO `t_district` VALUES ('1253', '320801', '市辖区', '320800', '1253', '1');
INSERT INTO `t_district` VALUES ('1254', '320802', '清河区', '320800', '1254', '1');
INSERT INTO `t_district` VALUES ('1255', '320803', '楚州区', '320800', '1255', '1');
INSERT INTO `t_district` VALUES ('1256', '320804', '淮阴区', '320800', '1256', '1');
INSERT INTO `t_district` VALUES ('1257', '320811', '清浦区', '320800', '1257', '1');
INSERT INTO `t_district` VALUES ('1258', '320826', '涟水县', '320800', '1258', '1');
INSERT INTO `t_district` VALUES ('1259', '320829', '洪泽县', '320800', '1259', '1');
INSERT INTO `t_district` VALUES ('1260', '320830', '盱眙县', '320800', '1260', '1');
INSERT INTO `t_district` VALUES ('1261', '320831', '金湖县', '320800', '1261', '1');
INSERT INTO `t_district` VALUES ('1262', '320901', '市辖区', '320900', '1262', '1');
INSERT INTO `t_district` VALUES ('1263', '320902', '亭湖区', '320900', '1263', '1');
INSERT INTO `t_district` VALUES ('1264', '320903', '盐都区', '320900', '1264', '1');
INSERT INTO `t_district` VALUES ('1265', '320921', '响水县', '320900', '1265', '1');
INSERT INTO `t_district` VALUES ('1266', '320922', '滨海县', '320900', '1266', '1');
INSERT INTO `t_district` VALUES ('1267', '320923', '阜宁县', '320900', '1267', '1');
INSERT INTO `t_district` VALUES ('1268', '320924', '射阳县', '320900', '1268', '1');
INSERT INTO `t_district` VALUES ('1269', '320925', '建湖县', '320900', '1269', '1');
INSERT INTO `t_district` VALUES ('1270', '320981', '东台市', '320900', '1270', '1');
INSERT INTO `t_district` VALUES ('1271', '320982', '大丰市', '320900', '1271', '1');
INSERT INTO `t_district` VALUES ('1272', '321001', '市辖区', '321000', '1272', '1');
INSERT INTO `t_district` VALUES ('1273', '321002', '广陵区', '321000', '1273', '1');
INSERT INTO `t_district` VALUES ('1274', '321003', '邗江区', '321000', '1274', '1');
INSERT INTO `t_district` VALUES ('1275', '321011', '郊　区', '321000', '1275', '1');
INSERT INTO `t_district` VALUES ('1276', '321023', '宝应县', '321000', '1276', '1');
INSERT INTO `t_district` VALUES ('1277', '321081', '仪征市', '321000', '1277', '1');
INSERT INTO `t_district` VALUES ('1278', '321084', '高邮市', '321000', '1278', '1');
INSERT INTO `t_district` VALUES ('1279', '321088', '江都市', '321000', '1279', '1');
INSERT INTO `t_district` VALUES ('1280', '321101', '市辖区', '321100', '1280', '1');
INSERT INTO `t_district` VALUES ('1281', '321102', '京口区', '321100', '1281', '1');
INSERT INTO `t_district` VALUES ('1282', '321111', '润州区', '321100', '1282', '1');
INSERT INTO `t_district` VALUES ('1283', '321112', '丹徒区', '321100', '1283', '1');
INSERT INTO `t_district` VALUES ('1284', '321181', '丹阳市', '321100', '1284', '1');
INSERT INTO `t_district` VALUES ('1285', '321182', '扬中市', '321100', '1285', '1');
INSERT INTO `t_district` VALUES ('1286', '321183', '句容市', '321100', '1286', '1');
INSERT INTO `t_district` VALUES ('1287', '321201', '市辖区', '321200', '1287', '1');
INSERT INTO `t_district` VALUES ('1288', '321202', '海陵区', '321200', '1288', '1');
INSERT INTO `t_district` VALUES ('1289', '321203', '高港区', '321200', '1289', '1');
INSERT INTO `t_district` VALUES ('1290', '321281', '兴化市', '321200', '1290', '1');
INSERT INTO `t_district` VALUES ('1291', '321282', '靖江市', '321200', '1291', '1');
INSERT INTO `t_district` VALUES ('1292', '321283', '泰兴市', '321200', '1292', '1');
INSERT INTO `t_district` VALUES ('1293', '321284', '姜堰市', '321200', '1293', '1');
INSERT INTO `t_district` VALUES ('1294', '321301', '市辖区', '321300', '1294', '1');
INSERT INTO `t_district` VALUES ('1295', '321302', '宿城区', '321300', '1295', '1');
INSERT INTO `t_district` VALUES ('1296', '321311', '宿豫区', '321300', '1296', '1');
INSERT INTO `t_district` VALUES ('1297', '321322', '沭阳县', '321300', '1297', '1');
INSERT INTO `t_district` VALUES ('1298', '321323', '泗阳县', '321300', '1298', '1');
INSERT INTO `t_district` VALUES ('1299', '321324', '泗洪县', '321300', '1299', '1');
INSERT INTO `t_district` VALUES ('1300', '330101', '市辖区', '330100', '1300', '1');
INSERT INTO `t_district` VALUES ('1301', '330102', '上城区', '330100', '1301', '1');
INSERT INTO `t_district` VALUES ('1302', '330103', '下城区', '330100', '1302', '1');
INSERT INTO `t_district` VALUES ('1303', '330104', '江干区', '330100', '1303', '1');
INSERT INTO `t_district` VALUES ('1304', '330105', '拱墅区', '330100', '1304', '1');
INSERT INTO `t_district` VALUES ('1305', '330106', '西湖区', '330100', '1305', '1');
INSERT INTO `t_district` VALUES ('1306', '330108', '滨江区', '330100', '1306', '1');
INSERT INTO `t_district` VALUES ('1307', '330109', '萧山区', '330100', '1307', '1');
INSERT INTO `t_district` VALUES ('1308', '330110', '余杭区', '330100', '1308', '1');
INSERT INTO `t_district` VALUES ('1309', '330122', '桐庐县', '330100', '1309', '1');
INSERT INTO `t_district` VALUES ('1310', '330127', '淳安县', '330100', '1310', '1');
INSERT INTO `t_district` VALUES ('1311', '330182', '建德市', '330100', '1311', '1');
INSERT INTO `t_district` VALUES ('1312', '330183', '富阳市', '330100', '1312', '1');
INSERT INTO `t_district` VALUES ('1313', '330185', '临安市', '330100', '1313', '1');
INSERT INTO `t_district` VALUES ('1314', '330201', '市辖区', '330200', '1314', '1');
INSERT INTO `t_district` VALUES ('1315', '330203', '海曙区', '330200', '1315', '1');
INSERT INTO `t_district` VALUES ('1316', '330204', '江东区', '330200', '1316', '1');
INSERT INTO `t_district` VALUES ('1317', '330205', '江北区', '330200', '1317', '1');
INSERT INTO `t_district` VALUES ('1318', '330206', '北仑区', '330200', '1318', '1');
INSERT INTO `t_district` VALUES ('1319', '330211', '镇海区', '330200', '1319', '1');
INSERT INTO `t_district` VALUES ('1320', '330212', '鄞州区', '330200', '1320', '1');
INSERT INTO `t_district` VALUES ('1321', '330225', '象山县', '330200', '1321', '1');
INSERT INTO `t_district` VALUES ('1322', '330226', '宁海县', '330200', '1322', '1');
INSERT INTO `t_district` VALUES ('1323', '330281', '余姚市', '330200', '1323', '1');
INSERT INTO `t_district` VALUES ('1324', '330282', '慈溪市', '330200', '1324', '1');
INSERT INTO `t_district` VALUES ('1325', '330283', '奉化市', '330200', '1325', '1');
INSERT INTO `t_district` VALUES ('1326', '330301', '市辖区', '330300', '1326', '1');
INSERT INTO `t_district` VALUES ('1327', '330302', '鹿城区', '330300', '1327', '1');
INSERT INTO `t_district` VALUES ('1328', '330303', '龙湾区', '330300', '1328', '1');
INSERT INTO `t_district` VALUES ('1329', '330304', '瓯海区', '330300', '1329', '1');
INSERT INTO `t_district` VALUES ('1330', '330322', '洞头县', '330300', '1330', '1');
INSERT INTO `t_district` VALUES ('1331', '330324', '永嘉县', '330300', '1331', '1');
INSERT INTO `t_district` VALUES ('1332', '330326', '平阳县', '330300', '1332', '1');
INSERT INTO `t_district` VALUES ('1333', '330327', '苍南县', '330300', '1333', '1');
INSERT INTO `t_district` VALUES ('1334', '330328', '文成县', '330300', '1334', '1');
INSERT INTO `t_district` VALUES ('1335', '330329', '泰顺县', '330300', '1335', '1');
INSERT INTO `t_district` VALUES ('1336', '330381', '瑞安市', '330300', '1336', '1');
INSERT INTO `t_district` VALUES ('1337', '330382', '乐清市', '330300', '1337', '1');
INSERT INTO `t_district` VALUES ('1338', '330401', '市辖区', '330400', '1338', '1');
INSERT INTO `t_district` VALUES ('1339', '330402', '秀城区', '330400', '1339', '1');
INSERT INTO `t_district` VALUES ('1340', '330411', '秀洲区', '330400', '1340', '1');
INSERT INTO `t_district` VALUES ('1341', '330421', '嘉善县', '330400', '1341', '1');
INSERT INTO `t_district` VALUES ('1342', '330424', '海盐县', '330400', '1342', '1');
INSERT INTO `t_district` VALUES ('1343', '330481', '海宁市', '330400', '1343', '1');
INSERT INTO `t_district` VALUES ('1344', '330482', '平湖市', '330400', '1344', '1');
INSERT INTO `t_district` VALUES ('1345', '330483', '桐乡市', '330400', '1345', '1');
INSERT INTO `t_district` VALUES ('1346', '330501', '市辖区', '330500', '1346', '1');
INSERT INTO `t_district` VALUES ('1347', '330502', '吴兴区', '330500', '1347', '1');
INSERT INTO `t_district` VALUES ('1348', '330503', '南浔区', '330500', '1348', '1');
INSERT INTO `t_district` VALUES ('1349', '330521', '德清县', '330500', '1349', '1');
INSERT INTO `t_district` VALUES ('1350', '330522', '长兴县', '330500', '1350', '1');
INSERT INTO `t_district` VALUES ('1351', '330523', '安吉县', '330500', '1351', '1');
INSERT INTO `t_district` VALUES ('1352', '330601', '市辖区', '330600', '1352', '1');
INSERT INTO `t_district` VALUES ('1353', '330602', '越城区', '330600', '1353', '1');
INSERT INTO `t_district` VALUES ('1354', '330621', '绍兴县', '330600', '1354', '1');
INSERT INTO `t_district` VALUES ('1355', '330624', '新昌县', '330600', '1355', '1');
INSERT INTO `t_district` VALUES ('1356', '330681', '诸暨市', '330600', '1356', '1');
INSERT INTO `t_district` VALUES ('1357', '330682', '上虞市', '330600', '1357', '1');
INSERT INTO `t_district` VALUES ('1358', '330683', '嵊州市', '330600', '1358', '1');
INSERT INTO `t_district` VALUES ('1359', '330701', '市辖区', '330700', '1359', '1');
INSERT INTO `t_district` VALUES ('1360', '330702', '婺城区', '330700', '1360', '1');
INSERT INTO `t_district` VALUES ('1361', '330703', '金东区', '330700', '1361', '1');
INSERT INTO `t_district` VALUES ('1362', '330723', '武义县', '330700', '1362', '1');
INSERT INTO `t_district` VALUES ('1363', '330726', '浦江县', '330700', '1363', '1');
INSERT INTO `t_district` VALUES ('1364', '330727', '磐安县', '330700', '1364', '1');
INSERT INTO `t_district` VALUES ('1365', '330781', '兰溪市', '330700', '1365', '1');
INSERT INTO `t_district` VALUES ('1366', '330782', '义乌市', '330700', '1366', '1');
INSERT INTO `t_district` VALUES ('1367', '330783', '东阳市', '330700', '1367', '1');
INSERT INTO `t_district` VALUES ('1368', '330784', '永康市', '330700', '1368', '1');
INSERT INTO `t_district` VALUES ('1369', '330801', '市辖区', '330800', '1369', '1');
INSERT INTO `t_district` VALUES ('1370', '330802', '柯城区', '330800', '1370', '1');
INSERT INTO `t_district` VALUES ('1371', '330803', '衢江区', '330800', '1371', '1');
INSERT INTO `t_district` VALUES ('1372', '330822', '常山县', '330800', '1372', '1');
INSERT INTO `t_district` VALUES ('1373', '330824', '开化县', '330800', '1373', '1');
INSERT INTO `t_district` VALUES ('1374', '330825', '龙游县', '330800', '1374', '1');
INSERT INTO `t_district` VALUES ('1375', '330881', '江山市', '330800', '1375', '1');
INSERT INTO `t_district` VALUES ('1376', '330901', '市辖区', '330900', '1376', '1');
INSERT INTO `t_district` VALUES ('1377', '330902', '定海区', '330900', '1377', '1');
INSERT INTO `t_district` VALUES ('1378', '330903', '普陀区', '330900', '1378', '1');
INSERT INTO `t_district` VALUES ('1379', '330921', '岱山县', '330900', '1379', '1');
INSERT INTO `t_district` VALUES ('1380', '330922', '嵊泗县', '330900', '1380', '1');
INSERT INTO `t_district` VALUES ('1381', '331001', '市辖区', '331000', '1381', '1');
INSERT INTO `t_district` VALUES ('1382', '331002', '椒江区', '331000', '1382', '1');
INSERT INTO `t_district` VALUES ('1383', '331003', '黄岩区', '331000', '1383', '1');
INSERT INTO `t_district` VALUES ('1384', '331004', '路桥区', '331000', '1384', '1');
INSERT INTO `t_district` VALUES ('1385', '331021', '玉环县', '331000', '1385', '1');
INSERT INTO `t_district` VALUES ('1386', '331022', '三门县', '331000', '1386', '1');
INSERT INTO `t_district` VALUES ('1387', '331023', '天台县', '331000', '1387', '1');
INSERT INTO `t_district` VALUES ('1388', '331024', '仙居县', '331000', '1388', '1');
INSERT INTO `t_district` VALUES ('1389', '331081', '温岭市', '331000', '1389', '1');
INSERT INTO `t_district` VALUES ('1390', '331082', '临海市', '331000', '1390', '1');
INSERT INTO `t_district` VALUES ('1391', '331101', '市辖区', '331100', '1391', '1');
INSERT INTO `t_district` VALUES ('1392', '331102', '莲都区', '331100', '1392', '1');
INSERT INTO `t_district` VALUES ('1393', '331121', '青田县', '331100', '1393', '1');
INSERT INTO `t_district` VALUES ('1394', '331122', '缙云县', '331100', '1394', '1');
INSERT INTO `t_district` VALUES ('1395', '331123', '遂昌县', '331100', '1395', '1');
INSERT INTO `t_district` VALUES ('1396', '331124', '松阳县', '331100', '1396', '1');
INSERT INTO `t_district` VALUES ('1397', '331125', '云和县', '331100', '1397', '1');
INSERT INTO `t_district` VALUES ('1398', '331126', '庆元县', '331100', '1398', '1');
INSERT INTO `t_district` VALUES ('1399', '331127', '景宁畲族自治县', '331100', '1399', '1');
INSERT INTO `t_district` VALUES ('1400', '331181', '龙泉市', '331100', '1400', '1');
INSERT INTO `t_district` VALUES ('1401', '340101', '市辖区', '340100', '1401', '1');
INSERT INTO `t_district` VALUES ('1402', '340102', '瑶海区', '340100', '1402', '1');
INSERT INTO `t_district` VALUES ('1403', '340103', '庐阳区', '340100', '1403', '1');
INSERT INTO `t_district` VALUES ('1404', '340104', '蜀山区', '340100', '1404', '1');
INSERT INTO `t_district` VALUES ('1405', '340111', '包河区', '340100', '1405', '1');
INSERT INTO `t_district` VALUES ('1406', '340121', '长丰县', '340100', '1406', '1');
INSERT INTO `t_district` VALUES ('1407', '340122', '肥东县', '340100', '1407', '1');
INSERT INTO `t_district` VALUES ('1408', '340123', '肥西县', '340100', '1408', '1');
INSERT INTO `t_district` VALUES ('1409', '340201', '市辖区', '340200', '1409', '1');
INSERT INTO `t_district` VALUES ('1410', '340202', '镜湖区', '340200', '1410', '1');
INSERT INTO `t_district` VALUES ('1411', '340203', '马塘区', '340200', '1411', '1');
INSERT INTO `t_district` VALUES ('1412', '340204', '新芜区', '340200', '1412', '1');
INSERT INTO `t_district` VALUES ('1413', '340207', '鸠江区', '340200', '1413', '1');
INSERT INTO `t_district` VALUES ('1414', '340221', '芜湖县', '340200', '1414', '1');
INSERT INTO `t_district` VALUES ('1415', '340222', '繁昌县', '340200', '1415', '1');
INSERT INTO `t_district` VALUES ('1416', '340223', '南陵县', '340200', '1416', '1');
INSERT INTO `t_district` VALUES ('1417', '340301', '市辖区', '340300', '1417', '1');
INSERT INTO `t_district` VALUES ('1418', '340302', '龙子湖区', '340300', '1418', '1');
INSERT INTO `t_district` VALUES ('1419', '340303', '蚌山区', '340300', '1419', '1');
INSERT INTO `t_district` VALUES ('1420', '340304', '禹会区', '340300', '1420', '1');
INSERT INTO `t_district` VALUES ('1421', '340311', '淮上区', '340300', '1421', '1');
INSERT INTO `t_district` VALUES ('1422', '340321', '怀远县', '340300', '1422', '1');
INSERT INTO `t_district` VALUES ('1423', '340322', '五河县', '340300', '1423', '1');
INSERT INTO `t_district` VALUES ('1424', '340323', '固镇县', '340300', '1424', '1');
INSERT INTO `t_district` VALUES ('1425', '340401', '市辖区', '340400', '1425', '1');
INSERT INTO `t_district` VALUES ('1426', '340402', '大通区', '340400', '1426', '1');
INSERT INTO `t_district` VALUES ('1427', '340403', '田家庵区', '340400', '1427', '1');
INSERT INTO `t_district` VALUES ('1428', '340404', '谢家集区', '340400', '1428', '1');
INSERT INTO `t_district` VALUES ('1429', '340405', '八公山区', '340400', '1429', '1');
INSERT INTO `t_district` VALUES ('1430', '340406', '潘集区', '340400', '1430', '1');
INSERT INTO `t_district` VALUES ('1431', '340421', '凤台县', '340400', '1431', '1');
INSERT INTO `t_district` VALUES ('1432', '340501', '市辖区', '340500', '1432', '1');
INSERT INTO `t_district` VALUES ('1433', '340502', '金家庄区', '340500', '1433', '1');
INSERT INTO `t_district` VALUES ('1434', '340503', '花山区', '340500', '1434', '1');
INSERT INTO `t_district` VALUES ('1435', '340504', '雨山区', '340500', '1435', '1');
INSERT INTO `t_district` VALUES ('1436', '340521', '当涂县', '340500', '1436', '1');
INSERT INTO `t_district` VALUES ('1437', '340601', '市辖区', '340600', '1437', '1');
INSERT INTO `t_district` VALUES ('1438', '340602', '杜集区', '340600', '1438', '1');
INSERT INTO `t_district` VALUES ('1439', '340603', '相山区', '340600', '1439', '1');
INSERT INTO `t_district` VALUES ('1440', '340604', '烈山区', '340600', '1440', '1');
INSERT INTO `t_district` VALUES ('1441', '340621', '濉溪县', '340600', '1441', '1');
INSERT INTO `t_district` VALUES ('1442', '340701', '市辖区', '340700', '1442', '1');
INSERT INTO `t_district` VALUES ('1443', '340702', '铜官山区', '340700', '1443', '1');
INSERT INTO `t_district` VALUES ('1444', '340703', '狮子山区', '340700', '1444', '1');
INSERT INTO `t_district` VALUES ('1445', '340711', '郊　区', '340700', '1445', '1');
INSERT INTO `t_district` VALUES ('1446', '340721', '铜陵县', '340700', '1446', '1');
INSERT INTO `t_district` VALUES ('1447', '340801', '市辖区', '340800', '1447', '1');
INSERT INTO `t_district` VALUES ('1448', '340802', '迎江区', '340800', '1448', '1');
INSERT INTO `t_district` VALUES ('1449', '340803', '大观区', '340800', '1449', '1');
INSERT INTO `t_district` VALUES ('1450', '340811', '郊　区', '340800', '1450', '1');
INSERT INTO `t_district` VALUES ('1451', '340822', '怀宁县', '340800', '1451', '1');
INSERT INTO `t_district` VALUES ('1452', '340823', '枞阳县', '340800', '1452', '1');
INSERT INTO `t_district` VALUES ('1453', '340824', '潜山县', '340800', '1453', '1');
INSERT INTO `t_district` VALUES ('1454', '340825', '太湖县', '340800', '1454', '1');
INSERT INTO `t_district` VALUES ('1455', '340826', '宿松县', '340800', '1455', '1');
INSERT INTO `t_district` VALUES ('1456', '340827', '望江县', '340800', '1456', '1');
INSERT INTO `t_district` VALUES ('1457', '340828', '岳西县', '340800', '1457', '1');
INSERT INTO `t_district` VALUES ('1458', '340881', '桐城市', '340800', '1458', '1');
INSERT INTO `t_district` VALUES ('1459', '341001', '市辖区', '341000', '1459', '1');
INSERT INTO `t_district` VALUES ('1460', '341002', '屯溪区', '341000', '1460', '1');
INSERT INTO `t_district` VALUES ('1461', '341003', '黄山区', '341000', '1461', '1');
INSERT INTO `t_district` VALUES ('1462', '341004', '徽州区', '341000', '1462', '1');
INSERT INTO `t_district` VALUES ('1463', '341021', '歙　县', '341000', '1463', '1');
INSERT INTO `t_district` VALUES ('1464', '341022', '休宁县', '341000', '1464', '1');
INSERT INTO `t_district` VALUES ('1465', '341023', '黟　县', '341000', '1465', '1');
INSERT INTO `t_district` VALUES ('1466', '341024', '祁门县', '341000', '1466', '1');
INSERT INTO `t_district` VALUES ('1467', '341101', '市辖区', '341100', '1467', '1');
INSERT INTO `t_district` VALUES ('1468', '341102', '琅琊区', '341100', '1468', '1');
INSERT INTO `t_district` VALUES ('1469', '341103', '南谯区', '341100', '1469', '1');
INSERT INTO `t_district` VALUES ('1470', '341122', '来安县', '341100', '1470', '1');
INSERT INTO `t_district` VALUES ('1471', '341124', '全椒县', '341100', '1471', '1');
INSERT INTO `t_district` VALUES ('1472', '341125', '定远县', '341100', '1472', '1');
INSERT INTO `t_district` VALUES ('1473', '341126', '凤阳县', '341100', '1473', '1');
INSERT INTO `t_district` VALUES ('1474', '341181', '天长市', '341100', '1474', '1');
INSERT INTO `t_district` VALUES ('1475', '341182', '明光市', '341100', '1475', '1');
INSERT INTO `t_district` VALUES ('1476', '341201', '市辖区', '341200', '1476', '1');
INSERT INTO `t_district` VALUES ('1477', '341202', '颍州区', '341200', '1477', '1');
INSERT INTO `t_district` VALUES ('1478', '341203', '颍东区', '341200', '1478', '1');
INSERT INTO `t_district` VALUES ('1479', '341204', '颍泉区', '341200', '1479', '1');
INSERT INTO `t_district` VALUES ('1480', '341221', '临泉县', '341200', '1480', '1');
INSERT INTO `t_district` VALUES ('1481', '341222', '太和县', '341200', '1481', '1');
INSERT INTO `t_district` VALUES ('1482', '341225', '阜南县', '341200', '1482', '1');
INSERT INTO `t_district` VALUES ('1483', '341226', '颍上县', '341200', '1483', '1');
INSERT INTO `t_district` VALUES ('1484', '341282', '界首市', '341200', '1484', '1');
INSERT INTO `t_district` VALUES ('1485', '341301', '市辖区', '341300', '1485', '1');
INSERT INTO `t_district` VALUES ('1486', '341302', '墉桥区', '341300', '1486', '1');
INSERT INTO `t_district` VALUES ('1487', '341321', '砀山县', '341300', '1487', '1');
INSERT INTO `t_district` VALUES ('1488', '341322', '萧　县', '341300', '1488', '1');
INSERT INTO `t_district` VALUES ('1489', '341323', '灵璧县', '341300', '1489', '1');
INSERT INTO `t_district` VALUES ('1490', '341324', '泗　县', '341300', '1490', '1');
INSERT INTO `t_district` VALUES ('1491', '341401', '市辖区', '341400', '1491', '1');
INSERT INTO `t_district` VALUES ('1492', '341402', '居巢区', '341400', '1492', '1');
INSERT INTO `t_district` VALUES ('1493', '341421', '庐江县', '341400', '1493', '1');
INSERT INTO `t_district` VALUES ('1494', '341422', '无为县', '341400', '1494', '1');
INSERT INTO `t_district` VALUES ('1495', '341423', '含山县', '341400', '1495', '1');
INSERT INTO `t_district` VALUES ('1496', '341424', '和　县', '341400', '1496', '1');
INSERT INTO `t_district` VALUES ('1497', '341501', '市辖区', '341500', '1497', '1');
INSERT INTO `t_district` VALUES ('1498', '341502', '金安区', '341500', '1498', '1');
INSERT INTO `t_district` VALUES ('1499', '341503', '裕安区', '341500', '1499', '1');
INSERT INTO `t_district` VALUES ('1500', '341521', '寿　县', '341500', '1500', '1');
INSERT INTO `t_district` VALUES ('1501', '341522', '霍邱县', '341500', '1501', '1');
INSERT INTO `t_district` VALUES ('1502', '341523', '舒城县', '341500', '1502', '1');
INSERT INTO `t_district` VALUES ('1503', '341524', '金寨县', '341500', '1503', '1');
INSERT INTO `t_district` VALUES ('1504', '341525', '霍山县', '341500', '1504', '1');
INSERT INTO `t_district` VALUES ('1505', '341601', '市辖区', '341600', '1505', '1');
INSERT INTO `t_district` VALUES ('1506', '341602', '谯城区', '341600', '1506', '1');
INSERT INTO `t_district` VALUES ('1507', '341621', '涡阳县', '341600', '1507', '1');
INSERT INTO `t_district` VALUES ('1508', '341622', '蒙城县', '341600', '1508', '1');
INSERT INTO `t_district` VALUES ('1509', '341623', '利辛县', '341600', '1509', '1');
INSERT INTO `t_district` VALUES ('1510', '341701', '市辖区', '341700', '1510', '1');
INSERT INTO `t_district` VALUES ('1511', '341702', '贵池区', '341700', '1511', '1');
INSERT INTO `t_district` VALUES ('1512', '341721', '东至县', '341700', '1512', '1');
INSERT INTO `t_district` VALUES ('1513', '341722', '石台县', '341700', '1513', '1');
INSERT INTO `t_district` VALUES ('1514', '341723', '青阳县', '341700', '1514', '1');
INSERT INTO `t_district` VALUES ('1515', '341801', '市辖区', '341800', '1515', '1');
INSERT INTO `t_district` VALUES ('1516', '341802', '宣州区', '341800', '1516', '1');
INSERT INTO `t_district` VALUES ('1517', '341821', '郎溪县', '341800', '1517', '1');
INSERT INTO `t_district` VALUES ('1518', '341822', '广德县', '341800', '1518', '1');
INSERT INTO `t_district` VALUES ('1519', '341823', '泾　县', '341800', '1519', '1');
INSERT INTO `t_district` VALUES ('1520', '341824', '绩溪县', '341800', '1520', '1');
INSERT INTO `t_district` VALUES ('1521', '341825', '旌德县', '341800', '1521', '1');
INSERT INTO `t_district` VALUES ('1522', '341881', '宁国市', '341800', '1522', '1');
INSERT INTO `t_district` VALUES ('1523', '350101', '市辖区', '350100', '1523', '1');
INSERT INTO `t_district` VALUES ('1524', '350102', '鼓楼区', '350100', '1524', '1');
INSERT INTO `t_district` VALUES ('1525', '350103', '台江区', '350100', '1525', '1');
INSERT INTO `t_district` VALUES ('1526', '350104', '仓山区', '350100', '1526', '1');
INSERT INTO `t_district` VALUES ('1527', '350105', '马尾区', '350100', '1527', '1');
INSERT INTO `t_district` VALUES ('1528', '350111', '晋安区', '350100', '1528', '1');
INSERT INTO `t_district` VALUES ('1529', '350121', '闽侯县', '350100', '1529', '1');
INSERT INTO `t_district` VALUES ('1530', '350122', '连江县', '350100', '1530', '1');
INSERT INTO `t_district` VALUES ('1531', '350123', '罗源县', '350100', '1531', '1');
INSERT INTO `t_district` VALUES ('1532', '350124', '闽清县', '350100', '1532', '1');
INSERT INTO `t_district` VALUES ('1533', '350125', '永泰县', '350100', '1533', '1');
INSERT INTO `t_district` VALUES ('1534', '350128', '平潭县', '350100', '1534', '1');
INSERT INTO `t_district` VALUES ('1535', '350181', '福清市', '350100', '1535', '1');
INSERT INTO `t_district` VALUES ('1536', '350182', '长乐市', '350100', '1536', '1');
INSERT INTO `t_district` VALUES ('1537', '350201', '市辖区', '350200', '1537', '1');
INSERT INTO `t_district` VALUES ('1538', '350203', '思明区', '350200', '1538', '1');
INSERT INTO `t_district` VALUES ('1539', '350205', '海沧区', '350200', '1539', '1');
INSERT INTO `t_district` VALUES ('1540', '350206', '湖里区', '350200', '1540', '1');
INSERT INTO `t_district` VALUES ('1541', '350211', '集美区', '350200', '1541', '1');
INSERT INTO `t_district` VALUES ('1542', '350212', '同安区', '350200', '1542', '1');
INSERT INTO `t_district` VALUES ('1543', '350213', '翔安区', '350200', '1543', '1');
INSERT INTO `t_district` VALUES ('1544', '350301', '市辖区', '350300', '1544', '1');
INSERT INTO `t_district` VALUES ('1545', '350302', '城厢区', '350300', '1545', '1');
INSERT INTO `t_district` VALUES ('1546', '350303', '涵江区', '350300', '1546', '1');
INSERT INTO `t_district` VALUES ('1547', '350304', '荔城区', '350300', '1547', '1');
INSERT INTO `t_district` VALUES ('1548', '350305', '秀屿区', '350300', '1548', '1');
INSERT INTO `t_district` VALUES ('1549', '350322', '仙游县', '350300', '1549', '1');
INSERT INTO `t_district` VALUES ('1550', '350401', '市辖区', '350400', '1550', '1');
INSERT INTO `t_district` VALUES ('1551', '350402', '梅列区', '350400', '1551', '1');
INSERT INTO `t_district` VALUES ('1552', '350403', '三元区', '350400', '1552', '1');
INSERT INTO `t_district` VALUES ('1553', '350421', '明溪县', '350400', '1553', '1');
INSERT INTO `t_district` VALUES ('1554', '350423', '清流县', '350400', '1554', '1');
INSERT INTO `t_district` VALUES ('1555', '350424', '宁化县', '350400', '1555', '1');
INSERT INTO `t_district` VALUES ('1556', '350425', '大田县', '350400', '1556', '1');
INSERT INTO `t_district` VALUES ('1557', '350426', '尤溪县', '350400', '1557', '1');
INSERT INTO `t_district` VALUES ('1558', '350427', '沙　县', '350400', '1558', '1');
INSERT INTO `t_district` VALUES ('1559', '350428', '将乐县', '350400', '1559', '1');
INSERT INTO `t_district` VALUES ('1560', '350429', '泰宁县', '350400', '1560', '1');
INSERT INTO `t_district` VALUES ('1561', '350430', '建宁县', '350400', '1561', '1');
INSERT INTO `t_district` VALUES ('1562', '350481', '永安市', '350400', '1562', '1');
INSERT INTO `t_district` VALUES ('1563', '350501', '市辖区', '350500', '1563', '1');
INSERT INTO `t_district` VALUES ('1564', '350502', '鲤城区', '350500', '1564', '1');
INSERT INTO `t_district` VALUES ('1565', '350503', '丰泽区', '350500', '1565', '1');
INSERT INTO `t_district` VALUES ('1566', '350504', '洛江区', '350500', '1566', '1');
INSERT INTO `t_district` VALUES ('1567', '350505', '泉港区', '350500', '1567', '1');
INSERT INTO `t_district` VALUES ('1568', '350521', '惠安县', '350500', '1568', '1');
INSERT INTO `t_district` VALUES ('1569', '350524', '安溪县', '350500', '1569', '1');
INSERT INTO `t_district` VALUES ('1570', '350525', '永春县', '350500', '1570', '1');
INSERT INTO `t_district` VALUES ('1571', '350526', '德化县', '350500', '1571', '1');
INSERT INTO `t_district` VALUES ('1572', '350527', '金门县', '350500', '1572', '1');
INSERT INTO `t_district` VALUES ('1573', '350581', '石狮市', '350500', '1573', '1');
INSERT INTO `t_district` VALUES ('1574', '350582', '晋江市', '350500', '1574', '1');
INSERT INTO `t_district` VALUES ('1575', '350583', '南安市', '350500', '1575', '1');
INSERT INTO `t_district` VALUES ('1576', '350601', '市辖区', '350600', '1576', '1');
INSERT INTO `t_district` VALUES ('1577', '350602', '芗城区', '350600', '1577', '1');
INSERT INTO `t_district` VALUES ('1578', '350603', '龙文区', '350600', '1578', '1');
INSERT INTO `t_district` VALUES ('1579', '350622', '云霄县', '350600', '1579', '1');
INSERT INTO `t_district` VALUES ('1580', '350623', '漳浦县', '350600', '1580', '1');
INSERT INTO `t_district` VALUES ('1581', '350624', '诏安县', '350600', '1581', '1');
INSERT INTO `t_district` VALUES ('1582', '350625', '长泰县', '350600', '1582', '1');
INSERT INTO `t_district` VALUES ('1583', '350626', '东山县', '350600', '1583', '1');
INSERT INTO `t_district` VALUES ('1584', '350627', '南靖县', '350600', '1584', '1');
INSERT INTO `t_district` VALUES ('1585', '350628', '平和县', '350600', '1585', '1');
INSERT INTO `t_district` VALUES ('1586', '350629', '华安县', '350600', '1586', '1');
INSERT INTO `t_district` VALUES ('1587', '350681', '龙海市', '350600', '1587', '1');
INSERT INTO `t_district` VALUES ('1588', '350701', '市辖区', '350700', '1588', '1');
INSERT INTO `t_district` VALUES ('1589', '350702', '延平区', '350700', '1589', '1');
INSERT INTO `t_district` VALUES ('1590', '350721', '顺昌县', '350700', '1590', '1');
INSERT INTO `t_district` VALUES ('1591', '350722', '浦城县', '350700', '1591', '1');
INSERT INTO `t_district` VALUES ('1592', '350723', '光泽县', '350700', '1592', '1');
INSERT INTO `t_district` VALUES ('1593', '350724', '松溪县', '350700', '1593', '1');
INSERT INTO `t_district` VALUES ('1594', '350725', '政和县', '350700', '1594', '1');
INSERT INTO `t_district` VALUES ('1595', '350781', '邵武市', '350700', '1595', '1');
INSERT INTO `t_district` VALUES ('1596', '350782', '武夷山市', '350700', '1596', '1');
INSERT INTO `t_district` VALUES ('1597', '350783', '建瓯市', '350700', '1597', '1');
INSERT INTO `t_district` VALUES ('1598', '350784', '建阳市', '350700', '1598', '1');
INSERT INTO `t_district` VALUES ('1599', '350801', '市辖区', '350800', '1599', '1');
INSERT INTO `t_district` VALUES ('1600', '350802', '新罗区', '350800', '1600', '1');
INSERT INTO `t_district` VALUES ('1601', '350821', '长汀县', '350800', '1601', '1');
INSERT INTO `t_district` VALUES ('1602', '350822', '永定县', '350800', '1602', '1');
INSERT INTO `t_district` VALUES ('1603', '350823', '上杭县', '350800', '1603', '1');
INSERT INTO `t_district` VALUES ('1604', '350824', '武平县', '350800', '1604', '1');
INSERT INTO `t_district` VALUES ('1605', '350825', '连城县', '350800', '1605', '1');
INSERT INTO `t_district` VALUES ('1606', '350881', '漳平市', '350800', '1606', '1');
INSERT INTO `t_district` VALUES ('1607', '350901', '市辖区', '350900', '1607', '1');
INSERT INTO `t_district` VALUES ('1608', '350902', '蕉城区', '350900', '1608', '1');
INSERT INTO `t_district` VALUES ('1609', '350921', '霞浦县', '350900', '1609', '1');
INSERT INTO `t_district` VALUES ('1610', '350922', '古田县', '350900', '1610', '1');
INSERT INTO `t_district` VALUES ('1611', '350923', '屏南县', '350900', '1611', '1');
INSERT INTO `t_district` VALUES ('1612', '350924', '寿宁县', '350900', '1612', '1');
INSERT INTO `t_district` VALUES ('1613', '350925', '周宁县', '350900', '1613', '1');
INSERT INTO `t_district` VALUES ('1614', '350926', '柘荣县', '350900', '1614', '1');
INSERT INTO `t_district` VALUES ('1615', '350981', '福安市', '350900', '1615', '1');
INSERT INTO `t_district` VALUES ('1616', '350982', '福鼎市', '350900', '1616', '1');
INSERT INTO `t_district` VALUES ('1617', '360101', '市辖区', '360100', '1617', '1');
INSERT INTO `t_district` VALUES ('1618', '360102', '东湖区', '360100', '1618', '1');
INSERT INTO `t_district` VALUES ('1619', '360103', '西湖区', '360100', '1619', '1');
INSERT INTO `t_district` VALUES ('1620', '360104', '青云谱区', '360100', '1620', '1');
INSERT INTO `t_district` VALUES ('1621', '360105', '湾里区', '360100', '1621', '1');
INSERT INTO `t_district` VALUES ('1622', '360111', '青山湖区', '360100', '1622', '1');
INSERT INTO `t_district` VALUES ('1623', '360121', '南昌县', '360100', '1623', '1');
INSERT INTO `t_district` VALUES ('1624', '360122', '新建县', '360100', '1624', '1');
INSERT INTO `t_district` VALUES ('1625', '360123', '安义县', '360100', '1625', '1');
INSERT INTO `t_district` VALUES ('1626', '360124', '进贤县', '360100', '1626', '1');
INSERT INTO `t_district` VALUES ('1627', '360201', '市辖区', '360200', '1627', '1');
INSERT INTO `t_district` VALUES ('1628', '360202', '昌江区', '360200', '1628', '1');
INSERT INTO `t_district` VALUES ('1629', '360203', '珠山区', '360200', '1629', '1');
INSERT INTO `t_district` VALUES ('1630', '360222', '浮梁县', '360200', '1630', '1');
INSERT INTO `t_district` VALUES ('1631', '360281', '乐平市', '360200', '1631', '1');
INSERT INTO `t_district` VALUES ('1632', '360301', '市辖区', '360300', '1632', '1');
INSERT INTO `t_district` VALUES ('1633', '360302', '安源区', '360300', '1633', '1');
INSERT INTO `t_district` VALUES ('1634', '360313', '湘东区', '360300', '1634', '1');
INSERT INTO `t_district` VALUES ('1635', '360321', '莲花县', '360300', '1635', '1');
INSERT INTO `t_district` VALUES ('1636', '360322', '上栗县', '360300', '1636', '1');
INSERT INTO `t_district` VALUES ('1637', '360323', '芦溪县', '360300', '1637', '1');
INSERT INTO `t_district` VALUES ('1638', '360401', '市辖区', '360400', '1638', '1');
INSERT INTO `t_district` VALUES ('1639', '360402', '庐山区', '360400', '1639', '1');
INSERT INTO `t_district` VALUES ('1640', '360403', '浔阳区', '360400', '1640', '1');
INSERT INTO `t_district` VALUES ('1641', '360421', '九江县', '360400', '1641', '1');
INSERT INTO `t_district` VALUES ('1642', '360423', '武宁县', '360400', '1642', '1');
INSERT INTO `t_district` VALUES ('1643', '360424', '修水县', '360400', '1643', '1');
INSERT INTO `t_district` VALUES ('1644', '360425', '永修县', '360400', '1644', '1');
INSERT INTO `t_district` VALUES ('1645', '360426', '德安县', '360400', '1645', '1');
INSERT INTO `t_district` VALUES ('1646', '360427', '星子县', '360400', '1646', '1');
INSERT INTO `t_district` VALUES ('1647', '360428', '都昌县', '360400', '1647', '1');
INSERT INTO `t_district` VALUES ('1648', '360429', '湖口县', '360400', '1648', '1');
INSERT INTO `t_district` VALUES ('1649', '360430', '彭泽县', '360400', '1649', '1');
INSERT INTO `t_district` VALUES ('1650', '360481', '瑞昌市', '360400', '1650', '1');
INSERT INTO `t_district` VALUES ('1651', '360501', '市辖区', '360500', '1651', '1');
INSERT INTO `t_district` VALUES ('1652', '360502', '渝水区', '360500', '1652', '1');
INSERT INTO `t_district` VALUES ('1653', '360521', '分宜县', '360500', '1653', '1');
INSERT INTO `t_district` VALUES ('1654', '360601', '市辖区', '360600', '1654', '1');
INSERT INTO `t_district` VALUES ('1655', '360602', '月湖区', '360600', '1655', '1');
INSERT INTO `t_district` VALUES ('1656', '360622', '余江县', '360600', '1656', '1');
INSERT INTO `t_district` VALUES ('1657', '360681', '贵溪市', '360600', '1657', '1');
INSERT INTO `t_district` VALUES ('1658', '360701', '市辖区', '360700', '1658', '1');
INSERT INTO `t_district` VALUES ('1659', '360702', '章贡区', '360700', '1659', '1');
INSERT INTO `t_district` VALUES ('1660', '360721', '赣　县', '360700', '1660', '1');
INSERT INTO `t_district` VALUES ('1661', '360722', '信丰县', '360700', '1661', '1');
INSERT INTO `t_district` VALUES ('1662', '360723', '大余县', '360700', '1662', '1');
INSERT INTO `t_district` VALUES ('1663', '360724', '上犹县', '360700', '1663', '1');
INSERT INTO `t_district` VALUES ('1664', '360725', '崇义县', '360700', '1664', '1');
INSERT INTO `t_district` VALUES ('1665', '360726', '安远县', '360700', '1665', '1');
INSERT INTO `t_district` VALUES ('1666', '360727', '龙南县', '360700', '1666', '1');
INSERT INTO `t_district` VALUES ('1667', '360728', '定南县', '360700', '1667', '1');
INSERT INTO `t_district` VALUES ('1668', '360729', '全南县', '360700', '1668', '1');
INSERT INTO `t_district` VALUES ('1669', '360730', '宁都县', '360700', '1669', '1');
INSERT INTO `t_district` VALUES ('1670', '360731', '于都县', '360700', '1670', '1');
INSERT INTO `t_district` VALUES ('1671', '360732', '兴国县', '360700', '1671', '1');
INSERT INTO `t_district` VALUES ('1672', '360733', '会昌县', '360700', '1672', '1');
INSERT INTO `t_district` VALUES ('1673', '360734', '寻乌县', '360700', '1673', '1');
INSERT INTO `t_district` VALUES ('1674', '360735', '石城县', '360700', '1674', '1');
INSERT INTO `t_district` VALUES ('1675', '360781', '瑞金市', '360700', '1675', '1');
INSERT INTO `t_district` VALUES ('1676', '360782', '南康市', '360700', '1676', '1');
INSERT INTO `t_district` VALUES ('1677', '360801', '市辖区', '360800', '1677', '1');
INSERT INTO `t_district` VALUES ('1678', '360802', '吉州区', '360800', '1678', '1');
INSERT INTO `t_district` VALUES ('1679', '360803', '青原区', '360800', '1679', '1');
INSERT INTO `t_district` VALUES ('1680', '360821', '吉安县', '360800', '1680', '1');
INSERT INTO `t_district` VALUES ('1681', '360822', '吉水县', '360800', '1681', '1');
INSERT INTO `t_district` VALUES ('1682', '360823', '峡江县', '360800', '1682', '1');
INSERT INTO `t_district` VALUES ('1683', '360824', '新干县', '360800', '1683', '1');
INSERT INTO `t_district` VALUES ('1684', '360825', '永丰县', '360800', '1684', '1');
INSERT INTO `t_district` VALUES ('1685', '360826', '泰和县', '360800', '1685', '1');
INSERT INTO `t_district` VALUES ('1686', '360827', '遂川县', '360800', '1686', '1');
INSERT INTO `t_district` VALUES ('1687', '360828', '万安县', '360800', '1687', '1');
INSERT INTO `t_district` VALUES ('1688', '360829', '安福县', '360800', '1688', '1');
INSERT INTO `t_district` VALUES ('1689', '360830', '永新县', '360800', '1689', '1');
INSERT INTO `t_district` VALUES ('1690', '360881', '井冈山市', '360800', '1690', '1');
INSERT INTO `t_district` VALUES ('1691', '360901', '市辖区', '360900', '1691', '1');
INSERT INTO `t_district` VALUES ('1692', '360902', '袁州区', '360900', '1692', '1');
INSERT INTO `t_district` VALUES ('1693', '360921', '奉新县', '360900', '1693', '1');
INSERT INTO `t_district` VALUES ('1694', '360922', '万载县', '360900', '1694', '1');
INSERT INTO `t_district` VALUES ('1695', '360923', '上高县', '360900', '1695', '1');
INSERT INTO `t_district` VALUES ('1696', '360924', '宜丰县', '360900', '1696', '1');
INSERT INTO `t_district` VALUES ('1697', '360925', '靖安县', '360900', '1697', '1');
INSERT INTO `t_district` VALUES ('1698', '360926', '铜鼓县', '360900', '1698', '1');
INSERT INTO `t_district` VALUES ('1699', '360981', '丰城市', '360900', '1699', '1');
INSERT INTO `t_district` VALUES ('1700', '360982', '樟树市', '360900', '1700', '1');
INSERT INTO `t_district` VALUES ('1701', '360983', '高安市', '360900', '1701', '1');
INSERT INTO `t_district` VALUES ('1702', '361001', '市辖区', '361000', '1702', '1');
INSERT INTO `t_district` VALUES ('1703', '361002', '临川区', '361000', '1703', '1');
INSERT INTO `t_district` VALUES ('1704', '361021', '南城县', '361000', '1704', '1');
INSERT INTO `t_district` VALUES ('1705', '361022', '黎川县', '361000', '1705', '1');
INSERT INTO `t_district` VALUES ('1706', '361023', '南丰县', '361000', '1706', '1');
INSERT INTO `t_district` VALUES ('1707', '361024', '崇仁县', '361000', '1707', '1');
INSERT INTO `t_district` VALUES ('1708', '361025', '乐安县', '361000', '1708', '1');
INSERT INTO `t_district` VALUES ('1709', '361026', '宜黄县', '361000', '1709', '1');
INSERT INTO `t_district` VALUES ('1710', '361027', '金溪县', '361000', '1710', '1');
INSERT INTO `t_district` VALUES ('1711', '361028', '资溪县', '361000', '1711', '1');
INSERT INTO `t_district` VALUES ('1712', '361029', '东乡县', '361000', '1712', '1');
INSERT INTO `t_district` VALUES ('1713', '361030', '广昌县', '361000', '1713', '1');
INSERT INTO `t_district` VALUES ('1714', '361101', '市辖区', '361100', '1714', '1');
INSERT INTO `t_district` VALUES ('1715', '361102', '信州区', '361100', '1715', '1');
INSERT INTO `t_district` VALUES ('1716', '361121', '上饶县', '361100', '1716', '1');
INSERT INTO `t_district` VALUES ('1717', '361122', '广丰县', '361100', '1717', '1');
INSERT INTO `t_district` VALUES ('1718', '361123', '玉山县', '361100', '1718', '1');
INSERT INTO `t_district` VALUES ('1719', '361124', '铅山县', '361100', '1719', '1');
INSERT INTO `t_district` VALUES ('1720', '361125', '横峰县', '361100', '1720', '1');
INSERT INTO `t_district` VALUES ('1721', '361126', '弋阳县', '361100', '1721', '1');
INSERT INTO `t_district` VALUES ('1722', '361127', '余干县', '361100', '1722', '1');
INSERT INTO `t_district` VALUES ('1723', '361128', '鄱阳县', '361100', '1723', '1');
INSERT INTO `t_district` VALUES ('1724', '361129', '万年县', '361100', '1724', '1');
INSERT INTO `t_district` VALUES ('1725', '361130', '婺源县', '361100', '1725', '1');
INSERT INTO `t_district` VALUES ('1726', '361181', '德兴市', '361100', '1726', '1');
INSERT INTO `t_district` VALUES ('1727', '370101', '市辖区', '370100', '1727', '1');
INSERT INTO `t_district` VALUES ('1728', '370102', '历下区', '370100', '1728', '1');
INSERT INTO `t_district` VALUES ('1729', '370103', '市中区', '370100', '1729', '1');
INSERT INTO `t_district` VALUES ('1730', '370104', '槐荫区', '370100', '1730', '1');
INSERT INTO `t_district` VALUES ('1731', '370105', '天桥区', '370100', '1731', '1');
INSERT INTO `t_district` VALUES ('1732', '370112', '历城区', '370100', '1732', '1');
INSERT INTO `t_district` VALUES ('1733', '370113', '长清区', '370100', '1733', '1');
INSERT INTO `t_district` VALUES ('1734', '370124', '平阴县', '370100', '1734', '1');
INSERT INTO `t_district` VALUES ('1735', '370125', '济阳县', '370100', '1735', '1');
INSERT INTO `t_district` VALUES ('1736', '370126', '商河县', '370100', '1736', '1');
INSERT INTO `t_district` VALUES ('1737', '370181', '章丘市', '370100', '1737', '1');
INSERT INTO `t_district` VALUES ('1738', '370201', '市辖区', '370200', '1738', '1');
INSERT INTO `t_district` VALUES ('1739', '370202', '市南区', '370200', '1739', '1');
INSERT INTO `t_district` VALUES ('1740', '370203', '市北区', '370200', '1740', '1');
INSERT INTO `t_district` VALUES ('1741', '370205', '四方区', '370200', '1741', '1');
INSERT INTO `t_district` VALUES ('1742', '370211', '黄岛区', '370200', '1742', '1');
INSERT INTO `t_district` VALUES ('1743', '370212', '崂山区', '370200', '1743', '1');
INSERT INTO `t_district` VALUES ('1744', '370213', '李沧区', '370200', '1744', '1');
INSERT INTO `t_district` VALUES ('1745', '370214', '城阳区', '370200', '1745', '1');
INSERT INTO `t_district` VALUES ('1746', '370281', '胶州市', '370200', '1746', '1');
INSERT INTO `t_district` VALUES ('1747', '370282', '即墨市', '370200', '1747', '1');
INSERT INTO `t_district` VALUES ('1748', '370283', '平度市', '370200', '1748', '1');
INSERT INTO `t_district` VALUES ('1749', '370284', '胶南市', '370200', '1749', '1');
INSERT INTO `t_district` VALUES ('1750', '370285', '莱西市', '370200', '1750', '1');
INSERT INTO `t_district` VALUES ('1751', '370301', '市辖区', '370300', '1751', '1');
INSERT INTO `t_district` VALUES ('1752', '370302', '淄川区', '370300', '1752', '1');
INSERT INTO `t_district` VALUES ('1753', '370303', '张店区', '370300', '1753', '1');
INSERT INTO `t_district` VALUES ('1754', '370304', '博山区', '370300', '1754', '1');
INSERT INTO `t_district` VALUES ('1755', '370305', '临淄区', '370300', '1755', '1');
INSERT INTO `t_district` VALUES ('1756', '370306', '周村区', '370300', '1756', '1');
INSERT INTO `t_district` VALUES ('1757', '370321', '桓台县', '370300', '1757', '1');
INSERT INTO `t_district` VALUES ('1758', '370322', '高青县', '370300', '1758', '1');
INSERT INTO `t_district` VALUES ('1759', '370323', '沂源县', '370300', '1759', '1');
INSERT INTO `t_district` VALUES ('1760', '370401', '市辖区', '370400', '1760', '1');
INSERT INTO `t_district` VALUES ('1761', '370402', '市中区', '370400', '1761', '1');
INSERT INTO `t_district` VALUES ('1762', '370403', '薛城区', '370400', '1762', '1');
INSERT INTO `t_district` VALUES ('1763', '370404', '峄城区', '370400', '1763', '1');
INSERT INTO `t_district` VALUES ('1764', '370405', '台儿庄区', '370400', '1764', '1');
INSERT INTO `t_district` VALUES ('1765', '370406', '山亭区', '370400', '1765', '1');
INSERT INTO `t_district` VALUES ('1766', '370481', '滕州市', '370400', '1766', '1');
INSERT INTO `t_district` VALUES ('1767', '370501', '市辖区', '370500', '1767', '1');
INSERT INTO `t_district` VALUES ('1768', '370502', '东营区', '370500', '1768', '1');
INSERT INTO `t_district` VALUES ('1769', '370503', '河口区', '370500', '1769', '1');
INSERT INTO `t_district` VALUES ('1770', '370521', '垦利县', '370500', '1770', '1');
INSERT INTO `t_district` VALUES ('1771', '370522', '利津县', '370500', '1771', '1');
INSERT INTO `t_district` VALUES ('1772', '370523', '广饶县', '370500', '1772', '1');
INSERT INTO `t_district` VALUES ('1773', '370601', '市辖区', '370600', '1773', '1');
INSERT INTO `t_district` VALUES ('1774', '370602', '芝罘区', '370600', '1774', '1');
INSERT INTO `t_district` VALUES ('1775', '370611', '福山区', '370600', '1775', '1');
INSERT INTO `t_district` VALUES ('1776', '370612', '牟平区', '370600', '1776', '1');
INSERT INTO `t_district` VALUES ('1777', '370613', '莱山区', '370600', '1777', '1');
INSERT INTO `t_district` VALUES ('1778', '370634', '长岛县', '370600', '1778', '1');
INSERT INTO `t_district` VALUES ('1779', '370681', '龙口市', '370600', '1779', '1');
INSERT INTO `t_district` VALUES ('1780', '370682', '莱阳市', '370600', '1780', '1');
INSERT INTO `t_district` VALUES ('1781', '370683', '莱州市', '370600', '1781', '1');
INSERT INTO `t_district` VALUES ('1782', '370684', '蓬莱市', '370600', '1782', '1');
INSERT INTO `t_district` VALUES ('1783', '370685', '招远市', '370600', '1783', '1');
INSERT INTO `t_district` VALUES ('1784', '370686', '栖霞市', '370600', '1784', '1');
INSERT INTO `t_district` VALUES ('1785', '370687', '海阳市', '370600', '1785', '1');
INSERT INTO `t_district` VALUES ('1786', '370701', '市辖区', '370700', '1786', '1');
INSERT INTO `t_district` VALUES ('1787', '370702', '潍城区', '370700', '1787', '1');
INSERT INTO `t_district` VALUES ('1788', '370703', '寒亭区', '370700', '1788', '1');
INSERT INTO `t_district` VALUES ('1789', '370704', '坊子区', '370700', '1789', '1');
INSERT INTO `t_district` VALUES ('1790', '370705', '奎文区', '370700', '1790', '1');
INSERT INTO `t_district` VALUES ('1791', '370724', '临朐县', '370700', '1791', '1');
INSERT INTO `t_district` VALUES ('1792', '370725', '昌乐县', '370700', '1792', '1');
INSERT INTO `t_district` VALUES ('1793', '370781', '青州市', '370700', '1793', '1');
INSERT INTO `t_district` VALUES ('1794', '370782', '诸城市', '370700', '1794', '1');
INSERT INTO `t_district` VALUES ('1795', '370783', '寿光市', '370700', '1795', '1');
INSERT INTO `t_district` VALUES ('1796', '370784', '安丘市', '370700', '1796', '1');
INSERT INTO `t_district` VALUES ('1797', '370785', '高密市', '370700', '1797', '1');
INSERT INTO `t_district` VALUES ('1798', '370786', '昌邑市', '370700', '1798', '1');
INSERT INTO `t_district` VALUES ('1799', '370801', '市辖区', '370800', '1799', '1');
INSERT INTO `t_district` VALUES ('1800', '370802', '市中区', '370800', '1800', '1');
INSERT INTO `t_district` VALUES ('1801', '370811', '任城区', '370800', '1801', '1');
INSERT INTO `t_district` VALUES ('1802', '370826', '微山县', '370800', '1802', '1');
INSERT INTO `t_district` VALUES ('1803', '370827', '鱼台县', '370800', '1803', '1');
INSERT INTO `t_district` VALUES ('1804', '370828', '金乡县', '370800', '1804', '1');
INSERT INTO `t_district` VALUES ('1805', '370829', '嘉祥县', '370800', '1805', '1');
INSERT INTO `t_district` VALUES ('1806', '370830', '汶上县', '370800', '1806', '1');
INSERT INTO `t_district` VALUES ('1807', '370831', '泗水县', '370800', '1807', '1');
INSERT INTO `t_district` VALUES ('1808', '370832', '梁山县', '370800', '1808', '1');
INSERT INTO `t_district` VALUES ('1809', '370881', '曲阜市', '370800', '1809', '1');
INSERT INTO `t_district` VALUES ('1810', '370882', '兖州市', '370800', '1810', '1');
INSERT INTO `t_district` VALUES ('1811', '370883', '邹城市', '370800', '1811', '1');
INSERT INTO `t_district` VALUES ('1812', '370901', '市辖区', '370900', '1812', '1');
INSERT INTO `t_district` VALUES ('1813', '370902', '泰山区', '370900', '1813', '1');
INSERT INTO `t_district` VALUES ('1814', '370903', '岱岳区', '370900', '1814', '1');
INSERT INTO `t_district` VALUES ('1815', '370921', '宁阳县', '370900', '1815', '1');
INSERT INTO `t_district` VALUES ('1816', '370923', '东平县', '370900', '1816', '1');
INSERT INTO `t_district` VALUES ('1817', '370982', '新泰市', '370900', '1817', '1');
INSERT INTO `t_district` VALUES ('1818', '370983', '肥城市', '370900', '1818', '1');
INSERT INTO `t_district` VALUES ('1819', '371001', '市辖区', '371000', '1819', '1');
INSERT INTO `t_district` VALUES ('1820', '371002', '环翠区', '371000', '1820', '1');
INSERT INTO `t_district` VALUES ('1821', '371081', '文登市', '371000', '1821', '1');
INSERT INTO `t_district` VALUES ('1822', '371082', '荣成市', '371000', '1822', '1');
INSERT INTO `t_district` VALUES ('1823', '371083', '乳山市', '371000', '1823', '1');
INSERT INTO `t_district` VALUES ('1824', '371101', '市辖区', '371100', '1824', '1');
INSERT INTO `t_district` VALUES ('1825', '371102', '东港区', '371100', '1825', '1');
INSERT INTO `t_district` VALUES ('1826', '371103', '岚山区', '371100', '1826', '1');
INSERT INTO `t_district` VALUES ('1827', '371121', '五莲县', '371100', '1827', '1');
INSERT INTO `t_district` VALUES ('1828', '371122', '莒　县', '371100', '1828', '1');
INSERT INTO `t_district` VALUES ('1829', '371201', '市辖区', '371200', '1829', '1');
INSERT INTO `t_district` VALUES ('1830', '371202', '莱城区', '371200', '1830', '1');
INSERT INTO `t_district` VALUES ('1831', '371203', '钢城区', '371200', '1831', '1');
INSERT INTO `t_district` VALUES ('1832', '371301', '市辖区', '371300', '1832', '1');
INSERT INTO `t_district` VALUES ('1833', '371302', '兰山区', '371300', '1833', '1');
INSERT INTO `t_district` VALUES ('1834', '371311', '罗庄区', '371300', '1834', '1');
INSERT INTO `t_district` VALUES ('1835', '371312', '河东区', '371300', '1835', '1');
INSERT INTO `t_district` VALUES ('1836', '371321', '沂南县', '371300', '1836', '1');
INSERT INTO `t_district` VALUES ('1837', '371322', '郯城县', '371300', '1837', '1');
INSERT INTO `t_district` VALUES ('1838', '371323', '沂水县', '371300', '1838', '1');
INSERT INTO `t_district` VALUES ('1839', '371324', '苍山县', '371300', '1839', '1');
INSERT INTO `t_district` VALUES ('1840', '371325', '费　县', '371300', '1840', '1');
INSERT INTO `t_district` VALUES ('1841', '371326', '平邑县', '371300', '1841', '1');
INSERT INTO `t_district` VALUES ('1842', '371327', '莒南县', '371300', '1842', '1');
INSERT INTO `t_district` VALUES ('1843', '371328', '蒙阴县', '371300', '1843', '1');
INSERT INTO `t_district` VALUES ('1844', '371329', '临沭县', '371300', '1844', '1');
INSERT INTO `t_district` VALUES ('1845', '371401', '市辖区', '371400', '1845', '1');
INSERT INTO `t_district` VALUES ('1846', '371402', '德城区', '371400', '1846', '1');
INSERT INTO `t_district` VALUES ('1847', '371421', '陵　县', '371400', '1847', '1');
INSERT INTO `t_district` VALUES ('1848', '371422', '宁津县', '371400', '1848', '1');
INSERT INTO `t_district` VALUES ('1849', '371423', '庆云县', '371400', '1849', '1');
INSERT INTO `t_district` VALUES ('1850', '371424', '临邑县', '371400', '1850', '1');
INSERT INTO `t_district` VALUES ('1851', '371425', '齐河县', '371400', '1851', '1');
INSERT INTO `t_district` VALUES ('1852', '371426', '平原县', '371400', '1852', '1');
INSERT INTO `t_district` VALUES ('1853', '371427', '夏津县', '371400', '1853', '1');
INSERT INTO `t_district` VALUES ('1854', '371428', '武城县', '371400', '1854', '1');
INSERT INTO `t_district` VALUES ('1855', '371481', '乐陵市', '371400', '1855', '1');
INSERT INTO `t_district` VALUES ('1856', '371482', '禹城市', '371400', '1856', '1');
INSERT INTO `t_district` VALUES ('1857', '371501', '市辖区', '371500', '1857', '1');
INSERT INTO `t_district` VALUES ('1858', '371502', '东昌府区', '371500', '1858', '1');
INSERT INTO `t_district` VALUES ('1859', '371521', '阳谷县', '371500', '1859', '1');
INSERT INTO `t_district` VALUES ('1860', '371522', '莘　县', '371500', '1860', '1');
INSERT INTO `t_district` VALUES ('1861', '371523', '茌平县', '371500', '1861', '1');
INSERT INTO `t_district` VALUES ('1862', '371524', '东阿县', '371500', '1862', '1');
INSERT INTO `t_district` VALUES ('1863', '371525', '冠　县', '371500', '1863', '1');
INSERT INTO `t_district` VALUES ('1864', '371526', '高唐县', '371500', '1864', '1');
INSERT INTO `t_district` VALUES ('1865', '371581', '临清市', '371500', '1865', '1');
INSERT INTO `t_district` VALUES ('1866', '371601', '市辖区', '371600', '1866', '1');
INSERT INTO `t_district` VALUES ('1867', '371602', '滨城区', '371600', '1867', '1');
INSERT INTO `t_district` VALUES ('1868', '371621', '惠民县', '371600', '1868', '1');
INSERT INTO `t_district` VALUES ('1869', '371622', '阳信县', '371600', '1869', '1');
INSERT INTO `t_district` VALUES ('1870', '371623', '无棣县', '371600', '1870', '1');
INSERT INTO `t_district` VALUES ('1871', '371624', '沾化县', '371600', '1871', '1');
INSERT INTO `t_district` VALUES ('1872', '371625', '博兴县', '371600', '1872', '1');
INSERT INTO `t_district` VALUES ('1873', '371626', '邹平县', '371600', '1873', '1');
INSERT INTO `t_district` VALUES ('1874', '371701', '市辖区', '371700', '1874', '1');
INSERT INTO `t_district` VALUES ('1875', '371702', '牡丹区', '371700', '1875', '1');
INSERT INTO `t_district` VALUES ('1876', '371721', '曹　县', '371700', '1876', '1');
INSERT INTO `t_district` VALUES ('1877', '371722', '单　县', '371700', '1877', '1');
INSERT INTO `t_district` VALUES ('1878', '371723', '成武县', '371700', '1878', '1');
INSERT INTO `t_district` VALUES ('1879', '371724', '巨野县', '371700', '1879', '1');
INSERT INTO `t_district` VALUES ('1880', '371725', '郓城县', '371700', '1880', '1');
INSERT INTO `t_district` VALUES ('1881', '371726', '鄄城县', '371700', '1881', '1');
INSERT INTO `t_district` VALUES ('1882', '371727', '定陶县', '371700', '1882', '1');
INSERT INTO `t_district` VALUES ('1883', '371728', '东明县', '371700', '1883', '1');
INSERT INTO `t_district` VALUES ('1884', '410101', '市辖区', '410100', '1884', '1');
INSERT INTO `t_district` VALUES ('1885', '410102', '中原区', '410100', '1885', '1');
INSERT INTO `t_district` VALUES ('1886', '410103', '二七区', '410100', '1886', '1');
INSERT INTO `t_district` VALUES ('1887', '410104', '管城回族区', '410100', '1887', '1');
INSERT INTO `t_district` VALUES ('1888', '410105', '金水区', '410100', '1888', '1');
INSERT INTO `t_district` VALUES ('1889', '410106', '上街区', '410100', '1889', '1');
INSERT INTO `t_district` VALUES ('1890', '410108', '邙山区', '410100', '1890', '1');
INSERT INTO `t_district` VALUES ('1891', '410122', '中牟县', '410100', '1891', '1');
INSERT INTO `t_district` VALUES ('1892', '410181', '巩义市', '410100', '1892', '1');
INSERT INTO `t_district` VALUES ('1893', '410182', '荥阳市', '410100', '1893', '1');
INSERT INTO `t_district` VALUES ('1894', '410183', '新密市', '410100', '1894', '1');
INSERT INTO `t_district` VALUES ('1895', '410184', '新郑市', '410100', '1895', '1');
INSERT INTO `t_district` VALUES ('1896', '410185', '登封市', '410100', '1896', '1');
INSERT INTO `t_district` VALUES ('1897', '410201', '市辖区', '410200', '1897', '1');
INSERT INTO `t_district` VALUES ('1898', '410202', '龙亭区', '410200', '1898', '1');
INSERT INTO `t_district` VALUES ('1899', '410203', '顺河回族区', '410200', '1899', '1');
INSERT INTO `t_district` VALUES ('1900', '410204', '鼓楼区', '410200', '1900', '1');
INSERT INTO `t_district` VALUES ('1901', '410205', '南关区', '410200', '1901', '1');
INSERT INTO `t_district` VALUES ('1902', '410211', '郊　区', '410200', '1902', '1');
INSERT INTO `t_district` VALUES ('1903', '410221', '杞　县', '410200', '1903', '1');
INSERT INTO `t_district` VALUES ('1904', '410222', '通许县', '410200', '1904', '1');
INSERT INTO `t_district` VALUES ('1905', '410223', '尉氏县', '410200', '1905', '1');
INSERT INTO `t_district` VALUES ('1906', '410224', '开封县', '410200', '1906', '1');
INSERT INTO `t_district` VALUES ('1907', '410225', '兰考县', '410200', '1907', '1');
INSERT INTO `t_district` VALUES ('1908', '410301', '市辖区', '410300', '1908', '1');
INSERT INTO `t_district` VALUES ('1909', '410302', '老城区', '410300', '1909', '1');
INSERT INTO `t_district` VALUES ('1910', '410303', '西工区', '410300', '1910', '1');
INSERT INTO `t_district` VALUES ('1911', '410304', '廛河回族区', '410300', '1911', '1');
INSERT INTO `t_district` VALUES ('1912', '410305', '涧西区', '410300', '1912', '1');
INSERT INTO `t_district` VALUES ('1913', '410306', '吉利区', '410300', '1913', '1');
INSERT INTO `t_district` VALUES ('1914', '410307', '洛龙区', '410300', '1914', '1');
INSERT INTO `t_district` VALUES ('1915', '410322', '孟津县', '410300', '1915', '1');
INSERT INTO `t_district` VALUES ('1916', '410323', '新安县', '410300', '1916', '1');
INSERT INTO `t_district` VALUES ('1917', '410324', '栾川县', '410300', '1917', '1');
INSERT INTO `t_district` VALUES ('1918', '410325', '嵩　县', '410300', '1918', '1');
INSERT INTO `t_district` VALUES ('1919', '410326', '汝阳县', '410300', '1919', '1');
INSERT INTO `t_district` VALUES ('1920', '410327', '宜阳县', '410300', '1920', '1');
INSERT INTO `t_district` VALUES ('1921', '410328', '洛宁县', '410300', '1921', '1');
INSERT INTO `t_district` VALUES ('1922', '410329', '伊川县', '410300', '1922', '1');
INSERT INTO `t_district` VALUES ('1923', '410381', '偃师市', '410300', '1923', '1');
INSERT INTO `t_district` VALUES ('1924', '410401', '市辖区', '410400', '1924', '1');
INSERT INTO `t_district` VALUES ('1925', '410402', '新华区', '410400', '1925', '1');
INSERT INTO `t_district` VALUES ('1926', '410403', '卫东区', '410400', '1926', '1');
INSERT INTO `t_district` VALUES ('1927', '410404', '石龙区', '410400', '1927', '1');
INSERT INTO `t_district` VALUES ('1928', '410411', '湛河区', '410400', '1928', '1');
INSERT INTO `t_district` VALUES ('1929', '410421', '宝丰县', '410400', '1929', '1');
INSERT INTO `t_district` VALUES ('1930', '410422', '叶　县', '410400', '1930', '1');
INSERT INTO `t_district` VALUES ('1931', '410423', '鲁山县', '410400', '1931', '1');
INSERT INTO `t_district` VALUES ('1932', '410425', '郏　县', '410400', '1932', '1');
INSERT INTO `t_district` VALUES ('1933', '410481', '舞钢市', '410400', '1933', '1');
INSERT INTO `t_district` VALUES ('1934', '410482', '汝州市', '410400', '1934', '1');
INSERT INTO `t_district` VALUES ('1935', '410501', '市辖区', '410500', '1935', '1');
INSERT INTO `t_district` VALUES ('1936', '410502', '文峰区', '410500', '1936', '1');
INSERT INTO `t_district` VALUES ('1937', '410503', '北关区', '410500', '1937', '1');
INSERT INTO `t_district` VALUES ('1938', '410505', '殷都区', '410500', '1938', '1');
INSERT INTO `t_district` VALUES ('1939', '410506', '龙安区', '410500', '1939', '1');
INSERT INTO `t_district` VALUES ('1940', '410522', '安阳县', '410500', '1940', '1');
INSERT INTO `t_district` VALUES ('1941', '410523', '汤阴县', '410500', '1941', '1');
INSERT INTO `t_district` VALUES ('1942', '410526', '滑　县', '410500', '1942', '1');
INSERT INTO `t_district` VALUES ('1943', '410527', '内黄县', '410500', '1943', '1');
INSERT INTO `t_district` VALUES ('1944', '410581', '林州市', '410500', '1944', '1');
INSERT INTO `t_district` VALUES ('1945', '410601', '市辖区', '410600', '1945', '1');
INSERT INTO `t_district` VALUES ('1946', '410602', '鹤山区', '410600', '1946', '1');
INSERT INTO `t_district` VALUES ('1947', '410603', '山城区', '410600', '1947', '1');
INSERT INTO `t_district` VALUES ('1948', '410611', '淇滨区', '410600', '1948', '1');
INSERT INTO `t_district` VALUES ('1949', '410621', '浚　县', '410600', '1949', '1');
INSERT INTO `t_district` VALUES ('1950', '410622', '淇　县', '410600', '1950', '1');
INSERT INTO `t_district` VALUES ('1951', '410701', '市辖区', '410700', '1951', '1');
INSERT INTO `t_district` VALUES ('1952', '410702', '红旗区', '410700', '1952', '1');
INSERT INTO `t_district` VALUES ('1953', '410703', '卫滨区', '410700', '1953', '1');
INSERT INTO `t_district` VALUES ('1954', '410704', '凤泉区', '410700', '1954', '1');
INSERT INTO `t_district` VALUES ('1955', '410711', '牧野区', '410700', '1955', '1');
INSERT INTO `t_district` VALUES ('1956', '410721', '新乡县', '410700', '1956', '1');
INSERT INTO `t_district` VALUES ('1957', '410724', '获嘉县', '410700', '1957', '1');
INSERT INTO `t_district` VALUES ('1958', '410725', '原阳县', '410700', '1958', '1');
INSERT INTO `t_district` VALUES ('1959', '410726', '延津县', '410700', '1959', '1');
INSERT INTO `t_district` VALUES ('1960', '410727', '封丘县', '410700', '1960', '1');
INSERT INTO `t_district` VALUES ('1961', '410728', '长垣县', '410700', '1961', '1');
INSERT INTO `t_district` VALUES ('1962', '410781', '卫辉市', '410700', '1962', '1');
INSERT INTO `t_district` VALUES ('1963', '410782', '辉县市', '410700', '1963', '1');
INSERT INTO `t_district` VALUES ('1964', '410801', '市辖区', '410800', '1964', '1');
INSERT INTO `t_district` VALUES ('1965', '410802', '解放区', '410800', '1965', '1');
INSERT INTO `t_district` VALUES ('1966', '410803', '中站区', '410800', '1966', '1');
INSERT INTO `t_district` VALUES ('1967', '410804', '马村区', '410800', '1967', '1');
INSERT INTO `t_district` VALUES ('1968', '410811', '山阳区', '410800', '1968', '1');
INSERT INTO `t_district` VALUES ('1969', '410821', '修武县', '410800', '1969', '1');
INSERT INTO `t_district` VALUES ('1970', '410822', '博爱县', '410800', '1970', '1');
INSERT INTO `t_district` VALUES ('1971', '410823', '武陟县', '410800', '1971', '1');
INSERT INTO `t_district` VALUES ('1972', '410825', '温　县', '410800', '1972', '1');
INSERT INTO `t_district` VALUES ('1973', '410881', '济源市', '410800', '1973', '1');
INSERT INTO `t_district` VALUES ('1974', '410882', '沁阳市', '410800', '1974', '1');
INSERT INTO `t_district` VALUES ('1975', '410883', '孟州市', '410800', '1975', '1');
INSERT INTO `t_district` VALUES ('1976', '410901', '市辖区', '410900', '1976', '1');
INSERT INTO `t_district` VALUES ('1977', '410902', '华龙区', '410900', '1977', '1');
INSERT INTO `t_district` VALUES ('1978', '410922', '清丰县', '410900', '1978', '1');
INSERT INTO `t_district` VALUES ('1979', '410923', '南乐县', '410900', '1979', '1');
INSERT INTO `t_district` VALUES ('1980', '410926', '范　县', '410900', '1980', '1');
INSERT INTO `t_district` VALUES ('1981', '410927', '台前县', '410900', '1981', '1');
INSERT INTO `t_district` VALUES ('1982', '410928', '濮阳县', '410900', '1982', '1');
INSERT INTO `t_district` VALUES ('1983', '411001', '市辖区', '411000', '1983', '1');
INSERT INTO `t_district` VALUES ('1984', '411002', '魏都区', '411000', '1984', '1');
INSERT INTO `t_district` VALUES ('1985', '411023', '许昌县', '411000', '1985', '1');
INSERT INTO `t_district` VALUES ('1986', '411024', '鄢陵县', '411000', '1986', '1');
INSERT INTO `t_district` VALUES ('1987', '411025', '襄城县', '411000', '1987', '1');
INSERT INTO `t_district` VALUES ('1988', '411081', '禹州市', '411000', '1988', '1');
INSERT INTO `t_district` VALUES ('1989', '411082', '长葛市', '411000', '1989', '1');
INSERT INTO `t_district` VALUES ('1990', '411101', '市辖区', '411100', '1990', '1');
INSERT INTO `t_district` VALUES ('1991', '411102', '源汇区', '411100', '1991', '1');
INSERT INTO `t_district` VALUES ('1992', '411103', '郾城区', '411100', '1992', '1');
INSERT INTO `t_district` VALUES ('1993', '411104', '召陵区', '411100', '1993', '1');
INSERT INTO `t_district` VALUES ('1994', '411121', '舞阳县', '411100', '1994', '1');
INSERT INTO `t_district` VALUES ('1995', '411122', '临颍县', '411100', '1995', '1');
INSERT INTO `t_district` VALUES ('1996', '411201', '市辖区', '411200', '1996', '1');
INSERT INTO `t_district` VALUES ('1997', '411202', '湖滨区', '411200', '1997', '1');
INSERT INTO `t_district` VALUES ('1998', '411221', '渑池县', '411200', '1998', '1');
INSERT INTO `t_district` VALUES ('1999', '411222', '陕　县', '411200', '1999', '1');
INSERT INTO `t_district` VALUES ('2000', '411224', '卢氏县', '411200', '2000', '1');
INSERT INTO `t_district` VALUES ('2001', '411281', '义马市', '411200', '2001', '1');
INSERT INTO `t_district` VALUES ('2002', '411282', '灵宝市', '411200', '2002', '1');
INSERT INTO `t_district` VALUES ('2003', '411301', '市辖区', '411300', '2003', '1');
INSERT INTO `t_district` VALUES ('2004', '411302', '宛城区', '411300', '2004', '1');
INSERT INTO `t_district` VALUES ('2005', '411303', '卧龙区', '411300', '2005', '1');
INSERT INTO `t_district` VALUES ('2006', '411321', '南召县', '411300', '2006', '1');
INSERT INTO `t_district` VALUES ('2007', '411322', '方城县', '411300', '2007', '1');
INSERT INTO `t_district` VALUES ('2008', '411323', '西峡县', '411300', '2008', '1');
INSERT INTO `t_district` VALUES ('2009', '411324', '镇平县', '411300', '2009', '1');
INSERT INTO `t_district` VALUES ('2010', '411325', '内乡县', '411300', '2010', '1');
INSERT INTO `t_district` VALUES ('2011', '411326', '淅川县', '411300', '2011', '1');
INSERT INTO `t_district` VALUES ('2012', '411327', '社旗县', '411300', '2012', '1');
INSERT INTO `t_district` VALUES ('2013', '411328', '唐河县', '411300', '2013', '1');
INSERT INTO `t_district` VALUES ('2014', '411329', '新野县', '411300', '2014', '1');
INSERT INTO `t_district` VALUES ('2015', '411330', '桐柏县', '411300', '2015', '1');
INSERT INTO `t_district` VALUES ('2016', '411381', '邓州市', '411300', '2016', '1');
INSERT INTO `t_district` VALUES ('2017', '411401', '市辖区', '411400', '2017', '1');
INSERT INTO `t_district` VALUES ('2018', '411402', '梁园区', '411400', '2018', '1');
INSERT INTO `t_district` VALUES ('2019', '411403', '睢阳区', '411400', '2019', '1');
INSERT INTO `t_district` VALUES ('2020', '411421', '民权县', '411400', '2020', '1');
INSERT INTO `t_district` VALUES ('2021', '411422', '睢　县', '411400', '2021', '1');
INSERT INTO `t_district` VALUES ('2022', '411423', '宁陵县', '411400', '2022', '1');
INSERT INTO `t_district` VALUES ('2023', '411424', '柘城县', '411400', '2023', '1');
INSERT INTO `t_district` VALUES ('2024', '411425', '虞城县', '411400', '2024', '1');
INSERT INTO `t_district` VALUES ('2025', '411426', '夏邑县', '411400', '2025', '1');
INSERT INTO `t_district` VALUES ('2026', '411481', '永城市', '411400', '2026', '1');
INSERT INTO `t_district` VALUES ('2027', '411501', '市辖区', '411500', '2027', '1');
INSERT INTO `t_district` VALUES ('2028', '411502', '师河区', '411500', '2028', '1');
INSERT INTO `t_district` VALUES ('2029', '411503', '平桥区', '411500', '2029', '1');
INSERT INTO `t_district` VALUES ('2030', '411521', '罗山县', '411500', '2030', '1');
INSERT INTO `t_district` VALUES ('2031', '411522', '光山县', '411500', '2031', '1');
INSERT INTO `t_district` VALUES ('2032', '411523', '新　县', '411500', '2032', '1');
INSERT INTO `t_district` VALUES ('2033', '411524', '商城县', '411500', '2033', '1');
INSERT INTO `t_district` VALUES ('2034', '411525', '固始县', '411500', '2034', '1');
INSERT INTO `t_district` VALUES ('2035', '411526', '潢川县', '411500', '2035', '1');
INSERT INTO `t_district` VALUES ('2036', '411527', '淮滨县', '411500', '2036', '1');
INSERT INTO `t_district` VALUES ('2037', '411528', '息　县', '411500', '2037', '1');
INSERT INTO `t_district` VALUES ('2038', '411601', '市辖区', '411600', '2038', '1');
INSERT INTO `t_district` VALUES ('2039', '411602', '川汇区', '411600', '2039', '1');
INSERT INTO `t_district` VALUES ('2040', '411621', '扶沟县', '411600', '2040', '1');
INSERT INTO `t_district` VALUES ('2041', '411622', '西华县', '411600', '2041', '1');
INSERT INTO `t_district` VALUES ('2042', '411623', '商水县', '411600', '2042', '1');
INSERT INTO `t_district` VALUES ('2043', '411624', '沈丘县', '411600', '2043', '1');
INSERT INTO `t_district` VALUES ('2044', '411625', '郸城县', '411600', '2044', '1');
INSERT INTO `t_district` VALUES ('2045', '411626', '淮阳县', '411600', '2045', '1');
INSERT INTO `t_district` VALUES ('2046', '411627', '太康县', '411600', '2046', '1');
INSERT INTO `t_district` VALUES ('2047', '411628', '鹿邑县', '411600', '2047', '1');
INSERT INTO `t_district` VALUES ('2048', '411681', '项城市', '411600', '2048', '1');
INSERT INTO `t_district` VALUES ('2049', '411701', '市辖区', '411700', '2049', '1');
INSERT INTO `t_district` VALUES ('2050', '411702', '驿城区', '411700', '2050', '1');
INSERT INTO `t_district` VALUES ('2051', '411721', '西平县', '411700', '2051', '1');
INSERT INTO `t_district` VALUES ('2052', '411722', '上蔡县', '411700', '2052', '1');
INSERT INTO `t_district` VALUES ('2053', '411723', '平舆县', '411700', '2053', '1');
INSERT INTO `t_district` VALUES ('2054', '411724', '正阳县', '411700', '2054', '1');
INSERT INTO `t_district` VALUES ('2055', '411725', '确山县', '411700', '2055', '1');
INSERT INTO `t_district` VALUES ('2056', '411726', '泌阳县', '411700', '2056', '1');
INSERT INTO `t_district` VALUES ('2057', '411727', '汝南县', '411700', '2057', '1');
INSERT INTO `t_district` VALUES ('2058', '411728', '遂平县', '411700', '2058', '1');
INSERT INTO `t_district` VALUES ('2059', '411729', '新蔡县', '411700', '2059', '1');
INSERT INTO `t_district` VALUES ('2060', '420101', '市辖区', '420100', '2060', '1');
INSERT INTO `t_district` VALUES ('2061', '420102', '江岸区', '420100', '2061', '1');
INSERT INTO `t_district` VALUES ('2062', '420103', '江汉区', '420100', '2062', '1');
INSERT INTO `t_district` VALUES ('2063', '420104', '乔口区', '420100', '2063', '1');
INSERT INTO `t_district` VALUES ('2064', '420105', '汉阳区', '420100', '2064', '1');
INSERT INTO `t_district` VALUES ('2065', '420106', '武昌区', '420100', '2065', '1');
INSERT INTO `t_district` VALUES ('2066', '420107', '青山区', '420100', '2066', '1');
INSERT INTO `t_district` VALUES ('2067', '420111', '洪山区', '420100', '2067', '1');
INSERT INTO `t_district` VALUES ('2068', '420112', '东西湖区', '420100', '2068', '1');
INSERT INTO `t_district` VALUES ('2069', '420113', '汉南区', '420100', '2069', '1');
INSERT INTO `t_district` VALUES ('2070', '420114', '蔡甸区', '420100', '2070', '1');
INSERT INTO `t_district` VALUES ('2071', '420115', '江夏区', '420100', '2071', '1');
INSERT INTO `t_district` VALUES ('2072', '420116', '黄陂区', '420100', '2072', '1');
INSERT INTO `t_district` VALUES ('2073', '420117', '新洲区', '420100', '2073', '1');
INSERT INTO `t_district` VALUES ('2074', '420201', '市辖区', '420200', '2074', '1');
INSERT INTO `t_district` VALUES ('2075', '420202', '黄石港区', '420200', '2075', '1');
INSERT INTO `t_district` VALUES ('2076', '420203', '西塞山区', '420200', '2076', '1');
INSERT INTO `t_district` VALUES ('2077', '420204', '下陆区', '420200', '2077', '1');
INSERT INTO `t_district` VALUES ('2078', '420205', '铁山区', '420200', '2078', '1');
INSERT INTO `t_district` VALUES ('2079', '420222', '阳新县', '420200', '2079', '1');
INSERT INTO `t_district` VALUES ('2080', '420281', '大冶市', '420200', '2080', '1');
INSERT INTO `t_district` VALUES ('2081', '420301', '市辖区', '420300', '2081', '1');
INSERT INTO `t_district` VALUES ('2082', '420302', '茅箭区', '420300', '2082', '1');
INSERT INTO `t_district` VALUES ('2083', '420303', '张湾区', '420300', '2083', '1');
INSERT INTO `t_district` VALUES ('2084', '420321', '郧　县', '420300', '2084', '1');
INSERT INTO `t_district` VALUES ('2085', '420322', '郧西县', '420300', '2085', '1');
INSERT INTO `t_district` VALUES ('2086', '420323', '竹山县', '420300', '2086', '1');
INSERT INTO `t_district` VALUES ('2087', '420324', '竹溪县', '420300', '2087', '1');
INSERT INTO `t_district` VALUES ('2088', '420325', '房　县', '420300', '2088', '1');
INSERT INTO `t_district` VALUES ('2089', '420381', '丹江口市', '420300', '2089', '1');
INSERT INTO `t_district` VALUES ('2090', '420501', '市辖区', '420500', '2090', '1');
INSERT INTO `t_district` VALUES ('2091', '420502', '西陵区', '420500', '2091', '1');
INSERT INTO `t_district` VALUES ('2092', '420503', '伍家岗区', '420500', '2092', '1');
INSERT INTO `t_district` VALUES ('2093', '420504', '点军区', '420500', '2093', '1');
INSERT INTO `t_district` VALUES ('2094', '420505', '猇亭区', '420500', '2094', '1');
INSERT INTO `t_district` VALUES ('2095', '420506', '夷陵区', '420500', '2095', '1');
INSERT INTO `t_district` VALUES ('2096', '420525', '远安县', '420500', '2096', '1');
INSERT INTO `t_district` VALUES ('2097', '420526', '兴山县', '420500', '2097', '1');
INSERT INTO `t_district` VALUES ('2098', '420527', '秭归县', '420500', '2098', '1');
INSERT INTO `t_district` VALUES ('2099', '420528', '长阳土家族自治县', '420500', '2099', '1');
INSERT INTO `t_district` VALUES ('2100', '420529', '五峰土家族自治县', '420500', '2100', '1');
INSERT INTO `t_district` VALUES ('2101', '420581', '宜都市', '420500', '2101', '1');
INSERT INTO `t_district` VALUES ('2102', '420582', '当阳市', '420500', '2102', '1');
INSERT INTO `t_district` VALUES ('2103', '420583', '枝江市', '420500', '2103', '1');
INSERT INTO `t_district` VALUES ('2104', '420601', '市辖区', '420600', '2104', '1');
INSERT INTO `t_district` VALUES ('2105', '420602', '襄城区', '420600', '2105', '1');
INSERT INTO `t_district` VALUES ('2106', '420606', '樊城区', '420600', '2106', '1');
INSERT INTO `t_district` VALUES ('2107', '420607', '襄阳区', '420600', '2107', '1');
INSERT INTO `t_district` VALUES ('2108', '420624', '南漳县', '420600', '2108', '1');
INSERT INTO `t_district` VALUES ('2109', '420625', '谷城县', '420600', '2109', '1');
INSERT INTO `t_district` VALUES ('2110', '420626', '保康县', '420600', '2110', '1');
INSERT INTO `t_district` VALUES ('2111', '420682', '老河口市', '420600', '2111', '1');
INSERT INTO `t_district` VALUES ('2112', '420683', '枣阳市', '420600', '2112', '1');
INSERT INTO `t_district` VALUES ('2113', '420684', '宜城市', '420600', '2113', '1');
INSERT INTO `t_district` VALUES ('2114', '420701', '市辖区', '420700', '2114', '1');
INSERT INTO `t_district` VALUES ('2115', '420702', '梁子湖区', '420700', '2115', '1');
INSERT INTO `t_district` VALUES ('2116', '420703', '华容区', '420700', '2116', '1');
INSERT INTO `t_district` VALUES ('2117', '420704', '鄂城区', '420700', '2117', '1');
INSERT INTO `t_district` VALUES ('2118', '420801', '市辖区', '420800', '2118', '1');
INSERT INTO `t_district` VALUES ('2119', '420802', '东宝区', '420800', '2119', '1');
INSERT INTO `t_district` VALUES ('2120', '420804', '掇刀区', '420800', '2120', '1');
INSERT INTO `t_district` VALUES ('2121', '420821', '京山县', '420800', '2121', '1');
INSERT INTO `t_district` VALUES ('2122', '420822', '沙洋县', '420800', '2122', '1');
INSERT INTO `t_district` VALUES ('2123', '420881', '钟祥市', '420800', '2123', '1');
INSERT INTO `t_district` VALUES ('2124', '420901', '市辖区', '420900', '2124', '1');
INSERT INTO `t_district` VALUES ('2125', '420902', '孝南区', '420900', '2125', '1');
INSERT INTO `t_district` VALUES ('2126', '420921', '孝昌县', '420900', '2126', '1');
INSERT INTO `t_district` VALUES ('2127', '420922', '大悟县', '420900', '2127', '1');
INSERT INTO `t_district` VALUES ('2128', '420923', '云梦县', '420900', '2128', '1');
INSERT INTO `t_district` VALUES ('2129', '420981', '应城市', '420900', '2129', '1');
INSERT INTO `t_district` VALUES ('2130', '420982', '安陆市', '420900', '2130', '1');
INSERT INTO `t_district` VALUES ('2131', '420984', '汉川市', '420900', '2131', '1');
INSERT INTO `t_district` VALUES ('2132', '421001', '市辖区', '421000', '2132', '1');
INSERT INTO `t_district` VALUES ('2133', '421002', '沙市区', '421000', '2133', '1');
INSERT INTO `t_district` VALUES ('2134', '421003', '荆州区', '421000', '2134', '1');
INSERT INTO `t_district` VALUES ('2135', '421022', '公安县', '421000', '2135', '1');
INSERT INTO `t_district` VALUES ('2136', '421023', '监利县', '421000', '2136', '1');
INSERT INTO `t_district` VALUES ('2137', '421024', '江陵县', '421000', '2137', '1');
INSERT INTO `t_district` VALUES ('2138', '421081', '石首市', '421000', '2138', '1');
INSERT INTO `t_district` VALUES ('2139', '421083', '洪湖市', '421000', '2139', '1');
INSERT INTO `t_district` VALUES ('2140', '421087', '松滋市', '421000', '2140', '1');
INSERT INTO `t_district` VALUES ('2141', '421101', '市辖区', '421100', '2141', '1');
INSERT INTO `t_district` VALUES ('2142', '421102', '黄州区', '421100', '2142', '1');
INSERT INTO `t_district` VALUES ('2143', '421121', '团风县', '421100', '2143', '1');
INSERT INTO `t_district` VALUES ('2144', '421122', '红安县', '421100', '2144', '1');
INSERT INTO `t_district` VALUES ('2145', '421123', '罗田县', '421100', '2145', '1');
INSERT INTO `t_district` VALUES ('2146', '421124', '英山县', '421100', '2146', '1');
INSERT INTO `t_district` VALUES ('2147', '421125', '浠水县', '421100', '2147', '1');
INSERT INTO `t_district` VALUES ('2148', '421126', '蕲春县', '421100', '2148', '1');
INSERT INTO `t_district` VALUES ('2149', '421127', '黄梅县', '421100', '2149', '1');
INSERT INTO `t_district` VALUES ('2150', '421181', '麻城市', '421100', '2150', '1');
INSERT INTO `t_district` VALUES ('2151', '421182', '武穴市', '421100', '2151', '1');
INSERT INTO `t_district` VALUES ('2152', '421201', '市辖区', '421200', '2152', '1');
INSERT INTO `t_district` VALUES ('2153', '421202', '咸安区', '421200', '2153', '1');
INSERT INTO `t_district` VALUES ('2154', '421221', '嘉鱼县', '421200', '2154', '1');
INSERT INTO `t_district` VALUES ('2155', '421222', '通城县', '421200', '2155', '1');
INSERT INTO `t_district` VALUES ('2156', '421223', '崇阳县', '421200', '2156', '1');
INSERT INTO `t_district` VALUES ('2157', '421224', '通山县', '421200', '2157', '1');
INSERT INTO `t_district` VALUES ('2158', '421281', '赤壁市', '421200', '2158', '1');
INSERT INTO `t_district` VALUES ('2159', '421301', '市辖区', '421300', '2159', '1');
INSERT INTO `t_district` VALUES ('2160', '421302', '曾都区', '421300', '2160', '1');
INSERT INTO `t_district` VALUES ('2161', '421381', '广水市', '421300', '2161', '1');
INSERT INTO `t_district` VALUES ('2162', '422801', '恩施市', '422800', '2162', '1');
INSERT INTO `t_district` VALUES ('2163', '422802', '利川市', '422800', '2163', '1');
INSERT INTO `t_district` VALUES ('2164', '422822', '建始县', '422800', '2164', '1');
INSERT INTO `t_district` VALUES ('2165', '422823', '巴东县', '422800', '2165', '1');
INSERT INTO `t_district` VALUES ('2166', '422825', '宣恩县', '422800', '2166', '1');
INSERT INTO `t_district` VALUES ('2167', '422826', '咸丰县', '422800', '2167', '1');
INSERT INTO `t_district` VALUES ('2168', '422827', '来凤县', '422800', '2168', '1');
INSERT INTO `t_district` VALUES ('2169', '422828', '鹤峰县', '422800', '2169', '1');
INSERT INTO `t_district` VALUES ('2170', '429004', '仙桃市', '429000', '2170', '1');
INSERT INTO `t_district` VALUES ('2171', '429005', '潜江市', '429000', '2171', '1');
INSERT INTO `t_district` VALUES ('2172', '429006', '天门市', '429000', '2172', '1');
INSERT INTO `t_district` VALUES ('2173', '429021', '神农架林区', '429000', '2173', '1');
INSERT INTO `t_district` VALUES ('2174', '430101', '市辖区', '430100', '2174', '1');
INSERT INTO `t_district` VALUES ('2175', '430102', '芙蓉区', '430100', '2175', '1');
INSERT INTO `t_district` VALUES ('2176', '430103', '天心区', '430100', '2176', '1');
INSERT INTO `t_district` VALUES ('2177', '430104', '岳麓区', '430100', '2177', '1');
INSERT INTO `t_district` VALUES ('2178', '430105', '开福区', '430100', '2178', '1');
INSERT INTO `t_district` VALUES ('2179', '430111', '雨花区', '430100', '2179', '1');
INSERT INTO `t_district` VALUES ('2180', '430121', '长沙县', '430100', '2180', '1');
INSERT INTO `t_district` VALUES ('2181', '430122', '望城县', '430100', '2181', '1');
INSERT INTO `t_district` VALUES ('2182', '430124', '宁乡县', '430100', '2182', '1');
INSERT INTO `t_district` VALUES ('2183', '430181', '浏阳市', '430100', '2183', '1');
INSERT INTO `t_district` VALUES ('2184', '430201', '市辖区', '430200', '2184', '1');
INSERT INTO `t_district` VALUES ('2185', '430202', '荷塘区', '430200', '2185', '1');
INSERT INTO `t_district` VALUES ('2186', '430203', '芦淞区', '430200', '2186', '1');
INSERT INTO `t_district` VALUES ('2187', '430204', '石峰区', '430200', '2187', '1');
INSERT INTO `t_district` VALUES ('2188', '430211', '天元区', '430200', '2188', '1');
INSERT INTO `t_district` VALUES ('2189', '430221', '株洲县', '430200', '2189', '1');
INSERT INTO `t_district` VALUES ('2190', '430223', '攸　县', '430200', '2190', '1');
INSERT INTO `t_district` VALUES ('2191', '430224', '茶陵县', '430200', '2191', '1');
INSERT INTO `t_district` VALUES ('2192', '430225', '炎陵县', '430200', '2192', '1');
INSERT INTO `t_district` VALUES ('2193', '430281', '醴陵市', '430200', '2193', '1');
INSERT INTO `t_district` VALUES ('2194', '430301', '市辖区', '430300', '2194', '1');
INSERT INTO `t_district` VALUES ('2195', '430302', '雨湖区', '430300', '2195', '1');
INSERT INTO `t_district` VALUES ('2196', '430304', '岳塘区', '430300', '2196', '1');
INSERT INTO `t_district` VALUES ('2197', '430321', '湘潭县', '430300', '2197', '1');
INSERT INTO `t_district` VALUES ('2198', '430381', '湘乡市', '430300', '2198', '1');
INSERT INTO `t_district` VALUES ('2199', '430382', '韶山市', '430300', '2199', '1');
INSERT INTO `t_district` VALUES ('2200', '430401', '市辖区', '430400', '2200', '1');
INSERT INTO `t_district` VALUES ('2201', '430405', '珠晖区', '430400', '2201', '1');
INSERT INTO `t_district` VALUES ('2202', '430406', '雁峰区', '430400', '2202', '1');
INSERT INTO `t_district` VALUES ('2203', '430407', '石鼓区', '430400', '2203', '1');
INSERT INTO `t_district` VALUES ('2204', '430408', '蒸湘区', '430400', '2204', '1');
INSERT INTO `t_district` VALUES ('2205', '430412', '南岳区', '430400', '2205', '1');
INSERT INTO `t_district` VALUES ('2206', '430421', '衡阳县', '430400', '2206', '1');
INSERT INTO `t_district` VALUES ('2207', '430422', '衡南县', '430400', '2207', '1');
INSERT INTO `t_district` VALUES ('2208', '430423', '衡山县', '430400', '2208', '1');
INSERT INTO `t_district` VALUES ('2209', '430424', '衡东县', '430400', '2209', '1');
INSERT INTO `t_district` VALUES ('2210', '430426', '祁东县', '430400', '2210', '1');
INSERT INTO `t_district` VALUES ('2211', '430481', '耒阳市', '430400', '2211', '1');
INSERT INTO `t_district` VALUES ('2212', '430482', '常宁市', '430400', '2212', '1');
INSERT INTO `t_district` VALUES ('2213', '430501', '市辖区', '430500', '2213', '1');
INSERT INTO `t_district` VALUES ('2214', '430502', '双清区', '430500', '2214', '1');
INSERT INTO `t_district` VALUES ('2215', '430503', '大祥区', '430500', '2215', '1');
INSERT INTO `t_district` VALUES ('2216', '430511', '北塔区', '430500', '2216', '1');
INSERT INTO `t_district` VALUES ('2217', '430521', '邵东县', '430500', '2217', '1');
INSERT INTO `t_district` VALUES ('2218', '430522', '新邵县', '430500', '2218', '1');
INSERT INTO `t_district` VALUES ('2219', '430523', '邵阳县', '430500', '2219', '1');
INSERT INTO `t_district` VALUES ('2220', '430524', '隆回县', '430500', '2220', '1');
INSERT INTO `t_district` VALUES ('2221', '430525', '洞口县', '430500', '2221', '1');
INSERT INTO `t_district` VALUES ('2222', '430527', '绥宁县', '430500', '2222', '1');
INSERT INTO `t_district` VALUES ('2223', '430528', '新宁县', '430500', '2223', '1');
INSERT INTO `t_district` VALUES ('2224', '430529', '城步苗族自治县', '430500', '2224', '1');
INSERT INTO `t_district` VALUES ('2225', '430581', '武冈市', '430500', '2225', '1');
INSERT INTO `t_district` VALUES ('2226', '430601', '市辖区', '430600', '2226', '1');
INSERT INTO `t_district` VALUES ('2227', '430602', '岳阳楼区', '430600', '2227', '1');
INSERT INTO `t_district` VALUES ('2228', '430603', '云溪区', '430600', '2228', '1');
INSERT INTO `t_district` VALUES ('2229', '430611', '君山区', '430600', '2229', '1');
INSERT INTO `t_district` VALUES ('2230', '430621', '岳阳县', '430600', '2230', '1');
INSERT INTO `t_district` VALUES ('2231', '430623', '华容县', '430600', '2231', '1');
INSERT INTO `t_district` VALUES ('2232', '430624', '湘阴县', '430600', '2232', '1');
INSERT INTO `t_district` VALUES ('2233', '430626', '平江县', '430600', '2233', '1');
INSERT INTO `t_district` VALUES ('2234', '430681', '汨罗市', '430600', '2234', '1');
INSERT INTO `t_district` VALUES ('2235', '430682', '临湘市', '430600', '2235', '1');
INSERT INTO `t_district` VALUES ('2236', '430701', '市辖区', '430700', '2236', '1');
INSERT INTO `t_district` VALUES ('2237', '430702', '武陵区', '430700', '2237', '1');
INSERT INTO `t_district` VALUES ('2238', '430703', '鼎城区', '430700', '2238', '1');
INSERT INTO `t_district` VALUES ('2239', '430721', '安乡县', '430700', '2239', '1');
INSERT INTO `t_district` VALUES ('2240', '430722', '汉寿县', '430700', '2240', '1');
INSERT INTO `t_district` VALUES ('2241', '430723', '澧　县', '430700', '2241', '1');
INSERT INTO `t_district` VALUES ('2242', '430724', '临澧县', '430700', '2242', '1');
INSERT INTO `t_district` VALUES ('2243', '430725', '桃源县', '430700', '2243', '1');
INSERT INTO `t_district` VALUES ('2244', '430726', '石门县', '430700', '2244', '1');
INSERT INTO `t_district` VALUES ('2245', '430781', '津市市', '430700', '2245', '1');
INSERT INTO `t_district` VALUES ('2246', '430801', '市辖区', '430800', '2246', '1');
INSERT INTO `t_district` VALUES ('2247', '430802', '永定区', '430800', '2247', '1');
INSERT INTO `t_district` VALUES ('2248', '430811', '武陵源区', '430800', '2248', '1');
INSERT INTO `t_district` VALUES ('2249', '430821', '慈利县', '430800', '2249', '1');
INSERT INTO `t_district` VALUES ('2250', '430822', '桑植县', '430800', '2250', '1');
INSERT INTO `t_district` VALUES ('2251', '430901', '市辖区', '430900', '2251', '1');
INSERT INTO `t_district` VALUES ('2252', '430902', '资阳区', '430900', '2252', '1');
INSERT INTO `t_district` VALUES ('2253', '430903', '赫山区', '430900', '2253', '1');
INSERT INTO `t_district` VALUES ('2254', '430921', '南　县', '430900', '2254', '1');
INSERT INTO `t_district` VALUES ('2255', '430922', '桃江县', '430900', '2255', '1');
INSERT INTO `t_district` VALUES ('2256', '430923', '安化县', '430900', '2256', '1');
INSERT INTO `t_district` VALUES ('2257', '430981', '沅江市', '430900', '2257', '1');
INSERT INTO `t_district` VALUES ('2258', '431001', '市辖区', '431000', '2258', '1');
INSERT INTO `t_district` VALUES ('2259', '431002', '北湖区', '431000', '2259', '1');
INSERT INTO `t_district` VALUES ('2260', '431003', '苏仙区', '431000', '2260', '1');
INSERT INTO `t_district` VALUES ('2261', '431021', '桂阳县', '431000', '2261', '1');
INSERT INTO `t_district` VALUES ('2262', '431022', '宜章县', '431000', '2262', '1');
INSERT INTO `t_district` VALUES ('2263', '431023', '永兴县', '431000', '2263', '1');
INSERT INTO `t_district` VALUES ('2264', '431024', '嘉禾县', '431000', '2264', '1');
INSERT INTO `t_district` VALUES ('2265', '431025', '临武县', '431000', '2265', '1');
INSERT INTO `t_district` VALUES ('2266', '431026', '汝城县', '431000', '2266', '1');
INSERT INTO `t_district` VALUES ('2267', '431027', '桂东县', '431000', '2267', '1');
INSERT INTO `t_district` VALUES ('2268', '431028', '安仁县', '431000', '2268', '1');
INSERT INTO `t_district` VALUES ('2269', '431081', '资兴市', '431000', '2269', '1');
INSERT INTO `t_district` VALUES ('2270', '431101', '市辖区', '431100', '2270', '1');
INSERT INTO `t_district` VALUES ('2271', '431102', '芝山区', '431100', '2271', '1');
INSERT INTO `t_district` VALUES ('2272', '431103', '冷水滩区', '431100', '2272', '1');
INSERT INTO `t_district` VALUES ('2273', '431121', '祁阳县', '431100', '2273', '1');
INSERT INTO `t_district` VALUES ('2274', '431122', '东安县', '431100', '2274', '1');
INSERT INTO `t_district` VALUES ('2275', '431123', '双牌县', '431100', '2275', '1');
INSERT INTO `t_district` VALUES ('2276', '431124', '道　县', '431100', '2276', '1');
INSERT INTO `t_district` VALUES ('2277', '431125', '江永县', '431100', '2277', '1');
INSERT INTO `t_district` VALUES ('2278', '431126', '宁远县', '431100', '2278', '1');
INSERT INTO `t_district` VALUES ('2279', '431127', '蓝山县', '431100', '2279', '1');
INSERT INTO `t_district` VALUES ('2280', '431128', '新田县', '431100', '2280', '1');
INSERT INTO `t_district` VALUES ('2281', '431129', '江华瑶族自治县', '431100', '2281', '1');
INSERT INTO `t_district` VALUES ('2282', '431201', '市辖区', '431200', '2282', '1');
INSERT INTO `t_district` VALUES ('2283', '431202', '鹤城区', '431200', '2283', '1');
INSERT INTO `t_district` VALUES ('2284', '431221', '中方县', '431200', '2284', '1');
INSERT INTO `t_district` VALUES ('2285', '431222', '沅陵县', '431200', '2285', '1');
INSERT INTO `t_district` VALUES ('2286', '431223', '辰溪县', '431200', '2286', '1');
INSERT INTO `t_district` VALUES ('2287', '431224', '溆浦县', '431200', '2287', '1');
INSERT INTO `t_district` VALUES ('2288', '431225', '会同县', '431200', '2288', '1');
INSERT INTO `t_district` VALUES ('2289', '431226', '麻阳苗族自治县', '431200', '2289', '1');
INSERT INTO `t_district` VALUES ('2290', '431227', '新晃侗族自治县', '431200', '2290', '1');
INSERT INTO `t_district` VALUES ('2291', '431228', '芷江侗族自治县', '431200', '2291', '1');
INSERT INTO `t_district` VALUES ('2292', '431229', '靖州苗族侗族自治县', '431200', '2292', '1');
INSERT INTO `t_district` VALUES ('2293', '431230', '通道侗族自治县', '431200', '2293', '1');
INSERT INTO `t_district` VALUES ('2294', '431281', '洪江市', '431200', '2294', '1');
INSERT INTO `t_district` VALUES ('2295', '431301', '市辖区', '431300', '2295', '1');
INSERT INTO `t_district` VALUES ('2296', '431302', '娄星区', '431300', '2296', '1');
INSERT INTO `t_district` VALUES ('2297', '431321', '双峰县', '431300', '2297', '1');
INSERT INTO `t_district` VALUES ('2298', '431322', '新化县', '431300', '2298', '1');
INSERT INTO `t_district` VALUES ('2299', '431381', '冷水江市', '431300', '2299', '1');
INSERT INTO `t_district` VALUES ('2300', '431382', '涟源市', '431300', '2300', '1');
INSERT INTO `t_district` VALUES ('2301', '433101', '吉首市', '433100', '2301', '1');
INSERT INTO `t_district` VALUES ('2302', '433122', '泸溪县', '433100', '2302', '1');
INSERT INTO `t_district` VALUES ('2303', '433123', '凤凰县', '433100', '2303', '1');
INSERT INTO `t_district` VALUES ('2304', '433124', '花垣县', '433100', '2304', '1');
INSERT INTO `t_district` VALUES ('2305', '433125', '保靖县', '433100', '2305', '1');
INSERT INTO `t_district` VALUES ('2306', '433126', '古丈县', '433100', '2306', '1');
INSERT INTO `t_district` VALUES ('2307', '433127', '永顺县', '433100', '2307', '1');
INSERT INTO `t_district` VALUES ('2308', '433130', '龙山县', '433100', '2308', '1');
INSERT INTO `t_district` VALUES ('2309', '440101', '市辖区', '440100', '2309', '1');
INSERT INTO `t_district` VALUES ('2310', '440102', '东山区', '440100', '2310', '1');
INSERT INTO `t_district` VALUES ('2311', '440103', '荔湾区', '440100', '2311', '1');
INSERT INTO `t_district` VALUES ('2312', '440104', '越秀区', '440100', '2312', '1');
INSERT INTO `t_district` VALUES ('2313', '440105', '海珠区', '440100', '2313', '1');
INSERT INTO `t_district` VALUES ('2314', '440106', '天河区', '440100', '2314', '1');
INSERT INTO `t_district` VALUES ('2315', '440107', '芳村区', '440100', '2315', '1');
INSERT INTO `t_district` VALUES ('2316', '440111', '白云区', '440100', '2316', '1');
INSERT INTO `t_district` VALUES ('2317', '440112', '黄埔区', '440100', '2317', '1');
INSERT INTO `t_district` VALUES ('2318', '440113', '番禺区', '440100', '2318', '1');
INSERT INTO `t_district` VALUES ('2319', '440114', '花都区', '440100', '2319', '1');
INSERT INTO `t_district` VALUES ('2320', '440183', '增城市', '440100', '2320', '1');
INSERT INTO `t_district` VALUES ('2321', '440184', '从化市', '440100', '2321', '1');
INSERT INTO `t_district` VALUES ('2322', '440201', '市辖区', '440200', '2322', '1');
INSERT INTO `t_district` VALUES ('2323', '440203', '武江区', '440200', '2323', '1');
INSERT INTO `t_district` VALUES ('2324', '440204', '浈江区', '440200', '2324', '1');
INSERT INTO `t_district` VALUES ('2325', '440205', '曲江区', '440200', '2325', '1');
INSERT INTO `t_district` VALUES ('2326', '440222', '始兴县', '440200', '2326', '1');
INSERT INTO `t_district` VALUES ('2327', '440224', '仁化县', '440200', '2327', '1');
INSERT INTO `t_district` VALUES ('2328', '440229', '翁源县', '440200', '2328', '1');
INSERT INTO `t_district` VALUES ('2329', '440232', '乳源瑶族自治县', '440200', '2329', '1');
INSERT INTO `t_district` VALUES ('2330', '440233', '新丰县', '440200', '2330', '1');
INSERT INTO `t_district` VALUES ('2331', '440281', '乐昌市', '440200', '2331', '1');
INSERT INTO `t_district` VALUES ('2332', '440282', '南雄市', '440200', '2332', '1');
INSERT INTO `t_district` VALUES ('2333', '440301', '市辖区', '440300', '2333', '1');
INSERT INTO `t_district` VALUES ('2334', '440303', '罗湖区', '440300', '2334', '1');
INSERT INTO `t_district` VALUES ('2335', '440304', '福田区', '440300', '2335', '1');
INSERT INTO `t_district` VALUES ('2336', '440305', '南山区', '440300', '2336', '1');
INSERT INTO `t_district` VALUES ('2337', '440306', '宝安区', '440300', '2337', '1');
INSERT INTO `t_district` VALUES ('2338', '440307', '龙岗区', '440300', '2338', '1');
INSERT INTO `t_district` VALUES ('2339', '440308', '盐田区', '440300', '2339', '1');
INSERT INTO `t_district` VALUES ('2340', '440401', '市辖区', '440400', '2340', '1');
INSERT INTO `t_district` VALUES ('2341', '440402', '香洲区', '440400', '2341', '1');
INSERT INTO `t_district` VALUES ('2342', '440403', '斗门区', '440400', '2342', '1');
INSERT INTO `t_district` VALUES ('2343', '440404', '金湾区', '440400', '2343', '1');
INSERT INTO `t_district` VALUES ('2344', '440501', '市辖区', '440500', '2344', '1');
INSERT INTO `t_district` VALUES ('2345', '440507', '龙湖区', '440500', '2345', '1');
INSERT INTO `t_district` VALUES ('2346', '440511', '金平区', '440500', '2346', '1');
INSERT INTO `t_district` VALUES ('2347', '440512', '濠江区', '440500', '2347', '1');
INSERT INTO `t_district` VALUES ('2348', '440513', '潮阳区', '440500', '2348', '1');
INSERT INTO `t_district` VALUES ('2349', '440514', '潮南区', '440500', '2349', '1');
INSERT INTO `t_district` VALUES ('2350', '440515', '澄海区', '440500', '2350', '1');
INSERT INTO `t_district` VALUES ('2351', '440523', '南澳县', '440500', '2351', '1');
INSERT INTO `t_district` VALUES ('2352', '440601', '市辖区', '440600', '2352', '1');
INSERT INTO `t_district` VALUES ('2353', '440604', '禅城区', '440600', '2353', '1');
INSERT INTO `t_district` VALUES ('2354', '440605', '南海区', '440600', '2354', '1');
INSERT INTO `t_district` VALUES ('2355', '440606', '顺德区', '440600', '2355', '1');
INSERT INTO `t_district` VALUES ('2356', '440607', '三水区', '440600', '2356', '1');
INSERT INTO `t_district` VALUES ('2357', '440608', '高明区', '440600', '2357', '1');
INSERT INTO `t_district` VALUES ('2358', '440701', '市辖区', '440700', '2358', '1');
INSERT INTO `t_district` VALUES ('2359', '440703', '蓬江区', '440700', '2359', '1');
INSERT INTO `t_district` VALUES ('2360', '440704', '江海区', '440700', '2360', '1');
INSERT INTO `t_district` VALUES ('2361', '440705', '新会区', '440700', '2361', '1');
INSERT INTO `t_district` VALUES ('2362', '440781', '台山市', '440700', '2362', '1');
INSERT INTO `t_district` VALUES ('2363', '440783', '开平市', '440700', '2363', '1');
INSERT INTO `t_district` VALUES ('2364', '440784', '鹤山市', '440700', '2364', '1');
INSERT INTO `t_district` VALUES ('2365', '440785', '恩平市', '440700', '2365', '1');
INSERT INTO `t_district` VALUES ('2366', '440801', '市辖区', '440800', '2366', '1');
INSERT INTO `t_district` VALUES ('2367', '440802', '赤坎区', '440800', '2367', '1');
INSERT INTO `t_district` VALUES ('2368', '440803', '霞山区', '440800', '2368', '1');
INSERT INTO `t_district` VALUES ('2369', '440804', '坡头区', '440800', '2369', '1');
INSERT INTO `t_district` VALUES ('2370', '440811', '麻章区', '440800', '2370', '1');
INSERT INTO `t_district` VALUES ('2371', '440823', '遂溪县', '440800', '2371', '1');
INSERT INTO `t_district` VALUES ('2372', '440825', '徐闻县', '440800', '2372', '1');
INSERT INTO `t_district` VALUES ('2373', '440881', '廉江市', '440800', '2373', '1');
INSERT INTO `t_district` VALUES ('2374', '440882', '雷州市', '440800', '2374', '1');
INSERT INTO `t_district` VALUES ('2375', '440883', '吴川市', '440800', '2375', '1');
INSERT INTO `t_district` VALUES ('2376', '440901', '市辖区', '440900', '2376', '1');
INSERT INTO `t_district` VALUES ('2377', '440902', '茂南区', '440900', '2377', '1');
INSERT INTO `t_district` VALUES ('2378', '440903', '茂港区', '440900', '2378', '1');
INSERT INTO `t_district` VALUES ('2379', '440923', '电白县', '440900', '2379', '1');
INSERT INTO `t_district` VALUES ('2380', '440981', '高州市', '440900', '2380', '1');
INSERT INTO `t_district` VALUES ('2381', '440982', '化州市', '440900', '2381', '1');
INSERT INTO `t_district` VALUES ('2382', '440983', '信宜市', '440900', '2382', '1');
INSERT INTO `t_district` VALUES ('2383', '441201', '市辖区', '441200', '2383', '1');
INSERT INTO `t_district` VALUES ('2384', '441202', '端州区', '441200', '2384', '1');
INSERT INTO `t_district` VALUES ('2385', '441203', '鼎湖区', '441200', '2385', '1');
INSERT INTO `t_district` VALUES ('2386', '441223', '广宁县', '441200', '2386', '1');
INSERT INTO `t_district` VALUES ('2387', '441224', '怀集县', '441200', '2387', '1');
INSERT INTO `t_district` VALUES ('2388', '441225', '封开县', '441200', '2388', '1');
INSERT INTO `t_district` VALUES ('2389', '441226', '德庆县', '441200', '2389', '1');
INSERT INTO `t_district` VALUES ('2390', '441283', '高要市', '441200', '2390', '1');
INSERT INTO `t_district` VALUES ('2391', '441284', '四会市', '441200', '2391', '1');
INSERT INTO `t_district` VALUES ('2392', '441301', '市辖区', '441300', '2392', '1');
INSERT INTO `t_district` VALUES ('2393', '441302', '惠城区', '441300', '2393', '1');
INSERT INTO `t_district` VALUES ('2394', '441303', '惠阳区', '441300', '2394', '1');
INSERT INTO `t_district` VALUES ('2395', '441322', '博罗县', '441300', '2395', '1');
INSERT INTO `t_district` VALUES ('2396', '441323', '惠东县', '441300', '2396', '1');
INSERT INTO `t_district` VALUES ('2397', '441324', '龙门县', '441300', '2397', '1');
INSERT INTO `t_district` VALUES ('2398', '441401', '市辖区', '441400', '2398', '1');
INSERT INTO `t_district` VALUES ('2399', '441402', '梅江区', '441400', '2399', '1');
INSERT INTO `t_district` VALUES ('2400', '441421', '梅　县', '441400', '2400', '1');
INSERT INTO `t_district` VALUES ('2401', '441422', '大埔县', '441400', '2401', '1');
INSERT INTO `t_district` VALUES ('2402', '441423', '丰顺县', '441400', '2402', '1');
INSERT INTO `t_district` VALUES ('2403', '441424', '五华县', '441400', '2403', '1');
INSERT INTO `t_district` VALUES ('2404', '441426', '平远县', '441400', '2404', '1');
INSERT INTO `t_district` VALUES ('2405', '441427', '蕉岭县', '441400', '2405', '1');
INSERT INTO `t_district` VALUES ('2406', '441481', '兴宁市', '441400', '2406', '1');
INSERT INTO `t_district` VALUES ('2407', '441501', '市辖区', '441500', '2407', '1');
INSERT INTO `t_district` VALUES ('2408', '441502', '城　区', '441500', '2408', '1');
INSERT INTO `t_district` VALUES ('2409', '441521', '海丰县', '441500', '2409', '1');
INSERT INTO `t_district` VALUES ('2410', '441523', '陆河县', '441500', '2410', '1');
INSERT INTO `t_district` VALUES ('2411', '441581', '陆丰市', '441500', '2411', '1');
INSERT INTO `t_district` VALUES ('2412', '441601', '市辖区', '441600', '2412', '1');
INSERT INTO `t_district` VALUES ('2413', '441602', '源城区', '441600', '2413', '1');
INSERT INTO `t_district` VALUES ('2414', '441621', '紫金县', '441600', '2414', '1');
INSERT INTO `t_district` VALUES ('2415', '441622', '龙川县', '441600', '2415', '1');
INSERT INTO `t_district` VALUES ('2416', '441623', '连平县', '441600', '2416', '1');
INSERT INTO `t_district` VALUES ('2417', '441624', '和平县', '441600', '2417', '1');
INSERT INTO `t_district` VALUES ('2418', '441625', '东源县', '441600', '2418', '1');
INSERT INTO `t_district` VALUES ('2419', '441701', '市辖区', '441700', '2419', '1');
INSERT INTO `t_district` VALUES ('2420', '441702', '江城区', '441700', '2420', '1');
INSERT INTO `t_district` VALUES ('2421', '441721', '阳西县', '441700', '2421', '1');
INSERT INTO `t_district` VALUES ('2422', '441723', '阳东县', '441700', '2422', '1');
INSERT INTO `t_district` VALUES ('2423', '441781', '阳春市', '441700', '2423', '1');
INSERT INTO `t_district` VALUES ('2424', '441801', '市辖区', '441800', '2424', '1');
INSERT INTO `t_district` VALUES ('2425', '441802', '清城区', '441800', '2425', '1');
INSERT INTO `t_district` VALUES ('2426', '441821', '佛冈县', '441800', '2426', '1');
INSERT INTO `t_district` VALUES ('2427', '441823', '阳山县', '441800', '2427', '1');
INSERT INTO `t_district` VALUES ('2428', '441825', '连山壮族瑶族自治县', '441800', '2428', '1');
INSERT INTO `t_district` VALUES ('2429', '441826', '连南瑶族自治县', '441800', '2429', '1');
INSERT INTO `t_district` VALUES ('2430', '441827', '清新县', '441800', '2430', '1');
INSERT INTO `t_district` VALUES ('2431', '441881', '英德市', '441800', '2431', '1');
INSERT INTO `t_district` VALUES ('2432', '441882', '连州市', '441800', '2432', '1');
INSERT INTO `t_district` VALUES ('2433', '445101', '市辖区', '445100', '2433', '1');
INSERT INTO `t_district` VALUES ('2434', '445102', '湘桥区', '445100', '2434', '1');
INSERT INTO `t_district` VALUES ('2435', '445121', '潮安县', '445100', '2435', '1');
INSERT INTO `t_district` VALUES ('2436', '445122', '饶平县', '445100', '2436', '1');
INSERT INTO `t_district` VALUES ('2437', '445201', '市辖区', '445200', '2437', '1');
INSERT INTO `t_district` VALUES ('2438', '445202', '榕城区', '445200', '2438', '1');
INSERT INTO `t_district` VALUES ('2439', '445221', '揭东县', '445200', '2439', '1');
INSERT INTO `t_district` VALUES ('2440', '445222', '揭西县', '445200', '2440', '1');
INSERT INTO `t_district` VALUES ('2441', '445224', '惠来县', '445200', '2441', '1');
INSERT INTO `t_district` VALUES ('2442', '445281', '普宁市', '445200', '2442', '1');
INSERT INTO `t_district` VALUES ('2443', '445301', '市辖区', '445300', '2443', '1');
INSERT INTO `t_district` VALUES ('2444', '445302', '云城区', '445300', '2444', '1');
INSERT INTO `t_district` VALUES ('2445', '445321', '新兴县', '445300', '2445', '1');
INSERT INTO `t_district` VALUES ('2446', '445322', '郁南县', '445300', '2446', '1');
INSERT INTO `t_district` VALUES ('2447', '445323', '云安县', '445300', '2447', '1');
INSERT INTO `t_district` VALUES ('2448', '445381', '罗定市', '445300', '2448', '1');
INSERT INTO `t_district` VALUES ('2449', '450101', '市辖区', '450100', '2449', '1');
INSERT INTO `t_district` VALUES ('2450', '450102', '兴宁区', '450100', '2450', '1');
INSERT INTO `t_district` VALUES ('2451', '450103', '青秀区', '450100', '2451', '1');
INSERT INTO `t_district` VALUES ('2452', '450105', '江南区', '450100', '2452', '1');
INSERT INTO `t_district` VALUES ('2453', '450107', '西乡塘区', '450100', '2453', '1');
INSERT INTO `t_district` VALUES ('2454', '450108', '良庆区', '450100', '2454', '1');
INSERT INTO `t_district` VALUES ('2455', '450109', '邕宁区', '450100', '2455', '1');
INSERT INTO `t_district` VALUES ('2456', '450122', '武鸣县', '450100', '2456', '1');
INSERT INTO `t_district` VALUES ('2457', '450123', '隆安县', '450100', '2457', '1');
INSERT INTO `t_district` VALUES ('2458', '450124', '马山县', '450100', '2458', '1');
INSERT INTO `t_district` VALUES ('2459', '450125', '上林县', '450100', '2459', '1');
INSERT INTO `t_district` VALUES ('2460', '450126', '宾阳县', '450100', '2460', '1');
INSERT INTO `t_district` VALUES ('2461', '450127', '横　县', '450100', '2461', '1');
INSERT INTO `t_district` VALUES ('2462', '450201', '市辖区', '450200', '2462', '1');
INSERT INTO `t_district` VALUES ('2463', '450202', '城中区', '450200', '2463', '1');
INSERT INTO `t_district` VALUES ('2464', '450203', '鱼峰区', '450200', '2464', '1');
INSERT INTO `t_district` VALUES ('2465', '450204', '柳南区', '450200', '2465', '1');
INSERT INTO `t_district` VALUES ('2466', '450205', '柳北区', '450200', '2466', '1');
INSERT INTO `t_district` VALUES ('2467', '450221', '柳江县', '450200', '2467', '1');
INSERT INTO `t_district` VALUES ('2468', '450222', '柳城县', '450200', '2468', '1');
INSERT INTO `t_district` VALUES ('2469', '450223', '鹿寨县', '450200', '2469', '1');
INSERT INTO `t_district` VALUES ('2470', '450224', '融安县', '450200', '2470', '1');
INSERT INTO `t_district` VALUES ('2471', '450225', '融水苗族自治县', '450200', '2471', '1');
INSERT INTO `t_district` VALUES ('2472', '450226', '三江侗族自治县', '450200', '2472', '1');
INSERT INTO `t_district` VALUES ('2473', '450301', '市辖区', '450300', '2473', '1');
INSERT INTO `t_district` VALUES ('2474', '450302', '秀峰区', '450300', '2474', '1');
INSERT INTO `t_district` VALUES ('2475', '450303', '叠彩区', '450300', '2475', '1');
INSERT INTO `t_district` VALUES ('2476', '450304', '象山区', '450300', '2476', '1');
INSERT INTO `t_district` VALUES ('2477', '450305', '七星区', '450300', '2477', '1');
INSERT INTO `t_district` VALUES ('2478', '450311', '雁山区', '450300', '2478', '1');
INSERT INTO `t_district` VALUES ('2479', '450321', '阳朔县', '450300', '2479', '1');
INSERT INTO `t_district` VALUES ('2480', '450322', '临桂县', '450300', '2480', '1');
INSERT INTO `t_district` VALUES ('2481', '450323', '灵川县', '450300', '2481', '1');
INSERT INTO `t_district` VALUES ('2482', '450324', '全州县', '450300', '2482', '1');
INSERT INTO `t_district` VALUES ('2483', '450325', '兴安县', '450300', '2483', '1');
INSERT INTO `t_district` VALUES ('2484', '450326', '永福县', '450300', '2484', '1');
INSERT INTO `t_district` VALUES ('2485', '450327', '灌阳县', '450300', '2485', '1');
INSERT INTO `t_district` VALUES ('2486', '450328', '龙胜各族自治县', '450300', '2486', '1');
INSERT INTO `t_district` VALUES ('2487', '450329', '资源县', '450300', '2487', '1');
INSERT INTO `t_district` VALUES ('2488', '450330', '平乐县', '450300', '2488', '1');
INSERT INTO `t_district` VALUES ('2489', '450331', '荔蒲县', '450300', '2489', '1');
INSERT INTO `t_district` VALUES ('2490', '450332', '恭城瑶族自治县', '450300', '2490', '1');
INSERT INTO `t_district` VALUES ('2491', '450401', '市辖区', '450400', '2491', '1');
INSERT INTO `t_district` VALUES ('2492', '450403', '万秀区', '450400', '2492', '1');
INSERT INTO `t_district` VALUES ('2493', '450404', '蝶山区', '450400', '2493', '1');
INSERT INTO `t_district` VALUES ('2494', '450405', '长洲区', '450400', '2494', '1');
INSERT INTO `t_district` VALUES ('2495', '450421', '苍梧县', '450400', '2495', '1');
INSERT INTO `t_district` VALUES ('2496', '450422', '藤　县', '450400', '2496', '1');
INSERT INTO `t_district` VALUES ('2497', '450423', '蒙山县', '450400', '2497', '1');
INSERT INTO `t_district` VALUES ('2498', '450481', '岑溪市', '450400', '2498', '1');
INSERT INTO `t_district` VALUES ('2499', '450501', '市辖区', '450500', '2499', '1');
INSERT INTO `t_district` VALUES ('2500', '450502', '海城区', '450500', '2500', '1');
INSERT INTO `t_district` VALUES ('2501', '450503', '银海区', '450500', '2501', '1');
INSERT INTO `t_district` VALUES ('2502', '450512', '铁山港区', '450500', '2502', '1');
INSERT INTO `t_district` VALUES ('2503', '450521', '合浦县', '450500', '2503', '1');
INSERT INTO `t_district` VALUES ('2504', '450601', '市辖区', '450600', '2504', '1');
INSERT INTO `t_district` VALUES ('2505', '450602', '港口区', '450600', '2505', '1');
INSERT INTO `t_district` VALUES ('2506', '450603', '防城区', '450600', '2506', '1');
INSERT INTO `t_district` VALUES ('2507', '450621', '上思县', '450600', '2507', '1');
INSERT INTO `t_district` VALUES ('2508', '450681', '东兴市', '450600', '2508', '1');
INSERT INTO `t_district` VALUES ('2509', '450701', '市辖区', '450700', '2509', '1');
INSERT INTO `t_district` VALUES ('2510', '450702', '钦南区', '450700', '2510', '1');
INSERT INTO `t_district` VALUES ('2511', '450703', '钦北区', '450700', '2511', '1');
INSERT INTO `t_district` VALUES ('2512', '450721', '灵山县', '450700', '2512', '1');
INSERT INTO `t_district` VALUES ('2513', '450722', '浦北县', '450700', '2513', '1');
INSERT INTO `t_district` VALUES ('2514', '450801', '市辖区', '450800', '2514', '1');
INSERT INTO `t_district` VALUES ('2515', '450802', '港北区', '450800', '2515', '1');
INSERT INTO `t_district` VALUES ('2516', '450803', '港南区', '450800', '2516', '1');
INSERT INTO `t_district` VALUES ('2517', '450804', '覃塘区', '450800', '2517', '1');
INSERT INTO `t_district` VALUES ('2518', '450821', '平南县', '450800', '2518', '1');
INSERT INTO `t_district` VALUES ('2519', '450881', '桂平市', '450800', '2519', '1');
INSERT INTO `t_district` VALUES ('2520', '450901', '市辖区', '450900', '2520', '1');
INSERT INTO `t_district` VALUES ('2521', '450902', '玉州区', '450900', '2521', '1');
INSERT INTO `t_district` VALUES ('2522', '450921', '容　县', '450900', '2522', '1');
INSERT INTO `t_district` VALUES ('2523', '450922', '陆川县', '450900', '2523', '1');
INSERT INTO `t_district` VALUES ('2524', '450923', '博白县', '450900', '2524', '1');
INSERT INTO `t_district` VALUES ('2525', '450924', '兴业县', '450900', '2525', '1');
INSERT INTO `t_district` VALUES ('2526', '450981', '北流市', '450900', '2526', '1');
INSERT INTO `t_district` VALUES ('2527', '451001', '市辖区', '451000', '2527', '1');
INSERT INTO `t_district` VALUES ('2528', '451002', '右江区', '451000', '2528', '1');
INSERT INTO `t_district` VALUES ('2529', '451021', '田阳县', '451000', '2529', '1');
INSERT INTO `t_district` VALUES ('2530', '451022', '田东县', '451000', '2530', '1');
INSERT INTO `t_district` VALUES ('2531', '451023', '平果县', '451000', '2531', '1');
INSERT INTO `t_district` VALUES ('2532', '451024', '德保县', '451000', '2532', '1');
INSERT INTO `t_district` VALUES ('2533', '451025', '靖西县', '451000', '2533', '1');
INSERT INTO `t_district` VALUES ('2534', '451026', '那坡县', '451000', '2534', '1');
INSERT INTO `t_district` VALUES ('2535', '451027', '凌云县', '451000', '2535', '1');
INSERT INTO `t_district` VALUES ('2536', '451028', '乐业县', '451000', '2536', '1');
INSERT INTO `t_district` VALUES ('2537', '451029', '田林县', '451000', '2537', '1');
INSERT INTO `t_district` VALUES ('2538', '451030', '西林县', '451000', '2538', '1');
INSERT INTO `t_district` VALUES ('2539', '451031', '隆林各族自治县', '451000', '2539', '1');
INSERT INTO `t_district` VALUES ('2540', '451101', '市辖区', '451100', '2540', '1');
INSERT INTO `t_district` VALUES ('2541', '451102', '八步区', '451100', '2541', '1');
INSERT INTO `t_district` VALUES ('2542', '451121', '昭平县', '451100', '2542', '1');
INSERT INTO `t_district` VALUES ('2543', '451122', '钟山县', '451100', '2543', '1');
INSERT INTO `t_district` VALUES ('2544', '451123', '富川瑶族自治县', '451100', '2544', '1');
INSERT INTO `t_district` VALUES ('2545', '451201', '市辖区', '451200', '2545', '1');
INSERT INTO `t_district` VALUES ('2546', '451202', '金城江区', '451200', '2546', '1');
INSERT INTO `t_district` VALUES ('2547', '451221', '南丹县', '451200', '2547', '1');
INSERT INTO `t_district` VALUES ('2548', '451222', '天峨县', '451200', '2548', '1');
INSERT INTO `t_district` VALUES ('2549', '451223', '凤山县', '451200', '2549', '1');
INSERT INTO `t_district` VALUES ('2550', '451224', '东兰县', '451200', '2550', '1');
INSERT INTO `t_district` VALUES ('2551', '451225', '罗城仫佬族自治县', '451200', '2551', '1');
INSERT INTO `t_district` VALUES ('2552', '451226', '环江毛南族自治县', '451200', '2552', '1');
INSERT INTO `t_district` VALUES ('2553', '451227', '巴马瑶族自治县', '451200', '2553', '1');
INSERT INTO `t_district` VALUES ('2554', '451228', '都安瑶族自治县', '451200', '2554', '1');
INSERT INTO `t_district` VALUES ('2555', '451229', '大化瑶族自治县', '451200', '2555', '1');
INSERT INTO `t_district` VALUES ('2556', '451281', '宜州市', '451200', '2556', '1');
INSERT INTO `t_district` VALUES ('2557', '451301', '市辖区', '451300', '2557', '1');
INSERT INTO `t_district` VALUES ('2558', '451302', '兴宾区', '451300', '2558', '1');
INSERT INTO `t_district` VALUES ('2559', '451321', '忻城县', '451300', '2559', '1');
INSERT INTO `t_district` VALUES ('2560', '451322', '象州县', '451300', '2560', '1');
INSERT INTO `t_district` VALUES ('2561', '451323', '武宣县', '451300', '2561', '1');
INSERT INTO `t_district` VALUES ('2562', '451324', '金秀瑶族自治县', '451300', '2562', '1');
INSERT INTO `t_district` VALUES ('2563', '451381', '合山市', '451300', '2563', '1');
INSERT INTO `t_district` VALUES ('2564', '451401', '市辖区', '451400', '2564', '1');
INSERT INTO `t_district` VALUES ('2565', '451402', '江洲区', '451400', '2565', '1');
INSERT INTO `t_district` VALUES ('2566', '451421', '扶绥县', '451400', '2566', '1');
INSERT INTO `t_district` VALUES ('2567', '451422', '宁明县', '451400', '2567', '1');
INSERT INTO `t_district` VALUES ('2568', '451423', '龙州县', '451400', '2568', '1');
INSERT INTO `t_district` VALUES ('2569', '451424', '大新县', '451400', '2569', '1');
INSERT INTO `t_district` VALUES ('2570', '451425', '天等县', '451400', '2570', '1');
INSERT INTO `t_district` VALUES ('2571', '451481', '凭祥市', '451400', '2571', '1');
INSERT INTO `t_district` VALUES ('2572', '460101', '市辖区', '460100', '2572', '1');
INSERT INTO `t_district` VALUES ('2573', '460105', '秀英区', '460100', '2573', '1');
INSERT INTO `t_district` VALUES ('2574', '460106', '龙华区', '460100', '2574', '1');
INSERT INTO `t_district` VALUES ('2575', '460107', '琼山区', '460100', '2575', '1');
INSERT INTO `t_district` VALUES ('2576', '460108', '美兰区', '460100', '2576', '1');
INSERT INTO `t_district` VALUES ('2577', '460201', '市辖区', '460200', '2577', '1');
INSERT INTO `t_district` VALUES ('2578', '469001', '五指山市', '469000', '2578', '1');
INSERT INTO `t_district` VALUES ('2579', '469002', '琼海市', '469000', '2579', '1');
INSERT INTO `t_district` VALUES ('2580', '469003', '儋州市', '469000', '2580', '1');
INSERT INTO `t_district` VALUES ('2581', '469005', '文昌市', '469000', '2581', '1');
INSERT INTO `t_district` VALUES ('2582', '469006', '万宁市', '469000', '2582', '1');
INSERT INTO `t_district` VALUES ('2583', '469007', '东方市', '469000', '2583', '1');
INSERT INTO `t_district` VALUES ('2584', '469025', '定安县', '469000', '2584', '1');
INSERT INTO `t_district` VALUES ('2585', '469026', '屯昌县', '469000', '2585', '1');
INSERT INTO `t_district` VALUES ('2586', '469027', '澄迈县', '469000', '2586', '1');
INSERT INTO `t_district` VALUES ('2587', '469028', '临高县', '469000', '2587', '1');
INSERT INTO `t_district` VALUES ('2588', '469030', '白沙黎族自治县', '469000', '2588', '1');
INSERT INTO `t_district` VALUES ('2589', '469031', '昌江黎族自治县', '469000', '2589', '1');
INSERT INTO `t_district` VALUES ('2590', '469033', '乐东黎族自治县', '469000', '2590', '1');
INSERT INTO `t_district` VALUES ('2591', '469034', '陵水黎族自治县', '469000', '2591', '1');
INSERT INTO `t_district` VALUES ('2592', '469035', '保亭黎族苗族自治县', '469000', '2592', '1');
INSERT INTO `t_district` VALUES ('2593', '469036', '琼中黎族苗族自治县', '469000', '2593', '1');
INSERT INTO `t_district` VALUES ('2594', '469037', '西沙群岛', '469000', '2594', '1');
INSERT INTO `t_district` VALUES ('2595', '469038', '南沙群岛', '469000', '2595', '1');
INSERT INTO `t_district` VALUES ('2596', '469039', '中沙群岛的岛礁及其海域', '469000', '2596', '1');
INSERT INTO `t_district` VALUES ('2597', '500101', '万州区', '500100', '2597', '1');
INSERT INTO `t_district` VALUES ('2598', '500102', '涪陵区', '500100', '2598', '1');
INSERT INTO `t_district` VALUES ('2599', '500103', '渝中区', '500100', '2599', '1');
INSERT INTO `t_district` VALUES ('2600', '500104', '大渡口区', '500100', '2600', '1');
INSERT INTO `t_district` VALUES ('2601', '500105', '江北区', '500100', '2601', '1');
INSERT INTO `t_district` VALUES ('2602', '500106', '沙坪坝区', '500100', '2602', '1');
INSERT INTO `t_district` VALUES ('2603', '500107', '九龙坡区', '500100', '2603', '1');
INSERT INTO `t_district` VALUES ('2604', '500108', '南岸区', '500100', '2604', '1');
INSERT INTO `t_district` VALUES ('2605', '500109', '北碚区', '500100', '2605', '1');
INSERT INTO `t_district` VALUES ('2606', '500110', '万盛区', '500100', '2606', '1');
INSERT INTO `t_district` VALUES ('2607', '500111', '双桥区', '500100', '2607', '1');
INSERT INTO `t_district` VALUES ('2608', '500112', '渝北区', '500100', '2608', '1');
INSERT INTO `t_district` VALUES ('2609', '500113', '巴南区', '500100', '2609', '1');
INSERT INTO `t_district` VALUES ('2610', '500114', '黔江区', '500100', '2610', '1');
INSERT INTO `t_district` VALUES ('2611', '500115', '长寿区', '500100', '2611', '1');
INSERT INTO `t_district` VALUES ('2612', '500222', '綦江县', '500200', '2612', '1');
INSERT INTO `t_district` VALUES ('2613', '500223', '潼南县', '500200', '2613', '1');
INSERT INTO `t_district` VALUES ('2614', '500224', '铜梁县', '500200', '2614', '1');
INSERT INTO `t_district` VALUES ('2615', '500225', '大足县', '500200', '2615', '1');
INSERT INTO `t_district` VALUES ('2616', '500226', '荣昌县', '500200', '2616', '1');
INSERT INTO `t_district` VALUES ('2617', '500227', '璧山县', '500200', '2617', '1');
INSERT INTO `t_district` VALUES ('2618', '500228', '梁平县', '500200', '2618', '1');
INSERT INTO `t_district` VALUES ('2619', '500229', '城口县', '500200', '2619', '1');
INSERT INTO `t_district` VALUES ('2620', '500230', '丰都县', '500200', '2620', '1');
INSERT INTO `t_district` VALUES ('2621', '500231', '垫江县', '500200', '2621', '1');
INSERT INTO `t_district` VALUES ('2622', '500232', '武隆县', '500200', '2622', '1');
INSERT INTO `t_district` VALUES ('2623', '500233', '忠　县', '500200', '2623', '1');
INSERT INTO `t_district` VALUES ('2624', '500234', '开　县', '500200', '2624', '1');
INSERT INTO `t_district` VALUES ('2625', '500235', '云阳县', '500200', '2625', '1');
INSERT INTO `t_district` VALUES ('2626', '500236', '奉节县', '500200', '2626', '1');
INSERT INTO `t_district` VALUES ('2627', '500237', '巫山县', '500200', '2627', '1');
INSERT INTO `t_district` VALUES ('2628', '500238', '巫溪县', '500200', '2628', '1');
INSERT INTO `t_district` VALUES ('2629', '500240', '石柱土家族自治县', '500200', '2629', '1');
INSERT INTO `t_district` VALUES ('2630', '500241', '秀山土家族苗族自治县', '500200', '2630', '1');
INSERT INTO `t_district` VALUES ('2631', '500242', '酉阳土家族苗族自治县', '500200', '2631', '1');
INSERT INTO `t_district` VALUES ('2632', '500243', '彭水苗族土家族自治县', '500200', '2632', '1');
INSERT INTO `t_district` VALUES ('2633', '500381', '江津市', '500300', '2633', '1');
INSERT INTO `t_district` VALUES ('2634', '500382', '合川市', '500300', '2634', '1');
INSERT INTO `t_district` VALUES ('2635', '500383', '永川市', '500300', '2635', '1');
INSERT INTO `t_district` VALUES ('2636', '500384', '南川市', '500300', '2636', '1');
INSERT INTO `t_district` VALUES ('2637', '510101', '市辖区', '510100', '2637', '1');
INSERT INTO `t_district` VALUES ('2638', '510104', '锦江区', '510100', '2638', '1');
INSERT INTO `t_district` VALUES ('2639', '510105', '青羊区', '510100', '2639', '1');
INSERT INTO `t_district` VALUES ('2640', '510106', '金牛区', '510100', '2640', '1');
INSERT INTO `t_district` VALUES ('2641', '510107', '武侯区', '510100', '2641', '1');
INSERT INTO `t_district` VALUES ('2642', '510108', '成华区', '510100', '2642', '1');
INSERT INTO `t_district` VALUES ('2643', '510112', '龙泉驿区', '510100', '2643', '1');
INSERT INTO `t_district` VALUES ('2644', '510113', '青白江区', '510100', '2644', '1');
INSERT INTO `t_district` VALUES ('2645', '510114', '新都区', '510100', '2645', '1');
INSERT INTO `t_district` VALUES ('2646', '510115', '温江区', '510100', '2646', '1');
INSERT INTO `t_district` VALUES ('2647', '510121', '金堂县', '510100', '2647', '1');
INSERT INTO `t_district` VALUES ('2648', '510122', '双流县', '510100', '2648', '1');
INSERT INTO `t_district` VALUES ('2649', '510124', '郫　县', '510100', '2649', '1');
INSERT INTO `t_district` VALUES ('2650', '510129', '大邑县', '510100', '2650', '1');
INSERT INTO `t_district` VALUES ('2651', '510131', '蒲江县', '510100', '2651', '1');
INSERT INTO `t_district` VALUES ('2652', '510132', '新津县', '510100', '2652', '1');
INSERT INTO `t_district` VALUES ('2653', '510181', '都江堰市', '510100', '2653', '1');
INSERT INTO `t_district` VALUES ('2654', '510182', '彭州市', '510100', '2654', '1');
INSERT INTO `t_district` VALUES ('2655', '510183', '邛崃市', '510100', '2655', '1');
INSERT INTO `t_district` VALUES ('2656', '510184', '崇州市', '510100', '2656', '1');
INSERT INTO `t_district` VALUES ('2657', '510301', '市辖区', '510300', '2657', '1');
INSERT INTO `t_district` VALUES ('2658', '510302', '自流井区', '510300', '2658', '1');
INSERT INTO `t_district` VALUES ('2659', '510303', '贡井区', '510300', '2659', '1');
INSERT INTO `t_district` VALUES ('2660', '510304', '大安区', '510300', '2660', '1');
INSERT INTO `t_district` VALUES ('2661', '510311', '沿滩区', '510300', '2661', '1');
INSERT INTO `t_district` VALUES ('2662', '510321', '荣　县', '510300', '2662', '1');
INSERT INTO `t_district` VALUES ('2663', '510322', '富顺县', '510300', '2663', '1');
INSERT INTO `t_district` VALUES ('2664', '510401', '市辖区', '510400', '2664', '1');
INSERT INTO `t_district` VALUES ('2665', '510402', '东　区', '510400', '2665', '1');
INSERT INTO `t_district` VALUES ('2666', '510403', '西　区', '510400', '2666', '1');
INSERT INTO `t_district` VALUES ('2667', '510411', '仁和区', '510400', '2667', '1');
INSERT INTO `t_district` VALUES ('2668', '510421', '米易县', '510400', '2668', '1');
INSERT INTO `t_district` VALUES ('2669', '510422', '盐边县', '510400', '2669', '1');
INSERT INTO `t_district` VALUES ('2670', '510501', '市辖区', '510500', '2670', '1');
INSERT INTO `t_district` VALUES ('2671', '510502', '江阳区', '510500', '2671', '1');
INSERT INTO `t_district` VALUES ('2672', '510503', '纳溪区', '510500', '2672', '1');
INSERT INTO `t_district` VALUES ('2673', '510504', '龙马潭区', '510500', '2673', '1');
INSERT INTO `t_district` VALUES ('2674', '510521', '泸　县', '510500', '2674', '1');
INSERT INTO `t_district` VALUES ('2675', '510522', '合江县', '510500', '2675', '1');
INSERT INTO `t_district` VALUES ('2676', '510524', '叙永县', '510500', '2676', '1');
INSERT INTO `t_district` VALUES ('2677', '510525', '古蔺县', '510500', '2677', '1');
INSERT INTO `t_district` VALUES ('2678', '510601', '市辖区', '510600', '2678', '1');
INSERT INTO `t_district` VALUES ('2679', '510603', '旌阳区', '510600', '2679', '1');
INSERT INTO `t_district` VALUES ('2680', '510623', '中江县', '510600', '2680', '1');
INSERT INTO `t_district` VALUES ('2681', '510626', '罗江县', '510600', '2681', '1');
INSERT INTO `t_district` VALUES ('2682', '510681', '广汉市', '510600', '2682', '1');
INSERT INTO `t_district` VALUES ('2683', '510682', '什邡市', '510600', '2683', '1');
INSERT INTO `t_district` VALUES ('2684', '510683', '绵竹市', '510600', '2684', '1');
INSERT INTO `t_district` VALUES ('2685', '510701', '市辖区', '510700', '2685', '1');
INSERT INTO `t_district` VALUES ('2686', '510703', '涪城区', '510700', '2686', '1');
INSERT INTO `t_district` VALUES ('2687', '510704', '游仙区', '510700', '2687', '1');
INSERT INTO `t_district` VALUES ('2688', '510722', '三台县', '510700', '2688', '1');
INSERT INTO `t_district` VALUES ('2689', '510723', '盐亭县', '510700', '2689', '1');
INSERT INTO `t_district` VALUES ('2690', '510724', '安　县', '510700', '2690', '1');
INSERT INTO `t_district` VALUES ('2691', '510725', '梓潼县', '510700', '2691', '1');
INSERT INTO `t_district` VALUES ('2692', '510726', '北川羌族自治县', '510700', '2692', '1');
INSERT INTO `t_district` VALUES ('2693', '510727', '平武县', '510700', '2693', '1');
INSERT INTO `t_district` VALUES ('2694', '510781', '江油市', '510700', '2694', '1');
INSERT INTO `t_district` VALUES ('2695', '510801', '市辖区', '510800', '2695', '1');
INSERT INTO `t_district` VALUES ('2696', '510802', '市中区', '510800', '2696', '1');
INSERT INTO `t_district` VALUES ('2697', '510811', '元坝区', '510800', '2697', '1');
INSERT INTO `t_district` VALUES ('2698', '510812', '朝天区', '510800', '2698', '1');
INSERT INTO `t_district` VALUES ('2699', '510821', '旺苍县', '510800', '2699', '1');
INSERT INTO `t_district` VALUES ('2700', '510822', '青川县', '510800', '2700', '1');
INSERT INTO `t_district` VALUES ('2701', '510823', '剑阁县', '510800', '2701', '1');
INSERT INTO `t_district` VALUES ('2702', '510824', '苍溪县', '510800', '2702', '1');
INSERT INTO `t_district` VALUES ('2703', '510901', '市辖区', '510900', '2703', '1');
INSERT INTO `t_district` VALUES ('2704', '510903', '船山区', '510900', '2704', '1');
INSERT INTO `t_district` VALUES ('2705', '510904', '安居区', '510900', '2705', '1');
INSERT INTO `t_district` VALUES ('2706', '510921', '蓬溪县', '510900', '2706', '1');
INSERT INTO `t_district` VALUES ('2707', '510922', '射洪县', '510900', '2707', '1');
INSERT INTO `t_district` VALUES ('2708', '510923', '大英县', '510900', '2708', '1');
INSERT INTO `t_district` VALUES ('2709', '511001', '市辖区', '511000', '2709', '1');
INSERT INTO `t_district` VALUES ('2710', '511002', '市中区', '511000', '2710', '1');
INSERT INTO `t_district` VALUES ('2711', '511011', '东兴区', '511000', '2711', '1');
INSERT INTO `t_district` VALUES ('2712', '511024', '威远县', '511000', '2712', '1');
INSERT INTO `t_district` VALUES ('2713', '511025', '资中县', '511000', '2713', '1');
INSERT INTO `t_district` VALUES ('2714', '511028', '隆昌县', '511000', '2714', '1');
INSERT INTO `t_district` VALUES ('2715', '511101', '市辖区', '511100', '2715', '1');
INSERT INTO `t_district` VALUES ('2716', '511102', '市中区', '511100', '2716', '1');
INSERT INTO `t_district` VALUES ('2717', '511111', '沙湾区', '511100', '2717', '1');
INSERT INTO `t_district` VALUES ('2718', '511112', '五通桥区', '511100', '2718', '1');
INSERT INTO `t_district` VALUES ('2719', '511113', '金口河区', '511100', '2719', '1');
INSERT INTO `t_district` VALUES ('2720', '511123', '犍为县', '511100', '2720', '1');
INSERT INTO `t_district` VALUES ('2721', '511124', '井研县', '511100', '2721', '1');
INSERT INTO `t_district` VALUES ('2722', '511126', '夹江县', '511100', '2722', '1');
INSERT INTO `t_district` VALUES ('2723', '511129', '沐川县', '511100', '2723', '1');
INSERT INTO `t_district` VALUES ('2724', '511132', '峨边彝族自治县', '511100', '2724', '1');
INSERT INTO `t_district` VALUES ('2725', '511133', '马边彝族自治县', '511100', '2725', '1');
INSERT INTO `t_district` VALUES ('2726', '511181', '峨眉山市', '511100', '2726', '1');
INSERT INTO `t_district` VALUES ('2727', '511301', '市辖区', '511300', '2727', '1');
INSERT INTO `t_district` VALUES ('2728', '511302', '顺庆区', '511300', '2728', '1');
INSERT INTO `t_district` VALUES ('2729', '511303', '高坪区', '511300', '2729', '1');
INSERT INTO `t_district` VALUES ('2730', '511304', '嘉陵区', '511300', '2730', '1');
INSERT INTO `t_district` VALUES ('2731', '511321', '南部县', '511300', '2731', '1');
INSERT INTO `t_district` VALUES ('2732', '511322', '营山县', '511300', '2732', '1');
INSERT INTO `t_district` VALUES ('2733', '511323', '蓬安县', '511300', '2733', '1');
INSERT INTO `t_district` VALUES ('2734', '511324', '仪陇县', '511300', '2734', '1');
INSERT INTO `t_district` VALUES ('2735', '511325', '西充县', '511300', '2735', '1');
INSERT INTO `t_district` VALUES ('2736', '511381', '阆中市', '511300', '2736', '1');
INSERT INTO `t_district` VALUES ('2737', '511401', '市辖区', '511400', '2737', '1');
INSERT INTO `t_district` VALUES ('2738', '511402', '东坡区', '511400', '2738', '1');
INSERT INTO `t_district` VALUES ('2739', '511421', '仁寿县', '511400', '2739', '1');
INSERT INTO `t_district` VALUES ('2740', '511422', '彭山县', '511400', '2740', '1');
INSERT INTO `t_district` VALUES ('2741', '511423', '洪雅县', '511400', '2741', '1');
INSERT INTO `t_district` VALUES ('2742', '511424', '丹棱县', '511400', '2742', '1');
INSERT INTO `t_district` VALUES ('2743', '511425', '青神县', '511400', '2743', '1');
INSERT INTO `t_district` VALUES ('2744', '511501', '市辖区', '511500', '2744', '1');
INSERT INTO `t_district` VALUES ('2745', '511502', '翠屏区', '511500', '2745', '1');
INSERT INTO `t_district` VALUES ('2746', '511521', '宜宾县', '511500', '2746', '1');
INSERT INTO `t_district` VALUES ('2747', '511522', '南溪县', '511500', '2747', '1');
INSERT INTO `t_district` VALUES ('2748', '511523', '江安县', '511500', '2748', '1');
INSERT INTO `t_district` VALUES ('2749', '511524', '长宁县', '511500', '2749', '1');
INSERT INTO `t_district` VALUES ('2750', '511525', '高　县', '511500', '2750', '1');
INSERT INTO `t_district` VALUES ('2751', '511526', '珙　县', '511500', '2751', '1');
INSERT INTO `t_district` VALUES ('2752', '511527', '筠连县', '511500', '2752', '1');
INSERT INTO `t_district` VALUES ('2753', '511528', '兴文县', '511500', '2753', '1');
INSERT INTO `t_district` VALUES ('2754', '511529', '屏山县', '511500', '2754', '1');
INSERT INTO `t_district` VALUES ('2755', '511601', '市辖区', '511600', '2755', '1');
INSERT INTO `t_district` VALUES ('2756', '511602', '广安区', '511600', '2756', '1');
INSERT INTO `t_district` VALUES ('2757', '511621', '岳池县', '511600', '2757', '1');
INSERT INTO `t_district` VALUES ('2758', '511622', '武胜县', '511600', '2758', '1');
INSERT INTO `t_district` VALUES ('2759', '511623', '邻水县', '511600', '2759', '1');
INSERT INTO `t_district` VALUES ('2760', '511681', '华莹市', '511600', '2760', '1');
INSERT INTO `t_district` VALUES ('2761', '511701', '市辖区', '511700', '2761', '1');
INSERT INTO `t_district` VALUES ('2762', '511702', '通川区', '511700', '2762', '1');
INSERT INTO `t_district` VALUES ('2763', '511721', '达　县', '511700', '2763', '1');
INSERT INTO `t_district` VALUES ('2764', '511722', '宣汉县', '511700', '2764', '1');
INSERT INTO `t_district` VALUES ('2765', '511723', '开江县', '511700', '2765', '1');
INSERT INTO `t_district` VALUES ('2766', '511724', '大竹县', '511700', '2766', '1');
INSERT INTO `t_district` VALUES ('2767', '511725', '渠　县', '511700', '2767', '1');
INSERT INTO `t_district` VALUES ('2768', '511781', '万源市', '511700', '2768', '1');
INSERT INTO `t_district` VALUES ('2769', '511801', '市辖区', '511800', '2769', '1');
INSERT INTO `t_district` VALUES ('2770', '511802', '雨城区', '511800', '2770', '1');
INSERT INTO `t_district` VALUES ('2771', '511821', '名山县', '511800', '2771', '1');
INSERT INTO `t_district` VALUES ('2772', '511822', '荥经县', '511800', '2772', '1');
INSERT INTO `t_district` VALUES ('2773', '511823', '汉源县', '511800', '2773', '1');
INSERT INTO `t_district` VALUES ('2774', '511824', '石棉县', '511800', '2774', '1');
INSERT INTO `t_district` VALUES ('2775', '511825', '天全县', '511800', '2775', '1');
INSERT INTO `t_district` VALUES ('2776', '511826', '芦山县', '511800', '2776', '1');
INSERT INTO `t_district` VALUES ('2777', '511827', '宝兴县', '511800', '2777', '1');
INSERT INTO `t_district` VALUES ('2778', '511901', '市辖区', '511900', '2778', '1');
INSERT INTO `t_district` VALUES ('2779', '511902', '巴州区', '511900', '2779', '1');
INSERT INTO `t_district` VALUES ('2780', '511921', '通江县', '511900', '2780', '1');
INSERT INTO `t_district` VALUES ('2781', '511922', '南江县', '511900', '2781', '1');
INSERT INTO `t_district` VALUES ('2782', '511923', '平昌县', '511900', '2782', '1');
INSERT INTO `t_district` VALUES ('2783', '512001', '市辖区', '512000', '2783', '1');
INSERT INTO `t_district` VALUES ('2784', '512002', '雁江区', '512000', '2784', '1');
INSERT INTO `t_district` VALUES ('2785', '512021', '安岳县', '512000', '2785', '1');
INSERT INTO `t_district` VALUES ('2786', '512022', '乐至县', '512000', '2786', '1');
INSERT INTO `t_district` VALUES ('2787', '512081', '简阳市', '512000', '2787', '1');
INSERT INTO `t_district` VALUES ('2788', '513221', '汶川县', '513200', '2788', '1');
INSERT INTO `t_district` VALUES ('2789', '513222', '理　县', '513200', '2789', '1');
INSERT INTO `t_district` VALUES ('2790', '513223', '茂　县', '513200', '2790', '1');
INSERT INTO `t_district` VALUES ('2791', '513224', '松潘县', '513200', '2791', '1');
INSERT INTO `t_district` VALUES ('2792', '513225', '九寨沟县', '513200', '2792', '1');
INSERT INTO `t_district` VALUES ('2793', '513226', '金川县', '513200', '2793', '1');
INSERT INTO `t_district` VALUES ('2794', '513227', '小金县', '513200', '2794', '1');
INSERT INTO `t_district` VALUES ('2795', '513228', '黑水县', '513200', '2795', '1');
INSERT INTO `t_district` VALUES ('2796', '513229', '马尔康县', '513200', '2796', '1');
INSERT INTO `t_district` VALUES ('2797', '513230', '壤塘县', '513200', '2797', '1');
INSERT INTO `t_district` VALUES ('2798', '513231', '阿坝县', '513200', '2798', '1');
INSERT INTO `t_district` VALUES ('2799', '513232', '若尔盖县', '513200', '2799', '1');
INSERT INTO `t_district` VALUES ('2800', '513233', '红原县', '513200', '2800', '1');
INSERT INTO `t_district` VALUES ('2801', '513321', '康定县', '513300', '2801', '1');
INSERT INTO `t_district` VALUES ('2802', '513322', '泸定县', '513300', '2802', '1');
INSERT INTO `t_district` VALUES ('2803', '513323', '丹巴县', '513300', '2803', '1');
INSERT INTO `t_district` VALUES ('2804', '513324', '九龙县', '513300', '2804', '1');
INSERT INTO `t_district` VALUES ('2805', '513325', '雅江县', '513300', '2805', '1');
INSERT INTO `t_district` VALUES ('2806', '513326', '道孚县', '513300', '2806', '1');
INSERT INTO `t_district` VALUES ('2807', '513327', '炉霍县', '513300', '2807', '1');
INSERT INTO `t_district` VALUES ('2808', '513328', '甘孜县', '513300', '2808', '1');
INSERT INTO `t_district` VALUES ('2809', '513329', '新龙县', '513300', '2809', '1');
INSERT INTO `t_district` VALUES ('2810', '513330', '德格县', '513300', '2810', '1');
INSERT INTO `t_district` VALUES ('2811', '513331', '白玉县', '513300', '2811', '1');
INSERT INTO `t_district` VALUES ('2812', '513332', '石渠县', '513300', '2812', '1');
INSERT INTO `t_district` VALUES ('2813', '513333', '色达县', '513300', '2813', '1');
INSERT INTO `t_district` VALUES ('2814', '513334', '理塘县', '513300', '2814', '1');
INSERT INTO `t_district` VALUES ('2815', '513335', '巴塘县', '513300', '2815', '1');
INSERT INTO `t_district` VALUES ('2816', '513336', '乡城县', '513300', '2816', '1');
INSERT INTO `t_district` VALUES ('2817', '513337', '稻城县', '513300', '2817', '1');
INSERT INTO `t_district` VALUES ('2818', '513338', '得荣县', '513300', '2818', '1');
INSERT INTO `t_district` VALUES ('2819', '513401', '西昌市', '513400', '2819', '1');
INSERT INTO `t_district` VALUES ('2820', '513422', '木里藏族自治县', '513400', '2820', '1');
INSERT INTO `t_district` VALUES ('2821', '513423', '盐源县', '513400', '2821', '1');
INSERT INTO `t_district` VALUES ('2822', '513424', '德昌县', '513400', '2822', '1');
INSERT INTO `t_district` VALUES ('2823', '513425', '会理县', '513400', '2823', '1');
INSERT INTO `t_district` VALUES ('2824', '513426', '会东县', '513400', '2824', '1');
INSERT INTO `t_district` VALUES ('2825', '513427', '宁南县', '513400', '2825', '1');
INSERT INTO `t_district` VALUES ('2826', '513428', '普格县', '513400', '2826', '1');
INSERT INTO `t_district` VALUES ('2827', '513429', '布拖县', '513400', '2827', '1');
INSERT INTO `t_district` VALUES ('2828', '513430', '金阳县', '513400', '2828', '1');
INSERT INTO `t_district` VALUES ('2829', '513431', '昭觉县', '513400', '2829', '1');
INSERT INTO `t_district` VALUES ('2830', '513432', '喜德县', '513400', '2830', '1');
INSERT INTO `t_district` VALUES ('2831', '513433', '冕宁县', '513400', '2831', '1');
INSERT INTO `t_district` VALUES ('2832', '513434', '越西县', '513400', '2832', '1');
INSERT INTO `t_district` VALUES ('2833', '513435', '甘洛县', '513400', '2833', '1');
INSERT INTO `t_district` VALUES ('2834', '513436', '美姑县', '513400', '2834', '1');
INSERT INTO `t_district` VALUES ('2835', '513437', '雷波县', '513400', '2835', '1');
INSERT INTO `t_district` VALUES ('2836', '520101', '市辖区', '520100', '2836', '1');
INSERT INTO `t_district` VALUES ('2837', '520102', '南明区', '520100', '2837', '1');
INSERT INTO `t_district` VALUES ('2838', '520103', '云岩区', '520100', '2838', '1');
INSERT INTO `t_district` VALUES ('2839', '520111', '花溪区', '520100', '2839', '1');
INSERT INTO `t_district` VALUES ('2840', '520112', '乌当区', '520100', '2840', '1');
INSERT INTO `t_district` VALUES ('2841', '520113', '白云区', '520100', '2841', '1');
INSERT INTO `t_district` VALUES ('2842', '520114', '小河区', '520100', '2842', '1');
INSERT INTO `t_district` VALUES ('2843', '520121', '开阳县', '520100', '2843', '1');
INSERT INTO `t_district` VALUES ('2844', '520122', '息烽县', '520100', '2844', '1');
INSERT INTO `t_district` VALUES ('2845', '520123', '修文县', '520100', '2845', '1');
INSERT INTO `t_district` VALUES ('2846', '520181', '清镇市', '520100', '2846', '1');
INSERT INTO `t_district` VALUES ('2847', '520201', '钟山区', '520200', '2847', '1');
INSERT INTO `t_district` VALUES ('2848', '520203', '六枝特区', '520200', '2848', '1');
INSERT INTO `t_district` VALUES ('2849', '520221', '水城县', '520200', '2849', '1');
INSERT INTO `t_district` VALUES ('2850', '520222', '盘　县', '520200', '2850', '1');
INSERT INTO `t_district` VALUES ('2851', '520301', '市辖区', '520300', '2851', '1');
INSERT INTO `t_district` VALUES ('2852', '520302', '红花岗区', '520300', '2852', '1');
INSERT INTO `t_district` VALUES ('2853', '520303', '汇川区', '520300', '2853', '1');
INSERT INTO `t_district` VALUES ('2854', '520321', '遵义县', '520300', '2854', '1');
INSERT INTO `t_district` VALUES ('2855', '520322', '桐梓县', '520300', '2855', '1');
INSERT INTO `t_district` VALUES ('2856', '520323', '绥阳县', '520300', '2856', '1');
INSERT INTO `t_district` VALUES ('2857', '520324', '正安县', '520300', '2857', '1');
INSERT INTO `t_district` VALUES ('2858', '520325', '道真仡佬族苗族自治县', '520300', '2858', '1');
INSERT INTO `t_district` VALUES ('2859', '520326', '务川仡佬族苗族自治县', '520300', '2859', '1');
INSERT INTO `t_district` VALUES ('2860', '520327', '凤冈县', '520300', '2860', '1');
INSERT INTO `t_district` VALUES ('2861', '520328', '湄潭县', '520300', '2861', '1');
INSERT INTO `t_district` VALUES ('2862', '520329', '余庆县', '520300', '2862', '1');
INSERT INTO `t_district` VALUES ('2863', '520330', '习水县', '520300', '2863', '1');
INSERT INTO `t_district` VALUES ('2864', '520381', '赤水市', '520300', '2864', '1');
INSERT INTO `t_district` VALUES ('2865', '520382', '仁怀市', '520300', '2865', '1');
INSERT INTO `t_district` VALUES ('2866', '520401', '市辖区', '520400', '2866', '1');
INSERT INTO `t_district` VALUES ('2867', '520402', '西秀区', '520400', '2867', '1');
INSERT INTO `t_district` VALUES ('2868', '520421', '平坝县', '520400', '2868', '1');
INSERT INTO `t_district` VALUES ('2869', '520422', '普定县', '520400', '2869', '1');
INSERT INTO `t_district` VALUES ('2870', '520423', '镇宁布依族苗族自治县', '520400', '2870', '1');
INSERT INTO `t_district` VALUES ('2871', '520424', '关岭布依族苗族自治县', '520400', '2871', '1');
INSERT INTO `t_district` VALUES ('2872', '520425', '紫云苗族布依族自治县', '520400', '2872', '1');
INSERT INTO `t_district` VALUES ('2873', '522201', '铜仁市', '522200', '2873', '1');
INSERT INTO `t_district` VALUES ('2874', '522222', '江口县', '522200', '2874', '1');
INSERT INTO `t_district` VALUES ('2875', '522223', '玉屏侗族自治县', '522200', '2875', '1');
INSERT INTO `t_district` VALUES ('2876', '522224', '石阡县', '522200', '2876', '1');
INSERT INTO `t_district` VALUES ('2877', '522225', '思南县', '522200', '2877', '1');
INSERT INTO `t_district` VALUES ('2878', '522226', '印江土家族苗族自治县', '522200', '2878', '1');
INSERT INTO `t_district` VALUES ('2879', '522227', '德江县', '522200', '2879', '1');
INSERT INTO `t_district` VALUES ('2880', '522228', '沿河土家族自治县', '522200', '2880', '1');
INSERT INTO `t_district` VALUES ('2881', '522229', '松桃苗族自治县', '522200', '2881', '1');
INSERT INTO `t_district` VALUES ('2882', '522230', '万山特区', '522200', '2882', '1');
INSERT INTO `t_district` VALUES ('2883', '522301', '兴义市', '522300', '2883', '1');
INSERT INTO `t_district` VALUES ('2884', '522322', '兴仁县', '522300', '2884', '1');
INSERT INTO `t_district` VALUES ('2885', '522323', '普安县', '522300', '2885', '1');
INSERT INTO `t_district` VALUES ('2886', '522324', '晴隆县', '522300', '2886', '1');
INSERT INTO `t_district` VALUES ('2887', '522325', '贞丰县', '522300', '2887', '1');
INSERT INTO `t_district` VALUES ('2888', '522326', '望谟县', '522300', '2888', '1');
INSERT INTO `t_district` VALUES ('2889', '522327', '册亨县', '522300', '2889', '1');
INSERT INTO `t_district` VALUES ('2890', '522328', '安龙县', '522300', '2890', '1');
INSERT INTO `t_district` VALUES ('2891', '522401', '毕节市', '522400', '2891', '1');
INSERT INTO `t_district` VALUES ('2892', '522422', '大方县', '522400', '2892', '1');
INSERT INTO `t_district` VALUES ('2893', '522423', '黔西县', '522400', '2893', '1');
INSERT INTO `t_district` VALUES ('2894', '522424', '金沙县', '522400', '2894', '1');
INSERT INTO `t_district` VALUES ('2895', '522425', '织金县', '522400', '2895', '1');
INSERT INTO `t_district` VALUES ('2896', '522426', '纳雍县', '522400', '2896', '1');
INSERT INTO `t_district` VALUES ('2897', '522427', '威宁彝族回族苗族自治县', '522400', '2897', '1');
INSERT INTO `t_district` VALUES ('2898', '522428', '赫章县', '522400', '2898', '1');
INSERT INTO `t_district` VALUES ('2899', '522601', '凯里市', '522600', '2899', '1');
INSERT INTO `t_district` VALUES ('2900', '522622', '黄平县', '522600', '2900', '1');
INSERT INTO `t_district` VALUES ('2901', '522623', '施秉县', '522600', '2901', '1');
INSERT INTO `t_district` VALUES ('2902', '522624', '三穗县', '522600', '2902', '1');
INSERT INTO `t_district` VALUES ('2903', '522625', '镇远县', '522600', '2903', '1');
INSERT INTO `t_district` VALUES ('2904', '522626', '岑巩县', '522600', '2904', '1');
INSERT INTO `t_district` VALUES ('2905', '522627', '天柱县', '522600', '2905', '1');
INSERT INTO `t_district` VALUES ('2906', '522628', '锦屏县', '522600', '2906', '1');
INSERT INTO `t_district` VALUES ('2907', '522629', '剑河县', '522600', '2907', '1');
INSERT INTO `t_district` VALUES ('2908', '522630', '台江县', '522600', '2908', '1');
INSERT INTO `t_district` VALUES ('2909', '522631', '黎平县', '522600', '2909', '1');
INSERT INTO `t_district` VALUES ('2910', '522632', '榕江县', '522600', '2910', '1');
INSERT INTO `t_district` VALUES ('2911', '522633', '从江县', '522600', '2911', '1');
INSERT INTO `t_district` VALUES ('2912', '522634', '雷山县', '522600', '2912', '1');
INSERT INTO `t_district` VALUES ('2913', '522635', '麻江县', '522600', '2913', '1');
INSERT INTO `t_district` VALUES ('2914', '522636', '丹寨县', '522600', '2914', '1');
INSERT INTO `t_district` VALUES ('2915', '522701', '都匀市', '522700', '2915', '1');
INSERT INTO `t_district` VALUES ('2916', '522702', '福泉市', '522700', '2916', '1');
INSERT INTO `t_district` VALUES ('2917', '522722', '荔波县', '522700', '2917', '1');
INSERT INTO `t_district` VALUES ('2918', '522723', '贵定县', '522700', '2918', '1');
INSERT INTO `t_district` VALUES ('2919', '522725', '瓮安县', '522700', '2919', '1');
INSERT INTO `t_district` VALUES ('2920', '522726', '独山县', '522700', '2920', '1');
INSERT INTO `t_district` VALUES ('2921', '522727', '平塘县', '522700', '2921', '1');
INSERT INTO `t_district` VALUES ('2922', '522728', '罗甸县', '522700', '2922', '1');
INSERT INTO `t_district` VALUES ('2923', '522729', '长顺县', '522700', '2923', '1');
INSERT INTO `t_district` VALUES ('2924', '522730', '龙里县', '522700', '2924', '1');
INSERT INTO `t_district` VALUES ('2925', '522731', '惠水县', '522700', '2925', '1');
INSERT INTO `t_district` VALUES ('2926', '522732', '三都水族自治县', '522700', '2926', '1');
INSERT INTO `t_district` VALUES ('2927', '530101', '市辖区', '530100', '2927', '1');
INSERT INTO `t_district` VALUES ('2928', '530102', '五华区', '530100', '2928', '1');
INSERT INTO `t_district` VALUES ('2929', '530103', '盘龙区', '530100', '2929', '1');
INSERT INTO `t_district` VALUES ('2930', '530111', '官渡区', '530100', '2930', '1');
INSERT INTO `t_district` VALUES ('2931', '530112', '西山区', '530100', '2931', '1');
INSERT INTO `t_district` VALUES ('2932', '530113', '东川区', '530100', '2932', '1');
INSERT INTO `t_district` VALUES ('2933', '530121', '呈贡县', '530100', '2933', '1');
INSERT INTO `t_district` VALUES ('2934', '530122', '晋宁县', '530100', '2934', '1');
INSERT INTO `t_district` VALUES ('2935', '530124', '富民县', '530100', '2935', '1');
INSERT INTO `t_district` VALUES ('2936', '530125', '宜良县', '530100', '2936', '1');
INSERT INTO `t_district` VALUES ('2937', '530126', '石林彝族自治县', '530100', '2937', '1');
INSERT INTO `t_district` VALUES ('2938', '530127', '嵩明县', '530100', '2938', '1');
INSERT INTO `t_district` VALUES ('2939', '530128', '禄劝彝族苗族自治县', '530100', '2939', '1');
INSERT INTO `t_district` VALUES ('2940', '530129', '寻甸回族彝族自治县', '530100', '2940', '1');
INSERT INTO `t_district` VALUES ('2941', '530181', '安宁市', '530100', '2941', '1');
INSERT INTO `t_district` VALUES ('2942', '530301', '市辖区', '530300', '2942', '1');
INSERT INTO `t_district` VALUES ('2943', '530302', '麒麟区', '530300', '2943', '1');
INSERT INTO `t_district` VALUES ('2944', '530321', '马龙县', '530300', '2944', '1');
INSERT INTO `t_district` VALUES ('2945', '530322', '陆良县', '530300', '2945', '1');
INSERT INTO `t_district` VALUES ('2946', '530323', '师宗县', '530300', '2946', '1');
INSERT INTO `t_district` VALUES ('2947', '530324', '罗平县', '530300', '2947', '1');
INSERT INTO `t_district` VALUES ('2948', '530325', '富源县', '530300', '2948', '1');
INSERT INTO `t_district` VALUES ('2949', '530326', '会泽县', '530300', '2949', '1');
INSERT INTO `t_district` VALUES ('2950', '530328', '沾益县', '530300', '2950', '1');
INSERT INTO `t_district` VALUES ('2951', '530381', '宣威市', '530300', '2951', '1');
INSERT INTO `t_district` VALUES ('2952', '530401', '市辖区', '530400', '2952', '1');
INSERT INTO `t_district` VALUES ('2953', '530402', '红塔区', '530400', '2953', '1');
INSERT INTO `t_district` VALUES ('2954', '530421', '江川县', '530400', '2954', '1');
INSERT INTO `t_district` VALUES ('2955', '530422', '澄江县', '530400', '2955', '1');
INSERT INTO `t_district` VALUES ('2956', '530423', '通海县', '530400', '2956', '1');
INSERT INTO `t_district` VALUES ('2957', '530424', '华宁县', '530400', '2957', '1');
INSERT INTO `t_district` VALUES ('2958', '530425', '易门县', '530400', '2958', '1');
INSERT INTO `t_district` VALUES ('2959', '530426', '峨山彝族自治县', '530400', '2959', '1');
INSERT INTO `t_district` VALUES ('2960', '530427', '新平彝族傣族自治县', '530400', '2960', '1');
INSERT INTO `t_district` VALUES ('2961', '530428', '元江哈尼族彝族傣族自治县', '530400', '2961', '1');
INSERT INTO `t_district` VALUES ('2962', '530501', '市辖区', '530500', '2962', '1');
INSERT INTO `t_district` VALUES ('2963', '530502', '隆阳区', '530500', '2963', '1');
INSERT INTO `t_district` VALUES ('2964', '530521', '施甸县', '530500', '2964', '1');
INSERT INTO `t_district` VALUES ('2965', '530522', '腾冲县', '530500', '2965', '1');
INSERT INTO `t_district` VALUES ('2966', '530523', '龙陵县', '530500', '2966', '1');
INSERT INTO `t_district` VALUES ('2967', '530524', '昌宁县', '530500', '2967', '1');
INSERT INTO `t_district` VALUES ('2968', '530601', '市辖区', '530600', '2968', '1');
INSERT INTO `t_district` VALUES ('2969', '530602', '昭阳区', '530600', '2969', '1');
INSERT INTO `t_district` VALUES ('2970', '530621', '鲁甸县', '530600', '2970', '1');
INSERT INTO `t_district` VALUES ('2971', '530622', '巧家县', '530600', '2971', '1');
INSERT INTO `t_district` VALUES ('2972', '530623', '盐津县', '530600', '2972', '1');
INSERT INTO `t_district` VALUES ('2973', '530624', '大关县', '530600', '2973', '1');
INSERT INTO `t_district` VALUES ('2974', '530625', '永善县', '530600', '2974', '1');
INSERT INTO `t_district` VALUES ('2975', '530626', '绥江县', '530600', '2975', '1');
INSERT INTO `t_district` VALUES ('2976', '530627', '镇雄县', '530600', '2976', '1');
INSERT INTO `t_district` VALUES ('2977', '530628', '彝良县', '530600', '2977', '1');
INSERT INTO `t_district` VALUES ('2978', '530629', '威信县', '530600', '2978', '1');
INSERT INTO `t_district` VALUES ('2979', '530630', '水富县', '530600', '2979', '1');
INSERT INTO `t_district` VALUES ('2980', '530701', '市辖区', '530700', '2980', '1');
INSERT INTO `t_district` VALUES ('2981', '530702', '古城区', '530700', '2981', '1');
INSERT INTO `t_district` VALUES ('2982', '530721', '玉龙纳西族自治县', '530700', '2982', '1');
INSERT INTO `t_district` VALUES ('2983', '530722', '永胜县', '530700', '2983', '1');
INSERT INTO `t_district` VALUES ('2984', '530723', '华坪县', '530700', '2984', '1');
INSERT INTO `t_district` VALUES ('2985', '530724', '宁蒗彝族自治县', '530700', '2985', '1');
INSERT INTO `t_district` VALUES ('2986', '530801', '市辖区', '530800', '2986', '1');
INSERT INTO `t_district` VALUES ('2987', '530802', '翠云区', '530800', '2987', '1');
INSERT INTO `t_district` VALUES ('2988', '530821', '普洱哈尼族彝族自治县', '530800', '2988', '1');
INSERT INTO `t_district` VALUES ('2989', '530822', '墨江哈尼族自治县', '530800', '2989', '1');
INSERT INTO `t_district` VALUES ('2990', '530823', '景东彝族自治县', '530800', '2990', '1');
INSERT INTO `t_district` VALUES ('2991', '530824', '景谷傣族彝族自治县', '530800', '2991', '1');
INSERT INTO `t_district` VALUES ('2992', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '2992', '1');
INSERT INTO `t_district` VALUES ('2993', '530826', '江城哈尼族彝族自治县', '530800', '2993', '1');
INSERT INTO `t_district` VALUES ('2994', '530827', '孟连傣族拉祜族佤族自治县', '530800', '2994', '1');
INSERT INTO `t_district` VALUES ('2995', '530828', '澜沧拉祜族自治县', '530800', '2995', '1');
INSERT INTO `t_district` VALUES ('2996', '530829', '西盟佤族自治县', '530800', '2996', '1');
INSERT INTO `t_district` VALUES ('2997', '530901', '市辖区', '530900', '2997', '1');
INSERT INTO `t_district` VALUES ('2998', '530902', '临翔区', '530900', '2998', '1');
INSERT INTO `t_district` VALUES ('2999', '530921', '凤庆县', '530900', '2999', '1');
INSERT INTO `t_district` VALUES ('3000', '530922', '云　县', '530900', '3000', '1');
INSERT INTO `t_district` VALUES ('3001', '530923', '永德县', '530900', '3001', '1');
INSERT INTO `t_district` VALUES ('3002', '530924', '镇康县', '530900', '3002', '1');
INSERT INTO `t_district` VALUES ('3003', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '3003', '1');
INSERT INTO `t_district` VALUES ('3004', '530926', '耿马傣族佤族自治县', '530900', '3004', '1');
INSERT INTO `t_district` VALUES ('3005', '530927', '沧源佤族自治县', '530900', '3005', '1');
INSERT INTO `t_district` VALUES ('3006', '532301', '楚雄市', '532300', '3006', '1');
INSERT INTO `t_district` VALUES ('3007', '532322', '双柏县', '532300', '3007', '1');
INSERT INTO `t_district` VALUES ('3008', '532323', '牟定县', '532300', '3008', '1');
INSERT INTO `t_district` VALUES ('3009', '532324', '南华县', '532300', '3009', '1');
INSERT INTO `t_district` VALUES ('3010', '532325', '姚安县', '532300', '3010', '1');
INSERT INTO `t_district` VALUES ('3011', '532326', '大姚县', '532300', '3011', '1');
INSERT INTO `t_district` VALUES ('3012', '532327', '永仁县', '532300', '3012', '1');
INSERT INTO `t_district` VALUES ('3013', '532328', '元谋县', '532300', '3013', '1');
INSERT INTO `t_district` VALUES ('3014', '532329', '武定县', '532300', '3014', '1');
INSERT INTO `t_district` VALUES ('3015', '532331', '禄丰县', '532300', '3015', '1');
INSERT INTO `t_district` VALUES ('3016', '532501', '个旧市', '532500', '3016', '1');
INSERT INTO `t_district` VALUES ('3017', '532502', '开远市', '532500', '3017', '1');
INSERT INTO `t_district` VALUES ('3018', '532522', '蒙自县', '532500', '3018', '1');
INSERT INTO `t_district` VALUES ('3019', '532523', '屏边苗族自治县', '532500', '3019', '1');
INSERT INTO `t_district` VALUES ('3020', '532524', '建水县', '532500', '3020', '1');
INSERT INTO `t_district` VALUES ('3021', '532525', '石屏县', '532500', '3021', '1');
INSERT INTO `t_district` VALUES ('3022', '532526', '弥勒县', '532500', '3022', '1');
INSERT INTO `t_district` VALUES ('3023', '532527', '泸西县', '532500', '3023', '1');
INSERT INTO `t_district` VALUES ('3024', '532528', '元阳县', '532500', '3024', '1');
INSERT INTO `t_district` VALUES ('3025', '532529', '红河县', '532500', '3025', '1');
INSERT INTO `t_district` VALUES ('3026', '532530', '金平苗族瑶族傣族自治县', '532500', '3026', '1');
INSERT INTO `t_district` VALUES ('3027', '532531', '绿春县', '532500', '3027', '1');
INSERT INTO `t_district` VALUES ('3028', '532532', '河口瑶族自治县', '532500', '3028', '1');
INSERT INTO `t_district` VALUES ('3029', '532621', '文山县', '532600', '3029', '1');
INSERT INTO `t_district` VALUES ('3030', '532622', '砚山县', '532600', '3030', '1');
INSERT INTO `t_district` VALUES ('3031', '532623', '西畴县', '532600', '3031', '1');
INSERT INTO `t_district` VALUES ('3032', '532624', '麻栗坡县', '532600', '3032', '1');
INSERT INTO `t_district` VALUES ('3033', '532625', '马关县', '532600', '3033', '1');
INSERT INTO `t_district` VALUES ('3034', '532626', '丘北县', '532600', '3034', '1');
INSERT INTO `t_district` VALUES ('3035', '532627', '广南县', '532600', '3035', '1');
INSERT INTO `t_district` VALUES ('3036', '532628', '富宁县', '532600', '3036', '1');
INSERT INTO `t_district` VALUES ('3037', '532801', '景洪市', '532800', '3037', '1');
INSERT INTO `t_district` VALUES ('3038', '532822', '勐海县', '532800', '3038', '1');
INSERT INTO `t_district` VALUES ('3039', '532823', '勐腊县', '532800', '3039', '1');
INSERT INTO `t_district` VALUES ('3040', '532901', '大理市', '532900', '3040', '1');
INSERT INTO `t_district` VALUES ('3041', '532922', '漾濞彝族自治县', '532900', '3041', '1');
INSERT INTO `t_district` VALUES ('3042', '532923', '祥云县', '532900', '3042', '1');
INSERT INTO `t_district` VALUES ('3043', '532924', '宾川县', '532900', '3043', '1');
INSERT INTO `t_district` VALUES ('3044', '532925', '弥渡县', '532900', '3044', '1');
INSERT INTO `t_district` VALUES ('3045', '532926', '南涧彝族自治县', '532900', '3045', '1');
INSERT INTO `t_district` VALUES ('3046', '532927', '巍山彝族回族自治县', '532900', '3046', '1');
INSERT INTO `t_district` VALUES ('3047', '532928', '永平县', '532900', '3047', '1');
INSERT INTO `t_district` VALUES ('3048', '532929', '云龙县', '532900', '3048', '1');
INSERT INTO `t_district` VALUES ('3049', '532930', '洱源县', '532900', '3049', '1');
INSERT INTO `t_district` VALUES ('3050', '532931', '剑川县', '532900', '3050', '1');
INSERT INTO `t_district` VALUES ('3051', '532932', '鹤庆县', '532900', '3051', '1');
INSERT INTO `t_district` VALUES ('3052', '533102', '瑞丽市', '533100', '3052', '1');
INSERT INTO `t_district` VALUES ('3053', '533103', '潞西市', '533100', '3053', '1');
INSERT INTO `t_district` VALUES ('3054', '533122', '梁河县', '533100', '3054', '1');
INSERT INTO `t_district` VALUES ('3055', '533123', '盈江县', '533100', '3055', '1');
INSERT INTO `t_district` VALUES ('3056', '533124', '陇川县', '533100', '3056', '1');
INSERT INTO `t_district` VALUES ('3057', '533321', '泸水县', '533300', '3057', '1');
INSERT INTO `t_district` VALUES ('3058', '533323', '福贡县', '533300', '3058', '1');
INSERT INTO `t_district` VALUES ('3059', '533324', '贡山独龙族怒族自治县', '533300', '3059', '1');
INSERT INTO `t_district` VALUES ('3060', '533325', '兰坪白族普米族自治县', '533300', '3060', '1');
INSERT INTO `t_district` VALUES ('3061', '533421', '香格里拉县', '533400', '3061', '1');
INSERT INTO `t_district` VALUES ('3062', '533422', '德钦县', '533400', '3062', '1');
INSERT INTO `t_district` VALUES ('3063', '533423', '维西傈僳族自治县', '533400', '3063', '1');
INSERT INTO `t_district` VALUES ('3064', '540101', '市辖区', '540100', '3064', '1');
INSERT INTO `t_district` VALUES ('3065', '540102', '城关区', '540100', '3065', '1');
INSERT INTO `t_district` VALUES ('3066', '540121', '林周县', '540100', '3066', '1');
INSERT INTO `t_district` VALUES ('3067', '540122', '当雄县', '540100', '3067', '1');
INSERT INTO `t_district` VALUES ('3068', '540123', '尼木县', '540100', '3068', '1');
INSERT INTO `t_district` VALUES ('3069', '540124', '曲水县', '540100', '3069', '1');
INSERT INTO `t_district` VALUES ('3070', '540125', '堆龙德庆县', '540100', '3070', '1');
INSERT INTO `t_district` VALUES ('3071', '540126', '达孜县', '540100', '3071', '1');
INSERT INTO `t_district` VALUES ('3072', '540127', '墨竹工卡县', '540100', '3072', '1');
INSERT INTO `t_district` VALUES ('3073', '542121', '昌都县', '542100', '3073', '1');
INSERT INTO `t_district` VALUES ('3074', '542122', '江达县', '542100', '3074', '1');
INSERT INTO `t_district` VALUES ('3075', '542123', '贡觉县', '542100', '3075', '1');
INSERT INTO `t_district` VALUES ('3076', '542124', '类乌齐县', '542100', '3076', '1');
INSERT INTO `t_district` VALUES ('3077', '542125', '丁青县', '542100', '3077', '1');
INSERT INTO `t_district` VALUES ('3078', '542126', '察雅县', '542100', '3078', '1');
INSERT INTO `t_district` VALUES ('3079', '542127', '八宿县', '542100', '3079', '1');
INSERT INTO `t_district` VALUES ('3080', '542128', '左贡县', '542100', '3080', '1');
INSERT INTO `t_district` VALUES ('3081', '542129', '芒康县', '542100', '3081', '1');
INSERT INTO `t_district` VALUES ('3082', '542132', '洛隆县', '542100', '3082', '1');
INSERT INTO `t_district` VALUES ('3083', '542133', '边坝县', '542100', '3083', '1');
INSERT INTO `t_district` VALUES ('3084', '542221', '乃东县', '542200', '3084', '1');
INSERT INTO `t_district` VALUES ('3085', '542222', '扎囊县', '542200', '3085', '1');
INSERT INTO `t_district` VALUES ('3086', '542223', '贡嘎县', '542200', '3086', '1');
INSERT INTO `t_district` VALUES ('3087', '542224', '桑日县', '542200', '3087', '1');
INSERT INTO `t_district` VALUES ('3088', '542225', '琼结县', '542200', '3088', '1');
INSERT INTO `t_district` VALUES ('3089', '542226', '曲松县', '542200', '3089', '1');
INSERT INTO `t_district` VALUES ('3090', '542227', '措美县', '542200', '3090', '1');
INSERT INTO `t_district` VALUES ('3091', '542228', '洛扎县', '542200', '3091', '1');
INSERT INTO `t_district` VALUES ('3092', '542229', '加查县', '542200', '3092', '1');
INSERT INTO `t_district` VALUES ('3093', '542231', '隆子县', '542200', '3093', '1');
INSERT INTO `t_district` VALUES ('3094', '542232', '错那县', '542200', '3094', '1');
INSERT INTO `t_district` VALUES ('3095', '542233', '浪卡子县', '542200', '3095', '1');
INSERT INTO `t_district` VALUES ('3096', '542301', '日喀则市', '542300', '3096', '1');
INSERT INTO `t_district` VALUES ('3097', '542322', '南木林县', '542300', '3097', '1');
INSERT INTO `t_district` VALUES ('3098', '542323', '江孜县', '542300', '3098', '1');
INSERT INTO `t_district` VALUES ('3099', '542324', '定日县', '542300', '3099', '1');
INSERT INTO `t_district` VALUES ('3100', '542325', '萨迦县', '542300', '3100', '1');
INSERT INTO `t_district` VALUES ('3101', '542326', '拉孜县', '542300', '3101', '1');
INSERT INTO `t_district` VALUES ('3102', '542327', '昂仁县', '542300', '3102', '1');
INSERT INTO `t_district` VALUES ('3103', '542328', '谢通门县', '542300', '3103', '1');
INSERT INTO `t_district` VALUES ('3104', '542329', '白朗县', '542300', '3104', '1');
INSERT INTO `t_district` VALUES ('3105', '542330', '仁布县', '542300', '3105', '1');
INSERT INTO `t_district` VALUES ('3106', '542331', '康马县', '542300', '3106', '1');
INSERT INTO `t_district` VALUES ('3107', '542332', '定结县', '542300', '3107', '1');
INSERT INTO `t_district` VALUES ('3108', '542333', '仲巴县', '542300', '3108', '1');
INSERT INTO `t_district` VALUES ('3109', '542334', '亚东县', '542300', '3109', '1');
INSERT INTO `t_district` VALUES ('3110', '542335', '吉隆县', '542300', '3110', '1');
INSERT INTO `t_district` VALUES ('3111', '542336', '聂拉木县', '542300', '3111', '1');
INSERT INTO `t_district` VALUES ('3112', '542337', '萨嘎县', '542300', '3112', '1');
INSERT INTO `t_district` VALUES ('3113', '542338', '岗巴县', '542300', '3113', '1');
INSERT INTO `t_district` VALUES ('3114', '542421', '那曲县', '542400', '3114', '1');
INSERT INTO `t_district` VALUES ('3115', '542422', '嘉黎县', '542400', '3115', '1');
INSERT INTO `t_district` VALUES ('3116', '542423', '比如县', '542400', '3116', '1');
INSERT INTO `t_district` VALUES ('3117', '542424', '聂荣县', '542400', '3117', '1');
INSERT INTO `t_district` VALUES ('3118', '542425', '安多县', '542400', '3118', '1');
INSERT INTO `t_district` VALUES ('3119', '542426', '申扎县', '542400', '3119', '1');
INSERT INTO `t_district` VALUES ('3120', '542427', '索　县', '542400', '3120', '1');
INSERT INTO `t_district` VALUES ('3121', '542428', '班戈县', '542400', '3121', '1');
INSERT INTO `t_district` VALUES ('3122', '542429', '巴青县', '542400', '3122', '1');
INSERT INTO `t_district` VALUES ('3123', '542430', '尼玛县', '542400', '3123', '1');
INSERT INTO `t_district` VALUES ('3124', '542521', '普兰县', '542500', '3124', '1');
INSERT INTO `t_district` VALUES ('3125', '542522', '札达县', '542500', '3125', '1');
INSERT INTO `t_district` VALUES ('3126', '542523', '噶尔县', '542500', '3126', '1');
INSERT INTO `t_district` VALUES ('3127', '542524', '日土县', '542500', '3127', '1');
INSERT INTO `t_district` VALUES ('3128', '542525', '革吉县', '542500', '3128', '1');
INSERT INTO `t_district` VALUES ('3129', '542526', '改则县', '542500', '3129', '1');
INSERT INTO `t_district` VALUES ('3130', '542527', '措勤县', '542500', '3130', '1');
INSERT INTO `t_district` VALUES ('3131', '542621', '林芝县', '542600', '3131', '1');
INSERT INTO `t_district` VALUES ('3132', '542622', '工布江达县', '542600', '3132', '1');
INSERT INTO `t_district` VALUES ('3133', '542623', '米林县', '542600', '3133', '1');
INSERT INTO `t_district` VALUES ('3134', '542624', '墨脱县', '542600', '3134', '1');
INSERT INTO `t_district` VALUES ('3135', '542625', '波密县', '542600', '3135', '1');
INSERT INTO `t_district` VALUES ('3136', '542626', '察隅县', '542600', '3136', '1');
INSERT INTO `t_district` VALUES ('3137', '542627', '朗　县', '542600', '3137', '1');
INSERT INTO `t_district` VALUES ('3138', '610101', '市辖区', '610100', '3138', '1');
INSERT INTO `t_district` VALUES ('3139', '610102', '新城区', '610100', '3139', '1');
INSERT INTO `t_district` VALUES ('3140', '610103', '碑林区', '610100', '3140', '1');
INSERT INTO `t_district` VALUES ('3141', '610104', '莲湖区', '610100', '3141', '1');
INSERT INTO `t_district` VALUES ('3142', '610111', '灞桥区', '610100', '3142', '1');
INSERT INTO `t_district` VALUES ('3143', '610112', '未央区', '610100', '3143', '1');
INSERT INTO `t_district` VALUES ('3144', '610113', '雁塔区', '610100', '3144', '1');
INSERT INTO `t_district` VALUES ('3145', '610114', '阎良区', '610100', '3145', '1');
INSERT INTO `t_district` VALUES ('3146', '610115', '临潼区', '610100', '3146', '1');
INSERT INTO `t_district` VALUES ('3147', '610116', '长安区', '610100', '3147', '1');
INSERT INTO `t_district` VALUES ('3148', '610122', '蓝田县', '610100', '3148', '1');
INSERT INTO `t_district` VALUES ('3149', '610124', '周至县', '610100', '3149', '1');
INSERT INTO `t_district` VALUES ('3150', '610125', '户　县', '610100', '3150', '1');
INSERT INTO `t_district` VALUES ('3151', '610126', '高陵县', '610100', '3151', '1');
INSERT INTO `t_district` VALUES ('3152', '610201', '市辖区', '610200', '3152', '1');
INSERT INTO `t_district` VALUES ('3153', '610202', '王益区', '610200', '3153', '1');
INSERT INTO `t_district` VALUES ('3154', '610203', '印台区', '610200', '3154', '1');
INSERT INTO `t_district` VALUES ('3155', '610204', '耀州区', '610200', '3155', '1');
INSERT INTO `t_district` VALUES ('3156', '610222', '宜君县', '610200', '3156', '1');
INSERT INTO `t_district` VALUES ('3157', '610301', '市辖区', '610300', '3157', '1');
INSERT INTO `t_district` VALUES ('3158', '610302', '渭滨区', '610300', '3158', '1');
INSERT INTO `t_district` VALUES ('3159', '610303', '金台区', '610300', '3159', '1');
INSERT INTO `t_district` VALUES ('3160', '610304', '陈仓区', '610300', '3160', '1');
INSERT INTO `t_district` VALUES ('3161', '610322', '凤翔县', '610300', '3161', '1');
INSERT INTO `t_district` VALUES ('3162', '610323', '岐山县', '610300', '3162', '1');
INSERT INTO `t_district` VALUES ('3163', '610324', '扶风县', '610300', '3163', '1');
INSERT INTO `t_district` VALUES ('3164', '610326', '眉　县', '610300', '3164', '1');
INSERT INTO `t_district` VALUES ('3165', '610327', '陇　县', '610300', '3165', '1');
INSERT INTO `t_district` VALUES ('3166', '610328', '千阳县', '610300', '3166', '1');
INSERT INTO `t_district` VALUES ('3167', '610329', '麟游县', '610300', '3167', '1');
INSERT INTO `t_district` VALUES ('3168', '610330', '凤　县', '610300', '3168', '1');
INSERT INTO `t_district` VALUES ('3169', '610331', '太白县', '610300', '3169', '1');
INSERT INTO `t_district` VALUES ('3170', '610401', '市辖区', '610400', '3170', '1');
INSERT INTO `t_district` VALUES ('3171', '610402', '秦都区', '610400', '3171', '1');
INSERT INTO `t_district` VALUES ('3172', '610403', '杨凌区', '610400', '3172', '1');
INSERT INTO `t_district` VALUES ('3173', '610404', '渭城区', '610400', '3173', '1');
INSERT INTO `t_district` VALUES ('3174', '610422', '三原县', '610400', '3174', '1');
INSERT INTO `t_district` VALUES ('3175', '610423', '泾阳县', '610400', '3175', '1');
INSERT INTO `t_district` VALUES ('3176', '610424', '乾　县', '610400', '3176', '1');
INSERT INTO `t_district` VALUES ('3177', '610425', '礼泉县', '610400', '3177', '1');
INSERT INTO `t_district` VALUES ('3178', '610426', '永寿县', '610400', '3178', '1');
INSERT INTO `t_district` VALUES ('3179', '610427', '彬　县', '610400', '3179', '1');
INSERT INTO `t_district` VALUES ('3180', '610428', '长武县', '610400', '3180', '1');
INSERT INTO `t_district` VALUES ('3181', '610429', '旬邑县', '610400', '3181', '1');
INSERT INTO `t_district` VALUES ('3182', '610430', '淳化县', '610400', '3182', '1');
INSERT INTO `t_district` VALUES ('3183', '610431', '武功县', '610400', '3183', '1');
INSERT INTO `t_district` VALUES ('3184', '610481', '兴平市', '610400', '3184', '1');
INSERT INTO `t_district` VALUES ('3185', '610501', '市辖区', '610500', '3185', '1');
INSERT INTO `t_district` VALUES ('3186', '610502', '临渭区', '610500', '3186', '1');
INSERT INTO `t_district` VALUES ('3187', '610521', '华　县', '610500', '3187', '1');
INSERT INTO `t_district` VALUES ('3188', '610522', '潼关县', '610500', '3188', '1');
INSERT INTO `t_district` VALUES ('3189', '610523', '大荔县', '610500', '3189', '1');
INSERT INTO `t_district` VALUES ('3190', '610524', '合阳县', '610500', '3190', '1');
INSERT INTO `t_district` VALUES ('3191', '610525', '澄城县', '610500', '3191', '1');
INSERT INTO `t_district` VALUES ('3192', '610526', '蒲城县', '610500', '3192', '1');
INSERT INTO `t_district` VALUES ('3193', '610527', '白水县', '610500', '3193', '1');
INSERT INTO `t_district` VALUES ('3194', '610528', '富平县', '610500', '3194', '1');
INSERT INTO `t_district` VALUES ('3195', '610581', '韩城市', '610500', '3195', '1');
INSERT INTO `t_district` VALUES ('3196', '610582', '华阴市', '610500', '3196', '1');
INSERT INTO `t_district` VALUES ('3197', '610601', '市辖区', '610600', '3197', '1');
INSERT INTO `t_district` VALUES ('3198', '610602', '宝塔区', '610600', '3198', '1');
INSERT INTO `t_district` VALUES ('3199', '610621', '延长县', '610600', '3199', '1');
INSERT INTO `t_district` VALUES ('3200', '610622', '延川县', '610600', '3200', '1');
INSERT INTO `t_district` VALUES ('3201', '610623', '子长县', '610600', '3201', '1');
INSERT INTO `t_district` VALUES ('3202', '610624', '安塞县', '610600', '3202', '1');
INSERT INTO `t_district` VALUES ('3203', '610625', '志丹县', '610600', '3203', '1');
INSERT INTO `t_district` VALUES ('3204', '610626', '吴旗县', '610600', '3204', '1');
INSERT INTO `t_district` VALUES ('3205', '610627', '甘泉县', '610600', '3205', '1');
INSERT INTO `t_district` VALUES ('3206', '610628', '富　县', '610600', '3206', '1');
INSERT INTO `t_district` VALUES ('3207', '610629', '洛川县', '610600', '3207', '1');
INSERT INTO `t_district` VALUES ('3208', '610630', '宜川县', '610600', '3208', '1');
INSERT INTO `t_district` VALUES ('3209', '610631', '黄龙县', '610600', '3209', '1');
INSERT INTO `t_district` VALUES ('3210', '610632', '黄陵县', '610600', '3210', '1');
INSERT INTO `t_district` VALUES ('3211', '610701', '市辖区', '610700', '3211', '1');
INSERT INTO `t_district` VALUES ('3212', '610702', '汉台区', '610700', '3212', '1');
INSERT INTO `t_district` VALUES ('3213', '610721', '南郑县', '610700', '3213', '1');
INSERT INTO `t_district` VALUES ('3214', '610722', '城固县', '610700', '3214', '1');
INSERT INTO `t_district` VALUES ('3215', '610723', '洋　县', '610700', '3215', '1');
INSERT INTO `t_district` VALUES ('3216', '610724', '西乡县', '610700', '3216', '1');
INSERT INTO `t_district` VALUES ('3217', '610725', '勉　县', '610700', '3217', '1');
INSERT INTO `t_district` VALUES ('3218', '610726', '宁强县', '610700', '3218', '1');
INSERT INTO `t_district` VALUES ('3219', '610727', '略阳县', '610700', '3219', '1');
INSERT INTO `t_district` VALUES ('3220', '610728', '镇巴县', '610700', '3220', '1');
INSERT INTO `t_district` VALUES ('3221', '610729', '留坝县', '610700', '3221', '1');
INSERT INTO `t_district` VALUES ('3222', '610730', '佛坪县', '610700', '3222', '1');
INSERT INTO `t_district` VALUES ('3223', '610801', '市辖区', '610800', '3223', '1');
INSERT INTO `t_district` VALUES ('3224', '610802', '榆阳区', '610800', '3224', '1');
INSERT INTO `t_district` VALUES ('3225', '610821', '神木县', '610800', '3225', '1');
INSERT INTO `t_district` VALUES ('3226', '610822', '府谷县', '610800', '3226', '1');
INSERT INTO `t_district` VALUES ('3227', '610823', '横山县', '610800', '3227', '1');
INSERT INTO `t_district` VALUES ('3228', '610824', '靖边县', '610800', '3228', '1');
INSERT INTO `t_district` VALUES ('3229', '610825', '定边县', '610800', '3229', '1');
INSERT INTO `t_district` VALUES ('3230', '610826', '绥德县', '610800', '3230', '1');
INSERT INTO `t_district` VALUES ('3231', '610827', '米脂县', '610800', '3231', '1');
INSERT INTO `t_district` VALUES ('3232', '610828', '佳　县', '610800', '3232', '1');
INSERT INTO `t_district` VALUES ('3233', '610829', '吴堡县', '610800', '3233', '1');
INSERT INTO `t_district` VALUES ('3234', '610830', '清涧县', '610800', '3234', '1');
INSERT INTO `t_district` VALUES ('3235', '610831', '子洲县', '610800', '3235', '1');
INSERT INTO `t_district` VALUES ('3236', '610901', '市辖区', '610900', '3236', '1');
INSERT INTO `t_district` VALUES ('3237', '610902', '汉滨区', '610900', '3237', '1');
INSERT INTO `t_district` VALUES ('3238', '610921', '汉阴县', '610900', '3238', '1');
INSERT INTO `t_district` VALUES ('3239', '610922', '石泉县', '610900', '3239', '1');
INSERT INTO `t_district` VALUES ('3240', '610923', '宁陕县', '610900', '3240', '1');
INSERT INTO `t_district` VALUES ('3241', '610924', '紫阳县', '610900', '3241', '1');
INSERT INTO `t_district` VALUES ('3242', '610925', '岚皋县', '610900', '3242', '1');
INSERT INTO `t_district` VALUES ('3243', '610926', '平利县', '610900', '3243', '1');
INSERT INTO `t_district` VALUES ('3244', '610927', '镇坪县', '610900', '3244', '1');
INSERT INTO `t_district` VALUES ('3245', '610928', '旬阳县', '610900', '3245', '1');
INSERT INTO `t_district` VALUES ('3246', '610929', '白河县', '610900', '3246', '1');
INSERT INTO `t_district` VALUES ('3247', '611001', '市辖区', '611000', '3247', '1');
INSERT INTO `t_district` VALUES ('3248', '611002', '商州区', '611000', '3248', '1');
INSERT INTO `t_district` VALUES ('3249', '611021', '洛南县', '611000', '3249', '1');
INSERT INTO `t_district` VALUES ('3250', '611022', '丹凤县', '611000', '3250', '1');
INSERT INTO `t_district` VALUES ('3251', '611023', '商南县', '611000', '3251', '1');
INSERT INTO `t_district` VALUES ('3252', '611024', '山阳县', '611000', '3252', '1');
INSERT INTO `t_district` VALUES ('3253', '611025', '镇安县', '611000', '3253', '1');
INSERT INTO `t_district` VALUES ('3254', '611026', '柞水县', '611000', '3254', '1');
INSERT INTO `t_district` VALUES ('3255', '620101', '市辖区', '620100', '3255', '1');
INSERT INTO `t_district` VALUES ('3256', '620102', '城关区', '620100', '3256', '1');
INSERT INTO `t_district` VALUES ('3257', '620103', '七里河区', '620100', '3257', '1');
INSERT INTO `t_district` VALUES ('3258', '620104', '西固区', '620100', '3258', '1');
INSERT INTO `t_district` VALUES ('3259', '620105', '安宁区', '620100', '3259', '1');
INSERT INTO `t_district` VALUES ('3260', '620111', '红古区', '620100', '3260', '1');
INSERT INTO `t_district` VALUES ('3261', '620121', '永登县', '620100', '3261', '1');
INSERT INTO `t_district` VALUES ('3262', '620122', '皋兰县', '620100', '3262', '1');
INSERT INTO `t_district` VALUES ('3263', '620123', '榆中县', '620100', '3263', '1');
INSERT INTO `t_district` VALUES ('3264', '620201', '市辖区', '620200', '3264', '1');
INSERT INTO `t_district` VALUES ('3265', '620301', '市辖区', '620300', '3265', '1');
INSERT INTO `t_district` VALUES ('3266', '620302', '金川区', '620300', '3266', '1');
INSERT INTO `t_district` VALUES ('3267', '620321', '永昌县', '620300', '3267', '1');
INSERT INTO `t_district` VALUES ('3268', '620401', '市辖区', '620400', '3268', '1');
INSERT INTO `t_district` VALUES ('3269', '620402', '白银区', '620400', '3269', '1');
INSERT INTO `t_district` VALUES ('3270', '620403', '平川区', '620400', '3270', '1');
INSERT INTO `t_district` VALUES ('3271', '620421', '靖远县', '620400', '3271', '1');
INSERT INTO `t_district` VALUES ('3272', '620422', '会宁县', '620400', '3272', '1');
INSERT INTO `t_district` VALUES ('3273', '620423', '景泰县', '620400', '3273', '1');
INSERT INTO `t_district` VALUES ('3274', '620501', '市辖区', '620500', '3274', '1');
INSERT INTO `t_district` VALUES ('3275', '620502', '秦城区', '620500', '3275', '1');
INSERT INTO `t_district` VALUES ('3276', '620503', '北道区', '620500', '3276', '1');
INSERT INTO `t_district` VALUES ('3277', '620521', '清水县', '620500', '3277', '1');
INSERT INTO `t_district` VALUES ('3278', '620522', '秦安县', '620500', '3278', '1');
INSERT INTO `t_district` VALUES ('3279', '620523', '甘谷县', '620500', '3279', '1');
INSERT INTO `t_district` VALUES ('3280', '620524', '武山县', '620500', '3280', '1');
INSERT INTO `t_district` VALUES ('3281', '620525', '张家川回族自治县', '620500', '3281', '1');
INSERT INTO `t_district` VALUES ('3282', '620601', '市辖区', '620600', '3282', '1');
INSERT INTO `t_district` VALUES ('3283', '620602', '凉州区', '620600', '3283', '1');
INSERT INTO `t_district` VALUES ('3284', '620621', '民勤县', '620600', '3284', '1');
INSERT INTO `t_district` VALUES ('3285', '620622', '古浪县', '620600', '3285', '1');
INSERT INTO `t_district` VALUES ('3286', '620623', '天祝藏族自治县', '620600', '3286', '1');
INSERT INTO `t_district` VALUES ('3287', '620701', '市辖区', '620700', '3287', '1');
INSERT INTO `t_district` VALUES ('3288', '620702', '甘州区', '620700', '3288', '1');
INSERT INTO `t_district` VALUES ('3289', '620721', '肃南裕固族自治县', '620700', '3289', '1');
INSERT INTO `t_district` VALUES ('3290', '620722', '民乐县', '620700', '3290', '1');
INSERT INTO `t_district` VALUES ('3291', '620723', '临泽县', '620700', '3291', '1');
INSERT INTO `t_district` VALUES ('3292', '620724', '高台县', '620700', '3292', '1');
INSERT INTO `t_district` VALUES ('3293', '620725', '山丹县', '620700', '3293', '1');
INSERT INTO `t_district` VALUES ('3294', '620801', '市辖区', '620800', '3294', '1');
INSERT INTO `t_district` VALUES ('3295', '620802', '崆峒区', '620800', '3295', '1');
INSERT INTO `t_district` VALUES ('3296', '620821', '泾川县', '620800', '3296', '1');
INSERT INTO `t_district` VALUES ('3297', '620822', '灵台县', '620800', '3297', '1');
INSERT INTO `t_district` VALUES ('3298', '620823', '崇信县', '620800', '3298', '1');
INSERT INTO `t_district` VALUES ('3299', '620824', '华亭县', '620800', '3299', '1');
INSERT INTO `t_district` VALUES ('3300', '620825', '庄浪县', '620800', '3300', '1');
INSERT INTO `t_district` VALUES ('3301', '620826', '静宁县', '620800', '3301', '1');
INSERT INTO `t_district` VALUES ('3302', '620901', '市辖区', '620900', '3302', '1');
INSERT INTO `t_district` VALUES ('3303', '620902', '肃州区', '620900', '3303', '1');
INSERT INTO `t_district` VALUES ('3304', '620921', '金塔县', '620900', '3304', '1');
INSERT INTO `t_district` VALUES ('3305', '620922', '安西县', '620900', '3305', '1');
INSERT INTO `t_district` VALUES ('3306', '620923', '肃北蒙古族自治县', '620900', '3306', '1');
INSERT INTO `t_district` VALUES ('3307', '620924', '阿克塞哈萨克族自治县', '620900', '3307', '1');
INSERT INTO `t_district` VALUES ('3308', '620981', '玉门市', '620900', '3308', '1');
INSERT INTO `t_district` VALUES ('3309', '620982', '敦煌市', '620900', '3309', '1');
INSERT INTO `t_district` VALUES ('3310', '621001', '市辖区', '621000', '3310', '1');
INSERT INTO `t_district` VALUES ('3311', '621002', '西峰区', '621000', '3311', '1');
INSERT INTO `t_district` VALUES ('3312', '621021', '庆城县', '621000', '3312', '1');
INSERT INTO `t_district` VALUES ('3313', '621022', '环　县', '621000', '3313', '1');
INSERT INTO `t_district` VALUES ('3314', '621023', '华池县', '621000', '3314', '1');
INSERT INTO `t_district` VALUES ('3315', '621024', '合水县', '621000', '3315', '1');
INSERT INTO `t_district` VALUES ('3316', '621025', '正宁县', '621000', '3316', '1');
INSERT INTO `t_district` VALUES ('3317', '621026', '宁　县', '621000', '3317', '1');
INSERT INTO `t_district` VALUES ('3318', '621027', '镇原县', '621000', '3318', '1');
INSERT INTO `t_district` VALUES ('3319', '621101', '市辖区', '621100', '3319', '1');
INSERT INTO `t_district` VALUES ('3320', '621102', '安定区', '621100', '3320', '1');
INSERT INTO `t_district` VALUES ('3321', '621121', '通渭县', '621100', '3321', '1');
INSERT INTO `t_district` VALUES ('3322', '621122', '陇西县', '621100', '3322', '1');
INSERT INTO `t_district` VALUES ('3323', '621123', '渭源县', '621100', '3323', '1');
INSERT INTO `t_district` VALUES ('3324', '621124', '临洮县', '621100', '3324', '1');
INSERT INTO `t_district` VALUES ('3325', '621125', '漳　县', '621100', '3325', '1');
INSERT INTO `t_district` VALUES ('3326', '621126', '岷　县', '621100', '3326', '1');
INSERT INTO `t_district` VALUES ('3327', '621201', '市辖区', '621200', '3327', '1');
INSERT INTO `t_district` VALUES ('3328', '621202', '武都区', '621200', '3328', '1');
INSERT INTO `t_district` VALUES ('3329', '621221', '成　县', '621200', '3329', '1');
INSERT INTO `t_district` VALUES ('3330', '621222', '文　县', '621200', '3330', '1');
INSERT INTO `t_district` VALUES ('3331', '621223', '宕昌县', '621200', '3331', '1');
INSERT INTO `t_district` VALUES ('3332', '621224', '康　县', '621200', '3332', '1');
INSERT INTO `t_district` VALUES ('3333', '621225', '西和县', '621200', '3333', '1');
INSERT INTO `t_district` VALUES ('3334', '621226', '礼　县', '621200', '3334', '1');
INSERT INTO `t_district` VALUES ('3335', '621227', '徽　县', '621200', '3335', '1');
INSERT INTO `t_district` VALUES ('3336', '621228', '两当县', '621200', '3336', '1');
INSERT INTO `t_district` VALUES ('3337', '622901', '临夏市', '622900', '3337', '1');
INSERT INTO `t_district` VALUES ('3338', '622921', '临夏县', '622900', '3338', '1');
INSERT INTO `t_district` VALUES ('3339', '622922', '康乐县', '622900', '3339', '1');
INSERT INTO `t_district` VALUES ('3340', '622923', '永靖县', '622900', '3340', '1');
INSERT INTO `t_district` VALUES ('3341', '622924', '广河县', '622900', '3341', '1');
INSERT INTO `t_district` VALUES ('3342', '622925', '和政县', '622900', '3342', '1');
INSERT INTO `t_district` VALUES ('3343', '622926', '东乡族自治县', '622900', '3343', '1');
INSERT INTO `t_district` VALUES ('3344', '622927', '积石山保安族东乡族撒拉族自治县', '622900', '3344', '1');
INSERT INTO `t_district` VALUES ('3345', '623001', '合作市', '623000', '3345', '1');
INSERT INTO `t_district` VALUES ('3346', '623021', '临潭县', '623000', '3346', '1');
INSERT INTO `t_district` VALUES ('3347', '623022', '卓尼县', '623000', '3347', '1');
INSERT INTO `t_district` VALUES ('3348', '623023', '舟曲县', '623000', '3348', '1');
INSERT INTO `t_district` VALUES ('3349', '623024', '迭部县', '623000', '3349', '1');
INSERT INTO `t_district` VALUES ('3350', '623025', '玛曲县', '623000', '3350', '1');
INSERT INTO `t_district` VALUES ('3351', '623026', '碌曲县', '623000', '3351', '1');
INSERT INTO `t_district` VALUES ('3352', '623027', '夏河县', '623000', '3352', '1');
INSERT INTO `t_district` VALUES ('3353', '630101', '市辖区', '630100', '3353', '1');
INSERT INTO `t_district` VALUES ('3354', '630102', '城东区', '630100', '3354', '1');
INSERT INTO `t_district` VALUES ('3355', '630103', '城中区', '630100', '3355', '1');
INSERT INTO `t_district` VALUES ('3356', '630104', '城西区', '630100', '3356', '1');
INSERT INTO `t_district` VALUES ('3357', '630105', '城北区', '630100', '3357', '1');
INSERT INTO `t_district` VALUES ('3358', '630121', '大通回族土族自治县', '630100', '3358', '1');
INSERT INTO `t_district` VALUES ('3359', '630122', '湟中县', '630100', '3359', '1');
INSERT INTO `t_district` VALUES ('3360', '630123', '湟源县', '630100', '3360', '1');
INSERT INTO `t_district` VALUES ('3361', '632121', '平安县', '632100', '3361', '1');
INSERT INTO `t_district` VALUES ('3362', '632122', '民和回族土族自治县', '632100', '3362', '1');
INSERT INTO `t_district` VALUES ('3363', '632123', '乐都县', '632100', '3363', '1');
INSERT INTO `t_district` VALUES ('3364', '632126', '互助土族自治县', '632100', '3364', '1');
INSERT INTO `t_district` VALUES ('3365', '632127', '化隆回族自治县', '632100', '3365', '1');
INSERT INTO `t_district` VALUES ('3366', '632128', '循化撒拉族自治县', '632100', '3366', '1');
INSERT INTO `t_district` VALUES ('3367', '632221', '门源回族自治县', '632200', '3367', '1');
INSERT INTO `t_district` VALUES ('3368', '632222', '祁连县', '632200', '3368', '1');
INSERT INTO `t_district` VALUES ('3369', '632223', '海晏县', '632200', '3369', '1');
INSERT INTO `t_district` VALUES ('3370', '632224', '刚察县', '632200', '3370', '1');
INSERT INTO `t_district` VALUES ('3371', '632321', '同仁县', '632300', '3371', '1');
INSERT INTO `t_district` VALUES ('3372', '632322', '尖扎县', '632300', '3372', '1');
INSERT INTO `t_district` VALUES ('3373', '632323', '泽库县', '632300', '3373', '1');
INSERT INTO `t_district` VALUES ('3374', '632324', '河南蒙古族自治县', '632300', '3374', '1');
INSERT INTO `t_district` VALUES ('3375', '632521', '共和县', '632500', '3375', '1');
INSERT INTO `t_district` VALUES ('3376', '632522', '同德县', '632500', '3376', '1');
INSERT INTO `t_district` VALUES ('3377', '632523', '贵德县', '632500', '3377', '1');
INSERT INTO `t_district` VALUES ('3378', '632524', '兴海县', '632500', '3378', '1');
INSERT INTO `t_district` VALUES ('3379', '632525', '贵南县', '632500', '3379', '1');
INSERT INTO `t_district` VALUES ('3380', '632621', '玛沁县', '632600', '3380', '1');
INSERT INTO `t_district` VALUES ('3381', '632622', '班玛县', '632600', '3381', '1');
INSERT INTO `t_district` VALUES ('3382', '632623', '甘德县', '632600', '3382', '1');
INSERT INTO `t_district` VALUES ('3383', '632624', '达日县', '632600', '3383', '1');
INSERT INTO `t_district` VALUES ('3384', '632625', '久治县', '632600', '3384', '1');
INSERT INTO `t_district` VALUES ('3385', '632626', '玛多县', '632600', '3385', '1');
INSERT INTO `t_district` VALUES ('3386', '632721', '玉树县', '632700', '3386', '1');
INSERT INTO `t_district` VALUES ('3387', '632722', '杂多县', '632700', '3387', '1');
INSERT INTO `t_district` VALUES ('3388', '632723', '称多县', '632700', '3388', '1');
INSERT INTO `t_district` VALUES ('3389', '632724', '治多县', '632700', '3389', '1');
INSERT INTO `t_district` VALUES ('3390', '632725', '囊谦县', '632700', '3390', '1');
INSERT INTO `t_district` VALUES ('3391', '632726', '曲麻莱县', '632700', '3391', '1');
INSERT INTO `t_district` VALUES ('3392', '632801', '格尔木市', '632800', '3392', '1');
INSERT INTO `t_district` VALUES ('3393', '632802', '德令哈市', '632800', '3393', '1');
INSERT INTO `t_district` VALUES ('3394', '632821', '乌兰县', '632800', '3394', '1');
INSERT INTO `t_district` VALUES ('3395', '632822', '都兰县', '632800', '3395', '1');
INSERT INTO `t_district` VALUES ('3396', '632823', '天峻县', '632800', '3396', '1');
INSERT INTO `t_district` VALUES ('3397', '640101', '市辖区', '640100', '3397', '1');
INSERT INTO `t_district` VALUES ('3398', '640104', '兴庆区', '640100', '3398', '1');
INSERT INTO `t_district` VALUES ('3399', '640105', '西夏区', '640100', '3399', '1');
INSERT INTO `t_district` VALUES ('3400', '640106', '金凤区', '640100', '3400', '1');
INSERT INTO `t_district` VALUES ('3401', '640121', '永宁县', '640100', '3401', '1');
INSERT INTO `t_district` VALUES ('3402', '640122', '贺兰县', '640100', '3402', '1');
INSERT INTO `t_district` VALUES ('3403', '640181', '灵武市', '640100', '3403', '1');
INSERT INTO `t_district` VALUES ('3404', '640201', '市辖区', '640200', '3404', '1');
INSERT INTO `t_district` VALUES ('3405', '640202', '大武口区', '640200', '3405', '1');
INSERT INTO `t_district` VALUES ('3406', '640205', '惠农区', '640200', '3406', '1');
INSERT INTO `t_district` VALUES ('3407', '640221', '平罗县', '640200', '3407', '1');
INSERT INTO `t_district` VALUES ('3408', '640301', '市辖区', '640300', '3408', '1');
INSERT INTO `t_district` VALUES ('3409', '640302', '利通区', '640300', '3409', '1');
INSERT INTO `t_district` VALUES ('3410', '640323', '盐池县', '640300', '3410', '1');
INSERT INTO `t_district` VALUES ('3411', '640324', '同心县', '640300', '3411', '1');
INSERT INTO `t_district` VALUES ('3412', '640381', '青铜峡市', '640300', '3412', '1');
INSERT INTO `t_district` VALUES ('3413', '640401', '市辖区', '640400', '3413', '1');
INSERT INTO `t_district` VALUES ('3414', '640402', '原州区', '640400', '3414', '1');
INSERT INTO `t_district` VALUES ('3415', '640422', '西吉县', '640400', '3415', '1');
INSERT INTO `t_district` VALUES ('3416', '640423', '隆德县', '640400', '3416', '1');
INSERT INTO `t_district` VALUES ('3417', '640424', '泾源县', '640400', '3417', '1');
INSERT INTO `t_district` VALUES ('3418', '640425', '彭阳县', '640400', '3418', '1');
INSERT INTO `t_district` VALUES ('3419', '640501', '市辖区', '640500', '3419', '1');
INSERT INTO `t_district` VALUES ('3420', '640502', '沙坡头区', '640500', '3420', '1');
INSERT INTO `t_district` VALUES ('3421', '640521', '中宁县', '640500', '3421', '1');
INSERT INTO `t_district` VALUES ('3422', '640522', '海原县', '640500', '3422', '1');
INSERT INTO `t_district` VALUES ('3423', '650101', '市辖区', '650100', '3423', '1');
INSERT INTO `t_district` VALUES ('3424', '650102', '天山区', '650100', '3424', '1');
INSERT INTO `t_district` VALUES ('3425', '650103', '沙依巴克区', '650100', '3425', '1');
INSERT INTO `t_district` VALUES ('3426', '650104', '新市区', '650100', '3426', '1');
INSERT INTO `t_district` VALUES ('3427', '650105', '水磨沟区', '650100', '3427', '1');
INSERT INTO `t_district` VALUES ('3428', '650106', '头屯河区', '650100', '3428', '1');
INSERT INTO `t_district` VALUES ('3429', '650107', '达坂城区', '650100', '3429', '1');
INSERT INTO `t_district` VALUES ('3430', '650108', '东山区', '650100', '3430', '1');
INSERT INTO `t_district` VALUES ('3431', '650121', '乌鲁木齐县', '650100', '3431', '1');
INSERT INTO `t_district` VALUES ('3432', '650201', '市辖区', '650200', '3432', '1');
INSERT INTO `t_district` VALUES ('3433', '650202', '独山子区', '650200', '3433', '1');
INSERT INTO `t_district` VALUES ('3434', '650203', '克拉玛依区', '650200', '3434', '1');
INSERT INTO `t_district` VALUES ('3435', '650204', '白碱滩区', '650200', '3435', '1');
INSERT INTO `t_district` VALUES ('3436', '650205', '乌尔禾区', '650200', '3436', '1');
INSERT INTO `t_district` VALUES ('3437', '652101', '吐鲁番市', '652100', '3437', '1');
INSERT INTO `t_district` VALUES ('3438', '652122', '鄯善县', '652100', '3438', '1');
INSERT INTO `t_district` VALUES ('3439', '652123', '托克逊县', '652100', '3439', '1');
INSERT INTO `t_district` VALUES ('3440', '652201', '哈密市', '652200', '3440', '1');
INSERT INTO `t_district` VALUES ('3441', '652222', '巴里坤哈萨克自治县', '652200', '3441', '1');
INSERT INTO `t_district` VALUES ('3442', '652223', '伊吾县', '652200', '3442', '1');
INSERT INTO `t_district` VALUES ('3443', '652301', '昌吉市', '652300', '3443', '1');
INSERT INTO `t_district` VALUES ('3444', '652302', '阜康市', '652300', '3444', '1');
INSERT INTO `t_district` VALUES ('3445', '652303', '米泉市', '652300', '3445', '1');
INSERT INTO `t_district` VALUES ('3446', '652323', '呼图壁县', '652300', '3446', '1');
INSERT INTO `t_district` VALUES ('3447', '652324', '玛纳斯县', '652300', '3447', '1');
INSERT INTO `t_district` VALUES ('3448', '652325', '奇台县', '652300', '3448', '1');
INSERT INTO `t_district` VALUES ('3449', '652327', '吉木萨尔县', '652300', '3449', '1');
INSERT INTO `t_district` VALUES ('3450', '652328', '木垒哈萨克自治县', '652300', '3450', '1');
INSERT INTO `t_district` VALUES ('3451', '652701', '博乐市', '652700', '3451', '1');
INSERT INTO `t_district` VALUES ('3452', '652722', '精河县', '652700', '3452', '1');
INSERT INTO `t_district` VALUES ('3453', '652723', '温泉县', '652700', '3453', '1');
INSERT INTO `t_district` VALUES ('3454', '652801', '库尔勒市', '652800', '3454', '1');
INSERT INTO `t_district` VALUES ('3455', '652822', '轮台县', '652800', '3455', '1');
INSERT INTO `t_district` VALUES ('3456', '652823', '尉犁县', '652800', '3456', '1');
INSERT INTO `t_district` VALUES ('3457', '652824', '若羌县', '652800', '3457', '1');
INSERT INTO `t_district` VALUES ('3458', '652825', '且末县', '652800', '3458', '1');
INSERT INTO `t_district` VALUES ('3459', '652826', '焉耆回族自治县', '652800', '3459', '1');
INSERT INTO `t_district` VALUES ('3460', '652827', '和静县', '652800', '3460', '1');
INSERT INTO `t_district` VALUES ('3461', '652828', '和硕县', '652800', '3461', '1');
INSERT INTO `t_district` VALUES ('3462', '652829', '博湖县', '652800', '3462', '1');
INSERT INTO `t_district` VALUES ('3463', '652901', '阿克苏市', '652900', '3463', '1');
INSERT INTO `t_district` VALUES ('3464', '652922', '温宿县', '652900', '3464', '1');
INSERT INTO `t_district` VALUES ('3465', '652923', '库车县', '652900', '3465', '1');
INSERT INTO `t_district` VALUES ('3466', '652924', '沙雅县', '652900', '3466', '1');
INSERT INTO `t_district` VALUES ('3467', '652925', '新和县', '652900', '3467', '1');
INSERT INTO `t_district` VALUES ('3468', '652926', '拜城县', '652900', '3468', '1');
INSERT INTO `t_district` VALUES ('3469', '652927', '乌什县', '652900', '3469', '1');
INSERT INTO `t_district` VALUES ('3470', '652928', '阿瓦提县', '652900', '3470', '1');
INSERT INTO `t_district` VALUES ('3471', '652929', '柯坪县', '652900', '3471', '1');
INSERT INTO `t_district` VALUES ('3472', '653001', '阿图什市', '653000', '3472', '1');
INSERT INTO `t_district` VALUES ('3473', '653022', '阿克陶县', '653000', '3473', '1');
INSERT INTO `t_district` VALUES ('3474', '653023', '阿合奇县', '653000', '3474', '1');
INSERT INTO `t_district` VALUES ('3475', '653024', '乌恰县', '653000', '3475', '1');
INSERT INTO `t_district` VALUES ('3476', '653101', '喀什市', '653100', '3476', '1');
INSERT INTO `t_district` VALUES ('3477', '653121', '疏附县', '653100', '3477', '1');
INSERT INTO `t_district` VALUES ('3478', '653122', '疏勒县', '653100', '3478', '1');
INSERT INTO `t_district` VALUES ('3479', '653123', '英吉沙县', '653100', '3479', '1');
INSERT INTO `t_district` VALUES ('3480', '653124', '泽普县', '653100', '3480', '1');
INSERT INTO `t_district` VALUES ('3481', '653125', '莎车县', '653100', '3481', '1');
INSERT INTO `t_district` VALUES ('3482', '653126', '叶城县', '653100', '3482', '1');
INSERT INTO `t_district` VALUES ('3483', '653127', '麦盖提县', '653100', '3483', '1');
INSERT INTO `t_district` VALUES ('3484', '653128', '岳普湖县', '653100', '3484', '1');
INSERT INTO `t_district` VALUES ('3485', '653129', '伽师县', '653100', '3485', '1');
INSERT INTO `t_district` VALUES ('3486', '653130', '巴楚县', '653100', '3486', '1');
INSERT INTO `t_district` VALUES ('3487', '653131', '塔什库尔干塔吉克自治县', '653100', '3487', '1');
INSERT INTO `t_district` VALUES ('3488', '653201', '和田市', '653200', '3488', '1');
INSERT INTO `t_district` VALUES ('3489', '653221', '和田县', '653200', '3489', '1');
INSERT INTO `t_district` VALUES ('3490', '653222', '墨玉县', '653200', '3490', '1');
INSERT INTO `t_district` VALUES ('3491', '653223', '皮山县', '653200', '3491', '1');
INSERT INTO `t_district` VALUES ('3492', '653224', '洛浦县', '653200', '3492', '1');
INSERT INTO `t_district` VALUES ('3493', '653225', '策勒县', '653200', '3493', '1');
INSERT INTO `t_district` VALUES ('3494', '653226', '于田县', '653200', '3494', '1');
INSERT INTO `t_district` VALUES ('3495', '653227', '民丰县', '653200', '3495', '1');
INSERT INTO `t_district` VALUES ('3496', '654002', '伊宁市', '654000', '3496', '1');
INSERT INTO `t_district` VALUES ('3497', '654003', '奎屯市', '654000', '3497', '1');
INSERT INTO `t_district` VALUES ('3498', '654021', '伊宁县', '654000', '3498', '1');
INSERT INTO `t_district` VALUES ('3499', '654022', '察布查尔锡伯自治县', '654000', '3499', '1');
INSERT INTO `t_district` VALUES ('3500', '654023', '霍城县', '654000', '3500', '1');
INSERT INTO `t_district` VALUES ('3501', '654024', '巩留县', '654000', '3501', '1');
INSERT INTO `t_district` VALUES ('3502', '654025', '新源县', '654000', '3502', '1');
INSERT INTO `t_district` VALUES ('3503', '654026', '昭苏县', '654000', '3503', '1');
INSERT INTO `t_district` VALUES ('3504', '654027', '特克斯县', '654000', '3504', '1');
INSERT INTO `t_district` VALUES ('3505', '654028', '尼勒克县', '654000', '3505', '1');
INSERT INTO `t_district` VALUES ('3506', '654201', '塔城市', '654200', '3506', '1');
INSERT INTO `t_district` VALUES ('3507', '654202', '乌苏市', '654200', '3507', '1');
INSERT INTO `t_district` VALUES ('3508', '654221', '额敏县', '654200', '3508', '1');
INSERT INTO `t_district` VALUES ('3509', '654223', '沙湾县', '654200', '3509', '1');
INSERT INTO `t_district` VALUES ('3510', '654224', '托里县', '654200', '3510', '1');
INSERT INTO `t_district` VALUES ('3511', '654225', '裕民县', '654200', '3511', '1');
INSERT INTO `t_district` VALUES ('3512', '654226', '和布克赛尔蒙古自治县', '654200', '3512', '1');
INSERT INTO `t_district` VALUES ('3513', '654301', '阿勒泰市', '654300', '3513', '1');
INSERT INTO `t_district` VALUES ('3514', '654321', '布尔津县', '654300', '3514', '1');
INSERT INTO `t_district` VALUES ('3515', '654322', '富蕴县', '654300', '3515', '1');
INSERT INTO `t_district` VALUES ('3516', '654323', '福海县', '654300', '3516', '1');
INSERT INTO `t_district` VALUES ('3517', '654324', '哈巴河县', '654300', '3517', '1');
INSERT INTO `t_district` VALUES ('3518', '654325', '青河县', '654300', '3518', '1');
INSERT INTO `t_district` VALUES ('3519', '654326', '吉木乃县', '654300', '3519', '1');
INSERT INTO `t_district` VALUES ('3520', '659001', '石河子市', '659000', '3520', '1');
INSERT INTO `t_district` VALUES ('3521', '659002', '阿拉尔市', '659000', '3521', '1');
INSERT INTO `t_district` VALUES ('3522', '659003', '图木舒克市', '659000', '3522', '1');
INSERT INTO `t_district` VALUES ('3523', '659004', '五家渠市', '659000', '3523', '1');
INSERT INTO `t_district` VALUES ('3900', '690000', '新疆生产建设兵团', '000000', '3900', '1');
INSERT INTO `t_district` VALUES ('3901', '690100', '第一师', '690000', '3901', '1');
INSERT INTO `t_district` VALUES ('3902', '690200', '第二师', '690000', '3902', '1');
INSERT INTO `t_district` VALUES ('3903', '690300', '第三师', '690000', '3903', '1');
INSERT INTO `t_district` VALUES ('3904', '690400', '第四师', '690000', '3904', '1');
INSERT INTO `t_district` VALUES ('3905', '690500', '第五师', '690000', '3905', '1');
INSERT INTO `t_district` VALUES ('3906', '690600', '第六师', '690000', '3906', '1');
INSERT INTO `t_district` VALUES ('3907', '690700', '第七师', '690000', '3907', '1');
INSERT INTO `t_district` VALUES ('3908', '690800', '第八师', '690000', '3908', '1');
INSERT INTO `t_district` VALUES ('3909', '690900', '第九师', '690000', '3909', '1');
INSERT INTO `t_district` VALUES ('3910', '691000', '第十师', '690000', '3910', '1');
INSERT INTO `t_district` VALUES ('3911', '691100', '第十一师', '690000', '3911', '1');
INSERT INTO `t_district` VALUES ('3912', '691200', '第十二师', '690000', '3912', '1');
INSERT INTO `t_district` VALUES ('3913', '691300', '第十三师', '690000', '3913', '1');
INSERT INTO `t_district` VALUES ('3914', '691400', '第十四师', '690000', '3914', '1');
INSERT INTO `t_district` VALUES ('3915', '690101', '1团', '690100', '390101', '1');
INSERT INTO `t_district` VALUES ('3916', '690102', '2团', '690100', '390102', '1');
INSERT INTO `t_district` VALUES ('3917', '690103', '3团', '690100', '390103', '1');
INSERT INTO `t_district` VALUES ('3918', '690104', '4团', '690100', '390104', '1');
INSERT INTO `t_district` VALUES ('3919', '690105', '5团', '690100', '390105', '1');
INSERT INTO `t_district` VALUES ('3920', '690106', '6团', '690100', '390106', '1');
INSERT INTO `t_district` VALUES ('3921', '690107', '7团', '690100', '390107', '1');
INSERT INTO `t_district` VALUES ('3922', '690108', '8团', '690100', '390108', '1');
INSERT INTO `t_district` VALUES ('3923', '690109', '10团', '690100', '390109', '1');
INSERT INTO `t_district` VALUES ('3924', '690110', '11团', '690100', '390110', '1');
INSERT INTO `t_district` VALUES ('3925', '690111', '12团', '690100', '390111', '1');
INSERT INTO `t_district` VALUES ('3926', '690112', '13团', '690100', '390112', '1');
INSERT INTO `t_district` VALUES ('3927', '690113', '14团', '690100', '390113', '1');
INSERT INTO `t_district` VALUES ('3928', '690114', '16团', '690100', '390114', '1');
INSERT INTO `t_district` VALUES ('3929', '690115', '塔水处', '690100', '390115', '1');
INSERT INTO `t_district` VALUES ('3930', '690116', '水工处', '690100', '390116', '1');
INSERT INTO `t_district` VALUES ('3931', '690201', '21团', '690200', '390201', '1');
INSERT INTO `t_district` VALUES ('3932', '690202', '22团', '690200', '390202', '1');
INSERT INTO `t_district` VALUES ('3933', '690203', '23团', '690200', '390203', '1');
INSERT INTO `t_district` VALUES ('3934', '690204', '24团', '690200', '390204', '1');
INSERT INTO `t_district` VALUES ('3935', '690205', '25团', '690200', '390205', '1');
INSERT INTO `t_district` VALUES ('3936', '690206', '26团', '690200', '390206', '1');
INSERT INTO `t_district` VALUES ('3937', '690207', '27团', '690200', '390207', '1');
INSERT INTO `t_district` VALUES ('3938', '690208', '28团', '690200', '390208', '1');
INSERT INTO `t_district` VALUES ('3939', '690209', '29团', '690200', '390209', '1');
INSERT INTO `t_district` VALUES ('3940', '690210', '30团', '690200', '390210', '1');
INSERT INTO `t_district` VALUES ('3941', '690211', '31团', '690200', '390211', '1');
INSERT INTO `t_district` VALUES ('3942', '690212', '32团', '690200', '390212', '1');
INSERT INTO `t_district` VALUES ('3943', '690213', '33团', '690200', '390213', '1');
INSERT INTO `t_district` VALUES ('3944', '690214', '34团', '690200', '390214', '1');
INSERT INTO `t_district` VALUES ('3945', '690215', '35团', '690200', '390215', '1');
INSERT INTO `t_district` VALUES ('3946', '690216', '36团', '690200', '390216', '1');
INSERT INTO `t_district` VALUES ('3947', '690217', '36团', '690200', '390217', '1');
INSERT INTO `t_district` VALUES ('3948', '690218', '38团', '690200', '390218', '1');
INSERT INTO `t_district` VALUES ('3949', '690219', '223团', '690200', '390219', '1');
INSERT INTO `t_district` VALUES ('3950', '690220', '且末支队', '690200', '390220', '1');
INSERT INTO `t_district` VALUES ('3951', '690301', '41团', '690300', '390301', '1');
INSERT INTO `t_district` VALUES ('3952', '690302', '42团', '690300', '390302', '1');
INSERT INTO `t_district` VALUES ('3953', '690303', '44团', '690300', '390303', '1');
INSERT INTO `t_district` VALUES ('3954', '690304', '45团', '690300', '390304', '1');
INSERT INTO `t_district` VALUES ('3955', '690305', '46团', '690300', '390305', '1');
INSERT INTO `t_district` VALUES ('3956', '690306', '48团', '690300', '390306', '1');
INSERT INTO `t_district` VALUES ('3957', '690307', '49团', '690300', '390307', '1');
INSERT INTO `t_district` VALUES ('3958', '690308', '50团', '690300', '390308', '1');
INSERT INTO `t_district` VALUES ('3959', '690309', '51团', '690300', '390309', '1');
INSERT INTO `t_district` VALUES ('3960', '690310', '53团', '690300', '390310', '1');
INSERT INTO `t_district` VALUES ('3961', '690311', '伽师总场', '690300', '390311', '1');
INSERT INTO `t_district` VALUES ('3962', '690312', '东风农场', '690300', '390312', '1');
INSERT INTO `t_district` VALUES ('3963', '690313', '红旗农场', '690300', '390313', '1');
INSERT INTO `t_district` VALUES ('3964', '690314', '托云牧场', '690300', '390314', '1');
INSERT INTO `t_district` VALUES ('3965', '690315', '叶城二牧场', '690300', '390315', '1');
INSERT INTO `t_district` VALUES ('3966', '690401', '61团', '690400', '390401', '1');
INSERT INTO `t_district` VALUES ('3967', '690402', '62团', '690400', '390402', '1');
INSERT INTO `t_district` VALUES ('3968', '690403', '63团', '690400', '390403', '1');
INSERT INTO `t_district` VALUES ('3969', '690404', '64团', '690400', '390404', '1');
INSERT INTO `t_district` VALUES ('3970', '690405', '65团', '690400', '390405', '1');
INSERT INTO `t_district` VALUES ('3971', '690406', '66团', '690400', '390406', '1');
INSERT INTO `t_district` VALUES ('3972', '690407', '67团', '690400', '390407', '1');
INSERT INTO `t_district` VALUES ('3973', '690408', '68团', '690400', '390408', '1');
INSERT INTO `t_district` VALUES ('3974', '690409', '69团', '690400', '390409', '1');
INSERT INTO `t_district` VALUES ('3975', '690410', '70团', '690400', '390410', '1');
INSERT INTO `t_district` VALUES ('3976', '690411', '71团', '690400', '390411', '1');
INSERT INTO `t_district` VALUES ('3977', '690412', '72团', '690400', '390412', '1');
INSERT INTO `t_district` VALUES ('3978', '690413', '72团', '690400', '390413', '1');
INSERT INTO `t_district` VALUES ('3979', '690414', '73团', '690400', '390414', '1');
INSERT INTO `t_district` VALUES ('3980', '690415', '74团', '690400', '390415', '1');
INSERT INTO `t_district` VALUES ('3981', '690416', '75团', '690400', '390416', '1');
INSERT INTO `t_district` VALUES ('3982', '690417', '76团', '690400', '390417', '1');
INSERT INTO `t_district` VALUES ('3983', '690418', '77团', '690400', '390418', '1');
INSERT INTO `t_district` VALUES ('3984', '690419', '78团', '690400', '390419', '1');
INSERT INTO `t_district` VALUES ('3985', '690420', '79团', '690400', '390420', '1');
INSERT INTO `t_district` VALUES ('3986', '690421', '拜什墩农场', '690400', '390421', '1');
INSERT INTO `t_district` VALUES ('3987', '690422', '良繁场', '690400', '390422', '1');
INSERT INTO `t_district` VALUES ('3988', '690501', '81团', '690500', '390501', '1');
INSERT INTO `t_district` VALUES ('3989', '690502', '82团', '690500', '390502', '1');
INSERT INTO `t_district` VALUES ('3990', '690503', '83团', '690500', '390503', '1');
INSERT INTO `t_district` VALUES ('3991', '690504', '84团', '690500', '390504', '1');
INSERT INTO `t_district` VALUES ('3992', '690505', '85团', '690500', '390505', '1');
INSERT INTO `t_district` VALUES ('3993', '690506', '86团', '690500', '390506', '1');
INSERT INTO `t_district` VALUES ('3994', '690507', '87团', '690500', '390507', '1');
INSERT INTO `t_district` VALUES ('3995', '690508', '88团', '690500', '390508', '1');
INSERT INTO `t_district` VALUES ('3996', '690509', '89团', '690500', '390509', '1');
INSERT INTO `t_district` VALUES ('3997', '690510', '89团', '690500', '390510', '1');
INSERT INTO `t_district` VALUES ('3998', '690511', '90团', '690500', '390511', '1');
INSERT INTO `t_district` VALUES ('3999', '690512', '91团', '690500', '390512', '1');
INSERT INTO `t_district` VALUES ('4000', '690601', '101团', '690600', '390601', '1');
INSERT INTO `t_district` VALUES ('4001', '690602', '102团', '690600', '390602', '1');
INSERT INTO `t_district` VALUES ('4002', '690603', '103团', '690600', '390603', '1');
INSERT INTO `t_district` VALUES ('4003', '690604', '105团', '690600', '390604', '1');
INSERT INTO `t_district` VALUES ('4004', '690605', '106团', '690600', '390605', '1');
INSERT INTO `t_district` VALUES ('4005', '690606', '芳草湖农场', '690600', '390606', '1');
INSERT INTO `t_district` VALUES ('4006', '690607', '新湖农场', '690600', '390607', '1');
INSERT INTO `t_district` VALUES ('4007', '690608', '军户农场', '690600', '390608', '1');
INSERT INTO `t_district` VALUES ('4008', '690609', '共青团农场', '690600', '390609', '1');
INSERT INTO `t_district` VALUES ('4009', '690610', '六运湖农场', '690600', '390610', '1');
INSERT INTO `t_district` VALUES ('4010', '690611', '土墩子农场', '690600', '390611', '1');
INSERT INTO `t_district` VALUES ('4011', '690612', '红旗农场', '690600', '390612', '1');
INSERT INTO `t_district` VALUES ('4012', '690613', '奇台农场', '690600', '390613', '1');
INSERT INTO `t_district` VALUES ('4013', '690614', '北塔山牧场', '690600', '390614', '1');
INSERT INTO `t_district` VALUES ('4014', '690615', '大黄山社区', '690600', '390615', '1');
INSERT INTO `t_district` VALUES ('4015', '690616', '十三户社区', '690600', '390616', '1');
INSERT INTO `t_district` VALUES ('4016', '690701', '123团', '690700', '390701', '1');
INSERT INTO `t_district` VALUES ('4017', '690702', '124团', '690700', '390702', '1');
INSERT INTO `t_district` VALUES ('4018', '690703', '125团', '690700', '390703', '1');
INSERT INTO `t_district` VALUES ('4019', '690704', '126团', '690700', '390704', '1');
INSERT INTO `t_district` VALUES ('4020', '690705', '127团', '690700', '390705', '1');
INSERT INTO `t_district` VALUES ('4021', '690706', '128团', '690700', '390706', '1');
INSERT INTO `t_district` VALUES ('4022', '690707', '129团', '690700', '390707', '1');
INSERT INTO `t_district` VALUES ('4023', '690708', '130团', '690700', '390708', '1');
INSERT INTO `t_district` VALUES ('4024', '690709', '131团', '690700', '390709', '1');
INSERT INTO `t_district` VALUES ('4025', '690710', '137团', '690700', '390710', '1');
INSERT INTO `t_district` VALUES ('4026', '690801', '121团', '690800', '390801', '1');
INSERT INTO `t_district` VALUES ('4027', '690802', '132团', '690800', '390802', '1');
INSERT INTO `t_district` VALUES ('4028', '690803', '133团', '690800', '390803', '1');
INSERT INTO `t_district` VALUES ('4029', '690804', '134团', '690800', '390804', '1');
INSERT INTO `t_district` VALUES ('4030', '690805', '135团', '690800', '390805', '1');
INSERT INTO `t_district` VALUES ('4031', '690806', '136团', '690800', '390806', '1');
INSERT INTO `t_district` VALUES ('4032', '690807', '141团', '690800', '390807', '1');
INSERT INTO `t_district` VALUES ('4033', '690808', '142团', '690800', '390808', '1');
INSERT INTO `t_district` VALUES ('4034', '690809', '143团', '690800', '390809', '1');
INSERT INTO `t_district` VALUES ('4035', '690810', '144团', '690800', '390810', '1');
INSERT INTO `t_district` VALUES ('4036', '690811', '石总场', '690800', '390811', '1');
INSERT INTO `t_district` VALUES ('4037', '690812', '147团', '690800', '390812', '1');
INSERT INTO `t_district` VALUES ('4038', '690813', '148团', '690800', '390813', '1');
INSERT INTO `t_district` VALUES ('4039', '690814', '149团', '690800', '390814', '1');
INSERT INTO `t_district` VALUES ('4040', '690815', '150团', '690800', '390815', '1');
INSERT INTO `t_district` VALUES ('4041', '690816', '151团', '690800', '390816', '1');
INSERT INTO `t_district` VALUES ('4042', '690817', '152团', '690800', '390817', '1');
INSERT INTO `t_district` VALUES ('4043', '690901', '161团', '690900', '390901', '1');
INSERT INTO `t_district` VALUES ('4044', '690902', '162团', '690900', '390902', '1');
INSERT INTO `t_district` VALUES ('4045', '690903', '163团', '690900', '390903', '1');
INSERT INTO `t_district` VALUES ('4046', '690904', '164团', '690900', '390904', '1');
INSERT INTO `t_district` VALUES ('4047', '690905', '165团', '690900', '390905', '1');
INSERT INTO `t_district` VALUES ('4048', '690906', '166团', '690900', '390906', '1');
INSERT INTO `t_district` VALUES ('4049', '690907', '167团', '690900', '390907', '1');
INSERT INTO `t_district` VALUES ('4050', '690908', '168团', '690900', '390908', '1');
INSERT INTO `t_district` VALUES ('4051', '690909', '169团', '690900', '390909', '1');
INSERT INTO `t_district` VALUES ('4052', '690910', '170团', '690900', '390910', '1');
INSERT INTO `t_district` VALUES ('4053', '690911', '团结农场', '690900', '390911', '1');
INSERT INTO `t_district` VALUES ('4054', '691001', '181团', '691000', '391001', '1');
INSERT INTO `t_district` VALUES ('4055', '691002', '182团', '691000', '391002', '1');
INSERT INTO `t_district` VALUES ('4056', '691003', '183团', '691000', '391003', '1');
INSERT INTO `t_district` VALUES ('4057', '691004', '184团', '691000', '391004', '1');
INSERT INTO `t_district` VALUES ('4058', '691005', '184团', '691000', '391005', '1');
INSERT INTO `t_district` VALUES ('4059', '691006', '185团', '691000', '391006', '1');
INSERT INTO `t_district` VALUES ('4060', '691007', '186团', '691000', '391007', '1');
INSERT INTO `t_district` VALUES ('4061', '691008', '187团', '691000', '391008', '1');
INSERT INTO `t_district` VALUES ('4062', '691009', '188团', '691000', '391009', '1');
INSERT INTO `t_district` VALUES ('4063', '691201', '104团', '691200', '391201', '1');
INSERT INTO `t_district` VALUES ('4064', '691202', '221团', '691200', '391202', '1');
INSERT INTO `t_district` VALUES ('4065', '691203', '西山农场', '691200', '391203', '1');
INSERT INTO `t_district` VALUES ('4066', '691204', '五一农场', '691200', '391204', '1');
INSERT INTO `t_district` VALUES ('4067', '691205', '三坪农场', '691200', '391205', '1');
INSERT INTO `t_district` VALUES ('4068', '691206', '头屯河农场', '691200', '391206', '1');
INSERT INTO `t_district` VALUES ('4069', '691207', '养禽场', '691200', '391207', '1');
INSERT INTO `t_district` VALUES ('4070', '691301', '红星一场', '691300', '391301', '1');
INSERT INTO `t_district` VALUES ('4071', '691302', '红星二场', '691300', '391302', '1');
INSERT INTO `t_district` VALUES ('4072', '691303', '红星三场', '691300', '391303', '1');
INSERT INTO `t_district` VALUES ('4073', '691304', '红星四场', '691300', '391304', '1');
INSERT INTO `t_district` VALUES ('4074', '691305', '黄田农场', '691300', '391305', '1');
INSERT INTO `t_district` VALUES ('4075', '691306', '火箭农场', '691300', '391306', '1');
INSERT INTO `t_district` VALUES ('4076', '691307', '柳树泉农场', '691300', '391307', '1');
INSERT INTO `t_district` VALUES ('4077', '691308', '红星一牧场', '691300', '391308', '1');
INSERT INTO `t_district` VALUES ('4078', '691309', '红星二牧场', '691300', '391309', '1');
INSERT INTO `t_district` VALUES ('4079', '691310', '红山农场', '691300', '391310', '1');
INSERT INTO `t_district` VALUES ('4080', '691311', '淖毛湖农场', '691300', '391311', '1');
INSERT INTO `t_district` VALUES ('4081', '691401', '47团', '691400', '391401', '1');
INSERT INTO `t_district` VALUES ('4082', '691402', '皮山农场', '691400', '391402', '1');
INSERT INTO `t_district` VALUES ('4083', '691403', '一牧场', '691400', '391403', '1');
INSERT INTO `t_district` VALUES ('4084', '691404', '224团', '691400', '391404', '1');

-- ----------------------------
-- Table structure for t_manage_company
-- ----------------------------
DROP TABLE IF EXISTS `t_manage_company`;
CREATE TABLE `t_manage_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `useNum` varchar(5) DEFAULT NULL,
  `creat_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manage_company
-- ----------------------------

-- ----------------------------
-- Table structure for t_member_commodity
-- ----------------------------
DROP TABLE IF EXISTS `t_member_commodity`;
CREATE TABLE `t_member_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_member_id` int(11) DEFAULT NULL COMMENT '关联id',
  `company_id` int(11) DEFAULT NULL COMMENT '商户ID',
  `consume_cash` int(255) DEFAULT NULL COMMENT '消费金额',
  `pay_cash` int(255) DEFAULT NULL COMMENT '实收金额',
  `consume_time` timestamp NULL DEFAULT NULL COMMENT '消费时间',
  `is_delete` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除 1(删除)0(不删除)',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  `commodity_id` int(11) DEFAULT NULL COMMENT '商品id',
  `number` int(11) DEFAULT NULL COMMENT '剩余次数',
  `promotion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='消费记录';

-- ----------------------------
-- Records of t_member_commodity
-- ----------------------------
INSERT INTO `t_member_commodity` VALUES ('1', '3', '6', '300', '0', '2017-07-20 21:25:54', '0', '17', '2', '63', null);
INSERT INTO `t_member_commodity` VALUES ('2', '3', '6', '900', '0', '2017-07-20 21:25:55', '0', '17', '1', '98', null);
INSERT INTO `t_member_commodity` VALUES ('3', '3', '6', '111', '0', '2017-07-20 21:25:57', '0', '17', '4', '22', null);

-- ----------------------------
-- Table structure for t_member_consume
-- ----------------------------
DROP TABLE IF EXISTS `t_member_consume`;
CREATE TABLE `t_member_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_member_id` int(11) DEFAULT NULL COMMENT '关联id',
  `company_id` int(11) DEFAULT NULL COMMENT '商户ID',
  `consume_cash` int(255) DEFAULT NULL COMMENT '消费金额',
  `pay_cash` int(255) DEFAULT NULL COMMENT '实收金额',
  `consume_time` timestamp NULL DEFAULT NULL COMMENT '消费时间',
  `is_delete` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除 1(删除)0(不删除)',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  `commodity_id` int(11) DEFAULT NULL COMMENT '商品id',
  `consume_number` int(11) DEFAULT NULL COMMENT '消费次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='消费记录';

-- ----------------------------
-- Records of t_member_consume
-- ----------------------------
INSERT INTO `t_member_consume` VALUES ('1', '3', '6', '300', '0', '2017-07-20 21:25:54', '0', '14', '2', '66');
INSERT INTO `t_member_consume` VALUES ('2', '3', '6', '900', '0', '2017-07-20 21:25:55', '0', '14', '3', '99');
INSERT INTO `t_member_consume` VALUES ('3', '3', '6', '100', '0', '2017-07-20 21:25:57', '0', '14', '4', '22');
INSERT INTO `t_member_consume` VALUES ('4', '3', '6', '5', '0', '2017-07-20 21:25:59', '0', '14', '1', '11');
INSERT INTO `t_member_consume` VALUES ('5', '9', '6', '1', '0', '2017-09-02 21:34:22', '0', '17', '3', '0');
INSERT INTO `t_member_consume` VALUES ('6', '9', '6', '900', '0', '2017-09-02 21:35:33', '0', '17', '1', '0');
INSERT INTO `t_member_consume` VALUES ('7', '9', '6', '11', '0', '2017-09-04 20:31:13', '0', '17', '3', '0');
INSERT INTO `t_member_consume` VALUES ('8', '9', '6', '1', '0', '2017-09-04 20:57:40', '0', '17', '3', '1');
INSERT INTO `t_member_consume` VALUES ('9', '9', '6', '900', '0', '2017-09-04 20:58:26', '0', '17', '1', '1');
INSERT INTO `t_member_consume` VALUES ('10', '9', '6', '900', '0', '2017-09-04 20:58:52', '0', '17', '1', '1');
INSERT INTO `t_member_consume` VALUES ('11', '9', '6', '900', '0', '2017-09-04 21:04:04', '0', '17', '1', '1');
INSERT INTO `t_member_consume` VALUES ('12', '9', '6', '900', '0', '2017-09-05 21:34:16', '0', '17', '1', '1');

-- ----------------------------
-- Table structure for t_member_recharge
-- ----------------------------
DROP TABLE IF EXISTS `t_member_recharge`;
CREATE TABLE `t_member_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_member_id` int(11) DEFAULT NULL COMMENT '��ԱID',
  `company_id` int(11) DEFAULT NULL COMMENT '�̻�ID',
  `recharge_cash` int(255) DEFAULT NULL COMMENT '��ֵ���',
  `pay_cash` int(255) DEFAULT NULL COMMENT 'ʵ�ս��',
  `recharge_time` timestamp NULL DEFAULT NULL COMMENT '��ֵʱ��',
  `is_delete` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '�Ƿ�ɾ��',
  `user_id` int(11) DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='充值记录';

-- ----------------------------
-- Records of t_member_recharge
-- ----------------------------
INSERT INTO `t_member_recharge` VALUES ('1', '3', '6', '100', '0', '2017-07-20 21:24:27', '0', '14');
INSERT INTO `t_member_recharge` VALUES ('2', '3', '6', '200', '0', '2017-07-20 21:24:30', '0', '14');
INSERT INTO `t_member_recharge` VALUES ('3', '3', '6', '100', '0', '2017-07-20 21:24:31', '0', '14');
INSERT INTO `t_member_recharge` VALUES ('4', '3', '6', '11', '0', '2017-07-20 21:24:35', '0', '14');
INSERT INTO `t_member_recharge` VALUES ('5', '9', '6', '1', '0', '2017-09-02 20:54:54', '0', '17');
INSERT INTO `t_member_recharge` VALUES ('6', '9', '6', '1', '0', '2017-09-02 20:57:42', '0', '17');
INSERT INTO `t_member_recharge` VALUES ('7', '9', '6', '1', '0', '2017-09-02 20:58:56', '0', '17');
INSERT INTO `t_member_recharge` VALUES ('8', '9', '6', '1', '0', '2017-09-02 21:02:28', '0', '17');

-- ----------------------------
-- Table structure for t_reg_verification
-- ----------------------------
DROP TABLE IF EXISTS `t_reg_verification`;
CREATE TABLE `t_reg_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleman_id` int(11) DEFAULT NULL,
  `invitation_code` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `creat_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invitation_code` (`invitation_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邀请码';

-- ----------------------------
-- Records of t_reg_verification
-- ----------------------------
INSERT INTO `t_reg_verification` VALUES ('2', '50', '420441', '0', '2018-08-19 22:12:26', null);
INSERT INTO `t_reg_verification` VALUES ('3', '54', '274046', '0', '2018-08-19 22:25:56', null);

-- ----------------------------
-- Table structure for t_saleman
-- ----------------------------
DROP TABLE IF EXISTS `t_saleman`;
CREATE TABLE `t_saleman` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `invitation_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `state` varchar(2) DEFAULT NULL COMMENT '业务员状态：0：禁用  1：启用',
  `register_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='业务员信息扩展表';

-- ----------------------------
-- Records of t_saleman
-- ----------------------------
INSERT INTO `t_saleman` VALUES ('25', null, '1', '2017-03-13 13:57:03');
INSERT INTO `t_saleman` VALUES ('31', null, '1', '2017-03-14 12:21:40');
INSERT INTO `t_saleman` VALUES ('50', null, '0', '2018-08-19 22:06:05');
INSERT INTO `t_saleman` VALUES ('54', null, '0', '2018-08-19 22:25:49');

-- ----------------------------
-- Table structure for t_transaction_commodity
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_commodity`;
CREATE TABLE `t_transaction_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `commodity_id` int(11) DEFAULT NULL COMMENT '商品主键',
  `transation_id` int(11) DEFAULT NULL COMMENT '交易记录主键',
  `is_delete` varchar(2) DEFAULT '1' COMMENT '是否删除：0是1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_transaction_commodity
-- ----------------------------

-- ----------------------------
-- Table structure for t_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `t_transaction_record`;
CREATE TABLE `t_transaction_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serialnumber` varchar(200) NOT NULL COMMENT '交易序列号',
  `price` double(20,2) NOT NULL COMMENT '应收',
  `get_money` double(20,2) NOT NULL COMMENT '实收',
  `return_money` double(20,2) DEFAULT NULL COMMENT '找零',
  `pay_type` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `company_id` int(11) NOT NULL COMMENT '企业ID',
  `user_id` int(11) NOT NULL COMMENT '收银员',
  `pay_user` varchar(50) DEFAULT NULL COMMENT '支付人',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '交易时间',
  `is_delete` varchar(2) NOT NULL DEFAULT '1' COMMENT '是否删除：0是1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_transaction_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `user_type` varchar(20) DEFAULT NULL COMMENT '用户类型：person个人；company企业;sys：系统用户',
  `state` varchar(2) DEFAULT '1' COMMENT '状态：1启用；0禁用',
  `lastlogin_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `open_id` varchar(50) DEFAULT NULL,
  `union_id` varchar(50) DEFAULT NULL,
  `is_company` varchar(4) DEFAULT '0' COMMENT '0:不是，1：是',
  `is_saleman` varchar(4) DEFAULT '0' COMMENT '0:不是，1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', 'test', '15111111111', 'e10adc3949ba59abbe56e057f20f883e', 'company', '0', '2018-08-19 22:17:30', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('7', 'asdd1', '15111111112', 'e10adc3949ba59abbe56e057f20f883e', 'company', '0', '2018-08-19 22:17:30', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('8', 'asdd2', '15111111113', 'e10adc3949ba59abbe56e057f20f883e', 'company', '0', '2018-08-19 22:17:31', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('9', 'asdd3', '15111111114', 'e10adc3949ba59abbe56e057f20f883e', 'company', '0', '2018-08-19 22:17:31', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('10', 'asdd4', '15111111115', 'e10adc3949ba59abbe56e057f20f883e', 'company', '0', '2018-08-19 22:17:32', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('14', '13456789098', '13456789098', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:32', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('16', 'admin', '13456789092', 'e10adc3949ba59abbe56e057f20f883e', 'sys', '0', '2018-08-19 22:17:33', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('17', 'test111', '13456789096', 'e10adc3949ba59abbe56e057f20f883e', 'person', '0', '2018-08-19 22:17:33', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('19', 'test1112', '13456789333', 'e10adc3949ba59abbe56e057f20f883e', 'sys', '0', '2018-08-19 22:17:34', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('22', '13456789095', '13456789095', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:34', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('23', null, '13456789095', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:34', '111', null, '0', '0');
INSERT INTO `t_user` VALUES ('25', 'test334', '13456789033', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:35', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('26', 'aaa111', '13456789022', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:35', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('27', 'aaa112', '13456789023', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:36', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('28', 'test112', '13456789024', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:36', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('29', 'test113', '13456789234', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:37', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('30', 'aa224', '13456789324', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:37', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('31', 'ad224', '13456789056', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:39', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('32', 'aa46', '13456789322', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:38', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('33', 'asda2223', '13456789098', 'e10adc3949ba59abbe56e057f20f883e', 'person', '1', '2018-08-19 22:17:39', null, null, '0', '0');
INSERT INTO `t_user` VALUES ('50', null, null, null, null, '1', '2018-08-19 22:17:39', '3emtGrE1hXhiLXnW8', null, '0', '0');
INSERT INTO `t_user` VALUES ('51', null, null, null, null, '1', '2018-08-19 22:17:52', '4emtGrE1hXhiLXnW8', null, '0', '0');
INSERT INTO `t_user` VALUES ('52', null, null, null, null, '1', '2018-08-19 22:22:23', '5emtGrE1hXhiLXnW8', null, null, null);
INSERT INTO `t_user` VALUES ('54', null, null, null, null, '1', null, 'o9Eb64scZgt-emtGrE1hXhiLXnW8', null, '0', '0');

-- ----------------------------
-- Table structure for t_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `t_user_follow`;
CREATE TABLE `t_user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `company_id` int(11) DEFAULT NULL COMMENT '商户id',
  `creat_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_follow
-- ----------------------------
INSERT INTO `t_user_follow` VALUES ('1', '17', '6', '2017-08-07 21:10:29');
INSERT INTO `t_user_follow` VALUES ('2', '17', '7', '2017-08-08 21:11:31');
INSERT INTO `t_user_follow` VALUES ('3', '17', '8', '2017-08-01 22:02:36');

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL COMMENT '主键',
  `uc_name` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(2) DEFAULT '2' COMMENT '性别：0男1女2保密',
  `logo` varchar(500) DEFAULT NULL COMMENT '图像',
  `sign` varchar(2000) DEFAULT NULL COMMENT '签名',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  `weixin` varchar(100) DEFAULT NULL COMMENT '微信号',
  `register_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户信息扩展表';

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('6', 'test', null, 'res/images/a1.jpg', null, null, null, '2016-11-18 15:49:53');
INSERT INTO `t_user_info` VALUES ('8', 'admin', '2', 'res/images/a3.jpg', null, null, null, '2017-03-14 12:11:36');
INSERT INTO `t_user_info` VALUES ('9', 'admin', '2', 'res/images/a1.jpg', null, null, null, '2017-03-14 12:15:38');
INSERT INTO `t_user_info` VALUES ('10', 'admin', '2', 'res/images/a2.jpg', null, null, null, '2017-03-14 12:21:11');
INSERT INTO `t_user_info` VALUES ('16', 'admin', '2', 'res/images/a2.jpg', null, null, null, '2016-11-25 17:19:05');
INSERT INTO `t_user_info` VALUES ('17', '好冷11', '2', '1111111', '222', '2017-07-17 20:40:14', '44444', '2016-11-25 17:30:52');
INSERT INTO `t_user_info` VALUES ('19', '好冷', '2', null, null, null, null, '2016-12-09 14:07:44');
INSERT INTO `t_user_info` VALUES ('22', '111', null, null, null, null, null, '2016-12-26 16:12:40');
INSERT INTO `t_user_info` VALUES ('25', 'admin', '2', null, null, null, null, '2017-03-10 10:20:53');
INSERT INTO `t_user_info` VALUES ('26', 'admin', '2', null, null, null, null, '2017-03-14 12:09:41');
INSERT INTO `t_user_info` VALUES ('27', 'admin', '2', null, null, null, null, '2017-03-14 12:10:37');
INSERT INTO `t_user_info` VALUES ('31', 'admin', '2', null, null, null, null, '2017-03-14 12:21:40');
INSERT INTO `t_user_info` VALUES ('32', 'admin', '2', null, null, null, null, '2017-03-14 12:22:02');
INSERT INTO `t_user_info` VALUES ('33', 'admin', '2', null, null, null, null, '2017-03-14 15:42:36');
INSERT INTO `t_user_info` VALUES ('50', '王林', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGseDSYGa0TrlkYYURTgyspGDAicib9I4UKHls07CjqYiaJ9TgqKuOLAns2lfJ1NjrBZiar1gRvMu43w/132', null, null, null, '2018-08-19 21:41:29');
INSERT INTO `t_user_info` VALUES ('51', '王林', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGseDSYGa0TrlkYYURTgyspGDAicib9I4UKHls07CjqYiaJ9TgqKuOLAns2lfJ1NjrBZiar1gRvMu43w/132', null, null, null, '2018-08-19 22:16:02');
INSERT INTO `t_user_info` VALUES ('52', '王林', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGseDSYGa0TrlkYYURTgyspGDAicib9I4UKHls07CjqYiaJ9TgqKuOLAns2lfJ1NjrBZiar1gRvMu43w/132', null, null, null, '2018-08-19 22:18:41');
INSERT INTO `t_user_info` VALUES ('54', '王林', null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGseDSYGa0TrlkYYURTgyspGDAicib9I4UKHls07CjqYiaJ9TgqKuOLAns2lfJ1NjrBZiar1gRvMu43w/132', null, null, null, '2018-08-19 22:25:17');

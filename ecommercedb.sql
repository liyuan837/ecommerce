/*
SQLyog Ultimate v8.32 
MySQL - 5.6.33 : Database - ecommercedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `ecommercedb`;

/*Table structure for table `product_category_relation` */

DROP TABLE IF EXISTS `product_category_relation`;

CREATE TABLE `product_category_relation` (
  `product_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品编号，外键',
  `second_category_id` int(11) DEFAULT NULL COMMENT '商品所述二级分类，外键',
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_buyer_user` */

DROP TABLE IF EXISTS `tb_buyer_user`;

CREATE TABLE `tb_buyer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家用户ID，主键',
  `usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号，外键关联到user表的usercode',
  `nickname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `header_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '头像路径',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `sex` int(1) DEFAULT NULL COMMENT '性别，0表示未知，1表示男，2表示女',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `idcard_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `idcard_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证图片路径',
  `nation` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '籍贯',
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在国家',
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在省份',
  `district` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在区',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在城市',
  `street` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在街道',
  `specific_address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `longitude` decimal(12,6) DEFAULT NULL COMMENT '所在经度',
  `latitude` decimal(12,6) DEFAULT NULL COMMENT '所在纬度',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后一次登陆时间',
  `last_login_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一次登录IP',
  `state` int(1) DEFAULT NULL COMMENT '用户状态',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `master_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家所属的雇主',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='买家用户表';

/*Table structure for table `tb_cart` */

DROP TABLE IF EXISTS `tb_cart`;

CREATE TABLE `tb_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID，主键',
  `product_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `buyer_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家编号',
  `product_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `state` int(11) DEFAULT NULL COMMENT '购物车状态，0表示失效，1表示有效',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  `shop_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属店铺（根据商品判断），外键',
  `master_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属雇主，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_master_user` */

DROP TABLE IF EXISTS `tb_master_user`;

CREATE TABLE `tb_master_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '雇主用户ID，主键',
  `login_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号，外键 关联到user表',
  `nickname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `header_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '头像路径',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `state` int(1) DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='雇主表，每个雇主的超级管理员登录';

/*Table structure for table `tb_product` */

DROP TABLE IF EXISTS `tb_product`;

CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `pic_small_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品小图片',
  `product_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '商品描述',
  `state` int(11) DEFAULT NULL COMMENT '商品状态',
  `origin_price` decimal(60,2) DEFAULT NULL COMMENT '原价',
  `sell_price` decimal(60,2) DEFAULT NULL COMMENT '售价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `sale_volume` int(11) DEFAULT NULL COMMENT '销量',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_user_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  `shop_user_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属店铺，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_product_banner` */

DROP TABLE IF EXISTS `tb_product_banner`;

CREATE TABLE `tb_product_banner` (
  `product_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品编号，外键',
  `banner_sequence` int(11) NOT NULL COMMENT '轮播图次序',
  `banner_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '轮播图路径',
  `banner_note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT NULL,
  `opt_time` datetime DEFAULT NULL,
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`product_code`,`banner_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_product_detail` */

DROP TABLE IF EXISTS `tb_product_detail`;

CREATE TABLE `tb_product_detail` (
  `product_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `detail_sequence` int(11) NOT NULL COMMENT '细节次序',
  `detail_title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '细节标题',
  `detail_content` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '细节内容',
  `detail_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '细节说明',
  `detail_pic` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '细节图片',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`product_code`,`detail_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_product_param` */

DROP TABLE IF EXISTS `tb_product_param`;

CREATE TABLE `tb_product_param` (
  `product_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品编号，外键',
  `param_sequence` int(11) NOT NULL COMMENT '参数次序',
  `param_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `param_value` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`product_code`,`param_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_product_spec` */

DROP TABLE IF EXISTS `tb_product_spec`;

CREATE TABLE `tb_product_spec` (
  `product_code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `spec_sequence` int(11) NOT NULL COMMENT '规格次序',
  `spec_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '规则名称',
  `spec_value` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '规格值，json存储',
  `spec_unit` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '规格单位',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`product_code`,`spec_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_second_category` */

DROP TABLE IF EXISTS `tb_second_category`;

CREATE TABLE `tb_second_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二级分类主键',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分类名',
  `sequence` int(11) DEFAULT NULL COMMENT '出现次序',
  `icon_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '分类图标',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `top_category_id` int(11) DEFAULT NULL COMMENT '所属一级分类，外键',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  `shop_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属店铺，外键',
  `master_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属雇主，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_second_privilege` */

DROP TABLE IF EXISTS `tb_second_privilege`;

CREATE TABLE `tb_second_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '二级权限ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '二级权限名称',
  `icon_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限图标',
  `sequence` int(11) DEFAULT NULL COMMENT '出现次序',
  `has_child` int(1) DEFAULT NULL COMMENT '是否存在子权限，0表示没有，1表示有',
  `func_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '请求路径',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限说明',
  `top_privilege_id` int(11) DEFAULT NULL COMMENT '所属一级权限，外键',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_shop_user` */

DROP TABLE IF EXISTS `tb_shop_user`;

CREATE TABLE `tb_shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺用户ID，主键',
  `login_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名',
  `shop_logo` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺logo',
  `usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号，外键关联到user表的usercode',
  `nickname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `header_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '头像路径',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `sex` int(1) DEFAULT NULL COMMENT '性别，0表示未知，1表示男，2表示女',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `idcard_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `idcard_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证图片路径',
  `nation` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '籍贯',
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在国家',
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在省份',
  `district` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在区',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在城市',
  `street` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在街道',
  `specific_address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `longitude` decimal(12,6) DEFAULT NULL COMMENT '所在经度',
  `latitude` decimal(12,6) DEFAULT NULL COMMENT '所在纬度',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后一次登陆时间',
  `last_login_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一次登录IP',
  `state` int(1) DEFAULT NULL COMMENT '用户状态',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `master_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺所属雇主',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺表';

/*Table structure for table `tb_super_user` */

DROP TABLE IF EXISTS `tb_super_user`;

CREATE TABLE `tb_super_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '雇主用户ID，主键',
  `login_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号，外键 关联到user表',
  `nickname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `header_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '头像路径',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `state` int(1) DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='雇主表，每个雇主的超级管理员登录';

/*Table structure for table `tb_third_privilege` */

DROP TABLE IF EXISTS `tb_third_privilege`;

CREATE TABLE `tb_third_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级权限ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '三级权限名称',
  `icon_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限图标',
  `sequence` int(11) DEFAULT NULL COMMENT '出现次序',
  `has_child` int(1) DEFAULT NULL COMMENT '是否存在子权限，0',
  `func_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '请求路径',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限说明',
  `second_privilege_id` int(11) DEFAULT NULL COMMENT '所属二级权限，外键',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_top_category` */

DROP TABLE IF EXISTS `tb_top_category`;

CREATE TABLE `tb_top_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一级分类主键',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '一级分类名',
  `sequence` int(11) DEFAULT NULL COMMENT '出现次序',
  `icon_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备不描述',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  `shop_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属店铺，外键',
  `master_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '所属雇主，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_top_privilege` */

DROP TABLE IF EXISTS `tb_top_privilege`;

CREATE TABLE `tb_top_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一级权限ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '一级权限名称',
  `icon_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限图标',
  `sequence` int(11) DEFAULT NULL COMMENT '出现次序',
  `has_child` int(1) DEFAULT NULL COMMENT '是否存在子权限，0表示不存在，1表示存在',
  `func_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '如果不存在子权限，则保存请求路径',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '权限说明',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `opt_usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键',
  `usercode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `utype` int(11) DEFAULT NULL COMMENT '用户类型，默认为0表示游客，1表示买家，2表示店铺，3表示总店雇主，4表示超级用户',
  `state` int(11) DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

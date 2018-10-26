/*
SQLyog Ultimate v8.32 
MySQL - 5.6.33-log : Database - ecommercedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `ecommercedb`;

/*Table structure for table `tb_company` */

DROP TABLE IF EXISTS `tb_company`;

CREATE TABLE `tb_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业编号',
  `company_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业名称',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人手机号',
  `real_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人真实姓名',
  `idcard` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人身份证',
  `idcard_img_fore` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份证正面',
  `idcard_img_back` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '身份证反面',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信',
  `weibo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微博',
  `company_logo` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业logo',
  `licence_img` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '营业执照',
  `licence_code` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '统一社会信用代码',
  `company_page` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业主页',
  `address_province` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业位置',
  `address_city` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业位置',
  `address_distinct` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业位置',
  `address_detail` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业位置',
  `company_profile` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业介绍',
  `company_quality` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '企业性质',
  `business_scope` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经营范围',
  `state` int(11) DEFAULT NULL COMMENT '业务状态，',
  `is_delete` int(1) DEFAULT NULL COMMENT '是否已删除，1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `tb_company` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

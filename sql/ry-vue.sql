-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-vue
-- ------------------------------------------------------
-- Server version	5.7.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_number` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batch_number` (`batch_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,'批次A001','2025-01-22 04:45:56','2025-01-22 04:45:56'),(2,'批次B002','2025-01-22 04:45:56','2025-01-22 04:45:56'),(3,'BATCH12345','2025-01-26 05:45:02','2025-01-26 05:45:02'),(4,'BATCH77777','2025-02-06 16:06:29','2025-02-06 16:06:29');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(50) NOT NULL,
  `dict_key` varchar(50) NOT NULL,
  `dict_value` varchar(255) NOT NULL,
  `sort_val` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0：正常；1：禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'角色','0','普通用户',1,0,'2025-01-22 04:45:56','2025-01-22 04:45:56'),(2,'角色','1','管理员',2,0,'2025-01-22 04:45:56','2025-01-22 04:45:56');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'batch','批次',NULL,NULL,'Batch','crud','element-ui','com.ruoyi.medicine','medicine','batch','批次','ruoyi','0','/','{}','admin','2025-01-23 18:12:25','','2025-01-24 00:03:49',NULL),(5,'medicinestorage','药品环境',NULL,NULL,'Medicinestorage','crud','element-ui','com.ruoyi.medicine','medicine','medicinestorage','药品环境','ruoyi','0','/','{}','admin','2025-01-23 18:12:26','','2025-01-24 00:13:19',NULL),(8,'storageenvironment','存放环境',NULL,NULL,'Storageenvironment','crud','element-ui','com.ruoyi.medicine','medicine','storageenvironment','存放环境','ruoyi','0','/','{\"parentMenuId\":0}','admin','2025-01-23 18:12:26','','2025-01-24 00:38:21',NULL),(12,'specificationattribute','规格',NULL,NULL,'Specificationattribute','crud','element-ui','com.ruoyi.medicine','medicine','specificationattribute','药品规格','ruoyi','0','/','{}','admin','2025-01-24 00:29:39','','2025-01-24 00:31:21',NULL),(13,'medicine','药品',NULL,NULL,'Medicine','crud','element-ui','com.ruoyi.medicine','medicine','medicine','药品','ruoyi','0','/','{}','admin','2025-01-24 13:23:39','','2025-01-24 13:25:55',NULL),(14,'medicine_batch','药品-批次-关联表',NULL,NULL,'MedicineBatch','crud','element-ui','com.ruoyi.medicine','medicine','medicinebatch','药品-批次-关联表','ruoyi','0','/','{}','admin','2025-01-26 13:03:59','','2025-01-26 13:05:45',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','批次id','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-23 18:12:26','','2025-01-24 00:03:49'),(2,1,'batch_number','批号','varchar(50)','String','batchNumber','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-23 18:12:26','','2025-01-24 00:03:49'),(3,1,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',3,'admin','2025-01-23 18:12:26','','2025-01-24 00:03:49'),(4,1,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',4,'admin','2025-01-23 18:12:26','','2025-01-24 00:03:49'),(33,5,'id','环境ID','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-23 18:12:26','','2025-01-24 00:13:19'),(34,5,'medicine_id','关联药品表','bigint(20)','Long','medicineId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-23 18:12:26','','2025-01-24 00:13:19'),(35,5,'storage_env_id','关联存放环境表','bigint(20)','Long','storageEnvId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-23 18:12:26','','2025-01-24 00:13:19'),(36,5,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2025-01-23 18:12:26','','2025-01-24 00:13:19'),(37,5,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2025-01-23 18:12:26','','2025-01-24 00:13:19'),(58,8,'id','环境id','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-23 18:12:26','','2025-01-24 00:38:21'),(59,8,'location','地点','varchar(100)','String','location','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-23 18:12:26','','2025-01-24 00:38:21'),(60,8,'temperature','温度','varchar(20)','String','temperature','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-23 18:12:26','','2025-01-24 00:38:21'),(61,8,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2025-01-23 18:12:26','','2025-01-24 00:38:21'),(62,8,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2025-01-23 18:12:26','','2025-01-24 00:38:21'),(85,12,'id','规格id','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-24 00:29:39','','2025-01-24 00:31:21'),(86,12,'attribute_key','规格键','varchar(50)','String','attributeKey','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-24 00:29:39','','2025-01-24 00:31:21'),(87,12,'attribute_value','规格值','varchar(255)','String','attributeValue','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-24 00:29:39','','2025-01-24 00:31:21'),(88,12,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2025-01-24 00:29:39','','2025-01-24 00:31:21'),(89,12,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2025-01-24 00:29:39','','2025-01-24 00:31:21'),(90,13,'id','药品id','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(91,13,'name','名字','varchar(50)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(92,13,'number','编号','bigint(20)','Long','number','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(93,13,'brand','品牌','varchar(50)','String','brand','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(94,13,'specification_attribute_id','关联规格表','bigint(20)','Long','specificationAttributeId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(95,13,'production_date','生产时间','date','Date','productionDate','0','0','0','1','1','1','1','EQ','datetime','',6,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(96,13,'expiry_date','过期时间','date','Date','expiryDate','0','0','0','1','1','1','1','EQ','datetime','',7,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(97,13,'manufacturer','厂商','varchar(50)','String','manufacturer','0','0','0','1','1','1','1','EQ','input','',8,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(98,13,'unit','单位','varchar(20)','String','unit','0','0','0','1','1','1','1','EQ','input','',9,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(99,13,'count','数量','bigint(20)','Long','count','0','0','1','1','1','1','1','EQ','input','',10,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(100,13,'status','0：正常；1：停用','int(11)','Long','status','0','0','1','1','1','1','1','EQ','radio','medicine_status',11,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(101,13,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',12,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(102,13,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2025-01-24 13:23:39','','2025-01-24 13:25:55'),(103,14,'id','关联id','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-26 13:04:00','','2025-01-26 13:05:45'),(104,14,'medicine_id','药品id','bigint(20)','Long','medicineId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-26 13:04:00','','2025-01-26 13:05:45'),(105,14,'batch_id','批次id','bigint(20)','Long','batchId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-26 13:04:00','','2025-01-26 13:05:45'),(106,14,'create_time','创建时间','timestamp','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2025-01-26 13:04:00','','2025-01-26 13:05:45'),(107,14,'update_time','修改时间','timestamp','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2025-01-26 13:04:00','','2025-01-26 13:05:45');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL COMMENT '关联药品表',
  `batch_id` bigint(20) NOT NULL COMMENT '关联批次表',
  `operation_type` int(11) NOT NULL COMMENT '1：入库；2：出库',
  `quantity` int(11) NOT NULL,
  `operator_id` bigint(20) NOT NULL COMMENT '关联用户表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,1,1,100,1,'2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,2,2,2,50,2,'2025-01-22 04:45:21','2025-01-22 04:45:21');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number` bigint(20) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `specification_attribute_id` bigint(20) DEFAULT NULL COMMENT '关联规格表',
  `production_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `count` bigint(20) NOT NULL DEFAULT '0' COMMENT '数量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：正常；1：停用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (8,'感冒灵',1001,'白云山',3,'2025-01-26','2026-01-26','白云山制药厂','盒',100,0,'2025-01-26 05:45:02','2025-01-26 05:45:02'),(9,'测试药品',1004,'ccc',6,'2025-02-04','2025-02-27','ccc','ccc',7,0,'2025-02-06 16:53:52','2025-02-09 17:56:46'),(10,'测试药品2',1005,'ccccc',7,'2025-02-11','2025-02-28','cccccc','cccccc',8,0,'2025-02-06 17:00:54','2025-02-09 17:57:02'),(11,'测试药品',1004,'ccc',NULL,NULL,NULL,'ccc','ccc',20,0,'2025-02-07 09:45:22','2025-02-07 09:45:22'),(12,'测试药品3',1006,'cccccc',8,'2025-02-11','2025-02-21','cccccccccc','cccccccc',98,0,'2025-02-08 17:27:21','2025-02-09 17:57:02');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_batch`
--

DROP TABLE IF EXISTS `medicine_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL,
  `batch_id` bigint(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `medicine_id` (`medicine_id`),
  KEY `batch_id` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_batch`
--

LOCK TABLES `medicine_batch` WRITE;
/*!40000 ALTER TABLE `medicine_batch` DISABLE KEYS */;
INSERT INTO `medicine_batch` VALUES (4,9,4,'2025-02-06 16:53:52','2025-02-06 16:53:52'),(5,10,1,'2025-02-06 17:00:54','2025-02-06 17:00:54'),(6,12,3,'2025-02-08 17:27:21','2025-02-08 17:27:21');
/*!40000 ALTER TABLE `medicine_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicinestorage`
--

DROP TABLE IF EXISTS `medicinestorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicinestorage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL COMMENT '关联药品表',
  `storage_env_id` bigint(20) NOT NULL COMMENT '关联存放环境表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinestorage`
--

LOCK TABLES `medicinestorage` WRITE;
/*!40000 ALTER TABLE `medicinestorage` DISABLE KEYS */;
INSERT INTO `medicinestorage` VALUES (1,9,1,'2025-02-06 16:53:52','2025-02-06 16:53:52'),(2,10,2,'2025-02-06 17:00:54','2025-02-06 17:00:54'),(3,12,2,'2025-02-08 17:27:21','2025-02-08 17:27:21');
/*!40000 ALTER TABLE `medicinestorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL COMMENT '关联药品表',
  `batch_id` bigint(20) NOT NULL COMMENT '关联批次表',
  `play_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `play_user` int(11) NOT NULL COMMENT '关联用户表',
  `planned_quantity` int(11) NOT NULL,
  `received_quantity` int(11) DEFAULT '0',
  `used_quantity` int(11) DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (1,1,1,'2023-10-01 02:00:00',1,100,0,0,'2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,2,2,'2023-10-02 03:00:00',2,50,0,0,'2025-01-22 04:45:21','2025-01-22 04:45:21');
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receive`
--

DROP TABLE IF EXISTS `receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL COMMENT '关联药品表',
  `batch_id` bigint(20) NOT NULL COMMENT '关联批次表',
  `receive_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL,
  `Receive_User` int(11) NOT NULL COMMENT '关联用户表',
  `play_id` int(11) NOT NULL COMMENT '关联计划表',
  `operator_id` bigint(20) NOT NULL COMMENT '关联用户表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receive`
--

LOCK TABLES `receive` WRITE;
/*!40000 ALTER TABLE `receive` DISABLE KEYS */;
INSERT INTO `receive` VALUES (1,1,1,'2023-10-01 06:00:00',20,1,1,1,'2025-01-22 04:45:56','2025-01-22 04:45:56'),(2,2,2,'2023-10-02 07:00:00',10,2,2,2,'2025-01-22 04:45:56','2025-01-22 04:45:56');
/*!40000 ALTER TABLE `receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specificationattribute`
--

DROP TABLE IF EXISTS `specificationattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specificationattribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_key` varchar(50) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specificationattribute`
--

LOCK TABLES `specificationattribute` WRITE;
/*!40000 ALTER TABLE `specificationattribute` DISABLE KEYS */;
INSERT INTO `specificationattribute` VALUES (1,'剂量','10mg','2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,'包装规格','50ml','2025-01-22 04:45:21','2025-01-22 04:45:21'),(3,'规格','10片/盒','2025-01-26 05:45:02','2025-01-26 05:45:02'),(4,'规格','10人/份','2025-01-30 07:56:59','2025-01-30 07:56:59'),(5,'规格','测试','2025-01-30 09:27:12','2025-01-30 09:27:12'),(6,'规格键测试','规格值测试','2025-02-06 16:53:52','2025-02-06 16:53:52'),(7,'规格测试2','规格测试2','2025-02-06 17:00:54','2025-02-06 17:00:54'),(8,'cccccc','ccccc','2025-02-08 17:27:21','2025-02-08 17:27:21');
/*!40000 ALTER TABLE `specificationattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storageenvironment`
--

DROP TABLE IF EXISTS `storageenvironment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storageenvironment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  `temperature` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageenvironment`
--

LOCK TABLES `storageenvironment` WRITE;
/*!40000 ALTER TABLE `storageenvironment` DISABLE KEYS */;
INSERT INTO `storageenvironment` VALUES (1,'仓库A','20°C','2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,'仓库B','15°C','2025-01-22 04:45:21','2025-01-22 04:45:21');
/*!40000 ALTER TABLE `storageenvironment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-01-23 17:28:20','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-01-23 17:28:20','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-01-23 17:28:20','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-01-23 17:28:20','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-01-23 17:28:20','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-01-23 17:28:20','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-23 17:28:19','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-01-23 17:28:20','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-01-23 17:28:20','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-01-23 17:28:20','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-01-23 17:28:20','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-01-23 17:28:20','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-01-23 17:28:20','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-01-23 17:28:20','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-01-23 17:28:20','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-01-23 17:28:20','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-01-23 17:28:20','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-01-23 17:28:20','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-01-23 17:28:20','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-01-23 17:28:20','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-01-23 17:28:20','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-01-23 17:28:20','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-01-23 17:28:20','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-01-23 17:28:20','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-01-23 17:28:20','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-01-23 17:28:20','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-01-23 17:28:20','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-01-23 17:28:20','',NULL,'停用状态'),(30,0,'正常','0','medicine_status',NULL,'default','N','0','admin','2025-01-24 01:24:55','',NULL,NULL),(31,1,'停用','1','medicine_status',NULL,'default','N','0','admin','2025-01-24 01:25:34','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-01-23 17:28:20','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-01-23 17:28:20','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-01-23 17:28:20','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-01-23 17:28:20','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-01-23 17:28:20','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-01-23 17:28:20','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-01-23 17:28:20','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-01-23 17:28:20','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-01-23 17:28:20','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-01-23 17:28:20','',NULL,'登录状态列表'),(11,'药品状态','medicine_status','0','admin','2025-01-24 01:23:39','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-01-23 17:28:20','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-01-23 17:28:20','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-01-23 17:28:20','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-23 17:29:46'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-23 17:51:21'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-23 19:53:56'),(103,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-23 19:53:59'),(104,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-23 19:58:48'),(105,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-23 21:15:36'),(106,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-24 00:01:47'),(107,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-24 01:12:34'),(108,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-24 13:19:26'),(109,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-24 13:21:46'),(110,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-25 02:47:29'),(111,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-26 12:30:31'),(112,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-30 14:43:26'),(113,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-30 16:54:07'),(114,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-02 16:26:12'),(115,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-02 17:34:18'),(116,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-04 17:24:49'),(117,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-02-04 18:24:57'),(118,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-04 18:25:01'),(119,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-04 18:58:18'),(120,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-04 20:27:38'),(121,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-04 21:46:19'),(122,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-06 23:59:46'),(123,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-02-07 00:43:23'),(124,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-02-07 00:43:23'),(125,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-02-07 17:15:29'),(126,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-02-07 17:15:33'),(127,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-02-07 17:15:34'),(128,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-07 17:15:37'),(129,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-07 17:47:02'),(130,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-09 00:12:02'),(131,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2025-02-09 00:23:29'),(132,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-09 00:23:33'),(133,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-09 02:28:20'),(134,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-09 21:12:36'),(135,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-10 01:35:10');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-01-23 17:28:19','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-01-23 17:28:19','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-01-23 17:28:19','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','1','0','','guide','admin','2025-01-23 17:28:19','admin','2025-01-24 00:09:42','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-01-23 17:28:19','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-01-23 17:28:19','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-01-23 17:28:19','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-01-23 17:28:19','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-01-23 17:28:19','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-01-23 17:28:19','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-01-23 17:28:19','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-01-23 17:28:19','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-01-23 17:28:19','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-01-23 17:28:19','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-01-23 17:28:19','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-01-23 17:28:19','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-01-23 17:28:19','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-01-23 17:28:19','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-01-23 17:28:19','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-01-23 17:28:19','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-01-23 17:28:19','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-01-23 17:28:19','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-01-23 17:28:19','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-01-23 17:28:19','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-01-23 17:28:19','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-01-23 17:28:19','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-01-23 17:28:19','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-01-23 17:28:19','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-01-23 17:28:19','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-01-23 17:28:19','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-01-23 17:28:19','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-01-23 17:28:19','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-01-23 17:28:19','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-01-23 17:28:19','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-01-23 17:28:19','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-01-23 17:28:19','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-01-23 17:28:19','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-01-23 17:28:19','',NULL,''),(2000,'药品',0,1,'medicine','medicine/medicine/index',NULL,'',1,0,'C','0','0','medicine:medicine:list','example','admin','2025-01-23 21:24:15','admin','2025-01-24 00:09:14','药品菜单'),(2001,'药品查询',2000,1,'#','',NULL,'',1,0,'F','0','0','medicine:medicine:query','#','admin','2025-01-23 21:24:15','',NULL,''),(2002,'药品新增',2000,2,'#','',NULL,'',1,0,'F','0','0','medicine:medicine:add','#','admin','2025-01-23 21:24:15','',NULL,''),(2003,'药品修改',2000,3,'#','',NULL,'',1,0,'F','0','0','medicine:medicine:edit','#','admin','2025-01-23 21:24:15','',NULL,''),(2004,'药品删除',2000,4,'#','',NULL,'',1,0,'F','0','0','medicine:medicine:remove','#','admin','2025-01-23 21:24:15','',NULL,''),(2005,'药品导出',2000,5,'#','',NULL,'',1,0,'F','0','0','medicine:medicine:export','#','admin','2025-01-23 21:24:15','',NULL,''),(2006,'批次',0,1,'batch','medicine/batch/index',NULL,'',1,0,'C','0','0','medicine:batch:list','example','admin','2025-01-24 00:04:39','admin','2025-01-24 00:09:26','批次菜单'),(2007,'批次查询',2006,1,'#','',NULL,'',1,0,'F','0','0','medicine:batch:query','#','admin','2025-01-24 00:04:39','',NULL,''),(2008,'批次新增',2006,2,'#','',NULL,'',1,0,'F','0','0','medicine:batch:add','#','admin','2025-01-24 00:04:39','',NULL,''),(2009,'批次修改',2006,3,'#','',NULL,'',1,0,'F','0','0','medicine:batch:edit','#','admin','2025-01-24 00:04:39','',NULL,''),(2010,'批次删除',2006,4,'#','',NULL,'',1,0,'F','0','0','medicine:batch:remove','#','admin','2025-01-24 00:04:39','',NULL,''),(2011,'批次导出',2006,5,'#','',NULL,'',1,0,'F','0','0','medicine:batch:export','#','admin','2025-01-24 00:04:39','',NULL,''),(2012,'药品-环境-关联表',0,1,'medicinestorage','medicine/medicinestorage/index',NULL,'',1,0,'C','0','0','medicine:medicinestorage:list','example','admin','2025-01-24 00:16:37','admin','2025-01-24 00:18:29','药品环境菜单'),(2013,'药品环境查询',2012,1,'#','',NULL,'',1,0,'F','0','0','medicine:medicinestorage:query','#','admin','2025-01-24 00:16:37','',NULL,''),(2014,'药品环境新增',2012,2,'#','',NULL,'',1,0,'F','0','0','medicine:medicinestorage:add','#','admin','2025-01-24 00:16:37','',NULL,''),(2015,'药品环境修改',2012,3,'#','',NULL,'',1,0,'F','0','0','medicine:medicinestorage:edit','#','admin','2025-01-24 00:16:37','',NULL,''),(2016,'药品环境删除',2012,4,'#','',NULL,'',1,0,'F','0','0','medicine:medicinestorage:remove','#','admin','2025-01-24 00:16:37','',NULL,''),(2017,'药品环境导出',2012,5,'#','',NULL,'',1,0,'F','0','0','medicine:medicinestorage:export','#','admin','2025-01-24 00:16:37','',NULL,''),(2024,'药品规格',0,1,'specificationattribute','medicine/specificationattribute/index',NULL,'',1,0,'C','0','0','medicine:specificationattribute:list','example','admin','2025-01-24 00:32:14','admin','2025-01-24 00:35:00','药品规格菜单'),(2025,'药品规格查询',2024,1,'#','',NULL,'',1,0,'F','0','0','medicine:specificationattribute:query','#','admin','2025-01-24 00:32:14','',NULL,''),(2026,'药品规格新增',2024,2,'#','',NULL,'',1,0,'F','0','0','medicine:specificationattribute:add','#','admin','2025-01-24 00:32:14','',NULL,''),(2027,'药品规格修改',2024,3,'#','',NULL,'',1,0,'F','0','0','medicine:specificationattribute:edit','#','admin','2025-01-24 00:32:14','',NULL,''),(2028,'药品规格删除',2024,4,'#','',NULL,'',1,0,'F','0','0','medicine:specificationattribute:remove','#','admin','2025-01-24 00:32:14','',NULL,''),(2029,'药品规格导出',2024,5,'#','',NULL,'',1,0,'F','0','0','medicine:specificationattribute:export','#','admin','2025-01-24 00:32:14','',NULL,''),(2030,'存放环境',0,1,'storageenvironment','medicine/storageenvironment/index',NULL,'',1,0,'C','0','0','medicine:storageenvironment:list','example','admin','2025-01-24 00:38:36','admin','2025-01-24 00:42:02','存放环境菜单'),(2031,'存放环境查询',2030,1,'#','',NULL,'',1,0,'F','0','0','medicine:storageenvironment:query','#','admin','2025-01-24 00:38:36','',NULL,''),(2032,'存放环境新增',2030,2,'#','',NULL,'',1,0,'F','0','0','medicine:storageenvironment:add','#','admin','2025-01-24 00:38:36','',NULL,''),(2033,'存放环境修改',2030,3,'#','',NULL,'',1,0,'F','0','0','medicine:storageenvironment:edit','#','admin','2025-01-24 00:38:36','',NULL,''),(2034,'存放环境删除',2030,4,'#','',NULL,'',1,0,'F','0','0','medicine:storageenvironment:remove','#','admin','2025-01-24 00:38:36','',NULL,''),(2035,'存放环境导出',2030,5,'#','',NULL,'',1,0,'F','0','0','medicine:storageenvironment:export','#','admin','2025-01-24 00:38:36','',NULL,''),(2036,'药品-批次-关联表',0,1,'medicinebatch','medicine/medicinebatch/index',NULL,'',1,0,'C','0','0','medicine:medicinebatch:list','example','admin','2025-01-26 13:06:52','admin','2025-01-26 13:09:53','药品-批次-关联表菜单'),(2037,'药品-批次-关联表查询',2036,1,'#','',NULL,'',1,0,'F','0','0','medicine:medicinebatch:query','#','admin','2025-01-26 13:06:52','',NULL,''),(2038,'药品-批次-关联表新增',2036,2,'#','',NULL,'',1,0,'F','0','0','medicine:medicinebatch:add','#','admin','2025-01-26 13:06:52','',NULL,''),(2039,'药品-批次-关联表修改',2036,3,'#','',NULL,'',1,0,'F','0','0','medicine:medicinebatch:edit','#','admin','2025-01-26 13:06:52','',NULL,''),(2040,'药品-批次-关联表删除',2036,4,'#','',NULL,'',1,0,'F','0','0','medicine:medicinebatch:remove','#','admin','2025-01-26 13:06:52','',NULL,''),(2041,'药品-批次-关联表导出',2036,5,'#','',NULL,'',1,0,'F','0','0','medicine:medicinebatch:export','#','admin','2025-01-26 13:06:52','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2025-01-23 17:28:20','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2025-01-23 17:28:20','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"storageenvironment,batch,dictionary,log,medicine,usage_,user,medicinestorage,play,receive\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 18:12:26',330),(101,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 18:12:30',28),(102,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"31092220582@qq.com\",\"nickName\":\"ccc\",\"params\":{},\"phonenumber\":\"18983932406\",\"postIds\":[2],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"ccc123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:05:48',129),(103,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":100,\"email\":\"31092220582@qq.com\",\"nickName\":\"cccc\",\"params\":{},\"phonenumber\":\"18983932406\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userName\":\"ccc123\"}','{\"msg\":\"新增用户\'ccc123\'失败，登录账号已存在\",\"code\":500}',0,NULL,'2025-01-23 20:06:30',2),(104,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":100,\"email\":\"31092220582@qq.com\",\"nickName\":\"cccc\",\"params\":{},\"phonenumber\":\"18983932406\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userName\":\"ccc1\"}','{\"msg\":\"新增用户\'ccc1\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2025-01-23 20:06:44',6),(105,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":100,\"email\":\"31092220582@qq.com\",\"nickName\":\"cccc\",\"params\":{},\"phonenumber\":\"18983932407\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userName\":\"ccc1\"}','{\"msg\":\"新增用户\'ccc1\'失败，邮箱账号已存在\",\"code\":500}',0,NULL,'2025-01-23 20:06:48',6),(106,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"31092220512@qq.com\",\"nickName\":\"cccc\",\"params\":{},\"phonenumber\":\"18983932407\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userId\":101,\"userName\":\"ccc1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:06:53',106),(107,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"31092220513@qq.com\",\"nickName\":\"ccc2\",\"params\":{},\"phonenumber\":\"18983932408\",\"postIds\":[3],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"ccc2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:07:40',102),(108,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/10','127.0.0.1','内网IP','[10]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:10:33',13),(109,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:13:38',14),(110,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/3,6,7,9','127.0.0.1','内网IP','[3,6,7,9]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 20:27:54',15),(111,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"medicine\",\"className\":\"Medicine\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"药品ID\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"药品名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"编号\",\"columnId\":23,\"columnName\":\"number\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"number\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Brand\",\"columnComment\":\"品牌\",\"columnId\":24,\"columnName\":\"brand\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"brand\",\"javaType\":\"Stri','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:16:56',95),(112,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"specificationattribute\",\"className\":\"Specificationattribute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"属性ID\",\"columnId\":80,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttributeKey\",\"columnComment\":\"属性键\",\"columnId\":81,\"columnName\":\"attribute_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttributeValue\",\"columnComment\":\"属性值\",\"columnId\":82,\"columnName\":\"attribute_value\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":83,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:20:33',21),(113,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"medicine\"}',NULL,0,NULL,'2025-01-23 21:21:52',94),(114,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}',NULL,0,NULL,'2025-01-23 21:21:57',43),(115,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/medicine/index\",\"createTime\":\"2025-01-23 21:24:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"药品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicine\",\"perms\":\"medicine:medicine:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:36:29',36),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/index\",\"createTime\":\"2025-01-23 21:24:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"药品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicine\",\"perms\":\"medicine:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:37:25',12),(117,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}',NULL,0,NULL,'2025-01-23 21:39:15',192),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"specificationattribute/specificationattribute/index\",\"createTime\":\"2025-01-23 21:39:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"规格属性\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"specificationattribute:specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:41:53',15),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"specificationattribute/index\",\"createTime\":\"2025-01-23 21:39:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"规格属性\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:42:25',10),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2006','127.0.0.1','内网IP','2006','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-23 21:48:36',15),(121,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"specificationattribute/index\",\"createTime\":\"2025-01-23 21:39:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"规格属性\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:15',27),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2011','127.0.0.1','内网IP','2011','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:31',15),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2010','127.0.0.1','内网IP','2010','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:35',16),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2009','127.0.0.1','内网IP','2009','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:37',12),(125,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2008','127.0.0.1','内网IP','2008','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:39',15),(126,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2007','127.0.0.1','内网IP','2007','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:41',11),(127,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2006','127.0.0.1','内网IP','2006','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:53:43',11),(128,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"specificationattribute\",\"className\":\"Specificationattribute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"属性ID\",\"columnId\":80,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:20:33\",\"usableColumn\":false},{\"capJavaField\":\"AttributeKey\",\"columnComment\":\"属性键\",\"columnId\":81,\"columnName\":\"attribute_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:20:33\",\"usableColumn\":false},{\"capJavaField\":\"AttributeValue\",\"columnComment\":\"属性值\",\"columnId\":82,\"columnName\":\"attribute_value\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:20:33\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":83,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 21:56:06',73),(129,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}',NULL,0,NULL,'2025-01-23 21:56:35',47),(130,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"specificationattribute/specificationattribute/index\",\"createTime\":\"2025-01-23 22:02:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"规格属性\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"specificationattribute:specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 22:03:14',23),(131,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"specificationattribute/index\",\"createTime\":\"2025-01-23 22:02:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"规格属性\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 22:03:36',12),(132,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccc\",\"createTime\":\"2025-01-23 22:12:30\",\"expiryDate\":\"2025-01-18\",\"manufacturer\":\"ccc\",\"name\":\"药品c\",\"number\":1003,\"params\":{},\"productionDate\":\"2025-01-14\",\"unit\":\"ccc\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.insertMedicine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine          ( name,             number,             brand,                          production_date,             expiry_date,             manufacturer,             unit,                          create_time )           values ( ?,             ?,             ?,                          ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value','2025-01-23 22:12:30',248),(133,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccc\",\"createTime\":\"2025-01-23 22:12:38\",\"expiryDate\":\"2025-01-18\",\"manufacturer\":\"ccc\",\"name\":\"药品c\",\"number\":1003,\"params\":{},\"productionDate\":\"2025-01-14\",\"unit\":\"ccc\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.insertMedicine-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine          ( name,             number,             brand,                          production_date,             expiry_date,             manufacturer,             unit,                          create_time )           values ( ?,             ?,             ?,                          ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value','2025-01-23 22:12:38',3),(134,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccc\",\"createTime\":\"2025-01-23 22:14:27\",\"expiryDate\":\"2025-01-31\",\"id\":3,\"manufacturer\":\"ccc\",\"name\":\"ccc\",\"number\":1003,\"params\":{},\"productionDate\":\"2025-01-27\",\"unit\":\"ccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 22:14:27',14),(135,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccccc\",\"createTime\":\"2025-01-23 22:14:27\",\"expiryDate\":\"2025-01-31\",\"id\":3,\"manufacturer\":\"ccc\",\"name\":\"ccc\",\"number\":1003,\"params\":{},\"productionDate\":\"2025-01-27\",\"status\":0,\"unit\":\"ccc\",\"updateTime\":\"2025-01-23 22:14:47\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-23 22:14:47',15),(136,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"batch\",\"className\":\"Batch\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"批次id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BatchNumber\",\"columnComment\":\"批号\",\"columnId\":2,\"columnName\":\"batch_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"修改时间\",\"columnId\":4,\"columnName\":\"update_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"param','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:03:49',84),(137,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"batch\"}',NULL,0,NULL,'2025-01-24 00:04:15',206),(138,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/batch/index\",\"createTime\":\"2025-01-24 00:04:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"batch\",\"perms\":\"medicine:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:08:46',46),(139,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/index\",\"createTime\":\"2025-01-23 21:24:15\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"药品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicine\",\"perms\":\"medicine:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:09:14',16),(140,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/batch/index\",\"createTime\":\"2025-01-24 00:04:39\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"batch\",\"perms\":\"medicine:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:09:26',18),(141,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-23 17:28:19\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:09:42',13),(142,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"medicinestorage\",\"className\":\"Medicinestorage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"环境ID\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicineId\",\"columnComment\":\"关联药品表\",\"columnId\":34,\"columnName\":\"medicine_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"medicineId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StorageEnvId\",\"columnComment\":\"关联存放环境表\",\"columnId\":35,\"columnName\":\"storage_env_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"storageEnvId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":36,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaFi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:13:19',72),(143,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"medicinestorage\"}',NULL,0,NULL,'2025-01-24 00:13:25',199),(144,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/medicinestorage/index\",\"createTime\":\"2025-01-24 00:16:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"药品环境\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicinestorage\",\"perms\":\"medicine:medicinestorage:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:18:10',36),(145,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/medicinestorage/index\",\"createTime\":\"2025-01-24 00:16:37\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"药品环境\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicinestorage\",\"perms\":\"medicine:medicinestorage:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:18:29',23),(146,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"specificationattribute\",\"className\":\"Specificationattribute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"属性ID\",\"columnId\":80,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:56:06\",\"usableColumn\":false},{\"capJavaField\":\"AttributeKey\",\"columnComment\":\"属性键\",\"columnId\":81,\"columnName\":\"attribute_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:56:06\",\"usableColumn\":false},{\"capJavaField\":\"AttributeValue\",\"columnComment\":\"属性值\",\"columnId\":82,\"columnName\":\"attribute_value\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:56:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":83,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:30\",\"dictType\":\"\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:20:41',68),(147,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}',NULL,0,NULL,'2025-01-24 00:20:44',243),(148,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/11','127.0.0.1','内网IP','[11]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:29:30',31),(149,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:29:39',105),(150,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"specificationattribute\",\"className\":\"Specificationattribute\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"规格id\",\"columnId\":85,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 00:29:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttributeKey\",\"columnComment\":\"规格键\",\"columnId\":86,\"columnName\":\"attribute_key\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 00:29:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttributeValue\",\"columnComment\":\"规格值\",\"columnId\":87,\"columnName\":\"attribute_value\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 00:29:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"attributeValue\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":88,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 00:29:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:31:21',85),(151,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"specificationattribute\"}',NULL,0,NULL,'2025-01-24 00:31:26',250),(152,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/specificationattribute/index\",\"createTime\":\"2025-01-24 00:32:14\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"药品规格\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"specificationattribute\",\"perms\":\"medicine:specificationattribute:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:35:00',40),(153,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"storageenvironment\",\"className\":\"Storageenvironment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnId\":59,\"columnName\":\"location\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"location\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Temperature\",\"columnId\":60,\"columnName\":\"temperature\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"temperature\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnId\":61,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryTyp','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:36:34',79),(154,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"storageenvironment\",\"className\":\"Storageenvironment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"环境id\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 00:36:34\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnComment\":\"地点\",\"columnId\":59,\"columnName\":\"location\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"location\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 00:36:34\",\"usableColumn\":false},{\"capJavaField\":\"Temperature\",\"columnComment\":\"温度\",\"columnId\":60,\"columnName\":\"temperature\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"temperature\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 00:36:34\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":61,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:38:21',32),(155,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"storageenvironment\"}',NULL,0,NULL,'2025-01-24 00:38:25',269),(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/storageenvironment/index\",\"createTime\":\"2025-01-24 00:38:36\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"存放环境\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"storageenvironment\",\"perms\":\"medicine:storageenvironment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 00:42:02',51),(157,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"药品状态\",\"dictType\":\"medicine_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 01:23:39',25),(158,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"medicine_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 01:24:55',23),(159,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":1,\"dictType\":\"medicine_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 01:25:34',12),(160,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"medicine\",\"className\":\"Medicine\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"药品ID\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:16:56\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"药品名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:16:56\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"编号\",\"columnId\":23,\"columnName\":\"number\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"number\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-01-23 21:16:56\",\"usableColumn\":false},{\"capJavaField\":\"Brand\",\"columnComment\":\"品牌\",\"columnId\":24,\"columnName\":\"brand\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-23 18:12:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 01:37:03',41),(161,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"medicine\"}',NULL,0,NULL,'2025-01-24 01:37:23',128),(162,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccccc\",\"createTime\":\"2025-01-24 01:54:16\",\"expiryDate\":\"2025-01-22\",\"id\":4,\"manufacturer\":\"ccccc\",\"name\":\"ccccc\",\"number\":1004,\"params\":{},\"productionDate\":\"2025-01-07\",\"status\":0,\"unit\":\"ccccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 01:54:16',28),(163,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:22:12',39),(164,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"medicine\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:23:39',94),(165,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"medicine\",\"className\":\"Medicine\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"药品id\",\"columnId\":90,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 13:23:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名字\",\"columnId\":91,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 13:23:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"编号\",\"columnId\":92,\"columnName\":\"number\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 13:23:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"number\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Brand\",\"columnComment\":\"品牌\",\"columnId\":93,\"columnName\":\"brand\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 13:23:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"brand\",\"javaType\":\"Str','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:25:55',70),(166,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"medicine\"}',NULL,0,NULL,'2025-01-24 13:26:44',238),(167,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccccc\",\"count\":0,\"createTime\":\"2025-01-24 01:54:16\",\"expiryDate\":\"2025-01-22\",\"id\":4,\"manufacturer\":\"ccccc\",\"name\":\"ccccc\",\"number\":1004,\"params\":{},\"productionDate\":\"2025-01-07\",\"status\":1,\"unit\":\"ccccc\",\"updateTime\":\"2025-01-24 13:30:50\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:30:50',46),(168,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"ccccc\",\"count\":0,\"createTime\":\"2025-01-24 01:54:16\",\"expiryDate\":\"2025-01-22\",\"id\":4,\"manufacturer\":\"ccccc\",\"name\":\"ccccc\",\"number\":1004,\"params\":{},\"productionDate\":\"2025-01-07\",\"status\":0,\"unit\":\"ccccc\",\"updateTime\":\"2025-01-24 13:30:55\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:30:55',7),(169,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"品牌A\",\"count\":70,\"createTime\":\"2025-01-22 12:45:21\",\"expiryDate\":\"2024-01-01\",\"id\":1,\"manufacturer\":\"厂商A\",\"name\":\"药品A\",\"number\":1001,\"params\":{},\"productionDate\":\"2023-01-01\",\"specificationAttributeId\":1,\"status\":0,\"unit\":\"盒\",\"updateTime\":\"2025-01-24 13:31:03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:31:03',16),(170,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"品牌B\",\"count\":9,\"createTime\":\"2025-01-22 12:45:21\",\"expiryDate\":\"2024-02-01\",\"id\":2,\"manufacturer\":\"厂商B\",\"name\":\"药品B\",\"number\":1002,\"params\":{},\"productionDate\":\"2023-02-01\",\"specificationAttributeId\":2,\"status\":0,\"unit\":\"瓶\",\"updateTime\":\"2025-01-24 13:31:11\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 13:31:11',16),(171,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"测试品牌\",\"count\":5,\"createTime\":\"2025-01-25 03:14:18\",\"expiryDate\":\"2025-01-16\",\"id\":5,\"manufacturer\":\"测试厂商\",\"name\":\"测试药品\",\"number\":1005,\"params\":{},\"productionDate\":\"2025-01-14\",\"status\":0,\"unit\":\"测试单位\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-25 03:14:18',20),(172,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"测试品牌2\",\"count\":6,\"createTime\":\"2025-01-25 03:15:26\",\"expiryDate\":\"2025-01-17\",\"id\":6,\"manufacturer\":\"测试厂商2\",\"name\":\"测试药品2\",\"number\":1006,\"params\":{},\"productionDate\":\"2025-01-09\",\"status\":0,\"unit\":\"测试单位2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-25 03:15:26',8),(173,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"阿里\",\"count\":12,\"createTime\":\"2025-01-26 12:33:07\",\"expiryDate\":\"2026-01-04\",\"id\":7,\"manufacturer\":\"重庆地区\",\"name\":\"测试药品\",\"number\":1007,\"params\":{},\"productionDate\":\"2025-01-26\",\"status\":0,\"unit\":\"瓶\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 12:33:08',39),(174,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"medicine_batch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 13:04:00',111),(175,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"medicinebatch\",\"className\":\"MedicineBatch\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"关联id\",\"columnId\":103,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-26 13:04:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MedicineId\",\"columnComment\":\"药品id\",\"columnId\":104,\"columnName\":\"medicine_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-26 13:04:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"medicineId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次id\",\"columnId\":105,\"columnName\":\"batch_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-26 13:04:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":106,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-01-26 13:04:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createTime\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 13:05:45',50),(176,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"medicine_batch\"}',NULL,0,NULL,'2025-01-26 13:05:58',262),(177,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/medicinebatch/index\",\"createTime\":\"2025-01-26 13:06:52\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"药品-批次-关联表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicinebatch\",\"perms\":\"medicine:medicinebatch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 13:08:47',40),(178,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"medicine/medicinebatch/index\",\"createTime\":\"2025-01-26 13:06:52\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"药品-批次-关联表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"medicinebatch\",\"perms\":\"medicine:medicinebatch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 13:09:53',11),(179,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"brand\":\"啊手动阀\",\"count\":12,\"expiryDate\":\"2025-01-31 00:00:00\",\"manufacturer\":\"啊手动阀\",\"name\":\"阿斯顿\",\"number\":1234,\"productionDate\":\"2025-01-26 00:00:00\",\"status\":0,\"unit\":\"瓶\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 13:45:02',247),(180,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"expiryDate\":\"2025-01-31 00:00:00\",\"name\":\"test\",\"number\":1003,\"productionDate\":\"2025-01-14 00:00:00\",\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\SpecificationattributeMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.SpecificationattributeMapper.insertSpecificationattribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into specificationattribute\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 14:58:28',105),(181,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\SpecificationattributeMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.SpecificationattributeMapper.insertSpecificationattribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into specificationattribute\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:09:26',19),(182,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\SpecificationattributeMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.SpecificationattributeMapper.insertSpecificationattribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into specificationattribute\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:32:28',18),(183,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:32:51',7),(184,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:37:36',3),(185,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:39:40',2),(186,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:47:12',3),(187,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"specificationAttributekey\":\"规格\",\"specificationAttributename\":\"10人/份\",\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:55:16',7),(188,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"count\":10,\"name\":\"test\",\"number\":1003,\"specificationAttributekey\":\"规格\",\"specificationAttributename\":\"10人/份\",\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\BatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.BatchMapper.insertBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into batch\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 15:55:45',7),(189,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test\",\"number\":1003,\"specificationAttributekey\":\"规格\",\"specificationAttributename\":\"10人/份\",\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-30 15:56:59',30),(190,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1004,\"status\":0}',NULL,1,'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5','2025-01-30 17:09:26',8),(191,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1004,\"status\":0}',NULL,1,'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 5','2025-01-30 17:10:56',2),(192,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1004,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'medicine_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineBatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineBatchMapper.insertMedicineBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_batch          ( batch_id )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'medicine_id\' doesn\'t have a default value\n; Field \'medicine_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'medicine_id\' doesn\'t have a default value','2025-01-30 17:11:40',7),(193,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\SpecificationattributeMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.SpecificationattributeMapper.insertSpecificationattribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into specificationattribute\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 17:23:35',9),(194,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1003,\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\SpecificationattributeMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.SpecificationattributeMapper.insertSpecificationattribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into specificationattribute\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2025-01-30 17:24:23',3),(195,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":10,\"name\":\"test2\",\"number\":1003,\"specificationAttributekey\":\"规格\",\"specificationAttributename\":\"测试\",\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-30 17:27:13',32),(196,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH12345\",\"count\":1,\"name\":\"ccc\",\"number\":1004,\"specificationAttributekey\":\"1\",\"specificationAttributename\":\"2\",\"status\":0}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'batch_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineBatchMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineBatchMapper.insertMedicineBatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_batch          ( medicine_id )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'batch_id\' doesn\'t have a default value\n; Field \'batch_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'batch_id\' doesn\'t have a default value','2025-02-02 17:34:40',80),(197,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH12345\",\"count\":1,\"name\":\"ccc\",\"number\":1004,\"specificationAttributekey\":\"1\",\"specificationAttributename\":\"2\",\"status\":0}',NULL,1,'Mapper method \'com.ruoyi.medicine.mapper.StorageEnvironmentMapper.selectStorageEnvironmentId\' attempted to return null from a method with a primitive return type (long).','2025-02-02 17:35:09',53),(198,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次B002\",\"count\":1,\"name\":\"ccc\",\"number\":1,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-02 17:42:20',51),(199,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/11,12','127.0.0.1','内网IP','[11,12]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.deleteMedicineByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from medicine where id in           (               ?          ,              ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))','2025-02-02 17:43:26',25),(200,'药品环境',3,'com.ruoyi.web.controller.medicine.MedicinestorageController.remove()','DELETE',1,'admin','研发部门','/medicine/medicinestorage/2,1','127.0.0.1','内网IP','[2,1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-02 17:44:25',8),(201,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/12,11','127.0.0.1','内网IP','[12,11]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.deleteMedicineByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from medicine where id in           (               ?          ,              ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))','2025-02-02 17:44:30',9),(202,'药品规格',3,'com.ruoyi.web.controller.medicine.SpecificationattributeController.remove()','DELETE',1,'admin','研发部门','/medicine/specificationattribute/6,7,8','127.0.0.1','内网IP','[6,7,8]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-02 17:45:38',11),(203,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/11,12','127.0.0.1','内网IP','[11,12]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\r\n### The error may exist in file [E:\\IDEA\\idea code\\ruo-yi\\ruoyi-system\\target\\classes\\mapper\\medicine\\MedicineMapper.xml]\r\n### The error may involve com.ruoyi.medicine.mapper.MedicineMapper.deleteMedicineByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from medicine where id in           (               ?          ,              ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`medicine_batch`, CONSTRAINT `medicine_batch_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`))','2025-02-02 17:45:52',19),(204,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/11,12','127.0.0.1','内网IP','[11,12]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-02 17:47:09',8),(205,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/9,10','127.0.0.1','内网IP','[9,10]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-04 21:52:35',35),(206,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/13','127.0.0.1','内网IP','[13]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-04 21:54:22',17),(207,'批次',1,'com.ruoyi.web.controller.medicine.BatchController.add()','POST',1,'admin','研发部门','/medicine/batch','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"createTime\":\"2025-02-07 00:06:29\",\"id\":4,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:06:29',52),(208,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"品牌A\",\"count\":70,\"expiryDate\":\"2025-02-25 00:00:00\",\"id\":1,\"location\":\"仓库A\",\"manufacturer\":\"厂商A\",\"name\":\"药品A\",\"number\":1001,\"params\":{},\"productionDate\":\"2025-02-05 00:00:00\",\"specificationAttributeId\":1,\"specificationAttributekey\":\"剂量\",\"specificationAttributename\":\"10mg\",\"status\":0,\"unit\":\"盒\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:52:05',48),(209,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"ccc\",\"count\":10,\"createTime\":\"2025-02-07 00:53:52\",\"expiryDate\":\"2025-02-27 00:00:00\",\"location\":\"仓库A\",\"manufacturer\":\"ccc\",\"name\":\"测试药品\",\"number\":1004,\"params\":{},\"productionDate\":\"2025-02-04 00:00:00\",\"specificationAttributekey\":\"规格键测试\",\"specificationAttributename\":\"规格值测试\",\"status\":0,\"unit\":\"ccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:53:52',39),(210,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"品牌A\",\"count\":70,\"expiryDate\":\"2024-01-01 00:00:00\",\"id\":1,\"location\":\"仓库B\",\"manufacturer\":\"厂商A\",\"name\":\"药品A\",\"number\":1001,\"params\":{},\"specificationAttributeId\":1,\"specificationAttributekey\":\"剂量\",\"specificationAttributename\":\"10mg\",\"status\":0,\"unit\":\"盒\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:55:06',12),(211,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"品牌A\",\"count\":70,\"expiryDate\":\"2024-01-01 00:00:00\",\"id\":1,\"location\":\"仓库B\",\"manufacturer\":\"厂商A\",\"name\":\"药品A\",\"number\":1001,\"params\":{},\"specificationAttributeId\":1,\"specificationAttributekey\":\"剂量\",\"specificationAttributename\":\"10mg\",\"status\":0,\"unit\":\"盒\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:57:20',32),(212,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:58:38',16),(213,'药品',3,'com.ruoyi.web.controller.medicine.MedicineController.remove()','DELETE',1,'admin','研发部门','/medicine/medicine/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:58:56',9),(214,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"白云山\",\"count\":100,\"expiryDate\":\"2026-01-26 00:00:00\",\"id\":8,\"location\":\"仓库B\",\"manufacturer\":\"白云山制药厂\",\"name\":\"感冒灵\",\"number\":1001,\"params\":{},\"specificationAttributeId\":3,\"specificationAttributekey\":\"规格\",\"specificationAttributename\":\"10片/盒\",\"status\":0,\"unit\":\"盒\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 00:59:06',15),(215,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"批次A001\",\"brand\":\"ccccc\",\"count\":10,\"createTime\":\"2025-02-07 01:00:54\",\"expiryDate\":\"2025-02-28 00:00:00\",\"location\":\"仓库B\",\"manufacturer\":\"cccccc\",\"name\":\"测试药品2\",\"number\":1005,\"params\":{},\"productionDate\":\"2025-02-11 00:00:00\",\"specificationAttributekey\":\"规格测试2\",\"specificationAttributename\":\"规格测试2\",\"status\":0,\"unit\":\"cccccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 01:00:54',35),(216,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":3,\"roleKey\":\"director\",\"roleName\":\"主任\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-09 00:25:43',54),(217,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-02-09 00:25:43\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":3,\"roleKey\":\"director\",\"roleName\":\"主任\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-09 00:25:49',28),(218,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":4,\"roleKey\":\"pharmacist\",\"roleName\":\"药剂师\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-09 00:26:12',25),(219,'药品',1,'com.ruoyi.web.controller.medicine.MedicineController.add()','POST',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH12345\",\"brand\":\"cccccc\",\"count\":100,\"createTime\":\"2025-02-09 01:27:21\",\"expiryDate\":\"2025-02-21 00:00:00\",\"location\":\"仓库B\",\"manufacturer\":\"cccccccccc\",\"name\":\"测试药品3\",\"number\":1006,\"params\":{},\"productionDate\":\"2025-02-11 00:00:00\",\"specificationAttributekey\":\"cccccc\",\"specificationAttributename\":\"ccccc\",\"status\":0,\"unit\":\"cccccccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-09 01:27:21',279),(220,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.edit()','PUT',1,'admin','研发部门','/medicine/medicine','127.0.0.1','内网IP','{\"batchNumber\":\"BATCH77777\",\"brand\":\"ccc\",\"count\":100,\"expiryDate\":\"2025-02-27 00:00:00\",\"id\":9,\"location\":\"仓库A\",\"manufacturer\":\"ccc\",\"name\":\"测试药品\",\"number\":1004,\"params\":{},\"productionDate\":\"2025-02-04 00:00:00\",\"specificationAttributeId\":6,\"specificationAttributekey\":\"规格键测试\",\"specificationAttributename\":\"规格值测试\",\"status\":0,\"unit\":\"ccc\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-09 21:31:09',57),(221,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{}',NULL,1,'Cannot parse null string','2025-02-10 01:41:31',7),(222,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{}',NULL,1,'Cannot parse null string','2025-02-10 01:44:11',7),(223,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{\"count\":1,\"location\":\"仓库A\",\"name\":\"测试\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'count\' not found. Available parameters are [arg2, arg1, arg0, param3, param1, param2]','2025-02-10 01:46:30',19),(224,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{\"count\":1,\"location\":\"仓库A\",\"name\":\"测试\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'count\' not found. Available parameters are [arg2, arg1, arg0, param3, param1, param2]','2025-02-10 01:47:15',26),(225,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{\"count\":1,\"location\":\"仓库A\",\"name\":\"测试\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'count\' not found. Available parameters are [arg2, arg1, arg0, param3, param1, param2]','2025-02-10 01:49:06',10),(226,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{\"count\":1,\"location\":\"仓库A\",\"name\":\"测试\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-10 01:52:55',46),(227,'药品',2,'com.ruoyi.web.controller.medicine.MedicineController.outMedicine()','PUT',1,'admin','研发部门','/medicine/medicine/outMedicine','127.0.0.1','内网IP','{\"count\":1,\"location\":\"仓库B\",\"name\":\"测试\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-10 01:53:02',10);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-01-23 17:28:19','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-01-23 17:28:19','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-01-23 17:28:19','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-01-23 17:28:19','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-01-23 17:28:19','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-01-23 17:28:19','',NULL,'普通角色'),(3,'主任','director',3,'1',1,1,'0','0','admin','2025-02-09 00:25:43','admin','2025-02-09 00:25:49',NULL),(4,'药剂师','pharmacist',4,'1',1,1,'0','0','admin','2025-02-09 00:26:12','',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(3,1),(3,2),(3,3),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,114),(3,115),(3,116),(3,117),(3,500),(3,501),(3,1000),(3,1001),(3,1002),(3,1003),(3,1004),(3,1005),(3,1006),(3,1007),(3,1008),(3,1009),(3,1010),(3,1011),(3,1012),(3,1013),(3,1014),(3,1015),(3,1016),(3,1017),(3,1018),(3,1019),(3,1020),(3,1021),(3,1022),(3,1023),(3,1024),(3,1025),(3,1026),(3,1027),(3,1028),(3,1029),(3,1030),(3,1031),(3,1032),(3,1033),(3,1034),(3,1035),(3,1036),(3,1037),(3,1038),(3,1039),(3,1040),(3,1041),(3,1042),(3,1043),(3,1044),(3,1045),(3,1046),(3,1047),(3,1048),(3,1049),(3,1050),(3,1051),(3,1052),(3,1053),(3,1054),(3,1055),(3,1056),(3,1057),(3,1058),(3,1059),(3,1060),(3,2000),(3,2001),(3,2002),(3,2003),(3,2004),(3,2005),(3,2006),(3,2007),(3,2008),(3,2009),(3,2010),(3,2011),(3,2024),(3,2025),(3,2026),(3,2027),(3,2028),(3,2029),(3,2030),(3,2031),(3,2032),(3,2033),(3,2034),(3,2035),(4,1),(4,2),(4,3),(4,100),(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,114),(4,115),(4,116),(4,117),(4,500),(4,501),(4,1000),(4,1001),(4,1002),(4,1003),(4,1004),(4,1005),(4,1006),(4,1007),(4,1008),(4,1009),(4,1010),(4,1011),(4,1012),(4,1013),(4,1014),(4,1015),(4,1016),(4,1017),(4,1018),(4,1019),(4,1020),(4,1021),(4,1022),(4,1023),(4,1024),(4,1025),(4,1026),(4,1027),(4,1028),(4,1029),(4,1030),(4,1031),(4,1032),(4,1033),(4,1034),(4,1035),(4,1036),(4,1037),(4,1038),(4,1039),(4,1040),(4,1041),(4,1042),(4,1043),(4,1044),(4,1045),(4,1046),(4,1047),(4,1048),(4,1049),(4,1050),(4,1051),(4,1052),(4,1053),(4,1054),(4,1055),(4,1056),(4,1057),(4,1058),(4,1059),(4,1060),(4,2000),(4,2001),(4,2002),(4,2003),(4,2004),(4,2005),(4,2006),(4,2007),(4,2008),(4,2009),(4,2010),(4,2011),(4,2024),(4,2025),(4,2026),(4,2027),(4,2028),(4,2029),(4,2030),(4,2031),(4,2032),(4,2033),(4,2034),(4,2035);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-02-10 01:35:10','admin','2025-01-23 17:28:19','','2025-02-10 01:35:10','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-01-23 17:28:19','admin','2025-01-23 17:28:19','',NULL,'测试员'),(100,100,'ccc123','ccc','00','31092220582@qq.com','18983932406','0','','$2a$10$S.h/nCJsZR2e3QzFpAd6m.unHofLvZb6GGPiNsSNR8zpSPH9J4jG.','0','0','',NULL,'admin','2025-01-23 20:05:48','',NULL,NULL),(101,100,'ccc1','cccc','00','31092220512@qq.com','18983932407','1','','$2a$10$/jY2iTZt1TcxhLRD0lIf1.h8PsKQH0MFNYma5URnpxjMia27s8mki','0','0','',NULL,'admin','2025-01-23 20:06:53','',NULL,NULL),(102,102,'ccc2','ccc2','00','31092220513@qq.com','18983932408','0','','$2a$10$HsraVxGn/V8oVMl8P2d.nOXflGS.DohMnmztpsB9W.nV1Z3OVuTNu','0','0','',NULL,'admin','2025-01-23 20:07:40','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,2),(101,4),(102,3);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2),(101,2),(102,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_`
--

DROP TABLE IF EXISTS `usage_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medicine_id` bigint(20) NOT NULL COMMENT '关联药品表',
  `batch_id` bigint(20) NOT NULL COMMENT '关联批次表',
  `use_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL,
  `use_user` int(11) NOT NULL COMMENT '关联用户表',
  `play_id` int(11) NOT NULL COMMENT '关联计划表',
  `operator_id` bigint(20) NOT NULL COMMENT '关联用户表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_`
--

LOCK TABLES `usage_` WRITE;
/*!40000 ALTER TABLE `usage_` DISABLE KEYS */;
INSERT INTO `usage_` VALUES (1,1,1,'2023-10-01 04:00:00',10,1,1,1,'2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,2,2,'2023-10-02 05:00:00',5,2,2,2,'2025-01-22 04:45:21','2025-01-22 04:45:21');
/*!40000 ALTER TABLE `usage_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL COMMENT '0：普通用户；1：管理员',
  `status` int(11) NOT NULL COMMENT '0：正常；1：停用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin123',1,0,'2025-01-22 04:45:21','2025-01-22 04:45:21'),(2,'user1','user123',0,0,'2025-01-22 04:45:21','2025-01-22 04:45:21'),(3,'user2','user456',0,1,'2025-01-22 04:45:21','2025-01-22 04:45:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-10  2:06:57

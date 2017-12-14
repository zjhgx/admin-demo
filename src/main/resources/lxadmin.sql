-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.10.212    Database: lxadmin
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `audit_node`
--

DROP TABLE IF EXISTS `audit_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_node` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批节点主键',
  `AR_ID` int(11) NOT NULL COMMENT '审批路线ID',
  `AN_NAME` varchar(50) NOT NULL COMMENT '审批节点名称',
  `IS_PRIVILEGE_CTRL` char(1) DEFAULT NULL COMMENT '是否岗位审批权限控制1-是，2-否',
  `SORT_NO` int(11) NOT NULL COMMENT '同一路线下节点序号是顺序不重复',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='审批节点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_node`
--

LOCK TABLES `audit_node` WRITE;
/*!40000 ALTER TABLE `audit_node` DISABLE KEYS */;
INSERT INTO `audit_node` VALUES (1,1,'参数复核节点','1',0,1),(2,2,'机构权限复核节点','1',0,1),(3,3,'管理员权限复核节点','1',0,1),(4,4,'用户权限复核节点','1',0,1);
/*!40000 ALTER TABLE `audit_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_process`
--

DROP TABLE IF EXISTS `audit_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_process` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AT_ID` int(11) NOT NULL COMMENT '审批任务id：归属的审批任务',
  `AP_COMMIT_STATION` int(11) DEFAULT NULL COMMENT '审批提交岗位',
  `AP_COMMIT_PERSON` int(11) DEFAULT NULL COMMENT '审批提交人：参考用户',
  `AP_EXEC_STATION` int(11) DEFAULT NULL COMMENT '审批过程受理岗位执行岗位：参考审批岗位',
  `AP_EXEC_PERSON` int(11) DEFAULT NULL COMMENT '审批过程受理人：参考用户',
  `AP_STATUS` char(1) DEFAULT NULL COMMENT '审批过程受理状态：1-未处理，2-处理中，3-处理完毕',
  `AP_EXEC_RESULT` char(1) DEFAULT NULL COMMENT '审批过程受理结果：1-同意，2-拒绝，3-驳回',
  `AP_EXEC_REMARK` varchar(500) DEFAULT NULL COMMENT '审批过程受理意见',
  `AP_DONE_TIME` datetime DEFAULT NULL COMMENT '审批过程结束时间',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '审批过程序号，同一个任务下的进度',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_process`
--

LOCK TABLES `audit_process` WRITE;
/*!40000 ALTER TABLE `audit_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_route`
--

DROP TABLE IF EXISTS `audit_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AR_NAME` varchar(50) DEFAULT NULL COMMENT '审批路线名称',
  `AN_EXEC_MODE` char(1) DEFAULT NULL COMMENT '1串行-金额满足后自动跳出不执行下一节点，2并行-本节点金额满足后继续执行后续所有节点',
  `AR_REMARK` varchar(200) DEFAULT NULL COMMENT '审批路线描述',
  `AUDIT_MODE` char(1) DEFAULT NULL COMMENT '1排斥-业务提交人不能审批自己的业务，2-兼容，业务提交人可以审批自己',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入编号',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='审批路线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_route`
--

LOCK TABLES `audit_route` WRITE;
/*!40000 ALTER TABLE `audit_route` DISABLE KEYS */;
INSERT INTO `audit_route` VALUES (1,'参数复核','1','参数复核','2',NULL,1),(2,'机构权限复核','1','机构权限复核','2',NULL,1),(3,'管理员权限复核','1','管理员权限复核','2',NULL,1),(4,'用户权限复核','1','用户权限复核','2',NULL,1);
/*!40000 ALTER TABLE `audit_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_station`
--

DROP TABLE IF EXISTS `audit_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_station` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AN_ID` int(11) NOT NULL COMMENT '审批节点ID',
  `AR_ID` int(11) NOT NULL COMMENT '审批路线id',
  `AS_NAME` varchar(50) NOT NULL COMMENT '岗位名称',
  `AS_PRIVILEGE` decimal(22,6) DEFAULT NULL COMMENT '岗位审批权限',
  `CREATE_BRCH_ID` int(11) DEFAULT NULL COMMENT '创建岗位的机构',
  `BIND_BRCH_ID` int(11) DEFAULT NULL COMMENT '分配给哪个机构使用',
  `AS_REMARK` varchar(100) DEFAULT NULL COMMENT '审批岗位说明',
  `SORT_NO` int(11) NOT NULL COMMENT '序号,相同节点下相同机构的岗位序号不重复',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='审批岗位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_station`
--

LOCK TABLES `audit_station` WRITE;
/*!40000 ALTER TABLE `audit_station` DISABLE KEYS */;
INSERT INTO `audit_station` VALUES (1,1,1,'系统参数复核岗',0.000000,NULL,NULL,'系统参数复核岗',1,1),(2,2,2,'机构权限复核岗',0.000000,NULL,NULL,'机构权限复核岗',1,1),(3,3,3,'管理员权限复核岗',0.000000,NULL,NULL,'管理员权限复核岗',1,1),(4,4,4,'用户权限复核岗',0.000000,NULL,NULL,'用户权限复核岗',1,1),(5,1,1,'系统参数复核岗',0.000000,1,1,'系统参数复核岗',1,0),(6,2,2,'机构权限复核岗',0.000000,1,1,'机构权限复核岗',1,0),(7,3,3,'管理员权限复核岗',0.000000,1,1,'管理员权限复核岗',1,0),(8,4,4,'用户权限复核岗',0.000000,1,1,'用户权限复核岗',1,0),(9,1,1,'系统参数复核岗',0.000000,2,2,'系统参数复核岗',1,0),(10,2,2,'机构权限复核岗',0.000000,2,2,'机构权限复核岗',1,0),(11,3,3,'管理员权限复核岗',0.000000,2,2,'管理员权限复核岗',1,0),(12,4,4,'用户权限复核岗',0.000000,2,2,'用户权限复核岗',1,0),(13,1,1,'系统参数复核岗',0.000000,3,3,'系统参数复核岗',1,0),(14,2,2,'机构权限复核岗',0.000000,3,3,'机构权限复核岗',1,0),(15,3,3,'管理员权限复核岗',0.000000,3,3,'管理员权限复核岗',1,0),(16,4,4,'用户权限复核岗',0.000000,3,3,'用户权限复核岗',1,0),(17,1,1,'系统参数复核岗',0.000000,4,4,'系统参数复核岗',1,0),(18,2,2,'机构权限复核岗',0.000000,4,4,'机构权限复核岗',1,0),(19,3,3,'管理员权限复核岗',0.000000,4,4,'管理员权限复核岗',1,0),(20,4,4,'用户权限复核岗',0.000000,4,4,'用户权限复核岗',1,0),(21,1,1,'系统参数复核岗',0.000000,5,5,'系统参数复核岗',1,0),(22,2,2,'机构权限复核岗',0.000000,5,5,'机构权限复核岗',1,0),(23,3,3,'管理员权限复核岗',0.000000,5,5,'管理员权限复核岗',1,0),(24,4,4,'用户权限复核岗',0.000000,5,5,'用户权限复核岗',1,0),(25,1,1,'系统参数复核岗',0.000000,6,6,'系统参数复核岗',1,0),(26,2,2,'机构权限复核岗',0.000000,6,6,'机构权限复核岗',1,0),(27,3,3,'管理员权限复核岗',0.000000,6,6,'管理员权限复核岗',1,0),(28,4,4,'用户权限复核岗',0.000000,6,6,'用户权限复核岗',1,0),(29,1,1,'系统参数复核岗',0.000000,7,7,'系统参数复核岗',1,0),(30,2,2,'机构权限复核岗',0.000000,7,7,'机构权限复核岗',1,0),(31,3,3,'管理员权限复核岗',0.000000,7,7,'管理员权限复核岗',1,0),(32,4,4,'用户权限复核岗',0.000000,7,7,'用户权限复核岗',1,0),(33,1,1,'系统参数复核岗',0.000000,8,8,'系统参数复核岗',1,0),(34,2,2,'机构权限复核岗',0.000000,8,8,'机构权限复核岗',1,0),(35,3,3,'管理员权限复核岗',0.000000,8,8,'管理员权限复核岗',1,0),(36,4,4,'用户权限复核岗',0.000000,8,8,'用户权限复核岗',1,0),(37,1,1,'系统参数复核岗',0.000000,9,9,'系统参数复核岗',1,0),(38,2,2,'机构权限复核岗',0.000000,9,9,'机构权限复核岗',1,0),(39,3,3,'管理员权限复核岗',0.000000,9,9,'管理员权限复核岗',1,0),(40,4,4,'用户权限复核岗',0.000000,9,9,'用户权限复核岗',1,0),(41,1,1,'系统参数复核岗',0.000000,10,10,'系统参数复核岗',1,0),(42,2,2,'机构权限复核岗',0.000000,10,10,'机构权限复核岗',1,0),(43,3,3,'管理员权限复核岗',0.000000,10,10,'管理员权限复核岗',1,0),(44,4,4,'用户权限复核岗',0.000000,10,10,'用户权限复核岗',1,0);
/*!40000 ALTER TABLE `audit_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_task`
--

DROP TABLE IF EXISTS `audit_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批任务主键',
  `AR_ID` int(11) DEFAULT NULL COMMENT '使用的审批路线',
  `AT_STATUS` varchar(1) DEFAULT NULL COMMENT '审批任务状态：1-审批中，2-审批通过，3-审批不通过',
  `ENTITY_ID` int(11) DEFAULT NULL COMMENT '实体id',
  `ENTITY_NAME` varchar(100) DEFAULT NULL COMMENT '实体类名',
  `ENTITY_SERVICE` varchar(50) DEFAULT NULL COMMENT '实体服务',
  `AUDIT_PRIVILEGE` decimal(22,4) DEFAULT NULL COMMENT '审批权限',
  `AT_AUTHOR` int(11) DEFAULT NULL COMMENT '任务创建者',
  `AT_CREATE_TIME` datetime DEFAULT NULL COMMENT '任务创建时间',
  `AT_DONE_TIME` datetime DEFAULT NULL COMMENT '任务结束时间',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构id',
  `PROD_ID` int(11) DEFAULT NULL COMMENT '产品id',
  `AUDIT_REMARK` varchar(100) DEFAULT NULL COMMENT '审批附言备注',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_task`
--

LOCK TABLES `audit_task` WRITE;
/*!40000 ALTER TABLE `audit_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_code_config`
--

DROP TABLE IF EXISTS `auto_code_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_code_config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CODE_KEY` varchar(30) DEFAULT NULL COMMENT '编码的KEY定义',
  `CODE_DESC` varchar(100) DEFAULT NULL COMMENT '编码描述',
  `MI_NO` varchar(20) DEFAULT NULL COMMENT '接入号，为空或0，所有接入点共用',
  `PREFIX_NO_RULE` varchar(100) DEFAULT NULL COMMENT '编码前缀规则',
  `KEEP_BIT` smallint(6) DEFAULT NULL COMMENT '序号需要保留位数',
  `CUR_COUNT` int(11) DEFAULT NULL COMMENT '当前序号值',
  `CUR_DATE` varchar(20) DEFAULT NULL COMMENT '当前计数日',
  `CIRCLE_TYPE` varchar(10) DEFAULT NULL COMMENT '循环类型   0:不循环，1：按年  2：按月，3：按天',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='自动编码配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_code_config`
--

LOCK TABLES `auto_code_config` WRITE;
/*!40000 ALTER TABLE `auto_code_config` DISABLE KEYS */;
INSERT INTO `auto_code_config` VALUES (2,'BRCH_NO','机构编码','0001','B',6,21,'20170321','0'),(3,'LOAN_NO','放款编号','0001','FK',10,102,'20170904','0');
/*!40000 ALTER TABLE `auto_code_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_task`
--

DROP TABLE IF EXISTS `auto_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TASK_TYPE` varchar(5) NOT NULL COMMENT '类型 1：通用任务，2：接入点任务',
  `CLASS_NAME` varchar(500) NOT NULL,
  `PARA` varchar(200) DEFAULT NULL,
  `CRON_EXPR` varchar(50) DEFAULT NULL,
  `MEMBER_NOS` varchar(50) DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  `NEXT_TASK` varchar(50) DEFAULT NULL,
  `DEPEND_TASKS` varchar(500) DEFAULT NULL,
  `DEPEND_OUT_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_task`
--

LOCK TABLES `auto_task` WRITE;
/*!40000 ALTER TABLE `auto_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_task_log`
--

DROP TABLE IF EXISTS `auto_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_task_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `TASK_TYPE` varchar(5) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `RUN_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  `MI_NO` varchar(20) DEFAULT NULL,
  `ERR_MESSAGE` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_task_log`
--

LOCK TABLES `auto_task_log` WRITE;
/*!40000 ALTER TABLE `auto_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `BRCH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRCH_NAME` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `BRCH_LEVEL` smallint(6) DEFAULT '0' COMMENT '机构层次级别',
  `BRCH_NO` varchar(50) DEFAULT NULL COMMENT '机构编号',
  `BRCH_STATUS` char(1) DEFAULT NULL COMMENT '机构状态1：有效，2：无效',
  `TREE_CODE` varchar(50) DEFAULT NULL COMMENT '机构树编号',
  `PROVINCE` int(11) DEFAULT NULL COMMENT '省份',
  `CITY` int(11) DEFAULT NULL COMMENT '城市',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '地址',
  `UNION_BANK_NO` varchar(40) DEFAULT NULL COMMENT '联行号',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `LEDGER_ATTR` varchar(20) DEFAULT NULL COMMENT '统计属性',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`BRCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'业务平台中心',1,'B000003',NULL,'0001',1013,1014,'',NULL,'0001',NULL,1),(2,'投融家',2,'B000004',NULL,'00010002',1013,1014,NULL,NULL,'0001',NULL,3),(3,'资产运营部',3,'B000005',NULL,'000100020001',1013,1014,'诚信路',NULL,'0001',NULL,2),(4,'车贷业务部',3,'B000006',NULL,'000100020002',856,857,'中天大厦',NULL,'0001',NULL,3),(5,'资产管理部',3,'B000007',NULL,'000100020003',1013,1014,NULL,NULL,'0001',NULL,1),(6,'产品部',3,'B000008',NULL,'000100020004',856,857,NULL,NULL,'0001',NULL,1),(7,'财务部',3,'B000009',NULL,'000100020006',1013,1014,NULL,NULL,'0001',NULL,1),(8,'研发中心研发部',3,'B000010',NULL,'000100020005',856,857,NULL,NULL,'0001',NULL,1),(9,'hgx_admin',1,'hgx_admin',NULL,'0002',1013,1014,NULL,NULL,'0001',NULL,0),(10,'风控部',3,'B000021',NULL,'000100020007',NULL,NULL,NULL,NULL,'0001',NULL,1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buser`
--

DROP TABLE IF EXISTS `buser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buser` (
  `SYS_USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_NO` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(100) DEFAULT NULL COMMENT '密码',
  `USER_TYPE` char(1) DEFAULT NULL COMMENT '用户类型1-实施，2-Saas管理，3-Saas运维，4-总部管理，5-机构管理，6-普通',
  `STATUS` char(1) DEFAULT NULL COMMENT '用户状态1-在线，2-离线，3-锁定，4-关闭',
  `PWD_CHG_DATE` datetime DEFAULT NULL COMMENT '密码修改日期',
  `PWD_ERR_NUM` int(11) DEFAULT NULL COMMENT '密码错误次数',
  `LAST_LOGIN_TM` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `LAST_LOGON_IP` varchar(20) DEFAULT NULL COMMENT '最后一次登录的IP',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构ID',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'EMAIL',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `ROLE_STATUS` varchar(4) DEFAULT NULL COMMENT '分配的角色状态 0：未复核，1：已复核，2：复核中',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`SYS_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buser`
--

LOCK TABLES `buser` WRITE;
/*!40000 ALTER TABLE `buser` DISABLE KEYS */;
INSERT INTO `buser` VALUES (1,'admin','实施人员','f296441bba0751d49531071e297c4943','1','1','2015-12-06 10:26:38',0,'2017-12-14 20:42:35',NULL,NULL,NULL,NULL,NULL,1692),(2,'saasadmin','SAAS管理员','f296441bba0751d49531071e297c4943','3','2','2015-12-06 10:28:36',0,'2017-12-14 19:25:29',NULL,NULL,'lx@ichuangshun.com',NULL,'2',2354),(3,'lxadmin','业务平台管理员','f296441bba0751d49531071e297c4943','4','2','2015-12-06 00:16:09',0,'2017-12-14 20:35:35','127.0.0.1',1,'lx@ichuangshun.com','0001','2',1569),(4,'hugaoxiang','胡高翔','f296441bba0751d49531071e297c4943','6','1','2017-12-14 20:05:18',0,'2017-12-14 20:40:29','127.0.0.1',8,'hugaoxiang@ichuangshun.com','0001','2',2);
/*!40000 ALTER TABLE `buser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busi_date`
--

DROP TABLE IF EXISTS `busi_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busi_date` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CUR_DATE` datetime DEFAULT NULL COMMENT '当前营业日',
  `SYS_STATUS` char(1) DEFAULT NULL COMMENT '系统状态；1:营业中 2:日终前 3:日终处理中  4:待营业    1->2->3(日切)->4->1',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `PRE_DATE` datetime DEFAULT NULL COMMENT '前一营业日',
  `NEXT_DATE` datetime DEFAULT NULL COMMENT '下一营业日',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务日期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busi_date`
--

LOCK TABLES `busi_date` WRITE;
/*!40000 ALTER TABLE `busi_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `busi_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busi_template_def`
--

DROP TABLE IF EXISTS `busi_template_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `busi_template_def` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BUSI_NO` varchar(20) DEFAULT NULL COMMENT '交易号',
  `BUSI_NAME` varchar(100) DEFAULT NULL COMMENT '交易名称',
  `BUSI_TYPE` varchar(10) DEFAULT NULL COMMENT '交易类型',
  `PROD_NO` varchar(20) DEFAULT NULL COMMENT '产品号',
  `TEMPLATE_FILE` varchar(100) DEFAULT NULL COMMENT '模板路径',
  `TEMPLATE_NAME` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `MI_NO` varchar(20) DEFAULT NULL COMMENT '接入点号',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务模板定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busi_template_def`
--

LOCK TABLES `busi_template_def` WRITE;
/*!40000 ALTER TABLE `busi_template_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `busi_template_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CODE_KEY` varchar(50) NOT NULL COMMENT '国际化代码',
  `CODE_NO` varchar(40) DEFAULT NULL,
  `CODE_NAME` varchar(50) NOT NULL COMMENT '名称',
  `LANG_TYPE` varchar(10) NOT NULL COMMENT '语言代码',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '排序',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1290433 DEFAULT CHARSET=utf8 COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1290119,'A000','0','否','zh_CN',NULL,NULL,NULL),(1290120,'A000','1','是','zh_CN',NULL,NULL,NULL),(1290121,'A001','1','男','zh_CN',NULL,NULL,NULL),(1290122,'A001','0','女','zh_CN',NULL,NULL,NULL),(1290123,'A002','0','未婚','zh_CN',NULL,NULL,NULL),(1290124,'A002','1','已婚','zh_CN',NULL,NULL,NULL),(1290125,'A002','2','离异','zh_CN',NULL,NULL,NULL),(1290126,'A003','1','博士后','zh_CN',NULL,NULL,NULL),(1290127,'A003','2','博士','zh_CN',NULL,NULL,NULL),(1290128,'A003','3','硕士','zh_CN',NULL,NULL,NULL),(1290129,'A003','5','本科','zh_CN',NULL,NULL,NULL),(1290130,'A003','6','大专','zh_CN',NULL,NULL,NULL),(1290131,'A003','7','高中','zh_CN',NULL,NULL,NULL),(1290132,'A003','8','其他','zh_CN',NULL,NULL,NULL),(1290133,'A004','1','身份证','zh_CN',NULL,NULL,NULL),(1290134,'A004','2','军官证','zh_CN',NULL,NULL,NULL),(1290135,'A004','3','学生证','zh_CN',NULL,NULL,NULL),(1290136,'A004','4','护照','zh_CN',NULL,NULL,NULL),(1290137,'A005','1','行业指标','zh_CN',NULL,NULL,NULL),(1290138,'A005','2','运营指标','zh_CN',NULL,NULL,NULL),(1290139,'A005','3','财务指标','zh_CN',NULL,NULL,NULL),(1290140,'A006','1','独资企业','zh_CN',NULL,NULL,NULL),(1290141,'A006','2','合伙企业','zh_CN',NULL,NULL,NULL),(1290142,'A006','3','有限责任公司','zh_CN',NULL,NULL,NULL),(1290143,'A006','4','股份有限公司','zh_CN',NULL,NULL,NULL),(1290144,'A006','5','其他','zh_CN',NULL,NULL,NULL),(1290145,'A007','0','普通用户','zh_CN',NULL,NULL,NULL),(1290146,'A007','1','后台管理员','zh_CN',NULL,NULL,NULL),(1290147,'A007','10','问题分类专员','zh_CN',NULL,NULL,NULL),(1290148,'A008','ccb','中国建设银行','zh_CN',NULL,NULL,NULL),(1290149,'A008','icbc','中国工商银行','zh_CN',NULL,NULL,NULL),(1290150,'A008','abc','中国农业银行','zh_CN',NULL,NULL,NULL),(1290151,'A008','sdb','深圳发展银行','zh_CN',NULL,NULL,NULL),(1290152,'A009','z','知元','zh_CN',NULL,NULL,NULL),(1290153,'A009','r','融元','zh_CN',NULL,NULL,NULL),(1290154,'A009','y','云元','zh_CN',NULL,NULL,NULL),(1290155,'A137','1','大型','zh_CN',NULL,NULL,NULL),(1290156,'A137','2','中型','zh_CN',NULL,NULL,NULL),(1290157,'A137','3','小型','zh_CN',NULL,NULL,NULL),(1290158,'A137','4','微型','zh_CN',NULL,NULL,NULL),(1290159,'E001','shenfut','盛付通','zh_CN',NULL,NULL,NULL),(1290160,'E001','guofubao','国付宝','zh_CN',NULL,NULL,NULL),(1290161,'E002','day','天','zh_CN',NULL,NULL,NULL),(1290162,'E002','month','月','zh_CN',NULL,NULL,NULL),(1290163,'E003','day','日','zh_CN',NULL,NULL,NULL),(1290164,'E003','month','月','zh_CN',NULL,NULL,NULL),(1290165,'E003','year','年','zh_CN',NULL,NULL,NULL),(1290166,'E004','endate','到期还本付息','zh_CN',NULL,NULL,NULL),(1290167,'E004','halfyear','半年付息一次','zh_CN',NULL,NULL,NULL),(1290168,'E004','permonth',' 每月等额本息 ','zh_CN',NULL,NULL,NULL),(1290169,'E005','A','日益升','zh_CN',NULL,NULL,NULL),(1290170,'E005','B',' 企益融','zh_CN',NULL,NULL,NULL),(1290171,'E006','1','保本保息','zh_CN',NULL,NULL,NULL),(1290172,'E006','2','保本','zh_CN',NULL,NULL,NULL),(1290173,'E007','1','高富帅','zh_CN',NULL,NULL,NULL),(1290174,'E007','2','白富美','zh_CN',NULL,NULL,NULL),(1290175,'E007','3','富二代','zh_CN',NULL,NULL,NULL),(1290176,'E008','1','待审核','zh_CN',NULL,NULL,NULL),(1290177,'E008','2','审核通过','zh_CN',NULL,NULL,NULL),(1290178,'E008','3','审核未通过','zh_CN',NULL,NULL,NULL),(1290181,'E009','CCB','中国建设银行','zh_CN',NULL,NULL,NULL),(1290182,'E009','ICBC','中国工商银行','zh_CN',NULL,NULL,NULL),(1290183,'E009','ABC','中国农业银行','zh_CN',NULL,NULL,NULL),(1290184,'E009','CMBC','中国民生银行','zh_CN',NULL,NULL,NULL),(1290185,'E009','SPDB','上海浦东发展银行','zh_CN',NULL,NULL,NULL),(1290186,'E009','GDB','广东发展银行','zh_CN',NULL,NULL,NULL),(1290187,'E009','PSBC','中国邮政储蓄银行','zh_CN',NULL,NULL,NULL),(1290188,'E009','TCCB','天津银行','zh_CN',NULL,NULL,NULL),(1290189,'E009','BOS','上海银行','zh_CN',NULL,NULL,NULL),(1290190,'E009','BRCB','北京农商银行','zh_CN',NULL,NULL,NULL),(1290191,'E009','NJCB','南京银行','zh_CN',NULL,NULL,NULL),(1290192,'E009','BOCD','成都银行','zh_CN',NULL,NULL,NULL),(1290193,'E009','GNXS','广州市农村信用合作社','zh_CN',NULL,NULL,NULL),(1290194,'E009','GZCB','广州银行','zh_CN',NULL,NULL,NULL),(1290195,'E009','HKBCHINA','汉口银行','zh_CN',NULL,NULL,NULL),(1290196,'E009','SXJS','晋商银行','zh_CN',NULL,NULL,NULL),(1290197,'E009','ZHNX','珠海市农村信用合作联社','zh_CN',NULL,NULL,NULL),(1290198,'E009','WZCB','温州银行','zh_CN',NULL,NULL,NULL),(1290199,'E009','YDXH','尧都信用合作联社','zh_CN',NULL,NULL,NULL),(1290200,'E009','SDE','顺德农信社','zh_CN',NULL,NULL,NULL),(1290201,'E005','C','稳益保','zh_CN',NULL,NULL,NULL),(1290202,'E010','1','投资成功','zh_CN',NULL,NULL,NULL),(1290203,'E010','2','项目取消','zh_CN',NULL,NULL,NULL),(1290204,'E010','3','回款','zh_CN',NULL,NULL,NULL),(1290205,'E010','4','系统消息','zh_CN',NULL,NULL,NULL),(1290206,'E010','5','提现（至银行卡）','zh_CN',NULL,NULL,NULL),(1290207,'E010','6','提现（提交申请）','zh_CN',NULL,NULL,NULL),(1290208,'E010','7','提现（提现汇出）','zh_CN',NULL,NULL,NULL),(1290209,'E010','8','项目预告','zh_CN',NULL,NULL,NULL),(1290210,'E010','9','基金份额转让动态码验证','zh_CN',NULL,NULL,NULL),(1290211,'E010','10','充值回执','zh_CN',NULL,NULL,NULL),(1290212,'E010','11','合同','zh_CN',NULL,NULL,NULL),(1290213,'E011','1','企业','zh_CN',NULL,NULL,NULL),(1290214,'E011','2','个人','zh_CN',NULL,NULL,NULL),(1290215,'E012','1','注册协议','zh_CN',NULL,NULL,NULL),(1290216,'E012','2','资金管理服务协议','zh_CN',NULL,NULL,NULL),(1290217,'E012','3','债权转让协议','zh_CN',NULL,NULL,NULL),(1290218,'E012','4','借款协议','zh_CN',NULL,NULL,NULL),(1290219,'E012','5','合伙企业认购书和增资申请书','zh_CN',NULL,NULL,NULL),(1290220,'E012','6','合伙协议','zh_CN',NULL,NULL,NULL),(1290221,'E012','7','合伙补充协议和承诺函','zh_CN',NULL,NULL,NULL),(1290222,'E012','8','份额转让协议','zh_CN',NULL,NULL,NULL),(1290223,'E013','1','首页','zh_CN',NULL,NULL,NULL),(1290224,'E013','2','我要理财','zh_CN',NULL,NULL,NULL),(1290225,'E014','1','关于投融','zh_CN',NULL,NULL,NULL),(1290226,'E014','2','注册/登录','zh_CN',NULL,NULL,NULL),(1290227,'E014','3','充值/提现','zh_CN',NULL,NULL,NULL),(1290228,'E014','4','投资/本息收回','zh_CN',NULL,NULL,NULL),(1290229,'E014','5','账户安全','zh_CN',NULL,NULL,NULL),(1290230,'E015','1','咨询','zh_CN',NULL,NULL,NULL),(1290231,'E015','2','建议','zh_CN',NULL,NULL,NULL),(1290232,'E015','3','投诉','zh_CN',NULL,NULL,NULL),(1290233,'E015','4','其他','zh_CN',NULL,NULL,NULL),(1290234,'E016','1','QQ','zh_CN',NULL,NULL,NULL),(1290235,'E016','2','邮箱','zh_CN',NULL,NULL,NULL),(1290236,'E016','3','手机','zh_CN',NULL,NULL,NULL),(1290237,'E017','1','未处理','zh_CN',NULL,NULL,NULL),(1290238,'E017','2','需跟进','zh_CN',NULL,NULL,NULL),(1290239,'E017','3','已处理','zh_CN',NULL,NULL,NULL),(1290240,'E017','4','无需处理','zh_CN',NULL,NULL,NULL),(1290241,'E005','D','抵益融','zh_CN',NULL,NULL,NULL),(1290242,'E005','E','快益转','zh_CN',NULL,NULL,NULL),(1290243,'E018','1','有','zh_CN',NULL,NULL,NULL),(1290244,'E018','0','无','zh_CN',NULL,NULL,NULL),(1290245,'E019','1','正常','zh_CN',NULL,NULL,NULL),(1290246,'E019','0','不正常','zh_CN',NULL,NULL,NULL),(1290247,'E020','1','正常','zh_CN',NULL,NULL,NULL),(1290248,'E020','0','--','zh_CN',NULL,NULL,NULL),(1290249,'E021','','营业执照副本','zh_CN',NULL,NULL,NULL),(1290250,'E021','','组织机构代码证','zh_CN',NULL,NULL,NULL),(1290251,'E021','','企业贷款卡','zh_CN',NULL,NULL,NULL),(1290252,'E021','','房产证','zh_CN',NULL,NULL,NULL),(1290253,'E021','','（汽车）行驶证','zh_CN',NULL,NULL,NULL),(1290254,'E021','','实际控制人身份证','zh_CN',NULL,NULL,NULL),(1290255,'E021','','实际控制人户口本','zh_CN',NULL,NULL,NULL),(1290256,'E021','','实际控制人资产清单','zh_CN',NULL,NULL,NULL),(1290257,'E021','','纳税申报表','zh_CN',NULL,NULL,NULL),(1290258,'E021','','资产负债表','zh_CN',NULL,NULL,NULL),(1290259,'E021','','利润表','zh_CN',NULL,NULL,NULL),(1290260,'E021','','企业经营场所','zh_CN',NULL,NULL,NULL),(1290261,'E021','','企业生产厂房','zh_CN',NULL,NULL,NULL),(1290262,'E021','','企业典型产品/在建工程','zh_CN',NULL,NULL,NULL),(1290263,'E009','HZB','杭州银行','zh_CN',NULL,NULL,NULL),(1290264,'E009','MINTAI','民泰商业银行','zh_CN',NULL,NULL,NULL),(1290265,'E009','ZJTLCB','泰隆商业银行','zh_CN',NULL,NULL,NULL),(1290266,'E009','TZBANK','台州银行','zh_CN',NULL,NULL,NULL),(1290267,'E009','JSBCHINA','江苏银行','zh_CN',NULL,NULL,NULL),(1290268,'E009','HSBC','汇丰银行','zh_CN',NULL,NULL,NULL),(1290269,'E010','21','撤标','zh_CN',NULL,NULL,NULL),(1290270,'E022','1','网站端-首页banner','zh_CN',NULL,NULL,NULL),(1290271,'E022','2','安卓端-首页banner','zh_CN',NULL,NULL,NULL),(1290272,'E022','3','IOS端-首页banner','zh_CN',NULL,NULL,NULL),(1290273,'E009','CZCB','稠州商业银行','zh_CN',NULL,NULL,NULL),(1290274,'E010','31','新项目提醒','zh_CN',NULL,NULL,NULL),(1290275,'E010','32','待开标闹钟提醒','zh_CN',NULL,NULL,NULL),(1290276,'E010','33','到期提醒','zh_CN',NULL,NULL,NULL),(1290277,'E010','34','还款提醒','zh_CN',NULL,NULL,NULL),(1290278,'E005','F',' 聚优宝','zh_CN',NULL,NULL,NULL),(1290279,'E004','D','按月付息，到期还本','zh_CN',NULL,NULL,NULL),(1290280,'E012','9','投融家权益转让协议','zh_CN',NULL,NULL,NULL),(1290281,'E023','1','网站公告','zh_CN',NULL,NULL,NULL),(1290282,'E023','2','最新动态','zh_CN',NULL,NULL,NULL),(1290283,'A121','1','一个月以下','zh_CN',NULL,NULL,NULL),(1290284,'A121','3','1-3个月','zh_CN',NULL,NULL,NULL),(1290285,'A121','6','3-6个月','zh_CN',NULL,NULL,NULL),(1290286,'A121','9','6-9个月','zh_CN',NULL,NULL,NULL),(1290287,'A121','12','9-12个月','zh_CN',NULL,NULL,NULL),(1290288,'A121','24','1-2年','zh_CN',NULL,NULL,NULL),(1290289,'A121','100','两年以上','zh_CN',NULL,NULL,NULL),(1290290,'A087','5','5天内','zh_CN',NULL,NULL,NULL),(1290291,'A087','10','10天内','zh_CN',NULL,NULL,NULL),(1290292,'A087','15','15天内','zh_CN',NULL,NULL,NULL),(1290293,'A087','30','30天内','zh_CN',NULL,NULL,NULL),(1290294,'A081','1','流动资金补充','zh_CN',NULL,NULL,NULL),(1290295,'A081','2','新项目建设','zh_CN',NULL,NULL,NULL),(1290296,'A081','3','现有设备维护/扩充','zh_CN',NULL,NULL,NULL),(1290297,'A081','4','风险投资','zh_CN',NULL,NULL,NULL),(1290298,'A081','5','非资金服务','zh_CN',NULL,NULL,NULL),(1290299,'A081','6','其他','zh_CN',NULL,NULL,NULL),(1290300,'E010','35','开标提醒 ','zh_CN',NULL,NULL,NULL),(1290301,'E024','1','满标后支付 ','zh_CN',NULL,NULL,NULL),(1290302,'E024','2','募集期每天支付 ','zh_CN',NULL,NULL,NULL),(1290303,'E012','10','投融家债权再转让协议','zh_CN',NULL,NULL,NULL),(1290304,'E010','41',' 默认类型 ','zh_cn',NULL,NULL,NULL),(1290305,'E010','42','项目流标 ','zh_CN',NULL,NULL,NULL),(1290306,'E010','43','资金占用费发放 ','zh_CN',NULL,NULL,NULL),(1290307,'E010','44','邀请好友 ','zh_CN',NULL,NULL,NULL),(1290308,'E025','1','你配偶出生地是哪里？ ','zh_CN',NULL,NULL,NULL),(1290309,'E025','2','你的小学名称？ ','zh_CN',NULL,NULL,NULL),(1290310,'E025','3','你的中学名称？ ','zh_CN',NULL,NULL,NULL),(1290311,'E025','4','你的母亲姓名？ ','zh_CN',NULL,NULL,NULL),(1290312,'E014','6','债权转让','zh_CN',NULL,NULL,NULL),(1290313,'E009','FDB','富滇银行','zh_CN',NULL,NULL,NULL),(1290314,'E021','','担保承诺函','zh_CN',NULL,NULL,NULL),(1290315,'E010','51','回款','zh_CN',NULL,NULL,NULL),(1290316,'E010','52','回款','zh_CN',NULL,NULL,NULL),(1290317,'E010','53','回款','zh_CN',NULL,NULL,NULL),(1290318,'E010','54','回款','zh_CN',NULL,NULL,NULL),(1290319,'E010','61','转让提醒','zh_CN',NULL,NULL,NULL),(1290320,'E004','E','到期还本付息(新)','zh_CN',NULL,NULL,NULL),(1290321,'E009','CCB','建设银行','zh_CN',NULL,NULL,NULL),(1290322,'E009','CMB','招商银行','zh_CN',NULL,NULL,NULL),(1290323,'E009','ICBC','工商银行','zh_CN',NULL,NULL,NULL),(1290324,'E009','BOC','中国银行','zh_CN',NULL,NULL,NULL),(1290325,'E009','ABC','农业银行','zh_CN',NULL,NULL,NULL),(1290326,'E009','BOCOM','交通银行','zh_CN',NULL,NULL,NULL),(1290327,'E009','CMBC','民生银行','zh_CN',NULL,NULL,NULL),(1290328,'E009','HXBC','华夏银行','zh_CN',NULL,NULL,NULL),(1290329,'E009','CIB','兴业银行','zh_CN',NULL,NULL,NULL),(1290330,'E009','SPDB','浦发银行','zh_CN',NULL,NULL,NULL),(1290331,'E009','GDB','广发银行','zh_CN',NULL,NULL,NULL),(1290332,'E009','CITIC','中信银行','zh_CN',NULL,NULL,NULL),(1290333,'E009','CEB','光大银行','zh_CN',NULL,NULL,NULL),(1290334,'E009','PSBC','中国邮储银行','zh_CN',NULL,NULL,NULL),(1290335,'E009','BOBJ','北京银行','zh_CN',NULL,NULL,NULL),(1290336,'E009','SRCB','上海农商银行','zh_CN',NULL,NULL,NULL),(1290337,'E009','PAB','平安银行','zh_CN',NULL,NULL,NULL),(1290338,'E009','URCB','杭州联合银行','zh_CN',NULL,NULL,NULL),(1290339,'E009','NBCB','宁波银行','zh_CN',NULL,NULL,NULL),(1290340,'E009','EGBANK','恒丰银行','zh_CN',NULL,NULL,NULL),(1290341,'E009','CBHB','渤海银行','zh_CN',NULL,NULL,NULL),(1290342,'E009','HSBANK','徽商银行','zh_CN',NULL,NULL,NULL),(1290343,'E009','CZBANK','浙商银行','zh_CN',NULL,NULL,NULL),(1290344,'E009','HKBEA','东亚银行','zh_CN',NULL,NULL,NULL),(1290345,'E009','CCQTGB','重庆三峡银行','zh_CN',NULL,NULL,NULL),(1290346,'E009','WOORI','友利银行','zh_CN',NULL,NULL,NULL),(1290347,'E009','CCFCCB','城市商业银行','zh_CN',NULL,NULL,NULL),(1290348,'E009','CRCB','农村商业银行','zh_CN',NULL,NULL,NULL),(1290349,'E009','CRCPB','农村合作银行','zh_CN',NULL,NULL,NULL),(1290350,'E009','CVBF','村镇银行','zh_CN',NULL,NULL,NULL),(1290351,'E009','CUCC','城市信用合作社','zh_CN',NULL,NULL,NULL),(1290352,'E009','CRCC','农村信用合作社','zh_CN',NULL,NULL,NULL),(1290353,'E010','71','手机推荐好友','zh_CN',NULL,NULL,NULL),(1290354,'E026','1','十亿鑫速度','zh_CN',NULL,NULL,NULL),(1290355,'E010','81','活动奖励','zh_CN',NULL,NULL,NULL),(1290356,'E022','4','手机端-新客专享banner','zh_CN',NULL,NULL,NULL),(1290357,'E022','5','手机端-猜你喜欢banner','zh_CN',NULL,NULL,NULL),(1290358,'E022','6','手机端-理财列表banner','zh_CN',NULL,NULL,NULL),(1290359,'E010','91','送红包','zh_CN',NULL,NULL,NULL),(1290360,'E010','92','红包过期','zh_CN',NULL,NULL,NULL),(1290361,'E010','93','购买转让（买方）','zh_CN',NULL,NULL,NULL),(1290362,'E010','94','购买转让（卖方）','zh_CN',NULL,NULL,NULL),(1290363,'E010','95','新项目提醒（多条）','zh_CN',NULL,NULL,NULL),(1290364,'E010','96','公告提醒','zh_CN',NULL,NULL,NULL),(1290365,'B005','0','菜单组','zh_CN',NULL,NULL,1),(1290366,'B005','1','菜单','zh_CN',NULL,NULL,1),(1290367,'B005','2','功能','zh_CN',NULL,NULL,1),(1290368,'B008','1','实施端','zh_CN',NULL,NULL,1),(1290369,'B008','2','SaaS端','zh_CN',NULL,NULL,1),(1290370,'B008','3','机构端','zh_CN',NULL,NULL,1),(1290371,'B008','4','业务端','zh_CN',NULL,NULL,1),(1290372,'B008','5','网银端','zh_CN',NULL,NULL,1),(1290373,'B016','0','未分配','zh_CN',NULL,NULL,1),(1290374,'B016','1','分配未审核或分配中','zh_CN',NULL,NULL,1),(1290375,'B016','2','已分配已审核','zh_CN',NULL,NULL,1),(1290376,'B016','3','审核中','zh_CN',NULL,NULL,1),(1290377,'B002','1','实施人员','zh_CN',NULL,NULL,1),(1290378,'B002','2','SAAS运维员','zh_CN',NULL,NULL,1),(1290379,'B002','3','SAAS管理员','zh_CN',NULL,NULL,1),(1290380,'B002','4','总部管理员','zh_CN',NULL,NULL,1),(1290381,'B002','5','机构管理员','zh_CN',NULL,NULL,1),(1290382,'B002','6','普通用户','zh_CN',NULL,NULL,1),(1290383,'B003','1','在线','zh_CN',NULL,NULL,1),(1290384,'B003','2','离线','zh_CN',NULL,NULL,1),(1290385,'B003','3','锁定','zh_CN',NULL,NULL,1),(1290386,'B003','4','关闭','zh_CN',NULL,NULL,1),(1290387,'B001','1','实施人员','zh_CN',NULL,NULL,1),(1290388,'B001','2','SAAS运维','zh_CN',NULL,NULL,1),(1290389,'B001','3','SAAS管理','zh_CN',NULL,NULL,1),(1290390,'B001','4','总部管理','zh_CN',NULL,NULL,1),(1290391,'B001','5','机构管理角色','zh_CN',NULL,NULL,1),(1290392,'B001','6','业务角色','zh_CN',NULL,NULL,1),(1290393,'B001','7','评委','zh_CN',NULL,NULL,1),(1290394,'B031','1','通用任务','zh_CN',NULL,NULL,1),(1290395,'B031','2','接入点任务','zh_CN',NULL,NULL,1),(1290396,'B032','1','启用','zh_CN',NULL,NULL,1),(1290397,'B032','2','停用','zh_CN',NULL,NULL,1),(1290398,'B007','1','流程类','zh_CN',NULL,NULL,1),(1290399,'B007','2','业务类','zh_CN',NULL,NULL,1),(1290400,'B007','3','功能类','zh_CN',NULL,NULL,1),(1290401,'B022','1','普通','zh_CN',NULL,NULL,1),(1290402,'B022','2','撤销','zh_CN',NULL,NULL,1),(1290403,'B022','3','审批','zh_CN',NULL,NULL,1),(1290404,'C0300','02','审批中','zh_CN',NULL,NULL,1),(1290405,'C0300','04','已结束','zh_CN',NULL,NULL,1),(1290406,'C0300','90','已驳回','zh_CN',NULL,NULL,1),(1290407,'B021','1','用户','zh_CN',NULL,NULL,1),(1290408,'B021','2','角色','zh_CN',NULL,NULL,1),(1290409,'B021','3','机构','zh_CN',NULL,NULL,1),(1290410,'B017','0','参数未复核','zh_CN',NULL,NULL,1),(1290411,'B017','1','参数已复核','zh_CN',NULL,NULL,1),(1290412,'B017','2','参数复核中','zh_CN',NULL,NULL,1),(1290413,'A010','1','开启','1',NULL,NULL,NULL),(1290415,'A010','0','关闭','1',NULL,NULL,NULL),(1290416,'D001','13575459779','郭锦鸽','1',NULL,NULL,NULL),(1290417,'D001','15988126279','李会','1',NULL,NULL,NULL),(1290418,'D002','testwap2','测试环境','1',NULL,NULL,NULL),(1290420,'C0101','3310010010192020210015','3310010010192020210015','zh_CN',NULL,NULL,0),(1290426,'E999','0','扣款测试用','zh_CN',NULL,NULL,NULL),(1290427,'B033','0','一级菜单','zh_CN',NULL,NULL,NULL),(1290428,'B033','1','二级级菜单','zh_CN',NULL,NULL,NULL),(1290429,'B033','2','三级级菜单','zh_CN',NULL,NULL,NULL),(1290430,'C0102','1','自有户到过渡户','zh_CN',NULL,NULL,1),(1290431,'C0102','3','自有户到营销户','zh_CN',NULL,NULL,3),(1290432,'C0102','4','营销户到自有户','zh_CN',NULL,NULL,4);
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_meta`
--

DROP TABLE IF EXISTS `code_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_meta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `META_KEY` varchar(20) NOT NULL COMMENT '代码',
  `META_NAME` varchar(100) NOT NULL COMMENT '名称',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1279366 DEFAULT CHARSET=utf8 COMMENT='数据元';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_meta`
--

LOCK TABLES `code_meta` WRITE;
/*!40000 ALTER TABLE `code_meta` DISABLE KEYS */;
INSERT INTO `code_meta` VALUES (1279304,'A000','是否',NULL),(1279305,'A001','性别',NULL),(1279306,'A002','婚姻状况',NULL),(1279307,'A003','学位',NULL),(1279308,'A004','证件类型',NULL),(1279309,'A005','指标类型',NULL),(1279310,'A006','企业类型',NULL),(1279311,'A007','用户类型',NULL),(1279312,'A008','银行类别',NULL),(1279313,'A009','币种',NULL),(1279314,'E001','支付渠道',NULL),(1279315,'E002','期限单位',NULL),(1279316,'E003','利率类型',NULL),(1279317,'E004','还款方式',NULL),(1279318,'E005','产品类型',NULL),(1279319,'E006','保障性质',NULL),(1279320,'E007','产品归类',NULL),(1279321,'E008','审核状态',NULL),(1279322,'E009','银行类型',NULL),(1279323,'E010','消息状态',NULL),(1279324,'E011','借款人类型',NULL),(1279325,'E012','合同类型',NULL),(1279326,'E013','banner位置',NULL),(1279327,'E014','常见问题类型',NULL),(1279328,'E015','留言类型',NULL),(1279329,'E016','联系类型',NULL),(1279330,'E017','留言处理状态',NULL),(1279331,'E018','有无',NULL),(1279332,'E019','正常不正常',NULL),(1279333,'E020','正常--',NULL),(1279334,'A137','企业规模',NULL),(1279335,'E021','初始化证据列表',NULL),(1279336,'E022','banner位置',NULL),(1279337,'E023','新闻类型',NULL),(1279338,'A121','企业融资-融资期限',NULL),(1279339,'A087','企业融资-融资天数',NULL),(1279340,'A081','企业融资-融资用途',NULL),(1279341,'E024','项目支付方式 ',NULL),(1279342,'E025','安全问答',NULL),(1279343,'E026','项目活动',NULL),(1279345,'B005','权限类型',1),(1279346,'B008','权限使用类型',1),(1279347,'B016','用户角色状态',1),(1279348,'B002','用户类型',1),(1279349,'B003','用户状态',1),(1279350,'B001','角色类型',1),(1279351,'B031','任务类型',1),(1279352,'B032','任务启用状态',1),(1279353,'B007','产品类型',1),(1279354,'B022','任务类型',1),(1279355,'C0300','流程状态',1),(1279356,'B021','任务分配类型',1),(1279357,'B017','系统参数状态',1),(1279358,'A010','活动启用状态',NULL),(1279359,'A011','活动状态',NULL),(1279360,'D001','满标提醒电话',NULL),(1279361,'D002','公告URL标识',NULL),(1279363,'C0101','自由资金账号',0),(1279364,'B033','菜单服务号等级',1),(1279365,'C0102','划拨类型',0);
/*!40000 ALTER TABLE `code_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_area`
--

DROP TABLE IF EXISTS `dict_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父级ID',
  `CODE` varchar(10) DEFAULT NULL COMMENT '编码',
  `TEMP_PCODE` varchar(10) DEFAULT NULL COMMENT '父级编码(导入临时用)',
  `NAME_CN` varchar(100) DEFAULT NULL COMMENT '名称_中文',
  `ALL_NAME_CN` varchar(100) DEFAULT NULL COMMENT '全称_中文',
  `NAME_EN` varchar(100) DEFAULT NULL COMMENT '名称_英文',
  `ALL_NAME_EN` varchar(100) DEFAULT NULL COMMENT '全称_英文',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态 0 无效 1有效',
  `AREA_LEVEL` smallint(6) DEFAULT NULL COMMENT '级别 0 国家，1省（州）,2市, 3 区',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3468 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_area`
--

LOCK TABLES `dict_area` WRITE;
/*!40000 ALTER TABLE `dict_area` DISABLE KEYS */;
INSERT INTO `dict_area` VALUES (1,NULL,'86','0','中国','中国',NULL,NULL,'1',0),(2,1,'110000','86','北京市','北京市',NULL,NULL,'1',1),(3,2,'110100','110000','北京市','北京市市辖区',NULL,NULL,'1',2),(4,3,'110101','110100','东城区','北京市东城区',NULL,NULL,'1',3),(5,3,'110102','110100','西城区','北京市西城区',NULL,NULL,'1',3),(6,3,'110103','110100','崇文区','北京市崇文区',NULL,NULL,'1',3),(7,3,'110104','110100','宣武区','北京市宣武区',NULL,NULL,'1',3),(8,3,'110105','110100','朝阳区','北京市朝阳区',NULL,NULL,'1',3),(9,3,'110106','110100','丰台区','北京市丰台区',NULL,NULL,'1',3),(10,3,'110107','110100','石景山区','北京市石景山区',NULL,NULL,'1',3),(11,3,'110108','110100','海淀区','北京市海淀区',NULL,NULL,'1',3),(12,3,'110109','110100','门头沟区','北京市门头沟区',NULL,NULL,'1',3),(13,3,'110111','110100','房山区','北京市房山区',NULL,NULL,'1',3),(14,3,'110112','110100','通州区','北京市通州区',NULL,NULL,'1',3),(15,3,'110113','110100','顺义区','北京市顺义区',NULL,NULL,'1',3),(16,3,'110221','110100','昌平区','北京市昌平区',NULL,NULL,'1',3),(17,3,'110224','110100','大兴区','北京市大兴区',NULL,NULL,'1',3),(18,3,'110226','110100','平谷区','北京市平谷区',NULL,NULL,'1',3),(19,3,'110227','110100','怀柔区','北京市怀柔区',NULL,NULL,'1',3),(20,2,'110200','110000','县','北京市县',NULL,NULL,'1',2),(21,20,'110228','110200','密云县','北京市密云县',NULL,NULL,'1',3),(22,20,'110229','110200','延庆县','北京市延庆县',NULL,NULL,'1',3),(23,1,'120000','86','天津市','天津市',NULL,NULL,'1',1),(24,23,'120100','120000','天津市','天津市市辖区',NULL,NULL,'1',2),(25,24,'120101','120100','和平区','天津市和平区',NULL,NULL,'1',3),(26,24,'120102','120100','河东区','天津市河东区',NULL,NULL,'1',3),(27,24,'120103','120100','河西区','天津市河西区',NULL,NULL,'1',3),(28,24,'120104','120100','南开区','天津市南开区',NULL,NULL,'1',3),(29,24,'120105','120100','河北区','天津市河北区',NULL,NULL,'1',3),(30,24,'120106','120100','红桥区','天津市红桥区',NULL,NULL,'1',3),(31,24,'120107','120100','塘沽区','天津市塘沽区',NULL,NULL,'1',3),(32,24,'120108','120100','汉沽区','天津市汉沽区',NULL,NULL,'1',3),(33,24,'120109','120100','大港区','天津市大港区',NULL,NULL,'1',3),(34,24,'120110','120100','东丽区','天津市东丽区',NULL,NULL,'1',3),(35,24,'120111','120100','西青区','天津市西青区',NULL,NULL,'1',3),(36,24,'120112','120100','津南区','天津市津南区',NULL,NULL,'1',3),(37,24,'120113','120100','北辰区','天津市北辰区',NULL,NULL,'1',3),(38,24,'120222','120100','武清区','天津市武清区',NULL,NULL,'1',3),(39,24,'120224','120100','宝坻区','天津市宝坻区',NULL,NULL,'1',3),(40,23,'120200','120000','县','天津市县',NULL,NULL,'1',2),(41,40,'120221','120200','宁河县','天津市宁河县',NULL,NULL,'1',3),(42,40,'120223','120200','静海县','天津市静海县',NULL,NULL,'1',3),(43,40,'120225','120200','蓟县','天津市蓟县',NULL,NULL,'1',3),(44,1,'130000','86','河北省','河北省',NULL,NULL,'1',1),(45,44,'130100','130000','石家庄市','河北省石家庄市',NULL,NULL,'1',2),(46,45,'130101','130100','市辖区','河北省石家庄市市辖区',NULL,NULL,'0',3),(47,45,'130102','130100','长安区','河北省石家庄市长安区',NULL,NULL,'1',3),(48,45,'130103','130100','桥东区','河北省石家庄市桥东区',NULL,NULL,'1',3),(49,45,'130104','130100','桥西区','河北省石家庄市桥西区',NULL,NULL,'1',3),(50,45,'130105','130100','新华区','河北省石家庄市新华区',NULL,NULL,'1',3),(51,45,'130106','130100','郊区','河北省石家庄市郊区',NULL,NULL,'1',3),(52,45,'130107','130100','井陉矿区','河北省石家庄市井陉矿区',NULL,NULL,'1',3),(53,45,'130121','130100','井陉县','河北省石家庄市井陉县',NULL,NULL,'1',3),(54,45,'130123','130100','正定县','河北省石家庄市正定县',NULL,NULL,'1',3),(55,45,'130124','130100','栾城县','河北省石家庄市栾城县',NULL,NULL,'1',3),(56,45,'130125','130100','行唐县','河北省石家庄市行唐县',NULL,NULL,'1',3),(57,45,'130126','130100','灵寿县','河北省石家庄市灵寿县',NULL,NULL,'1',3),(58,45,'130127','130100','高邑县','河北省石家庄市高邑县',NULL,NULL,'1',3),(59,45,'130128','130100','深泽县','河北省石家庄市深泽县',NULL,NULL,'1',3),(60,45,'130129','130100','赞皇县','河北省石家庄市赞皇县',NULL,NULL,'1',3),(61,45,'130130','130100','无极县','河北省石家庄市无极县',NULL,NULL,'1',3),(62,45,'130131','130100','平山县','河北省石家庄市平山县',NULL,NULL,'1',3),(63,45,'130132','130100','元氏县','河北省石家庄市元氏县',NULL,NULL,'1',3),(64,45,'130133','130100','赵县','河北省石家庄市赵县',NULL,NULL,'1',3),(65,45,'130181','130100','辛集市','河北省石家庄市辛集市',NULL,NULL,'1',3),(66,45,'130182','130100','藁城市','河北省石家庄市藁城市',NULL,NULL,'1',3),(67,45,'130183','130100','晋州市','河北省石家庄市晋州市',NULL,NULL,'1',3),(68,45,'130184','130100','新乐市','河北省石家庄市新乐市',NULL,NULL,'1',3),(69,45,'130185','130100','鹿泉市','河北省石家庄市鹿泉市',NULL,NULL,'1',3),(70,44,'130200','130000','唐山市','河北省唐山市',NULL,NULL,'1',2),(71,70,'130201','130200','市辖区','河北省唐山市市辖区',NULL,NULL,'0',3),(72,70,'130202','130200','路南区','河北省唐山市路南区',NULL,NULL,'1',3),(73,70,'130203','130200','路北区','河北省唐山市路北区',NULL,NULL,'1',3),(74,70,'130204','130200','古冶区','河北省唐山市古冶区',NULL,NULL,'1',3),(75,70,'130205','130200','开平区','河北省唐山市开平区',NULL,NULL,'1',3),(76,70,'130206','130200','新区','河北省唐山市新区',NULL,NULL,'1',3),(77,70,'130221','130200','丰润县','河北省唐山市丰润县',NULL,NULL,'1',3),(78,70,'130223','130200','滦县','河北省唐山市滦县',NULL,NULL,'1',3),(79,70,'130224','130200','滦南县','河北省唐山市滦南县',NULL,NULL,'1',3),(80,70,'130225','130200','乐亭县','河北省唐山市乐亭县',NULL,NULL,'1',3),(81,70,'130227','130200','迁西县','河北省唐山市迁西县',NULL,NULL,'1',3),(82,70,'130229','130200','玉田县','河北省唐山市玉田县',NULL,NULL,'1',3),(83,70,'130230','130200','唐海县','河北省唐山市唐海县',NULL,NULL,'1',3),(84,70,'130281','130200','遵化市','河北省唐山市遵化市',NULL,NULL,'1',3),(85,70,'130282','130200','丰南市','河北省唐山市丰南市',NULL,NULL,'1',3),(86,70,'130283','130200','迁安市','河北省唐山市迁安市',NULL,NULL,'1',3),(87,44,'130300','130000','秦皇岛市','河北省秦皇岛市',NULL,NULL,'1',2),(88,87,'130301','130300','市辖区','河北省秦皇岛市市辖区',NULL,NULL,'0',3),(89,87,'130302','130300','海港区','河北省秦皇岛市海港区',NULL,NULL,'1',3),(90,87,'130303','130300','山海关区','河北省秦皇岛市山海关区',NULL,NULL,'1',3),(91,87,'130304','130300','北戴河区','河北省秦皇岛市北戴河区',NULL,NULL,'1',3),(92,87,'130321','130300','青龙县','河北省秦皇岛市青龙满族自治县',NULL,NULL,'1',3),(93,87,'130322','130300','昌黎县','河北省秦皇岛市昌黎县',NULL,NULL,'1',3),(94,87,'130323','130300','抚宁县','河北省秦皇岛市抚宁县',NULL,NULL,'1',3),(95,87,'130324','130300','卢龙县','河北省秦皇岛市卢龙县',NULL,NULL,'1',3),(96,44,'130400','130000','邯郸市','河北省邯郸市',NULL,NULL,'1',2),(97,96,'130401','130400','市辖区','河北省邯郸市市辖区',NULL,NULL,'0',3),(98,96,'130402','130400','邯山区','河北省邯郸市邯山区',NULL,NULL,'1',3),(99,96,'130403','130400','丛台区','河北省邯郸市丛台区',NULL,NULL,'1',3),(100,96,'130404','130400','复兴区','河北省邯郸市复兴区',NULL,NULL,'1',3),(101,96,'130406','130400','峰矿区','河北省邯郸市峰矿区',NULL,NULL,'1',3),(102,96,'130421','130400','邯郸县','河北省邯郸市邯郸县',NULL,NULL,'1',3),(103,96,'130423','130400','临漳县','河北省邯郸市临漳县',NULL,NULL,'1',3),(104,96,'130424','130400','成安县','河北省邯郸市成安县',NULL,NULL,'1',3),(105,96,'130425','130400','大名县','河北省邯郸市大名县',NULL,NULL,'1',3),(106,96,'130426','130400','涉县','河北省邯郸市涉县',NULL,NULL,'1',3),(107,96,'130427','130400','磁县','河北省邯郸市磁县',NULL,NULL,'1',3),(108,96,'130428','130400','肥乡县','河北省邯郸市肥乡县',NULL,NULL,'1',3),(109,96,'130429','130400','永年县','河北省邯郸市永年县',NULL,NULL,'1',3),(110,96,'130430','130400','邱县','河北省邯郸市邱县',NULL,NULL,'1',3),(111,96,'130431','130400','鸡泽县','河北省邯郸市鸡泽县',NULL,NULL,'1',3),(112,96,'130432','130400','广平县','河北省邯郸市广平县',NULL,NULL,'1',3),(113,96,'130433','130400','馆陶县','河北省邯郸市馆陶县',NULL,NULL,'1',3),(114,96,'130434','130400','魏县','河北省邯郸市魏县',NULL,NULL,'1',3),(115,96,'130435','130400','曲周县','河北省邯郸市曲周县',NULL,NULL,'1',3),(116,96,'130481','130400','武安市','河北省邯郸市武安市',NULL,NULL,'1',3),(117,44,'130500','130000','邢台市','河北省邢台市',NULL,NULL,'1',2),(118,117,'130501','130500','市辖区','河北省邢台市市辖区',NULL,NULL,'0',3),(119,117,'130502','130500','桥东区','河北省邢台市桥东区',NULL,NULL,'1',3),(120,117,'130503','130500','桥西区','河北省邢台市桥西区',NULL,NULL,'1',3),(121,117,'130521','130500','邢台县','河北省邢台市邢台县',NULL,NULL,'1',3),(122,117,'130522','130500','临城县','河北省邢台市临城县',NULL,NULL,'1',3),(123,117,'130523','130500','内丘县','河北省邢台市内丘县',NULL,NULL,'1',3),(124,117,'130524','130500','柏乡县','河北省邢台市柏乡县',NULL,NULL,'1',3),(125,117,'130525','130500','隆尧县','河北省邢台市隆尧县',NULL,NULL,'1',3),(126,117,'130526','130500','任县','河北省邢台市任县',NULL,NULL,'1',3),(127,117,'130527','130500','南和县','河北省邢台市南和县',NULL,NULL,'1',3),(128,117,'130528','130500','宁晋县','河北省邢台市宁晋县',NULL,NULL,'1',3),(129,117,'130529','130500','巨鹿县','河北省邢台市巨鹿县',NULL,NULL,'1',3),(130,117,'130530','130500','新河县','河北省邢台市新河县',NULL,NULL,'1',3),(131,117,'130531','130500','广宗县','河北省邢台市广宗县',NULL,NULL,'1',3),(132,117,'130532','130500','平乡县','河北省邢台市平乡县',NULL,NULL,'1',3),(133,117,'130533','130500','威县','河北省邢台市威县',NULL,NULL,'1',3),(134,117,'130534','130500','清河县','河北省邢台市清河县',NULL,NULL,'1',3),(135,117,'130535','130500','临西县','河北省邢台市临西县',NULL,NULL,'1',3),(136,117,'130581','130500','南宫市','河北省邢台市南宫市',NULL,NULL,'1',3),(137,117,'130582','130500','沙河市','河北省邢台市沙河市',NULL,NULL,'1',3),(138,44,'130600','130000','保定市','河北省保定市',NULL,NULL,'1',2),(139,138,'130601','130600','市辖区','河北省保定市市辖区',NULL,NULL,'0',3),(140,138,'130602','130600','新市区','河北省保定市新市区',NULL,NULL,'1',3),(141,138,'130603','130600','北市区','河北省保定市北市区',NULL,NULL,'1',3),(142,138,'130604','130600','南市区','河北省保定市南市区',NULL,NULL,'1',3),(143,138,'130621','130600','满城县','河北省保定市满城县',NULL,NULL,'1',3),(144,138,'130622','130600','清苑县','河北省保定市清苑县',NULL,NULL,'1',3),(145,138,'130623','130600','涞水县','河北省保定市涞水县',NULL,NULL,'1',3),(146,138,'130624','130600','阜平县','河北省保定市阜平县',NULL,NULL,'1',3),(147,138,'130625','130600','徐水县','河北省保定市徐水县',NULL,NULL,'1',3),(148,138,'130626','130600','定兴县','河北省保定市定兴县',NULL,NULL,'1',3),(149,138,'130627','130600','唐县','河北省保定市唐县',NULL,NULL,'1',3),(150,138,'130628','130600','高阳县','河北省保定市高阳县',NULL,NULL,'1',3),(151,138,'130629','130600','容城县','河北省保定市容城县',NULL,NULL,'1',3),(152,138,'130630','130600','涞源县','河北省保定市涞源县',NULL,NULL,'1',3),(153,138,'130631','130600','望都县','河北省保定市望都县',NULL,NULL,'1',3),(154,138,'130632','130600','安新县','河北省保定市安新县',NULL,NULL,'1',3),(155,138,'130633','130600','易县','河北省保定市易县',NULL,NULL,'1',3),(156,138,'130634','130600','曲阳县','河北省保定市曲阳县',NULL,NULL,'1',3),(157,138,'130635','130600','蠡县','河北省保定市蠡县',NULL,NULL,'1',3),(158,138,'130636','130600','顺平县','河北省保定市顺平县',NULL,NULL,'1',3),(159,138,'130637','130600','博野县','河北省保定市博野县',NULL,NULL,'1',3),(160,138,'130638','130600','雄县','河北省保定市雄县',NULL,NULL,'1',3),(161,138,'130681','130600','涿州市','河北省保定市涿州市',NULL,NULL,'1',3),(162,138,'130682','130600','定州市','河北省保定市定州市',NULL,NULL,'1',3),(163,138,'130683','130600','安国市','河北省保定市安国市',NULL,NULL,'1',3),(164,138,'130684','130600','高碑店市','河北省保定市高碑店市',NULL,NULL,'1',3),(165,44,'130700','130000','张家口市','河北省张家口市',NULL,NULL,'1',2),(166,165,'130701','130700','市辖区','河北省张家口市市辖区',NULL,NULL,'0',3),(167,165,'130702','130700','桥东区','河北省张家口市桥东区',NULL,NULL,'1',3),(168,165,'130703','130700','桥西区','河北省张家口市桥西区',NULL,NULL,'1',3),(169,165,'130705','130700','宣化区','河北省张家口市宣化区',NULL,NULL,'1',3),(170,165,'130706','130700','下花园区','河北省张家口市下花园区',NULL,NULL,'1',3),(171,165,'130721','130700','宣化县','河北省张家口市宣化县',NULL,NULL,'1',3),(172,165,'130722','130700','张北县','河北省张家口市张北县',NULL,NULL,'1',3),(173,165,'130723','130700','康保县','河北省张家口市康保县',NULL,NULL,'1',3),(174,165,'130724','130700','沽源县','河北省张家口市沽源县',NULL,NULL,'1',3),(175,165,'130725','130700','尚义县','河北省张家口市尚义县',NULL,NULL,'1',3),(176,165,'130726','130700','蔚县','河北省张家口市蔚县',NULL,NULL,'1',3),(177,165,'130727','130700','阳原县','河北省张家口市阳原县',NULL,NULL,'1',3),(178,165,'130728','130700','怀安县','河北省张家口市怀安县',NULL,NULL,'1',3),(179,165,'130729','130700','万全县','河北省张家口市万全县',NULL,NULL,'1',3),(180,165,'130730','130700','怀来县','河北省张家口市怀来县',NULL,NULL,'1',3),(181,165,'130731','130700','涿鹿县','河北省张家口市涿鹿县',NULL,NULL,'1',3),(182,165,'130732','130700','赤城县','河北省张家口市赤城县',NULL,NULL,'1',3),(183,165,'130733','130700','崇礼县','河北省张家口市崇礼县',NULL,NULL,'1',3),(184,44,'130800','130000','承德市','河北省承德市',NULL,NULL,'1',2),(185,184,'130801','130800','市辖区','河北省承德市市辖区',NULL,NULL,'0',3),(186,184,'130802','130800','双桥区','河北省承德市双桥区',NULL,NULL,'1',3),(187,184,'130803','130800','双滦区','河北省承德市双滦区',NULL,NULL,'1',3),(188,184,'130804','130800','鹰手营子矿区','河北省承德市鹰手营子矿区',NULL,NULL,'1',3),(189,184,'130821','130800','承德县','河北省承德市承德县',NULL,NULL,'1',3),(190,184,'130822','130800','兴隆县','河北省承德市兴隆县',NULL,NULL,'1',3),(191,184,'130823','130800','平泉县','河北省承德市平泉县',NULL,NULL,'1',3),(192,184,'130824','130800','滦平县','河北省承德市滦平县',NULL,NULL,'1',3),(193,184,'130825','130800','隆化县','河北省承德市隆化县',NULL,NULL,'1',3),(194,184,'130826','130800','丰宁县','河北省承德市丰宁满族自治县',NULL,NULL,'1',3),(195,184,'130827','130800','宽城县','河北省承德市宽城满族自治县',NULL,NULL,'1',3),(196,184,'130828','130800','围场县','河北省承德市围场满族蒙古族自治县',NULL,NULL,'1',3),(197,44,'130900','130000','沧州市','河北省沧州市',NULL,NULL,'1',2),(198,197,'130901','130900','市辖区','河北省沧州市市辖区',NULL,NULL,'0',3),(199,197,'130902','130900','新华区','河北省沧州市新华区',NULL,NULL,'1',3),(200,197,'130903','130900','运河区','河北省沧州市运河区',NULL,NULL,'1',3),(201,197,'130921','130900','沧县','河北省沧州市沧县',NULL,NULL,'1',3),(202,197,'130922','130900','青县','河北省沧州市青县',NULL,NULL,'1',3),(203,197,'130923','130900','东光县','河北省沧州市东光县',NULL,NULL,'1',3),(204,197,'130924','130900','海兴县','河北省沧州市海兴县',NULL,NULL,'1',3),(205,197,'130925','130900','盐山县','河北省沧州市盐山县',NULL,NULL,'1',3),(206,197,'130926','130900','肃宁县','河北省沧州市肃宁县',NULL,NULL,'1',3),(207,197,'130927','130900','南皮县','河北省沧州市南皮县',NULL,NULL,'1',3),(208,197,'130928','130900','吴桥县','河北省沧州市吴桥县',NULL,NULL,'1',3),(209,197,'130929','130900','献县','河北省沧州市献县',NULL,NULL,'1',3),(210,197,'130930','130900','孟村县','河北省沧州市孟村回族自治县',NULL,NULL,'1',3),(211,197,'130981','130900','泊头市','河北省沧州市泊头市',NULL,NULL,'1',3),(212,197,'130982','130900','任丘市','河北省沧州市任丘市',NULL,NULL,'1',3),(213,197,'130983','130900','黄骅市','河北省沧州市黄骅市',NULL,NULL,'1',3),(214,197,'130984','130900','河间市','河北省沧州市河间市',NULL,NULL,'1',3),(215,44,'131000','130000','廊坊市','河北省廊坊市',NULL,NULL,'1',2),(216,215,'131001','131000','市辖区','河北省廊坊市市辖区',NULL,NULL,'0',3),(217,215,'131002','131000','安次区','河北省廊坊市安次区',NULL,NULL,'1',3),(218,215,'131022','131000','固安县','河北省廊坊市固安县',NULL,NULL,'1',3),(219,215,'131023','131000','永清县','河北省廊坊市永清县',NULL,NULL,'1',3),(220,215,'131024','131000','香河县','河北省廊坊市香河县',NULL,NULL,'1',3),(221,215,'131025','131000','大城县','河北省廊坊市大城县',NULL,NULL,'1',3),(222,215,'131026','131000','文安县','河北省廊坊市文安县',NULL,NULL,'1',3),(223,215,'131028','131000','大厂县','河北省廊坊市大厂回族自治县',NULL,NULL,'1',3),(224,215,'131081','131000','霸州市','河北省廊坊市霸州市',NULL,NULL,'1',3),(225,215,'131082','131000','三河市','河北省廊坊市三河市',NULL,NULL,'1',3),(226,44,'131100','130000','衡水市','河北省衡水市',NULL,NULL,'1',2),(227,226,'131101','131100','市辖区','河北省衡水市市辖区',NULL,NULL,'0',3),(228,226,'131102','131100','桃城区','河北省衡水市桃城区',NULL,NULL,'1',3),(229,226,'131121','131100','枣强县','河北省衡水市枣强县',NULL,NULL,'1',3),(230,226,'131122','131100','武邑县','河北省衡水市武邑县',NULL,NULL,'1',3),(231,226,'131123','131100','武强县','河北省衡水市武强县',NULL,NULL,'1',3),(232,226,'131124','131100','饶阳县','河北省衡水市饶阳县',NULL,NULL,'1',3),(233,226,'131125','131100','安平县','河北省衡水市安平县',NULL,NULL,'1',3),(234,226,'131126','131100','故城县','河北省衡水市故城县',NULL,NULL,'1',3),(235,226,'131127','131100','景县','河北省衡水市景县',NULL,NULL,'1',3),(236,226,'131128','131100','阜城县','河北省衡水市阜城县',NULL,NULL,'1',3),(237,226,'131181','131100','冀州市','河北省衡水市冀州市',NULL,NULL,'1',3),(238,226,'131182','131100','深州市','河北省衡水市深州市',NULL,NULL,'1',3),(239,1,'140000','86','山西省','山西省',NULL,NULL,'1',1),(240,239,'140100','140000','太原市','山西省太原市',NULL,NULL,'1',2),(241,240,'140101','140100','市辖区','山西省太原市市辖区',NULL,NULL,'0',3),(242,240,'140105','140100','小店区','山西省太原市小店区',NULL,NULL,'1',3),(243,240,'140106','140100','迎泽区','山西省太原市迎泽区',NULL,NULL,'1',3),(244,240,'140107','140100','杏花岭区','山西省太原市杏花岭区',NULL,NULL,'1',3),(245,240,'140108','140100','尖草坪区','山西省太原市尖草坪区',NULL,NULL,'1',3),(246,240,'140109','140100','万柏林区','山西省太原市万柏林区',NULL,NULL,'1',3),(247,240,'140110','140100','晋源区','山西省太原市晋源区',NULL,NULL,'1',3),(248,240,'140121','140100','清徐县','山西省太原市清徐县',NULL,NULL,'1',3),(249,240,'140122','140100','阳曲县','山西省太原市阳曲县',NULL,NULL,'1',3),(250,240,'140123','140100','娄烦县','山西省太原市娄烦县',NULL,NULL,'1',3),(251,240,'140181','140100','古交市','山西省太原市古交市',NULL,NULL,'1',3),(252,239,'140200','140000','大同市','山西省大同市',NULL,NULL,'1',2),(253,252,'140201','140200','市辖区','山西省大同市市辖区',NULL,NULL,'0',3),(254,252,'140202','140200','城区','山西省大同市城区',NULL,NULL,'1',3),(255,252,'140203','140200','矿区','山西省大同市矿区',NULL,NULL,'1',3),(256,252,'140211','140200','南郊区','山西省大同市南郊区',NULL,NULL,'1',3),(257,252,'140212','140200','新荣区','山西省大同市新荣区',NULL,NULL,'1',3),(258,252,'140221','140200','阳高县','山西省大同市阳高县',NULL,NULL,'1',3),(259,252,'140222','140200','天镇县','山西省大同市天镇县',NULL,NULL,'1',3),(260,252,'140223','140200','广灵县','山西省大同市广灵县',NULL,NULL,'1',3),(261,252,'140224','140200','灵丘县','山西省大同市灵丘县',NULL,NULL,'1',3),(262,252,'140225','140200','浑源县','山西省大同市浑源县',NULL,NULL,'1',3),(263,252,'140226','140200','左云县','山西省大同市左云县',NULL,NULL,'1',3),(264,252,'140227','140200','大同县','山西省大同市大同县',NULL,NULL,'1',3),(265,239,'140300','140000','阳泉市','山西省阳泉市',NULL,NULL,'1',2),(266,265,'140301','140300','市辖区','山西省阳泉市市辖区',NULL,NULL,'0',3),(267,265,'140302','140300','城区','山西省阳泉市城区',NULL,NULL,'1',3),(268,265,'140303','140300','矿区','山西省阳泉市矿区',NULL,NULL,'1',3),(269,265,'140311','140300','郊区','山西省阳泉市郊区',NULL,NULL,'1',3),(270,265,'140321','140300','平定县','山西省阳泉市平定县',NULL,NULL,'1',3),(271,265,'140322','140300','盂县','山西省阳泉市盂县',NULL,NULL,'1',3),(272,239,'140400','140000','长治市','山西省长治市',NULL,NULL,'1',2),(273,272,'140401','140400','市辖区','山西省长治市市辖区',NULL,NULL,'0',3),(274,272,'140402','140400','城区','山西省长治市城区',NULL,NULL,'1',3),(275,272,'140411','140400','郊区','山西省长治市郊区',NULL,NULL,'1',3),(276,272,'140421','140400','长治县','山西省长治市长治县',NULL,NULL,'1',3),(277,272,'140423','140400','襄垣县','山西省长治市襄垣县',NULL,NULL,'1',3),(278,272,'140424','140400','屯留县','山西省长治市屯留县',NULL,NULL,'1',3),(279,272,'140425','140400','平顺县','山西省长治市平顺县',NULL,NULL,'1',3),(280,272,'140426','140400','黎城县','山西省长治市黎城县',NULL,NULL,'1',3),(281,272,'140427','140400','壶关县','山西省长治市壶关县',NULL,NULL,'1',3),(282,272,'140428','140400','长子县','山西省长治市长子县',NULL,NULL,'1',3),(283,272,'140429','140400','武乡县','山西省长治市武乡县',NULL,NULL,'1',3),(284,272,'140430','140400','沁县','山西省长治市沁县',NULL,NULL,'1',3),(285,272,'140431','140400','沁源县','山西省长治市沁源县',NULL,NULL,'1',3),(286,272,'140481','140400','潞城市','山西省长治市潞城市',NULL,NULL,'1',3),(287,239,'140500','140000','晋城市','山西省晋城市',NULL,NULL,'1',2),(288,287,'140501','140500','市辖区','山西省晋城市市辖区',NULL,NULL,'0',3),(289,287,'140502','140500','城区','山西省晋城市城区',NULL,NULL,'1',3),(290,287,'140521','140500','沁水县','山西省晋城市沁水县',NULL,NULL,'1',3),(291,287,'140522','140500','阳城县','山西省晋城市阳城县',NULL,NULL,'1',3),(292,287,'140524','140500','陵川县','山西省晋城市陵川县',NULL,NULL,'1',3),(293,287,'140525','140500','泽州县','山西省晋城市泽州县',NULL,NULL,'1',3),(294,287,'140581','140500','高平市','山西省晋城市高平市',NULL,NULL,'1',3),(295,239,'140600','140000','朔州市','山西省朔州市',NULL,NULL,'1',2),(296,295,'140601','140600','市辖区','山西省朔州市市辖区',NULL,NULL,'0',3),(297,295,'140602','140600','朔城区','山西省朔州市朔城区',NULL,NULL,'1',3),(298,295,'140603','140600','平鲁区','山西省朔州市平鲁区',NULL,NULL,'1',3),(299,295,'140621','140600','山阴县','山西省朔州市山阴县',NULL,NULL,'1',3),(300,295,'140622','140600','应县','山西省朔州市应县',NULL,NULL,'1',3),(301,295,'140623','140600','右玉县','山西省朔州市右玉县',NULL,NULL,'1',3),(302,295,'140624','140600','怀仁县','山西省朔州市怀仁县',NULL,NULL,'1',3),(303,239,'142200','140000','忻州地区','山西省忻州地区',NULL,NULL,'1',2),(304,303,'142201','142200','忻州市','山西省忻州地区忻州市',NULL,NULL,'1',3),(305,303,'142202','142200','原平市','山西省忻州地区原平市',NULL,NULL,'1',3),(306,303,'142222','142200','定襄县','山西省忻州地区定襄县',NULL,NULL,'1',3),(307,303,'142223','142200','五台县','山西省忻州地区五台县',NULL,NULL,'1',3),(308,303,'142225','142200','代县','山西省忻州地区代县',NULL,NULL,'1',3),(309,303,'142226','142200','繁峙县','山西省忻州地区繁峙县',NULL,NULL,'1',3),(310,303,'142227','142200','宁武县','山西省忻州地区宁武县',NULL,NULL,'1',3),(311,303,'142228','142200','静乐县','山西省忻州地区静乐县',NULL,NULL,'1',3),(312,303,'142229','142200','神池县','山西省忻州地区神池县',NULL,NULL,'1',3),(313,303,'142230','142200','五寨县','山西省忻州地区五寨县',NULL,NULL,'1',3),(314,303,'142231','142200','岢岚县','山西省忻州地区岢岚县',NULL,NULL,'1',3),(315,303,'142232','142200','河曲县','山西省忻州地区河曲县',NULL,NULL,'1',3),(316,303,'142233','142200','保德县','山西省忻州地区保德县',NULL,NULL,'1',3),(317,303,'142234','142200','偏关县','山西省忻州地区偏关县',NULL,NULL,'1',3),(318,303,'142300','142200','吕梁地区','山西省忻州地区吕梁地区',NULL,NULL,'1',2),(319,303,'142301','142200','孝义市','山西省忻州地区孝义市',NULL,NULL,'1',3),(320,303,'142302','142200','离石市','山西省忻州地区离石市',NULL,NULL,'1',3),(321,303,'142303','142200','汾阳市','山西省忻州地区汾阳市',NULL,NULL,'1',3),(322,303,'142322','142200','文水县','山西省忻州地区文水县',NULL,NULL,'1',3),(323,303,'142323','142200','交城县','山西省忻州地区交城县',NULL,NULL,'1',3),(324,303,'142325','142200','兴县','山西省忻州地区兴县',NULL,NULL,'1',3),(325,303,'142326','142200','临县','山西省忻州地区临县',NULL,NULL,'1',3),(326,303,'142327','142200','柳林县','山西省忻州地区柳林县',NULL,NULL,'1',3),(327,303,'142328','142200','石楼县','山西省忻州地区石楼县',NULL,NULL,'1',3),(328,303,'142329','142200','岚县','山西省忻州地区岚县',NULL,NULL,'1',3),(329,303,'142330','142200','方山县','山西省忻州地区方山县',NULL,NULL,'1',3),(330,303,'142332','142200','中阳县','山西省忻州地区中阳县',NULL,NULL,'1',3),(331,303,'142333','142200','交口县','山西省忻州地区交口县',NULL,NULL,'1',3),(332,239,'142400','140000','晋中地区','山西省晋中地区',NULL,NULL,'1',2),(333,332,'142401','142400','榆次市','山西省晋中地区榆次市',NULL,NULL,'1',3),(334,332,'142402','142400','介休市','山西省晋中地区介休市',NULL,NULL,'1',3),(335,332,'142421','142400','榆社县','山西省晋中地区榆社县',NULL,NULL,'1',3),(336,332,'142422','142400','左权县','山西省晋中地区左权县',NULL,NULL,'1',3),(337,332,'142423','142400','和顺县','山西省晋中地区和顺县',NULL,NULL,'1',3),(338,332,'142424','142400','昔阳县','山西省晋中地区昔阳县',NULL,NULL,'1',3),(339,332,'142427','142400','寿阳县','山西省晋中地区寿阳县',NULL,NULL,'1',3),(340,332,'142429','142400','太谷县','山西省晋中地区太谷县',NULL,NULL,'1',3),(341,332,'142430','142400','祁县','山西省晋中地区祁县',NULL,NULL,'1',3),(342,332,'142431','142400','平遥县','山西省晋中地区平遥县',NULL,NULL,'1',3),(343,332,'142433','142400','灵石县','山西省晋中地区灵石县',NULL,NULL,'1',3),(344,239,'142600','140000','临汾地区','山西省临汾地区',NULL,NULL,'1',2),(345,344,'142601','142600','临汾市','山西省临汾地区临汾市',NULL,NULL,'1',3),(346,344,'142602','142600','侯马市','山西省临汾地区侯马市',NULL,NULL,'1',3),(347,344,'142603','142600','霍州市','山西省临汾地区霍州市',NULL,NULL,'1',3),(348,344,'142621','142600','曲沃县','山西省临汾地区曲沃县',NULL,NULL,'1',3),(349,344,'142622','142600','翼城县','山西省临汾地区翼城县',NULL,NULL,'1',3),(350,344,'142623','142600','襄汾县','山西省临汾地区襄汾县',NULL,NULL,'1',3),(351,344,'142625','142600','洪洞县','山西省临汾地区洪洞县',NULL,NULL,'1',3),(352,344,'142627','142600','古县','山西省临汾地区古县',NULL,NULL,'1',3),(353,344,'142628','142600','安泽县','山西省临汾地区安泽县',NULL,NULL,'1',3),(354,344,'142629','142600','浮山县','山西省临汾地区浮山县',NULL,NULL,'1',3),(355,344,'142630','142600','吉县','山西省临汾地区吉县',NULL,NULL,'1',3),(356,344,'142631','142600','乡宁县','山西省临汾地区乡宁县',NULL,NULL,'1',3),(357,344,'142632','142600','蒲县','山西省临汾地区蒲县',NULL,NULL,'1',3),(358,344,'142633','142600','大宁县','山西省临汾地区大宁县',NULL,NULL,'1',3),(359,344,'142634','142600','永和县','山西省临汾地区永和县',NULL,NULL,'1',3),(360,344,'142635','142600','隰县','山西省临汾地区隰县',NULL,NULL,'1',3),(361,344,'142636','142600','汾西县','山西省临汾地区汾西县',NULL,NULL,'1',3),(362,239,'142700','140000','运城地区','山西省运城地区',NULL,NULL,'1',2),(363,362,'142701','142700','运城市','山西省运城地区运城市',NULL,NULL,'1',3),(364,362,'142702','142700','永济市','山西省运城地区永济市',NULL,NULL,'1',3),(365,362,'142703','142700','河津市','山西省运城地区河津市',NULL,NULL,'1',3),(366,362,'142723','142700','芮城县','山西省运城地区芮城县',NULL,NULL,'1',3),(367,362,'142724','142700','临猗县','山西省运城地区临猗县',NULL,NULL,'1',3),(368,362,'142725','142700','万荣县','山西省运城地区万荣县',NULL,NULL,'1',3),(369,362,'142726','142700','新绛县','山西省运城地区新绛县',NULL,NULL,'1',3),(370,362,'142727','142700','稷山县','山西省运城地区稷山县',NULL,NULL,'1',3),(371,362,'142729','142700','闻喜县','山西省运城地区闻喜县',NULL,NULL,'1',3),(372,362,'142730','142700','夏县','山西省运城地区夏县',NULL,NULL,'1',3),(373,362,'142731','142700','绛县','山西省运城地区绛县',NULL,NULL,'1',3),(374,362,'142732','142700','平陆县','山西省运城地区平陆县',NULL,NULL,'1',3),(375,362,'142733','142700','垣曲县','山西省运城地区垣曲县',NULL,NULL,'1',3),(376,1,'150000','86','内蒙古','内蒙古自治区',NULL,NULL,'1',1),(377,376,'150100','150000','呼和浩特市','内蒙古自治区呼和浩特市',NULL,NULL,'1',2),(378,377,'150101','150100','市辖区','内蒙古自治区呼和浩特市市辖区',NULL,NULL,'0',3),(379,377,'150102','150100','新城区','内蒙古自治区呼和浩特市新城区',NULL,NULL,'1',3),(380,377,'150103','150100','回民区','内蒙古自治区呼和浩特市回民区',NULL,NULL,'1',3),(381,377,'150104','150100','玉泉区','内蒙古自治区呼和浩特市玉泉区',NULL,NULL,'1',3),(382,377,'150105','150100','郊区','内蒙古自治区呼和浩特市郊区',NULL,NULL,'1',3),(383,377,'150121','150100','土默特左旗','内蒙古自治区呼和浩特市土默特左旗',NULL,NULL,'1',3),(384,377,'150122','150100','托克托县','内蒙古自治区呼和浩特市托克托县',NULL,NULL,'1',3),(385,377,'150123','150100','和林格尔县','内蒙古自治区呼和浩特市和林格尔县',NULL,NULL,'1',3),(386,377,'150124','150100','清水河县','内蒙古自治区呼和浩特市清水河县',NULL,NULL,'1',3),(387,377,'150125','150100','武川县','内蒙古自治区呼和浩特市武川县',NULL,NULL,'1',3),(388,376,'150200','150000','包头市','内蒙古自治区包头市',NULL,NULL,'1',2),(389,388,'150201','150200','市辖区','内蒙古自治区包头市市辖区',NULL,NULL,'0',3),(390,388,'150202','150200','东河区','内蒙古自治区包头市东河区',NULL,NULL,'1',3),(391,388,'150203','150200','昆都伦区','内蒙古自治区包头市昆都伦区',NULL,NULL,'1',3),(392,388,'150204','150200','青山区','内蒙古自治区包头市青山区',NULL,NULL,'1',3),(393,388,'150205','150200','石拐矿区','内蒙古自治区包头市石拐矿区',NULL,NULL,'1',3),(394,388,'150206','150200','白云矿区','内蒙古自治区包头市白云矿区',NULL,NULL,'1',3),(395,388,'150207','150200','郊区','内蒙古自治区包头市郊区',NULL,NULL,'1',3),(396,388,'150221','150200','土默特右旗','内蒙古自治区包头市土默特右旗',NULL,NULL,'1',3),(397,388,'150222','150200','固阳县','内蒙古自治区包头市固阳县',NULL,NULL,'1',3),(398,388,'150223','150200','达茂旗','内蒙古自治区包头市达尔罕茂明安联合旗',NULL,NULL,'1',3),(399,376,'150300','150000','乌海市','内蒙古自治区乌海市',NULL,NULL,'1',2),(400,399,'150301','150300','市辖区','内蒙古自治区乌海市市辖区',NULL,NULL,'0',3),(401,399,'150302','150300','海勃湾区','内蒙古自治区乌海市海勃湾区',NULL,NULL,'1',3),(402,399,'150303','150300','海南区','内蒙古自治区乌海市海南区',NULL,NULL,'1',3),(403,399,'150304','150300','乌达区','内蒙古自治区乌海市乌达区',NULL,NULL,'1',3),(404,376,'150400','150000','赤峰市','内蒙古自治区赤峰市',NULL,NULL,'1',2),(405,404,'150401','150400','市辖区','内蒙古自治区赤峰市市辖区',NULL,NULL,'0',3),(406,404,'150402','150400','红山区','内蒙古自治区赤峰市红山区',NULL,NULL,'1',3),(407,404,'150403','150400','元宝山区','内蒙古自治区赤峰市元宝山区',NULL,NULL,'1',3),(408,404,'150404','150400','松山区','内蒙古自治区赤峰市松山区',NULL,NULL,'1',3),(409,404,'150421','150400','阿鲁科尔沁旗','内蒙古自治区赤峰市阿鲁科尔沁旗',NULL,NULL,'1',3),(410,404,'150422','150400','巴林左旗','内蒙古自治区赤峰市巴林左旗',NULL,NULL,'1',3),(411,404,'150423','150400','巴林右旗','内蒙古自治区赤峰市巴林右旗',NULL,NULL,'1',3),(412,404,'150424','150400','林西县','内蒙古自治区赤峰市林西县',NULL,NULL,'1',3),(413,404,'150425','150400','克什克腾旗','内蒙古自治区赤峰市克什克腾旗',NULL,NULL,'1',3),(414,404,'150426','150400','翁牛特旗','内蒙古自治区赤峰市翁牛特旗',NULL,NULL,'1',3),(415,404,'150428','150400','喀喇沁旗','内蒙古自治区赤峰市喀喇沁旗',NULL,NULL,'1',3),(416,404,'150429','150400','宁城县','内蒙古自治区赤峰市宁城县',NULL,NULL,'1',3),(417,404,'150430','150400','敖汉旗','内蒙古自治区赤峰市敖汉旗',NULL,NULL,'1',3),(418,376,'152100','150000','呼伦贝尔盟','内蒙古自治区呼伦贝尔盟',NULL,NULL,'1',2),(419,418,'152101','152100','海拉尔市','内蒙古自治区呼伦贝尔盟海拉尔市',NULL,NULL,'1',3),(420,418,'152102','152100','满洲里市','内蒙古自治区呼伦贝尔盟满洲里市',NULL,NULL,'1',3),(421,418,'152103','152100','扎兰屯市','内蒙古自治区呼伦贝尔盟扎兰屯市',NULL,NULL,'1',3),(422,418,'152104','152100','牙克石市','内蒙古自治区呼伦贝尔盟牙克石市',NULL,NULL,'1',3),(423,418,'152105','152100','根河市','内蒙古自治区呼伦贝尔盟根河市',NULL,NULL,'1',3),(424,418,'152106','152100','额尔古纳市','内蒙古自治区呼伦贝尔盟额尔古纳市',NULL,NULL,'1',3),(425,418,'152122','152100','阿荣旗','内蒙古自治区呼伦贝尔盟阿荣旗',NULL,NULL,'1',3),(426,418,'152123','152100','莫力达瓦','内蒙古自治区呼伦贝尔盟莫力达瓦达斡尔族自治旗',NULL,NULL,'1',3),(427,418,'152127','152100','鄂伦春自治旗','内蒙古自治区呼伦贝尔盟鄂伦春自治旗',NULL,NULL,'1',3),(428,418,'152128','152100','鄂温克族自治旗','内蒙古自治区呼伦贝尔盟鄂温克族自治旗',NULL,NULL,'1',3),(429,418,'152129','152100','新巴尔虎右旗','内蒙古自治区呼伦贝尔盟新巴尔虎右旗',NULL,NULL,'1',3),(430,418,'152130','152100','新巴尔虎左旗','内蒙古自治区呼伦贝尔盟新巴尔虎左旗',NULL,NULL,'1',3),(431,418,'152131','152100','陈巴尔虎旗','内蒙古自治区呼伦贝尔盟陈巴尔虎旗',NULL,NULL,'1',3),(432,376,'152200','150000','兴安盟','内蒙古自治区兴安盟',NULL,NULL,'1',2),(433,432,'152201','152200','乌兰浩特市','内蒙古自治区兴安盟乌兰浩特市',NULL,NULL,'1',3),(434,432,'152202','152200','阿尔山市','内蒙古自治区兴安盟阿尔山市',NULL,NULL,'1',3),(435,432,'152221','152200','科尔沁右翼前旗','内蒙古自治区兴安盟科尔沁右翼前旗',NULL,NULL,'1',3),(436,432,'152222','152200','科尔沁右翼中旗','内蒙古自治区兴安盟科尔沁右翼中旗',NULL,NULL,'1',3),(437,432,'152223','152200','扎赉特旗','内蒙古自治区兴安盟扎赉特旗',NULL,NULL,'1',3),(438,432,'152224','152200','突泉县','内蒙古自治区兴安盟突泉县',NULL,NULL,'1',3),(439,376,'152300','150000','哲里木盟','内蒙古自治区哲里木盟',NULL,NULL,'1',2),(440,439,'152301','152300','通辽市','内蒙古自治区哲里木盟通辽市',NULL,NULL,'1',3),(441,439,'152302','152300','霍林郭勒市','内蒙古自治区哲里木盟霍林郭勒市',NULL,NULL,'1',3),(442,439,'152322','152300','科尔沁左翼中旗','内蒙古自治区哲里木盟科尔沁左翼中旗',NULL,NULL,'1',3),(443,439,'152323','152300','科尔沁左翼后旗','内蒙古自治区哲里木盟科尔沁左翼后旗',NULL,NULL,'1',3),(444,439,'152324','152300','开鲁县','内蒙古自治区哲里木盟开鲁县',NULL,NULL,'1',3),(445,439,'152325','152300','库伦旗','内蒙古自治区哲里木盟库伦旗',NULL,NULL,'1',3),(446,439,'152326','152300','奈曼旗','内蒙古自治区哲里木盟奈曼旗',NULL,NULL,'1',3),(447,439,'152327','152300','扎鲁特旗','内蒙古自治区哲里木盟扎鲁特旗',NULL,NULL,'1',3),(448,376,'152500','150000','锡林郭勒盟','内蒙古自治区锡林郭勒盟',NULL,NULL,'1',2),(449,448,'152501','152500','二连浩特市','内蒙古自治区锡林郭勒盟二连浩特市',NULL,NULL,'1',3),(450,448,'152502','152500','锡林浩特市','内蒙古自治区锡林郭勒盟锡林浩特市',NULL,NULL,'1',3),(451,448,'152522','152500','阿巴嘎旗','内蒙古自治区锡林郭勒盟阿巴嘎旗',NULL,NULL,'1',3),(452,448,'152523','152500','苏尼特左旗','内蒙古自治区锡林郭勒盟苏尼特左旗',NULL,NULL,'1',3),(453,448,'152524','152500','苏尼特右旗','内蒙古自治区锡林郭勒盟苏尼特右旗',NULL,NULL,'1',3),(454,448,'152525','152500','东乌珠穆沁旗','内蒙古自治区锡林郭勒盟东乌珠穆沁旗',NULL,NULL,'1',3),(455,448,'152526','152500','西乌珠穆沁旗','内蒙古自治区锡林郭勒盟西乌珠穆沁旗',NULL,NULL,'1',3),(456,448,'152527','152500','太仆寺旗','内蒙古自治区锡林郭勒盟太仆寺旗',NULL,NULL,'1',3),(457,448,'152528','152500','镶黄旗','内蒙古自治区锡林郭勒盟镶黄旗',NULL,NULL,'1',3),(458,448,'152529','152500','正镶白旗','内蒙古自治区锡林郭勒盟正镶白旗',NULL,NULL,'1',3),(459,448,'152530','152500','正蓝旗','内蒙古自治区锡林郭勒盟正蓝旗',NULL,NULL,'1',3),(460,448,'152531','152500','多伦县','内蒙古自治区锡林郭勒盟多伦县',NULL,NULL,'1',3),(461,376,'152600','150000','乌兰察布盟','内蒙古自治区乌兰察布盟',NULL,NULL,'1',2),(462,461,'152601','152600','集宁市','内蒙古自治区乌兰察布盟集宁市',NULL,NULL,'1',3),(463,461,'152602','152600','丰镇市','内蒙古自治区乌兰察布盟丰镇市',NULL,NULL,'1',3),(464,461,'152624','152600','卓资县','内蒙古自治区乌兰察布盟卓资县',NULL,NULL,'1',3),(465,461,'152625','152600','化德县','内蒙古自治区乌兰察布盟化德县',NULL,NULL,'1',3),(466,461,'152626','152600','商都县','内蒙古自治区乌兰察布盟商都县',NULL,NULL,'1',3),(467,461,'152627','152600','兴和县','内蒙古自治区乌兰察布盟兴和县',NULL,NULL,'1',3),(468,461,'152629','152600','凉城县','内蒙古自治区乌兰察布盟凉城县',NULL,NULL,'1',3),(469,461,'152630','152600','察哈尔右翼前旗','内蒙古自治区乌兰察布盟察哈尔右翼前旗',NULL,NULL,'1',3),(470,461,'152631','152600','察哈尔右翼中旗','内蒙古自治区乌兰察布盟察哈尔右翼中旗',NULL,NULL,'1',3),(471,461,'152632','152600','察哈尔右翼后旗','内蒙古自治区乌兰察布盟察哈尔右翼后旗',NULL,NULL,'1',3),(472,461,'152634','152600','四子王旗','内蒙古自治区乌兰察布盟四子王旗',NULL,NULL,'1',3),(473,376,'152700','150000','伊克昭盟','内蒙古自治区伊克昭盟',NULL,NULL,'1',2),(474,473,'152701','152700','东胜市','内蒙古自治区伊克昭盟东胜市',NULL,NULL,'1',3),(475,473,'152722','152700','达拉特旗','内蒙古自治区伊克昭盟达拉特旗',NULL,NULL,'1',3),(476,473,'152723','152700','准格尔旗','内蒙古自治区伊克昭盟准格尔旗',NULL,NULL,'1',3),(477,473,'152724','152700','鄂托克前旗','内蒙古自治区伊克昭盟鄂托克前旗',NULL,NULL,'1',3),(478,473,'152725','152700','鄂托克旗','内蒙古自治区伊克昭盟鄂托克旗',NULL,NULL,'1',3),(479,473,'152726','152700','杭锦旗','内蒙古自治区伊克昭盟杭锦旗',NULL,NULL,'1',3),(480,473,'152727','152700','乌审旗','内蒙古自治区伊克昭盟乌审旗',NULL,NULL,'1',3),(481,473,'152728','152700','伊金霍洛旗','内蒙古自治区伊克昭盟伊金霍洛旗',NULL,NULL,'1',3),(482,376,'152800','150000','巴彦淖尔盟','内蒙古自治区巴彦淖尔盟',NULL,NULL,'1',2),(483,482,'152801','152800','临河市','内蒙古自治区巴彦淖尔盟临河市',NULL,NULL,'1',3),(484,482,'152822','152800','五原县','内蒙古自治区巴彦淖尔盟五原县',NULL,NULL,'1',3),(485,482,'152823','152800','磴口县','内蒙古自治区巴彦淖尔盟磴口县',NULL,NULL,'1',3),(486,482,'152824','152800','乌拉特前旗','内蒙古自治区巴彦淖尔盟乌拉特前旗',NULL,NULL,'1',3),(487,482,'152825','152800','乌拉特中旗','内蒙古自治区巴彦淖尔盟乌拉特中旗',NULL,NULL,'1',3),(488,482,'152826','152800','乌拉特后旗','内蒙古自治区巴彦淖尔盟乌拉特后旗',NULL,NULL,'1',3),(489,482,'152827','152800','杭锦后旗','内蒙古自治区巴彦淖尔盟杭锦后旗',NULL,NULL,'1',3),(490,376,'152900','150000','阿拉善盟','内蒙古自治区阿拉善盟',NULL,NULL,'1',2),(491,490,'152921','152900','阿拉善左旗','内蒙古自治区阿拉善盟阿拉善左旗',NULL,NULL,'1',3),(492,490,'152922','152900','阿拉善右旗','内蒙古自治区阿拉善盟阿拉善右旗',NULL,NULL,'1',3),(493,490,'152923','152900','额济纳旗','内蒙古自治区阿拉善盟额济纳旗',NULL,NULL,'1',3),(494,1,'210000','86','辽宁省','辽宁省',NULL,NULL,'1',1),(495,494,'210100','210000','沈阳市','辽宁省沈阳市',NULL,NULL,'1',2),(496,495,'210101','210100','市辖区','辽宁省沈阳市市辖区',NULL,NULL,'0',3),(497,495,'210102','210100','和平区','辽宁省沈阳市和平区',NULL,NULL,'1',3),(498,495,'210103','210100','沈河区','辽宁省沈阳市沈河区',NULL,NULL,'1',3),(499,495,'210104','210100','大东区','辽宁省沈阳市大东区',NULL,NULL,'1',3),(500,495,'210105','210100','皇姑区','辽宁省沈阳市皇姑区',NULL,NULL,'1',3),(501,495,'210106','210100','铁西区','辽宁省沈阳市铁西区',NULL,NULL,'1',3),(502,495,'210111','210100','苏家屯区','辽宁省沈阳市苏家屯区',NULL,NULL,'1',3),(503,495,'210112','210100','东陵区','辽宁省沈阳市东陵区',NULL,NULL,'1',3),(504,495,'210113','210100','新城子区','辽宁省沈阳市新城子区',NULL,NULL,'1',3),(505,495,'210114','210100','于洪区','辽宁省沈阳市于洪区',NULL,NULL,'1',3),(506,495,'210122','210100','辽中县','辽宁省沈阳市辽中县',NULL,NULL,'1',3),(507,495,'210123','210100','康平县','辽宁省沈阳市康平县',NULL,NULL,'1',3),(508,495,'210124','210100','法库县','辽宁省沈阳市法库县',NULL,NULL,'1',3),(509,495,'210181','210100','新民市','辽宁省沈阳市新民市',NULL,NULL,'1',3),(510,494,'210200','210000','大连市','辽宁省大连市',NULL,NULL,'1',2),(511,510,'210201','210200','市辖区','辽宁省大连市市辖区',NULL,NULL,'0',3),(512,510,'210202','210200','中山区','辽宁省大连市中山区',NULL,NULL,'1',3),(513,510,'210203','210200','西岗区','辽宁省大连市西岗区',NULL,NULL,'1',3),(514,510,'210204','210200','沙河口区','辽宁省大连市沙河口区',NULL,NULL,'1',3),(515,510,'210211','210200','甘井子区','辽宁省大连市甘井子区',NULL,NULL,'1',3),(516,510,'210212','210200','旅顺口区','辽宁省大连市旅顺口区',NULL,NULL,'1',3),(517,510,'210213','210200','金州区','辽宁省大连市金州区',NULL,NULL,'1',3),(518,510,'210224','210200','长海县','辽宁省大连市长海县',NULL,NULL,'1',3),(519,510,'210281','210200','瓦房店市','辽宁省大连市瓦房店市',NULL,NULL,'1',3),(520,510,'210282','210200','普兰店市','辽宁省大连市普兰店市',NULL,NULL,'1',3),(521,510,'210283','210200','庄河市','辽宁省大连市庄河市',NULL,NULL,'1',3),(522,494,'210300','210000','鞍山市','辽宁省鞍山市',NULL,NULL,'1',2),(523,522,'210301','210300','市辖区','辽宁省鞍山市市辖区',NULL,NULL,'0',3),(524,522,'210302','210300','铁东区','辽宁省鞍山市铁东区',NULL,NULL,'1',3),(525,522,'210303','210300','铁西区','辽宁省鞍山市铁西区',NULL,NULL,'1',3),(526,522,'210304','210300','立山区','辽宁省鞍山市立山区',NULL,NULL,'1',3),(527,522,'210311','210300','千山区','辽宁省鞍山市千山区',NULL,NULL,'1',3),(528,522,'210321','210300','台安县','辽宁省鞍山市台安县',NULL,NULL,'1',3),(529,522,'210323','210300','岫岩县','辽宁省鞍山市岫岩满族自治县',NULL,NULL,'1',3),(530,522,'210381','210300','海城市','辽宁省鞍山市海城市',NULL,NULL,'1',3),(531,494,'210400','210000','抚顺市','辽宁省抚顺市',NULL,NULL,'1',2),(532,531,'210401','210400','市辖区','辽宁省抚顺市市辖区',NULL,NULL,'0',3),(533,531,'210402','210400','新抚区','辽宁省抚顺市新抚区',NULL,NULL,'1',3),(534,531,'210403','210400','露天区','辽宁省抚顺市露天区',NULL,NULL,'1',3),(535,531,'210404','210400','望花区','辽宁省抚顺市望花区',NULL,NULL,'1',3),(536,531,'210411','210400','顺城区','辽宁省抚顺市顺城区',NULL,NULL,'1',3),(537,531,'210421','210400','抚顺县','辽宁省抚顺市抚顺县',NULL,NULL,'1',3),(538,531,'210422','210400','新宾县','辽宁省抚顺市新宾满族自治县',NULL,NULL,'1',3),(539,531,'210423','210400','清原县','辽宁省抚顺市清原满族自治县',NULL,NULL,'1',3),(540,494,'210500','210000','本溪市','辽宁省本溪市',NULL,NULL,'1',2),(541,540,'210501','210500','市辖区','辽宁省本溪市市辖区',NULL,NULL,'0',3),(542,540,'210502','210500','平山区','辽宁省本溪市平山区',NULL,NULL,'1',3),(543,540,'210503','210500','溪湖区','辽宁省本溪市溪湖区',NULL,NULL,'1',3),(544,540,'210504','210500','明山区','辽宁省本溪市明山区',NULL,NULL,'1',3),(545,540,'210505','210500','南芬区','辽宁省本溪市南芬区',NULL,NULL,'1',3),(546,540,'210521','210500','本溪县','辽宁省本溪市本溪满族自治县',NULL,NULL,'1',3),(547,540,'210522','210500','桓仁县','辽宁省本溪市桓仁满族自治县',NULL,NULL,'1',3),(548,494,'210600','210000','丹东市','辽宁省丹东市',NULL,NULL,'1',2),(549,548,'210601','210600','市辖区','辽宁省丹东市市辖区',NULL,NULL,'0',3),(550,548,'210602','210600','元宝区','辽宁省丹东市元宝区',NULL,NULL,'1',3),(551,548,'210603','210600','振兴区','辽宁省丹东市振兴区',NULL,NULL,'1',3),(552,548,'210604','210600','振安区','辽宁省丹东市振安区',NULL,NULL,'1',3),(553,548,'210624','210600','宽甸县','辽宁省丹东市宽甸满族自治县',NULL,NULL,'1',3),(554,548,'210681','210600','东港市','辽宁省丹东市东港市',NULL,NULL,'1',3),(555,548,'210682','210600','凤城市','辽宁省丹东市凤城市',NULL,NULL,'1',3),(556,494,'210700','210000','锦州市','辽宁省锦州市',NULL,NULL,'1',2),(557,556,'210701','210700','市辖区','辽宁省锦州市市辖区',NULL,NULL,'0',3),(558,556,'210702','210700','古塔区','辽宁省锦州市古塔区',NULL,NULL,'1',3),(559,556,'210703','210700','凌河区','辽宁省锦州市凌河区',NULL,NULL,'1',3),(560,556,'210711','210700','太和区','辽宁省锦州市太和区',NULL,NULL,'1',3),(561,556,'210726','210700','黑山县','辽宁省锦州市黑山县',NULL,NULL,'1',3),(562,556,'210727','210700','义县','辽宁省锦州市义县',NULL,NULL,'1',3),(563,556,'210781','210700','凌海市','辽宁省锦州市凌海市',NULL,NULL,'1',3),(564,556,'210782','210700','北宁市','辽宁省锦州市北宁市',NULL,NULL,'1',3),(565,494,'210800','210000','营口市','辽宁省营口市',NULL,NULL,'1',2),(566,565,'210801','210800','市辖区','辽宁省营口市市辖区',NULL,NULL,'0',3),(567,565,'210802','210800','站前区','辽宁省营口市站前区',NULL,NULL,'1',3),(568,565,'210803','210800','西市区','辽宁省营口市西市区',NULL,NULL,'1',3),(569,565,'210804','210800','鲅鱼圈区','辽宁省营口市鲅鱼圈区',NULL,NULL,'1',3),(570,565,'210811','210800','老边区','辽宁省营口市老边区',NULL,NULL,'1',3),(571,565,'210881','210800','盖州市','辽宁省营口市盖州市',NULL,NULL,'1',3),(572,565,'210882','210800','大石桥市','辽宁省营口市大石桥市',NULL,NULL,'1',3),(573,494,'210900','210000','阜新市','辽宁省阜新市',NULL,NULL,'1',2),(574,573,'210901','210900','市辖区','辽宁省阜新市市辖区',NULL,NULL,'0',3),(575,573,'210902','210900','海州区','辽宁省阜新市海州区',NULL,NULL,'1',3),(576,573,'210903','210900','新邱区','辽宁省阜新市新邱区',NULL,NULL,'1',3),(577,573,'210904','210900','太平区','辽宁省阜新市太平区',NULL,NULL,'1',3),(578,573,'210905','210900','清河门区','辽宁省阜新市清河门区',NULL,NULL,'1',3),(579,573,'210911','210900','细河区','辽宁省阜新市细河区',NULL,NULL,'1',3),(580,573,'210921','210900','阜新县','辽宁省阜新市阜新蒙古族自治县',NULL,NULL,'1',3),(581,573,'210922','210900','彰武县','辽宁省阜新市彰武县',NULL,NULL,'1',3),(582,494,'211000','210000','辽阳市','辽宁省辽阳市',NULL,NULL,'1',2),(583,582,'211001','211000','市辖区','辽宁省辽阳市市辖区',NULL,NULL,'0',3),(584,582,'211002','211000','白塔区','辽宁省辽阳市白塔区',NULL,NULL,'1',3),(585,582,'211003','211000','文圣区','辽宁省辽阳市文圣区',NULL,NULL,'1',3),(586,582,'211004','211000','宏伟区','辽宁省辽阳市宏伟区',NULL,NULL,'1',3),(587,582,'211005','211000','弓长岭区','辽宁省辽阳市弓长岭区',NULL,NULL,'1',3),(588,582,'211011','211000','太子河区','辽宁省辽阳市太子河区',NULL,NULL,'1',3),(589,582,'211021','211000','辽阳县','辽宁省辽阳市辽阳县',NULL,NULL,'1',3),(590,582,'211081','211000','灯塔市','辽宁省辽阳市灯塔市',NULL,NULL,'1',3),(591,494,'211100','210000','盘锦市','辽宁省盘锦市',NULL,NULL,'1',2),(592,591,'211101','211100','市辖区','辽宁省盘锦市市辖区',NULL,NULL,'0',3),(593,591,'211102','211100','双台子区','辽宁省盘锦市双台子区',NULL,NULL,'1',3),(594,591,'211103','211100','兴隆台区','辽宁省盘锦市兴隆台区',NULL,NULL,'1',3),(595,591,'211121','211100','大洼县','辽宁省盘锦市大洼县',NULL,NULL,'1',3),(596,591,'211122','211100','盘山县','辽宁省盘锦市盘山县',NULL,NULL,'1',3),(597,494,'211200','210000','铁岭市','辽宁省铁岭市',NULL,NULL,'1',2),(598,597,'211201','211200','市辖区','辽宁省铁岭市市辖区',NULL,NULL,'0',3),(599,597,'211202','211200','银州区','辽宁省铁岭市银州区',NULL,NULL,'1',3),(600,597,'211204','211200','清河区','辽宁省铁岭市清河区',NULL,NULL,'1',3),(601,597,'211221','211200','铁岭县','辽宁省铁岭市铁岭县',NULL,NULL,'1',3),(602,597,'211223','211200','西丰县','辽宁省铁岭市西丰县',NULL,NULL,'1',3),(603,597,'211224','211200','昌图县','辽宁省铁岭市昌图县',NULL,NULL,'1',3),(604,597,'211281','211200','铁法市','辽宁省铁岭市铁法市',NULL,NULL,'1',3),(605,597,'211282','211200','开原市','辽宁省铁岭市开原市',NULL,NULL,'1',3),(606,494,'211300','210000','朝阳市','辽宁省朝阳市',NULL,NULL,'1',2),(607,606,'211301','211300','市辖区','辽宁省朝阳市市辖区',NULL,NULL,'0',3),(608,606,'211302','211300','双塔区','辽宁省朝阳市双塔区',NULL,NULL,'1',3),(609,606,'211303','211300','龙城区','辽宁省朝阳市龙城区',NULL,NULL,'1',3),(610,606,'211321','211300','朝阳县','辽宁省朝阳市朝阳县',NULL,NULL,'1',3),(611,606,'211322','211300','建平县','辽宁省朝阳市建平县',NULL,NULL,'1',3),(612,606,'211324','211300','喀喇沁左翼县','辽宁省朝阳市喀喇沁左翼蒙古族自治县',NULL,NULL,'1',3),(613,606,'211381','211300','北票市','辽宁省朝阳市北票市',NULL,NULL,'1',3),(614,606,'211382','211300','凌源市','辽宁省朝阳市凌源市',NULL,NULL,'1',3),(615,494,'211400','210000','葫芦岛市','辽宁省葫芦岛市',NULL,NULL,'1',2),(616,615,'211401','211400','市辖区','辽宁省葫芦岛市市辖区',NULL,NULL,'0',3),(617,615,'211402','211400','连山区','辽宁省葫芦岛市连山区',NULL,NULL,'1',3),(618,615,'211403','211400','龙港区','辽宁省葫芦岛市龙港区',NULL,NULL,'1',3),(619,615,'211404','211400','南票区','辽宁省葫芦岛市南票区',NULL,NULL,'1',3),(620,615,'211421','211400','绥中县','辽宁省葫芦岛市绥中县',NULL,NULL,'1',3),(621,615,'211422','211400','建昌县','辽宁省葫芦岛市建昌县',NULL,NULL,'1',3),(622,615,'211481','211400','兴城市','辽宁省葫芦岛市兴城市',NULL,NULL,'1',3),(623,1,'220000','86','吉林省','吉林省',NULL,NULL,'1',1),(624,623,'220100','220000','长春市','吉林省长春市',NULL,NULL,'1',2),(625,624,'220101','220100','市辖区','吉林省长春市市辖区',NULL,NULL,'0',3),(626,624,'220102','220100','南关区','吉林省长春市南关区',NULL,NULL,'1',3),(627,624,'220103','220100','宽城区','吉林省长春市宽城区',NULL,NULL,'1',3),(628,624,'220104','220100','朝阳区','吉林省长春市朝阳区',NULL,NULL,'1',3),(629,624,'220105','220100','二道区','吉林省长春市二道区',NULL,NULL,'1',3),(630,624,'220106','220100','绿园区','吉林省长春市绿园区',NULL,NULL,'1',3),(631,624,'220112','220100','双阳区','吉林省长春市双阳区',NULL,NULL,'1',3),(632,624,'220122','220100','农安县','吉林省长春市农安县',NULL,NULL,'1',3),(633,624,'220181','220100','九台市','吉林省长春市九台市',NULL,NULL,'1',3),(634,624,'220182','220100','榆树市','吉林省长春市榆树市',NULL,NULL,'1',3),(635,624,'220183','220100','德惠市','吉林省长春市德惠市',NULL,NULL,'1',3),(636,623,'220200','220000','吉林市','吉林省吉林市',NULL,NULL,'1',2),(637,636,'220201','220200','市辖区','吉林省吉林市市辖区',NULL,NULL,'0',3),(638,636,'220202','220200','昌邑区','吉林省吉林市昌邑区',NULL,NULL,'1',3),(639,636,'220203','220200','龙潭区','吉林省吉林市龙潭区',NULL,NULL,'1',3),(640,636,'220204','220200','船营区','吉林省吉林市船营区',NULL,NULL,'1',3),(641,636,'220211','220200','丰满区','吉林省吉林市丰满区',NULL,NULL,'1',3),(642,636,'220221','220200','永吉县','吉林省吉林市永吉县',NULL,NULL,'1',3),(643,636,'220281','220200','蛟河市','吉林省吉林市蛟河市',NULL,NULL,'1',3),(644,636,'220282','220200','桦甸市','吉林省吉林市桦甸市',NULL,NULL,'1',3),(645,636,'220283','220200','舒兰市','吉林省吉林市舒兰市',NULL,NULL,'1',3),(646,636,'220284','220200','磐石市','吉林省吉林市磐石市',NULL,NULL,'1',3),(647,623,'220300','220000','四平市','吉林省四平市',NULL,NULL,'1',2),(648,647,'220301','220300','市辖区','吉林省四平市市辖区',NULL,NULL,'0',3),(649,647,'220302','220300','铁西区','吉林省四平市铁西区',NULL,NULL,'1',3),(650,647,'220303','220300','铁东区','吉林省四平市铁东区',NULL,NULL,'1',3),(651,647,'220322','220300','梨树县','吉林省四平市梨树县',NULL,NULL,'1',3),(652,647,'220323','220300','伊通县','吉林省四平市伊通满族自治县',NULL,NULL,'1',3),(653,647,'220381','220300','公主岭市','吉林省四平市公主岭市',NULL,NULL,'1',3),(654,647,'220382','220300','双辽市','吉林省四平市双辽市',NULL,NULL,'1',3),(655,623,'220400','220000','辽源市','吉林省辽源市',NULL,NULL,'1',2),(656,655,'220401','220400','市辖区','吉林省辽源市市辖区',NULL,NULL,'0',3),(657,655,'220402','220400','龙山区','吉林省辽源市龙山区',NULL,NULL,'1',3),(658,655,'220403','220400','西安区','吉林省辽源市西安区',NULL,NULL,'1',3),(659,655,'220421','220400','东丰县','吉林省辽源市东丰县',NULL,NULL,'1',3),(660,655,'220422','220400','东辽县','吉林省辽源市东辽县',NULL,NULL,'1',3),(661,623,'220500','220000','通化市','吉林省通化市',NULL,NULL,'1',2),(662,661,'220501','220500','市辖区','吉林省通化市市辖区',NULL,NULL,'0',3),(663,661,'220502','220500','东昌区','吉林省通化市东昌区',NULL,NULL,'1',3),(664,661,'220503','220500','二道江区','吉林省通化市二道江区',NULL,NULL,'1',3),(665,661,'220521','220500','通化县','吉林省通化市通化县',NULL,NULL,'1',3),(666,661,'220523','220500','辉南县','吉林省通化市辉南县',NULL,NULL,'1',3),(667,661,'220524','220500','柳河县','吉林省通化市柳河县',NULL,NULL,'1',3),(668,661,'220581','220500','梅河口市','吉林省通化市梅河口市',NULL,NULL,'1',3),(669,661,'220582','220500','集安市','吉林省通化市集安市',NULL,NULL,'1',3),(670,623,'220600','220000','白山市','吉林省白山市',NULL,NULL,'1',2),(671,670,'220601','220600','市辖区','吉林省白山市市辖区',NULL,NULL,'0',3),(672,670,'220602','220600','八道江区','吉林省白山市八道江区',NULL,NULL,'1',3),(673,670,'220621','220600','抚松县','吉林省白山市抚松县',NULL,NULL,'1',3),(674,670,'220622','220600','靖宇县','吉林省白山市靖宇县',NULL,NULL,'1',3),(675,670,'220623','220600','长白县','吉林省白山市长白朝鲜族自治县',NULL,NULL,'1',3),(676,670,'220625','220600','江源县','吉林省白山市江源县',NULL,NULL,'1',3),(677,670,'220681','220600','临江市','吉林省白山市临江市',NULL,NULL,'1',3),(678,623,'220700','220000','松原市','吉林省松原市',NULL,NULL,'1',2),(679,678,'220701','220700','市辖区','吉林省松原市市辖区',NULL,NULL,'0',3),(680,678,'220702','220700','宁江区','吉林省松原市宁江区',NULL,NULL,'1',3),(681,678,'220721','220700','前郭尔罗斯县','吉林省松原市前郭尔罗斯蒙古族自治县',NULL,NULL,'1',3),(682,678,'220722','220700','长岭县','吉林省松原市长岭县',NULL,NULL,'1',3),(683,678,'220723','220700','乾安县','吉林省松原市乾安县',NULL,NULL,'1',3),(684,678,'220724','220700','扶余县','吉林省松原市扶余县',NULL,NULL,'1',3),(685,623,'220800','220000','白城市','吉林省白城市',NULL,NULL,'1',2),(686,685,'220801','220800','市辖区','吉林省白城市市辖区',NULL,NULL,'0',3),(687,685,'220802','220800','洮北区','吉林省白城市洮北区',NULL,NULL,'1',3),(688,685,'220821','220800','镇赉县','吉林省白城市镇赉县',NULL,NULL,'1',3),(689,685,'220822','220800','通榆县','吉林省白城市通榆县',NULL,NULL,'1',3),(690,685,'220881','220800','洮南市','吉林省白城市洮南市',NULL,NULL,'1',3),(691,685,'220882','220800','大安市','吉林省白城市大安市',NULL,NULL,'1',3),(692,623,'222400','220000','延边','吉林省延边朝鲜族自治州',NULL,NULL,'1',2),(693,692,'222401','222400','延吉市','吉林省延边朝鲜族自治州延吉市',NULL,NULL,'1',3),(694,692,'222402','222400','图们市','吉林省延边朝鲜族自治州图们市',NULL,NULL,'1',3),(695,692,'222403','222400','敦化市','吉林省延边朝鲜族自治州敦化市',NULL,NULL,'1',3),(696,692,'222404','222400','珲春市','吉林省延边朝鲜族自治州珲春市',NULL,NULL,'1',3),(697,692,'222405','222400','龙井市','吉林省延边朝鲜族自治州龙井市',NULL,NULL,'1',3),(698,692,'222406','222400','和龙市','吉林省延边朝鲜族自治州和龙市',NULL,NULL,'1',3),(699,692,'222424','222400','汪清县','吉林省延边朝鲜族自治州汪清县',NULL,NULL,'1',3),(700,692,'222426','222400','安图县','吉林省延边朝鲜族自治州安图县',NULL,NULL,'1',3),(701,1,'230000','86','黑龙江省','黑龙江省',NULL,NULL,'1',1),(702,701,'230100','230000','哈尔滨市','黑龙江省哈尔滨市',NULL,NULL,'1',2),(703,702,'230101','230100','市辖区','黑龙江省哈尔滨市市辖区',NULL,NULL,'0',3),(704,702,'230102','230100','道里区','黑龙江省哈尔滨市道里区',NULL,NULL,'1',3),(705,702,'230103','230100','南岗区','黑龙江省哈尔滨市南岗区',NULL,NULL,'1',3),(706,702,'230104','230100','道外区','黑龙江省哈尔滨市道外区',NULL,NULL,'1',3),(707,702,'230105','230100','太平区','黑龙江省哈尔滨市太平区',NULL,NULL,'1',3),(708,702,'230106','230100','香坊区','黑龙江省哈尔滨市香坊区',NULL,NULL,'1',3),(709,702,'230107','230100','动力区','黑龙江省哈尔滨市动力区',NULL,NULL,'1',3),(710,702,'230108','230100','平房区','黑龙江省哈尔滨市平房区',NULL,NULL,'1',3),(711,702,'230121','230100','呼兰县','黑龙江省哈尔滨市呼兰县',NULL,NULL,'1',3),(712,702,'230123','230100','依兰县','黑龙江省哈尔滨市依兰县',NULL,NULL,'1',3),(713,702,'230124','230100','方正县','黑龙江省哈尔滨市方正县',NULL,NULL,'1',3),(714,702,'230125','230100','宾县','黑龙江省哈尔滨市宾县',NULL,NULL,'1',3),(715,702,'230126','230100','巴彦县','黑龙江省哈尔滨市巴彦县',NULL,NULL,'1',3),(716,702,'230127','230100','木兰县','黑龙江省哈尔滨市木兰县',NULL,NULL,'1',3),(717,702,'230128','230100','通河县','黑龙江省哈尔滨市通河县',NULL,NULL,'1',3),(718,702,'230129','230100','延寿县','黑龙江省哈尔滨市延寿县',NULL,NULL,'1',3),(719,702,'230181','230100','阿城市','黑龙江省哈尔滨市阿城市',NULL,NULL,'1',3),(720,702,'230182','230100','双城市','黑龙江省哈尔滨市双城市',NULL,NULL,'1',3),(721,702,'230183','230100','尚志市','黑龙江省哈尔滨市尚志市',NULL,NULL,'1',3),(722,702,'230184','230100','五常市','黑龙江省哈尔滨市五常市',NULL,NULL,'1',3),(723,701,'230200','230000','齐齐哈尔市','黑龙江省齐齐哈尔市',NULL,NULL,'1',2),(724,723,'230201','230200','市辖区','黑龙江省齐齐哈尔市市辖区',NULL,NULL,'0',3),(725,723,'230202','230200','龙沙区','黑龙江省齐齐哈尔市龙沙区',NULL,NULL,'1',3),(726,723,'230203','230200','建华区','黑龙江省齐齐哈尔市建华区',NULL,NULL,'1',3),(727,723,'230204','230200','铁锋区','黑龙江省齐齐哈尔市铁锋区',NULL,NULL,'1',3),(728,723,'230205','230200','昂昂溪区','黑龙江省齐齐哈尔市昂昂溪区',NULL,NULL,'1',3),(729,723,'230206','230200','富拉尔基区','黑龙江省齐齐哈尔市富拉尔基区',NULL,NULL,'1',3),(730,723,'230207','230200','碾子山区','黑龙江省齐齐哈尔市碾子山区',NULL,NULL,'1',3),(731,723,'230208','230200','梅里斯区','黑龙江省齐齐哈尔市梅里斯达斡尔族区',NULL,NULL,'1',3),(732,723,'230221','230200','龙江县','黑龙江省齐齐哈尔市龙江县',NULL,NULL,'1',3),(733,723,'230223','230200','依安县','黑龙江省齐齐哈尔市依安县',NULL,NULL,'1',3),(734,723,'230224','230200','泰来县','黑龙江省齐齐哈尔市泰来县',NULL,NULL,'1',3),(735,723,'230225','230200','甘南县','黑龙江省齐齐哈尔市甘南县',NULL,NULL,'1',3),(736,723,'230227','230200','富裕县','黑龙江省齐齐哈尔市富裕县',NULL,NULL,'1',3),(737,723,'230229','230200','克山县','黑龙江省齐齐哈尔市克山县',NULL,NULL,'1',3),(738,723,'230230','230200','克东县','黑龙江省齐齐哈尔市克东县',NULL,NULL,'1',3),(739,723,'230231','230200','拜泉县','黑龙江省齐齐哈尔市拜泉县',NULL,NULL,'1',3),(740,723,'230281','230200','讷河市','黑龙江省齐齐哈尔市讷河市',NULL,NULL,'1',3),(741,701,'230300','230000','鸡西市','黑龙江省鸡西市',NULL,NULL,'1',2),(742,741,'230301','230300','市辖区','黑龙江省鸡西市市辖区',NULL,NULL,'0',3),(743,741,'230302','230300','鸡冠区','黑龙江省鸡西市鸡冠区',NULL,NULL,'1',3),(744,741,'230303','230300','恒山区','黑龙江省鸡西市恒山区',NULL,NULL,'1',3),(745,741,'230304','230300','滴道区','黑龙江省鸡西市滴道区',NULL,NULL,'1',3),(746,741,'230305','230300','梨树区','黑龙江省鸡西市梨树区',NULL,NULL,'1',3),(747,741,'230306','230300','城子河区','黑龙江省鸡西市城子河区',NULL,NULL,'1',3),(748,741,'230307','230300','麻山区','黑龙江省鸡西市麻山区',NULL,NULL,'1',3),(749,741,'230321','230300','鸡东县','黑龙江省鸡西市鸡东县',NULL,NULL,'1',3),(750,741,'230381','230300','虎林市','黑龙江省鸡西市虎林市',NULL,NULL,'1',3),(751,741,'230382','230300','密山市','黑龙江省鸡西市密山市',NULL,NULL,'1',3),(752,701,'230400','230000','鹤岗市','黑龙江省鹤岗市',NULL,NULL,'1',2),(753,752,'230401','230400','市辖区','黑龙江省鹤岗市市辖区',NULL,NULL,'0',3),(754,752,'230402','230400','向阳区','黑龙江省鹤岗市向阳区',NULL,NULL,'1',3),(755,752,'230403','230400','工农区','黑龙江省鹤岗市工农区',NULL,NULL,'1',3),(756,752,'230404','230400','南山区','黑龙江省鹤岗市南山区',NULL,NULL,'1',3),(757,752,'230405','230400','兴安区','黑龙江省鹤岗市兴安区',NULL,NULL,'1',3),(758,752,'230406','230400','东山区','黑龙江省鹤岗市东山区',NULL,NULL,'1',3),(759,752,'230407','230400','兴山区','黑龙江省鹤岗市兴山区',NULL,NULL,'1',3),(760,752,'230421','230400','萝北县','黑龙江省鹤岗市萝北县',NULL,NULL,'1',3),(761,752,'230422','230400','绥滨县','黑龙江省鹤岗市绥滨县',NULL,NULL,'1',3),(762,701,'230500','230000','双鸭山市','黑龙江省双鸭山市',NULL,NULL,'1',2),(763,762,'230501','230500','市辖区','黑龙江省双鸭山市市辖区',NULL,NULL,'0',3),(764,762,'230502','230500','尖山区','黑龙江省双鸭山市尖山区',NULL,NULL,'1',3),(765,762,'230503','230500','岭东区','黑龙江省双鸭山市岭东区',NULL,NULL,'1',3),(766,762,'230505','230500','四方台区','黑龙江省双鸭山市四方台区',NULL,NULL,'1',3),(767,762,'230506','230500','宝山区','黑龙江省双鸭山市宝山区',NULL,NULL,'1',3),(768,762,'230521','230500','集贤县','黑龙江省双鸭山市集贤县',NULL,NULL,'1',3),(769,762,'230522','230500','友谊县','黑龙江省双鸭山市友谊县',NULL,NULL,'1',3),(770,762,'230523','230500','宝清县','黑龙江省双鸭山市宝清县',NULL,NULL,'1',3),(771,762,'230524','230500','饶河县','黑龙江省双鸭山市饶河县',NULL,NULL,'1',3),(772,701,'230600','230000','大庆市','黑龙江省大庆市',NULL,NULL,'1',2),(773,772,'230601','230600','市辖区','黑龙江省大庆市市辖区',NULL,NULL,'0',3),(774,772,'230602','230600','萨尔图区','黑龙江省大庆市萨尔图区',NULL,NULL,'1',3),(775,772,'230603','230600','龙凤区','黑龙江省大庆市龙凤区',NULL,NULL,'1',3),(776,772,'230604','230600','让胡路区','黑龙江省大庆市让胡路区',NULL,NULL,'1',3),(777,772,'230605','230600','红岗区','黑龙江省大庆市红岗区',NULL,NULL,'1',3),(778,772,'230606','230600','大同区','黑龙江省大庆市大同区',NULL,NULL,'1',3),(779,772,'230621','230600','肇州县','黑龙江省大庆市肇州县',NULL,NULL,'1',3),(780,772,'230622','230600','肇源县','黑龙江省大庆市肇源县',NULL,NULL,'1',3),(781,772,'230623','230600','林甸县','黑龙江省大庆市林甸县',NULL,NULL,'1',3),(782,772,'230624','230600','杜尔伯特县','黑龙江省大庆市杜尔伯特蒙古族自治县',NULL,NULL,'1',3),(783,701,'230700','230000','伊春市','黑龙江省伊春市',NULL,NULL,'1',2),(784,783,'230701','230700','市辖区','黑龙江省伊春市市辖区',NULL,NULL,'0',3),(785,783,'230702','230700','伊春区','黑龙江省伊春市伊春区',NULL,NULL,'1',3),(786,783,'230703','230700','南岔区','黑龙江省伊春市南岔区',NULL,NULL,'1',3),(787,783,'230704','230700','友好区','黑龙江省伊春市友好区',NULL,NULL,'1',3),(788,783,'230705','230700','西林区','黑龙江省伊春市西林区',NULL,NULL,'1',3),(789,783,'230706','230700','翠峦区','黑龙江省伊春市翠峦区',NULL,NULL,'1',3),(790,783,'230707','230700','新青区','黑龙江省伊春市新青区',NULL,NULL,'1',3),(791,783,'230708','230700','美溪区','黑龙江省伊春市美溪区',NULL,NULL,'1',3),(792,783,'230709','230700','金山屯区','黑龙江省伊春市金山屯区',NULL,NULL,'1',3),(793,783,'230710','230700','五营区','黑龙江省伊春市五营区',NULL,NULL,'1',3),(794,783,'230711','230700','乌马河区','黑龙江省伊春市乌马河区',NULL,NULL,'1',3),(795,783,'230712','230700','汤旺河区','黑龙江省伊春市汤旺河区',NULL,NULL,'1',3),(796,783,'230713','230700','带岭区','黑龙江省伊春市带岭区',NULL,NULL,'1',3),(797,783,'230714','230700','乌伊岭区','黑龙江省伊春市乌伊岭区',NULL,NULL,'1',3),(798,783,'230715','230700','红星区','黑龙江省伊春市红星区',NULL,NULL,'1',3),(799,783,'230716','230700','上甘岭区','黑龙江省伊春市上甘岭区',NULL,NULL,'1',3),(800,783,'230722','230700','嘉荫县','黑龙江省伊春市嘉荫县',NULL,NULL,'1',3),(801,783,'230781','230700','铁力市','黑龙江省伊春市铁力市',NULL,NULL,'1',3),(802,701,'230800','230000','佳木斯市','黑龙江省佳木斯市',NULL,NULL,'1',2),(803,802,'230801','230800','市辖区','黑龙江省佳木斯市市辖区',NULL,NULL,'0',3),(804,802,'230802','230800','永红区','黑龙江省佳木斯市永红区',NULL,NULL,'1',3),(805,802,'230803','230800','向阳区','黑龙江省佳木斯市向阳区',NULL,NULL,'1',3),(806,802,'230804','230800','前进区','黑龙江省佳木斯市前进区',NULL,NULL,'1',3),(807,802,'230805','230800','东风区','黑龙江省佳木斯市东风区',NULL,NULL,'1',3),(808,802,'230811','230800','郊区','黑龙江省佳木斯市郊区',NULL,NULL,'1',3),(809,802,'230822','230800','桦南县','黑龙江省佳木斯市桦南县',NULL,NULL,'1',3),(810,802,'230826','230800','桦川县','黑龙江省佳木斯市桦川县',NULL,NULL,'1',3),(811,802,'230828','230800','汤原县','黑龙江省佳木斯市汤原县',NULL,NULL,'1',3),(812,802,'230833','230800','抚远县','黑龙江省佳木斯市抚远县',NULL,NULL,'1',3),(813,802,'230881','230800','同江市','黑龙江省佳木斯市同江市',NULL,NULL,'1',3),(814,802,'230882','230800','富锦市','黑龙江省佳木斯市富锦市',NULL,NULL,'1',3),(815,701,'230900','230000','七台河市','黑龙江省七台河市',NULL,NULL,'1',2),(816,815,'230901','230900','市辖区','黑龙江省七台河市市辖区',NULL,NULL,'0',3),(817,815,'230902','230900','新兴区','黑龙江省七台河市新兴区',NULL,NULL,'1',3),(818,815,'230903','230900','桃山区','黑龙江省七台河市桃山区',NULL,NULL,'1',3),(819,815,'230904','230900','茄子河区','黑龙江省七台河市茄子河区',NULL,NULL,'1',3),(820,815,'230921','230900','勃利县','黑龙江省七台河市勃利县',NULL,NULL,'1',3),(821,701,'231000','230000','牡丹江市','黑龙江省牡丹江市',NULL,NULL,'1',2),(822,821,'231001','231000','市辖区','黑龙江省牡丹江市市辖区',NULL,NULL,'0',3),(823,821,'231002','231000','东安区','黑龙江省牡丹江市东安区',NULL,NULL,'1',3),(824,821,'231003','231000','阳明区','黑龙江省牡丹江市阳明区',NULL,NULL,'1',3),(825,821,'231004','231000','爱民区','黑龙江省牡丹江市爱民区',NULL,NULL,'1',3),(826,821,'231005','231000','西安区','黑龙江省牡丹江市西安区',NULL,NULL,'1',3),(827,821,'231024','231000','东宁县','黑龙江省牡丹江市东宁县',NULL,NULL,'1',3),(828,821,'231025','231000','林口县','黑龙江省牡丹江市林口县',NULL,NULL,'1',3),(829,821,'231081','231000','绥芬河市','黑龙江省牡丹江市绥芬河市',NULL,NULL,'1',3),(830,821,'231083','231000','海林市','黑龙江省牡丹江市海林市',NULL,NULL,'1',3),(831,821,'231084','231000','宁安市','黑龙江省牡丹江市宁安市',NULL,NULL,'1',3),(832,821,'231085','231000','穆棱市','黑龙江省牡丹江市穆棱市',NULL,NULL,'1',3),(833,701,'231100','230000','黑河市','黑龙江省黑河市',NULL,NULL,'1',2),(834,833,'231101','231100','市辖区','黑龙江省黑河市市辖区',NULL,NULL,'0',3),(835,833,'231102','231100','爱辉区','黑龙江省黑河市爱辉区',NULL,NULL,'1',3),(836,833,'231121','231100','嫩江县','黑龙江省黑河市嫩江县',NULL,NULL,'1',3),(837,833,'231123','231100','逊克县','黑龙江省黑河市逊克县',NULL,NULL,'1',3),(838,833,'231124','231100','孙吴县','黑龙江省黑河市孙吴县',NULL,NULL,'1',3),(839,833,'231181','231100','北安市','黑龙江省黑河市北安市',NULL,NULL,'1',3),(840,833,'231182','231100','五大连池市','黑龙江省黑河市五大连池市',NULL,NULL,'1',3),(841,701,'232300','230000','绥化地区','黑龙江省绥化地区',NULL,NULL,'1',2),(842,841,'232301','232300','绥化市','黑龙江省绥化地区绥化市',NULL,NULL,'1',3),(843,841,'232302','232300','安达市','黑龙江省绥化地区安达市',NULL,NULL,'1',3),(844,841,'232303','232300','肇东市','黑龙江省绥化地区肇东市',NULL,NULL,'1',3),(845,841,'232304','232300','海伦市','黑龙江省绥化地区海伦市',NULL,NULL,'1',3),(846,841,'232324','232300','望奎县','黑龙江省绥化地区望奎县',NULL,NULL,'1',3),(847,841,'232325','232300','兰西县','黑龙江省绥化地区兰西县',NULL,NULL,'1',3),(848,841,'232326','232300','青冈县','黑龙江省绥化地区青冈县',NULL,NULL,'1',3),(849,841,'232330','232300','庆安县','黑龙江省绥化地区庆安县',NULL,NULL,'1',3),(850,841,'232331','232300','明水县','黑龙江省绥化地区明水县',NULL,NULL,'1',3),(851,841,'232332','232300','绥棱县','黑龙江省绥化地区绥棱县',NULL,NULL,'1',3),(852,701,'232700','230000','大兴安岭地区','黑龙江省大兴安岭地区',NULL,NULL,'1',2),(853,852,'232721','232700','呼玛县','黑龙江省大兴安岭地区呼玛县',NULL,NULL,'1',3),(854,852,'232722','232700','塔河县','黑龙江省大兴安岭地区塔河县',NULL,NULL,'1',3),(855,852,'232723','232700','漠河县','黑龙江省大兴安岭地区漠河县',NULL,NULL,'1',3),(856,1,'310000','86','上海市','上海市',NULL,NULL,'1',1),(857,856,'310100','310000','上海市','上海市市辖区',NULL,NULL,'1',2),(858,857,'310101','310100','黄浦区','上海市黄浦区',NULL,NULL,'1',3),(859,857,'310102','310100','南市区','上海市南市区',NULL,NULL,'1',3),(860,857,'310103','310100','卢湾区','上海市卢湾区',NULL,NULL,'1',3),(861,857,'310104','310100','徐汇区','上海市徐汇区',NULL,NULL,'1',3),(862,857,'310105','310100','长宁区','上海市长宁区',NULL,NULL,'1',3),(863,857,'310106','310100','静安区','上海市静安区',NULL,NULL,'1',3),(864,857,'310107','310100','普陀区','上海市普陀区',NULL,NULL,'1',3),(865,857,'310108','310100','闸北区','上海市闸北区',NULL,NULL,'1',3),(866,857,'310109','310100','虹口区','上海市虹口区',NULL,NULL,'1',3),(867,857,'310110','310100','杨浦区','上海市杨浦区',NULL,NULL,'1',3),(868,857,'310112','310100','闵行区','上海市闵行区',NULL,NULL,'1',3),(869,857,'310113','310100','宝山区','上海市宝山区',NULL,NULL,'1',3),(870,857,'310114','310100','嘉定区','上海市嘉定区',NULL,NULL,'1',3),(871,857,'310115','310100','浦东新区','上海市浦东新区',NULL,NULL,'1',3),(872,857,'310116','310100','金山区','上海市金山区',NULL,NULL,'1',3),(873,857,'310117','310100','松江区','上海市松江区',NULL,NULL,'1',3),(874,857,'310225','310100','南汇区','上海市南汇区',NULL,NULL,'1',3),(875,857,'310226','310100','奉贤区','上海市奉贤区',NULL,NULL,'1',3),(876,857,'310229','310100','青浦区','上海市青浦区',NULL,NULL,'1',3),(877,856,'310200','310000','县','上海市县',NULL,NULL,'1',2),(878,877,'310230','310200','崇明县','上海市崇明县',NULL,NULL,'1',3),(879,1,'320000','86','江苏省','江苏省',NULL,NULL,'1',1),(880,879,'320100','320000','南京市','江苏省南京市',NULL,NULL,'1',2),(881,880,'320101','320100','市辖区','江苏省南京市市辖区',NULL,NULL,'0',3),(882,880,'320102','320100','玄武区','江苏省南京市玄武区',NULL,NULL,'1',3),(883,880,'320103','320100','白下区','江苏省南京市白下区',NULL,NULL,'1',3),(884,880,'320104','320100','秦淮区','江苏省南京市秦淮区',NULL,NULL,'1',3),(885,880,'320105','320100','建邺区','江苏省南京市建邺区',NULL,NULL,'1',3),(886,880,'320106','320100','鼓楼区','江苏省南京市鼓楼区',NULL,NULL,'1',3),(887,880,'320107','320100','下关区','江苏省南京市下关区',NULL,NULL,'1',3),(888,880,'320111','320100','浦口区','江苏省南京市浦口区',NULL,NULL,'1',3),(889,880,'320112','320100','大厂区','江苏省南京市大厂区',NULL,NULL,'1',3),(890,880,'320113','320100','栖霞区','江苏省南京市栖霞区',NULL,NULL,'1',3),(891,880,'320114','320100','雨花台区','江苏省南京市雨花台区',NULL,NULL,'1',3),(892,880,'320121','320100','江宁县','江苏省南京市江宁县',NULL,NULL,'1',3),(893,880,'320122','320100','江浦县','江苏省南京市江浦县',NULL,NULL,'1',3),(894,880,'320123','320100','六合县','江苏省南京市六合县',NULL,NULL,'1',3),(895,880,'320124','320100','溧水县','江苏省南京市溧水县',NULL,NULL,'1',3),(896,880,'320125','320100','高淳县','江苏省南京市高淳县',NULL,NULL,'1',3),(897,879,'320200','320000','无锡市','江苏省无锡市',NULL,NULL,'1',2),(898,897,'320201','320200','市辖区','江苏省无锡市市辖区',NULL,NULL,'0',3),(899,897,'320202','320200','崇安区','江苏省无锡市崇安区',NULL,NULL,'1',3),(900,897,'320203','320200','南长区','江苏省无锡市南长区',NULL,NULL,'1',3),(901,897,'320204','320200','北塘区','江苏省无锡市北塘区',NULL,NULL,'1',3),(902,897,'320211','320200','郊区','江苏省无锡市郊区',NULL,NULL,'1',3),(903,897,'320281','320200','江阴市','江苏省无锡市江阴市',NULL,NULL,'1',3),(904,897,'320282','320200','宜兴市','江苏省无锡市宜兴市',NULL,NULL,'1',3),(905,897,'320283','320200','锡山市','江苏省无锡市锡山市',NULL,NULL,'1',3),(906,879,'320300','320000','徐州市','江苏省徐州市',NULL,NULL,'1',2),(907,906,'320301','320300','市辖区','江苏省徐州市市辖区',NULL,NULL,'0',3),(908,906,'320302','320300','鼓楼区','江苏省徐州市鼓楼区',NULL,NULL,'1',3),(909,906,'320303','320300','云龙区','江苏省徐州市云龙区',NULL,NULL,'1',3),(910,906,'320304','320300','九里区','江苏省徐州市九里区',NULL,NULL,'1',3),(911,906,'320305','320300','贾汪区','江苏省徐州市贾汪区',NULL,NULL,'1',3),(912,906,'320311','320300','泉山区','江苏省徐州市泉山区',NULL,NULL,'1',3),(913,906,'320321','320300','丰县','江苏省徐州市丰县',NULL,NULL,'1',3),(914,906,'320322','320300','沛县','江苏省徐州市沛县',NULL,NULL,'1',3),(915,906,'320323','320300','铜山县','江苏省徐州市铜山县',NULL,NULL,'1',3),(916,906,'320324','320300','睢宁县','江苏省徐州市睢宁县',NULL,NULL,'1',3),(917,906,'320381','320300','新沂市','江苏省徐州市新沂市',NULL,NULL,'1',3),(918,906,'320382','320300','邳州市','江苏省徐州市邳州市',NULL,NULL,'1',3),(919,879,'320400','320000','常州市','江苏省常州市',NULL,NULL,'1',2),(920,919,'320401','320400','市辖区','江苏省常州市市辖区',NULL,NULL,'0',3),(921,919,'320402','320400','天宁区','江苏省常州市天宁区',NULL,NULL,'1',3),(922,919,'320404','320400','钟楼区','江苏省常州市钟楼区',NULL,NULL,'1',3),(923,919,'320405','320400','戚墅堰区','江苏省常州市戚墅堰区',NULL,NULL,'1',3),(924,919,'320411','320400','郊区','江苏省常州市郊区',NULL,NULL,'1',3),(925,919,'320481','320400','溧阳市','江苏省常州市溧阳市',NULL,NULL,'1',3),(926,919,'320482','320400','金坛市','江苏省常州市金坛市',NULL,NULL,'1',3),(927,919,'320483','320400','武进市','江苏省常州市武进市',NULL,NULL,'1',3),(928,879,'320500','320000','苏州市','江苏省苏州市',NULL,NULL,'1',2),(929,928,'320501','320500','市辖区','江苏省苏州市市辖区',NULL,NULL,'0',3),(930,928,'320502','320500','沧浪区','江苏省苏州市沧浪区',NULL,NULL,'1',3),(931,928,'320503','320500','平江区','江苏省苏州市平江区',NULL,NULL,'1',3),(932,928,'320504','320500','金阊区','江苏省苏州市金阊区',NULL,NULL,'1',3),(933,928,'320511','320500','郊区','江苏省苏州市郊区',NULL,NULL,'1',3),(934,928,'320581','320500','常熟市','江苏省苏州市常熟市',NULL,NULL,'1',3),(935,928,'320582','320500','张家港市','江苏省苏州市张家港市',NULL,NULL,'1',3),(936,928,'320583','320500','昆山市','江苏省苏州市昆山市',NULL,NULL,'1',3),(937,928,'320584','320500','吴江市','江苏省苏州市吴江市',NULL,NULL,'1',3),(938,928,'320585','320500','太仓市','江苏省苏州市太仓市',NULL,NULL,'1',3),(939,928,'320586','320500','吴县市','江苏省苏州市吴县市',NULL,NULL,'1',3),(940,879,'320600','320000','南通市','江苏省南通市',NULL,NULL,'1',2),(941,940,'320601','320600','市辖区','江苏省南通市市辖区',NULL,NULL,'0',3),(942,940,'320602','320600','崇川区','江苏省南通市崇川区',NULL,NULL,'1',3),(943,940,'320611','320600','港闸区','江苏省南通市港闸区',NULL,NULL,'1',3),(944,940,'320621','320600','海安县','江苏省南通市海安县',NULL,NULL,'1',3),(945,940,'320623','320600','如东县','江苏省南通市如东县',NULL,NULL,'1',3),(946,940,'320681','320600','启东市','江苏省南通市启东市',NULL,NULL,'1',3),(947,940,'320682','320600','如皋市','江苏省南通市如皋市',NULL,NULL,'1',3),(948,940,'320683','320600','通州市','江苏省南通市通州市',NULL,NULL,'1',3),(949,940,'320684','320600','海门市','江苏省南通市海门市',NULL,NULL,'1',3),(950,879,'320700','320000','连云港市','江苏省连云港市',NULL,NULL,'1',2),(951,950,'320701','320700','市辖区','江苏省连云港市市辖区',NULL,NULL,'0',3),(952,950,'320703','320700','连云区','江苏省连云港市连云区',NULL,NULL,'1',3),(953,950,'320704','320700','云台区','江苏省连云港市云台区',NULL,NULL,'1',3),(954,950,'320705','320700','新浦区','江苏省连云港市新浦区',NULL,NULL,'1',3),(955,950,'320706','320700','海州区','江苏省连云港市海州区',NULL,NULL,'1',3),(956,950,'320721','320700','赣榆县','江苏省连云港市赣榆县',NULL,NULL,'1',3),(957,950,'320722','320700','东海县','江苏省连云港市东海县',NULL,NULL,'1',3),(958,950,'320723','320700','灌云县','江苏省连云港市灌云县',NULL,NULL,'1',3),(959,950,'320724','320700','灌南县','江苏省连云港市灌南县',NULL,NULL,'1',3),(960,879,'320800','320000','淮阴市','江苏省淮阴市',NULL,NULL,'1',2),(961,960,'320801','320800','市辖区','江苏省淮阴市市辖区',NULL,NULL,'0',3),(962,960,'320802','320800','清河区','江苏省淮阴市清河区',NULL,NULL,'1',3),(963,960,'320811','320800','清浦区','江苏省淮阴市清浦区',NULL,NULL,'1',3),(964,960,'320821','320800','淮阴县','江苏省淮阴市淮阴县',NULL,NULL,'1',3),(965,960,'320826','320800','涟水县','江苏省淮阴市涟水县',NULL,NULL,'1',3),(966,960,'320829','320800','洪泽县','江苏省淮阴市洪泽县',NULL,NULL,'1',3),(967,960,'320830','320800','盱眙县','江苏省淮阴市盱眙县',NULL,NULL,'1',3),(968,960,'320831','320800','金湖县','江苏省淮阴市金湖县',NULL,NULL,'1',3),(969,960,'320882','320800','淮安市','江苏省淮阴市淮安市',NULL,NULL,'1',3),(970,879,'320900','320000','盐城市','江苏省盐城市',NULL,NULL,'1',2),(971,970,'320901','320900','市辖区','江苏省盐城市市辖区',NULL,NULL,'0',3),(972,970,'320902','320900','城区','江苏省盐城市城区',NULL,NULL,'1',3),(973,970,'320921','320900','响水县','江苏省盐城市响水县',NULL,NULL,'1',3),(974,970,'320922','320900','滨海县','江苏省盐城市滨海县',NULL,NULL,'1',3),(975,970,'320923','320900','阜宁县','江苏省盐城市阜宁县',NULL,NULL,'1',3),(976,970,'320924','320900','射阳县','江苏省盐城市射阳县',NULL,NULL,'1',3),(977,970,'320925','320900','建湖县','江苏省盐城市建湖县',NULL,NULL,'1',3),(978,970,'320928','320900','盐都县','江苏省盐城市盐都县',NULL,NULL,'1',3),(979,970,'320981','320900','东台市','江苏省盐城市东台市',NULL,NULL,'1',3),(980,970,'320982','320900','大丰市','江苏省盐城市大丰市',NULL,NULL,'1',3),(981,879,'321000','320000','扬州市','江苏省扬州市',NULL,NULL,'1',2),(982,981,'321001','321000','市辖区','江苏省扬州市市辖区',NULL,NULL,'0',3),(983,981,'321002','321000','广陵区','江苏省扬州市广陵区',NULL,NULL,'1',3),(984,981,'321011','321000','郊区','江苏省扬州市郊区',NULL,NULL,'1',3),(985,981,'321023','321000','宝应县','江苏省扬州市宝应县',NULL,NULL,'1',3),(986,981,'321027','321000','邗江县','江苏省扬州市邗江县',NULL,NULL,'1',3),(987,981,'321081','321000','仪征市','江苏省扬州市仪征市',NULL,NULL,'1',3),(988,981,'321084','321000','高邮市','江苏省扬州市高邮市',NULL,NULL,'1',3),(989,981,'321088','321000','江都市','江苏省扬州市江都市',NULL,NULL,'1',3),(990,879,'321100','320000','镇江市','江苏省镇江市',NULL,NULL,'1',2),(991,990,'321101','321100','市辖区','江苏省镇江市市辖区',NULL,NULL,'0',3),(992,990,'321102','321100','京口区','江苏省镇江市京口区',NULL,NULL,'1',3),(993,990,'321111','321100','润州区','江苏省镇江市润州区',NULL,NULL,'1',3),(994,990,'321121','321100','丹徒县','江苏省镇江市丹徒县',NULL,NULL,'1',3),(995,990,'321181','321100','丹阳市','江苏省镇江市丹阳市',NULL,NULL,'1',3),(996,990,'321182','321100','扬中市','江苏省镇江市扬中市',NULL,NULL,'1',3),(997,990,'321183','321100','句容市','江苏省镇江市句容市',NULL,NULL,'1',3),(998,879,'321200','320000','泰州市','江苏省泰州市',NULL,NULL,'1',2),(999,998,'321201','321200','市辖区','江苏省泰州市市辖区',NULL,NULL,'0',3),(1000,998,'321202','321200','海陵区','江苏省泰州市海陵区',NULL,NULL,'1',3),(1001,998,'321203','321200','高港区','江苏省泰州市高港区',NULL,NULL,'1',3),(1002,998,'321281','321200','兴化市','江苏省泰州市兴化市',NULL,NULL,'1',3),(1003,998,'321282','321200','靖江市','江苏省泰州市靖江市',NULL,NULL,'1',3),(1004,998,'321283','321200','泰兴市','江苏省泰州市泰兴市',NULL,NULL,'1',3),(1005,998,'321284','321200','姜堰市','江苏省泰州市姜堰市',NULL,NULL,'1',3),(1006,879,'321300','320000','宿迁市','江苏省宿迁市',NULL,NULL,'1',2),(1007,1006,'321301','321300','市辖区','江苏省宿迁市市辖区',NULL,NULL,'0',3),(1008,1006,'321302','321300','宿城区','江苏省宿迁市宿城区',NULL,NULL,'1',3),(1009,1006,'321321','321300','宿豫县','江苏省宿迁市宿豫县',NULL,NULL,'1',3),(1010,1006,'321322','321300','沭阳县','江苏省宿迁市沭阳县',NULL,NULL,'1',3),(1011,1006,'321323','321300','泗阳县','江苏省宿迁市泗阳县',NULL,NULL,'1',3),(1012,1006,'321324','321300','泗洪县','江苏省宿迁市泗洪县',NULL,NULL,'1',3),(1013,1,'330000','86','浙江省','浙江省',NULL,NULL,'1',1),(1014,1013,'330100','330000','杭州市','浙江省杭州市',NULL,NULL,'1',2),(1015,1014,'330101','330100','市辖区','浙江省杭州市市辖区',NULL,NULL,'0',3),(1016,1014,'330102','330100','上城区','浙江省杭州市上城区',NULL,NULL,'1',3),(1017,1014,'330103','330100','下城区','浙江省杭州市下城区',NULL,NULL,'1',3),(1018,1014,'330104','330100','江干区','浙江省杭州市江干区',NULL,NULL,'1',3),(1019,1014,'330105','330100','拱墅区','浙江省杭州市拱墅区',NULL,NULL,'1',3),(1020,1014,'330106','330100','西湖区','浙江省杭州市西湖区',NULL,NULL,'1',3),(1021,1014,'330108','330100','滨江区','浙江省杭州市滨江区',NULL,NULL,'1',3),(1022,1014,'330122','330100','桐庐县','浙江省杭州市桐庐县',NULL,NULL,'1',3),(1023,1014,'330127','330100','淳安县','浙江省杭州市淳安县',NULL,NULL,'1',3),(1024,1014,'330181','330100','萧山市','浙江省杭州市萧山市',NULL,NULL,'1',3),(1025,1014,'330182','330100','建德市','浙江省杭州市建德市',NULL,NULL,'1',3),(1026,1014,'330183','330100','富阳市','浙江省杭州市富阳市',NULL,NULL,'1',3),(1027,1014,'330184','330100','余杭市','浙江省杭州市余杭市',NULL,NULL,'1',3),(1028,1014,'330185','330100','临安市','浙江省杭州市临安市',NULL,NULL,'1',3),(1029,1013,'330200','330000','宁波市','浙江省宁波市',NULL,NULL,'1',2),(1030,1029,'330201','330200','市辖区','浙江省宁波市市辖区',NULL,NULL,'0',3),(1031,1029,'330203','330200','海曙区','浙江省宁波市海曙区',NULL,NULL,'1',3),(1032,1029,'330204','330200','江东区','浙江省宁波市江东区',NULL,NULL,'1',3),(1033,1029,'330205','330200','江北区','浙江省宁波市江北区',NULL,NULL,'1',3),(1034,1029,'330206','330200','北仑区','浙江省宁波市北仑区',NULL,NULL,'1',3),(1035,1029,'330211','330200','镇海区','浙江省宁波市镇海区',NULL,NULL,'1',3),(1036,1029,'330225','330200','象山县','浙江省宁波市象山县',NULL,NULL,'1',3),(1037,1029,'330226','330200','宁海县','浙江省宁波市宁海县',NULL,NULL,'1',3),(1038,1029,'330227','330200','鄞县','浙江省宁波市鄞县',NULL,NULL,'1',3),(1039,1029,'330281','330200','余姚市','浙江省宁波市余姚市',NULL,NULL,'1',3),(1040,1029,'330282','330200','慈溪市','浙江省宁波市慈溪市',NULL,NULL,'1',3),(1041,1029,'330283','330200','奉化市','浙江省宁波市奉化市',NULL,NULL,'1',3),(1042,1013,'330300','330000','温州市','浙江省温州市',NULL,NULL,'1',2),(1043,1042,'330301','330300','市辖区','浙江省温州市市辖区',NULL,NULL,'0',3),(1044,1042,'330302','330300','鹿城区','浙江省温州市鹿城区',NULL,NULL,'1',3),(1045,1042,'330303','330300','龙湾区','浙江省温州市龙湾区',NULL,NULL,'1',3),(1046,1042,'330304','330300','瓯海区','浙江省温州市瓯海区',NULL,NULL,'1',3),(1047,1042,'330322','330300','洞头县','浙江省温州市洞头县',NULL,NULL,'1',3),(1048,1042,'330324','330300','永嘉县','浙江省温州市永嘉县',NULL,NULL,'1',3),(1049,1042,'330326','330300','平阳县','浙江省温州市平阳县',NULL,NULL,'1',3),(1050,1042,'330327','330300','苍南县','浙江省温州市苍南县',NULL,NULL,'1',3),(1051,1042,'330328','330300','文成县','浙江省温州市文成县',NULL,NULL,'1',3),(1052,1042,'330329','330300','泰顺县','浙江省温州市泰顺县',NULL,NULL,'1',3),(1053,1042,'330381','330300','瑞安市','浙江省温州市瑞安市',NULL,NULL,'1',3),(1054,1042,'330382','330300','乐清市','浙江省温州市乐清市',NULL,NULL,'1',3),(1055,1013,'330400','330000','嘉兴市','浙江省嘉兴市',NULL,NULL,'1',2),(1056,1055,'330401','330400','市辖区','浙江省嘉兴市市辖区',NULL,NULL,'0',3),(1057,1055,'330402','330400','秀城区','浙江省嘉兴市秀城区',NULL,NULL,'1',3),(1058,1055,'330411','330400','郊区','浙江省嘉兴市郊区',NULL,NULL,'1',3),(1059,1055,'330421','330400','嘉善县','浙江省嘉兴市嘉善县',NULL,NULL,'1',3),(1060,1055,'330424','330400','海盐县','浙江省嘉兴市海盐县',NULL,NULL,'1',3),(1061,1055,'330481','330400','海宁市','浙江省嘉兴市海宁市',NULL,NULL,'1',3),(1062,1055,'330482','330400','平湖市','浙江省嘉兴市平湖市',NULL,NULL,'1',3),(1063,1055,'330483','330400','桐乡市','浙江省嘉兴市桐乡市',NULL,NULL,'1',3),(1064,1013,'330500','330000','湖州市','浙江省湖州市',NULL,NULL,'1',2),(1065,1064,'330501','330500','市辖区','浙江省湖州市市辖区',NULL,NULL,'0',3),(1066,1064,'330521','330500','德清县','浙江省湖州市德清县',NULL,NULL,'1',3),(1067,1064,'330522','330500','长兴县','浙江省湖州市长兴县',NULL,NULL,'1',3),(1068,1064,'330523','330500','安吉县','浙江省湖州市安吉县',NULL,NULL,'1',3),(1069,1013,'330600','330000','绍兴市','浙江省绍兴市',NULL,NULL,'1',2),(1070,1069,'330601','330600','市辖区','浙江省绍兴市市辖区',NULL,NULL,'0',3),(1071,1069,'330602','330600','越城区','浙江省绍兴市越城区',NULL,NULL,'1',3),(1072,1069,'330621','330600','绍兴县','浙江省绍兴市绍兴县',NULL,NULL,'1',3),(1073,1069,'330624','330600','新昌县','浙江省绍兴市新昌县',NULL,NULL,'1',3),(1074,1069,'330681','330600','诸暨市','浙江省绍兴市诸暨市',NULL,NULL,'1',3),(1075,1069,'330682','330600','上虞市','浙江省绍兴市上虞市',NULL,NULL,'1',3),(1076,1069,'330683','330600','嵊州市','浙江省绍兴市嵊州市',NULL,NULL,'1',3),(1077,1013,'330700','330000','金华市','浙江省金华市',NULL,NULL,'1',2),(1078,1077,'330701','330700','市辖区','浙江省金华市市辖区',NULL,NULL,'0',3),(1079,1077,'330702','330700','婺城区','浙江省金华市婺城区',NULL,NULL,'1',3),(1080,1077,'330721','330700','金华县','浙江省金华市金华县',NULL,NULL,'1',3),(1081,1077,'330723','330700','武义县','浙江省金华市武义县',NULL,NULL,'1',3),(1082,1077,'330726','330700','浦江县','浙江省金华市浦江县',NULL,NULL,'1',3),(1083,1077,'330727','330700','磐安县','浙江省金华市磐安县',NULL,NULL,'1',3),(1084,1077,'330781','330700','兰溪市','浙江省金华市兰溪市',NULL,NULL,'1',3),(1085,1077,'330782','330700','义乌市','浙江省金华市义乌市',NULL,NULL,'1',3),(1086,1077,'330783','330700','东阳市','浙江省金华市东阳市',NULL,NULL,'1',3),(1087,1077,'330784','330700','永康市','浙江省金华市永康市',NULL,NULL,'1',3),(1088,1013,'330800','330000','衢州市','浙江省衢州市',NULL,NULL,'1',2),(1089,1088,'330801','330800','市辖区','浙江省衢州市市辖区',NULL,NULL,'0',3),(1090,1088,'330802','330800','柯城区','浙江省衢州市柯城区',NULL,NULL,'1',3),(1091,1088,'330821','330800','衢县','浙江省衢州市衢县',NULL,NULL,'1',3),(1092,1088,'330822','330800','常山县','浙江省衢州市常山县',NULL,NULL,'1',3),(1093,1088,'330824','330800','开化县','浙江省衢州市开化县',NULL,NULL,'1',3),(1094,1088,'330825','330800','龙游县','浙江省衢州市龙游县',NULL,NULL,'1',3),(1095,1088,'330881','330800','江山市','浙江省衢州市江山市',NULL,NULL,'1',3),(1096,1013,'330900','330000','舟山市','浙江省舟山市',NULL,NULL,'1',2),(1097,1096,'330901','330900','市辖区','浙江省舟山市市辖区',NULL,NULL,'0',3),(1098,1096,'330902','330900','定海区','浙江省舟山市定海区',NULL,NULL,'1',3),(1099,1096,'330903','330900','普陀区','浙江省舟山市普陀区',NULL,NULL,'1',3),(1100,1096,'330921','330900','岱山县','浙江省舟山市岱山县',NULL,NULL,'1',3),(1101,1096,'330922','330900','嵊泗县','浙江省舟山市嵊泗县',NULL,NULL,'1',3),(1102,1013,'331000','330000','台州市','浙江省台州市',NULL,NULL,'1',2),(1103,1102,'331001','331000','市辖区','浙江省台州市市辖区',NULL,NULL,'0',3),(1104,1102,'331002','331000','椒江区','浙江省台州市椒江区',NULL,NULL,'1',3),(1105,1102,'331003','331000','黄岩区','浙江省台州市黄岩区',NULL,NULL,'1',3),(1106,1102,'331004','331000','路桥区','浙江省台州市路桥区',NULL,NULL,'1',3),(1107,1102,'331021','331000','玉环县','浙江省台州市玉环县',NULL,NULL,'1',3),(1108,1102,'331022','331000','三门县','浙江省台州市三门县',NULL,NULL,'1',3),(1109,1102,'331023','331000','天台县','浙江省台州市天台县',NULL,NULL,'1',3),(1110,1102,'331024','331000','仙居县','浙江省台州市仙居县',NULL,NULL,'1',3),(1111,1102,'331081','331000','温岭市','浙江省台州市温岭市',NULL,NULL,'1',3),(1112,1102,'331082','331000','临海市','浙江省台州市临海市',NULL,NULL,'1',3),(1113,1013,'332500','330000','丽水地区','浙江省丽水地区',NULL,NULL,'1',2),(1114,1113,'332501','332500','丽水市','浙江省丽水地区丽水市',NULL,NULL,'1',3),(1115,1113,'332502','332500','龙泉市','浙江省丽水地区龙泉市',NULL,NULL,'1',3),(1116,1113,'332522','332500','青田县','浙江省丽水地区青田县',NULL,NULL,'1',3),(1117,1113,'332523','332500','云和县','浙江省丽水地区云和县',NULL,NULL,'1',3),(1118,1113,'332525','332500','庆元县','浙江省丽水地区庆元县',NULL,NULL,'1',3),(1119,1113,'332526','332500','缙云县','浙江省丽水地区缙云县',NULL,NULL,'1',3),(1120,1113,'332527','332500','遂昌县','浙江省丽水地区遂昌县',NULL,NULL,'1',3),(1121,1113,'332528','332500','松阳县','浙江省丽水地区松阳县',NULL,NULL,'1',3),(1122,1113,'332529','332500','景宁县','浙江省丽水地区景宁畲族自治县',NULL,NULL,'1',3),(1123,1,'340000','86','安徽省','安徽省',NULL,NULL,'1',1),(1124,1123,'340100','340000','合肥市','安徽省合肥市',NULL,NULL,'1',2),(1125,1124,'340101','340100','市辖区','安徽省合肥市市辖区',NULL,NULL,'0',3),(1126,1124,'340102','340100','东市区','安徽省合肥市东市区',NULL,NULL,'1',3),(1127,1124,'340103','340100','中市区','安徽省合肥市中市区',NULL,NULL,'1',3),(1128,1124,'340104','340100','西市区','安徽省合肥市西市区',NULL,NULL,'1',3),(1129,1124,'340111','340100','郊区','安徽省合肥市郊区',NULL,NULL,'1',3),(1130,1124,'340121','340100','长丰县','安徽省合肥市长丰县',NULL,NULL,'1',3),(1131,1124,'340122','340100','肥东县','安徽省合肥市肥东县',NULL,NULL,'1',3),(1132,1124,'340123','340100','肥西县','安徽省合肥市肥西县',NULL,NULL,'1',3),(1133,1123,'340200','340000','芜湖市','安徽省芜湖市',NULL,NULL,'1',2),(1134,1133,'340201','340200','市辖区','安徽省芜湖市市辖区',NULL,NULL,'0',3),(1135,1133,'340202','340200','镜湖区','安徽省芜湖市镜湖区',NULL,NULL,'1',3),(1136,1133,'340203','340200','马塘区','安徽省芜湖市马塘区',NULL,NULL,'1',3),(1137,1133,'340204','340200','新芜区','安徽省芜湖市新芜区',NULL,NULL,'1',3),(1138,1133,'340207','340200','鸠江区','安徽省芜湖市鸠江区',NULL,NULL,'1',3),(1139,1133,'340221','340200','芜湖县','安徽省芜湖市芜湖县',NULL,NULL,'1',3),(1140,1133,'340222','340200','繁昌县','安徽省芜湖市繁昌县',NULL,NULL,'1',3),(1141,1133,'340223','340200','南陵县','安徽省芜湖市南陵县',NULL,NULL,'1',3),(1142,1123,'340300','340000','蚌埠市','安徽省蚌埠市',NULL,NULL,'1',2),(1143,1142,'340301','340300','市辖区','安徽省蚌埠市市辖区',NULL,NULL,'0',3),(1144,1142,'340302','340300','东市区','安徽省蚌埠市东市区',NULL,NULL,'1',3),(1145,1142,'340303','340300','中市区','安徽省蚌埠市中市区',NULL,NULL,'1',3),(1146,1142,'340304','340300','西市区','安徽省蚌埠市西市区',NULL,NULL,'1',3),(1147,1142,'340311','340300','郊区','安徽省蚌埠市郊区',NULL,NULL,'1',3),(1148,1142,'340321','340300','怀远县','安徽省蚌埠市怀远县',NULL,NULL,'1',3),(1149,1142,'340322','340300','五河县','安徽省蚌埠市五河县',NULL,NULL,'1',3),(1150,1142,'340323','340300','固镇县','安徽省蚌埠市固镇县',NULL,NULL,'1',3),(1151,1123,'340400','340000','淮南市','安徽省淮南市',NULL,NULL,'1',2),(1152,1151,'340401','340400','市辖区','安徽省淮南市市辖区',NULL,NULL,'0',3),(1153,1151,'340402','340400','大通区','安徽省淮南市大通区',NULL,NULL,'1',3),(1154,1151,'340403','340400','田家庵区','安徽省淮南市田家庵区',NULL,NULL,'1',3),(1155,1151,'340404','340400','谢家集区','安徽省淮南市谢家集区',NULL,NULL,'1',3),(1156,1151,'340405','340400','八公山区','安徽省淮南市八公山区',NULL,NULL,'1',3),(1157,1151,'340406','340400','潘集区','安徽省淮南市潘集区',NULL,NULL,'1',3),(1158,1151,'340421','340400','凤台县','安徽省淮南市凤台县',NULL,NULL,'1',3),(1159,1123,'340500','340000','马鞍山市','安徽省马鞍山市',NULL,NULL,'1',2),(1160,1159,'340501','340500','市辖区','安徽省马鞍山市市辖区',NULL,NULL,'0',3),(1161,1159,'340502','340500','金家庄区','安徽省马鞍山市金家庄区',NULL,NULL,'1',3),(1162,1159,'340503','340500','花山区','安徽省马鞍山市花山区',NULL,NULL,'1',3),(1163,1159,'340504','340500','雨山区','安徽省马鞍山市雨山区',NULL,NULL,'1',3),(1164,1159,'340505','340500','向山区','安徽省马鞍山市向山区',NULL,NULL,'1',3),(1165,1159,'340521','340500','当涂县','安徽省马鞍山市当涂县',NULL,NULL,'1',3),(1166,1123,'340600','340000','淮北市','安徽省淮北市',NULL,NULL,'1',2),(1167,1166,'340601','340600','市辖区','安徽省淮北市市辖区',NULL,NULL,'0',3),(1168,1166,'340602','340600','杜集区','安徽省淮北市杜集区',NULL,NULL,'1',3),(1169,1166,'340603','340600','相山区','安徽省淮北市相山区',NULL,NULL,'1',3),(1170,1166,'340604','340600','烈山区','安徽省淮北市烈山区',NULL,NULL,'1',3),(1171,1166,'340621','340600','濉溪县','安徽省淮北市濉溪县',NULL,NULL,'1',3),(1172,1123,'340700','340000','铜陵市','安徽省铜陵市',NULL,NULL,'1',2),(1173,1172,'340701','340700','市辖区','安徽省铜陵市市辖区',NULL,NULL,'0',3),(1174,1172,'340702','340700','铜官山区','安徽省铜陵市铜官山区',NULL,NULL,'1',3),(1175,1172,'340703','340700','狮子山区','安徽省铜陵市狮子山区',NULL,NULL,'1',3),(1176,1172,'340711','340700','郊区','安徽省铜陵市郊区',NULL,NULL,'1',3),(1177,1172,'340721','340700','铜陵县','安徽省铜陵市铜陵县',NULL,NULL,'1',3),(1178,1123,'340800','340000','安庆市','安徽省安庆市',NULL,NULL,'1',2),(1179,1178,'340801','340800','市辖区','安徽省安庆市市辖区',NULL,NULL,'0',3),(1180,1178,'340802','340800','迎江区','安徽省安庆市迎江区',NULL,NULL,'1',3),(1181,1178,'340803','340800','大观区','安徽省安庆市大观区',NULL,NULL,'1',3),(1182,1178,'340811','340800','郊区','安徽省安庆市郊区',NULL,NULL,'1',3),(1183,1178,'340822','340800','怀宁县','安徽省安庆市怀宁县',NULL,NULL,'1',3),(1184,1178,'340823','340800','枞阳县','安徽省安庆市枞阳县',NULL,NULL,'1',3),(1185,1178,'340824','340800','潜山县','安徽省安庆市潜山县',NULL,NULL,'1',3),(1186,1178,'340825','340800','太湖县','安徽省安庆市太湖县',NULL,NULL,'1',3),(1187,1178,'340826','340800','宿松县','安徽省安庆市宿松县',NULL,NULL,'1',3),(1188,1178,'340827','340800','望江县','安徽省安庆市望江县',NULL,NULL,'1',3),(1189,1178,'340828','340800','岳西县','安徽省安庆市岳西县',NULL,NULL,'1',3),(1190,1178,'340881','340800','桐城市','安徽省安庆市桐城市',NULL,NULL,'1',3),(1191,1123,'341000','340000','黄山市','安徽省黄山市',NULL,NULL,'1',2),(1192,1191,'341001','341000','市辖区','安徽省黄山市市辖区',NULL,NULL,'0',3),(1193,1191,'341002','341000','屯溪区','安徽省黄山市屯溪区',NULL,NULL,'1',3),(1194,1191,'341003','341000','黄山区','安徽省黄山市黄山区',NULL,NULL,'1',3),(1195,1191,'341004','341000','徽州区','安徽省黄山市徽州区',NULL,NULL,'1',3),(1196,1191,'341021','341000','歙县','安徽省黄山市歙县',NULL,NULL,'1',3),(1197,1191,'341022','341000','休宁县','安徽省黄山市休宁县',NULL,NULL,'1',3),(1198,1191,'341023','341000','黟县','安徽省黄山市黟县',NULL,NULL,'1',3),(1199,1191,'341024','341000','祁门县','安徽省黄山市祁门县',NULL,NULL,'1',3),(1200,1123,'341100','340000','滁州市','安徽省滁州市',NULL,NULL,'1',2),(1201,1200,'341101','341100','市辖区','安徽省滁州市市辖区',NULL,NULL,'0',3),(1202,1200,'341102','341100','琅琊区','安徽省滁州市琅琊区',NULL,NULL,'1',3),(1203,1200,'341103','341100','南谯区','安徽省滁州市南谯区',NULL,NULL,'1',3),(1204,1200,'341122','341100','来安县','安徽省滁州市来安县',NULL,NULL,'1',3),(1205,1200,'341124','341100','全椒县','安徽省滁州市全椒县',NULL,NULL,'1',3),(1206,1200,'341125','341100','定远县','安徽省滁州市定远县',NULL,NULL,'1',3),(1207,1200,'341126','341100','凤阳县','安徽省滁州市凤阳县',NULL,NULL,'1',3),(1208,1200,'341181','341100','天长市','安徽省滁州市天长市',NULL,NULL,'1',3),(1209,1200,'341182','341100','明光市','安徽省滁州市明光市',NULL,NULL,'1',3),(1210,1123,'341200','340000','阜阳市','安徽省阜阳市',NULL,NULL,'1',2),(1211,1210,'341201','341200','市辖区','安徽省阜阳市市辖区',NULL,NULL,'0',3),(1212,1210,'341202','341200','颍州区','安徽省阜阳市颍州区',NULL,NULL,'1',3),(1213,1210,'341203','341200','颍东区','安徽省阜阳市颍东区',NULL,NULL,'1',3),(1214,1210,'341204','341200','颍泉区','安徽省阜阳市颍泉区',NULL,NULL,'1',3),(1215,1210,'341221','341200','临泉县','安徽省阜阳市临泉县',NULL,NULL,'1',3),(1216,1210,'341222','341200','太和县','安徽省阜阳市太和县',NULL,NULL,'1',3),(1217,1210,'341223','341200','涡阳县','安徽省阜阳市涡阳县',NULL,NULL,'1',3),(1218,1210,'341224','341200','蒙城县','安徽省阜阳市蒙城县',NULL,NULL,'1',3),(1219,1210,'341225','341200','阜南县','安徽省阜阳市阜南县',NULL,NULL,'1',3),(1220,1210,'341226','341200','颍上县','安徽省阜阳市颍上县',NULL,NULL,'1',3),(1221,1210,'341227','341200','利辛县','安徽省阜阳市利辛县',NULL,NULL,'1',3),(1222,1210,'341281','341200','亳州市','安徽省阜阳市亳州市',NULL,NULL,'1',3),(1223,1210,'341282','341200','界首市','安徽省阜阳市界首市',NULL,NULL,'1',3),(1224,1123,'341300','340000','宿州市','安徽省宿州市',NULL,NULL,'1',2),(1225,1224,'341301','341300','市辖区','安徽省宿州市市辖区',NULL,NULL,'0',3),(1226,1224,'341302','341300','甬桥区','安徽省宿州市甬桥区',NULL,NULL,'1',3),(1227,1224,'341321','341300','砀山县','安徽省宿州市砀山县',NULL,NULL,'1',3),(1228,1224,'341322','341300','萧县','安徽省宿州市萧县',NULL,NULL,'1',3),(1229,1224,'341323','341300','灵璧县','安徽省宿州市灵璧县',NULL,NULL,'1',3),(1230,1224,'341324','341300','泗县','安徽省宿州市泗县',NULL,NULL,'1',3),(1231,1123,'342400','340000','六安地区','安徽省六安地区',NULL,NULL,'1',2),(1232,1231,'342401','342400','六安市','安徽省六安地区六安市',NULL,NULL,'1',3),(1233,1231,'342422','342400','寿县','安徽省六安地区寿县',NULL,NULL,'1',3),(1234,1231,'342423','342400','霍邱县','安徽省六安地区霍邱县',NULL,NULL,'1',3),(1235,1231,'342425','342400','舒城县','安徽省六安地区舒城县',NULL,NULL,'1',3),(1236,1231,'342426','342400','金寨县','安徽省六安地区金寨县',NULL,NULL,'1',3),(1237,1231,'342427','342400','霍山县','安徽省六安地区霍山县',NULL,NULL,'1',3),(1238,1123,'342500','340000','宣城地区','安徽省宣城地区',NULL,NULL,'1',2),(1239,1238,'342501','342500','宣州市','安徽省宣城地区宣州市',NULL,NULL,'1',3),(1240,1238,'342502','342500','宁国市','安徽省宣城地区宁国市',NULL,NULL,'1',3),(1241,1238,'342522','342500','郎溪县','安徽省宣城地区郎溪县',NULL,NULL,'1',3),(1242,1238,'342523','342500','广德县','安徽省宣城地区广德县',NULL,NULL,'1',3),(1243,1238,'342529','342500','泾县','安徽省宣城地区泾县',NULL,NULL,'1',3),(1244,1238,'342530','342500','旌德县','安徽省宣城地区旌德县',NULL,NULL,'1',3),(1245,1238,'342531','342500','绩溪县','安徽省宣城地区绩溪县',NULL,NULL,'1',3),(1246,1123,'342600','340000','巢湖地区','安徽省巢湖地区',NULL,NULL,'1',2),(1247,1246,'342601','342600','巢湖市','安徽省巢湖地区巢湖市',NULL,NULL,'1',3),(1248,1246,'342622','342600','庐江县','安徽省巢湖地区庐江县',NULL,NULL,'1',3),(1249,1246,'342623','342600','无为县','安徽省巢湖地区无为县',NULL,NULL,'1',3),(1250,1246,'342625','342600','含山县','安徽省巢湖地区含山县',NULL,NULL,'1',3),(1251,1246,'342626','342600','和县','安徽省巢湖地区和县',NULL,NULL,'1',3),(1252,1123,'342900','340000','池州地区','安徽省池州地区',NULL,NULL,'1',2),(1253,1252,'342901','342900','贵池市','安徽省池州地区贵池市',NULL,NULL,'1',3),(1254,1252,'342921','342900','东至县','安徽省池州地区东至县',NULL,NULL,'1',3),(1255,1252,'342922','342900','石台县','安徽省池州地区石台县',NULL,NULL,'1',3),(1256,1252,'342923','342900','青阳县','安徽省池州地区青阳县',NULL,NULL,'1',3),(1257,1,'350000','86','福建省','福建省',NULL,NULL,'1',1),(1258,1257,'350100','350000','福州市','福建省福州市',NULL,NULL,'1',2),(1259,1258,'350101','350100','市辖区','福建省福州市市辖区',NULL,NULL,'0',3),(1260,1258,'350102','350100','鼓楼区','福建省福州市鼓楼区',NULL,NULL,'1',3),(1261,1258,'350103','350100','台江区','福建省福州市台江区',NULL,NULL,'1',3),(1262,1258,'350104','350100','仓山区','福建省福州市仓山区',NULL,NULL,'1',3),(1263,1258,'350105','350100','马尾区','福建省福州市马尾区',NULL,NULL,'1',3),(1264,1258,'350111','350100','晋安区','福建省福州市晋安区',NULL,NULL,'1',3),(1265,1258,'350121','350100','闽侯县','福建省福州市闽侯县',NULL,NULL,'1',3),(1266,1258,'350122','350100','连江县','福建省福州市连江县',NULL,NULL,'1',3),(1267,1258,'350123','350100','罗源县','福建省福州市罗源县',NULL,NULL,'1',3),(1268,1258,'350124','350100','闽清县','福建省福州市闽清县',NULL,NULL,'1',3),(1269,1258,'350125','350100','永泰县','福建省福州市永泰县',NULL,NULL,'1',3),(1270,1258,'350128','350100','平潭县','福建省福州市平潭县',NULL,NULL,'1',3),(1271,1258,'350181','350100','福清市','福建省福州市福清市',NULL,NULL,'1',3),(1272,1258,'350182','350100','长乐市','福建省福州市长乐市',NULL,NULL,'1',3),(1273,1257,'350200','350000','厦门市','福建省厦门市',NULL,NULL,'1',2),(1274,1273,'350201','350200','市辖区','福建省厦门市市辖区',NULL,NULL,'0',3),(1275,1273,'350202','350200','鼓浪屿区','福建省厦门市鼓浪屿区',NULL,NULL,'1',3),(1276,1273,'350203','350200','思明区','福建省厦门市思明区',NULL,NULL,'1',3),(1277,1273,'350204','350200','开元区','福建省厦门市开元区',NULL,NULL,'1',3),(1278,1273,'350205','350200','杏林区','福建省厦门市杏林区',NULL,NULL,'1',3),(1279,1273,'350206','350200','湖里区','福建省厦门市湖里区',NULL,NULL,'1',3),(1280,1273,'350211','350200','集美区','福建省厦门市集美区',NULL,NULL,'1',3),(1281,1273,'350212','350200','同安区','福建省厦门市同安区',NULL,NULL,'1',3),(1282,1257,'350300','350000','莆田市','福建省莆田市',NULL,NULL,'1',2),(1283,1282,'350301','350300','市辖区','福建省莆田市市辖区',NULL,NULL,'0',3),(1284,1282,'350302','350300','城厢区','福建省莆田市城厢区',NULL,NULL,'1',3),(1285,1282,'350303','350300','涵江区','福建省莆田市涵江区',NULL,NULL,'1',3),(1286,1282,'350321','350300','莆田县','福建省莆田市莆田县',NULL,NULL,'1',3),(1287,1282,'350322','350300','仙游县','福建省莆田市仙游县',NULL,NULL,'1',3),(1288,1257,'350400','350000','三明市','福建省三明市',NULL,NULL,'1',2),(1289,1288,'350401','350400','市辖区','福建省三明市市辖区',NULL,NULL,'0',3),(1290,1288,'350402','350400','梅列区','福建省三明市梅列区',NULL,NULL,'1',3),(1291,1288,'350403','350400','三元区','福建省三明市三元区',NULL,NULL,'1',3),(1292,1288,'350421','350400','明溪县','福建省三明市明溪县',NULL,NULL,'1',3),(1293,1288,'350423','350400','清流县','福建省三明市清流县',NULL,NULL,'1',3),(1294,1288,'350424','350400','宁化县','福建省三明市宁化县',NULL,NULL,'1',3),(1295,1288,'350425','350400','大田县','福建省三明市大田县',NULL,NULL,'1',3),(1296,1288,'350426','350400','尤溪县','福建省三明市尤溪县',NULL,NULL,'1',3),(1297,1288,'350427','350400','沙县','福建省三明市沙县',NULL,NULL,'1',3),(1298,1288,'350428','350400','将乐县','福建省三明市将乐县',NULL,NULL,'1',3),(1299,1288,'350429','350400','泰宁县','福建省三明市泰宁县',NULL,NULL,'1',3),(1300,1288,'350430','350400','建宁县','福建省三明市建宁县',NULL,NULL,'1',3),(1301,1288,'350481','350400','永安市','福建省三明市永安市',NULL,NULL,'1',3),(1302,1257,'350500','350000','泉州市','福建省泉州市',NULL,NULL,'1',2),(1303,1302,'350501','350500','市辖区','福建省泉州市市辖区',NULL,NULL,'0',3),(1304,1302,'350502','350500','鲤城区','福建省泉州市鲤城区',NULL,NULL,'1',3),(1305,1302,'350503','350500','丰泽区','福建省泉州市丰泽区',NULL,NULL,'1',3),(1306,1302,'350504','350500','洛江区','福建省泉州市洛江区',NULL,NULL,'1',3),(1307,1302,'350521','350500','惠安县','福建省泉州市惠安县',NULL,NULL,'1',3),(1308,1302,'350524','350500','安溪县','福建省泉州市安溪县',NULL,NULL,'1',3),(1309,1302,'350525','350500','永春县','福建省泉州市永春县',NULL,NULL,'1',3),(1310,1302,'350526','350500','德化县','福建省泉州市德化县',NULL,NULL,'1',3),(1311,1302,'350527','350500','金门县','福建省泉州市金门县',NULL,NULL,'1',3),(1312,1302,'350581','350500','石狮市','福建省泉州市石狮市',NULL,NULL,'1',3),(1313,1302,'350582','350500','晋江市','福建省泉州市晋江市',NULL,NULL,'1',3),(1314,1302,'350583','350500','南安市','福建省泉州市南安市',NULL,NULL,'1',3),(1315,1257,'350600','350000','漳州市','福建省漳州市',NULL,NULL,'1',2),(1316,1315,'350601','350600','市辖区','福建省漳州市市辖区',NULL,NULL,'0',3),(1317,1315,'350602','350600','芗城区','福建省漳州市芗城区',NULL,NULL,'1',3),(1318,1315,'350603','350600','龙文区','福建省漳州市龙文区',NULL,NULL,'1',3),(1319,1315,'350622','350600','云霄县','福建省漳州市云霄县',NULL,NULL,'1',3),(1320,1315,'350623','350600','漳浦县','福建省漳州市漳浦县',NULL,NULL,'1',3),(1321,1315,'350624','350600','诏安县','福建省漳州市诏安县',NULL,NULL,'1',3),(1322,1315,'350625','350600','长泰县','福建省漳州市长泰县',NULL,NULL,'1',3),(1323,1315,'350626','350600','东山县','福建省漳州市东山县',NULL,NULL,'1',3),(1324,1315,'350627','350600','南靖县','福建省漳州市南靖县',NULL,NULL,'1',3),(1325,1315,'350628','350600','平和县','福建省漳州市平和县',NULL,NULL,'1',3),(1326,1315,'350629','350600','华安县','福建省漳州市华安县',NULL,NULL,'1',3),(1327,1315,'350681','350600','龙海市','福建省漳州市龙海市',NULL,NULL,'1',3),(1328,1257,'350700','350000','南平市','福建省南平市',NULL,NULL,'1',2),(1329,1328,'350701','350700','市辖区','福建省南平市市辖区',NULL,NULL,'0',3),(1330,1328,'350702','350700','延平区','福建省南平市延平区',NULL,NULL,'1',3),(1331,1328,'350721','350700','顺昌县','福建省南平市顺昌县',NULL,NULL,'1',3),(1332,1328,'350722','350700','浦城县','福建省南平市浦城县',NULL,NULL,'1',3),(1333,1328,'350723','350700','光泽县','福建省南平市光泽县',NULL,NULL,'1',3),(1334,1328,'350724','350700','松溪县','福建省南平市松溪县',NULL,NULL,'1',3),(1335,1328,'350725','350700','政和县','福建省南平市政和县',NULL,NULL,'1',3),(1336,1328,'350781','350700','邵武市','福建省南平市邵武市',NULL,NULL,'1',3),(1337,1328,'350782','350700','武夷山市','福建省南平市武夷山市',NULL,NULL,'1',3),(1338,1328,'350783','350700','建瓯市','福建省南平市建瓯市',NULL,NULL,'1',3),(1339,1328,'350784','350700','建阳市','福建省南平市建阳市',NULL,NULL,'1',3),(1340,1257,'350800','350000','龙岩市','福建省龙岩市',NULL,NULL,'1',2),(1341,1340,'350801','350800','市辖区','福建省龙岩市市辖区',NULL,NULL,'0',3),(1342,1340,'350802','350800','新罗区','福建省龙岩市新罗区',NULL,NULL,'1',3),(1343,1340,'350821','350800','长汀县','福建省龙岩市长汀县',NULL,NULL,'1',3),(1344,1340,'350822','350800','永定县','福建省龙岩市永定县',NULL,NULL,'1',3),(1345,1340,'350823','350800','上杭县','福建省龙岩市上杭县',NULL,NULL,'1',3),(1346,1340,'350824','350800','武平县','福建省龙岩市武平县',NULL,NULL,'1',3),(1347,1340,'350825','350800','连城县','福建省龙岩市连城县',NULL,NULL,'1',3),(1348,1340,'350881','350800','漳平市','福建省龙岩市漳平市',NULL,NULL,'1',3),(1349,1257,'352200','350000','宁德地区','福建省宁德地区',NULL,NULL,'1',2),(1350,1349,'352201','352200','宁德市','福建省宁德地区宁德市',NULL,NULL,'1',3),(1351,1349,'352202','352200','福安市','福建省宁德地区福安市',NULL,NULL,'1',3),(1352,1349,'352203','352200','福鼎市','福建省宁德地区福鼎市',NULL,NULL,'1',3),(1353,1349,'352225','352200','霞浦县','福建省宁德地区霞浦县',NULL,NULL,'1',3),(1354,1349,'352227','352200','古田县','福建省宁德地区古田县',NULL,NULL,'1',3),(1355,1349,'352228','352200','屏南县','福建省宁德地区屏南县',NULL,NULL,'1',3),(1356,1349,'352229','352200','寿宁县','福建省宁德地区寿宁县',NULL,NULL,'1',3),(1357,1349,'352230','352200','周宁县','福建省宁德地区周宁县',NULL,NULL,'1',3),(1358,1349,'352231','352200','柘荣县','福建省宁德地区柘荣县',NULL,NULL,'1',3),(1359,1,'360000','86','江西省','江西省',NULL,NULL,'1',1),(1360,1359,'360100','360000','南昌市','江西省南昌市',NULL,NULL,'1',2),(1361,1360,'360101','360100','市辖区','江西省南昌市市辖区',NULL,NULL,'0',3),(1362,1360,'360102','360100','东湖区','江西省南昌市东湖区',NULL,NULL,'1',3),(1363,1360,'360103','360100','西湖区','江西省南昌市西湖区',NULL,NULL,'1',3),(1364,1360,'360104','360100','青云谱区','江西省南昌市青云谱区',NULL,NULL,'1',3),(1365,1360,'360105','360100','湾里区','江西省南昌市湾里区',NULL,NULL,'1',3),(1366,1360,'360111','360100','郊区','江西省南昌市郊区',NULL,NULL,'1',3),(1367,1360,'360121','360100','南昌县','江西省南昌市南昌县',NULL,NULL,'1',3),(1368,1360,'360122','360100','新建县','江西省南昌市新建县',NULL,NULL,'1',3),(1369,1360,'360123','360100','安义县','江西省南昌市安义县',NULL,NULL,'1',3),(1370,1360,'360124','360100','进贤县','江西省南昌市进贤县',NULL,NULL,'1',3),(1371,1359,'360200','360000','景德镇市','江西省景德镇市',NULL,NULL,'1',2),(1372,1371,'360201','360200','市辖区','江西省景德镇市市辖区',NULL,NULL,'0',3),(1373,1371,'360202','360200','昌江区','江西省景德镇市昌江区',NULL,NULL,'1',3),(1374,1371,'360203','360200','珠山区','江西省景德镇市珠山区',NULL,NULL,'1',3),(1375,1371,'360222','360200','浮梁县','江西省景德镇市浮梁县',NULL,NULL,'1',3),(1376,1371,'360281','360200','乐平市','江西省景德镇市乐平市',NULL,NULL,'1',3),(1377,1359,'360300','360000','萍乡市','江西省萍乡市',NULL,NULL,'1',2),(1378,1377,'360301','360300','市辖区','江西省萍乡市市辖区',NULL,NULL,'0',3),(1379,1377,'360302','360300','安源区','江西省萍乡市安源区',NULL,NULL,'1',3),(1380,1377,'360313','360300','湘东区','江西省萍乡市湘东区',NULL,NULL,'1',3),(1381,1377,'360321','360300','莲花县','江西省萍乡市莲花县',NULL,NULL,'1',3),(1382,1377,'360322','360300','上栗县','江西省萍乡市上栗县',NULL,NULL,'1',3),(1383,1377,'360323','360300','芦溪县','江西省萍乡市芦溪县',NULL,NULL,'1',3),(1384,1359,'360400','360000','九江市','江西省九江市',NULL,NULL,'1',2),(1385,1384,'360401','360400','市辖区','江西省九江市市辖区',NULL,NULL,'0',3),(1386,1384,'360402','360400','庐山区','江西省九江市庐山区',NULL,NULL,'1',3),(1387,1384,'360403','360400','浔阳区','江西省九江市浔阳区',NULL,NULL,'1',3),(1388,1384,'360421','360400','九江县','江西省九江市九江县',NULL,NULL,'1',3),(1389,1384,'360423','360400','武宁县','江西省九江市武宁县',NULL,NULL,'1',3),(1390,1384,'360424','360400','修水县','江西省九江市修水县',NULL,NULL,'1',3),(1391,1384,'360425','360400','永修县','江西省九江市永修县',NULL,NULL,'1',3),(1392,1384,'360426','360400','德安县','江西省九江市德安县',NULL,NULL,'1',3),(1393,1384,'360427','360400','星子县','江西省九江市星子县',NULL,NULL,'1',3),(1394,1384,'360428','360400','都昌县','江西省九江市都昌县',NULL,NULL,'1',3),(1395,1384,'360429','360400','湖口县','江西省九江市湖口县',NULL,NULL,'1',3),(1396,1384,'360430','360400','彭泽县','江西省九江市彭泽县',NULL,NULL,'1',3),(1397,1384,'360481','360400','瑞昌市','江西省九江市瑞昌市',NULL,NULL,'1',3),(1398,1359,'360500','360000','新余市','江西省新余市',NULL,NULL,'1',2),(1399,1398,'360501','360500','市辖区','江西省新余市市辖区',NULL,NULL,'0',3),(1400,1398,'360502','360500','渝水区','江西省新余市渝水区',NULL,NULL,'1',3),(1401,1398,'360521','360500','分宜县','江西省新余市分宜县',NULL,NULL,'1',3),(1402,1359,'360600','360000','鹰潭市','江西省鹰潭市',NULL,NULL,'1',2),(1403,1402,'360601','360600','市辖区','江西省鹰潭市市辖区',NULL,NULL,'0',3),(1404,1402,'360602','360600','月湖区','江西省鹰潭市月湖区',NULL,NULL,'1',3),(1405,1402,'360622','360600','余江县','江西省鹰潭市余江县',NULL,NULL,'1',3),(1406,1402,'360681','360600','贵溪市','江西省鹰潭市贵溪市',NULL,NULL,'1',3),(1407,1359,'360700','360000','赣州市','江西省赣州市',NULL,NULL,'1',2),(1408,1407,'360701','360700','市辖区','江西省赣州市市辖区',NULL,NULL,'0',3),(1409,1407,'360702','360700','章贡区','江西省赣州市章贡区',NULL,NULL,'1',3),(1410,1407,'360721','360700','赣县','江西省赣州市赣县',NULL,NULL,'1',3),(1411,1407,'360722','360700','信丰县','江西省赣州市信丰县',NULL,NULL,'1',3),(1412,1407,'360723','360700','大余县','江西省赣州市大余县',NULL,NULL,'1',3),(1413,1407,'360724','360700','上犹县','江西省赣州市上犹县',NULL,NULL,'1',3),(1414,1407,'360725','360700','崇义县','江西省赣州市崇义县',NULL,NULL,'1',3),(1415,1407,'360726','360700','安远县','江西省赣州市安远县',NULL,NULL,'1',3),(1416,1407,'360727','360700','龙南县','江西省赣州市龙南县',NULL,NULL,'1',3),(1417,1407,'360728','360700','定南县','江西省赣州市定南县',NULL,NULL,'1',3),(1418,1407,'360729','360700','全南县','江西省赣州市全南县',NULL,NULL,'1',3),(1419,1407,'360730','360700','宁都县','江西省赣州市宁都县',NULL,NULL,'1',3),(1420,1407,'360731','360700','于都县','江西省赣州市于都县',NULL,NULL,'1',3),(1421,1407,'360732','360700','兴国县','江西省赣州市兴国县',NULL,NULL,'1',3),(1422,1407,'360733','360700','会昌县','江西省赣州市会昌县',NULL,NULL,'1',3),(1423,1407,'360734','360700','寻乌县','江西省赣州市寻乌县',NULL,NULL,'1',3),(1424,1407,'360735','360700','石城县','江西省赣州市石城县',NULL,NULL,'1',3),(1425,1407,'360781','360700','瑞金市','江西省赣州市瑞金市',NULL,NULL,'1',3),(1426,1407,'360782','360700','南康市','江西省赣州市南康市',NULL,NULL,'1',3),(1427,1359,'362200','360000','宜春地区','江西省宜春地区',NULL,NULL,'1',2),(1428,1427,'362201','362200','宜春市','江西省宜春地区宜春市',NULL,NULL,'1',3),(1429,1427,'362202','362200','丰城市','江西省宜春地区丰城市',NULL,NULL,'1',3),(1430,1427,'362203','362200','樟树市','江西省宜春地区樟树市',NULL,NULL,'1',3),(1431,1427,'362204','362200','高安市','江西省宜春地区高安市',NULL,NULL,'1',3),(1432,1427,'362226','362200','奉新县','江西省宜春地区奉新县',NULL,NULL,'1',3),(1433,1427,'362227','362200','万载县','江西省宜春地区万载县',NULL,NULL,'1',3),(1434,1427,'362228','362200','上高县','江西省宜春地区上高县',NULL,NULL,'1',3),(1435,1427,'362229','362200','宜丰县','江西省宜春地区宜丰县',NULL,NULL,'1',3),(1436,1427,'362232','362200','靖安县','江西省宜春地区靖安县',NULL,NULL,'1',3),(1437,1427,'362233','362200','铜鼓县','江西省宜春地区铜鼓县',NULL,NULL,'1',3),(1438,1359,'362300','360000','上饶地区','江西省上饶地区',NULL,NULL,'1',2),(1439,1438,'362301','362300','上饶市','江西省上饶地区上饶市',NULL,NULL,'1',3),(1440,1438,'362302','362300','德兴市','江西省上饶地区德兴市',NULL,NULL,'1',3),(1441,1438,'362321','362300','上饶县','江西省上饶地区上饶县',NULL,NULL,'1',3),(1442,1438,'362322','362300','广丰县','江西省上饶地区广丰县',NULL,NULL,'1',3),(1443,1438,'362323','362300','玉山县','江西省上饶地区玉山县',NULL,NULL,'1',3),(1444,1438,'362324','362300','铅山县','江西省上饶地区铅山县',NULL,NULL,'1',3),(1445,1438,'362325','362300','横峰县','江西省上饶地区横峰县',NULL,NULL,'1',3),(1446,1438,'362326','362300','弋阳县','江西省上饶地区弋阳县',NULL,NULL,'1',3),(1447,1438,'362329','362300','余干县','江西省上饶地区余干县',NULL,NULL,'1',3),(1448,1438,'362330','362300','波阳县','江西省上饶地区波阳县',NULL,NULL,'1',3),(1449,1438,'362331','362300','万年县','江西省上饶地区万年县',NULL,NULL,'1',3),(1450,1438,'362334','362300','婺源县','江西省上饶地区婺源县',NULL,NULL,'1',3),(1451,1359,'362400','360000','吉安地区','江西省吉安地区',NULL,NULL,'1',2),(1452,1451,'362401','362400','吉安市','江西省吉安地区吉安市',NULL,NULL,'1',3),(1453,1451,'362402','362400','井冈山市','江西省吉安地区井冈山市',NULL,NULL,'1',3),(1454,1451,'362421','362400','吉安县','江西省吉安地区吉安县',NULL,NULL,'1',3),(1455,1451,'362422','362400','吉水县','江西省吉安地区吉水县',NULL,NULL,'1',3),(1456,1451,'362423','362400','峡江县','江西省吉安地区峡江县',NULL,NULL,'1',3),(1457,1451,'362424','362400','新干县','江西省吉安地区新干县',NULL,NULL,'1',3),(1458,1451,'362425','362400','永丰县','江西省吉安地区永丰县',NULL,NULL,'1',3),(1459,1451,'362426','362400','泰和县','江西省吉安地区泰和县',NULL,NULL,'1',3),(1460,1451,'362427','362400','遂川县','江西省吉安地区遂川县',NULL,NULL,'1',3),(1461,1451,'362428','362400','万安县','江西省吉安地区万安县',NULL,NULL,'1',3),(1462,1451,'362429','362400','安福县','江西省吉安地区安福县',NULL,NULL,'1',3),(1463,1451,'362430','362400','永新县','江西省吉安地区永新县',NULL,NULL,'1',3),(1464,1451,'362432','362400','宁冈县','江西省吉安地区宁冈县',NULL,NULL,'1',3),(1465,1359,'362500','360000','抚州地区','江西省抚州地区',NULL,NULL,'1',2),(1466,1465,'362502','362500','临川市','江西省抚州地区临川市',NULL,NULL,'1',3),(1467,1465,'362522','362500','南城县','江西省抚州地区南城县',NULL,NULL,'1',3),(1468,1465,'362523','362500','黎川县','江西省抚州地区黎川县',NULL,NULL,'1',3),(1469,1465,'362524','362500','南丰县','江西省抚州地区南丰县',NULL,NULL,'1',3),(1470,1465,'362525','362500','崇仁县','江西省抚州地区崇仁县',NULL,NULL,'1',3),(1471,1465,'362526','362500','乐安县','江西省抚州地区乐安县',NULL,NULL,'1',3),(1472,1465,'362527','362500','宜黄县','江西省抚州地区宜黄县',NULL,NULL,'1',3),(1473,1465,'362528','362500','金溪县','江西省抚州地区金溪县',NULL,NULL,'1',3),(1474,1465,'362529','362500','资溪县','江西省抚州地区资溪县',NULL,NULL,'1',3),(1475,1465,'362531','362500','东乡县','江西省抚州地区东乡县',NULL,NULL,'1',3),(1476,1465,'362532','362500','广昌县','江西省抚州地区广昌县',NULL,NULL,'1',3),(1477,1,'370000','86','山东省','山东省',NULL,NULL,'1',1),(1478,1477,'370100','370000','济南市','山东省济南市',NULL,NULL,'1',2),(1479,1478,'370101','370100','市辖区','山东省济南市市辖区',NULL,NULL,'0',3),(1480,1478,'370102','370100','历下区','山东省济南市历下区',NULL,NULL,'1',3),(1481,1478,'370103','370100','市中区','山东省济南市市中区',NULL,NULL,'1',3),(1482,1478,'370104','370100','槐荫区','山东省济南市槐荫区',NULL,NULL,'1',3),(1483,1478,'370105','370100','天桥区','山东省济南市天桥区',NULL,NULL,'1',3),(1484,1478,'370112','370100','历城区','山东省济南市历城区',NULL,NULL,'1',3),(1485,1478,'370123','370100','长清县','山东省济南市长清县',NULL,NULL,'1',3),(1486,1478,'370124','370100','平阴县','山东省济南市平阴县',NULL,NULL,'1',3),(1487,1478,'370125','370100','济阳县','山东省济南市济阳县',NULL,NULL,'1',3),(1488,1478,'370126','370100','商河县','山东省济南市商河县',NULL,NULL,'1',3),(1489,1478,'370181','370100','章丘市','山东省济南市章丘市',NULL,NULL,'1',3),(1490,1477,'370200','370000','青岛市','山东省青岛市',NULL,NULL,'1',2),(1491,1490,'370201','370200','市辖区','山东省青岛市市辖区',NULL,NULL,'0',3),(1492,1490,'370202','370200','市南区','山东省青岛市市南区',NULL,NULL,'1',3),(1493,1490,'370203','370200','市北区','山东省青岛市市北区',NULL,NULL,'1',3),(1494,1490,'370205','370200','四方区','山东省青岛市四方区',NULL,NULL,'1',3),(1495,1490,'370211','370200','黄岛区','山东省青岛市黄岛区',NULL,NULL,'1',3),(1496,1490,'370212','370200','崂山区','山东省青岛市崂山区',NULL,NULL,'1',3),(1497,1490,'370213','370200','李沧区','山东省青岛市李沧区',NULL,NULL,'1',3),(1498,1490,'370214','370200','城阳区','山东省青岛市城阳区',NULL,NULL,'1',3),(1499,1490,'370281','370200','胶州市','山东省青岛市胶州市',NULL,NULL,'1',3),(1500,1490,'370282','370200','即墨市','山东省青岛市即墨市',NULL,NULL,'1',3),(1501,1490,'370283','370200','平度市','山东省青岛市平度市',NULL,NULL,'1',3),(1502,1490,'370284','370200','胶南市','山东省青岛市胶南市',NULL,NULL,'1',3),(1503,1490,'370285','370200','莱西市','山东省青岛市莱西市',NULL,NULL,'1',3),(1504,1477,'370300','370000','淄博市','山东省淄博市',NULL,NULL,'1',2),(1505,1504,'370301','370300','市辖区','山东省淄博市市辖区',NULL,NULL,'0',3),(1506,1504,'370302','370300','淄川区','山东省淄博市淄川区',NULL,NULL,'1',3),(1507,1504,'370303','370300','张店区','山东省淄博市张店区',NULL,NULL,'1',3),(1508,1504,'370304','370300','博山区','山东省淄博市博山区',NULL,NULL,'1',3),(1509,1504,'370305','370300','临淄区','山东省淄博市临淄区',NULL,NULL,'1',3),(1510,1504,'370306','370300','周村区','山东省淄博市周村区',NULL,NULL,'1',3),(1511,1504,'370321','370300','桓台县','山东省淄博市桓台县',NULL,NULL,'1',3),(1512,1504,'370322','370300','高青县','山东省淄博市高青县',NULL,NULL,'1',3),(1513,1504,'370323','370300','沂源县','山东省淄博市沂源县',NULL,NULL,'1',3),(1514,1477,'370400','370000','枣庄市','山东省枣庄市',NULL,NULL,'1',2),(1515,1514,'370401','370400','市辖区','山东省枣庄市市辖区',NULL,NULL,'0',3),(1516,1514,'370402','370400','市中区','山东省枣庄市市中区',NULL,NULL,'1',3),(1517,1514,'370403','370400','薛城区','山东省枣庄市薛城区',NULL,NULL,'1',3),(1518,1514,'370404','370400','峄城区','山东省枣庄市峄城区',NULL,NULL,'1',3),(1519,1514,'370405','370400','台儿庄区','山东省枣庄市台儿庄区',NULL,NULL,'1',3),(1520,1514,'370406','370400','山亭区','山东省枣庄市山亭区',NULL,NULL,'1',3),(1521,1514,'370481','370400','滕州市','山东省枣庄市滕州市',NULL,NULL,'1',3),(1522,1477,'370500','370000','东营市','山东省东营市',NULL,NULL,'1',2),(1523,1522,'370501','370500','市辖区','山东省东营市市辖区',NULL,NULL,'0',3),(1524,1522,'370502','370500','东营区','山东省东营市东营区',NULL,NULL,'1',3),(1525,1522,'370503','370500','河口区','山东省东营市河口区',NULL,NULL,'1',3),(1526,1522,'370521','370500','垦利县','山东省东营市垦利县',NULL,NULL,'1',3),(1527,1522,'370522','370500','利津县','山东省东营市利津县',NULL,NULL,'1',3),(1528,1522,'370523','370500','广饶县','山东省东营市广饶县',NULL,NULL,'1',3),(1529,1477,'370600','370000','烟台市','山东省烟台市',NULL,NULL,'1',2),(1530,1529,'370601','370600','市辖区','山东省烟台市市辖区',NULL,NULL,'0',3),(1531,1529,'370602','370600','芝罘区','山东省烟台市芝罘区',NULL,NULL,'1',3),(1532,1529,'370611','370600','福山区','山东省烟台市福山区',NULL,NULL,'1',3),(1533,1529,'370612','370600','牟平区','山东省烟台市牟平区',NULL,NULL,'1',3),(1534,1529,'370613','370600','莱山区','山东省烟台市莱山区',NULL,NULL,'1',3),(1535,1529,'370634','370600','长岛县','山东省烟台市长岛县',NULL,NULL,'1',3),(1536,1529,'370681','370600','龙口市','山东省烟台市龙口市',NULL,NULL,'1',3),(1537,1529,'370682','370600','莱阳市','山东省烟台市莱阳市',NULL,NULL,'1',3),(1538,1529,'370683','370600','莱州市','山东省烟台市莱州市',NULL,NULL,'1',3),(1539,1529,'370684','370600','蓬莱市','山东省烟台市蓬莱市',NULL,NULL,'1',3),(1540,1529,'370685','370600','招远市','山东省烟台市招远市',NULL,NULL,'1',3),(1541,1529,'370686','370600','栖霞市','山东省烟台市栖霞市',NULL,NULL,'1',3),(1542,1529,'370687','370600','海阳市','山东省烟台市海阳市',NULL,NULL,'1',3),(1543,1477,'370700','370000','潍坊市','山东省潍坊市',NULL,NULL,'1',2),(1544,1543,'370701','370700','市辖区','山东省潍坊市市辖区',NULL,NULL,'0',3),(1545,1543,'370702','370700','潍城区','山东省潍坊市潍城区',NULL,NULL,'1',3),(1546,1543,'370703','370700','寒亭区','山东省潍坊市寒亭区',NULL,NULL,'1',3),(1547,1543,'370704','370700','坊子区','山东省潍坊市坊子区',NULL,NULL,'1',3),(1548,1543,'370705','370700','奎文区','山东省潍坊市奎文区',NULL,NULL,'1',3),(1549,1543,'370724','370700','临朐县','山东省潍坊市临朐县',NULL,NULL,'1',3),(1550,1543,'370725','370700','昌乐县','山东省潍坊市昌乐县',NULL,NULL,'1',3),(1551,1543,'370781','370700','青州市','山东省潍坊市青州市',NULL,NULL,'1',3),(1552,1543,'370782','370700','诸城市','山东省潍坊市诸城市',NULL,NULL,'1',3),(1553,1543,'370783','370700','寿光市','山东省潍坊市寿光市',NULL,NULL,'1',3),(1554,1543,'370784','370700','安丘市','山东省潍坊市安丘市',NULL,NULL,'1',3),(1555,1543,'370785','370700','高密市','山东省潍坊市高密市',NULL,NULL,'1',3),(1556,1543,'370786','370700','昌邑市','山东省潍坊市昌邑市',NULL,NULL,'1',3),(1557,1477,'370800','370000','济宁市','山东省济宁市',NULL,NULL,'1',2),(1558,1557,'370801','370800','市辖区','山东省济宁市市辖区',NULL,NULL,'0',3),(1559,1557,'370802','370800','市中区','山东省济宁市市中区',NULL,NULL,'1',3),(1560,1557,'370811','370800','任城区','山东省济宁市任城区',NULL,NULL,'1',3),(1561,1557,'370826','370800','微山县','山东省济宁市微山县',NULL,NULL,'1',3),(1562,1557,'370827','370800','鱼台县','山东省济宁市鱼台县',NULL,NULL,'1',3),(1563,1557,'370828','370800','金乡县','山东省济宁市金乡县',NULL,NULL,'1',3),(1564,1557,'370829','370800','嘉祥县','山东省济宁市嘉祥县',NULL,NULL,'1',3),(1565,1557,'370830','370800','汶上县','山东省济宁市汶上县',NULL,NULL,'1',3),(1566,1557,'370831','370800','泗水县','山东省济宁市泗水县',NULL,NULL,'1',3),(1567,1557,'370832','370800','梁山县','山东省济宁市梁山县',NULL,NULL,'1',3),(1568,1557,'370881','370800','曲阜市','山东省济宁市曲阜市',NULL,NULL,'1',3),(1569,1557,'370882','370800','兖州市','山东省济宁市兖州市',NULL,NULL,'1',3),(1570,1557,'370883','370800','邹城市','山东省济宁市邹城市',NULL,NULL,'1',3),(1571,1477,'370900','370000','泰安市','山东省泰安市',NULL,NULL,'1',2),(1572,1571,'370901','370900','市辖区','山东省泰安市市辖区',NULL,NULL,'0',3),(1573,1571,'370902','370900','泰山区','山东省泰安市泰山区',NULL,NULL,'1',3),(1574,1571,'370911','370900','郊区','山东省泰安市郊区',NULL,NULL,'1',3),(1575,1571,'370921','370900','宁阳县','山东省泰安市宁阳县',NULL,NULL,'1',3),(1576,1571,'370923','370900','东平县','山东省泰安市东平县',NULL,NULL,'1',3),(1577,1571,'370982','370900','新泰市','山东省泰安市新泰市',NULL,NULL,'1',3),(1578,1571,'370983','370900','肥城市','山东省泰安市肥城市',NULL,NULL,'1',3),(1579,1477,'371000','370000','威海市','山东省威海市',NULL,NULL,'1',2),(1580,1579,'371001','371000','市辖区','山东省威海市市辖区',NULL,NULL,'0',3),(1581,1579,'371002','371000','环翠区','山东省威海市环翠区',NULL,NULL,'1',3),(1582,1579,'371081','371000','文登市','山东省威海市文登市',NULL,NULL,'1',3),(1583,1579,'371082','371000','荣成市','山东省威海市荣成市',NULL,NULL,'1',3),(1584,1579,'371083','371000','乳山市','山东省威海市乳山市',NULL,NULL,'1',3),(1585,1477,'371100','370000','日照市','山东省日照市',NULL,NULL,'1',2),(1586,1585,'371101','371100','市辖区','山东省日照市市辖区',NULL,NULL,'0',3),(1587,1585,'371102','371100','东港区','山东省日照市东港区',NULL,NULL,'1',3),(1588,1585,'371121','371100','五莲县','山东省日照市五莲县',NULL,NULL,'1',3),(1589,1585,'371122','371100','莒县','山东省日照市莒县',NULL,NULL,'1',3),(1590,1477,'371200','370000','莱芜市','山东省莱芜市',NULL,NULL,'1',2),(1591,1590,'371201','371200','市辖区','山东省莱芜市市辖区',NULL,NULL,'0',3),(1592,1590,'371202','371200','莱城区','山东省莱芜市莱城区',NULL,NULL,'1',3),(1593,1590,'371203','371200','钢城区','山东省莱芜市钢城区',NULL,NULL,'1',3),(1594,1477,'371300','370000','临沂市','山东省临沂市',NULL,NULL,'1',2),(1595,1594,'371301','371300','市辖区','山东省临沂市市辖区',NULL,NULL,'0',3),(1596,1594,'371302','371300','兰山区','山东省临沂市兰山区',NULL,NULL,'1',3),(1597,1594,'371311','371300','罗庄区','山东省临沂市罗庄区',NULL,NULL,'1',3),(1598,1594,'371312','371300','河东区','山东省临沂市河东区',NULL,NULL,'1',3),(1599,1594,'371321','371300','沂南县','山东省临沂市沂南县',NULL,NULL,'1',3),(1600,1594,'371322','371300','郯城县','山东省临沂市郯城县',NULL,NULL,'1',3),(1601,1594,'371323','371300','沂水县','山东省临沂市沂水县',NULL,NULL,'1',3),(1602,1594,'371324','371300','苍山县','山东省临沂市苍山县',NULL,NULL,'1',3),(1603,1594,'371325','371300','费县','山东省临沂市费县',NULL,NULL,'1',3),(1604,1594,'371326','371300','平邑县','山东省临沂市平邑县',NULL,NULL,'1',3),(1605,1594,'371327','371300','莒南县','山东省临沂市莒南县',NULL,NULL,'1',3),(1606,1594,'371328','371300','蒙阴县','山东省临沂市蒙阴县',NULL,NULL,'1',3),(1607,1594,'371329','371300','临沭县','山东省临沂市临沭县',NULL,NULL,'1',3),(1608,1477,'371400','370000','德州市','山东省德州市',NULL,NULL,'1',2),(1609,1608,'371401','371400','市辖区','山东省德州市市辖区',NULL,NULL,'0',3),(1610,1608,'371402','371400','德城区','山东省德州市德城区',NULL,NULL,'1',3),(1611,1608,'371421','371400','陵县','山东省德州市陵县',NULL,NULL,'1',3),(1612,1608,'371422','371400','宁津县','山东省德州市宁津县',NULL,NULL,'1',3),(1613,1608,'371423','371400','庆云县','山东省德州市庆云县',NULL,NULL,'1',3),(1614,1608,'371424','371400','临邑县','山东省德州市临邑县',NULL,NULL,'1',3),(1615,1608,'371425','371400','齐河县','山东省德州市齐河县',NULL,NULL,'1',3),(1616,1608,'371426','371400','平原县','山东省德州市平原县',NULL,NULL,'1',3),(1617,1608,'371427','371400','夏津县','山东省德州市夏津县',NULL,NULL,'1',3),(1618,1608,'371428','371400','武城县','山东省德州市武城县',NULL,NULL,'1',3),(1619,1608,'371481','371400','乐陵市','山东省德州市乐陵市',NULL,NULL,'1',3),(1620,1608,'371482','371400','禹城市','山东省德州市禹城市',NULL,NULL,'1',3),(1621,1477,'371500','370000','聊城市','山东省聊城市',NULL,NULL,'1',2),(1622,1621,'371501','371500','市辖区','山东省聊城市市辖区',NULL,NULL,'0',3),(1623,1621,'371502','371500','东昌府区','山东省聊城市东昌府区',NULL,NULL,'1',3),(1624,1621,'371521','371500','阳谷县','山东省聊城市阳谷县',NULL,NULL,'1',3),(1625,1621,'371522','371500','莘县','山东省聊城市莘县',NULL,NULL,'1',3),(1626,1621,'371523','371500','茌平县','山东省聊城市茌平县',NULL,NULL,'1',3),(1627,1621,'371524','371500','东阿县','山东省聊城市东阿县',NULL,NULL,'1',3),(1628,1621,'371525','371500','冠县','山东省聊城市冠县',NULL,NULL,'1',3),(1629,1621,'371526','371500','高唐县','山东省聊城市高唐县',NULL,NULL,'1',3),(1630,1621,'371581','371500','临清市','山东省聊城市临清市',NULL,NULL,'1',3),(1631,1477,'372300','370000','滨州地区','山东省滨州地区',NULL,NULL,'1',2),(1632,1631,'372301','372300','滨州市','山东省滨州地区滨州市',NULL,NULL,'1',3),(1633,1631,'372321','372300','惠民县','山东省滨州地区惠民县',NULL,NULL,'1',3),(1634,1631,'372323','372300','阳信县','山东省滨州地区阳信县',NULL,NULL,'1',3),(1635,1631,'372324','372300','无棣县','山东省滨州地区无棣县',NULL,NULL,'1',3),(1636,1631,'372325','372300','沾化县','山东省滨州地区沾化县',NULL,NULL,'1',3),(1637,1631,'372328','372300','博兴县','山东省滨州地区博兴县',NULL,NULL,'1',3),(1638,1631,'372330','372300','邹平县','山东省滨州地区邹平县',NULL,NULL,'1',3),(1639,1477,'372900','370000','菏泽地区','山东省菏泽地区',NULL,NULL,'1',2),(1640,1639,'372901','372900','菏泽市','山东省菏泽地区菏泽市',NULL,NULL,'1',3),(1641,1639,'372922','372900','曹县','山东省菏泽地区曹县',NULL,NULL,'1',3),(1642,1639,'372923','372900','定陶县','山东省菏泽地区定陶县',NULL,NULL,'1',3),(1643,1639,'372924','372900','成武县','山东省菏泽地区成武县',NULL,NULL,'1',3),(1644,1639,'372925','372900','单县','山东省菏泽地区单县',NULL,NULL,'1',3),(1645,1639,'372926','372900','巨野县','山东省菏泽地区巨野县',NULL,NULL,'1',3),(1646,1639,'372928','372900','郓城县','山东省菏泽地区郓城县',NULL,NULL,'1',3),(1647,1639,'372929','372900','鄄城县','山东省菏泽地区鄄城县',NULL,NULL,'1',3),(1648,1639,'372930','372900','东明县','山东省菏泽地区东明县',NULL,NULL,'1',3),(1649,1,'410000','86','河南省','河南省',NULL,NULL,'1',1),(1650,1649,'410100','410000','郑州市','河南省郑州市',NULL,NULL,'1',2),(1651,1650,'410101','410100','市辖区','河南省郑州市市辖区',NULL,NULL,'0',3),(1652,1650,'410102','410100','中原区','河南省郑州市中原区',NULL,NULL,'1',3),(1653,1650,'410103','410100','二七区','河南省郑州市二七区',NULL,NULL,'1',3),(1654,1650,'410104','410100','管城区','河南省郑州市管城回族区',NULL,NULL,'1',3),(1655,1650,'410105','410100','金水区','河南省郑州市金水区',NULL,NULL,'1',3),(1656,1650,'410106','410100','上街区','河南省郑州市上街区',NULL,NULL,'1',3),(1657,1650,'410108','410100','邙山区','河南省郑州市邙山区',NULL,NULL,'1',3),(1658,1650,'410122','410100','中牟县','河南省郑州市中牟县',NULL,NULL,'1',3),(1659,1650,'410181','410100','巩义市','河南省郑州市巩义市',NULL,NULL,'1',3),(1660,1650,'410182','410100','荥阳市','河南省郑州市荥阳市',NULL,NULL,'1',3),(1661,1650,'410183','410100','新密市','河南省郑州市新密市',NULL,NULL,'1',3),(1662,1650,'410184','410100','新郑市','河南省郑州市新郑市',NULL,NULL,'1',3),(1663,1650,'410185','410100','登封市','河南省郑州市登封市',NULL,NULL,'1',3),(1664,1649,'410200','410000','开封市','河南省开封市',NULL,NULL,'1',2),(1665,1664,'410201','410200','市辖区','河南省开封市市辖区',NULL,NULL,'0',3),(1666,1664,'410202','410200','龙亭区','河南省开封市龙亭区',NULL,NULL,'1',3),(1667,1664,'410203','410200','顺河区','河南省开封市顺河回族区',NULL,NULL,'1',3),(1668,1664,'410204','410200','鼓楼区','河南省开封市鼓楼区',NULL,NULL,'1',3),(1669,1664,'410205','410200','南关区','河南省开封市南关区',NULL,NULL,'1',3),(1670,1664,'410211','410200','郊区','河南省开封市郊区',NULL,NULL,'1',3),(1671,1664,'410221','410200','杞县','河南省开封市杞县',NULL,NULL,'1',3),(1672,1664,'410222','410200','通许县','河南省开封市通许县',NULL,NULL,'1',3),(1673,1664,'410223','410200','尉氏县','河南省开封市尉氏县',NULL,NULL,'1',3),(1674,1664,'410224','410200','开封县','河南省开封市开封县',NULL,NULL,'1',3),(1675,1664,'410225','410200','兰考县','河南省开封市兰考县',NULL,NULL,'1',3),(1676,1649,'410300','410000','洛阳市','河南省洛阳市',NULL,NULL,'1',2),(1677,1676,'410301','410300','市辖区','河南省洛阳市市辖区',NULL,NULL,'0',3),(1678,1676,'410302','410300','老城区','河南省洛阳市老城区',NULL,NULL,'1',3),(1679,1676,'410303','410300','西工区','河南省洛阳市西工区',NULL,NULL,'1',3),(1680,1676,'410304','410300','廛河区','河南省洛阳市廛河回族区',NULL,NULL,'1',3),(1681,1676,'410305','410300','涧西区','河南省洛阳市涧西区',NULL,NULL,'1',3),(1682,1676,'410306','410300','吉利区','河南省洛阳市吉利区',NULL,NULL,'1',3),(1683,1676,'410311','410300','郊区','河南省洛阳市郊区',NULL,NULL,'1',3),(1684,1676,'410322','410300','孟津县','河南省洛阳市孟津县',NULL,NULL,'1',3),(1685,1676,'410323','410300','新安县','河南省洛阳市新安县',NULL,NULL,'1',3),(1686,1676,'410324','410300','栾川县','河南省洛阳市栾川县',NULL,NULL,'1',3),(1687,1676,'410325','410300','嵩县','河南省洛阳市嵩县',NULL,NULL,'1',3),(1688,1676,'410326','410300','汝阳县','河南省洛阳市汝阳县',NULL,NULL,'1',3),(1689,1676,'410327','410300','宜阳县','河南省洛阳市宜阳县',NULL,NULL,'1',3),(1690,1676,'410328','410300','洛宁县','河南省洛阳市洛宁县',NULL,NULL,'1',3),(1691,1676,'410329','410300','伊川县','河南省洛阳市伊川县',NULL,NULL,'1',3),(1692,1676,'410381','410300','偃师市','河南省洛阳市偃师市',NULL,NULL,'1',3),(1693,1649,'410400','410000','平顶山市','河南省平顶山市',NULL,NULL,'1',2),(1694,1693,'410401','410400','市辖区','河南省平顶山市市辖区',NULL,NULL,'0',3),(1695,1693,'410402','410400','新华区','河南省平顶山市新华区',NULL,NULL,'1',3),(1696,1693,'410403','410400','卫东区','河南省平顶山市卫东区',NULL,NULL,'1',3),(1697,1693,'410404','410400','石龙区','河南省平顶山市石龙区',NULL,NULL,'1',3),(1698,1693,'410411','410400','湛河区','河南省平顶山市湛河区',NULL,NULL,'1',3),(1699,1693,'410421','410400','宝丰县','河南省平顶山市宝丰县',NULL,NULL,'1',3),(1700,1693,'410422','410400','叶县','河南省平顶山市叶县',NULL,NULL,'1',3),(1701,1693,'410423','410400','鲁山县','河南省平顶山市鲁山县',NULL,NULL,'1',3),(1702,1693,'410425','410400','郏县','河南省平顶山市郏县',NULL,NULL,'1',3),(1703,1693,'410481','410400','舞钢市','河南省平顶山市舞钢市',NULL,NULL,'1',3),(1704,1693,'410482','410400','汝州市','河南省平顶山市汝州市',NULL,NULL,'1',3),(1705,1649,'410500','410000','安阳市','河南省安阳市',NULL,NULL,'1',2),(1706,1705,'410501','410500','市辖区','河南省安阳市市辖区',NULL,NULL,'0',3),(1707,1705,'410502','410500','文峰区','河南省安阳市文峰区',NULL,NULL,'1',3),(1708,1705,'410503','410500','北关区','河南省安阳市北关区',NULL,NULL,'1',3),(1709,1705,'410504','410500','铁西区','河南省安阳市铁西区',NULL,NULL,'1',3),(1710,1705,'410511','410500','郊区','河南省安阳市郊区',NULL,NULL,'1',3),(1711,1705,'410522','410500','安阳县','河南省安阳市安阳县',NULL,NULL,'1',3),(1712,1705,'410523','410500','汤阴县','河南省安阳市汤阴县',NULL,NULL,'1',3),(1713,1705,'410526','410500','滑县','河南省安阳市滑县',NULL,NULL,'1',3),(1714,1705,'410527','410500','内黄县','河南省安阳市内黄县',NULL,NULL,'1',3),(1715,1705,'410581','410500','林州市','河南省安阳市林州市',NULL,NULL,'1',3),(1716,1649,'410600','410000','鹤壁市','河南省鹤壁市',NULL,NULL,'1',2),(1717,1716,'410601','410600','市辖区','河南省鹤壁市市辖区',NULL,NULL,'0',3),(1718,1716,'410602','410600','鹤山区','河南省鹤壁市鹤山区',NULL,NULL,'1',3),(1719,1716,'410603','410600','山城区','河南省鹤壁市山城区',NULL,NULL,'1',3),(1720,1716,'410611','410600','郊区','河南省鹤壁市郊区',NULL,NULL,'1',3),(1721,1716,'410621','410600','浚县','河南省鹤壁市浚县',NULL,NULL,'1',3),(1722,1716,'410622','410600','淇县','河南省鹤壁市淇县',NULL,NULL,'1',3),(1723,1649,'410700','410000','新乡市','河南省新乡市',NULL,NULL,'1',2),(1724,1723,'410701','410700','市辖区','河南省新乡市市辖区',NULL,NULL,'0',3),(1725,1723,'410702','410700','红旗区','河南省新乡市红旗区',NULL,NULL,'1',3),(1726,1723,'410703','410700','新华区','河南省新乡市新华区',NULL,NULL,'1',3),(1727,1723,'410704','410700','北站区','河南省新乡市北站区',NULL,NULL,'1',3),(1728,1723,'410711','410700','郊区','河南省新乡市郊区',NULL,NULL,'1',3),(1729,1723,'410721','410700','新乡县','河南省新乡市新乡县',NULL,NULL,'1',3),(1730,1723,'410724','410700','获嘉县','河南省新乡市获嘉县',NULL,NULL,'1',3),(1731,1723,'410725','410700','原阳县','河南省新乡市原阳县',NULL,NULL,'1',3),(1732,1723,'410726','410700','延津县','河南省新乡市延津县',NULL,NULL,'1',3),(1733,1723,'410727','410700','封丘县','河南省新乡市封丘县',NULL,NULL,'1',3),(1734,1723,'410728','410700','长垣县','河南省新乡市长垣县',NULL,NULL,'1',3),(1735,1723,'410781','410700','卫辉市','河南省新乡市卫辉市',NULL,NULL,'1',3),(1736,1723,'410782','410700','辉县市','河南省新乡市辉县市',NULL,NULL,'1',3),(1737,1649,'410800','410000','焦作市','河南省焦作市',NULL,NULL,'1',2),(1738,1737,'410801','410800','市辖区','河南省焦作市市辖区',NULL,NULL,'0',3),(1739,1737,'410802','410800','解放区','河南省焦作市解放区',NULL,NULL,'1',3),(1740,1737,'410803','410800','中站区','河南省焦作市中站区',NULL,NULL,'1',3),(1741,1737,'410804','410800','马村区','河南省焦作市马村区',NULL,NULL,'1',3),(1742,1737,'410811','410800','山阳区','河南省焦作市山阳区',NULL,NULL,'1',3),(1743,1737,'410821','410800','修武县','河南省焦作市修武县',NULL,NULL,'1',3),(1744,1737,'410822','410800','博爱县','河南省焦作市博爱县',NULL,NULL,'1',3),(1745,1737,'410823','410800','武陟县','河南省焦作市武陟县',NULL,NULL,'1',3),(1746,1737,'410825','410800','温县','河南省焦作市温县',NULL,NULL,'1',3),(1747,1737,'410881','410800','济源市','河南省焦作市济源市',NULL,NULL,'1',3),(1748,1737,'410882','410800','沁阳市','河南省焦作市沁阳市',NULL,NULL,'1',3),(1749,1737,'410883','410800','孟州市','河南省焦作市孟州市',NULL,NULL,'1',3),(1750,1649,'410900','410000','濮阳市','河南省濮阳市',NULL,NULL,'1',2),(1751,1750,'410901','410900','市辖区','河南省濮阳市市辖区',NULL,NULL,'0',3),(1752,1750,'410902','410900','市区','河南省濮阳市市区',NULL,NULL,'1',3),(1753,1750,'410922','410900','清丰县','河南省濮阳市清丰县',NULL,NULL,'1',3),(1754,1750,'410923','410900','南乐县','河南省濮阳市南乐县',NULL,NULL,'1',3),(1755,1750,'410926','410900','范县','河南省濮阳市范县',NULL,NULL,'1',3),(1756,1750,'410927','410900','台前县','河南省濮阳市台前县',NULL,NULL,'1',3),(1757,1750,'410928','410900','濮阳县','河南省濮阳市濮阳县',NULL,NULL,'1',3),(1758,1649,'411000','410000','许昌市','河南省许昌市',NULL,NULL,'1',2),(1759,1758,'411001','411000','市辖区','河南省许昌市市辖区',NULL,NULL,'0',3),(1760,1758,'411002','411000','魏都区','河南省许昌市魏都区',NULL,NULL,'1',3),(1761,1758,'411023','411000','许昌县','河南省许昌市许昌县',NULL,NULL,'1',3),(1762,1758,'411024','411000','鄢陵县','河南省许昌市鄢陵县',NULL,NULL,'1',3),(1763,1758,'411025','411000','襄城县','河南省许昌市襄城县',NULL,NULL,'1',3),(1764,1758,'411081','411000','禹州市','河南省许昌市禹州市',NULL,NULL,'1',3),(1765,1758,'411082','411000','长葛市','河南省许昌市长葛市',NULL,NULL,'1',3),(1766,1649,'411100','410000','漯河市','河南省漯河市',NULL,NULL,'1',2),(1767,1766,'411101','411100','市辖区','河南省漯河市市辖区',NULL,NULL,'0',3),(1768,1766,'411102','411100','源汇区','河南省漯河市源汇区',NULL,NULL,'1',3),(1769,1766,'411121','411100','舞阳县','河南省漯河市舞阳县',NULL,NULL,'1',3),(1770,1766,'411122','411100','临颍县','河南省漯河市临颍县',NULL,NULL,'1',3),(1771,1766,'411123','411100','郾城县','河南省漯河市郾城县',NULL,NULL,'1',3),(1772,1649,'411200','410000','三门峡市','河南省三门峡市',NULL,NULL,'1',2),(1773,1772,'411201','411200','市辖区','河南省三门峡市市辖区',NULL,NULL,'0',3),(1774,1772,'411202','411200','湖滨区','河南省三门峡市湖滨区',NULL,NULL,'1',3),(1775,1772,'411221','411200','渑池县','河南省三门峡市渑池县',NULL,NULL,'1',3),(1776,1772,'411222','411200','陕县','河南省三门峡市陕县',NULL,NULL,'1',3),(1777,1772,'411224','411200','卢氏县','河南省三门峡市卢氏县',NULL,NULL,'1',3),(1778,1772,'411281','411200','义马市','河南省三门峡市义马市',NULL,NULL,'1',3),(1779,1772,'411282','411200','灵宝市','河南省三门峡市灵宝市',NULL,NULL,'1',3),(1780,1649,'411300','410000','南阳市','河南省南阳市',NULL,NULL,'1',2),(1781,1780,'411301','411300','市辖区','河南省南阳市市辖区',NULL,NULL,'0',3),(1782,1780,'411302','411300','宛城区','河南省南阳市宛城区',NULL,NULL,'1',3),(1783,1780,'411303','411300','卧龙区','河南省南阳市卧龙区',NULL,NULL,'1',3),(1784,1780,'411321','411300','南召县','河南省南阳市南召县',NULL,NULL,'1',3),(1785,1780,'411322','411300','方城县','河南省南阳市方城县',NULL,NULL,'1',3),(1786,1780,'411323','411300','西峡县','河南省南阳市西峡县',NULL,NULL,'1',3),(1787,1780,'411324','411300','镇平县','河南省南阳市镇平县',NULL,NULL,'1',3),(1788,1780,'411325','411300','内乡县','河南省南阳市内乡县',NULL,NULL,'1',3),(1789,1780,'411326','411300','淅川县','河南省南阳市淅川县',NULL,NULL,'1',3),(1790,1780,'411327','411300','社旗县','河南省南阳市社旗县',NULL,NULL,'1',3),(1791,1780,'411328','411300','唐河县','河南省南阳市唐河县',NULL,NULL,'1',3),(1792,1780,'411329','411300','新野县','河南省南阳市新野县',NULL,NULL,'1',3),(1793,1780,'411330','411300','桐柏县','河南省南阳市桐柏县',NULL,NULL,'1',3),(1794,1780,'411381','411300','邓州市','河南省南阳市邓州市',NULL,NULL,'1',3),(1795,1649,'411400','410000','商丘市','河南省商丘市',NULL,NULL,'1',2),(1796,1795,'411401','411400','市辖区','河南省商丘市市辖区',NULL,NULL,'0',3),(1797,1795,'411402','411400','梁园区','河南省商丘市梁园区',NULL,NULL,'1',3),(1798,1795,'411403','411400','睢阳区','河南省商丘市睢阳区',NULL,NULL,'1',3),(1799,1795,'411421','411400','民权县','河南省商丘市民权县',NULL,NULL,'1',3),(1800,1795,'411422','411400','睢县','河南省商丘市睢县',NULL,NULL,'1',3),(1801,1795,'411423','411400','宁陵县','河南省商丘市宁陵县',NULL,NULL,'1',3),(1802,1795,'411424','411400','柘城县','河南省商丘市柘城县',NULL,NULL,'1',3),(1803,1795,'411425','411400','虞城县','河南省商丘市虞城县',NULL,NULL,'1',3),(1804,1795,'411426','411400','夏邑县','河南省商丘市夏邑县',NULL,NULL,'1',3),(1805,1795,'411481','411400','永城市','河南省商丘市永城市',NULL,NULL,'1',3),(1806,1649,'411500','410000','信阳市','河南省信阳市',NULL,NULL,'1',2),(1807,1806,'411501','411500','市辖区','河南省信阳市市辖区',NULL,NULL,'0',3),(1808,1806,'411502','411500','师河区','河南省信阳市师河区',NULL,NULL,'1',3),(1809,1806,'411503','411500','平桥区','河南省信阳市平桥区',NULL,NULL,'1',3),(1810,1806,'411521','411500','罗山县','河南省信阳市罗山县',NULL,NULL,'1',3),(1811,1806,'411522','411500','光山县','河南省信阳市光山县',NULL,NULL,'1',3),(1812,1806,'411523','411500','新县','河南省信阳市新县',NULL,NULL,'1',3),(1813,1806,'411524','411500','商城县','河南省信阳市商城县',NULL,NULL,'1',3),(1814,1806,'411525','411500','固始县','河南省信阳市固始县',NULL,NULL,'1',3),(1815,1806,'411526','411500','潢川县','河南省信阳市潢川县',NULL,NULL,'1',3),(1816,1806,'411527','411500','淮滨县','河南省信阳市淮滨县',NULL,NULL,'1',3),(1817,1806,'411528','411500','息县','河南省信阳市息县',NULL,NULL,'1',3),(1818,1649,'412700','410000','周口地区','河南省周口地区',NULL,NULL,'1',2),(1819,1818,'412701','412700','周口市','河南省周口地区周口市',NULL,NULL,'1',3),(1820,1818,'412702','412700','项城市','河南省周口地区项城市',NULL,NULL,'1',3),(1821,1818,'412721','412700','扶沟县','河南省周口地区扶沟县',NULL,NULL,'1',3),(1822,1818,'412722','412700','西华县','河南省周口地区西华县',NULL,NULL,'1',3),(1823,1818,'412723','412700','商水县','河南省周口地区商水县',NULL,NULL,'1',3),(1824,1818,'412724','412700','太康县','河南省周口地区太康县',NULL,NULL,'1',3),(1825,1818,'412725','412700','鹿邑县','河南省周口地区鹿邑县',NULL,NULL,'1',3),(1826,1818,'412726','412700','郸城县','河南省周口地区郸城县',NULL,NULL,'1',3),(1827,1818,'412727','412700','淮阳县','河南省周口地区淮阳县',NULL,NULL,'1',3),(1828,1818,'412728','412700','沈丘县','河南省周口地区沈丘县',NULL,NULL,'1',3),(1829,1649,'412800','410000','驻马店地区','河南省驻马店地区',NULL,NULL,'1',2),(1830,1829,'412801','412800','驻马店市','河南省驻马店地区驻马店市',NULL,NULL,'1',3),(1831,1829,'412821','412800','确山县','河南省驻马店地区确山县',NULL,NULL,'1',3),(1832,1829,'412822','412800','泌阳县','河南省驻马店地区泌阳县',NULL,NULL,'1',3),(1833,1829,'412823','412800','遂平县','河南省驻马店地区遂平县',NULL,NULL,'1',3),(1834,1829,'412824','412800','西平县','河南省驻马店地区西平县',NULL,NULL,'1',3),(1835,1829,'412825','412800','上蔡县','河南省驻马店地区上蔡县',NULL,NULL,'1',3),(1836,1829,'412826','412800','汝南县','河南省驻马店地区汝南县',NULL,NULL,'1',3),(1837,1829,'412827','412800','平舆县','河南省驻马店地区平舆县',NULL,NULL,'1',3),(1838,1829,'412828','412800','新蔡县','河南省驻马店地区新蔡县',NULL,NULL,'1',3),(1839,1829,'412829','412800','正阳县','河南省驻马店地区正阳县',NULL,NULL,'1',3),(1840,1,'420000','86','湖北省','湖北省',NULL,NULL,'1',1),(1841,1840,'420100','420000','武汉市','湖北省武汉市',NULL,NULL,'1',2),(1842,1841,'420101','420100','市辖区','湖北省武汉市市辖区',NULL,NULL,'0',3),(1843,1841,'420102','420100','江岸区','湖北省武汉市江岸区',NULL,NULL,'1',3),(1844,1841,'420103','420100','江汉区','湖北省武汉市江汉区',NULL,NULL,'1',3),(1845,1841,'420104','420100','乔口区','湖北省武汉市乔口区',NULL,NULL,'1',3),(1846,1841,'420105','420100','汉阳区','湖北省武汉市汉阳区',NULL,NULL,'1',3),(1847,1841,'420106','420100','武昌区','湖北省武汉市武昌区',NULL,NULL,'1',3),(1848,1841,'420107','420100','青山区','湖北省武汉市青山区',NULL,NULL,'1',3),(1849,1841,'420111','420100','洪山区','湖北省武汉市洪山区',NULL,NULL,'1',3),(1850,1841,'420112','420100','东西湖区','湖北省武汉市东西湖区',NULL,NULL,'1',3),(1851,1841,'420113','420100','汉南区','湖北省武汉市汉南区',NULL,NULL,'1',3),(1852,1841,'420114','420100','蔡甸区','湖北省武汉市蔡甸区',NULL,NULL,'1',3),(1853,1841,'420115','420100','江夏区','湖北省武汉市江夏区',NULL,NULL,'1',3),(1854,1841,'420116','420100','黄陂区','湖北省武汉市黄陂区',NULL,NULL,'1',3),(1855,1841,'420117','420100','新洲区','湖北省武汉市新洲区',NULL,NULL,'1',3),(1856,1840,'420200','420000','黄石市','湖北省黄石市',NULL,NULL,'1',2),(1857,1856,'420201','420200','市辖区','湖北省黄石市市辖区',NULL,NULL,'0',3),(1858,1856,'420202','420200','黄石港区','湖北省黄石市黄石港区',NULL,NULL,'1',3),(1859,1856,'420203','420200','石灰窑区','湖北省黄石市石灰窑区',NULL,NULL,'1',3),(1860,1856,'420204','420200','下陆区','湖北省黄石市下陆区',NULL,NULL,'1',3),(1861,1856,'420205','420200','铁山区','湖北省黄石市铁山区',NULL,NULL,'1',3),(1862,1856,'420222','420200','阳新县','湖北省黄石市阳新县',NULL,NULL,'1',3),(1863,1856,'420281','420200','大冶市','湖北省黄石市大冶市',NULL,NULL,'1',3),(1864,1840,'420300','420000','十堰市','湖北省十堰市',NULL,NULL,'1',2),(1865,1864,'420301','420300','市辖区','湖北省十堰市市辖区',NULL,NULL,'0',3),(1866,1864,'420302','420300','茅箭区','湖北省十堰市茅箭区',NULL,NULL,'1',3),(1867,1864,'420303','420300','张湾区','湖北省十堰市张湾区',NULL,NULL,'1',3),(1868,1864,'420321','420300','郧县','湖北省十堰市郧县',NULL,NULL,'1',3),(1869,1864,'420322','420300','郧西县','湖北省十堰市郧西县',NULL,NULL,'1',3),(1870,1864,'420323','420300','竹山县','湖北省十堰市竹山县',NULL,NULL,'1',3),(1871,1864,'420324','420300','竹溪县','湖北省十堰市竹溪县',NULL,NULL,'1',3),(1872,1864,'420325','420300','房县','湖北省十堰市房县',NULL,NULL,'1',3),(1873,1864,'420381','420300','丹江口市','湖北省十堰市丹江口市',NULL,NULL,'1',3),(1874,1840,'420500','420000','宜昌市','湖北省宜昌市',NULL,NULL,'1',2),(1875,1874,'420501','420500','市辖区','湖北省宜昌市市辖区',NULL,NULL,'0',3),(1876,1874,'420502','420500','西陵区','湖北省宜昌市西陵区',NULL,NULL,'1',3),(1877,1874,'420503','420500','伍家岗区','湖北省宜昌市伍家岗区',NULL,NULL,'1',3),(1878,1874,'420504','420500','点军区','湖北省宜昌市点军区',NULL,NULL,'1',3),(1879,1874,'420505','420500','虎亭区','湖北省宜昌市虎亭区',NULL,NULL,'1',3),(1880,1874,'420521','420500','宜昌县','湖北省宜昌市宜昌县',NULL,NULL,'1',3),(1881,1874,'420525','420500','远安县','湖北省宜昌市远安县',NULL,NULL,'1',3),(1882,1874,'420526','420500','兴山县','湖北省宜昌市兴山县',NULL,NULL,'1',3),(1883,1874,'420527','420500','秭归县','湖北省宜昌市秭归县',NULL,NULL,'1',3),(1884,1874,'420528','420500','长阳县','湖北省宜昌市长阳土家族自治县',NULL,NULL,'1',3),(1885,1874,'420529','420500','五峰县','湖北省宜昌市五峰土家族自治县',NULL,NULL,'1',3),(1886,1874,'420581','420500','宜都市','湖北省宜昌市宜都市',NULL,NULL,'1',3),(1887,1874,'420582','420500','当阳市','湖北省宜昌市当阳市',NULL,NULL,'1',3),(1888,1874,'420583','420500','枝江市','湖北省宜昌市枝江市',NULL,NULL,'1',3),(1889,1840,'420600','420000','襄樊市','湖北省襄樊市',NULL,NULL,'1',2),(1890,1889,'420601','420600','市辖区','湖北省襄樊市市辖区',NULL,NULL,'0',3),(1891,1889,'420602','420600','襄城区','湖北省襄樊市襄城区',NULL,NULL,'1',3),(1892,1889,'420606','420600','樊城区','湖北省襄樊市樊城区',NULL,NULL,'1',3),(1893,1889,'420621','420600','襄阳县','湖北省襄樊市襄阳县',NULL,NULL,'1',3),(1894,1889,'420624','420600','南漳县','湖北省襄樊市南漳县',NULL,NULL,'1',3),(1895,1889,'420625','420600','谷城县','湖北省襄樊市谷城县',NULL,NULL,'1',3),(1896,1889,'420626','420600','保康县','湖北省襄樊市保康县',NULL,NULL,'1',3),(1897,1889,'420682','420600','老河口市','湖北省襄樊市老河口市',NULL,NULL,'1',3),(1898,1889,'420683','420600','枣阳市','湖北省襄樊市枣阳市',NULL,NULL,'1',3),(1899,1889,'420684','420600','宜城市','湖北省襄樊市宜城市',NULL,NULL,'1',3),(1900,1840,'420700','420000','鄂州市','湖北省鄂州市',NULL,NULL,'1',2),(1901,1900,'420701','420700','市辖区','湖北省鄂州市市辖区',NULL,NULL,'0',3),(1902,1900,'420702','420700','梁子湖区','湖北省鄂州市梁子湖区',NULL,NULL,'1',3),(1903,1900,'420703','420700','华容区','湖北省鄂州市华容区',NULL,NULL,'1',3),(1904,1900,'420704','420700','鄂城区','湖北省鄂州市鄂城区',NULL,NULL,'1',3),(1905,1840,'420800','420000','荆门市','湖北省荆门市',NULL,NULL,'1',2),(1906,1905,'420801','420800','市辖区','湖北省荆门市市辖区',NULL,NULL,'0',3),(1907,1905,'420802','420800','东宝区','湖北省荆门市东宝区',NULL,NULL,'1',3),(1908,1905,'420821','420800','京山县','湖北省荆门市京山县',NULL,NULL,'1',3),(1909,1905,'420822','420800','沙洋县','湖北省荆门市沙洋县',NULL,NULL,'1',3),(1910,1905,'420881','420800','钟祥市','湖北省荆门市钟祥市',NULL,NULL,'1',3),(1911,1840,'420900','420000','孝感市','湖北省孝感市',NULL,NULL,'1',2),(1912,1911,'420901','420900','市辖区','湖北省孝感市市辖区',NULL,NULL,'0',3),(1913,1911,'420902','420900','孝南区','湖北省孝感市孝南区',NULL,NULL,'1',3),(1914,1911,'420921','420900','孝昌县','湖北省孝感市孝昌县',NULL,NULL,'1',3),(1915,1911,'420922','420900','大悟县','湖北省孝感市大悟县',NULL,NULL,'1',3),(1916,1911,'420923','420900','云梦县','湖北省孝感市云梦县',NULL,NULL,'1',3),(1917,1911,'420981','420900','应城市','湖北省孝感市应城市',NULL,NULL,'1',3),(1918,1911,'420982','420900','安陆市','湖北省孝感市安陆市',NULL,NULL,'1',3),(1919,1911,'420983','420900','广水市','湖北省孝感市广水市',NULL,NULL,'1',3),(1920,1911,'420984','420900','汉川市','湖北省孝感市汉川市',NULL,NULL,'1',3),(1921,1840,'421000','420000','荆州市','湖北省荆州市',NULL,NULL,'1',2),(1922,1921,'421001','421000','市辖区','湖北省荆州市市辖区',NULL,NULL,'0',3),(1923,1921,'421002','421000','沙市区','湖北省荆州市沙市区',NULL,NULL,'1',3),(1924,1921,'421003','421000','荆州区','湖北省荆州市荆州区',NULL,NULL,'1',3),(1925,1921,'421022','421000','公安县','湖北省荆州市公安县',NULL,NULL,'1',3),(1926,1921,'421023','421000','监利县','湖北省荆州市监利县',NULL,NULL,'1',3),(1927,1921,'421024','421000','江陵县','湖北省荆州市江陵县',NULL,NULL,'1',3),(1928,1921,'421081','421000','石首市','湖北省荆州市石首市',NULL,NULL,'1',3),(1929,1921,'421083','421000','洪湖市','湖北省荆州市洪湖市',NULL,NULL,'1',3),(1930,1921,'421087','421000','松滋市','湖北省荆州市松滋市',NULL,NULL,'1',3),(1931,1840,'421100','420000','黄冈市','湖北省黄冈市',NULL,NULL,'1',2),(1932,1931,'421101','421100','市辖区','湖北省黄冈市市辖区',NULL,NULL,'0',3),(1933,1931,'421102','421100','黄州区','湖北省黄冈市黄州区',NULL,NULL,'1',3),(1934,1931,'421121','421100','团风县','湖北省黄冈市团风县',NULL,NULL,'1',3),(1935,1931,'421122','421100','红安县','湖北省黄冈市红安县',NULL,NULL,'1',3),(1936,1931,'421123','421100','罗田县','湖北省黄冈市罗田县',NULL,NULL,'1',3),(1937,1931,'421124','421100','英山县','湖北省黄冈市英山县',NULL,NULL,'1',3),(1938,1931,'421125','421100','浠水县','湖北省黄冈市浠水县',NULL,NULL,'1',3),(1939,1931,'421126','421100','蕲春县','湖北省黄冈市蕲春县',NULL,NULL,'1',3),(1940,1931,'421127','421100','黄梅县','湖北省黄冈市黄梅县',NULL,NULL,'1',3),(1941,1931,'421181','421100','麻城市','湖北省黄冈市麻城市',NULL,NULL,'1',3),(1942,1931,'421182','421100','武穴市','湖北省黄冈市武穴市',NULL,NULL,'1',3),(1943,1840,'421200','420000','咸宁市','湖北省咸宁市',NULL,NULL,'1',2),(1944,1943,'421201','421200','市辖区','湖北省咸宁市市辖区',NULL,NULL,'0',3),(1945,1943,'421202','421200','咸安区','湖北省咸宁市咸安区',NULL,NULL,'1',3),(1946,1943,'421221','421200','嘉鱼县','湖北省咸宁市嘉鱼县',NULL,NULL,'1',3),(1947,1943,'421222','421200','通城县','湖北省咸宁市通城县',NULL,NULL,'1',3),(1948,1943,'421223','421200','崇阳县','湖北省咸宁市崇阳县',NULL,NULL,'1',3),(1949,1943,'421224','421200','通山县','湖北省咸宁市通山县',NULL,NULL,'1',3),(1950,1840,'422800','420000','恩施市','湖北省施土家族苗族自治州',NULL,NULL,'1',2),(1951,1950,'422801','422800','恩施县','湖北省恩施土家族苗族自治州恩施县',NULL,NULL,'1',3),(1952,1950,'422802','422800','利川市','湖北省恩施土家族苗族自治州利川市',NULL,NULL,'1',3),(1953,1950,'422822','422800','建始县','湖北省恩施土家族苗族自治州建始县',NULL,NULL,'1',3),(1954,1950,'422823','422800','巴东县','湖北省恩施土家族苗族自治州巴东县',NULL,NULL,'1',3),(1955,1950,'422825','422800','宣恩县','湖北省恩施土家族苗族自治州宣恩县',NULL,NULL,'1',3),(1956,1950,'422826','422800','咸丰县','湖北省恩施土家族苗族自治州咸丰县',NULL,NULL,'1',3),(1957,1950,'422827','422800','来凤县','湖北省恩施土家族苗族自治州来凤县',NULL,NULL,'1',3),(1958,1950,'422828','422800','鹤峰县','湖北省恩施土家族苗族自治州鹤峰县',NULL,NULL,'1',3),(1959,1840,'429000','420000','省直辖县','湖北省省直辖县级行政单位',NULL,NULL,'1',2),(1960,1959,'429001','429000','随州市','湖北省随州市',NULL,NULL,'1',3),(1961,1959,'429004','429000','仙桃市','湖北省仙桃市',NULL,NULL,'1',3),(1962,1959,'429005','429000','潜江市','湖北省潜江市',NULL,NULL,'1',3),(1963,1959,'429006','429000','天门市','湖北省天门市',NULL,NULL,'1',3),(1964,1959,'429021','429000','神农架林区','湖北省神农架林区',NULL,NULL,'1',3),(1965,1,'430000','86','湖南省','湖南省',NULL,NULL,'1',1),(1966,1965,'430100','430000','长沙市','湖南省长沙市',NULL,NULL,'1',2),(1967,1966,'430101','430100','市辖区','湖南省长沙市市辖区',NULL,NULL,'0',3),(1968,1966,'430102','430100','芙蓉区','湖南省长沙市芙蓉区',NULL,NULL,'1',3),(1969,1966,'430103','430100','天心区','湖南省长沙市天心区',NULL,NULL,'1',3),(1970,1966,'430104','430100','岳麓区','湖南省长沙市岳麓区',NULL,NULL,'1',3),(1971,1966,'430105','430100','开福区','湖南省长沙市开福区',NULL,NULL,'1',3),(1972,1966,'430111','430100','雨花区','湖南省长沙市雨花区',NULL,NULL,'1',3),(1973,1966,'430121','430100','长沙县','湖南省长沙市长沙县',NULL,NULL,'1',3),(1974,1966,'430122','430100','望城县','湖南省长沙市望城县',NULL,NULL,'1',3),(1975,1966,'430124','430100','宁乡县','湖南省长沙市宁乡县',NULL,NULL,'1',3),(1976,1966,'430181','430100','浏阳市','湖南省长沙市浏阳市',NULL,NULL,'1',3),(1977,1965,'430200','430000','株洲市','湖南省株洲市',NULL,NULL,'1',2),(1978,1977,'430201','430200','市辖区','湖南省株洲市市辖区',NULL,NULL,'0',3),(1979,1977,'430202','430200','荷塘区','湖南省株洲市荷塘区',NULL,NULL,'1',3),(1980,1977,'430203','430200','芦淞区','湖南省株洲市芦淞区',NULL,NULL,'1',3),(1981,1977,'430204','430200','石峰区','湖南省株洲市石峰区',NULL,NULL,'1',3),(1982,1977,'430211','430200','天元区','湖南省株洲市天元区',NULL,NULL,'1',3),(1983,1977,'430221','430200','株洲县','湖南省株洲市株洲县',NULL,NULL,'1',3),(1984,1977,'430223','430200','攸县','湖南省株洲市攸县',NULL,NULL,'1',3),(1985,1977,'430224','430200','茶陵县','湖南省株洲市茶陵县',NULL,NULL,'1',3),(1986,1977,'430225','430200','炎陵县','湖南省株洲市炎陵县',NULL,NULL,'1',3),(1987,1977,'430281','430200','醴陵市','湖南省株洲市醴陵市',NULL,NULL,'1',3),(1988,1965,'430300','430000','湘潭市','湖南省湘潭市',NULL,NULL,'1',2),(1989,1988,'430301','430300','市辖区','湖南省湘潭市市辖区',NULL,NULL,'0',3),(1990,1988,'430302','430300','雨湖区','湖南省湘潭市雨湖区',NULL,NULL,'1',3),(1991,1988,'430304','430300','岳塘区','湖南省湘潭市岳塘区',NULL,NULL,'1',3),(1992,1988,'430321','430300','湘潭县','湖南省湘潭市湘潭县',NULL,NULL,'1',3),(1993,1988,'430381','430300','湘乡市','湖南省湘潭市湘乡市',NULL,NULL,'1',3),(1994,1988,'430382','430300','韶山市','湖南省湘潭市韶山市',NULL,NULL,'1',3),(1995,1965,'430400','430000','衡阳市','湖南省衡阳市',NULL,NULL,'1',2),(1996,1995,'430401','430400','市辖区','湖南省衡阳市市辖区',NULL,NULL,'0',3),(1997,1995,'430402','430400','江东区','湖南省衡阳市江东区',NULL,NULL,'1',3),(1998,1995,'430403','430400','城南区','湖南省衡阳市城南区',NULL,NULL,'1',3),(1999,1995,'430404','430400','城北区','湖南省衡阳市城北区',NULL,NULL,'1',3),(2000,1995,'430411','430400','郊区','湖南省衡阳市郊区',NULL,NULL,'1',3),(2001,1995,'430412','430400','南岳区','湖南省衡阳市南岳区',NULL,NULL,'1',3),(2002,1995,'430421','430400','衡阳县','湖南省衡阳市衡阳县',NULL,NULL,'1',3),(2003,1995,'430422','430400','衡南县','湖南省衡阳市衡南县',NULL,NULL,'1',3),(2004,1995,'430423','430400','衡山县','湖南省衡阳市衡山县',NULL,NULL,'1',3),(2005,1995,'430424','430400','衡东县','湖南省衡阳市衡东县',NULL,NULL,'1',3),(2006,1995,'430426','430400','祁东县','湖南省衡阳市祁东县',NULL,NULL,'1',3),(2007,1995,'430481','430400','耒阳市','湖南省衡阳市耒阳市',NULL,NULL,'1',3),(2008,1995,'430482','430400','常宁市','湖南省衡阳市常宁市',NULL,NULL,'1',3),(2009,1965,'430500','430000','邵阳市','湖南省邵阳市',NULL,NULL,'1',2),(2010,2009,'430501','430500','市辖区','湖南省邵阳市市辖区',NULL,NULL,'0',3),(2011,2009,'430502','430500','双清区','湖南省邵阳市双清区',NULL,NULL,'1',3),(2012,2009,'430503','430500','大祥区','湖南省邵阳市大祥区',NULL,NULL,'1',3),(2013,2009,'430511','430500','北塔区','湖南省邵阳市北塔区',NULL,NULL,'1',3),(2014,2009,'430521','430500','邵东县','湖南省邵阳市邵东县',NULL,NULL,'1',3),(2015,2009,'430522','430500','新邵县','湖南省邵阳市新邵县',NULL,NULL,'1',3),(2016,2009,'430523','430500','邵阳县','湖南省邵阳市邵阳县',NULL,NULL,'1',3),(2017,2009,'430524','430500','隆回县','湖南省邵阳市隆回县',NULL,NULL,'1',3),(2018,2009,'430525','430500','洞口县','湖南省邵阳市洞口县',NULL,NULL,'1',3),(2019,2009,'430527','430500','绥宁县','湖南省邵阳市绥宁县',NULL,NULL,'1',3),(2020,2009,'430528','430500','新宁县','湖南省邵阳市新宁县',NULL,NULL,'1',3),(2021,2009,'430529','430500','城步县','湖南省邵阳市城步苗族自治县',NULL,NULL,'1',3),(2022,2009,'430581','430500','武冈市','湖南省邵阳市武冈市',NULL,NULL,'1',3),(2023,1965,'430600','430000','岳阳市','湖南省岳阳市',NULL,NULL,'1',2),(2024,2023,'430601','430600','市辖区','湖南省岳阳市市辖区',NULL,NULL,'0',3),(2025,2023,'430602','430600','岳阳楼区','湖南省岳阳市岳阳楼区',NULL,NULL,'1',3),(2026,2023,'430603','430600','云溪区','湖南省岳阳市云溪区',NULL,NULL,'1',3),(2027,2023,'430611','430600','君山区','湖南省岳阳市君山区',NULL,NULL,'1',3),(2028,2023,'430621','430600','岳阳县','湖南省岳阳市岳阳县',NULL,NULL,'1',3),(2029,2023,'430623','430600','华容县','湖南省岳阳市华容县',NULL,NULL,'1',3),(2030,2023,'430624','430600','湘阴县','湖南省岳阳市湘阴县',NULL,NULL,'1',3),(2031,2023,'430626','430600','平江县','湖南省岳阳市平江县',NULL,NULL,'1',3),(2032,2023,'430681','430600','汨罗市','湖南省岳阳市汨罗市',NULL,NULL,'1',3),(2033,2023,'430682','430600','临湘市','湖南省岳阳市临湘市',NULL,NULL,'1',3),(2034,1965,'430700','430000','常德市','湖南省常德市',NULL,NULL,'1',2),(2035,2034,'430701','430700','市辖区','湖南省常德市市辖区',NULL,NULL,'0',3),(2036,2034,'430702','430700','武陵区','湖南省常德市武陵区',NULL,NULL,'1',3),(2037,2034,'430703','430700','鼎城区','湖南省常德市鼎城区',NULL,NULL,'1',3),(2038,2034,'430721','430700','安乡县','湖南省常德市安乡县',NULL,NULL,'1',3),(2039,2034,'430722','430700','汉寿县','湖南省常德市汉寿县',NULL,NULL,'1',3),(2040,2034,'430723','430700','澧县','湖南省常德市澧县',NULL,NULL,'1',3),(2041,2034,'430724','430700','临澧县','湖南省常德市临澧县',NULL,NULL,'1',3),(2042,2034,'430725','430700','桃源县','湖南省常德市桃源县',NULL,NULL,'1',3),(2043,2034,'430726','430700','石门县','湖南省常德市石门县',NULL,NULL,'1',3),(2044,2034,'430781','430700','津市市','湖南省常德市津市市',NULL,NULL,'1',3),(2045,1965,'430800','430000','张家界市','湖南省张家界市',NULL,NULL,'1',2),(2046,2045,'430801','430800','市辖区','湖南省张家界市市辖区',NULL,NULL,'0',3),(2047,2045,'430802','430800','永定区','湖南省张家界市永定区',NULL,NULL,'1',3),(2048,2045,'430811','430800','武陵源区','湖南省张家界市武陵源区',NULL,NULL,'1',3),(2049,2045,'430821','430800','慈利县','湖南省张家界市慈利县',NULL,NULL,'1',3),(2050,2045,'430822','430800','桑植县','湖南省张家界市桑植县',NULL,NULL,'1',3),(2051,1965,'430900','430000','益阳市','湖南省益阳市',NULL,NULL,'1',2),(2052,2051,'430901','430900','市辖区','湖南省益阳市市辖区',NULL,NULL,'0',3),(2053,2051,'430902','430900','资阳区','湖南省益阳市资阳区',NULL,NULL,'1',3),(2054,2051,'430903','430900','赫山区','湖南省益阳市赫山区',NULL,NULL,'1',3),(2055,2051,'430921','430900','南县','湖南省益阳市南县',NULL,NULL,'1',3),(2056,2051,'430922','430900','桃江县','湖南省益阳市桃江县',NULL,NULL,'1',3),(2057,2051,'430923','430900','安化县','湖南省益阳市安化县',NULL,NULL,'1',3),(2058,2051,'430981','430900','沅江市','湖南省益阳市沅江市',NULL,NULL,'1',3),(2059,1965,'431000','430000','郴州市','湖南省郴州市',NULL,NULL,'1',2),(2060,2059,'431001','431000','市辖区','湖南省郴州市市辖区',NULL,NULL,'0',3),(2061,2059,'431002','431000','北湖区','湖南省郴州市北湖区',NULL,NULL,'1',3),(2062,2059,'431003','431000','苏仙区','湖南省郴州市苏仙区',NULL,NULL,'1',3),(2063,2059,'431021','431000','桂阳县','湖南省郴州市桂阳县',NULL,NULL,'1',3),(2064,2059,'431022','431000','宜章县','湖南省郴州市宜章县',NULL,NULL,'1',3),(2065,2059,'431023','431000','永兴县','湖南省郴州市永兴县',NULL,NULL,'1',3),(2066,2059,'431024','431000','嘉禾县','湖南省郴州市嘉禾县',NULL,NULL,'1',3),(2067,2059,'431025','431000','临武县','湖南省郴州市临武县',NULL,NULL,'1',3),(2068,2059,'431026','431000','汝城县','湖南省郴州市汝城县',NULL,NULL,'1',3),(2069,2059,'431027','431000','桂东县','湖南省郴州市桂东县',NULL,NULL,'1',3),(2070,2059,'431028','431000','安仁县','湖南省郴州市安仁县',NULL,NULL,'1',3),(2071,2059,'431081','431000','资兴市','湖南省郴州市资兴市',NULL,NULL,'1',3),(2072,1965,'431100','430000','永州市','湖南省永州市',NULL,NULL,'1',2),(2073,2072,'431101','431100','市辖区','湖南省永州市市辖区',NULL,NULL,'0',3),(2074,2072,'431102','431100','芝山区','湖南省永州市芝山区',NULL,NULL,'1',3),(2075,2072,'431103','431100','冷水滩区','湖南省永州市冷水滩区',NULL,NULL,'1',3),(2076,2072,'431121','431100','祁阳县','湖南省永州市祁阳县',NULL,NULL,'1',3),(2077,2072,'431122','431100','东安县','湖南省永州市东安县',NULL,NULL,'1',3),(2078,2072,'431123','431100','双牌县','湖南省永州市双牌县',NULL,NULL,'1',3),(2079,2072,'431124','431100','道县','湖南省永州市道县',NULL,NULL,'1',3),(2080,2072,'431125','431100','江永县','湖南省永州市江永县',NULL,NULL,'1',3),(2081,2072,'431126','431100','宁远县','湖南省永州市宁远县',NULL,NULL,'1',3),(2082,2072,'431127','431100','蓝山县','湖南省永州市蓝山县',NULL,NULL,'1',3),(2083,2072,'431128','431100','新田县','湖南省永州市新田县',NULL,NULL,'1',3),(2084,2072,'431129','431100','江华县','湖南省永州市江华瑶族自治县',NULL,NULL,'1',3),(2085,1965,'431200','430000','怀化市','湖南省怀化市',NULL,NULL,'1',2),(2086,2085,'431201','431200','市辖区','湖南省怀化市市辖区',NULL,NULL,'0',3),(2087,2085,'431202','431200','鹤城区','湖南省怀化市鹤城区',NULL,NULL,'1',3),(2088,2085,'431221','431200','中方县','湖南省怀化市中方县',NULL,NULL,'1',3),(2089,2085,'431222','431200','沅陵县','湖南省怀化市沅陵县',NULL,NULL,'1',3),(2090,2085,'431223','431200','辰溪县','湖南省怀化市辰溪县',NULL,NULL,'1',3),(2091,2085,'431224','431200','溆浦县','湖南省怀化市溆浦县',NULL,NULL,'1',3),(2092,2085,'431225','431200','会同县','湖南省怀化市会同县',NULL,NULL,'1',3),(2093,2085,'431226','431200','麻阳县','湖南省怀化市麻阳苗族自治县',NULL,NULL,'1',3),(2094,2085,'431227','431200','新晃县','湖南省怀化市新晃侗族自治县',NULL,NULL,'1',3),(2095,2085,'431228','431200','芷江县','湖南省怀化市芷江侗族自治县',NULL,NULL,'1',3),(2096,2085,'431229','431200','靖州县','湖南省怀化市靖州苗族侗族自治县',NULL,NULL,'1',3),(2097,2085,'431230','431200','通道县','湖南省怀化市通道侗族自治县',NULL,NULL,'1',3),(2098,2085,'431281','431200','洪江市','湖南省怀化市洪江市',NULL,NULL,'1',3),(2099,1965,'432500','430000','娄底地区','湖南省娄底地区',NULL,NULL,'1',2),(2100,2099,'432501','432500','娄底市','湖南省娄底地区娄底市',NULL,NULL,'1',3),(2101,2099,'432502','432500','冷水江市','湖南省娄底地区冷水江市',NULL,NULL,'1',3),(2102,2099,'432503','432500','涟源市','湖南省娄底地区涟源市',NULL,NULL,'1',3),(2103,2099,'432522','432500','双峰县','湖南省娄底地区双峰县',NULL,NULL,'1',3),(2104,2099,'432524','432500','新化县','湖南省娄底地区新化县',NULL,NULL,'1',3),(2105,1965,'433100','430000','湘西','湖南省湘西土家族苗族自治州',NULL,NULL,'1',2),(2106,2105,'433101','433100','吉首市','湖南省湘西土家族苗族自治州吉首市',NULL,NULL,'1',3),(2107,2105,'433122','433100','泸溪县','湖南省湘西土家族苗族自治州泸溪县',NULL,NULL,'1',3),(2108,2105,'433123','433100','凤凰县','湖南省湘西土家族苗族自治州凤凰县',NULL,NULL,'1',3),(2109,2105,'433124','433100','花垣县','湖南省湘西土家族苗族自治州花垣县',NULL,NULL,'1',3),(2110,2105,'433125','433100','保靖县','湖南省湘西土家族苗族自治州保靖县',NULL,NULL,'1',3),(2111,2105,'433126','433100','古丈县','湖南省湘西土家族苗族自治州古丈县',NULL,NULL,'1',3),(2112,2105,'433127','433100','永顺县','湖南省湘西土家族苗族自治州永顺县',NULL,NULL,'1',3),(2113,2105,'433130','433100','龙山县','湖南省湘西土家族苗族自治州龙山县',NULL,NULL,'1',3),(2114,1,'440000','86','广东省','广东省',NULL,NULL,'1',1),(2115,2114,'440100','440000','广州市','广东省广州市',NULL,NULL,'1',2),(2116,2115,'440101','440100','市辖区','广东省广州市市辖区',NULL,NULL,'0',3),(2117,2115,'440102','440100','东山区','广东省广州市东山区',NULL,NULL,'1',3),(2118,2115,'440103','440100','荔湾区','广东省广州市荔湾区',NULL,NULL,'1',3),(2119,2115,'440104','440100','越秀区','广东省广州市越秀区',NULL,NULL,'1',3),(2120,2115,'440105','440100','海珠区','广东省广州市海珠区',NULL,NULL,'1',3),(2121,2115,'440106','440100','天河区','广东省广州市天河区',NULL,NULL,'1',3),(2122,2115,'440107','440100','芳村区','广东省广州市芳村区',NULL,NULL,'1',3),(2123,2115,'440111','440100','白云区','广东省广州市白云区',NULL,NULL,'1',3),(2124,2115,'440112','440100','黄埔区','广东省广州市黄埔区',NULL,NULL,'1',3),(2125,2115,'440181','440100','番禺市','广东省广州市番禺市',NULL,NULL,'1',3),(2126,2115,'440182','440100','花都市','广东省广州市花都市',NULL,NULL,'1',3),(2127,2115,'440183','440100','增城市','广东省广州市增城市',NULL,NULL,'1',3),(2128,2115,'440184','440100','从化市','广东省广州市从化市',NULL,NULL,'1',3),(2129,2114,'440200','440000','韶关市','广东省韶关市',NULL,NULL,'1',2),(2130,2129,'440201','440200','市辖区','广东省韶关市市辖区',NULL,NULL,'0',3),(2131,2129,'440202','440200','北江区','广东省韶关市北江区',NULL,NULL,'1',3),(2132,2129,'440203','440200','武江区','广东省韶关市武江区',NULL,NULL,'1',3),(2133,2129,'440204','440200','浈江区','广东省韶关市浈江区',NULL,NULL,'1',3),(2134,2129,'440221','440200','曲江县','广东省韶关市曲江县',NULL,NULL,'1',3),(2135,2129,'440222','440200','始兴县','广东省韶关市始兴县',NULL,NULL,'1',3),(2136,2129,'440224','440200','仁化县','广东省韶关市仁化县',NULL,NULL,'1',3),(2137,2129,'440229','440200','翁源县','广东省韶关市翁源县',NULL,NULL,'1',3),(2138,2129,'440232','440200','乳源县','广东省韶关市乳源瑶族自治县',NULL,NULL,'1',3),(2139,2129,'440233','440200','新丰县','广东省韶关市新丰县',NULL,NULL,'1',3),(2140,2129,'440281','440200','乐昌市','广东省韶关市乐昌市',NULL,NULL,'1',3),(2141,2129,'440282','440200','南雄市','广东省韶关市南雄市',NULL,NULL,'1',3),(2142,2114,'440300','440000','深圳市','广东省深圳市',NULL,NULL,'1',2),(2143,2142,'440301','440300','市辖区','广东省深圳市市辖区',NULL,NULL,'0',3),(2144,2142,'440303','440300','罗湖区','广东省深圳市罗湖区',NULL,NULL,'1',3),(2145,2142,'440304','440300','福田区','广东省深圳市福田区',NULL,NULL,'1',3),(2146,2142,'440305','440300','南山区','广东省深圳市南山区',NULL,NULL,'1',3),(2147,2142,'440306','440300','宝安区','广东省深圳市宝安区',NULL,NULL,'1',3),(2148,2142,'440307','440300','龙岗区','广东省深圳市龙岗区',NULL,NULL,'1',3),(2149,2142,'440308','440300','盐田区','广东省深圳市盐田区',NULL,NULL,'1',3),(2150,2114,'440400','440000','珠海市','广东省珠海市',NULL,NULL,'1',2),(2151,2150,'440401','440400','市辖区','广东省珠海市市辖区',NULL,NULL,'0',3),(2152,2150,'440402','440400','香洲区','广东省珠海市香洲区',NULL,NULL,'1',3),(2153,2150,'440421','440400','斗门县','广东省珠海市斗门县',NULL,NULL,'1',3),(2154,2114,'440500','440000','汕头市','广东省汕头市',NULL,NULL,'1',2),(2155,2154,'440501','440500','市辖区','广东省汕头市市辖区',NULL,NULL,'0',3),(2156,2154,'440506','440500','达濠区','广东省汕头市达濠区',NULL,NULL,'1',3),(2157,2154,'440507','440500','龙湖区','广东省汕头市龙湖区',NULL,NULL,'1',3),(2158,2154,'440508','440500','金园区','广东省汕头市金园区',NULL,NULL,'1',3),(2159,2154,'440509','440500','升平区','广东省汕头市升平区',NULL,NULL,'1',3),(2160,2154,'440510','440500','河浦区','广东省汕头市河浦区',NULL,NULL,'1',3),(2161,2154,'440523','440500','南澳县','广东省汕头市南澳县',NULL,NULL,'1',3),(2162,2154,'440582','440500','潮阳市','广东省汕头市潮阳市',NULL,NULL,'1',3),(2163,2154,'440583','440500','澄海市','广东省汕头市澄海市',NULL,NULL,'1',3),(2164,2114,'440600','440000','佛山市','广东省佛山市',NULL,NULL,'1',2),(2165,2164,'440601','440600','市辖区','广东省佛山市市辖区',NULL,NULL,'0',3),(2166,2164,'440602','440600','城区','广东省佛山市城区',NULL,NULL,'1',3),(2167,2164,'440603','440600','石湾区','广东省佛山市石湾区',NULL,NULL,'1',3),(2168,2164,'440681','440600','顺德市','广东省佛山市顺德市',NULL,NULL,'1',3),(2169,2164,'440682','440600','南海市','广东省佛山市南海市',NULL,NULL,'1',3),(2170,2164,'440683','440600','三水市','广东省佛山市三水市',NULL,NULL,'1',3),(2171,2164,'440684','440600','高明市','广东省佛山市高明市',NULL,NULL,'1',3),(2172,2114,'440700','440000','江门市','广东省江门市',NULL,NULL,'1',2),(2173,2172,'440701','440700','市辖区','广东省江门市市辖区',NULL,NULL,'0',3),(2174,2172,'440703','440700','蓬江区','广东省江门市蓬江区',NULL,NULL,'1',3),(2175,2172,'440704','440700','江海区','广东省江门市江海区',NULL,NULL,'1',3),(2176,2172,'440781','440700','台山市','广东省江门市台山市',NULL,NULL,'1',3),(2177,2172,'440782','440700','新会市','广东省江门市新会市',NULL,NULL,'1',3),(2178,2172,'440783','440700','开平市','广东省江门市开平市',NULL,NULL,'1',3),(2179,2172,'440784','440700','鹤山市','广东省江门市鹤山市',NULL,NULL,'1',3),(2180,2172,'440785','440700','恩平市','广东省江门市恩平市',NULL,NULL,'1',3),(2181,2114,'440800','440000','湛江市','广东省湛江市',NULL,NULL,'1',2),(2182,2181,'440801','440800','市辖区','广东省湛江市市辖区',NULL,NULL,'0',3),(2183,2181,'440802','440800','赤坎区','广东省湛江市赤坎区',NULL,NULL,'1',3),(2184,2181,'440803','440800','霞山区','广东省湛江市霞山区',NULL,NULL,'1',3),(2185,2181,'440804','440800','坡头区','广东省湛江市坡头区',NULL,NULL,'1',3),(2186,2181,'440811','440800','麻章区','广东省湛江市麻章区',NULL,NULL,'1',3),(2187,2181,'440823','440800','遂溪县','广东省湛江市遂溪县',NULL,NULL,'1',3),(2188,2181,'440825','440800','徐闻县','广东省湛江市徐闻县',NULL,NULL,'1',3),(2189,2181,'440881','440800','廉江市','广东省湛江市廉江市',NULL,NULL,'1',3),(2190,2181,'440882','440800','雷州市','广东省湛江市雷州市',NULL,NULL,'1',3),(2191,2181,'440883','440800','吴川市','广东省湛江市吴川市',NULL,NULL,'1',3),(2192,2114,'440900','440000','茂名市','广东省茂名市',NULL,NULL,'1',2),(2193,2192,'440901','440900','市辖区','广东省茂名市市辖区',NULL,NULL,'0',3),(2194,2192,'440902','440900','茂南区','广东省茂名市茂南区',NULL,NULL,'1',3),(2195,2192,'440923','440900','电白县','广东省茂名市电白县',NULL,NULL,'1',3),(2196,2192,'440981','440900','高州市','广东省茂名市高州市',NULL,NULL,'1',3),(2197,2192,'440982','440900','化州市','广东省茂名市化州市',NULL,NULL,'1',3),(2198,2192,'440983','440900','信宜市','广东省茂名市信宜市',NULL,NULL,'1',3),(2199,2114,'441200','440000','肇庆市','广东省肇庆市',NULL,NULL,'1',2),(2200,2199,'441201','441200','市辖区','广东省肇庆市市辖区',NULL,NULL,'0',3),(2201,2199,'441202','441200','端州区','广东省肇庆市端州区',NULL,NULL,'1',3),(2202,2199,'441203','441200','鼎湖区','广东省肇庆市鼎湖区',NULL,NULL,'1',3),(2203,2199,'441223','441200','广宁县','广东省肇庆市广宁县',NULL,NULL,'1',3),(2204,2199,'441224','441200','怀集县','广东省肇庆市怀集县',NULL,NULL,'1',3),(2205,2199,'441225','441200','封开县','广东省肇庆市封开县',NULL,NULL,'1',3),(2206,2199,'441226','441200','德庆县','广东省肇庆市德庆县',NULL,NULL,'1',3),(2207,2199,'441283','441200','高要市','广东省肇庆市高要市',NULL,NULL,'1',3),(2208,2199,'441284','441200','四会市','广东省肇庆市四会市',NULL,NULL,'1',3),(2209,2114,'441300','440000','惠州市','广东省惠州市',NULL,NULL,'1',2),(2210,2209,'441301','441300','市辖区','广东省惠州市市辖区',NULL,NULL,'0',3),(2211,2209,'441302','441300','惠城区','广东省惠州市惠城区',NULL,NULL,'1',3),(2212,2209,'441322','441300','博罗县','广东省惠州市博罗县',NULL,NULL,'1',3),(2213,2209,'441323','441300','惠东县','广东省惠州市惠东县',NULL,NULL,'1',3),(2214,2209,'441324','441300','龙门县','广东省惠州市龙门县',NULL,NULL,'1',3),(2215,2209,'441381','441300','惠阳市','广东省惠州市惠阳市',NULL,NULL,'1',3),(2216,2114,'441400','440000','梅州市','广东省梅州市',NULL,NULL,'1',2),(2217,2216,'441401','441400','市辖区','广东省梅州市市辖区',NULL,NULL,'0',3),(2218,2216,'441402','441400','梅江区','广东省梅州市梅江区',NULL,NULL,'1',3),(2219,2216,'441421','441400','梅县','广东省梅州市梅县',NULL,NULL,'1',3),(2220,2216,'441422','441400','大埔县','广东省梅州市大埔县',NULL,NULL,'1',3),(2221,2216,'441423','441400','丰顺县','广东省梅州市丰顺县',NULL,NULL,'1',3),(2222,2216,'441424','441400','五华县','广东省梅州市五华县',NULL,NULL,'1',3),(2223,2216,'441426','441400','平远县','广东省梅州市平远县',NULL,NULL,'1',3),(2224,2216,'441427','441400','蕉岭县','广东省梅州市蕉岭县',NULL,NULL,'1',3),(2225,2216,'441481','441400','兴宁市','广东省梅州市兴宁市',NULL,NULL,'1',3),(2226,2114,'441500','440000','汕尾市','广东省汕尾市',NULL,NULL,'1',2),(2227,2226,'441501','441500','市辖区','广东省汕尾市市辖区',NULL,NULL,'0',3),(2228,2226,'441502','441500','城区','广东省汕尾市城区',NULL,NULL,'1',3),(2229,2226,'441521','441500','海丰县','广东省汕尾市海丰县',NULL,NULL,'1',3),(2230,2226,'441523','441500','陆河县','广东省汕尾市陆河县',NULL,NULL,'1',3),(2231,2226,'441581','441500','陆丰市','广东省汕尾市陆丰市',NULL,NULL,'1',3),(2232,2114,'441600','440000','河源市','广东省河源市',NULL,NULL,'1',2),(2233,2232,'441601','441600','市辖区','广东省河源市市辖区',NULL,NULL,'0',3),(2234,2232,'441602','441600','源城区','广东省河源市源城区',NULL,NULL,'1',3),(2235,2232,'441621','441600','紫金县','广东省河源市紫金县',NULL,NULL,'1',3),(2236,2232,'441622','441600','龙川县','广东省河源市龙川县',NULL,NULL,'1',3),(2237,2232,'441623','441600','连平县','广东省河源市连平县',NULL,NULL,'1',3),(2238,2232,'441624','441600','和平县','广东省河源市和平县',NULL,NULL,'1',3),(2239,2232,'441625','441600','东源县','广东省河源市东源县',NULL,NULL,'1',3),(2240,2114,'441700','440000','阳江市','广东省阳江市',NULL,NULL,'1',2),(2241,2240,'441701','441700','市辖区','广东省阳江市市辖区',NULL,NULL,'0',3),(2242,2240,'441702','441700','江城区','广东省阳江市江城区',NULL,NULL,'1',3),(2243,2240,'441721','441700','阳西县','广东省阳江市阳西县',NULL,NULL,'1',3),(2244,2240,'441723','441700','阳东县','广东省阳江市阳东县',NULL,NULL,'1',3),(2245,2240,'441781','441700','阳春市','广东省阳江市阳春市',NULL,NULL,'1',3),(2246,2114,'441800','440000','清远市','广东省清远市',NULL,NULL,'1',2),(2247,2246,'441801','441800','市辖区','广东省清远市市辖区',NULL,NULL,'0',3),(2248,2246,'441802','441800','清城区','广东省清远市清城区',NULL,NULL,'1',3),(2249,2246,'441821','441800','佛冈县','广东省清远市佛冈县',NULL,NULL,'1',3),(2250,2246,'441823','441800','阳山县','广东省清远市阳山县',NULL,NULL,'1',3),(2251,2246,'441825','441800','连山县','广东省清远市连山壮族瑶族自治县',NULL,NULL,'1',3),(2252,2246,'441826','441800','连南县','广东省清远市连南瑶族自治县',NULL,NULL,'1',3),(2253,2246,'441827','441800','清新县','广东省清远市清新县',NULL,NULL,'1',3),(2254,2246,'441881','441800','英德市','广东省清远市英德市',NULL,NULL,'1',3),(2255,2246,'441882','441800','连州市','广东省清远市连州市',NULL,NULL,'1',3),(2256,2114,'441900','440000','东莞市','广东省东莞市',NULL,NULL,'1',2),(2257,2256,'441901','441900','市辖区','广东省东莞市市辖区',NULL,NULL,'0',3),(2258,2114,'442000','440000','中山市','广东省中山市',NULL,NULL,'1',2),(2259,2258,'442001','442000','市辖区','广东省中山市市辖区',NULL,NULL,'0',3),(2260,2114,'445100','440000','潮州市','广东省潮州市',NULL,NULL,'1',2),(2261,2260,'445101','445100','市辖区','广东省潮州市市辖区',NULL,NULL,'0',3),(2262,2260,'445102','445100','湘桥区','广东省潮州市湘桥区',NULL,NULL,'1',3),(2263,2260,'445121','445100','潮安县','广东省潮州市潮安县',NULL,NULL,'1',3),(2264,2260,'445122','445100','饶平县','广东省潮州市饶平县',NULL,NULL,'1',3),(2265,2114,'445200','440000','揭阳市','广东省揭阳市',NULL,NULL,'1',2),(2266,2265,'445201','445200','市辖区','广东省揭阳市市辖区',NULL,NULL,'0',3),(2267,2265,'445202','445200','榕城区','广东省揭阳市榕城区',NULL,NULL,'1',3),(2268,2265,'445221','445200','揭东县','广东省揭阳市揭东县',NULL,NULL,'1',3),(2269,2265,'445222','445200','揭西县','广东省揭阳市揭西县',NULL,NULL,'1',3),(2270,2265,'445224','445200','惠来县','广东省揭阳市惠来县',NULL,NULL,'1',3),(2271,2265,'445281','445200','普宁市','广东省揭阳市普宁市',NULL,NULL,'1',3),(2272,2114,'445300','440000','云浮市','广东省云浮市',NULL,NULL,'1',2),(2273,2272,'445301','445300','市辖区','广东省云浮市市辖区',NULL,NULL,'0',3),(2274,2272,'445302','445300','云城区','广东省云浮市云城区',NULL,NULL,'1',3),(2275,2272,'445321','445300','新兴县','广东省云浮市新兴县',NULL,NULL,'1',3),(2276,2272,'445322','445300','郁南县','广东省云浮市郁南县',NULL,NULL,'1',3),(2277,2272,'445323','445300','云安县','广东省云浮市云安县',NULL,NULL,'1',3),(2278,2272,'445381','445300','罗定市','广东省云浮市罗定市',NULL,NULL,'1',3),(2279,1,'450000','86','广西','广西壮族自治区',NULL,NULL,'1',1),(2280,2279,'450100','450000','南宁市','广西壮族自治区南宁市',NULL,NULL,'1',2),(2281,2280,'450101','450100','市辖区','广西壮族自治区南宁市市辖区',NULL,NULL,'0',3),(2282,2280,'450102','450100','兴宁区','广西壮族自治区南宁市兴宁区',NULL,NULL,'1',3),(2283,2280,'450103','450100','新城区','广西壮族自治区南宁市新城区',NULL,NULL,'1',3),(2284,2280,'450104','450100','城北区','广西壮族自治区南宁市城北区',NULL,NULL,'1',3),(2285,2280,'450105','450100','江南区','广西壮族自治区南宁市江南区',NULL,NULL,'1',3),(2286,2280,'450106','450100','永新区','广西壮族自治区南宁市永新区',NULL,NULL,'1',3),(2287,2280,'450111','450100','市郊区','广西壮族自治区南宁市市郊区',NULL,NULL,'1',3),(2288,2280,'450121','450100','邕宁县','广西壮族自治区南宁市邕宁县',NULL,NULL,'1',3),(2289,2280,'450122','450100','武鸣县','广西壮族自治区南宁市武鸣县',NULL,NULL,'1',3),(2290,2279,'450200','450000','柳州市','广西壮族自治区柳州市',NULL,NULL,'1',2),(2291,2290,'450201','450200','市辖区','广西壮族自治区柳州市市辖区',NULL,NULL,'0',3),(2292,2290,'450202','450200','城中区','广西壮族自治区柳州市城中区',NULL,NULL,'1',3),(2293,2290,'450203','450200','鱼峰区','广西壮族自治区柳州市鱼峰区',NULL,NULL,'1',3),(2294,2290,'450204','450200','柳南区','广西壮族自治区柳州市柳南区',NULL,NULL,'1',3),(2295,2290,'450205','450200','柳北区','广西壮族自治区柳州市柳北区',NULL,NULL,'1',3),(2296,2290,'450211','450200','市郊区','广西壮族自治区柳州市市郊区',NULL,NULL,'1',3),(2297,2290,'450221','450200','柳江县','广西壮族自治区柳州市柳江县',NULL,NULL,'1',3),(2298,2290,'450222','450200','柳城县','广西壮族自治区柳州市柳城县',NULL,NULL,'1',3),(2299,2279,'450300','450000','桂林市','广西壮族自治区桂林市',NULL,NULL,'1',2),(2300,2299,'450301','450300','市辖区','广西壮族自治区桂林市市辖区',NULL,NULL,'0',3),(2301,2299,'450302','450300','秀峰区','广西壮族自治区桂林市秀峰区',NULL,NULL,'1',3),(2302,2299,'450303','450300','叠彩区','广西壮族自治区桂林市叠彩区',NULL,NULL,'1',3),(2303,2299,'450304','450300','象山区','广西壮族自治区桂林市象山区',NULL,NULL,'1',3),(2304,2299,'450305','450300','七星区','广西壮族自治区桂林市七星区',NULL,NULL,'1',3),(2305,2299,'450311','450300','雁山区','广西壮族自治区桂林市雁山区',NULL,NULL,'1',3),(2306,2299,'450321','450300','阳朔县','广西壮族自治区桂林市阳朔县',NULL,NULL,'1',3),(2307,2299,'450322','450300','临桂县','广西壮族自治区桂林市临桂县',NULL,NULL,'1',3),(2308,2299,'450323','450300','灵川县','广西壮族自治区桂林市灵川县',NULL,NULL,'1',3),(2309,2299,'450324','450300','全州县','广西壮族自治区桂林市全州县',NULL,NULL,'1',3),(2310,2299,'450325','450300','兴安县','广西壮族自治区桂林市兴安县',NULL,NULL,'1',3),(2311,2299,'450326','450300','永福县','广西壮族自治区桂林市永福县',NULL,NULL,'1',3),(2312,2299,'450327','450300','灌阳县','广西壮族自治区桂林市灌阳县',NULL,NULL,'1',3),(2313,2299,'450328','450300','龙胜县','广西壮族自治区桂林市龙胜各族自治县',NULL,NULL,'1',3),(2314,2299,'450329','450300','资源县','广西壮族自治区桂林市资源县',NULL,NULL,'1',3),(2315,2299,'450330','450300','平乐县','广西壮族自治区桂林市平乐县',NULL,NULL,'1',3),(2316,2299,'450331','450300','荔浦县','广西壮族自治区桂林市荔浦县',NULL,NULL,'1',3),(2317,2299,'450332','450300','恭城县','广西壮族自治区桂林市恭城瑶族自治县',NULL,NULL,'1',3),(2318,2279,'450400','450000','梧州市','广西壮族自治区梧州市',NULL,NULL,'1',2),(2319,2318,'450401','450400','市辖区','广西壮族自治区梧州市市辖区',NULL,NULL,'0',3),(2320,2318,'450403','450400','万秀区','广西壮族自治区梧州市万秀区',NULL,NULL,'1',3),(2321,2318,'450404','450400','蝶山区','广西壮族自治区梧州市蝶山区',NULL,NULL,'1',3),(2322,2318,'450411','450400','市郊区','广西壮族自治区梧州市市郊区',NULL,NULL,'1',3),(2323,2318,'450421','450400','苍梧县','广西壮族自治区梧州市苍梧县',NULL,NULL,'1',3),(2324,2318,'450422','450400','藤县','广西壮族自治区梧州市藤县',NULL,NULL,'1',3),(2325,2318,'450423','450400','蒙山县','广西壮族自治区梧州市蒙山县',NULL,NULL,'1',3),(2326,2318,'450481','450400','岑溪市','广西壮族自治区梧州市岑溪市',NULL,NULL,'1',3),(2327,2279,'450500','450000','北海市','广西壮族自治区北海市',NULL,NULL,'1',2),(2328,2327,'450501','450500','市辖区','广西壮族自治区北海市市辖区',NULL,NULL,'0',3),(2329,2327,'450502','450500','海城区','广西壮族自治区北海市海城区',NULL,NULL,'1',3),(2330,2327,'450503','450500','银海区','广西壮族自治区北海市银海区',NULL,NULL,'1',3),(2331,2327,'450512','450500','铁山港区','广西壮族自治区北海市铁山港区',NULL,NULL,'1',3),(2332,2327,'450521','450500','合浦县','广西壮族自治区北海市合浦县',NULL,NULL,'1',3),(2333,2279,'450600','450000','防城港市','广西壮族自治区防城港市',NULL,NULL,'1',2),(2334,2333,'450601','450600','市辖区','广西壮族自治区防城港市市辖区',NULL,NULL,'0',3),(2335,2333,'450602','450600','港口区','广西壮族自治区防城港市港口区',NULL,NULL,'1',3),(2336,2333,'450603','450600','防城区','广西壮族自治区防城港市防城区',NULL,NULL,'1',3),(2337,2333,'450621','450600','上思县','广西壮族自治区防城港市上思县',NULL,NULL,'1',3),(2338,2333,'450681','450600','东兴市','广西壮族自治区防城港市东兴市',NULL,NULL,'1',3),(2339,2279,'450700','450000','钦州市','广西壮族自治区钦州市',NULL,NULL,'1',2),(2340,2339,'450701','450700','市辖区','广西壮族自治区钦州市市辖区',NULL,NULL,'0',3),(2341,2339,'450702','450700','钦南区','广西壮族自治区钦州市钦南区',NULL,NULL,'1',3),(2342,2339,'450703','450700','钦北区','广西壮族自治区钦州市钦北区',NULL,NULL,'1',3),(2343,2339,'450721','450700','灵山县','广西壮族自治区钦州市灵山县',NULL,NULL,'1',3),(2344,2339,'450722','450700','浦北县','广西壮族自治区钦州市浦北县',NULL,NULL,'1',3),(2345,2279,'450800','450000','贵港市','广西壮族自治区贵港市',NULL,NULL,'1',2),(2346,2345,'450801','450800','市辖区','广西壮族自治区贵港市市辖区',NULL,NULL,'0',3),(2347,2345,'450802','450800','港北区','广西壮族自治区贵港市港北区',NULL,NULL,'1',3),(2348,2345,'450803','450800','港南区','广西壮族自治区贵港市港南区',NULL,NULL,'1',3),(2349,2345,'450821','450800','平南县','广西壮族自治区贵港市平南县',NULL,NULL,'1',3),(2350,2345,'450881','450800','桂平市','广西壮族自治区贵港市桂平市',NULL,NULL,'1',3),(2351,2279,'450900','450000','玉林市','广西壮族自治区玉林市',NULL,NULL,'1',2),(2352,2351,'450901','450900','市辖区','广西壮族自治区玉林市市辖区',NULL,NULL,'0',3),(2353,2351,'450902','450900','玉州区','广西壮族自治区玉林市玉州区',NULL,NULL,'1',3),(2354,2351,'450921','450900','容县','广西壮族自治区玉林市容县',NULL,NULL,'1',3),(2355,2351,'450922','450900','陆川县','广西壮族自治区玉林市陆川县',NULL,NULL,'1',3),(2356,2351,'450923','450900','博白县','广西壮族自治区玉林市博白县',NULL,NULL,'1',3),(2357,2351,'450924','450900','兴业县','广西壮族自治区玉林市兴业县',NULL,NULL,'1',3),(2358,2351,'450981','450900','北流市','广西壮族自治区玉林市北流市',NULL,NULL,'1',3),(2359,2279,'452100','450000','南宁地区','广西壮族自治区南宁地区',NULL,NULL,'1',2),(2360,2359,'452101','452100','凭祥市','广西壮族自治区南宁地区凭祥市',NULL,NULL,'1',3),(2361,2359,'452122','452100','横县','广西壮族自治区南宁地区横县',NULL,NULL,'1',3),(2362,2359,'452123','452100','宾阳县','广西壮族自治区南宁地区宾阳县',NULL,NULL,'1',3),(2363,2359,'452124','452100','上林县','广西壮族自治区南宁地区上林县',NULL,NULL,'1',3),(2364,2359,'452126','452100','隆安县','广西壮族自治区南宁地区隆安县',NULL,NULL,'1',3),(2365,2359,'452127','452100','马山县','广西壮族自治区南宁地区马山县',NULL,NULL,'1',3),(2366,2359,'452128','452100','扶绥县','广西壮族自治区南宁地区扶绥县',NULL,NULL,'1',3),(2367,2359,'452129','452100','崇左县','广西壮族自治区南宁地区崇左县',NULL,NULL,'1',3),(2368,2359,'452130','452100','大新县','广西壮族自治区南宁地区大新县',NULL,NULL,'1',3),(2369,2359,'452131','452100','天等县','广西壮族自治区南宁地区天等县',NULL,NULL,'1',3),(2370,2359,'452132','452100','宁明县','广西壮族自治区南宁地区宁明县',NULL,NULL,'1',3),(2371,2359,'452133','452100','龙州县','广西壮族自治区南宁地区龙州县',NULL,NULL,'1',3),(2372,2279,'452200','450000','柳州地区','广西壮族自治区柳州地区',NULL,NULL,'1',2),(2373,2372,'452201','452200','合山市','广西壮族自治区柳州地区合山市',NULL,NULL,'1',3),(2374,2372,'452223','452200','鹿寨县','广西壮族自治区柳州地区鹿寨县',NULL,NULL,'1',3),(2375,2372,'452224','452200','象州县','广西壮族自治区柳州地区象州县',NULL,NULL,'1',3),(2376,2372,'452225','452200','武宣县','广西壮族自治区柳州地区武宣县',NULL,NULL,'1',3),(2377,2372,'452226','452200','来宾县','广西壮族自治区柳州地区来宾县',NULL,NULL,'1',3),(2378,2372,'452227','452200','融安县','广西壮族自治区柳州地区融安县',NULL,NULL,'1',3),(2379,2372,'452228','452200','三江县','广西壮族自治区柳州地区三江侗族自治县',NULL,NULL,'1',3),(2380,2372,'452229','452200','融水县','广西壮族自治区柳州地区融水苗族自治县',NULL,NULL,'1',3),(2381,2372,'452230','452200','金秀县','广西壮族自治区柳州地区金秀瑶族自治县',NULL,NULL,'1',3),(2382,2372,'452231','452200','忻城县','广西壮族自治区柳州地区忻城县',NULL,NULL,'1',3),(2383,2279,'452400','450000','贺州地区','广西壮族自治区贺州地区',NULL,NULL,'1',2),(2384,2383,'452402','452400','贺州市','广西壮族自治区贺州地区贺州市',NULL,NULL,'1',3),(2385,2383,'452424','452400','昭平县','广西壮族自治区贺州地区昭平县',NULL,NULL,'1',3),(2386,2383,'452427','452400','钟山县','广西壮族自治区贺州地区钟山县',NULL,NULL,'1',3),(2387,2383,'452428','452400','富川县','广西壮族自治区贺州地区富川瑶族自治县',NULL,NULL,'1',3),(2388,2279,'452600','450000','百色地区','广西壮族自治区百色地区',NULL,NULL,'1',2),(2389,2388,'452601','452600','百色市','广西壮族自治区百色地区百色市',NULL,NULL,'1',3),(2390,2388,'452622','452600','田阳县','广西壮族自治区百色地区田阳县',NULL,NULL,'1',3),(2391,2388,'452623','452600','田东县','广西壮族自治区百色地区田东县',NULL,NULL,'1',3),(2392,2388,'452624','452600','平果县','广西壮族自治区百色地区平果县',NULL,NULL,'1',3),(2393,2388,'452625','452600','德保县','广西壮族自治区百色地区德保县',NULL,NULL,'1',3),(2394,2388,'452626','452600','靖西县','广西壮族自治区百色地区靖西县',NULL,NULL,'1',3),(2395,2388,'452627','452600','那坡县','广西壮族自治区百色地区那坡县',NULL,NULL,'1',3),(2396,2388,'452628','452600','凌云县','广西壮族自治区百色地区凌云县',NULL,NULL,'1',3),(2397,2388,'452629','452600','乐业县','广西壮族自治区百色地区乐业县',NULL,NULL,'1',3),(2398,2388,'452630','452600','田林县','广西壮族自治区百色地区田林县',NULL,NULL,'1',3),(2399,2388,'452631','452600','隆林县','广西壮族自治区百色地区隆林各族自治县',NULL,NULL,'1',3),(2400,2388,'452632','452600','西林县','广西壮族自治区百色地区西林县',NULL,NULL,'1',3),(2401,2279,'452700','450000','河池地区','广西壮族自治区河池地区',NULL,NULL,'1',2),(2402,2401,'452701','452700','河池市','广西壮族自治区河池地区河池市',NULL,NULL,'1',3),(2403,2401,'452702','452700','宜州市','广西壮族自治区河池地区宜州市',NULL,NULL,'1',3),(2404,2401,'452723','452700','罗城县','广西壮族自治区河池地区罗城仫佬族自治县',NULL,NULL,'1',3),(2405,2401,'452724','452700','环江县','广西壮族自治区河池地区环江毛南族自治县',NULL,NULL,'1',3),(2406,2401,'452725','452700','南丹县','广西壮族自治区河池地区南丹县',NULL,NULL,'1',3),(2407,2401,'452726','452700','天峨县','广西壮族自治区河池地区天峨县',NULL,NULL,'1',3),(2408,2401,'452727','452700','凤山县','广西壮族自治区河池地区凤山县',NULL,NULL,'1',3),(2409,2401,'452728','452700','东兰县','广西壮族自治区河池地区东兰县',NULL,NULL,'1',3),(2410,2401,'452729','452700','巴马县','广西壮族自治区河池地区巴马瑶族自治县',NULL,NULL,'1',3),(2411,2401,'452730','452700','都安县','广西壮族自治区河池地区都安瑶族自治县',NULL,NULL,'1',3),(2412,2401,'452731','452700','大化县','广西壮族自治区河池地区大化瑶族自治县',NULL,NULL,'1',3),(2413,1,'460000','86','海南省','海南省',NULL,NULL,'1',1),(2414,2413,'460001','460000','五指山市','海南省三亚市通什市',NULL,NULL,'1',3),(2415,2413,'460002','460000','琼海市','海南省三亚市琼海市',NULL,NULL,'1',3),(2416,2413,'460003','460000','儋州市','海南省三亚市儋州市',NULL,NULL,'1',3),(2417,2413,'460004','460000','琼山市','海南省三亚市琼山市',NULL,NULL,'1',3),(2418,2413,'460005','460000','文昌市','海南省三亚市文昌市',NULL,NULL,'1',3),(2419,2413,'460006','460000','万宁市','海南省三亚市万宁市',NULL,NULL,'1',3),(2420,2413,'460007','460000','东方市','海南省三亚市东方市',NULL,NULL,'1',3),(2421,2413,'460025','460000','定安县','海南省三亚市定安县',NULL,NULL,'1',3),(2422,2413,'460026','460000','屯昌县','海南省三亚市屯昌县',NULL,NULL,'1',3),(2423,2413,'460027','460000','澄迈县','海南省三亚市澄迈县',NULL,NULL,'1',3),(2424,2413,'460028','460000','临高县','海南省三亚市临高县',NULL,NULL,'1',3),(2425,2413,'460030','460000','白沙县','海南省三亚市白沙黎族自治县',NULL,NULL,'1',3),(2426,2413,'460031','460000','昌江县','海南省三亚市昌江黎族自治县',NULL,NULL,'1',3),(2427,2413,'460033','460000','乐东县','海南省三亚市乐东黎族自治县',NULL,NULL,'1',3),(2428,2413,'460034','460000','陵水县','海南省三亚市陵水黎族自治县',NULL,NULL,'1',3),(2429,2413,'460035','460000','保亭县','海南省三亚市保亭黎族苗族自治县',NULL,NULL,'1',3),(2430,2413,'460036','460000','琼中县','海南省三亚市琼中黎族苗族自治县',NULL,NULL,'1',3),(2431,2413,'460037','460000','西沙群岛','海南省西沙群岛',NULL,NULL,'1',3),(2432,2413,'460038','460000','南沙群岛','海南省南沙群岛',NULL,NULL,'1',3),(2433,2413,'460039','460000','中沙群岛','海南省中沙群岛的岛礁及其海域',NULL,NULL,'1',3),(2434,2413,'460100','460000','海口市','海南省海口市',NULL,NULL,'1',2),(2435,2434,'460101','460100','市辖区','海南省海口市市辖区',NULL,NULL,'0',3),(2436,2434,'460102','460100','振东区','海南省海口市振东区',NULL,NULL,'1',3),(2437,2434,'460103','460100','新华区','海南省海口市新华区',NULL,NULL,'1',3),(2438,2434,'460104','460100','秀英区','海南省海口市秀英区',NULL,NULL,'1',3),(2439,2413,'460200','460000','三亚市','海南省三亚市',NULL,NULL,'1',2),(2440,2439,'460201','460200','市辖区','海南省三亚市市辖区',NULL,NULL,'0',3),(2441,1,'500000','86','重庆市','重庆市',NULL,NULL,'1',1),(2442,2441,'500100','500000','重庆市','重庆市市辖区',NULL,NULL,'1',2),(2443,2442,'500101','500100','万州区','重庆市万州区',NULL,NULL,'1',3),(2444,2442,'500102','500100','涪陵区','重庆市涪陵区',NULL,NULL,'1',3),(2445,2442,'500103','500100','渝中区','重庆市渝中区',NULL,NULL,'1',3),(2446,2442,'500104','500100','大渡口区','重庆市大渡口区',NULL,NULL,'1',3),(2447,2442,'500105','500100','江北区','重庆市江北区',NULL,NULL,'1',3),(2448,2442,'500106','500100','沙坪坝区','重庆市沙坪坝区',NULL,NULL,'1',3),(2449,2442,'500107','500100','九龙坡区','重庆市九龙坡区',NULL,NULL,'1',3),(2450,2442,'500108','500100','南岸区','重庆市南岸区',NULL,NULL,'1',3),(2451,2442,'500109','500100','北碚区','重庆市北碚区',NULL,NULL,'1',3),(2452,2442,'500110','500100','万盛区','重庆市万盛区',NULL,NULL,'1',3),(2453,2442,'500111','500100','双桥区','重庆市双桥区',NULL,NULL,'1',3),(2454,2442,'500112','500100','渝北区','重庆市渝北区',NULL,NULL,'1',3),(2455,2442,'500113','500100','巴南区','重庆市巴南区',NULL,NULL,'1',3),(2456,2442,'500221','500100','长寿区','重庆市长寿区',NULL,NULL,'1',3),(2457,2442,'500381','500100','江津区','重庆市江津区',NULL,NULL,'1',3),(2458,2442,'500382','500100','合川区','重庆市合川区',NULL,NULL,'1',3),(2459,2442,'500383','500100','永川区','重庆市永川区',NULL,NULL,'1',3),(2460,2442,'500384','500100','南川区','重庆市南川区',NULL,NULL,'1',3),(2461,2442,'500239','500100','黔江区','重庆市黔江土家族苗族自治县',NULL,NULL,'1',3),(2462,2441,'500200','500000','县','重庆市县',NULL,NULL,'1',2),(2463,2462,'500222','500200','綦江县','重庆市綦江县',NULL,NULL,'1',3),(2464,2462,'500223','500200','潼南县','重庆市潼南县',NULL,NULL,'1',3),(2465,2462,'500224','500200','铜梁县','重庆市铜梁县',NULL,NULL,'1',3),(2466,2462,'500225','500200','大足县','重庆市大足县',NULL,NULL,'1',3),(2467,2462,'500226','500200','荣昌县','重庆市荣昌县',NULL,NULL,'1',3),(2468,2462,'500227','500200','璧山县','重庆市璧山县',NULL,NULL,'1',3),(2469,2462,'500228','500200','梁平县','重庆市梁平县',NULL,NULL,'1',3),(2470,2462,'500229','500200','城口县','重庆市城口县',NULL,NULL,'1',3),(2471,2462,'500230','500200','丰都县','重庆市丰都县',NULL,NULL,'1',3),(2472,2462,'500231','500200','垫江县','重庆市垫江县',NULL,NULL,'1',3),(2473,2462,'500232','500200','武隆县','重庆市武隆县',NULL,NULL,'1',3),(2474,2462,'500233','500200','忠县','重庆市忠县',NULL,NULL,'1',3),(2475,2462,'500234','500200','开县','重庆市开县',NULL,NULL,'1',3),(2476,2462,'500235','500200','云阳县','重庆市云阳县',NULL,NULL,'1',3),(2477,2462,'500236','500200','奉节县','重庆市奉节县',NULL,NULL,'1',3),(2478,2462,'500237','500200','巫山县','重庆市巫山县',NULL,NULL,'1',3),(2479,2462,'500238','500200','巫溪县','重庆市巫溪县',NULL,NULL,'1',3),(2480,2462,'500240','500200','石柱县','重庆市石柱土家族自治县',NULL,NULL,'1',3),(2481,2462,'500241','500200','秀山县','重庆市秀山土家族苗族自治县',NULL,NULL,'1',3),(2482,2462,'500242','500200','酉阳县','重庆市酉阳土家族苗族自治县',NULL,NULL,'1',3),(2483,2462,'500243','500200','彭水县','重庆市彭水苗族土家族自治县',NULL,NULL,'1',3),(2484,1,'510000','86','四川省','四川省',NULL,NULL,'1',1),(2485,2484,'510100','510000','成都市','四川省成都市',NULL,NULL,'1',2),(2486,2485,'510101','510100','市辖区','四川省成都市市辖区',NULL,NULL,'0',3),(2487,2485,'510104','510100','锦江区','四川省成都市锦江区',NULL,NULL,'1',3),(2488,2485,'510105','510100','青羊区','四川省成都市青羊区',NULL,NULL,'1',3),(2489,2485,'510106','510100','金牛区','四川省成都市金牛区',NULL,NULL,'1',3),(2490,2485,'510107','510100','武侯区','四川省成都市武侯区',NULL,NULL,'1',3),(2491,2485,'510108','510100','成华区','四川省成都市成华区',NULL,NULL,'1',3),(2492,2485,'510112','510100','龙泉驿区','四川省成都市龙泉驿区',NULL,NULL,'1',3),(2493,2485,'510113','510100','青白江区','四川省成都市青白江区',NULL,NULL,'1',3),(2494,2485,'510121','510100','金堂县','四川省成都市金堂县',NULL,NULL,'1',3),(2495,2485,'510122','510100','双流县','四川省成都市双流县',NULL,NULL,'1',3),(2496,2485,'510123','510100','温江县','四川省成都市温江县',NULL,NULL,'1',3),(2497,2485,'510124','510100','郫县','四川省成都市郫县',NULL,NULL,'1',3),(2498,2485,'510125','510100','新都县','四川省成都市新都县',NULL,NULL,'1',3),(2499,2485,'510129','510100','大邑县','四川省成都市大邑县',NULL,NULL,'1',3),(2500,2485,'510131','510100','蒲江县','四川省成都市蒲江县',NULL,NULL,'1',3),(2501,2485,'510132','510100','新津县','四川省成都市新津县',NULL,NULL,'1',3),(2502,2485,'510181','510100','都江堰市','四川省成都市都江堰市',NULL,NULL,'1',3),(2503,2485,'510182','510100','彭州市','四川省成都市彭州市',NULL,NULL,'1',3),(2504,2485,'510183','510100','邛崃市','四川省成都市邛崃市',NULL,NULL,'1',3),(2505,2485,'510184','510100','崇州市','四川省成都市崇州市',NULL,NULL,'1',3),(2506,2484,'510300','510000','自贡市','四川省自贡市',NULL,NULL,'1',2),(2507,2506,'510301','510300','市辖区','四川省自贡市市辖区',NULL,NULL,'0',3),(2508,2506,'510302','510300','自流井区','四川省自贡市自流井区',NULL,NULL,'1',3),(2509,2506,'510303','510300','贡井区','四川省自贡市贡井区',NULL,NULL,'1',3),(2510,2506,'510304','510300','大安区','四川省自贡市大安区',NULL,NULL,'1',3),(2511,2506,'510311','510300','沿滩区','四川省自贡市沿滩区',NULL,NULL,'1',3),(2512,2506,'510321','510300','荣县','四川省自贡市荣县',NULL,NULL,'1',3),(2513,2506,'510322','510300','富顺县','四川省自贡市富顺县',NULL,NULL,'1',3),(2514,2484,'510400','510000','攀枝花市','四川省攀枝花市',NULL,NULL,'1',2),(2515,2514,'510401','510400','市辖区','四川省攀枝花市市辖区',NULL,NULL,'0',3),(2516,2514,'510402','510400','东区','四川省攀枝花市东区',NULL,NULL,'1',3),(2517,2514,'510403','510400','西区','四川省攀枝花市西区',NULL,NULL,'1',3),(2518,2514,'510411','510400','仁和区','四川省攀枝花市仁和区',NULL,NULL,'1',3),(2519,2514,'510421','510400','米易县','四川省攀枝花市米易县',NULL,NULL,'1',3),(2520,2514,'510422','510400','盐边县','四川省攀枝花市盐边县',NULL,NULL,'1',3),(2521,2484,'510500','510000','泸州市','四川省泸州市',NULL,NULL,'1',2),(2522,2521,'510501','510500','市辖区','四川省泸州市市辖区',NULL,NULL,'0',3),(2523,2521,'510502','510500','江阳区','四川省泸州市江阳区',NULL,NULL,'1',3),(2524,2521,'510503','510500','纳溪区','四川省泸州市纳溪区',NULL,NULL,'1',3),(2525,2521,'510504','510500','龙马潭区','四川省泸州市龙马潭区',NULL,NULL,'1',3),(2526,2521,'510521','510500','泸县','四川省泸州市泸县',NULL,NULL,'1',3),(2527,2521,'510522','510500','合江县','四川省泸州市合江县',NULL,NULL,'1',3),(2528,2521,'510524','510500','叙永县','四川省泸州市叙永县',NULL,NULL,'1',3),(2529,2521,'510525','510500','古蔺县','四川省泸州市古蔺县',NULL,NULL,'1',3),(2530,2484,'510600','510000','德阳市','四川省德阳市',NULL,NULL,'1',2),(2531,2530,'510601','510600','市辖区','四川省德阳市市辖区',NULL,NULL,'0',3),(2532,2530,'510603','510600','旌阳区','四川省德阳市旌阳区',NULL,NULL,'1',3),(2533,2530,'510623','510600','中江县','四川省德阳市中江县',NULL,NULL,'1',3),(2534,2530,'510626','510600','罗江县','四川省德阳市罗江县',NULL,NULL,'1',3),(2535,2530,'510681','510600','广汉市','四川省德阳市广汉市',NULL,NULL,'1',3),(2536,2530,'510682','510600','什邡市','四川省德阳市什邡市',NULL,NULL,'1',3),(2537,2530,'510683','510600','绵竹市','四川省德阳市绵竹市',NULL,NULL,'1',3),(2538,2484,'510700','510000','绵阳市','四川省绵阳市',NULL,NULL,'1',2),(2539,2538,'510701','510700','市辖区','四川省绵阳市市辖区',NULL,NULL,'0',3),(2540,2538,'510703','510700','涪城区','四川省绵阳市涪城区',NULL,NULL,'1',3),(2541,2538,'510704','510700','游仙区','四川省绵阳市游仙区',NULL,NULL,'1',3),(2542,2538,'510722','510700','三台县','四川省绵阳市三台县',NULL,NULL,'1',3),(2543,2538,'510723','510700','盐亭县','四川省绵阳市盐亭县',NULL,NULL,'1',3),(2544,2538,'510724','510700','安县','四川省绵阳市安县',NULL,NULL,'1',3),(2545,2538,'510725','510700','梓潼县','四川省绵阳市梓潼县',NULL,NULL,'1',3),(2546,2538,'510726','510700','北川县','四川省绵阳市北川县',NULL,NULL,'1',3),(2547,2538,'510727','510700','平武县','四川省绵阳市平武县',NULL,NULL,'1',3),(2548,2538,'510781','510700','江油市','四川省绵阳市江油市',NULL,NULL,'1',3),(2549,2484,'510800','510000','广元市','四川省广元市',NULL,NULL,'1',2),(2550,2549,'510801','510800','市辖区','四川省广元市市辖区',NULL,NULL,'0',3),(2551,2549,'510802','510800','市中区','四川省广元市市中区',NULL,NULL,'1',3),(2552,2549,'510811','510800','元坝区','四川省广元市元坝区',NULL,NULL,'1',3),(2553,2549,'510812','510800','朝天区','四川省广元市朝天区',NULL,NULL,'1',3),(2554,2549,'510821','510800','旺苍县','四川省广元市旺苍县',NULL,NULL,'1',3),(2555,2549,'510822','510800','青川县','四川省广元市青川县',NULL,NULL,'1',3),(2556,2549,'510823','510800','剑阁县','四川省广元市剑阁县',NULL,NULL,'1',3),(2557,2549,'510824','510800','苍溪县','四川省广元市苍溪县',NULL,NULL,'1',3),(2558,2484,'510900','510000','遂宁市','四川省遂宁市',NULL,NULL,'1',2),(2559,2558,'510901','510900','市辖区','四川省遂宁市市辖区',NULL,NULL,'0',3),(2560,2558,'510902','510900','市中区','四川省遂宁市市中区',NULL,NULL,'1',3),(2561,2558,'510921','510900','蓬溪县','四川省遂宁市蓬溪县',NULL,NULL,'1',3),(2562,2558,'510922','510900','射洪县','四川省遂宁市射洪县',NULL,NULL,'1',3),(2563,2558,'510923','510900','大英县','四川省遂宁市大英县',NULL,NULL,'1',3),(2564,2484,'511000','510000','内江市','四川省内江市',NULL,NULL,'1',2),(2565,2564,'511001','511000','市辖区','四川省内江市市辖区',NULL,NULL,'0',3),(2566,2564,'511002','511000','市中区','四川省内江市市中区',NULL,NULL,'1',3),(2567,2564,'511011','511000','东兴区','四川省内江市东兴区',NULL,NULL,'1',3),(2568,2564,'511024','511000','威远县','四川省内江市威远县',NULL,NULL,'1',3),(2569,2564,'511025','511000','资中县','四川省内江市资中县',NULL,NULL,'1',3),(2570,2564,'511028','511000','隆昌县','四川省内江市隆昌县',NULL,NULL,'1',3),(2571,2484,'511100','510000','乐山市','四川省乐山市',NULL,NULL,'1',2),(2572,2571,'511101','511100','市辖区','四川省乐山市市辖区',NULL,NULL,'0',3),(2573,2571,'511102','511100','市中区','四川省乐山市市中区',NULL,NULL,'1',3),(2574,2571,'511111','511100','沙湾区','四川省乐山市沙湾区',NULL,NULL,'1',3),(2575,2571,'511112','511100','五通桥区','四川省乐山市五通桥区',NULL,NULL,'1',3),(2576,2571,'511113','511100','金口河区','四川省乐山市金口河区',NULL,NULL,'1',3),(2577,2571,'511123','511100','犍为县','四川省乐山市犍为县',NULL,NULL,'1',3),(2578,2571,'511124','511100','井研县','四川省乐山市井研县',NULL,NULL,'1',3),(2579,2571,'511126','511100','夹江县','四川省乐山市夹江县',NULL,NULL,'1',3),(2580,2571,'511129','511100','沐川县','四川省乐山市沐川县',NULL,NULL,'1',3),(2581,2571,'511132','511100','峨边县','四川省乐山市峨边彝族自治县',NULL,NULL,'1',3),(2582,2571,'511133','511100','马边县','四川省乐山市马边彝族自治县',NULL,NULL,'1',3),(2583,2571,'511181','511100','峨眉山市','四川省乐山市峨眉山市',NULL,NULL,'1',3),(2584,2484,'511300','510000','南充市','四川省南充市',NULL,NULL,'1',2),(2585,2584,'511301','511300','市辖区','四川省南充市市辖区',NULL,NULL,'0',3),(2586,2584,'511302','511300','顺庆区','四川省南充市顺庆区',NULL,NULL,'1',3),(2587,2584,'511303','511300','高坪区','四川省南充市高坪区',NULL,NULL,'1',3),(2588,2584,'511304','511300','嘉陵区','四川省南充市嘉陵区',NULL,NULL,'1',3),(2589,2584,'511321','511300','南部县','四川省南充市南部县',NULL,NULL,'1',3),(2590,2584,'511322','511300','营山县','四川省南充市营山县',NULL,NULL,'1',3),(2591,2584,'511323','511300','蓬安县','四川省南充市蓬安县',NULL,NULL,'1',3),(2592,2584,'511324','511300','仪陇县','四川省南充市仪陇县',NULL,NULL,'1',3),(2593,2584,'511325','511300','西充县','四川省南充市西充县',NULL,NULL,'1',3),(2594,2584,'511381','511300','阆中市','四川省南充市阆中市',NULL,NULL,'1',3),(2595,2484,'511500','510000','宜宾市','四川省宜宾市',NULL,NULL,'1',2),(2596,2595,'511501','511500','市辖区','四川省宜宾市市辖区',NULL,NULL,'0',3),(2597,2595,'511502','511500','翠屏区','四川省宜宾市翠屏区',NULL,NULL,'1',3),(2598,2595,'511521','511500','宜宾县','四川省宜宾市宜宾县',NULL,NULL,'1',3),(2599,2595,'511522','511500','南溪县','四川省宜宾市南溪县',NULL,NULL,'1',3),(2600,2595,'511523','511500','江安县','四川省宜宾市江安县',NULL,NULL,'1',3),(2601,2595,'511524','511500','长宁县','四川省宜宾市长宁县',NULL,NULL,'1',3),(2602,2595,'511525','511500','高县','四川省宜宾市高县',NULL,NULL,'1',3),(2603,2595,'511526','511500','珙县','四川省宜宾市珙县',NULL,NULL,'1',3),(2604,2595,'511527','511500','筠连县','四川省宜宾市筠连县',NULL,NULL,'1',3),(2605,2595,'511528','511500','兴文县','四川省宜宾市兴文县',NULL,NULL,'1',3),(2606,2595,'511529','511500','屏山县','四川省宜宾市屏山县',NULL,NULL,'1',3),(2607,2484,'511600','510000','广安市','四川省广安市',NULL,NULL,'1',2),(2608,2607,'511601','511600','市辖区','四川省广安市市辖区',NULL,NULL,'0',3),(2609,2607,'511602','511600','广安区','四川省广安市广安区',NULL,NULL,'1',3),(2610,2607,'511621','511600','岳池县','四川省广安市岳池县',NULL,NULL,'1',3),(2611,2607,'511622','511600','武胜县','四川省广安市武胜县',NULL,NULL,'1',3),(2612,2607,'511623','511600','邻水县','四川省广安市邻水县',NULL,NULL,'1',3),(2613,2607,'511681','511600','华蓥市','四川省广安市华蓥市',NULL,NULL,'1',3),(2614,2484,'513000','510000','达川地区','四川省达川地区',NULL,NULL,'1',2),(2615,2614,'513001','513000','达川市','四川省达川地区达川市',NULL,NULL,'1',3),(2616,2614,'513002','513000','万源市','四川省达川地区万源市',NULL,NULL,'1',3),(2617,2614,'513021','513000','达县','四川省达川地区达县',NULL,NULL,'1',3),(2618,2614,'513022','513000','宣汉县','四川省达川地区宣汉县',NULL,NULL,'1',3),(2619,2614,'513023','513000','开江县','四川省达川地区开江县',NULL,NULL,'1',3),(2620,2614,'513029','513000','大竹县','四川省达川地区大竹县',NULL,NULL,'1',3),(2621,2614,'513030','513000','渠县','四川省达川地区渠县',NULL,NULL,'1',3),(2622,2484,'513100','510000','雅安地区','四川省雅安地区',NULL,NULL,'1',2),(2623,2622,'513101','513100','雅安市','四川省雅安地区雅安市',NULL,NULL,'1',3),(2624,2622,'513122','513100','名山县','四川省雅安地区名山县',NULL,NULL,'1',3),(2625,2622,'513123','513100','荥经县','四川省雅安地区荥经县',NULL,NULL,'1',3),(2626,2622,'513124','513100','汉源县','四川省雅安地区汉源县',NULL,NULL,'1',3),(2627,2622,'513125','513100','石棉县','四川省雅安地区石棉县',NULL,NULL,'1',3),(2628,2622,'513126','513100','天全县','四川省雅安地区天全县',NULL,NULL,'1',3),(2629,2622,'513127','513100','芦山县','四川省雅安地区芦山县',NULL,NULL,'1',3),(2630,2622,'513128','513100','宝兴县','四川省雅安地区宝兴县',NULL,NULL,'1',3),(2631,2484,'513200','510000','阿坝州','四川省阿坝藏族羌族自治州',NULL,NULL,'1',2),(2632,2631,'513221','513200','汶川县','四川省阿坝藏族羌族自治州汶川县',NULL,NULL,'1',3),(2633,2631,'513222','513200','理县','四川省阿坝藏族羌族自治州理县',NULL,NULL,'1',3),(2634,2631,'513223','513200','茂县','四川省阿坝藏族羌族自治州茂县',NULL,NULL,'1',3),(2635,2631,'513224','513200','松潘县','四川省阿坝藏族羌族自治州松潘县',NULL,NULL,'1',3),(2636,2631,'513225','513200','九寨沟县','四川省阿坝藏族羌族自治州九寨沟县',NULL,NULL,'1',3),(2637,2631,'513226','513200','金川县','四川省阿坝藏族羌族自治州金川县',NULL,NULL,'1',3),(2638,2631,'513227','513200','小金县','四川省阿坝藏族羌族自治州小金县',NULL,NULL,'1',3),(2639,2631,'513228','513200','黑水县','四川省阿坝藏族羌族自治州黑水县',NULL,NULL,'1',3),(2640,2631,'513229','513200','马尔康县','四川省阿坝藏族羌族自治州马尔康县',NULL,NULL,'1',3),(2641,2631,'513230','513200','壤塘县','四川省阿坝藏族羌族自治州壤塘县',NULL,NULL,'1',3),(2642,2631,'513231','513200','阿坝县','四川省阿坝藏族羌族自治州阿坝县',NULL,NULL,'1',3),(2643,2631,'513232','513200','若尔盖县','四川省阿坝藏族羌族自治州若尔盖县',NULL,NULL,'1',3),(2644,2631,'513233','513200','红原县','四川省阿坝藏族羌族自治州红原县',NULL,NULL,'1',3),(2645,2484,'513300','510000','甘孜州','四川省甘孜藏族自治州',NULL,NULL,'1',2),(2646,2645,'513321','513300','康定县','四川省甘孜藏族自治州康定县',NULL,NULL,'1',3),(2647,2645,'513322','513300','泸定县','四川省甘孜藏族自治州泸定县',NULL,NULL,'1',3),(2648,2645,'513323','513300','丹巴县','四川省甘孜藏族自治州丹巴县',NULL,NULL,'1',3),(2649,2645,'513324','513300','九龙县','四川省甘孜藏族自治州九龙县',NULL,NULL,'1',3),(2650,2645,'513325','513300','雅江县','四川省甘孜藏族自治州雅江县',NULL,NULL,'1',3),(2651,2645,'513326','513300','道孚县','四川省甘孜藏族自治州道孚县',NULL,NULL,'1',3),(2652,2645,'513327','513300','炉霍县','四川省甘孜藏族自治州炉霍县',NULL,NULL,'1',3),(2653,2645,'513328','513300','甘孜县','四川省甘孜藏族自治州甘孜县',NULL,NULL,'1',3),(2654,2645,'513329','513300','新龙县','四川省甘孜藏族自治州新龙县',NULL,NULL,'1',3),(2655,2645,'513330','513300','德格县','四川省甘孜藏族自治州德格县',NULL,NULL,'1',3),(2656,2645,'513331','513300','白玉县','四川省甘孜藏族自治州白玉县',NULL,NULL,'1',3),(2657,2645,'513332','513300','石渠县','四川省甘孜藏族自治州石渠县',NULL,NULL,'1',3),(2658,2645,'513333','513300','色达县','四川省甘孜藏族自治州色达县',NULL,NULL,'1',3),(2659,2645,'513334','513300','理塘县','四川省甘孜藏族自治州理塘县',NULL,NULL,'1',3),(2660,2645,'513335','513300','巴塘县','四川省甘孜藏族自治州巴塘县',NULL,NULL,'1',3),(2661,2645,'513336','513300','乡城县','四川省甘孜藏族自治州乡城县',NULL,NULL,'1',3),(2662,2645,'513337','513300','稻城县','四川省甘孜藏族自治州稻城县',NULL,NULL,'1',3),(2663,2645,'513338','513300','得荣县','四川省甘孜藏族自治州得荣县',NULL,NULL,'1',3),(2664,2484,'513400','510000','凉山州','四川省凉山彝族自治州',NULL,NULL,'1',2),(2665,2664,'513401','513400','西昌市','四川省凉山彝族自治州西昌市',NULL,NULL,'1',3),(2666,2664,'513422','513400','木里县','四川省凉山彝族自治州木里藏族自治县',NULL,NULL,'1',3),(2667,2664,'513423','513400','盐源县','四川省凉山彝族自治州盐源县',NULL,NULL,'1',3),(2668,2664,'513424','513400','德昌县','四川省凉山彝族自治州德昌县',NULL,NULL,'1',3),(2669,2664,'513425','513400','会理县','四川省凉山彝族自治州会理县',NULL,NULL,'1',3),(2670,2664,'513426','513400','会东县','四川省凉山彝族自治州会东县',NULL,NULL,'1',3),(2671,2664,'513427','513400','宁南县','四川省凉山彝族自治州宁南县',NULL,NULL,'1',3),(2672,2664,'513428','513400','普格县','四川省凉山彝族自治州普格县',NULL,NULL,'1',3),(2673,2664,'513429','513400','布拖县','四川省凉山彝族自治州布拖县',NULL,NULL,'1',3),(2674,2664,'513430','513400','金阳县','四川省凉山彝族自治州金阳县',NULL,NULL,'1',3),(2675,2664,'513431','513400','昭觉县','四川省凉山彝族自治州昭觉县',NULL,NULL,'1',3),(2676,2664,'513432','513400','喜德县','四川省凉山彝族自治州喜德县',NULL,NULL,'1',3),(2677,2664,'513433','513400','冕宁县','四川省凉山彝族自治州冕宁县',NULL,NULL,'1',3),(2678,2664,'513434','513400','越西县','四川省凉山彝族自治州越西县',NULL,NULL,'1',3),(2679,2664,'513435','513400','甘洛县','四川省凉山彝族自治州甘洛县',NULL,NULL,'1',3),(2680,2664,'513436','513400','美姑县','四川省凉山彝族自治州美姑县',NULL,NULL,'1',3),(2681,2664,'513437','513400','雷波县','四川省凉山彝族自治州雷波县',NULL,NULL,'1',3),(2682,2484,'513700','510000','巴中地区','四川省巴中地区',NULL,NULL,'1',2),(2683,2682,'513701','513700','巴中市','四川省巴中地区巴中市',NULL,NULL,'1',3),(2684,2682,'513721','513700','通江县','四川省巴中地区通江县',NULL,NULL,'1',3),(2685,2682,'513722','513700','南江县','四川省巴中地区南江县',NULL,NULL,'1',3),(2686,2682,'513723','513700','平昌县','四川省巴中地区平昌县',NULL,NULL,'1',3),(2687,2484,'513800','510000','眉山地区','四川省眉山地区',NULL,NULL,'1',2),(2688,2687,'513821','513800','眉山县','四川省眉山地区眉山县',NULL,NULL,'1',3),(2689,2687,'513822','513800','仁寿县','四川省眉山地区仁寿县',NULL,NULL,'1',3),(2690,2687,'513823','513800','彭山县','四川省眉山地区彭山县',NULL,NULL,'1',3),(2691,2687,'513824','513800','洪雅县','四川省眉山地区洪雅县',NULL,NULL,'1',3),(2692,2687,'513825','513800','丹棱县','四川省眉山地区丹棱县',NULL,NULL,'1',3),(2693,2687,'513826','513800','青神县','四川省眉山地区青神县',NULL,NULL,'1',3),(2694,2484,'513900','510000','资阳地区','四川省资阳地区',NULL,NULL,'1',2),(2695,2694,'513901','513900','资阳市','四川省资阳市',NULL,NULL,'1',3),(2696,2694,'513902','513900','简阳市','四川省简阳市',NULL,NULL,'1',3),(2697,2694,'513921','513900','安岳县','四川省安岳县',NULL,NULL,'1',3),(2698,2694,'513922','513900','乐至县','四川省乐至县',NULL,NULL,'1',3),(2699,1,'520000','86','贵州省','贵州省',NULL,NULL,'1',1),(2700,2699,'520100','520000','贵阳市','贵州省贵阳市',NULL,NULL,'1',2),(2701,2700,'520101','520100','市辖区','贵州省贵阳市市辖区',NULL,NULL,'0',3),(2702,2700,'520102','520100','南明区','贵州省贵阳市南明区',NULL,NULL,'1',3),(2703,2700,'520103','520100','云岩区','贵州省贵阳市云岩区',NULL,NULL,'1',3),(2704,2700,'520111','520100','花溪区','贵州省贵阳市花溪区',NULL,NULL,'1',3),(2705,2700,'520112','520100','乌当区','贵州省贵阳市乌当区',NULL,NULL,'1',3),(2706,2700,'520113','520100','白云区','贵州省贵阳市白云区',NULL,NULL,'1',3),(2707,2700,'520121','520100','开阳县','贵州省贵阳市开阳县',NULL,NULL,'1',3),(2708,2700,'520122','520100','息烽县','贵州省贵阳市息烽县',NULL,NULL,'1',3),(2709,2700,'520123','520100','修文县','贵州省贵阳市修文县',NULL,NULL,'1',3),(2710,2700,'520181','520100','清镇市','贵州省贵阳市清镇市',NULL,NULL,'1',3),(2711,2699,'520200','520000','六盘水市','贵州省六盘水市',NULL,NULL,'1',2),(2712,2711,'520201','520200','钟山区','贵州省六盘水市钟山区',NULL,NULL,'1',3),(2713,2711,'520202','520200','盘县特区','贵州省六盘水市盘县特区',NULL,NULL,'1',3),(2714,2711,'520203','520200','六枝特区','贵州省六盘水市六枝特区',NULL,NULL,'1',3),(2715,2711,'520221','520200','水城县','贵州省六盘水市水城县',NULL,NULL,'1',3),(2716,2699,'520300','520000','遵义市','贵州省遵义市',NULL,NULL,'1',2),(2717,2716,'520301','520300','市辖区','贵州省遵义市市辖区',NULL,NULL,'0',3),(2718,2716,'520302','520300','红花岗区','贵州省遵义市红花岗区',NULL,NULL,'1',3),(2719,2716,'520321','520300','遵义县','贵州省遵义市遵义县',NULL,NULL,'1',3),(2720,2716,'520322','520300','桐梓县','贵州省遵义市桐梓县',NULL,NULL,'1',3),(2721,2716,'520323','520300','绥阳县','贵州省遵义市绥阳县',NULL,NULL,'1',3),(2722,2716,'520324','520300','正安县','贵州省遵义市正安县',NULL,NULL,'1',3),(2723,2716,'520325','520300','道真县','贵州省遵义市道真仡佬族苗族自治县',NULL,NULL,'1',3),(2724,2716,'520326','520300','务川县','贵州省遵义市务川仡佬族苗族自治县',NULL,NULL,'1',3),(2725,2716,'520327','520300','凤冈县','贵州省遵义市凤冈县',NULL,NULL,'1',3),(2726,2716,'520328','520300','湄潭县','贵州省遵义市湄潭县',NULL,NULL,'1',3),(2727,2716,'520329','520300','余庆县','贵州省遵义市余庆县',NULL,NULL,'1',3),(2728,2716,'520330','520300','习水县','贵州省遵义市习水县',NULL,NULL,'1',3),(2729,2716,'520381','520300','赤水市','贵州省遵义市赤水市',NULL,NULL,'1',3),(2730,2716,'520382','520300','仁怀市','贵州省遵义市仁怀市',NULL,NULL,'1',3),(2731,2699,'522200','520000','铜仁地区','贵州省铜仁地区',NULL,NULL,'1',2),(2732,2731,'522201','522200','铜仁市','贵州省铜仁地区铜仁市',NULL,NULL,'1',3),(2733,2731,'522222','522200','江口县','贵州省铜仁地区江口县',NULL,NULL,'1',3),(2734,2731,'522223','522200','玉屏县','贵州省铜仁地区玉屏侗族自治县',NULL,NULL,'1',3),(2735,2731,'522224','522200','石阡县','贵州省铜仁地区石阡县',NULL,NULL,'1',3),(2736,2731,'522225','522200','思南县','贵州省铜仁地区思南县',NULL,NULL,'1',3),(2737,2731,'522226','522200','印江县','贵州省铜仁地区印江土家族苗族自治县',NULL,NULL,'1',3),(2738,2731,'522227','522200','德江县','贵州省铜仁地区德江县',NULL,NULL,'1',3),(2739,2731,'522228','522200','沿河县','贵州省铜仁地区沿河土家族自治县',NULL,NULL,'1',3),(2740,2731,'522229','522200','松桃县','贵州省铜仁地区松桃苗族自治县',NULL,NULL,'1',3),(2741,2731,'522230','522200','万山区','贵州省铜仁地区万山特区',NULL,NULL,'1',3),(2742,2699,'522300','520000','黔西南','贵州省黔西南布依族苗族自治州',NULL,NULL,'1',2),(2743,2742,'522301','522300','兴义市','贵州省黔西南布依族苗族自治州兴义市',NULL,NULL,'1',3),(2744,2742,'522322','522300','兴仁县','贵州省黔西南布依族苗族自治州兴仁县',NULL,NULL,'1',3),(2745,2742,'522323','522300','普安县','贵州省黔西南布依族苗族自治州普安县',NULL,NULL,'1',3),(2746,2742,'522324','522300','晴隆县','贵州省黔西南布依族苗族自治州晴隆县',NULL,NULL,'1',3),(2747,2742,'522325','522300','贞丰县','贵州省黔西南布依族苗族自治州贞丰县',NULL,NULL,'1',3),(2748,2742,'522326','522300','望谟县','贵州省黔西南布依族苗族自治州望谟县',NULL,NULL,'1',3),(2749,2742,'522327','522300','册亨县','贵州省黔西南布依族苗族自治州册亨县',NULL,NULL,'1',3),(2750,2742,'522328','522300','安龙县','贵州省黔西南布依族苗族自治州安龙县',NULL,NULL,'1',3),(2751,2699,'522400','520000','毕节地区','贵州省毕节地区',NULL,NULL,'1',2),(2752,2751,'522401','522400','毕节市','贵州省毕节地区毕节市',NULL,NULL,'1',3),(2753,2751,'522422','522400','大方县','贵州省毕节地区大方县',NULL,NULL,'1',3),(2754,2751,'522423','522400','黔西县','贵州省毕节地区黔西县',NULL,NULL,'1',3),(2755,2751,'522424','522400','金沙县','贵州省毕节地区金沙县',NULL,NULL,'1',3),(2756,2751,'522425','522400','织金县','贵州省毕节地区织金县',NULL,NULL,'1',3),(2757,2751,'522426','522400','纳雍县','贵州省毕节地区纳雍县',NULL,NULL,'1',3),(2758,2751,'522427','522400','威宁县','贵州省毕节地区威宁彝族回族苗族自治县',NULL,NULL,'1',3),(2759,2751,'522428','522400','赫章县','贵州省毕节地区赫章县',NULL,NULL,'1',3),(2760,2699,'522500','520000','安顺地区','贵州省安顺地区',NULL,NULL,'1',2),(2761,2760,'522501','522500','安顺市','贵州省安顺地区安顺市',NULL,NULL,'1',3),(2762,2760,'522526','522500','平坝县','贵州省安顺地区平坝县',NULL,NULL,'1',3),(2763,2760,'522527','522500','普定县','贵州省安顺地区普定县',NULL,NULL,'1',3),(2764,2760,'522528','522500','关岭县','贵州省安顺地区关岭布依族苗族自治县',NULL,NULL,'1',3),(2765,2760,'522529','522500','镇宁县','贵州省安顺地区镇宁布依族苗族自治县',NULL,NULL,'1',3),(2766,2760,'522530','522500','紫云县','贵州省安顺地区紫云苗族布依族自治县',NULL,NULL,'1',3),(2767,2699,'522600','520000','黔东南','贵州省黔东南苗族侗族自治州',NULL,NULL,'1',2),(2768,2767,'522601','522600','凯里市','贵州省黔东南苗族侗族自治州凯里市',NULL,NULL,'1',3),(2769,2767,'522622','522600','黄平县','贵州省黔东南苗族侗族自治州黄平县',NULL,NULL,'1',3),(2770,2767,'522623','522600','施秉县','贵州省黔东南苗族侗族自治州施秉县',NULL,NULL,'1',3),(2771,2767,'522624','522600','三穗县','贵州省黔东南苗族侗族自治州三穗县',NULL,NULL,'1',3),(2772,2767,'522625','522600','镇远县','贵州省黔东南苗族侗族自治州镇远县',NULL,NULL,'1',3),(2773,2767,'522626','522600','岑巩县','贵州省黔东南苗族侗族自治州岑巩县',NULL,NULL,'1',3),(2774,2767,'522627','522600','天柱县','贵州省黔东南苗族侗族自治州天柱县',NULL,NULL,'1',3),(2775,2767,'522628','522600','锦屏县','贵州省黔东南苗族侗族自治州锦屏县',NULL,NULL,'1',3),(2776,2767,'522629','522600','剑河县','贵州省黔东南苗族侗族自治州剑河县',NULL,NULL,'1',3),(2777,2767,'522630','522600','台江县','贵州省黔东南苗族侗族自治州台江县',NULL,NULL,'1',3),(2778,2767,'522631','522600','黎平县','贵州省黔东南苗族侗族自治州黎平县',NULL,NULL,'1',3),(2779,2767,'522632','522600','榕江县','贵州省黔东南苗族侗族自治州榕江县',NULL,NULL,'1',3),(2780,2767,'522633','522600','从江县','贵州省黔东南苗族侗族自治州从江县',NULL,NULL,'1',3),(2781,2767,'522634','522600','雷山县','贵州省黔东南苗族侗族自治州雷山县',NULL,NULL,'1',3),(2782,2767,'522635','522600','麻江县','贵州省黔东南苗族侗族自治州麻江县',NULL,NULL,'1',3),(2783,2767,'522636','522600','丹寨县','贵州省黔东南苗族侗族自治州丹寨县',NULL,NULL,'1',3),(2784,2699,'522700','520000','黔南','贵州省黔南布依族苗族自治州',NULL,NULL,'1',2),(2785,2784,'522701','522700','都匀市','贵州省黔南布依族苗族自治州都匀市',NULL,NULL,'1',3),(2786,2784,'522702','522700','福泉市','贵州省黔南布依族苗族自治州福泉市',NULL,NULL,'1',3),(2787,2784,'522722','522700','荔波县','贵州省黔南布依族苗族自治州荔波县',NULL,NULL,'1',3),(2788,2784,'522723','522700','贵定县','贵州省黔南布依族苗族自治州贵定县',NULL,NULL,'1',3),(2789,2784,'522725','522700','瓮安县','贵州省黔南布依族苗族自治州瓮安县',NULL,NULL,'1',3),(2790,2784,'522726','522700','独山县','贵州省黔南布依族苗族自治州独山县',NULL,NULL,'1',3),(2791,2784,'522727','522700','平塘县','贵州省黔南布依族苗族自治州平塘县',NULL,NULL,'1',3),(2792,2784,'522728','522700','罗甸县','贵州省黔南布依族苗族自治州罗甸县',NULL,NULL,'1',3),(2793,2784,'522729','522700','长顺县','贵州省黔南布依族苗族自治州长顺县',NULL,NULL,'1',3),(2794,2784,'522730','522700','龙里县','贵州省黔南布依族苗族自治州龙里县',NULL,NULL,'1',3),(2795,2784,'522731','522700','惠水县','贵州省黔南布依族苗族自治州惠水县',NULL,NULL,'1',3),(2796,2784,'522732','522700','三都县','贵州省黔南布依族苗族自治州三都水族自治县',NULL,NULL,'1',3),(2797,1,'530000','86','云南省',NULL,NULL,NULL,'1',1),(2798,2797,'530100','530000','昆明市',NULL,NULL,NULL,'1',2),(2799,2798,'530101','530100','市辖区',NULL,NULL,NULL,'0',3),(2800,2798,'530102','530100','五华区',NULL,NULL,NULL,'1',3),(2801,2798,'530103','530100','盘龙区',NULL,NULL,NULL,'1',3),(2802,2798,'530111','530100','官渡区',NULL,NULL,NULL,'1',3),(2803,2798,'530112','530100','西山区',NULL,NULL,NULL,'1',3),(2804,2798,'530113','530100','东川区',NULL,NULL,NULL,'1',3),(2805,2798,'530121','530100','呈贡县',NULL,NULL,NULL,'1',3),(2806,2798,'530122','530100','晋宁县',NULL,NULL,NULL,'1',3),(2807,2798,'530124','530100','富民县',NULL,NULL,NULL,'1',3),(2808,2798,'530125','530100','宜良县',NULL,NULL,NULL,'1',3),(2809,2798,'530126','530100','石林县',NULL,NULL,NULL,'1',3),(2810,2798,'530127','530100','嵩明县',NULL,NULL,NULL,'1',3),(2811,2798,'530128','530100','禄劝县',NULL,NULL,NULL,'1',3),(2812,2798,'530129','530100','寻甸县',NULL,NULL,NULL,'1',3),(2813,2798,'530181','530100','安宁市',NULL,NULL,NULL,'1',3),(2814,2797,'530300','530000','曲靖市',NULL,NULL,NULL,'1',2),(2815,2814,'530301','530300','市辖区',NULL,NULL,NULL,'0',3),(2816,2814,'530302','530300','麒麟区',NULL,NULL,NULL,'1',3),(2817,2814,'530321','530300','马龙县',NULL,NULL,NULL,'1',3),(2818,2814,'530322','530300','陆良县',NULL,NULL,NULL,'1',3),(2819,2814,'530323','530300','师宗县',NULL,NULL,NULL,'1',3),(2820,2814,'530324','530300','罗平县',NULL,NULL,NULL,'1',3),(2821,2814,'530325','530300','富源县',NULL,NULL,NULL,'1',3),(2822,2814,'530326','530300','会泽县',NULL,NULL,NULL,'1',3),(2823,2814,'530328','530300','沾益县',NULL,NULL,NULL,'1',3),(2824,2814,'530381','530300','宣威市',NULL,NULL,NULL,'1',3),(2825,2797,'530400','530000','玉溪市',NULL,NULL,NULL,'1',2),(2826,2825,'530401','530400','市辖区',NULL,NULL,NULL,'0',3),(2827,2825,'530402','530400','红塔区',NULL,NULL,NULL,'1',3),(2828,2825,'530421','530400','江川县',NULL,NULL,NULL,'1',3),(2829,2825,'530422','530400','澄江县',NULL,NULL,NULL,'1',3),(2830,2825,'530423','530400','通海县',NULL,NULL,NULL,'1',3),(2831,2825,'530424','530400','华宁县',NULL,NULL,NULL,'1',3),(2832,2825,'530425','530400','易门县',NULL,NULL,NULL,'1',3),(2833,2825,'530426','530400','峨山县',NULL,NULL,NULL,'1',3),(2834,2825,'530427','530400','新平县',NULL,NULL,NULL,'1',3),(2835,2825,'530428','530400','元江县',NULL,NULL,NULL,'1',3),(2836,2797,'530500','530000','保山市',NULL,NULL,NULL,'1',2),(2837,2836,'530501','530500','市辖区',NULL,NULL,NULL,'0',3),(2838,2836,'530502','530500','隆阳区',NULL,NULL,NULL,'1',3),(2839,2836,'530521','530500','施甸县',NULL,NULL,NULL,'1',3),(2840,2836,'530522','530500','腾冲县',NULL,NULL,NULL,'1',3),(2841,2836,'530523','530500','龙陵县',NULL,NULL,NULL,'1',3),(2842,2836,'530524','530500','昌宁县',NULL,NULL,NULL,'1',3),(2843,2797,'530600','530000','昭通市',NULL,NULL,NULL,'1',2),(2844,2843,'530601','530600','市辖区',NULL,NULL,NULL,'0',3),(2845,2843,'530602','530600','昭阳区',NULL,NULL,NULL,'1',3),(2846,2843,'530621','530600','鲁甸县',NULL,NULL,NULL,'1',3),(2847,2843,'530622','530600','巧家县',NULL,NULL,NULL,'1',3),(2848,2843,'530623','530600','盐津县',NULL,NULL,NULL,'1',3),(2849,2843,'530624','530600','大关县',NULL,NULL,NULL,'1',3),(2850,2843,'530625','530600','永善县',NULL,NULL,NULL,'1',3),(2851,2843,'530626','530600','绥江县',NULL,NULL,NULL,'1',3),(2852,2843,'530627','530600','镇雄县',NULL,NULL,NULL,'1',3),(2853,2843,'530628','530600','彝良县',NULL,NULL,NULL,'1',3),(2854,2843,'530629','530600','威信县',NULL,NULL,NULL,'1',3),(2855,2843,'530630','530600','水富县',NULL,NULL,NULL,'1',3),(2856,2797,'530700','530000','丽江市',NULL,NULL,NULL,'1',2),(2857,2856,'530701','530700','市辖区',NULL,NULL,NULL,'0',3),(2858,2856,'530702','530700','古城区',NULL,NULL,NULL,'1',3),(2859,2856,'530721','530700','玉龙县',NULL,NULL,NULL,'1',3),(2860,2856,'530722','530700','永胜县',NULL,NULL,NULL,'1',3),(2861,2856,'530723','530700','华坪县',NULL,NULL,NULL,'1',3),(2862,2856,'530724','530700','宁蒗县',NULL,NULL,NULL,'1',3),(2863,2797,'530800','530000','普洱市',NULL,NULL,NULL,'1',2),(2864,2863,'530801','530800','市辖区',NULL,NULL,NULL,'0',3),(2865,2863,'530802','530800','思茅区',NULL,NULL,NULL,'1',3),(2866,2863,'530821','530800','宁洱县',NULL,NULL,NULL,'1',3),(2867,2863,'530822','530800','墨江县',NULL,NULL,NULL,'1',3),(2868,2863,'530823','530800','景东县',NULL,NULL,NULL,'1',3),(2869,2863,'530824','530800','景谷县',NULL,NULL,NULL,'1',3),(2870,2863,'530825','530800','镇沅县',NULL,NULL,NULL,'1',3),(2871,2863,'530826','530800','江城县',NULL,NULL,NULL,'1',3),(2872,2863,'530827','530800','孟连县',NULL,NULL,NULL,'1',3),(2873,2863,'530828','530800','澜沧县',NULL,NULL,NULL,'1',3),(2874,2863,'530829','530800','西盟县',NULL,NULL,NULL,'1',3),(2875,2797,'530900','530000','临沧市',NULL,NULL,NULL,'1',2),(2876,2875,'530901','530900','市辖区',NULL,NULL,NULL,'0',3),(2877,2875,'530902','530900','临翔区',NULL,NULL,NULL,'1',3),(2878,2875,'530921','530900','凤庆县',NULL,NULL,NULL,'1',3),(2879,2875,'530922','530900','云县',NULL,NULL,NULL,'1',3),(2880,2875,'530923','530900','永德县',NULL,NULL,NULL,'1',3),(2881,2875,'530924','530900','镇康县',NULL,NULL,NULL,'1',3),(2882,2875,'530925','530900','双江县',NULL,NULL,NULL,'1',3),(2883,2875,'530926','530900','耿马县',NULL,NULL,NULL,'1',3),(2884,2875,'530927','530900','沧源县',NULL,NULL,NULL,'1',3),(2885,2797,'532300','530000','楚雄州',NULL,NULL,NULL,'1',2),(2886,2885,'532301','532300','楚雄市',NULL,NULL,NULL,'1',3),(2887,2885,'532322','532300','双柏县',NULL,NULL,NULL,'1',3),(2888,2885,'532323','532300','牟定县',NULL,NULL,NULL,'1',3),(2889,2885,'532324','532300','南华县',NULL,NULL,NULL,'1',3),(2890,2885,'532325','532300','姚安县',NULL,NULL,NULL,'1',3),(2891,2885,'532326','532300','大姚县',NULL,NULL,NULL,'1',3),(2892,2885,'532327','532300','永仁县',NULL,NULL,NULL,'1',3),(2893,2885,'532328','532300','元谋县',NULL,NULL,NULL,'1',3),(2894,2885,'532329','532300','武定县',NULL,NULL,NULL,'1',3),(2895,2885,'532331','532300','禄丰县',NULL,NULL,NULL,'1',3),(2896,2797,'532500','530000','红河州',NULL,NULL,NULL,'1',2),(2897,2896,'532501','532500','个旧市',NULL,NULL,NULL,'1',3),(2898,2896,'532502','532500','开远市',NULL,NULL,NULL,'1',3),(2899,2896,'532522','532500','蒙自县',NULL,NULL,NULL,'1',3),(2900,2896,'532523','532500','屏边县',NULL,NULL,NULL,'1',3),(2901,2896,'532524','532500','建水县',NULL,NULL,NULL,'1',3),(2902,2896,'532525','532500','石屏县',NULL,NULL,NULL,'1',3),(2903,2896,'532526','532500','弥勒县',NULL,NULL,NULL,'1',3),(2904,2896,'532527','532500','泸西县',NULL,NULL,NULL,'1',3),(2905,2896,'532528','532500','元阳县',NULL,NULL,NULL,'1',3),(2906,2896,'532529','532500','红河县',NULL,NULL,NULL,'1',3),(2907,2896,'532530','532500','金平县',NULL,NULL,NULL,'1',3),(2908,2896,'532531','532500','绿春县',NULL,NULL,NULL,'1',3),(2909,2896,'532532','532500','河口县',NULL,NULL,NULL,'1',3),(2910,2797,'532600','530000','文山州',NULL,NULL,NULL,'1',2),(2911,2910,'532621','532600','文山县',NULL,NULL,NULL,'1',3),(2912,2910,'532622','532600','砚山县',NULL,NULL,NULL,'1',3),(2913,2910,'532623','532600','西畴县',NULL,NULL,NULL,'1',3),(2914,2910,'532624','532600','麻栗坡县',NULL,NULL,NULL,'1',3),(2915,2910,'532625','532600','马关县',NULL,NULL,NULL,'1',3),(2916,2910,'532626','532600','丘北县',NULL,NULL,NULL,'1',3),(2917,2910,'532627','532600','广南县',NULL,NULL,NULL,'1',3),(2918,2910,'532628','532600','富宁县',NULL,NULL,NULL,'1',3),(2919,2797,'532800','530000','西双版纳州',NULL,NULL,NULL,'1',2),(2920,2919,'532801','532800','景洪市',NULL,NULL,NULL,'1',3),(2921,2919,'532822','532800','勐海县',NULL,NULL,NULL,'1',3),(2922,2919,'532823','532800','勐腊县',NULL,NULL,NULL,'1',3),(2923,2797,'532900','530000','大理州',NULL,NULL,NULL,'1',2),(2924,2923,'532901','532900','大理市',NULL,NULL,NULL,'1',3),(2925,2923,'532922','532900','漾濞县',NULL,NULL,NULL,'1',3),(2926,2923,'532923','532900','祥云县',NULL,NULL,NULL,'1',3),(2927,2923,'532924','532900','宾川县',NULL,NULL,NULL,'1',3),(2928,2923,'532925','532900','弥渡县',NULL,NULL,NULL,'1',3),(2929,2923,'532926','532900','南涧县',NULL,NULL,NULL,'1',3),(2930,2923,'532927','532900','巍山县',NULL,NULL,NULL,'1',3),(2931,2923,'532928','532900','永平县',NULL,NULL,NULL,'1',3),(2932,2923,'532929','532900','云龙县',NULL,NULL,NULL,'1',3),(2933,2923,'532930','532900','洱源县',NULL,NULL,NULL,'1',3),(2934,2923,'532931','532900','剑川县',NULL,NULL,NULL,'1',3),(2935,2923,'532932','532900','鹤庆县',NULL,NULL,NULL,'1',3),(2936,2797,'533100','530000','德宏州',NULL,NULL,NULL,'1',2),(2937,2936,'533102','533100','瑞丽市',NULL,NULL,NULL,'1',3),(2938,2936,'533103','533100','潞西市',NULL,NULL,NULL,'1',3),(2939,2936,'533122','533100','梁河县',NULL,NULL,NULL,'1',3),(2940,2936,'533123','533100','盈江县',NULL,NULL,NULL,'1',3),(2941,2936,'533124','533100','陇川县',NULL,NULL,NULL,'1',3),(2942,2797,'533300','530000','怒江州',NULL,NULL,NULL,'1',2),(2943,2942,'533321','533300','泸水县',NULL,NULL,NULL,'1',3),(2944,2942,'533323','533300','福贡县',NULL,NULL,NULL,'1',3),(2945,2942,'533324','533300','贡山县',NULL,NULL,NULL,'1',3),(2946,2942,'533325','533300','兰坪县',NULL,NULL,NULL,'1',3),(2947,2797,'533400','530000','迪庆州',NULL,NULL,NULL,'1',2),(2948,2947,'533421','533400','香格里拉县',NULL,NULL,NULL,'1',3),(2949,2947,'533422','533400','德钦县',NULL,NULL,NULL,'1',3),(2950,2947,'533423','533400','维西县',NULL,NULL,NULL,'1',3),(2951,1,'540000','86','西藏自治区','西藏自治区',NULL,NULL,'1',1),(2952,2951,'540100','540000','拉萨市','西藏自治区拉萨市',NULL,NULL,'1',2),(2953,2952,'540101','540100','市辖区','西藏自治区拉萨市市辖区',NULL,NULL,'0',3),(2954,2952,'540102','540100','城关区','西藏自治区拉萨市城关区',NULL,NULL,'1',3),(2955,2952,'540121','540100','林周县','西藏自治区拉萨市林周县',NULL,NULL,'1',3),(2956,2952,'540122','540100','当雄县','西藏自治区拉萨市当雄县',NULL,NULL,'1',3),(2957,2952,'540123','540100','尼木县','西藏自治区拉萨市尼木县',NULL,NULL,'1',3),(2958,2952,'540124','540100','曲水县','西藏自治区拉萨市曲水县',NULL,NULL,'1',3),(2959,2952,'540125','540100','堆龙德庆县','西藏自治区拉萨市堆龙德庆县',NULL,NULL,'1',3),(2960,2952,'540126','540100','达孜县','西藏自治区拉萨市达孜县',NULL,NULL,'1',3),(2961,2952,'540127','540100','墨竹工卡县','西藏自治区拉萨市墨竹工卡县',NULL,NULL,'1',3),(2962,2951,'542100','540000','昌都地区','西藏自治区昌都地区',NULL,NULL,'1',2),(2963,2962,'542121','542100','昌都县','西藏自治区昌都地区昌都县',NULL,NULL,'1',3),(2964,2962,'542122','542100','江达县','西藏自治区昌都地区江达县',NULL,NULL,'1',3),(2965,2962,'542123','542100','贡觉县','西藏自治区昌都地区贡觉县',NULL,NULL,'1',3),(2966,2962,'542124','542100','类乌齐县','西藏自治区昌都地区类乌齐县',NULL,NULL,'1',3),(2967,2962,'542125','542100','丁青县','西藏自治区昌都地区丁青县',NULL,NULL,'1',3),(2968,2962,'542126','542100','察雅县','西藏自治区昌都地区察雅县',NULL,NULL,'1',3),(2969,2962,'542127','542100','八宿县','西藏自治区昌都地区八宿县',NULL,NULL,'1',3),(2970,2962,'542128','542100','左贡县','西藏自治区昌都地区左贡县',NULL,NULL,'1',3),(2971,2962,'542129','542100','芒康县','西藏自治区昌都地区芒康县',NULL,NULL,'1',3),(2972,2962,'542132','542100','洛隆县','西藏自治区昌都地区洛隆县',NULL,NULL,'1',3),(2973,2962,'542133','542100','边坝县','西藏自治区昌都地区边坝县',NULL,NULL,'1',3),(2974,2962,'542134','542100','盐井县','西藏自治区昌都地区盐井县',NULL,NULL,'1',3),(2975,2962,'542135','542100','碧土县','西藏自治区昌都地区碧土县',NULL,NULL,'1',3),(2976,2962,'542136','542100','妥坝县','西藏自治区昌都地区妥坝县',NULL,NULL,'1',3),(2977,2962,'542137','542100','生达县','西藏自治区昌都地区生达县',NULL,NULL,'1',3),(2978,2951,'542200','540000','山南地区','西藏自治区山南地区',NULL,NULL,'1',2),(2979,2978,'542221','542200','乃东县','西藏自治区山南地区乃东县',NULL,NULL,'1',3),(2980,2978,'542222','542200','扎囊县','西藏自治区山南地区扎囊县',NULL,NULL,'1',3),(2981,2978,'542223','542200','贡嘎县','西藏自治区山南地区贡嘎县',NULL,NULL,'1',3),(2982,2978,'542224','542200','桑日县','西藏自治区山南地区桑日县',NULL,NULL,'1',3),(2983,2978,'542225','542200','琼结县','西藏自治区山南地区琼结县',NULL,NULL,'1',3),(2984,2978,'542226','542200','曲松县','西藏自治区山南地区曲松县',NULL,NULL,'1',3),(2985,2978,'542227','542200','措美县','西藏自治区山南地区措美县',NULL,NULL,'1',3),(2986,2978,'542228','542200','洛扎县','西藏自治区山南地区洛扎县',NULL,NULL,'1',3),(2987,2978,'542229','542200','加查县','西藏自治区山南地区加查县',NULL,NULL,'1',3),(2988,2978,'542231','542200','隆子县','西藏自治区山南地区隆子县',NULL,NULL,'1',3),(2989,2978,'542232','542200','错那县','西藏自治区山南地区错那县',NULL,NULL,'1',3),(2990,2978,'542233','542200','浪卡子县','西藏自治区山南地区浪卡子县',NULL,NULL,'1',3),(2991,2951,'542300','540000','日喀则地区','西藏自治区日喀则地区',NULL,NULL,'1',2),(2992,2991,'542301','542300','日喀则市','西藏自治区日喀则地区日喀则市',NULL,NULL,'1',3),(2993,2991,'542322','542300','南木林县','西藏自治区日喀则地区南木林县',NULL,NULL,'1',3),(2994,2991,'542323','542300','江孜县','西藏自治区日喀则地区江孜县',NULL,NULL,'1',3),(2995,2991,'542324','542300','定日县','西藏自治区日喀则地区定日县',NULL,NULL,'1',3),(2996,2991,'542325','542300','萨迦县','西藏自治区日喀则地区萨迦县',NULL,NULL,'1',3),(2997,2991,'542326','542300','拉孜县','西藏自治区日喀则地区拉孜县',NULL,NULL,'1',3),(2998,2991,'542327','542300','昂仁县','西藏自治区日喀则地区昂仁县',NULL,NULL,'1',3),(2999,2991,'542328','542300','谢通门县','西藏自治区日喀则地区谢通门县',NULL,NULL,'1',3),(3000,2991,'542329','542300','白朗县','西藏自治区日喀则地区白朗县',NULL,NULL,'1',3),(3001,2991,'542330','542300','仁布县','西藏自治区日喀则地区仁布县',NULL,NULL,'1',3),(3002,2991,'542331','542300','康马县','西藏自治区日喀则地区康马县',NULL,NULL,'1',3),(3003,2991,'542332','542300','定结县','西藏自治区日喀则地区定结县',NULL,NULL,'1',3),(3004,2991,'542333','542300','仲巴县','西藏自治区日喀则地区仲巴县',NULL,NULL,'1',3),(3005,2991,'542334','542300','亚东县','西藏自治区日喀则地区亚东县',NULL,NULL,'1',3),(3006,2991,'542335','542300','吉隆县','西藏自治区日喀则地区吉隆县',NULL,NULL,'1',3),(3007,2991,'542336','542300','聂拉木县','西藏自治区日喀则地区聂拉木县',NULL,NULL,'1',3),(3008,2991,'542337','542300','萨嘎县','西藏自治区日喀则地区萨嘎县',NULL,NULL,'1',3),(3009,2991,'542338','542300','岗巴县','西藏自治区日喀则地区岗巴县',NULL,NULL,'1',3),(3010,2951,'542400','540000','那曲地区','西藏自治区那曲地区',NULL,NULL,'1',2),(3011,3010,'542421','542400','那曲县','西藏自治区那曲地区那曲县',NULL,NULL,'1',3),(3012,3010,'542422','542400','嘉黎县','西藏自治区那曲地区嘉黎县',NULL,NULL,'1',3),(3013,3010,'542423','542400','比如县','西藏自治区那曲地区比如县',NULL,NULL,'1',3),(3014,3010,'542424','542400','聂荣县','西藏自治区那曲地区聂荣县',NULL,NULL,'1',3),(3015,3010,'542425','542400','安多县','西藏自治区那曲地区安多县',NULL,NULL,'1',3),(3016,3010,'542426','542400','申扎县','西藏自治区那曲地区申扎县',NULL,NULL,'1',3),(3017,3010,'542427','542400','索县','西藏自治区那曲地区索县',NULL,NULL,'1',3),(3018,3010,'542428','542400','班戈县','西藏自治区那曲地区班戈县',NULL,NULL,'1',3),(3019,3010,'542429','542400','巴青县','西藏自治区那曲地区巴青县',NULL,NULL,'1',3),(3020,3010,'542430','542400','尼玛县','西藏自治区那曲地区尼玛县',NULL,NULL,'1',3),(3021,2951,'542500','540000','阿里地区','西藏自治区阿里地区',NULL,NULL,'1',2),(3022,3021,'542521','542500','普兰县','西藏自治区阿里地区普兰县',NULL,NULL,'1',3),(3023,3021,'542522','542500','札达县','西藏自治区阿里地区札达县',NULL,NULL,'1',3),(3024,3021,'542523','542500','噶尔县','西藏自治区阿里地区噶尔县',NULL,NULL,'1',3),(3025,3021,'542524','542500','日土县','西藏自治区阿里地区日土县',NULL,NULL,'1',3),(3026,3021,'542525','542500','革吉县','西藏自治区阿里地区革吉县',NULL,NULL,'1',3),(3027,3021,'542526','542500','改则县','西藏自治区阿里地区改则县',NULL,NULL,'1',3),(3028,3021,'542527','542500','措勤县','西藏自治区阿里地区措勤县',NULL,NULL,'1',3),(3029,3021,'542528','542500','隆格尔县','西藏自治区阿里地区隆格尔县',NULL,NULL,'1',3),(3030,2951,'542600','540000','林芝地区','西藏自治区林芝地区',NULL,NULL,'1',2),(3031,3030,'542621','542600','林芝县','西藏自治区林芝地区林芝县',NULL,NULL,'1',3),(3032,3030,'542622','542600','工布江达县','西藏自治区林芝地区工布江达县',NULL,NULL,'1',3),(3033,3030,'542623','542600','米林县','西藏自治区林芝地区米林县',NULL,NULL,'1',3),(3034,3030,'542624','542600','墨脱县','西藏自治区林芝地区墨脱县',NULL,NULL,'1',3),(3035,3030,'542625','542600','波密县','西藏自治区林芝地区波密县',NULL,NULL,'1',3),(3036,3030,'542626','542600','察隅县','西藏自治区林芝地区察隅县',NULL,NULL,'1',3),(3037,3030,'542627','542600','朗县','西藏自治区林芝地区朗县',NULL,NULL,'1',3),(3038,1,'610000','86','陕西省','陕西省',NULL,NULL,'1',1),(3039,3038,'610100','610000','西安市','陕西省西安市',NULL,NULL,'1',2),(3040,3039,'610101','610100','市辖区','陕西省西安市市辖区',NULL,NULL,'0',3),(3041,3039,'610102','610100','新城区','陕西省西安市新城区',NULL,NULL,'1',3),(3042,3039,'610103','610100','碑林区','陕西省西安市碑林区',NULL,NULL,'1',3),(3043,3039,'610104','610100','莲湖区','陕西省西安市莲湖区',NULL,NULL,'1',3),(3044,3039,'610111','610100','灞桥区','陕西省西安市灞桥区',NULL,NULL,'1',3),(3045,3039,'610112','610100','未央区','陕西省西安市未央区',NULL,NULL,'1',3),(3046,3039,'610113','610100','雁塔区','陕西省西安市雁塔区',NULL,NULL,'1',3),(3047,3039,'610114','610100','阎良区','陕西省西安市阎良区',NULL,NULL,'1',3),(3048,3039,'610115','610100','临潼区','陕西省西安市临潼区',NULL,NULL,'1',3),(3049,3039,'610121','610100','长安县','陕西省西安市长安县',NULL,NULL,'1',3),(3050,3039,'610122','610100','蓝田县','陕西省西安市蓝田县',NULL,NULL,'1',3),(3051,3039,'610124','610100','周至县','陕西省西安市周至县',NULL,NULL,'1',3),(3052,3039,'610125','610100','户县','陕西省西安市户县',NULL,NULL,'1',3),(3053,3039,'610126','610100','高陵县','陕西省西安市高陵县',NULL,NULL,'1',3),(3054,3038,'610200','610000','铜川市','陕西省铜川市',NULL,NULL,'1',2),(3055,3054,'610201','610200','市辖区','陕西省铜川市市辖区',NULL,NULL,'0',3),(3056,3054,'610202','610200','城区','陕西省铜川市城区',NULL,NULL,'1',3),(3057,3054,'610203','610200','郊区','陕西省铜川市郊区',NULL,NULL,'1',3),(3058,3054,'610221','610200','耀县','陕西省铜川市耀县',NULL,NULL,'1',3),(3059,3054,'610222','610200','宜君县','陕西省铜川市宜君县',NULL,NULL,'1',3),(3060,3038,'610300','610000','宝鸡市','陕西省宝鸡市',NULL,NULL,'1',2),(3061,3060,'610301','610300','市辖区','陕西省宝鸡市市辖区',NULL,NULL,'0',3),(3062,3060,'610302','610300','渭滨区','陕西省宝鸡市渭滨区',NULL,NULL,'1',3),(3063,3060,'610303','610300','金台区','陕西省宝鸡市金台区',NULL,NULL,'1',3),(3064,3060,'610321','610300','宝鸡县','陕西省宝鸡市宝鸡县',NULL,NULL,'1',3),(3065,3060,'610322','610300','凤翔县','陕西省宝鸡市凤翔县',NULL,NULL,'1',3),(3066,3060,'610323','610300','岐山县','陕西省宝鸡市岐山县',NULL,NULL,'1',3),(3067,3060,'610324','610300','扶风县','陕西省宝鸡市扶风县',NULL,NULL,'1',3),(3068,3060,'610326','610300','眉县','陕西省宝鸡市眉县',NULL,NULL,'1',3),(3069,3060,'610327','610300','陇县','陕西省宝鸡市陇县',NULL,NULL,'1',3),(3070,3060,'610328','610300','千阳县','陕西省宝鸡市千阳县',NULL,NULL,'1',3),(3071,3060,'610329','610300','麟游县','陕西省宝鸡市麟游县',NULL,NULL,'1',3),(3072,3060,'610330','610300','凤县','陕西省宝鸡市凤县',NULL,NULL,'1',3),(3073,3060,'610331','610300','太白县','陕西省宝鸡市太白县',NULL,NULL,'1',3),(3074,3038,'610400','610000','咸阳市','陕西省咸阳市',NULL,NULL,'1',2),(3075,3074,'610401','610400','市辖区','陕西省咸阳市市辖区',NULL,NULL,'0',3),(3076,3074,'610402','610400','秦都区','陕西省咸阳市秦都区',NULL,NULL,'1',3),(3077,3074,'610403','610400','杨陵区','陕西省咸阳市杨陵区',NULL,NULL,'1',3),(3078,3074,'610404','610400','渭城区','陕西省咸阳市渭城区',NULL,NULL,'1',3),(3079,3074,'610422','610400','三原县','陕西省咸阳市三原县',NULL,NULL,'1',3),(3080,3074,'610423','610400','泾阳县','陕西省咸阳市泾阳县',NULL,NULL,'1',3),(3081,3074,'610424','610400','乾县','陕西省咸阳市乾县',NULL,NULL,'1',3),(3082,3074,'610425','610400','礼泉县','陕西省咸阳市礼泉县',NULL,NULL,'1',3),(3083,3074,'610426','610400','永寿县','陕西省咸阳市永寿县',NULL,NULL,'1',3),(3084,3074,'610427','610400','彬县','陕西省咸阳市彬县',NULL,NULL,'1',3),(3085,3074,'610428','610400','长武县','陕西省咸阳市长武县',NULL,NULL,'1',3),(3086,3074,'610429','610400','旬邑县','陕西省咸阳市旬邑县',NULL,NULL,'1',3),(3087,3074,'610430','610400','淳化县','陕西省咸阳市淳化县',NULL,NULL,'1',3),(3088,3074,'610431','610400','武功县','陕西省咸阳市武功县',NULL,NULL,'1',3),(3089,3074,'610481','610400','兴平市','陕西省咸阳市兴平市',NULL,NULL,'1',3),(3090,3038,'610500','610000','渭南市','陕西省渭南市',NULL,NULL,'1',2),(3091,3090,'610501','610500','市辖区','陕西省渭南市市辖区',NULL,NULL,'0',3),(3092,3090,'610502','610500','临渭区','陕西省渭南市临渭区',NULL,NULL,'1',3),(3093,3090,'610521','610500','华县','陕西省渭南市华县',NULL,NULL,'1',3),(3094,3090,'610522','610500','潼关县','陕西省渭南市潼关县',NULL,NULL,'1',3),(3095,3090,'610523','610500','大荔县','陕西省渭南市大荔县',NULL,NULL,'1',3),(3096,3090,'610524','610500','合阳县','陕西省渭南市合阳县',NULL,NULL,'1',3),(3097,3090,'610525','610500','澄城县','陕西省渭南市澄城县',NULL,NULL,'1',3),(3098,3090,'610526','610500','蒲城县','陕西省渭南市蒲城县',NULL,NULL,'1',3),(3099,3090,'610527','610500','白水县','陕西省渭南市白水县',NULL,NULL,'1',3),(3100,3090,'610528','610500','富平县','陕西省渭南市富平县',NULL,NULL,'1',3),(3101,3090,'610581','610500','韩城市','陕西省渭南市韩城市',NULL,NULL,'1',3),(3102,3090,'610582','610500','华阴市','陕西省渭南市华阴市',NULL,NULL,'1',3),(3103,3038,'610600','610000','延安市','陕西省延安市',NULL,NULL,'1',2),(3104,3103,'610601','610600','市辖区','陕西省延安市市辖区',NULL,NULL,'0',3),(3105,3103,'610602','610600','宝塔区','陕西省延安市宝塔区',NULL,NULL,'1',3),(3106,3103,'610621','610600','延长县','陕西省延安市延长县',NULL,NULL,'1',3),(3107,3103,'610622','610600','延川县','陕西省延安市延川县',NULL,NULL,'1',3),(3108,3103,'610623','610600','子长县','陕西省延安市子长县',NULL,NULL,'1',3),(3109,3103,'610624','610600','安塞县','陕西省延安市安塞县',NULL,NULL,'1',3),(3110,3103,'610625','610600','志丹县','陕西省延安市志丹县',NULL,NULL,'1',3),(3111,3103,'610626','610600','吴旗县','陕西省延安市吴旗县',NULL,NULL,'1',3),(3112,3103,'610627','610600','甘泉县','陕西省延安市甘泉县',NULL,NULL,'1',3),(3113,3103,'610628','610600','富县','陕西省延安市富县',NULL,NULL,'1',3),(3114,3103,'610629','610600','洛川县','陕西省延安市洛川县',NULL,NULL,'1',3),(3115,3103,'610630','610600','宜川县','陕西省延安市宜川县',NULL,NULL,'1',3),(3116,3103,'610631','610600','黄龙县','陕西省延安市黄龙县',NULL,NULL,'1',3),(3117,3103,'610632','610600','黄陵县','陕西省延安市黄陵县',NULL,NULL,'1',3),(3118,3038,'610700','610000','汉中市','陕西省汉中市',NULL,NULL,'1',2),(3119,3118,'610701','610700','市辖区','陕西省汉中市市辖区',NULL,NULL,'0',3),(3120,3118,'610702','610700','汉台区','陕西省汉中市汉台区',NULL,NULL,'1',3),(3121,3118,'610721','610700','南郑县','陕西省汉中市南郑县',NULL,NULL,'1',3),(3122,3118,'610722','610700','城固县','陕西省汉中市城固县',NULL,NULL,'1',3),(3123,3118,'610723','610700','洋县','陕西省汉中市洋县',NULL,NULL,'1',3),(3124,3118,'610724','610700','西乡县','陕西省汉中市西乡县',NULL,NULL,'1',3),(3125,3118,'610725','610700','勉县','陕西省汉中市勉县',NULL,NULL,'1',3),(3126,3118,'610726','610700','宁强县','陕西省汉中市宁强县',NULL,NULL,'1',3),(3127,3118,'610727','610700','略阳县','陕西省汉中市略阳县',NULL,NULL,'1',3),(3128,3118,'610728','610700','镇巴县','陕西省汉中市镇巴县',NULL,NULL,'1',3),(3129,3118,'610729','610700','留坝县','陕西省汉中市留坝县',NULL,NULL,'1',3),(3130,3118,'610730','610700','佛坪县','陕西省汉中市佛坪县',NULL,NULL,'1',3),(3131,3038,'612400','610000','安康地区','陕西省安康地区',NULL,NULL,'1',2),(3132,3131,'612401','612400','安康市','陕西省安康地区安康市',NULL,NULL,'1',3),(3133,3131,'612422','612400','汉阴县','陕西省安康地区汉阴县',NULL,NULL,'1',3),(3134,3131,'612423','612400','石泉县','陕西省安康地区石泉县',NULL,NULL,'1',3),(3135,3131,'612424','612400','宁陕县','陕西省安康地区宁陕县',NULL,NULL,'1',3),(3136,3131,'612425','612400','紫阳县','陕西省安康地区紫阳县',NULL,NULL,'1',3),(3137,3131,'612426','612400','岚皋县','陕西省安康地区岚皋县',NULL,NULL,'1',3),(3138,3131,'612427','612400','平利县','陕西省安康地区平利县',NULL,NULL,'1',3),(3139,3131,'612428','612400','镇坪县','陕西省安康地区镇坪县',NULL,NULL,'1',3),(3140,3131,'612429','612400','旬阳县','陕西省安康地区旬阳县',NULL,NULL,'1',3),(3141,3131,'612430','612400','白河县','陕西省安康地区白河县',NULL,NULL,'1',3),(3142,3038,'612500','610000','商洛地区','陕西省商洛地区',NULL,NULL,'1',2),(3143,3142,'612501','612500','商州市','陕西省商洛地区商州市',NULL,NULL,'1',3),(3144,3142,'612522','612500','洛南县','陕西省商洛地区洛南县',NULL,NULL,'1',3),(3145,3142,'612523','612500','丹凤县','陕西省商洛地区丹凤县',NULL,NULL,'1',3),(3146,3142,'612524','612500','商南县','陕西省商洛地区商南县',NULL,NULL,'1',3),(3147,3142,'612525','612500','山阳县','陕西省商洛地区山阳县',NULL,NULL,'1',3),(3148,3142,'612526','612500','镇安县','陕西省商洛地区镇安县',NULL,NULL,'1',3),(3149,3142,'612527','612500','柞水县','陕西省商洛地区柞水县',NULL,NULL,'1',3),(3150,3038,'612700','610000','榆林地区','陕西省榆林地区',NULL,NULL,'1',2),(3151,3150,'612701','612700','榆林市','陕西省榆林地区榆林市',NULL,NULL,'1',3),(3152,3150,'612722','612700','神木县','陕西省榆林地区神木县',NULL,NULL,'1',3),(3153,3150,'612723','612700','府谷县','陕西省榆林地区府谷县',NULL,NULL,'1',3),(3154,3150,'612724','612700','横山县','陕西省榆林地区横山县',NULL,NULL,'1',3),(3155,3150,'612725','612700','靖边县','陕西省榆林地区靖边县',NULL,NULL,'1',3),(3156,3150,'612726','612700','定边县','陕西省榆林地区定边县',NULL,NULL,'1',3),(3157,3150,'612727','612700','绥德县','陕西省榆林地区绥德县',NULL,NULL,'1',3),(3158,3150,'612728','612700','米脂县','陕西省榆林地区米脂县',NULL,NULL,'1',3),(3159,3150,'612729','612700','佳县','陕西省榆林地区佳县',NULL,NULL,'1',3),(3160,3150,'612730','612700','吴堡县','陕西省榆林地区吴堡县',NULL,NULL,'1',3),(3161,3150,'612731','612700','清涧县','陕西省榆林地区清涧县',NULL,NULL,'1',3),(3162,3150,'612732','612700','子洲县','陕西省榆林地区子洲县',NULL,NULL,'1',3),(3163,1,'620000','86','甘肃省','甘肃省',NULL,NULL,'1',1),(3164,3163,'620100','620000','兰州市','甘肃省兰州市',NULL,NULL,'1',2),(3165,3164,'620101','620100','市辖区','甘肃省兰州市市辖区',NULL,NULL,'0',3),(3166,3164,'620102','620100','城关区','甘肃省兰州市城关区',NULL,NULL,'1',3),(3167,3164,'620103','620100','七里河区','甘肃省兰州市七里河区',NULL,NULL,'1',3),(3168,3164,'620104','620100','西固区','甘肃省兰州市西固区',NULL,NULL,'1',3),(3169,3164,'620105','620100','安宁区','甘肃省兰州市安宁区',NULL,NULL,'1',3),(3170,3164,'620111','620100','红古区','甘肃省兰州市红古区',NULL,NULL,'1',3),(3171,3164,'620121','620100','永登县','甘肃省兰州市永登县',NULL,NULL,'1',3),(3172,3164,'620122','620100','皋兰县','甘肃省兰州市皋兰县',NULL,NULL,'1',3),(3173,3164,'620123','620100','榆中县','甘肃省兰州市榆中县',NULL,NULL,'1',3),(3174,3163,'620200','620000','嘉峪关市','甘肃省嘉峪关市',NULL,NULL,'1',2),(3175,3174,'620201','620200','市辖区','甘肃省嘉峪关市市辖区',NULL,NULL,'0',3),(3176,3163,'620300','620000','金昌市','甘肃省嘉峪关市金昌市',NULL,NULL,'1',2),(3177,3176,'620301','620300','市辖区','甘肃省嘉峪关市市辖区',NULL,NULL,'0',3),(3178,3176,'620302','620300','金川区','甘肃省嘉峪关市金川区',NULL,NULL,'1',3),(3179,3176,'620321','620300','永昌县','甘肃省嘉峪关市永昌县',NULL,NULL,'1',3),(3180,3163,'620400','620000','白银市','甘肃省白银市',NULL,NULL,'1',2),(3181,3180,'620401','620400','市辖区','甘肃省白银市市辖区',NULL,NULL,'0',3),(3182,3180,'620402','620400','白银区','甘肃省白银市白银区',NULL,NULL,'1',3),(3183,3180,'620403','620400','平川区','甘肃省白银市平川区',NULL,NULL,'1',3),(3184,3180,'620421','620400','靖远县','甘肃省白银市靖远县',NULL,NULL,'1',3),(3185,3180,'620422','620400','会宁县','甘肃省白银市会宁县',NULL,NULL,'1',3),(3186,3180,'620423','620400','景泰县','甘肃省白银市景泰县',NULL,NULL,'1',3),(3187,3163,'620500','620000','天水市','甘肃省天水市',NULL,NULL,'1',2),(3188,3187,'620501','620500','市辖区','甘肃省天水市市辖区',NULL,NULL,'0',3),(3189,3187,'620502','620500','秦城区','甘肃省天水市秦城区',NULL,NULL,'1',3),(3190,3187,'620503','620500','北道区','甘肃省天水市北道区',NULL,NULL,'1',3),(3191,3187,'620521','620500','清水县','甘肃省天水市清水县',NULL,NULL,'1',3),(3192,3187,'620522','620500','秦安县','甘肃省天水市秦安县',NULL,NULL,'1',3),(3193,3187,'620523','620500','甘谷县','甘肃省天水市甘谷县',NULL,NULL,'1',3),(3194,3187,'620524','620500','武山县','甘肃省天水市武山县',NULL,NULL,'1',3),(3195,3187,'620525','620500','张家川县','甘肃省天水市张家川回族自治县',NULL,NULL,'1',3),(3196,3163,'622100','620000','酒泉地区','甘肃省酒泉地区',NULL,NULL,'1',2),(3197,3196,'622101','622100','玉门市','甘肃省酒泉地区玉门市',NULL,NULL,'1',3),(3198,3196,'622102','622100','酒泉市','甘肃省酒泉地区酒泉市',NULL,NULL,'1',3),(3199,3196,'622103','622100','敦煌市','甘肃省酒泉地区敦煌市',NULL,NULL,'1',3),(3200,3196,'622123','622100','金塔县','甘肃省酒泉地区金塔县',NULL,NULL,'1',3),(3201,3196,'622124','622100','肃北县','甘肃省酒泉地区肃北蒙古族自治县',NULL,NULL,'1',3),(3202,3196,'622125','622100','阿克塞县','甘肃省酒泉地区阿克塞哈萨克族自治县',NULL,NULL,'1',3),(3203,3196,'622126','622100','安西县','甘肃省酒泉地区安西县',NULL,NULL,'1',3),(3204,3163,'622200','620000','张掖地区','甘肃省张掖地区',NULL,NULL,'1',2),(3205,3204,'622201','622200','张掖市','甘肃省张掖地区张掖市',NULL,NULL,'1',3),(3206,3204,'622222','622200','肃南县','甘肃省张掖地区肃南裕固族自治县',NULL,NULL,'1',3),(3207,3204,'622223','622200','民乐县','甘肃省张掖地区民乐县',NULL,NULL,'1',3),(3208,3204,'622224','622200','临泽县','甘肃省张掖地区临泽县',NULL,NULL,'1',3),(3209,3204,'622225','622200','高台县','甘肃省张掖地区高台县',NULL,NULL,'1',3),(3210,3204,'622226','622200','山丹县','甘肃省张掖地区山丹县',NULL,NULL,'1',3),(3211,3163,'622300','620000','武威地区','甘肃省武威地区',NULL,NULL,'1',2),(3212,3211,'622301','622300','武威市','甘肃省武威地区武威市',NULL,NULL,'1',3),(3213,3211,'622322','622300','民勤县','甘肃省武威地区民勤县',NULL,NULL,'1',3),(3214,3211,'622323','622300','古浪县','甘肃省武威地区古浪县',NULL,NULL,'1',3),(3215,3211,'622326','622300','天祝县','甘肃省武威地区天祝藏族自治县',NULL,NULL,'1',3),(3216,3163,'622400','620000','定西地区','甘肃省定西地区',NULL,NULL,'1',2),(3217,3216,'622421','622400','定西县','甘肃省定西地区定西县',NULL,NULL,'1',3),(3218,3216,'622424','622400','通渭县','甘肃省定西地区通渭县',NULL,NULL,'1',3),(3219,3216,'622425','622400','陇西县','甘肃省定西地区陇西县',NULL,NULL,'1',3),(3220,3216,'622426','622400','渭源县','甘肃省定西地区渭源县',NULL,NULL,'1',3),(3221,3216,'622427','622400','临洮县','甘肃省定西地区临洮县',NULL,NULL,'1',3),(3222,3216,'622428','622400','漳县','甘肃省定西地区漳县',NULL,NULL,'1',3),(3223,3216,'622429','622400','岷县','甘肃省定西地区岷县',NULL,NULL,'1',3),(3224,3163,'622600','620000','陇南地区','甘肃省陇南地区',NULL,NULL,'1',2),(3225,3224,'622621','622600','武都县','甘肃省陇南地区武都县',NULL,NULL,'1',3),(3226,3224,'622623','622600','宕昌县','甘肃省陇南地区宕昌县',NULL,NULL,'1',3),(3227,3224,'622624','622600','成县','甘肃省陇南地区成县',NULL,NULL,'1',3),(3228,3224,'622625','622600','康县','甘肃省陇南地区康县',NULL,NULL,'1',3),(3229,3224,'622626','622600','文县','甘肃省陇南地区文县',NULL,NULL,'1',3),(3230,3224,'622627','622600','西和县','甘肃省陇南地区西和县',NULL,NULL,'1',3),(3231,3224,'622628','622600','礼县','甘肃省陇南地区礼县',NULL,NULL,'1',3),(3232,3224,'622629','622600','两当县','甘肃省陇南地区两当县',NULL,NULL,'1',3),(3233,3224,'622630','622600','徽县','甘肃省陇南地区徽县',NULL,NULL,'1',3),(3234,3163,'622700','620000','平凉地区','甘肃省平凉地区',NULL,NULL,'1',2),(3235,3234,'622701','622700','平凉市','甘肃省平凉地区平凉市',NULL,NULL,'1',3),(3236,3234,'622722','622700','泾川县','甘肃省平凉地区泾川县',NULL,NULL,'1',3),(3237,3234,'622723','622700','灵台县','甘肃省平凉地区灵台县',NULL,NULL,'1',3),(3238,3234,'622724','622700','崇信县','甘肃省平凉地区崇信县',NULL,NULL,'1',3),(3239,3234,'622725','622700','华亭县','甘肃省平凉地区华亭县',NULL,NULL,'1',3),(3240,3234,'622726','622700','庄浪县','甘肃省平凉地区庄浪县',NULL,NULL,'1',3),(3241,3234,'622727','622700','静宁县','甘肃省平凉地区静宁县',NULL,NULL,'1',3),(3242,3163,'622800','620000','庆阳地区','甘肃省庆阳地区',NULL,NULL,'1',2),(3243,3242,'622801','622800','西峰市','甘肃省庆阳地区西峰市',NULL,NULL,'1',3),(3244,3242,'622821','622800','庆阳县','甘肃省庆阳地区庆阳县',NULL,NULL,'1',3),(3245,3242,'622822','622800','环县','甘肃省庆阳地区环县',NULL,NULL,'1',3),(3246,3242,'622823','622800','华池县','甘肃省庆阳地区华池县',NULL,NULL,'1',3),(3247,3242,'622824','622800','合水县','甘肃省庆阳地区合水县',NULL,NULL,'1',3),(3248,3242,'622825','622800','正宁县','甘肃省庆阳地区正宁县',NULL,NULL,'1',3),(3249,3242,'622826','622800','宁县','甘肃省庆阳地区宁县',NULL,NULL,'1',3),(3250,3242,'622827','622800','镇原县','甘肃省庆阳地区镇原县',NULL,NULL,'1',3),(3251,3163,'622900','620000','临夏州','甘肃省临夏回族自治州',NULL,NULL,'1',2),(3252,3251,'622901','622900','临夏市','甘肃省临夏回族自治州临夏市',NULL,NULL,'1',3),(3253,3251,'622921','622900','临夏县','甘肃省临夏回族自治州临夏县',NULL,NULL,'1',3),(3254,3251,'622922','622900','康乐县','甘肃省临夏回族自治州康乐县',NULL,NULL,'1',3),(3255,3251,'622923','622900','永靖县','甘肃省临夏回族自治州永靖县',NULL,NULL,'1',3),(3256,3251,'622924','622900','广河县','甘肃省临夏回族自治州广河县',NULL,NULL,'1',3),(3257,3251,'622925','622900','和政县','甘肃省临夏回族自治州和政县',NULL,NULL,'1',3),(3258,3251,'622926','622900','东乡族自治县','甘肃省临夏回族自治州东乡族自治县',NULL,NULL,'1',3),(3259,3251,'622927','622900','积石山县','甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县',NULL,NULL,'1',3),(3260,3163,'623000','620000','甘南州','甘肃省甘南藏族自治州',NULL,NULL,'1',2),(3261,3260,'623001','623000','合作市','甘肃省甘南藏族自治州合作市',NULL,NULL,'1',3),(3262,3260,'623021','623000','临潭县','甘肃省甘南藏族自治州临潭县',NULL,NULL,'1',3),(3263,3260,'623022','623000','卓尼县','甘肃省甘南藏族自治州卓尼县',NULL,NULL,'1',3),(3264,3260,'623023','623000','舟曲县','甘肃省甘南藏族自治州舟曲县',NULL,NULL,'1',3),(3265,3260,'623024','623000','迭部县','甘肃省甘南藏族自治州迭部县',NULL,NULL,'1',3),(3266,3260,'623025','623000','玛曲县','甘肃省甘南藏族自治州玛曲县',NULL,NULL,'1',3),(3267,3260,'623026','623000','碌曲县','甘肃省甘南藏族自治州碌曲县',NULL,NULL,'1',3),(3268,3260,'623027','623000','夏河县','甘肃省甘南藏族自治州夏河县',NULL,NULL,'1',3),(3269,1,'630000','86','青海省','青海省',NULL,NULL,'1',1),(3270,3269,'630100','630000','西宁市','青海省西宁市',NULL,NULL,'1',2),(3271,3270,'630101','630100','市辖区','青海省西宁市市辖区',NULL,NULL,'0',3),(3272,3270,'630102','630100','城东区','青海省西宁市城东区',NULL,NULL,'1',3),(3273,3270,'630103','630100','城中区','青海省西宁市城中区',NULL,NULL,'1',3),(3274,3270,'630104','630100','城西区','青海省西宁市城西区',NULL,NULL,'1',3),(3275,3270,'630105','630100','城北区','青海省西宁市城北区',NULL,NULL,'1',3),(3276,3270,'630121','630100','大通县','青海省西宁市大通回族土族自治县',NULL,NULL,'1',3),(3277,3269,'632100','630000','海东地区','青海省海东地区',NULL,NULL,'1',2),(3278,3277,'632121','632100','平安县','青海省海东地区平安县',NULL,NULL,'1',3),(3279,3277,'632122','632100','民和县','青海省海东地区民和回族土族自治县',NULL,NULL,'1',3),(3280,3277,'632123','632100','乐都县','青海省海东地区乐都县',NULL,NULL,'1',3),(3281,3277,'632124','632100','湟中县','青海省海东地区湟中县',NULL,NULL,'1',3),(3282,3277,'632125','632100','湟源县','青海省海东地区湟源县',NULL,NULL,'1',3),(3283,3277,'632126','632100','互助县','青海省海东地区互助土族自治县',NULL,NULL,'1',3),(3284,3277,'632127','632100','化隆县','青海省海东地区化隆回族自治县',NULL,NULL,'1',3),(3285,3277,'632128','632100','循化县','青海省海东地区循化撒拉族自治县',NULL,NULL,'1',3),(3286,3269,'632200','630000','海北州','青海省海北藏族自治州',NULL,NULL,'1',2),(3287,3286,'632221','632200','门源县','青海省海北藏族自治州门源回族自治县',NULL,NULL,'1',3),(3288,3286,'632222','632200','祁连县','青海省海北藏族自治州祁连县',NULL,NULL,'1',3),(3289,3286,'632223','632200','海晏县','青海省海北藏族自治州海晏县',NULL,NULL,'1',3),(3290,3286,'632224','632200','刚察县','青海省海北藏族自治州刚察县',NULL,NULL,'1',3),(3291,3269,'632300','630000','黄南州','青海省黄南藏族自治州',NULL,NULL,'1',2),(3292,3291,'632321','632300','同仁县','青海省黄南藏族自治州同仁县',NULL,NULL,'1',3),(3293,3291,'632322','632300','尖扎县','青海省黄南藏族自治州尖扎县',NULL,NULL,'1',3),(3294,3291,'632323','632300','泽库县','青海省黄南藏族自治州泽库县',NULL,NULL,'1',3),(3295,3291,'632324','632300','河南县','青海省黄南藏族自治州河南蒙古族自治县',NULL,NULL,'1',3),(3296,3269,'632500','630000','海南州','青海省海南藏族自治州',NULL,NULL,'1',2),(3297,3296,'632521','632500','共和县','青海省海南藏族自治州共和县',NULL,NULL,'1',3),(3298,3296,'632522','632500','同德县','青海省海南藏族自治州同德县',NULL,NULL,'1',3),(3299,3296,'632523','632500','贵德县','青海省海南藏族自治州贵德县',NULL,NULL,'1',3),(3300,3296,'632524','632500','兴海县','青海省海南藏族自治州兴海县',NULL,NULL,'1',3),(3301,3296,'632525','632500','贵南县','青海省海南藏族自治州贵南县',NULL,NULL,'1',3),(3302,3269,'632600','630000','果洛州','青海省果洛藏族自治州',NULL,NULL,'1',2),(3303,3302,'632621','632600','玛沁县','青海省果洛藏族自治州玛沁县',NULL,NULL,'1',3),(3304,3302,'632622','632600','班玛县','青海省果洛藏族自治州班玛县',NULL,NULL,'1',3),(3305,3302,'632623','632600','甘德县','青海省果洛藏族自治州甘德县',NULL,NULL,'1',3),(3306,3302,'632624','632600','达日县','青海省果洛藏族自治州达日县',NULL,NULL,'1',3),(3307,3302,'632625','632600','久治县','青海省果洛藏族自治州久治县',NULL,NULL,'1',3),(3308,3302,'632626','632600','玛多县','青海省果洛藏族自治州玛多县',NULL,NULL,'1',3),(3309,3269,'632700','630000','玉树州','青海省玉树藏族自治州',NULL,NULL,'1',2),(3310,3309,'632721','632700','玉树县','青海省玉树藏族自治州玉树县',NULL,NULL,'1',3),(3311,3309,'632722','632700','杂多县','青海省玉树藏族自治州杂多县',NULL,NULL,'1',3),(3312,3309,'632723','632700','称多县','青海省玉树藏族自治州称多县',NULL,NULL,'1',3),(3313,3309,'632724','632700','治多县','青海省玉树藏族自治州治多县',NULL,NULL,'1',3),(3314,3309,'632725','632700','囊谦县','青海省玉树藏族自治州囊谦县',NULL,NULL,'1',3),(3315,3309,'632726','632700','曲麻莱县','青海省玉树藏族自治州曲麻莱县',NULL,NULL,'1',3),(3316,3269,'632800','630000','海西州','青海省海西蒙古族藏族自治州',NULL,NULL,'1',2),(3317,3316,'632801','632800','格尔木市','青海省海西蒙古族藏族自治州格尔木市',NULL,NULL,'1',3),(3318,3316,'632802','632800','德令哈市','青海省海西蒙古族藏族自治州德令哈市',NULL,NULL,'1',3),(3319,3316,'632821','632800','乌兰县','青海省海西蒙古族藏族自治州乌兰县',NULL,NULL,'1',3),(3320,3316,'632822','632800','都兰县','青海省海西蒙古族藏族自治州都兰县',NULL,NULL,'1',3),(3321,3316,'632823','632800','天峻县','青海省海西蒙古族藏族自治州天峻县',NULL,NULL,'1',3),(3322,1,'640000','86','宁夏','宁夏回族自治区',NULL,NULL,'1',1),(3323,3322,'640100','640000','银川市','宁夏回族自治区银川市',NULL,NULL,'1',2),(3324,3323,'640101','640100','市辖区','宁夏回族自治区银川市市辖区',NULL,NULL,'0',3),(3325,3323,'640102','640100','城区','宁夏回族自治区银川市城区',NULL,NULL,'1',3),(3326,3323,'640103','640100','新城区','宁夏回族自治区银川市新城区',NULL,NULL,'1',3),(3327,3323,'640111','640100','郊区','宁夏回族自治区银川市郊区',NULL,NULL,'1',3),(3328,3323,'640121','640100','永宁县','宁夏回族自治区银川市永宁县',NULL,NULL,'1',3),(3329,3323,'640122','640100','贺兰县','宁夏回族自治区银川市贺兰县',NULL,NULL,'1',3),(3330,3322,'640200','640000','石嘴山市','宁夏回族自治区石嘴山市',NULL,NULL,'1',2),(3331,3330,'640201','640200','市辖区','宁夏回族自治区石嘴山市市辖区',NULL,NULL,'0',3),(3332,3330,'640202','640200','大武口区','宁夏回族自治区石嘴山市大武口区',NULL,NULL,'1',3),(3333,3330,'640203','640200','石嘴山区','宁夏回族自治区石嘴山市石嘴山区',NULL,NULL,'1',3),(3334,3330,'640204','640200','石炭井区','宁夏回族自治区石嘴山市石炭井区',NULL,NULL,'1',3),(3335,3330,'640221','640200','平罗县','宁夏回族自治区石嘴山市平罗县',NULL,NULL,'1',3),(3336,3330,'640222','640200','陶乐县','宁夏回族自治区石嘴山市陶乐县',NULL,NULL,'1',3),(3337,3330,'640223','640200','惠农县','宁夏回族自治区石嘴山市惠农县',NULL,NULL,'1',3),(3338,3322,'640300','640000','吴忠市','宁夏回族自治区吴忠市',NULL,NULL,'1',2),(3339,3338,'640301','640300','市辖区','宁夏回族自治区吴忠市市辖区',NULL,NULL,'0',3),(3340,3338,'640302','640300','利通区','宁夏回族自治区吴忠市利通区',NULL,NULL,'1',3),(3341,3338,'640321','640300','中卫县','宁夏回族自治区吴忠市中卫县',NULL,NULL,'1',3),(3342,3338,'640322','640300','中宁县','宁夏回族自治区吴忠市中宁县',NULL,NULL,'1',3),(3343,3338,'640323','640300','盐池县','宁夏回族自治区吴忠市盐池县',NULL,NULL,'1',3),(3344,3338,'640324','640300','同心县','宁夏回族自治区吴忠市同心县',NULL,NULL,'1',3),(3345,3338,'640381','640300','青铜峡市','宁夏回族自治区吴忠市青铜峡市',NULL,NULL,'1',3),(3346,3338,'640382','640300','灵武市','宁夏回族自治区吴忠市灵武市',NULL,NULL,'1',3),(3347,3322,'642200','640000','固原地区','宁夏回族自治区固原地区',NULL,NULL,'1',2),(3348,3347,'642221','642200','固原县','宁夏回族自治区固原地区固原县',NULL,NULL,'1',3),(3349,3347,'642222','642200','海原县','宁夏回族自治区固原地区海原县',NULL,NULL,'1',3),(3350,3347,'642223','642200','西吉县','宁夏回族自治区固原地区西吉县',NULL,NULL,'1',3),(3351,3347,'642224','642200','隆德县','宁夏回族自治区固原地区隆德县',NULL,NULL,'1',3),(3352,3347,'642225','642200','泾源县','宁夏回族自治区固原地区泾源县',NULL,NULL,'1',3),(3353,3347,'642226','642200','彭阳县','宁夏回族自治区固原地区彭阳县',NULL,NULL,'1',3),(3354,1,'650000','86','新疆','新疆维吾尔自治区',NULL,NULL,'1',1),(3355,3354,'650100','650000','乌鲁木齐市','新疆维吾尔族自治区乌鲁木齐市',NULL,NULL,'1',2),(3356,3355,'650101','650100','市辖区','新疆维吾尔族自治区乌鲁木齐市市辖区',NULL,NULL,'0',3),(3357,3355,'650102','650100','天山区','新疆维吾尔族自治区乌鲁木齐市天山区',NULL,NULL,'1',3),(3358,3355,'650103','650100','沙依巴克区','新疆维吾尔族自治区乌鲁木齐市沙依巴克区',NULL,NULL,'1',3),(3359,3355,'650104','650100','新市区','新疆维吾尔族自治区乌鲁木齐市新市区',NULL,NULL,'1',3),(3360,3355,'650105','650100','水磨沟区','新疆维吾尔族自治区乌鲁木齐市水磨沟区',NULL,NULL,'1',3),(3361,3355,'650106','650100','头屯河区','新疆维吾尔族自治区乌鲁木齐市头屯河区',NULL,NULL,'1',3),(3362,3355,'650107','650100','南山矿区','新疆维吾尔族自治区乌鲁木齐市南山矿区',NULL,NULL,'1',3),(3363,3355,'650108','650100','东山区','新疆维吾尔族自治区乌鲁木齐市东山区',NULL,NULL,'1',3),(3364,3355,'650121','650100','乌鲁木齐县','新疆维吾尔族自治区乌鲁木齐市乌鲁木齐县',NULL,NULL,'1',3),(3365,3354,'650200','650000','克拉玛依市','新疆维吾尔族自治区克拉玛依市',NULL,NULL,'1',2),(3366,3365,'650201','650200','市辖区','新疆维吾尔族自治区克拉玛依市市辖区',NULL,NULL,'0',3),(3367,3365,'650202','650200','独山子区','新疆维吾尔族自治区克拉玛依市独山子区',NULL,NULL,'1',3),(3368,3365,'650203','650200','克拉玛依区','新疆维吾尔族自治区克拉玛依市克拉玛依区',NULL,NULL,'1',3),(3369,3365,'650204','650200','白碱滩区','新疆维吾尔族自治区克拉玛依市白碱滩区',NULL,NULL,'1',3),(3370,3365,'650205','650200','乌尔禾区','新疆维吾尔族自治区克拉玛依市乌尔禾区',NULL,NULL,'1',3),(3371,3354,'652100','650000','吐鲁番地区','新疆维吾尔族自治区吐鲁番地区',NULL,NULL,'1',2),(3372,3371,'652101','652100','吐鲁番市','新疆维吾尔族自治区吐鲁番地区吐鲁番市',NULL,NULL,'1',3),(3373,3371,'652122','652100','鄯善县','新疆维吾尔族自治区吐鲁番地区鄯善县',NULL,NULL,'1',3),(3374,3371,'652123','652100','托克逊县','新疆维吾尔族自治区吐鲁番地区托克逊县',NULL,NULL,'1',3),(3375,3354,'652200','650000','哈密地区','新疆维吾尔族自治区哈密地区',NULL,NULL,'1',2),(3376,3375,'652201','652200','哈密市','新疆维吾尔族自治区哈密地区哈密市',NULL,NULL,'1',3),(3377,3375,'652222','652200','巴里坤县','新疆维吾尔族自治区哈密地区巴里坤哈萨克自治县',NULL,NULL,'1',3),(3378,3375,'652223','652200','伊吾县','新疆维吾尔族自治区哈密地区伊吾县',NULL,NULL,'1',3),(3379,3354,'652300','650000','昌吉州','新疆维吾尔族自治区昌吉回族自治州',NULL,NULL,'1',2),(3380,3379,'652301','652300','昌吉市','新疆维吾尔族自治区昌吉回族自治州昌吉市',NULL,NULL,'1',3),(3381,3379,'652302','652300','阜康市','新疆维吾尔族自治区昌吉回族自治州阜康市',NULL,NULL,'1',3),(3382,3379,'652303','652300','米泉市','新疆维吾尔族自治区昌吉回族自治州米泉市',NULL,NULL,'1',3),(3383,3379,'652323','652300','呼图壁县','新疆维吾尔族自治区昌吉回族自治州呼图壁县',NULL,NULL,'1',3),(3384,3379,'652324','652300','玛纳斯县','新疆维吾尔族自治区昌吉回族自治州玛纳斯县',NULL,NULL,'1',3),(3385,3379,'652325','652300','奇台县','新疆维吾尔族自治区昌吉回族自治州奇台县',NULL,NULL,'1',3),(3386,3379,'652327','652300','吉木萨尔县','新疆维吾尔族自治区昌吉回族自治州吉木萨尔县',NULL,NULL,'1',3),(3387,3379,'652328','652300','木垒县','新疆维吾尔族自治区昌吉回族自治州木垒哈萨克自治县',NULL,NULL,'1',3),(3388,3354,'652700','650000','博尔塔拉州','新疆维吾尔族自治区博尔塔拉蒙古自治州',NULL,NULL,'1',2),(3389,3388,'652701','652700','博乐市','新疆维吾尔族自治区博尔塔拉蒙古自治州博乐市',NULL,NULL,'1',3),(3390,3388,'652722','652700','精河县','新疆维吾尔族自治区博尔塔拉蒙古自治州精河县',NULL,NULL,'1',3),(3391,3388,'652723','652700','温泉县','新疆维吾尔族自治区博尔塔拉蒙古自治州温泉县',NULL,NULL,'1',3),(3392,3354,'652800','650000','巴音郭楞州','新疆维吾尔族自治区巴音郭楞蒙古自治州',NULL,NULL,'1',2),(3393,3392,'652801','652800','库尔勒市','新疆维吾尔族自治区巴音郭楞蒙古自治州库尔勒市',NULL,NULL,'1',3),(3394,3392,'652822','652800','轮台县','新疆维吾尔族自治区巴音郭楞蒙古自治州轮台县',NULL,NULL,'1',3),(3395,3392,'652823','652800','尉犁县','新疆维吾尔族自治区巴音郭楞蒙古自治州尉犁县',NULL,NULL,'1',3),(3396,3392,'652824','652800','若羌县','新疆维吾尔族自治区巴音郭楞蒙古自治州若羌县',NULL,NULL,'1',3),(3397,3392,'652825','652800','且末县','新疆维吾尔族自治区巴音郭楞蒙古自治州且末县',NULL,NULL,'1',3),(3398,3392,'652826','652800','焉耆县','新疆维吾尔族自治区巴音郭楞蒙古自治州焉耆回族自治县',NULL,NULL,'1',3),(3399,3392,'652827','652800','和静县','新疆维吾尔族自治区巴音郭楞蒙古自治州和静县',NULL,NULL,'1',3),(3400,3392,'652828','652800','和硕县','新疆维吾尔族自治区巴音郭楞蒙古自治州和硕县',NULL,NULL,'1',3),(3401,3392,'652829','652800','博湖县','新疆维吾尔族自治区巴音郭楞蒙古自治州博湖县',NULL,NULL,'1',3),(3402,3354,'652900','650000','阿克苏地区','新疆维吾尔族自治区阿克苏地区',NULL,NULL,'1',2),(3403,3402,'652901','652900','阿克苏市','新疆维吾尔族自治区阿克苏地区阿克苏市',NULL,NULL,'1',3),(3404,3402,'652922','652900','温宿县','新疆维吾尔族自治区阿克苏地区温宿县',NULL,NULL,'1',3),(3405,3402,'652923','652900','库车县','新疆维吾尔族自治区阿克苏地区库车县',NULL,NULL,'1',3),(3406,3402,'652924','652900','沙雅县','新疆维吾尔族自治区阿克苏地区沙雅县',NULL,NULL,'1',3),(3407,3402,'652925','652900','新和县','新疆维吾尔族自治区阿克苏地区新和县',NULL,NULL,'1',3),(3408,3402,'652926','652900','拜城县','新疆维吾尔族自治区阿克苏地区拜城县',NULL,NULL,'1',3),(3409,3402,'652927','652900','乌什县','新疆维吾尔族自治区阿克苏地区乌什县',NULL,NULL,'1',3),(3410,3402,'652928','652900','阿瓦提县','新疆维吾尔族自治区阿克苏地区阿瓦提县',NULL,NULL,'1',3),(3411,3402,'652929','652900','柯坪县','新疆维吾尔族自治区阿克苏地区柯坪县',NULL,NULL,'1',3),(3412,3354,'653000','650000','克孜勒苏柯尔','新疆维吾尔族自治区克孜勒苏柯尔克孜自治州',NULL,NULL,'1',2),(3413,3412,'653001','653000','阿图什市','新疆维吾尔族自治区克孜勒苏柯尔克孜自治州阿图什市',NULL,NULL,'1',3),(3414,3412,'653022','653000','阿克陶县','新疆维吾尔族自治区克孜勒苏柯尔克孜自治州阿克陶县',NULL,NULL,'1',3),(3415,3412,'653023','653000','阿合奇县','新疆维吾尔族自治区克孜勒苏柯尔克孜自治州阿合奇县',NULL,NULL,'1',3),(3416,3412,'653024','653000','乌恰县','新疆维吾尔族自治区克孜勒苏柯尔克孜自治州乌恰县',NULL,NULL,'1',3),(3417,3354,'653100','650000','喀什地区','新疆维吾尔族自治区喀什地区',NULL,NULL,'1',2),(3418,3417,'653101','653100','喀什市','新疆维吾尔族自治区喀什地区喀什市',NULL,NULL,'1',3),(3419,3417,'653121','653100','疏附县','新疆维吾尔族自治区喀什地区疏附县',NULL,NULL,'1',3),(3420,3417,'653122','653100','疏勒县','新疆维吾尔族自治区喀什地区疏勒县',NULL,NULL,'1',3),(3421,3417,'653123','653100','英吉沙县','新疆维吾尔族自治区喀什地区英吉沙县',NULL,NULL,'1',3),(3422,3417,'653124','653100','泽普县','新疆维吾尔族自治区喀什地区泽普县',NULL,NULL,'1',3),(3423,3417,'653125','653100','莎车县','新疆维吾尔族自治区喀什地区莎车县',NULL,NULL,'1',3),(3424,3417,'653126','653100','叶城县','新疆维吾尔族自治区喀什地区叶城县',NULL,NULL,'1',3),(3425,3417,'653127','653100','麦盖提县','新疆维吾尔族自治区喀什地区麦盖提县',NULL,NULL,'1',3),(3426,3417,'653128','653100','岳普湖县','新疆维吾尔族自治区喀什地区岳普湖县',NULL,NULL,'1',3),(3427,3417,'653129','653100','伽师县','新疆维吾尔族自治区喀什地区伽师县',NULL,NULL,'1',3),(3428,3417,'653130','653100','巴楚县','新疆维吾尔族自治区喀什地区巴楚县',NULL,NULL,'1',3),(3429,3417,'653131','653100','塔什库尔干县','新疆维吾尔族自治区喀什地区塔什库尔干塔吉克自治县',NULL,NULL,'1',3),(3430,3354,'653200','650000','和田地区','新疆维吾尔族自治区和田地区',NULL,NULL,'1',2),(3431,3430,'653201','653200','和田市','新疆维吾尔族自治区和田地区和田市',NULL,NULL,'1',3),(3432,3430,'653221','653200','和田县','新疆维吾尔族自治区和田地区和田县',NULL,NULL,'1',3),(3433,3430,'653222','653200','墨玉县','新疆维吾尔族自治区和田地区墨玉县',NULL,NULL,'1',3),(3434,3430,'653223','653200','皮山县','新疆维吾尔族自治区和田地区皮山县',NULL,NULL,'1',3),(3435,3430,'653224','653200','洛浦县','新疆维吾尔族自治区和田地区洛浦县',NULL,NULL,'1',3),(3436,3430,'653225','653200','策勒县','新疆维吾尔族自治区和田地区策勒县',NULL,NULL,'1',3),(3437,3430,'653226','653200','于田县','新疆维吾尔族自治区和田地区于田县',NULL,NULL,'1',3),(3438,3430,'653227','653200','民丰县','新疆维吾尔族自治区和田地区民丰县',NULL,NULL,'1',3),(3439,3354,'654000','650000','伊犁','新疆维吾尔族自治区伊犁哈萨克自治州',NULL,NULL,'1',2),(3440,3439,'654001','654000','奎屯市','新疆维吾尔族自治区伊犁哈萨克自治州奎屯市',NULL,NULL,'1',3),(3441,3354,'654101','650000','伊宁市','新疆维吾尔族自治区伊犁哈萨克自治州伊宁市',NULL,NULL,'1',3),(3442,3354,'654121','650000','伊宁县','新疆维吾尔族自治区伊犁哈萨克自治州伊宁县',NULL,NULL,'1',3),(3443,3354,'654122','650000','察布查尔锡伯','新疆自治区伊犁哈萨克自治州察布查尔锡伯自治县',NULL,NULL,'1',3),(3444,3354,'654123','650000','霍城县','新疆维吾尔族自治区伊犁哈萨克自治州霍城县',NULL,NULL,'1',3),(3445,3354,'654124','650000','巩留县','新疆维吾尔族自治区伊犁哈萨克自治州巩留县',NULL,NULL,'1',3),(3446,3354,'654125','650000','新源县','新疆维吾尔族自治区伊犁哈萨克自治州新源县',NULL,NULL,'1',3),(3447,3354,'654126','650000','昭苏县','新疆维吾尔族自治区伊犁哈萨克自治州昭苏县',NULL,NULL,'1',3),(3448,3354,'654127','650000','特克斯县','新疆维吾尔族自治区伊犁哈萨克自治州特克斯县',NULL,NULL,'1',3),(3449,3354,'654128','650000','尼勒克县','新疆维吾尔族自治区伊犁哈萨克自治州尼勒克县',NULL,NULL,'1',3),(3450,3354,'654200','650000','塔城地区','新疆维吾尔族自治区塔城地区',NULL,NULL,'1',2),(3451,3450,'654201','654200','塔城市','新疆维吾尔族自治区塔城地区塔城市',NULL,NULL,'1',3),(3452,3450,'654202','654200','乌苏市','新疆维吾尔族自治区塔城地区乌苏市',NULL,NULL,'1',3),(3453,3450,'654221','654200','额敏县','新疆维吾尔族自治区塔城地区额敏县',NULL,NULL,'1',3),(3454,3450,'654223','654200','沙湾县','新疆维吾尔族自治区塔城地区沙湾县',NULL,NULL,'1',3),(3455,3450,'654224','654200','托里县','新疆维吾尔族自治区塔城地区托里县',NULL,NULL,'1',3),(3456,3450,'654225','654200','裕民县','新疆维吾尔族自治区塔城地区裕民县',NULL,NULL,'1',3),(3457,3450,'654226','654200','和布克赛尔蒙古','新疆维吾尔族自治区塔城地区和布克赛尔蒙古自治县',NULL,NULL,'1',3),(3458,3354,'654300','650000','阿勒泰地区','新疆维吾尔族自治区阿勒泰地区',NULL,NULL,'1',2),(3459,3458,'654301','654300','阿勒泰市','新疆维吾尔族自治区阿勒泰地区阿勒泰市',NULL,NULL,'1',3),(3460,3458,'654321','654300','布尔津县','新疆维吾尔族自治区阿勒泰地区布尔津县',NULL,NULL,'1',3),(3461,3458,'654322','654300','富蕴县','新疆维吾尔族自治区阿勒泰地区富蕴县',NULL,NULL,'1',3),(3462,3458,'654323','654300','福海县','新疆维吾尔族自治区阿勒泰地区福海县',NULL,NULL,'1',3),(3463,3458,'654324','654300','哈巴河县','新疆维吾尔族自治区阿勒泰地区哈巴河县',NULL,NULL,'1',3),(3464,3458,'654325','654300','青河县','新疆维吾尔族自治区阿勒泰地区青河县',NULL,NULL,'1',3),(3465,3458,'654326','654300','吉木乃县','新疆维吾尔族自治区阿勒泰地区吉木乃县',NULL,NULL,'1',3),(3466,3354,'659000','650000','直辖县','新疆维吾尔族自治区直辖县级行政单位',NULL,NULL,'1',2),(3467,3466,'659001','659000','石河子市','新疆维吾尔族自治区石河子市',NULL,NULL,'1',3);
/*!40000 ALTER TABLE `dict_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_trade`
--

DROP TABLE IF EXISTS `dict_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_trade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父级ID',
  `CODE` varchar(10) DEFAULT NULL COMMENT '编码',
  `TEMP_PCODE` varchar(10) DEFAULT NULL COMMENT '父级编码(导入临时用)',
  `TRADE_FULLNAME_CN` varchar(100) DEFAULT NULL COMMENT '行业名称-中文全称',
  `TRADE_NAME_CN` varchar(100) DEFAULT NULL COMMENT '行业名称-中文',
  `TRADE_NAME_EN` varchar(100) DEFAULT NULL COMMENT '行业名称-英文',
  `TRADE_DESC` varchar(1024) DEFAULT NULL COMMENT '行业描述',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '状态 0 无效 1有效',
  `TRADE_LEVEL` int(11) DEFAULT NULL COMMENT '级别 0 门类，1 大类,2 中类，3 小类',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_trade`
--

LOCK TABLES `dict_trade` WRITE;
/*!40000 ALTER TABLE `dict_trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `dict_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_code_map`
--

DROP TABLE IF EXISTS `field_code_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_code_map` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TABLE_NAME` varchar(50) NOT NULL COMMENT '表名',
  `FIELD_NAME` varchar(50) NOT NULL COMMENT '字段名称',
  `CODE_KEY` varchar(50) NOT NULL COMMENT '代码',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='表字段映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_code_map`
--

LOCK TABLES `field_code_map` WRITE;
/*!40000 ALTER TABLE `field_code_map` DISABLE KEYS */;
INSERT INTO `field_code_map` VALUES (1,'ROLE','ROLE_TYPE','B001',1),(2,'BUSER','USER_TYPE','B002',1),(3,'BUSER','USER_STATUS','B003',1),(4,'MEMBER_INFO','MI_TYPE','B004',1),(5,'SYSFUNC','FUNC_TYPE','B005',1),(6,'USER_ACTIVITY_LOG','ACTIVITY_TYPE','B006',1),(7,'LOAN_INFO','STATUS','C001',1),(8,'BRANCH','BRCH_STATUS','A002',1),(9,'AUDIT_ROUTE','AUDIT_MODE','B011',1),(10,'AUDIT_ROUTE','AN_EXEC_MODE','B012',1),(11,'AUDIT_NODE','IS_PRIVILEGE_CTRL','A001',1),(12,'HUMN_TASK','TASK_TYPE','B022',1),(13,'AUDIT_TASK','AT_STATUS','B013',1),(14,'AUDIT_PROCESS','AP_STATUS','B014',1),(15,'AUDIT_PROCESS','AP_EXEC_RESULT','B015',1),(16,'SYS_PARAM','STATUS','B017',1),(17,'SYSFUNC','USE_TYPE','B008',1);
/*!40000 ALTER TABLE `field_code_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humn_task`
--

DROP TABLE IF EXISTS `humn_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humn_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_NAME` varchar(50) DEFAULT NULL,
  `TASK_CN_NAME` varchar(50) DEFAULT NULL,
  `FUNC_ID` varchar(50) DEFAULT NULL,
  `PROC_ID` int(11) DEFAULT NULL,
  `TASK_TYPE` varchar(70) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL COMMENT '任务处理地址',
  `STATUS` char(1) DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `SORT_NO` decimal(5,2) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humn_task`
--

LOCK TABLES `humn_task` WRITE;
/*!40000 ALTER TABLE `humn_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `humn_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humn_task_actor_delegate`
--

DROP TABLE IF EXISTS `humn_task_actor_delegate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humn_task_actor_delegate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATOR` int(11) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFIER` int(11) DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `ACTOR` int(11) DEFAULT NULL COMMENT '处理人',
  `DELEGATOR` int(11) DEFAULT NULL COMMENT '委托人',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `IN_EFFECT` varchar(2) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humn_task_actor_delegate`
--

LOCK TABLES `humn_task_actor_delegate` WRITE;
/*!40000 ALTER TABLE `humn_task_actor_delegate` DISABLE KEYS */;
/*!40000 ALTER TABLE `humn_task_actor_delegate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humn_task_actr`
--

DROP TABLE IF EXISTS `humn_task_actr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humn_task_actr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) DEFAULT NULL,
  `BRCH_ID` int(11) DEFAULT NULL,
  `ACTR_BRCH_ID` int(11) DEFAULT NULL,
  `ACTR_ROLE_ID` int(11) DEFAULT NULL,
  `ACTR_USER_ID` int(11) DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humn_task_actr`
--

LOCK TABLES `humn_task_actr` WRITE;
/*!40000 ALTER TABLE `humn_task_actr` DISABLE KEYS */;
/*!40000 ALTER TABLE `humn_task_actr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ib_user`
--

DROP TABLE IF EXISTS `ib_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ib_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER_NO` varchar(100) DEFAULT NULL COMMENT '用户编号',
  `PASSWORD` varchar(40) DEFAULT NULL COMMENT '密码',
  `CUST_ID` int(11) DEFAULT NULL COMMENT '客户ID',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入编号',
  `TYPE` char(1) DEFAULT NULL COMMENT '类型',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网银用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ib_user`
--

LOCK TABLES `ib_user` WRITE;
/*!40000 ALTER TABLE `ib_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ib_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_action`
--

DROP TABLE IF EXISTS `jbpm_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` varchar(4000) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EVENTINDEX_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  KEY `FK_ACTION_EVENT` (`EVENT_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_action`
--

LOCK TABLES `jbpm_action` WRITE;
/*!40000 ALTER TABLE `jbpm_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_bytearray`
--

DROP TABLE IF EXISTS `jbpm_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_bytearray`
--

LOCK TABLES `jbpm_bytearray` WRITE;
/*!40000 ALTER TABLE `jbpm_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_byteblock`
--

DROP TABLE IF EXISTS `jbpm_byteblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL AUTO_INCREMENT,
  `BYTES_` varbinary(1024) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`PROCESSFILE_`,`INDEX_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_byteblock`
--

LOCK TABLES `jbpm_byteblock` WRITE;
/*!40000 ALTER TABLE `jbpm_byteblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_byteblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_comment`
--

DROP TABLE IF EXISTS `jbpm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` varchar(4000) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` bigint(20) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_comment`
--

LOCK TABLES `jbpm_comment` WRITE;
/*!40000 ALTER TABLE `jbpm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_decisionconditions`
--

DROP TABLE IF EXISTS `jbpm_decisionconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`DECISION_`,`INDEX_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_decisionconditions`
--

LOCK TABLES `jbpm_decisionconditions` WRITE;
/*!40000 ALTER TABLE `jbpm_decisionconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_decisionconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_delegation`
--

DROP TABLE IF EXISTS `jbpm_delegation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME_` varchar(4000) DEFAULT NULL,
  `CONFIGURATION_` varchar(4000) DEFAULT NULL,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_delegation`
--

LOCK TABLES `jbpm_delegation` WRITE;
/*!40000 ALTER TABLE `jbpm_delegation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_delegation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_event`
--

DROP TABLE IF EXISTS `jbpm_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_event`
--

LOCK TABLES `jbpm_event` WRITE;
/*!40000 ALTER TABLE `jbpm_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_exceptionhandler`
--

DROP TABLE IF EXISTS `jbpm_exceptionhandler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXCEPTIONCLASSNAME_` varchar(4000) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_exceptionhandler`
--

LOCK TABLES `jbpm_exceptionhandler` WRITE;
/*!40000 ALTER TABLE `jbpm_exceptionhandler` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_exceptionhandler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_id_group`
--

DROP TABLE IF EXISTS `jbpm_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_id_group` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_id_group`
--

LOCK TABLES `jbpm_id_group` WRITE;
/*!40000 ALTER TABLE `jbpm_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_id_membership`
--

DROP TABLE IF EXISTS `jbpm_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_id_membership` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ROLE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_id_membership`
--

LOCK TABLES `jbpm_id_membership` WRITE;
/*!40000 ALTER TABLE `jbpm_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_id_permissions`
--

DROP TABLE IF EXISTS `jbpm_id_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_id_permissions` (
  `ENTITY_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTION_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_id_permissions`
--

LOCK TABLES `jbpm_id_permissions` WRITE;
/*!40000 ALTER TABLE `jbpm_id_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_id_user`
--

DROP TABLE IF EXISTS `jbpm_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_id_user` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `EMAIL_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_id_user`
--

LOCK TABLES `jbpm_id_user` WRITE;
/*!40000 ALTER TABLE `jbpm_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_job`
--

DROP TABLE IF EXISTS `jbpm_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_job` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` decimal(10,0) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROCESSINSTANCE_` decimal(19,0) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` varchar(4000) DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_JOB_ACTION` (`ACTION_`),
  KEY `FK_JOB_NODE` (`NODE_`),
  KEY `FK_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_TSKINST` (`TASKINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_job`
--

LOCK TABLES `jbpm_job` WRITE;
/*!40000 ALTER TABLE `jbpm_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_log`
--

DROP TABLE IF EXISTS `jbpm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` varchar(4000) DEFAULT NULL,
  `EXCEPTION_` varchar(4000) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` float DEFAULT NULL,
  `NEWDOUBLEVALUE_` float DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `NEWSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_log`
--

LOCK TABLES `jbpm_log` WRITE;
/*!40000 ALTER TABLE `jbpm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_moduledefinition`
--

DROP TABLE IF EXISTS `jbpm_moduledefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_moduledefinition`
--

LOCK TABLES `jbpm_moduledefinition` WRITE;
/*!40000 ALTER TABLE `jbpm_moduledefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_moduledefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_moduleinstance`
--

DROP TABLE IF EXISTS `jbpm_moduleinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_moduleinstance`
--

LOCK TABLES `jbpm_moduleinstance` WRITE;
/*!40000 ALTER TABLE `jbpm_moduleinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_moduleinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_node`
--

DROP TABLE IF EXISTS `jbpm_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ISASYNCEXCL_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCNAME_` varchar(255) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_NODE_ACTION` (`ACTION_`),
  KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_NODE_SCRIPT` (`SCRIPT_`),
  KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`),
  KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_node`
--

LOCK TABLES `jbpm_node` WRITE;
/*!40000 ALTER TABLE `jbpm_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_pooledactor`
--

DROP TABLE IF EXISTS `jbpm_pooledactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_pooledactor`
--

LOCK TABLES `jbpm_pooledactor` WRITE;
/*!40000 ALTER TABLE `jbpm_pooledactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_pooledactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_processdefinition`
--

DROP TABLE IF EXISTS `jbpm_processdefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(100) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PROCESSDEFINITION_NAME` (`NAME_`),
  KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_processdefinition`
--

LOCK TABLES `jbpm_processdefinition` WRITE;
/*!40000 ALTER TABLE `jbpm_processdefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_processdefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_processinstance`
--

DROP TABLE IF EXISTS `jbpm_processinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PROCIN_KEY` (`KEY_`),
  KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_processinstance`
--

LOCK TABLES `jbpm_processinstance` WRITE;
/*!40000 ALTER TABLE `jbpm_processinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_processinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_runtimeaction`
--

DROP TABLE IF EXISTS `jbpm_runtimeaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_RTACTN_ACTION` (`ACTION_`),
  KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_runtimeaction`
--

LOCK TABLES `jbpm_runtimeaction` WRITE;
/*!40000 ALTER TABLE `jbpm_runtimeaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_runtimeaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_swimlane`
--

DROP TABLE IF EXISTS `jbpm_swimlane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_swimlane`
--

LOCK TABLES `jbpm_swimlane` WRITE;
/*!40000 ALTER TABLE `jbpm_swimlane` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_swimlane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_swimlaneinstance`
--

DROP TABLE IF EXISTS `jbpm_swimlaneinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_swimlaneinstance`
--

LOCK TABLES `jbpm_swimlaneinstance` WRITE;
/*!40000 ALTER TABLE `jbpm_swimlaneinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_swimlaneinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_task`
--

DROP TABLE IF EXISTS `jbpm_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_task`
--

LOCK TABLES `jbpm_task` WRITE;
/*!40000 ALTER TABLE `jbpm_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_taskactor`
--

DROP TABLE IF EXISTS `jbpm_taskactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_taskactor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TI_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTOR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_taskactor`
--

LOCK TABLES `jbpm_taskactor` WRITE;
/*!40000 ALTER TABLE `jbpm_taskactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_taskactorpool`
--

DROP TABLE IF EXISTS `jbpm_taskactorpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL AUTO_INCREMENT,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_taskactorpool`
--

LOCK TABLES `jbpm_taskactorpool` WRITE;
/*!40000 ALTER TABLE `jbpm_taskactorpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskactorpool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_taskcontroller`
--

DROP TABLE IF EXISTS `jbpm_taskcontroller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_taskcontroller`
--

LOCK TABLES `jbpm_taskcontroller` WRITE;
/*!40000 ALTER TABLE `jbpm_taskcontroller` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskcontroller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_taskinstance`
--

DROP TABLE IF EXISTS `jbpm_taskinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  `PREACTOR_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASKINST_TSK` (`TASK_`,`PROCINST_`),
  KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  KEY `FK_TSKINS_PRCINS` (`PROCINST_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_taskinstance`
--

LOCK TABLES `jbpm_taskinstance` WRITE;
/*!40000 ALTER TABLE `jbpm_taskinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_taskinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_token`
--

DROP TABLE IF EXISTS `jbpm_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `LOCK_` varchar(255) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TOKEN_NODE` (`NODE_`),
  KEY `FK_TOKEN_PARENT` (`PARENT_`),
  KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_token`
--

LOCK TABLES `jbpm_token` WRITE;
/*!40000 ALTER TABLE `jbpm_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_tokenvariablemap`
--

DROP TABLE IF EXISTS `jbpm_tokenvariablemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_tokenvariablemap`
--

LOCK TABLES `jbpm_tokenvariablemap` WRITE;
/*!40000 ALTER TABLE `jbpm_tokenvariablemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_tokenvariablemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_transition`
--

DROP TABLE IF EXISTS `jbpm_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TRANSITION_FROM` (`FROM_`),
  KEY `FK_TRANSITION_TO` (`TO_`),
  KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_transition`
--

LOCK TABLES `jbpm_transition` WRITE;
/*!40000 ALTER TABLE `jbpm_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_variableaccess`
--

DROP TABLE IF EXISTS `jbpm_variableaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_variableaccess`
--

LOCK TABLES `jbpm_variableaccess` WRITE;
/*!40000 ALTER TABLE `jbpm_variableaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_variableaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jbpm_variableinstance`
--

DROP TABLE IF EXISTS `jbpm_variableinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` float DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(4000) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_VARINST_TK` (`TOKEN_`),
  KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jbpm_variableinstance`
--

LOCK TABLES `jbpm_variableinstance` WRITE;
/*!40000 ALTER TABLE `jbpm_variableinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `jbpm_variableinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_info`
--

DROP TABLE IF EXISTS `member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_info` (
  `MI_NO` varchar(50) NOT NULL COMMENT '接入点编号',
  `MI_NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `IS_OPEN` varchar(1) DEFAULT NULL COMMENT '是否开启 1：开启，0：关闭',
  `MI_KEY` varchar(500) DEFAULT NULL COMMENT '接入密钥',
  `EB_KEY` varchar(500) DEFAULT NULL COMMENT '网银密钥',
  `MI_TYPE` varchar(1) DEFAULT NULL COMMENT '接入点类型 1：银行，2：财务公司，3：企业',
  `BANK_NO` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `ORG_CODE` varchar(50) DEFAULT NULL COMMENT '组织代码',
  `MI_DT` datetime DEFAULT NULL COMMENT '接入日期',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`MI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接入信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_info`
--

LOCK TABLES `member_info` WRITE;
/*!40000 ALTER TABLE `member_info` DISABLE KEYS */;
INSERT INTO `member_info` VALUES ('0001','业务平台中心','1','','','3','','lxadmin','2014-07-22 15:14:42',4);
/*!40000 ALTER TABLE `member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_prod_info`
--

DROP TABLE IF EXISTS `member_prod_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_prod_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROD_ID` int(11) NOT NULL COMMENT '产品ID',
  `MI_NO` varchar(50) NOT NULL COMMENT '接入点编号',
  `PROD_ALIAS` varchar(50) DEFAULT NULL COMMENT '产品别名',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '序号',
  `PARENT_PROD_ID` int(11) DEFAULT NULL COMMENT '父产品ID',
  `IS_CHECK` varchar(1) DEFAULT NULL COMMENT '是否需要审核1：是，0：否',
  `IS_AUDIT` varchar(1) DEFAULT NULL COMMENT '是否需要审批 1：是，0 ：否',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='接入点产品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_prod_info`
--

LOCK TABLES `member_prod_info` WRITE;
/*!40000 ALTER TABLE `member_prod_info` DISABLE KEYS */;
INSERT INTO `member_prod_info` VALUES (1,12,'0001','商业产品',NULL,NULL,NULL,NULL,0),(2,13,'0001','e商贷',NULL,NULL,NULL,NULL,0),(3,14,'0001','购车宝',NULL,NULL,NULL,NULL,0),(4,15,'0001','随心贷',NULL,NULL,NULL,NULL,0),(5,16,'0001','快车宝',NULL,NULL,NULL,NULL,0),(6,17,'0001','惠装贷',NULL,NULL,NULL,NULL,0),(7,18,'0001','客户来源',NULL,NULL,NULL,NULL,0),(8,19,'0001','wap端',NULL,NULL,NULL,NULL,0),(9,20,'0001','代扣端',NULL,NULL,NULL,NULL,0),(10,21,'0001','云淘',NULL,NULL,NULL,NULL,0),(11,22,'0001','兴融贷',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `member_prod_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_product_attribute`
--

DROP TABLE IF EXISTS `member_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_product_attribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '产品',
  `ATTRIBUTE_ID` int(11) DEFAULT NULL COMMENT '属性',
  `ATTRIBUTE_KEY` varchar(100) DEFAULT NULL COMMENT '属性KEY',
  `ATTRIBUTE_VALUE` varchar(100) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='接入点产品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_product_attribute`
--

LOCK TABLES `member_product_attribute` WRITE;
/*!40000 ALTER TABLE `member_product_attribute` DISABLE KEYS */;
INSERT INTO `member_product_attribute` VALUES (4,'0001',16,1,'DEPT','运营部'),(6,'0001',19,1,'DEPT','运营部'),(7,'0001',20,1,'DEPT','运营部'),(8,'0001',21,1,'DEPT','风控部'),(9,'0001',13,2,'ROLE_A','e商贷审核'),(10,'0001',14,2,'ROLE_A','购车宝审核'),(11,'0001',14,3,'ROLE_B','信贷事业部业务'),(12,'0001',15,2,'ROLE_A','随心贷审核'),(13,'0001',15,3,'ROLE_B','信贷事业部业务'),(14,'0001',17,2,'ROLE_A','信贷事业部业务'),(15,'0001',17,3,'ROLE_B','惠装贷审核');
/*!40000 ALTER TABLE `member_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_def`
--

DROP TABLE IF EXISTS `process_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_def` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROC_NAME` varchar(50) DEFAULT NULL,
  `DESI_PROD_NO` varchar(50) DEFAULT NULL,
  `JBPM_PD_ID` int(11) DEFAULT NULL,
  `PROC_NAME_KEY` varchar(50) DEFAULT NULL,
  `PROC_CN_NAME` varchar(50) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `VER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_def`
--

LOCK TABLES `process_def` WRITE;
/*!40000 ALTER TABLE `process_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_info`
--

DROP TABLE IF EXISTS `prod_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PROD_NO` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `PROD_NAME` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `PROD_NAME_KEY` varchar(50) DEFAULT NULL COMMENT '国际化key',
  `PROD_TYPE` varchar(1) DEFAULT NULL COMMENT '类型 1：业务，2：主业务，3：其它',
  `PROD_URL` varchar(100) DEFAULT NULL COMMENT 'url',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '序号',
  `PARENT_PROD_ID` int(11) DEFAULT NULL COMMENT '父产品ID',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '说明',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_info`
--

LOCK TABLES `prod_info` WRITE;
/*!40000 ALTER TABLE `prod_info` DISABLE KEYS */;
INSERT INTO `prod_info` VALUES (1,'AUDIT','权限复核','audit','1',NULL,1,NULL,'权限复核',1),(2,'SYS_PARAM_AUDIT','参数复核','sys_param_audit','1','/security/sys_param_auditView.jhtml',1,1,'参数复核',1),(3,'BRCH_FUNC_AUDIT','机构权限复核','brch_func_audit','1','/security/brch_brchFuncAudit.jhtml',2,1,'机构权限复核',1),(4,'BRMG_FUNC_AUDIT','管理员权限复核','brmg_func_audit','1','/security/user_userFuncAudit.jhtml',3,1,'机构管理员权限复核',1),(5,'BUUS_FUNC_AUDIT','用户权限复核','buus_func_audit','1','/security/user_userFuncAudit.jhtml',4,1,'业务人员权限复核',1),(6,'P0000','流程产品','','1','',2,NULL,'',0),(7,'P0001','流标','','1','',1,6,'',0),(8,'P0002','放款','loanMoney','1',NULL,2,6,NULL,0),(9,'UwcProductAudit','财富产品审核','UwcProductAudit','1',NULL,3,NULL,NULL,0),(10,'UPA004','产品认购审批','UwcProductBuy','1',NULL,1,9,NULL,0),(12,'CORP_BUS_PROD','商业产品','CORP_BUS_PROD','1',NULL,4,NULL,'公司推出面向客户产品',0),(13,'E_SHANG_DAI','e商贷','e_shang_dai','1',NULL,1,12,'e商贷',0),(14,'GOU_CHE_BAO','购车宝','gou_che_bao','2',NULL,2,12,'购车宝',0),(15,'SUI_XIN_DAI','随心贷','sui_xin_dai','2',NULL,3,12,'随心贷',1),(16,'KUAI_CHE_BAO','快车宝','kuai_che_bao','2',NULL,4,12,'快车宝',1),(17,'HUI_ZHUANG_DAI','惠装贷','hui_zhuang_dai','2',NULL,5,12,'惠装贷',1),(18,'CLIENT_SOURCE','客户来源','client_source','2',NULL,5,NULL,'客户来源',0),(19,'WAP_SOURCE','wap端','wap_source','2',NULL,1,18,'wap端',0),(20,'DAIKOU_SOURCE','代扣端','daikou_source','2',NULL,2,18,'代扣端',0),(21,'YUNTAO_SOURCE','云淘','yuntao_source','2',NULL,3,18,'云淘',0),(22,'XING_RONG_DAI','兴融贷','xing_rong_dai','2',NULL,6,12,NULL,0);
/*!40000 ALTER TABLE `prod_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_proc_map`
--

DROP TABLE IF EXISTS `prod_proc_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_proc_map` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROC_ID` int(11) DEFAULT NULL,
  `BRCH_ID` bigint(20) DEFAULT NULL,
  `PROD_NO` varchar(50) DEFAULT NULL,
  `MI_NO` varchar(50) DEFAULT NULL,
  `MAP_TYPE` varchar(5) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_proc_map`
--

LOCK TABLES `prod_proc_map` WRITE;
/*!40000 ALTER TABLE `prod_proc_map` DISABLE KEYS */;
INSERT INTO `prod_proc_map` VALUES (1,1,NULL,NULL,'0001','1',NULL),(2,2,NULL,NULL,'0001','1',NULL),(3,3,NULL,NULL,'0001','1',NULL);
/*!40000 ALTER TABLE `prod_proc_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ATTR_KEY` varchar(100) DEFAULT NULL COMMENT '属性KEY',
  `ATTR_NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `ATTR_VALUE` varchar(100) DEFAULT NULL COMMENT '属性值',
  `CODE_META_KEY` varchar(20) DEFAULT NULL COMMENT '字典元',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
INSERT INTO `product_attribute` VALUES (1,'DEPT','所属部门','123',NULL),(2,'ROLE_A','角色A','A',NULL),(3,'ROLE_B','角色B','B',NULL);
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sysfunc`
--

DROP TABLE IF EXISTS `product_sysfunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sysfunc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PRODUCT_ID` int(11) DEFAULT NULL COMMENT '产品ID',
  `FUNC_ID` int(11) DEFAULT NULL COMMENT '权限ID',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态 1：有效 ，0：无效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sysfunc`
--

LOCK TABLES `product_sysfunc` WRITE;
/*!40000 ALTER TABLE `product_sysfunc` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sysfunc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_ar_brch`
--

DROP TABLE IF EXISTS `re_ar_brch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_ar_brch` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AR_ID` int(11) NOT NULL COMMENT '审批路线ID',
  `BIND_BRCH_ID` int(11) NOT NULL COMMENT '绑定机构',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批路线机构关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_ar_brch`
--

LOCK TABLES `re_ar_brch` WRITE;
/*!40000 ALTER TABLE `re_ar_brch` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_ar_brch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_ar_prod`
--

DROP TABLE IF EXISTS `re_ar_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_ar_prod` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AR_ID` int(11) NOT NULL COMMENT '审批路线id',
  `PROD_ID` int(11) NOT NULL COMMENT '产品id',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构id：不同机构针对产品设置不同的路线（分支机构可以使用总部设定的）',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批路线产品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_ar_prod`
--

LOCK TABLES `re_ar_prod` WRITE;
/*!40000 ALTER TABLE `re_ar_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_ar_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_as_role`
--

DROP TABLE IF EXISTS `re_as_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_as_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AS_ID` int(11) NOT NULL COMMENT '审批岗位ID',
  `BIND_ROLE_ID` int(11) NOT NULL COMMENT '绑定角色',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批岗位角色关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_as_role`
--

LOCK TABLES `re_as_role` WRITE;
/*!40000 ALTER TABLE `re_as_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_as_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_as_user`
--

DROP TABLE IF EXISTS `re_as_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_as_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AS_ID` int(11) NOT NULL COMMENT '审批岗位ID',
  `BIND_USER_ID` int(11) NOT NULL COMMENT '绑定用户',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批岗位用户关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_as_user`
--

LOCK TABLES `re_as_user` WRITE;
/*!40000 ALTER TABLE `re_as_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_as_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_brch_func`
--

DROP TABLE IF EXISTS `re_brch_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_brch_func` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构ID',
  `FUNC_ID` int(11) DEFAULT NULL COMMENT '权限ID',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态 0：未分配，1：分配未审核或分配中，2：已审核， 3：审核中',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='结构权限关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_brch_func`
--

LOCK TABLES `re_brch_func` WRITE;
/*!40000 ALTER TABLE `re_brch_func` DISABLE KEYS */;
INSERT INTO `re_brch_func` VALUES (1,1,2,'2',NULL),(2,1,17,'2',NULL),(3,1,18,'2',NULL),(4,1,19,'2',NULL),(5,1,20,'2',NULL),(6,1,21,'2',NULL),(7,1,22,'2',NULL),(8,1,23,'2',NULL),(9,1,24,'2',NULL),(10,1,25,'2',NULL),(11,1,50,'2',NULL),(12,1,53,'2',NULL),(13,1,54,'2',NULL),(14,1,55,'2',NULL),(15,1,60,'2',NULL),(16,1,63,'2',NULL),(17,1,64,'2',NULL),(18,1,65,'2',NULL),(19,1,68,'2',NULL),(20,1,70,'2',NULL),(21,1,71,'2',NULL),(22,1,72,'2',NULL),(23,1,73,'2',NULL),(24,2,1,'2',NULL),(25,2,2,'2',NULL),(26,2,17,'2',NULL),(27,2,18,'2',NULL),(28,2,19,'2',NULL),(29,2,21,'2',NULL),(30,2,22,'2',NULL),(31,2,23,'2',NULL),(32,2,24,'2',NULL),(33,2,25,'2',NULL),(34,2,50,'2',NULL),(35,2,53,'2',NULL),(36,2,54,'2',NULL),(37,2,55,'2',NULL),(38,2,60,'2',NULL),(39,2,63,'2',NULL),(40,2,64,'2',NULL),(41,2,65,'2',NULL),(42,2,68,'2',NULL),(43,2,70,'2',NULL),(44,2,71,'2',NULL),(45,2,72,'2',NULL),(46,2,73,'2',NULL),(47,3,1,'2',NULL),(48,4,1,'2',NULL),(49,7,1,'2',NULL),(50,5,1,'2',NULL),(51,2,20,'2',NULL),(52,8,1,'2',NULL),(53,9,2,'2',NULL),(54,9,17,'2',NULL),(55,9,18,'2',NULL),(56,9,19,'2',NULL),(57,9,20,'2',NULL),(58,9,21,'2',NULL),(59,9,22,'2',NULL),(60,9,23,'2',NULL),(61,9,24,'2',NULL),(62,9,25,'2',NULL),(63,9,50,'2',NULL),(64,9,53,'2',NULL),(65,9,54,'2',NULL),(66,9,55,'2',NULL),(67,9,1,'2',NULL),(68,10,1,'2',NULL);
/*!40000 ALTER TABLE `re_brch_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_brch_prod`
--

DROP TABLE IF EXISTS `re_brch_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_brch_prod` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构ＩＤ',
  `PROD_ID` int(11) DEFAULT NULL COMMENT '产品ＩＤ',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态　1：待审批，２：取消审批，８：审批通过',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构产品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_brch_prod`
--

LOCK TABLES `re_brch_prod` WRITE;
/*!40000 ALTER TABLE `re_brch_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_brch_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_role_func`
--

DROP TABLE IF EXISTS `re_role_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_role_func` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `FUNC_ID` int(11) NOT NULL COMMENT '权限ID',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色ID',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态 1：有效，0：无效',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='角色权限关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_role_func`
--

LOCK TABLES `re_role_func` WRITE;
/*!40000 ALTER TABLE `re_role_func` DISABLE KEYS */;
INSERT INTO `re_role_func` VALUES (1,1,1,'1',1),(2,2,1,'1',1),(3,3,1,'1',1),(4,4,1,'1',1),(5,5,1,'1',1),(6,6,1,'1',1),(7,7,1,'1',1),(8,50,1,'1',1),(9,51,1,'1',1),(10,56,1,'1',1),(11,60,1,'1',1),(12,61,1,'1',1),(13,90,1,'1',1),(14,91,1,'1',1),(15,92,1,'1',1),(16,93,1,'1',1),(17,8,2,'1',NULL),(18,9,2,'1',NULL),(19,10,2,'1',NULL),(20,11,2,'1',NULL),(21,12,2,'1',NULL),(22,13,2,'1',NULL),(23,14,2,'1',NULL),(24,50,2,'1',NULL),(25,52,2,'1',NULL),(26,57,2,'1',NULL),(27,60,2,'1',NULL),(28,62,2,'1',NULL),(29,66,2,'1',NULL),(30,67,2,'1',NULL),(31,130,2,'1',NULL),(32,131,2,'1',NULL),(33,132,2,'1',NULL),(34,133,2,'1',NULL),(35,1,2,'1',NULL),(36,2,2,'1',NULL),(37,1,3,'1',NULL),(38,2,3,'1',NULL),(39,17,3,'1',NULL),(40,18,3,'1',NULL),(41,19,3,'1',NULL),(42,20,3,'1',NULL),(43,21,3,'1',NULL),(44,22,3,'1',NULL),(45,23,3,'1',NULL),(46,24,3,'1',NULL),(47,25,3,'1',NULL),(48,50,3,'1',NULL),(49,53,3,'1',NULL),(50,54,3,'1',NULL),(51,55,3,'1',NULL),(52,60,3,'1',NULL),(53,63,3,'1',NULL),(54,64,3,'1',NULL),(55,65,3,'1',NULL),(56,68,3,'1',NULL),(57,70,3,'1',NULL),(58,71,3,'1',NULL),(59,72,3,'1',NULL),(60,73,3,'1',NULL),(61,1,4,'1',NULL);
/*!40000 ALTER TABLE `re_role_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_subsys_func`
--

DROP TABLE IF EXISTS `re_subsys_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_subsys_func` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SYS_ID` int(11) NOT NULL COMMENT '子系统ID',
  `FUNC_ID` int(11) NOT NULL COMMENT '权限ID',
  `VER` smallint(6) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子系统与权限关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_subsys_func`
--

LOCK TABLES `re_subsys_func` WRITE;
/*!40000 ALTER TABLE `re_subsys_func` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_subsys_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_user_role`
--

DROP TABLE IF EXISTS `re_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SYS_USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色ID',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态 0：未复核，1：已复核，2：复核中',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_user_role`
--

LOCK TABLES `re_user_role` WRITE;
/*!40000 ALTER TABLE `re_user_role` DISABLE KEYS */;
INSERT INTO `re_user_role` VALUES (1,1,1,'1',1),(2,2,2,'1',NULL),(3,3,3,'1',NULL),(4,4,4,'1',NULL);
/*!40000 ALTER TABLE `re_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ROLE_NO` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `ROLE_NAME` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `ROLE_STATUS` char(1) DEFAULT NULL COMMENT '角色状态 0:disable,1:enable',
  `ROLE_TYPE` char(1) DEFAULT NULL COMMENT '类型 1:实施,2:SaaS管理,3:SaaS运维,4:总部管理,5:机构管理,6:普通',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构ID',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '角色说明',
  `ROLE_CODE` varchar(50) DEFAULT NULL COMMENT '国际化key',
  `VER` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'实施','1','1',NULL,'用于实施人员的角色','ROLE_ADMIN',1),(2,NULL,'SAAS管理',NULL,'3',NULL,'SAAS管理',NULL,0),(3,NULL,'总部管理员',NULL,'4',NULL,'',NULL,0),(4,NULL,'开发测试人员',NULL,'6',1,'',NULL,0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subsystem`
--

DROP TABLE IF EXISTS `subsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subsystem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SYS_NAME` varchar(20) NOT NULL COMMENT '名称',
  `SYS_STATUS` char(1) NOT NULL COMMENT '状态 1：开启，0：关闭',
  `TYPE` char(1) DEFAULT NULL COMMENT '子系统类型 1:对外子系统 ，其他行内系统',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '说明',
  `VER` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsystem`
--

LOCK TABLES `subsystem` WRITE;
/*!40000 ALTER TABLE `subsystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `subsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attachment`
--

DROP TABLE IF EXISTS `sys_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attachment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATOR` int(11) DEFAULT NULL COMMENT '创建者',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `SAVE_NAME` varchar(255) DEFAULT NULL COMMENT '保存名',
  `ATTACH_PATH` varchar(150) DEFAULT NULL COMMENT '相对路径',
  `ATTACH_SIZE` varchar(10) DEFAULT '0' COMMENT '附件大小',
  `UPLOAD_TYPE` varchar(1) DEFAULT NULL,
  `domain` varchar(30) DEFAULT NULL,
  `xhh_result` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attachment`
--

LOCK TABLES `sys_attachment` WRITE;
/*!40000 ALTER TABLE `sys_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `SC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PWD_EFFECT_DAYS` int(11) DEFAULT NULL COMMENT '密码自动失效天数',
  `ERR_ALLOW_NUM` int(11) DEFAULT NULL COMMENT '密码允许的错误次数',
  `PWD_INIT` varchar(100) DEFAULT NULL COMMENT '密码初始值',
  `SYS_PARAM_CHECK` char(1) DEFAULT NULL COMMENT '参数是否需要审核',
  `IS_MULTI_IP` char(1) DEFAULT NULL COMMENT '是否允许多ip登录',
  `IS_ONLINE_LOGON` char(1) DEFAULT NULL COMMENT '是否允许在线登录',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`SC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,3600,5,'163db1c1fedb7b8ab4c12fef0c8df4e8','0','1','1','0001',2);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instance_business`
--

DROP TABLE IF EXISTS `sys_instance_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_instance_business` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATOR` int(11) DEFAULT NULL COMMENT '创建人',
  `CREATOR_NAME` varchar(255) DEFAULT NULL COMMENT '创建人名字',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ENTITY_ID` int(11) DEFAULT NULL COMMENT '实体ID',
  `ENTITY_TYPE` varchar(255) DEFAULT NULL COMMENT '实体类型',
  `PROCESS_NAME` varchar(255) DEFAULT NULL COMMENT '流程编号',
  `PROCESS_CN_NAME` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `PROD_NO` varchar(50) DEFAULT NULL COMMENT '产品代码',
  `PROD_NAME` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `INSTANCE_ID` bigint(20) DEFAULT NULL COMMENT '流程实例ID',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点',
  `COL1` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `COL2` varchar(255) DEFAULT NULL COMMENT 'A角名称',
  `COL3` varchar(255) DEFAULT NULL COMMENT 'B角名称',
  `COL4` decimal(18,4) DEFAULT NULL COMMENT '放款金额',
  `COL5` int(11) DEFAULT NULL COMMENT 'A角',
  `COL6` int(11) DEFAULT NULL COMMENT 'B角',
  `COL7` datetime DEFAULT NULL COMMENT '开始时间',
  `COL8` datetime DEFAULT NULL COMMENT '到期时间',
  `COL9` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `COL10` varchar(4) DEFAULT NULL COMMENT '事业线',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实例业务信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instance_business`
--

LOCK TABLES `sys_instance_business` WRITE;
/*!40000 ALTER TABLE `sys_instance_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_instance_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_param`
--

DROP TABLE IF EXISTS `sys_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_param` (
  `PARAM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PARAM_KEY` varchar(50) DEFAULT NULL COMMENT '参数key',
  `PARAM_NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `PARAM_VALUE` varchar(50) DEFAULT NULL COMMENT '参数值',
  `TEMP_VALUE` varchar(50) DEFAULT NULL COMMENT '参数临时值',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态 0：为复核，1：已复核，2：复核中',
  `BUILD_USER_ID` int(11) DEFAULT NULL COMMENT '参数创建者',
  `MODIFY_USER_ID` int(11) DEFAULT NULL,
  `REVIEW_USER_ID` int(11) DEFAULT NULL COMMENT '参数审核者',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `CODE_KEY` varchar(20) DEFAULT NULL COMMENT '数据字典key',
  `REMARK` varchar(400) DEFAULT NULL,
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`PARAM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_param`
--

LOCK TABLES `sys_param` WRITE;
/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
INSERT INTO `sys_param` VALUES (1,'BRCH_FUNC_CHECK','机构权限复核','0','0','1',NULL,NULL,NULL,NULL,'A000',NULL,1),(2,'BRCH_MANAGER_FUNC_CHECK','管理权权限复核','0','0','1',NULL,NULL,NULL,NULL,'A000',NULL,1),(3,'BUSI_USER_FUNC_CHECK','用户权限复核','0','0','1',NULL,NULL,NULL,NULL,'A000',NULL,1),(4,'BRCH_FUNC_CHECK','机构权限复核','0','0','1',2,NULL,NULL,'0001','A000',NULL,0),(5,'BRCH_MANAGER_FUNC_CHECK','管理权权限复核','0','0','1',2,NULL,NULL,'0001','A000',NULL,0),(6,'BUSI_USER_FUNC_CHECK','用户权限复核','0','0','1',2,NULL,NULL,'0001','A000',NULL,0),(7,'CAR_PUBLISH_ID','车贷项目发布机构','34','34','1',1,1,1,NULL,NULL,'天津燕山小额贷款公司-新',12),(8,'CAR_LOAN_SPECIAL_GUARANTOR','车贷协议参数特殊担保人','326','326','1',1,1,1,NULL,NULL,'汇博科技或华坤资产有限公司id',7),(9,'TO_PLATFORM_ACCOUNT_NAME','转入平台账户名称','杭州','杭州','1',1,1,1,NULL,NULL,'转入平台账户名称',1),(11,'TO_PLATFORM_ACCOUNT_BANK','转入平台开户行','建设银行','建设银行','1',1,NULL,NULL,NULL,NULL,'转入平台开户行',0),(12,'AUTO_LOAN_USER_ID','放款审核自动节点用户','101067','101067','1',1,1,1,NULL,NULL,'放款审核自动节点用户',2),(14,'TO_PLATFORM_ACCOUNT_NUMBER','转入平台账号','1','1','1',1,1,1,NULL,NULL,'转入平台账号id',7),(15,'FULL_CUT_ACCOUNT_NUMBER','满减券出帐账户','9','9','1',1,1,1,NULL,NULL,NULL,1),(16,'CKR_GUARANTEEfEE_ACCOUNT_NUMBE','创客融融资管理费账户','9','9','1',1,1,1,NULL,NULL,NULL,3),(17,'BORROWER_FROM_CRM','借款人是否来源CRM','0','0','1',1,NULL,NULL,NULL,'A000',NULL,0),(18,'BORROWER_FROM_CRM','借款人是否来源CRM','1','1','1',2,3,3,'0001','A000',NULL,11);
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysfunc`
--

DROP TABLE IF EXISTS `sysfunc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysfunc` (
  `FUNC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `FUNC_NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `URL` varchar(200) DEFAULT NULL COMMENT '地址',
  `FUNC_TYPE` char(1) DEFAULT NULL COMMENT '类型 0：菜组单 1：菜单 2：功能',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '说明',
  `FUNC_NAME_KEY` varchar(50) DEFAULT NULL COMMENT '国际化key',
  `PARENT_FUNC_ID` int(11) DEFAULT NULL COMMENT '父权限ID',
  `SORT_NO` int(11) DEFAULT NULL COMMENT '排序号',
  `VER` int(11) DEFAULT NULL COMMENT '版本号',
  `USE_TYPE` char(1) DEFAULT NULL COMMENT '用户类型 1：实施，2：saas，3：机构，4：业务，5：网银',
  PRIMARY KEY (`FUNC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysfunc`
--

LOCK TABLES `sysfunc` WRITE;
/*!40000 ALTER TABLE `sysfunc` DISABLE KEYS */;
INSERT INTO `sysfunc` VALUES (1,'系统',NULL,'0',NULL,'menu_System',NULL,1,1,'1'),(2,'权限管理',NULL,'0',NULL,'menu_Rights_Management',1,1,1,'1'),(3,'定义权限','/security/sysfunc_mainPage.jhtml','1','权限功能的定义及上下及的维护','menu_Defining_Permissions',2,3,1,'1'),(4,'定义子系统','/security/subsystem_mainPage.jhtml','1','子系统定义，功能的集合','menu_Define_Subsystem',2,4,1,'1'),(5,'定义Saas角色','/security/role_mainPage.jhtml','1','saas角色定义及与权限的绑定','menu_Define_saas_Role',2,5,1,'1'),(6,'定义Saas用户','/security/user_mainPage.jhtml','1','saas用户信息的维护及角色绑定','menu_Define_saas_User',2,6,1,'1'),(7,'参数定义','/security/sys_param_list.jhtml','1',NULL,'menu_Parameter_Config',2,7,1,'1'),(8,'接入管理',NULL,'0',NULL,NULL,2,8,1,'2'),(9,'接入点管理','/security/member_mainPage.jhtml','1','接入信息、接入的总部信息及总部管理员的维护和接入的开启关闭','menu_Member_Management',8,9,1,'2'),(10,'接入分配参数','/security/member_sysParam.jhtml','1','接入参数分配','menu_Member_sysparam',8,10,1,'2'),(11,'总部管理',NULL,'0',NULL,NULL,2,11,1,'2'),(12,'接入总部管理','/security/brch_list.jhtml','1','接入总部机构的添加修改及机构权限的分配','menu_Member_Branch_Management',11,12,1,'2'),(13,'定义总部角色','/security/role_mainPage.jhtml','1','总部角色定义及与权限的绑定','menu_Define_Head_Role',11,13,1,'2'),(14,'定义总部管理员','/security/user_mainPage.jhtml','1','总部管理员信息的维护及角色绑定','menu_Define_Head_User',11,14,1,'2'),(15,'在线用户管理','/security/user_mainPage.jhtml?olp=1','1',NULL,'menu_permission.onlineusermanager',2,15,1,'2'),(16,'用户活动日志','/security/userlog_list.jhtml','1','用户活动日志','menu_User_Action_Logs',2,16,1,'2'),(17,'机构管理','/security/brch_list.jhtml','1','机构的添加修改及机构权限的分配','menu_Branch_Management',2,17,1,'3'),(18,'机构权限复核','/audit/audit_auditMain.jhtml?prodNo=BRCH_FUNC_AUDIT','1',NULL,'menu_permission.brchfuncaudit',2,18,1,'3'),(19,'角色管理','/security/role_mainPage.jhtml','1','机构角色定义及与权限的绑定','menu_Define_Brch_Role',2,19,1,'3'),(20,'用户管理','/security/user_mainPage.jhtml','1','机构用户信息的维护及角色绑定','menu_Define_Brch_User',2,20,1,'3'),(21,'用户权限复核','/','1',NULL,NULL,2,21,1,'3'),(22,'管理人员权限复核','/audit/audit_auditMain.jhtml?prodNo=BRMG_FUNC_AUDIT','1',NULL,'menu_permission.brmgfuncaudit',21,22,1,'3'),(23,'普通人员权限复核','/audit/audit_auditMain.jhtml?prodNo=BUUS_FUNC_AUDIT','1',NULL,'menu_permission.buusfuncaudit',21,23,1,'3'),(24,'参数管理','/security/sys_param_list.jhtml','1','参数配置','menu_Parameter_Management',2,24,1,'3'),(25,'参数复核','/audit/audit_auditMain.jhtml?prodNo=SYS_PARAM_AUDIT','1',NULL,'menu_permission.sysparamaudit',2,25,1,'3'),(50,'产品管理',NULL,'0',NULL,NULL,1,2,1,'1'),(51,'定义产品','/product/product_mainPage.jhtml','1','定义产品信息','menu_Product_Definition',50,1,1,'1'),(52,'接入点产品分配','/product//product_memberProdMain.jhtml','1','产品分配给接入点','menu_Member_Product_Assign',50,2,1,'2'),(53,'接入产品维护','/product/product_memberMain.jhtml','1',NULL,'menu_Product_Member_Definition',50,3,1,'3'),(54,'机构产品分配','/product/product_brchProdMain.jhtml','1',NULL,'menu_Brch_Product_Assign',50,4,1,'3'),(55,'机构产品复核','/product/product_brchProdCheckMain.jhtml','1',NULL,'menu_Brch_Product_Check',50,5,1,'3'),(56,'属性管理','/product/attr_main.jhtml','1',NULL,'menu_product.attributes.management',50,6,1,'1'),(57,'接入点产品属性','/product/product_memberProdAttrs.jhtml','1',NULL,'menu_member.product.attributes',50,7,1,'2'),(60,'工作流',NULL,'0',NULL,'menu_BPM',1,3,1,'1'),(61,'流程定义','/bpm/publish_main.jhtml','1',NULL,'menu_Process_Define',60,2,1,'1'),(62,'接入点流程分配','/bpm/procmap_memberMain.jhtml','1',NULL,'menu_Member_Process',60,3,1,'2'),(63,'机构流程分配','/bpm/procmap_brchMain.jhtml','1',NULL,'menu_Branch_Process',60,4,1,'3'),(64,'任务授权','/bpm/taskassign_main.jhtml','1',NULL,'menu_Task_Assign',60,5,1,'3'),(65,'任务批量授权','/bpm/taskassignex_main.jhtml','1',NULL,'menu_Batch_TaskAssign',60,6,1,'3'),(66,'流程监控','/bpm/activity_main.jhtml','1',NULL,'menu_Bpm_Activity',60,7,1,'2'),(67,'流程数据归档','/bpm/dataClear_main.jhtml','1',NULL,'menu_Bpm_Data_Clear',60,8,1,'2'),(68,'任务授权复制','/bpm/taskassign_toCopy.jhtml','1',NULL,'menu_Bpm_task_copy',60,9,1,'3'),(70,'审批管理',NULL,'0',NULL,'menu_Audit_Management',1,4,1,'3'),(71,'定义审批路线','/audit/audit_auditRouteMain.jhtml','1','定义审批路线、节点、岗位','menu_Audit_Definition',70,2,1,'3'),(72,'产品审批设置','/audit/audit_setProduct.jhtml','1','选择机构自己的产品审批路线，及岗位设置','menu_Product_Audit_Set',70,3,1,'3'),(73,'岗位人员分配','/audit/audit_auditStationUserMain.jhtml','1','为审批岗位分配审批人员','menu_Assign_Station_User',70,4,1,'3'),(90,'字典管理',NULL,'0',NULL,'menu_dictionary',1,5,1,'1'),(91,'字典元管理','/dictionary/codeMeta_main.jhtml','1',NULL,'menu_codemeta',90,1,1,'1'),(92,'字典管理','/dictionary/code_main.jhtml','1',NULL,'menu_code',90,2,1,'1'),(93,'字段映射管理','/dictionary/fieldcodemap_main.jhtml','1',NULL,'menu_fieldmap',90,3,1,'1'),(130,'定时任务',NULL,'0',NULL,NULL,1,7,1,'2'),(131,'定时任务定义','/autotask/define_main.jhtml','1',NULL,'menu_autotask.define',130,1,1,'2'),(132,'定时任务监控','/autotask/active_main.jhtml','1',NULL,'menu_autotask.active',130,2,1,'2'),(133,'定时任务日志','/autotask/log_main.jhtml','1',NULL,'menu_autotask.log',130,3,1,'2');
/*!40000 ALTER TABLE `sysfunc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_trace_info`
--

DROP TABLE IF EXISTS `task_trace_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_trace_info` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DEAL_USER_ID` int(11) DEFAULT NULL,
  `IS_AGREE` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `TASK_ID` varchar(50) DEFAULT NULL,
  `ENTITY_ID` int(11) DEFAULT NULL,
  `DEAL_USER_NAME` varchar(255) DEFAULT NULL,
  `TASK_NAME` varchar(255) DEFAULT NULL,
  `PROCESS_NAME` varchar(255) DEFAULT NULL,
  `PROD_NO` varchar(50) DEFAULT NULL,
  `HOLD_ACTOR` varchar(50) DEFAULT NULL,
  `HOLD_TIME` datetime DEFAULT NULL,
  `DEAL_TIME` datetime DEFAULT NULL,
  `IS_AUDIT` char(1) DEFAULT NULL,
  `STATION_ID` int(11) DEFAULT NULL,
  `ACTOR` varchar(50) DEFAULT NULL,
  `BUSINESS_DATA` varchar(4000) DEFAULT NULL COMMENT '扩展业务数据',
  `BUSINESS_TYPE` varchar(255) DEFAULT NULL COMMENT '业务数据类型',
  `APPROVAL_OPINION` varchar(2) DEFAULT NULL COMMENT '审批意见',
  `DELEGATE_USER` varchar(50) DEFAULT NULL,
  `DELEGATE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_trace_info`
--

LOCK TABLES `task_trace_info` WRITE;
/*!40000 ALTER TABLE `task_trace_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_trace_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_log`
--

DROP TABLE IF EXISTS `user_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `SYS_USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `BRCH_ID` int(11) DEFAULT NULL COMMENT '机构ID',
  `MI_NO` varchar(50) DEFAULT NULL COMMENT '接入点编号',
  `LOG_TM` datetime DEFAULT NULL COMMENT '登录时间',
  `LOG_INFO` varchar(500) DEFAULT NULL COMMENT '登录信息',
  `ACTIVITY_TYPE` char(1) DEFAULT NULL COMMENT '日志类型',
  `VER` smallint(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_log`
--

LOCK TABLES `user_activity_log` WRITE;
/*!40000 ALTER TABLE `user_activity_log` DISABLE KEYS */;
INSERT INTO `user_activity_log` VALUES (1,1,NULL,NULL,'2017-12-14 17:24:11','登陆',NULL,0),(2,1,NULL,NULL,'2017-12-14 17:35:24','登陆',NULL,0),(3,1,NULL,NULL,'2017-12-14 18:00:34','登陆',NULL,0),(4,1,NULL,NULL,'2017-12-14 18:16:18','登陆',NULL,0),(5,1,NULL,NULL,'2017-12-14 18:26:44','登陆',NULL,0),(6,2,NULL,NULL,'2017-12-14 18:58:10','登陆',NULL,0),(7,2,NULL,NULL,'2017-12-14 19:25:29','登陆',NULL,0),(8,2,NULL,NULL,'2017-12-14 19:26:14','退出',NULL,0),(9,3,1,'0001','2017-12-14 19:26:22','登陆',NULL,0),(10,3,1,'0001','2017-12-14 19:27:00','退出',NULL,0),(11,1,NULL,NULL,'2017-12-14 19:27:14','登陆',NULL,0),(12,1,NULL,NULL,'2017-12-14 19:29:37','登陆',NULL,0),(13,1,NULL,NULL,'2017-12-14 19:35:33','登陆',NULL,0),(14,1,NULL,NULL,'2017-12-14 19:38:01','登陆',NULL,0),(15,1,NULL,NULL,'2017-12-14 19:46:15','登陆',NULL,0),(16,3,1,'0001','2017-12-14 19:53:06','登陆',NULL,0),(17,3,1,'0001','2017-12-14 20:03:05','登陆',NULL,0),(18,3,1,'0001','2017-12-14 20:03:24','退出',NULL,0),(19,3,1,'0001','2017-12-14 20:03:37','登陆',NULL,0),(20,1,NULL,NULL,'2017-12-14 20:28:45','登陆',NULL,0),(21,3,1,'0001','2017-12-14 20:35:35','登陆',NULL,0),(22,3,1,'0001','2017-12-14 20:40:15','退出',NULL,0),(23,4,8,'0001','2017-12-14 20:40:28','登陆',NULL,0),(24,1,NULL,NULL,'2017-12-14 20:42:35','登陆',NULL,0);
/*!40000 ALTER TABLE `user_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_log`
--

DROP TABLE IF EXISTS `zjbpm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` varchar(4000) DEFAULT NULL,
  `EXCEPTION_` varchar(4000) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` float DEFAULT NULL,
  `NEWDOUBLEVALUE_` float DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `NEWSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_log`
--

LOCK TABLES `zjbpm_log` WRITE;
/*!40000 ALTER TABLE `zjbpm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_moduleinstance`
--

DROP TABLE IF EXISTS `zjbpm_moduleinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_moduleinstance`
--

LOCK TABLES `zjbpm_moduleinstance` WRITE;
/*!40000 ALTER TABLE `zjbpm_moduleinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_moduleinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_pooledactor`
--

DROP TABLE IF EXISTS `zjbpm_pooledactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_pooledactor`
--

LOCK TABLES `zjbpm_pooledactor` WRITE;
/*!40000 ALTER TABLE `zjbpm_pooledactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_pooledactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_processinstance`
--

DROP TABLE IF EXISTS `zjbpm_processinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_processinstance`
--

LOCK TABLES `zjbpm_processinstance` WRITE;
/*!40000 ALTER TABLE `zjbpm_processinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_processinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_taskactor`
--

DROP TABLE IF EXISTS `zjbpm_taskactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_taskactor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TI_ID` bigint(20) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTOR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_taskactor`
--

LOCK TABLES `zjbpm_taskactor` WRITE;
/*!40000 ALTER TABLE `zjbpm_taskactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_taskactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_taskactorpool`
--

DROP TABLE IF EXISTS `zjbpm_taskactorpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL AUTO_INCREMENT,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_taskactorpool`
--

LOCK TABLES `zjbpm_taskactorpool` WRITE;
/*!40000 ALTER TABLE `zjbpm_taskactorpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_taskactorpool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_taskinstance`
--

DROP TABLE IF EXISTS `zjbpm_taskinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  `PREACTOR_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_taskinstance`
--

LOCK TABLES `zjbpm_taskinstance` WRITE;
/*!40000 ALTER TABLE `zjbpm_taskinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_taskinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_token`
--

DROP TABLE IF EXISTS `zjbpm_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `LOCK_` varchar(255) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PROCNAMEKEY_` varchar(50) DEFAULT NULL,
  `ENTITYID_` bigint(20) DEFAULT NULL,
  `BRCHID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_token`
--

LOCK TABLES `zjbpm_token` WRITE;
/*!40000 ALTER TABLE `zjbpm_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_tokenvariablemap`
--

DROP TABLE IF EXISTS `zjbpm_tokenvariablemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_tokenvariablemap`
--

LOCK TABLES `zjbpm_tokenvariablemap` WRITE;
/*!40000 ALTER TABLE `zjbpm_tokenvariablemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_tokenvariablemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_transition`
--

DROP TABLE IF EXISTS `zjbpm_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_transition`
--

LOCK TABLES `zjbpm_transition` WRITE;
/*!40000 ALTER TABLE `zjbpm_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjbpm_variableinstance`
--

DROP TABLE IF EXISTS `zjbpm_variableinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zjbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` float DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(4000) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjbpm_variableinstance`
--

LOCK TABLES `zjbpm_variableinstance` WRITE;
/*!40000 ALTER TABLE `zjbpm_variableinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjbpm_variableinstance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 20:58:43

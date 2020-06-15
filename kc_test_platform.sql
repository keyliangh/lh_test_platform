/*
 Navicat Premium Data Transfer

 Source Server         : testmysql.kctest
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : kc_test_platform

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/06/2020 15:47:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apitest_api
-- ----------------------------
DROP TABLE IF EXISTS `apitest_api`;
CREATE TABLE `apitest_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `http_method` varchar(50) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `headers` longtext,
  `data` longtext,
  `description` varchar(1024) DEFAULT NULL,
  `expect_code` varchar(10) NOT NULL,
  `expect_content` varchar(200) DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_api_host_id_44727e3f_fk_apitest_host_id` (`host_id`),
  KEY `apitest_api_project_id_2a4a0341_fk_apitest_project_id` (`project_id`),
  CONSTRAINT `apitest_api_host_id_44727e3f_fk_apitest_host_id` FOREIGN KEY (`host_id`) REFERENCES `apitest_host` (`id`),
  CONSTRAINT `apitest_api_project_id_2a4a0341_fk_apitest_project_id` FOREIGN KEY (`project_id`) REFERENCES `apitest_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_api
-- ----------------------------
BEGIN;
INSERT INTO `apitest_api` VALUES (12, '机油列表', 'POST', '/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', '[]', '[]', '', '200', '门店', 23, 64);
INSERT INTO `apitest_api` VALUES (15, '油汽列表接口', 'POST', 'api/seller/supplier/supplierList?pagerStart=1&pagerSize=10&lng=112.5605965169271&lat=37.78589274088542&cooperationModel=&code=&codeType=&goodsName=', '[]', '[]', '', '200', '', 23, 64);
INSERT INTO `apitest_api` VALUES (16, '测试接口', 'POST', '/router', '[]', '[{\"name\":\"sign\",\"value\":\"9F6CC0456BD306D69E736EFE4985337D\"},{\"name\":\"sign_method\",\"value\":\"hmac\"},{\"name\":\"timestamp\",\"value\":\"1591007906266\"},{\"name\":\"v\",\"value\":\"1.0\"},{\"name\":\"orderNo\",\"value\":\"ORD2019121713285944286941qwe\"},{\"name\":\"remark\",\"value\":\"支付成功\"},{\"name\":\"status\",\"value\":\"FINISHED&session=986416416028758016\"},{\"name\":\"app_key\",\"value\":\"38D4D21B78F6B779751061CF6B86E377\"},{\"name\":\"method\",\"value\":\"api.kcl.order.account.status.updateByOrderNo\"},{\"name\":\"format\",\"value\":\"json\"}]', '', '200', '', 24, 64);
COMMIT;

-- ----------------------------
-- Table structure for apitest_apiargument
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apiargument`;
CREATE TABLE `apitest_apiargument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `format` varchar(100) NOT NULL,
  `api_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_apiargument_api_id_537587d5_fk_apitest_api_id` (`api_id`),
  CONSTRAINT `apitest_apiargument_api_id_537587d5_fk_apitest_api_id` FOREIGN KEY (`api_id`) REFERENCES `apitest_api` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_apiargument
-- ----------------------------
BEGIN;
INSERT INTO `apitest_apiargument` VALUES (1, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (2, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (3, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (4, '11', 'BODY', '11111', NULL);
INSERT INTO `apitest_apiargument` VALUES (5, '11', 'COOKIE', '111111', NULL);
INSERT INTO `apitest_apiargument` VALUES (7, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (8, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (9, 'das', 'COOKIE', '11', NULL);
INSERT INTO `apitest_apiargument` VALUES (10, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (11, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (12, '12', 'HEADER', '123', NULL);
INSERT INTO `apitest_apiargument` VALUES (13, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (14, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (15, 'token', 'BODY', 'token2', NULL);
INSERT INTO `apitest_apiargument` VALUES (16, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (17, 'token', 'BODY', 'token', NULL);
INSERT INTO `apitest_apiargument` VALUES (19, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (20, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (21, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (22, '12', 'BODY', '123', NULL);
INSERT INTO `apitest_apiargument` VALUES (23, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (24, '12', 'BODY', '123', NULL);
INSERT INTO `apitest_apiargument` VALUES (25, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (26, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (27, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (28, 'qw', 'HEADER', 'ew', NULL);
INSERT INTO `apitest_apiargument` VALUES (29, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (30, 'qw', 'BODY', 'ew', NULL);
INSERT INTO `apitest_apiargument` VALUES (31, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (32, 'qw', 'COOKIE', 'ew', NULL);
INSERT INTO `apitest_apiargument` VALUES (33, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (34, 'qw', 'BODY', 'ew', NULL);
INSERT INTO `apitest_apiargument` VALUES (35, 'q', 'HEADER', 'q', NULL);
INSERT INTO `apitest_apiargument` VALUES (37, '1', 'BODY', '11', NULL);
INSERT INTO `apitest_apiargument` VALUES (38, 'asd', 'BODY', 'asd', NULL);
INSERT INTO `apitest_apiargument` VALUES (39, '1', 'BODY', '11', NULL);
INSERT INTO `apitest_apiargument` VALUES (40, 'asd', 'BODY', 'asd', NULL);
INSERT INTO `apitest_apiargument` VALUES (41, '1', 'BODY', '11', 12);
COMMIT;

-- ----------------------------
-- Table structure for apitest_apirunrecord
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apirunrecord`;
CREATE TABLE `apitest_apirunrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `http_method` varchar(10) NOT NULL,
  `data` longtext,
  `headers` longtext,
  `create_time` datetime(6) NOT NULL,
  `return_code` varchar(10) NOT NULL,
  `return_content` longtext,
  `api_id` int(11) DEFAULT NULL,
  `user_id` varchar(22) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_apirunrecord_api_id_343e8f2c_fk_apitest_api_id` (`api_id`),
  KEY `apitest_apirunrecord_user_id_0b0723d5_fk_kcauth_kcuser_uid` (`user_id`),
  CONSTRAINT `apitest_apirunrecord_api_id_343e8f2c_fk_apitest_api_id` FOREIGN KEY (`api_id`) REFERENCES `apitest_api` (`id`),
  CONSTRAINT `apitest_apirunrecord_user_id_0b0723d5_fk_kcauth_kcuser_uid` FOREIGN KEY (`user_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_apirunrecord
-- ----------------------------
BEGIN;
INSERT INTO `apitest_apirunrecord` VALUES (25, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', NULL, '[]', '2020-06-01 09:19:51.902154', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (26, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', NULL, '[]', '2020-06-01 09:22:00.631985', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (27, 'https://testh5.kcwlmall.com/router', 'GET', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:14:49.577560', '500', '{\"timestamp\":\"2020-06-02 10:14:49\",\"status\":500,\"error\":\"Internal Server Error\",\"message\":\"No message available\",\"path\":\"/router\"}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (28, 'https://testh5.kcwlmall.com/router', 'POST', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:15:03.715579', '200', '{\"result\":0,\"errors\":[{\"code\":\"400\",\"type\":\"failure\",\"message\":\"session不能为空\"},{\"code\":\"400\",\"type\":\"failure\",\"message\":\"订单不存在\"}]}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (29, 'https://testh5.kcwlmall.com/router', 'GET', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:16:16.012907', '500', '{\"timestamp\":\"2020-06-02 10:16:16\",\"status\":500,\"error\":\"Internal Server Error\",\"message\":\"No message available\",\"path\":\"/router\"}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (30, 'https://testh5.kcwlmall.com/router', 'POST', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:16:37.808014', '200', '{\"result\":0,\"errors\":[{\"code\":\"400\",\"type\":\"failure\",\"message\":\"session不能为空\"},{\"code\":\"400\",\"type\":\"failure\",\"message\":\"订单不存在\"}]}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (31, 'http://testh5.kcwlmall.com/router', 'GET', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:17:17.707727', '500', '{\"timestamp\":\"2020-06-02 10:17:17\",\"status\":500,\"error\":\"Internal Server Error\",\"message\":\"No message available\",\"path\":\"/router\"}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (32, 'http://testh5.kcwlmall.com/router', 'GET', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:17:27.458646', '500', '{\"timestamp\":\"2020-06-02 10:17:27\",\"status\":500,\"error\":\"Internal Server Error\",\"message\":\"No message available\",\"path\":\"/router\"}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (33, 'http://testh5.kcwlmall.com/router', 'POST', 'sign=9F6CC0456BD306D69E736EFE4985337D&sign_method=hmac&timestamp=1591007906266&v=1.0&orderNo=ORD2019121713285944286941qwe&remark=%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F&status=FINISHED%26session%3D986416416028758016&app_key=38D4D21B78F6B779751061CF6B86E377&method=api.kcl.order.account.status.updateByOrderNo&format=json', '[]', '2020-06-02 02:17:35.107273', '200', '{\"result\":0,\"errors\":[{\"code\":\"400\",\"type\":\"failure\",\"message\":\"session不能为空\"},{\"code\":\"400\",\"type\":\"failure\",\"message\":\"订单不存在\"}]}', 16, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (34, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', NULL, '[]', '2020-06-05 16:34:12.617438', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_apirunrecord` VALUES (35, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', NULL, '[]', '2020-06-08 03:36:41.491305', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1},{\"actualSales\":145,\"commentsNumber\":0,\"id\":597,\"malMobilePrice\":23.0,\"mallPcPrice\":23.0,\"marketPrice\":23.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-imghttps://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/0f71ff7a-0ba6-40bf-89c8-afad805e4b50.png\",\"name1\":\"bbbb\",\"productStock\":23,\"sellerId\":1},{\"actualSales\":134,\"commentsNumber\":0,\"id\":593,\"malMobilePrice\":12.0,\"mallPcPrice\":12.0,\"marketPrice\":12.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-imghttps://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/f5890b30-23de-4e51-8538-96cb52d6290f.png\",\"name1\":\"ppppp\",\"productStock\":12,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":5}', 12, 'NaBt3eKRDqvSP8D3sw9Uoo');
COMMIT;

-- ----------------------------
-- Table structure for apitest_case
-- ----------------------------
DROP TABLE IF EXISTS `apitest_case`;
CREATE TABLE `apitest_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_case_project_id_d1cb0e34_fk_apitest_project_id` (`project_id`),
  KEY `apitest_case_user_id_3c8af272_fk_kcauth_kcuser_uid` (`user_id`),
  CONSTRAINT `apitest_case_project_id_d1cb0e34_fk_apitest_project_id` FOREIGN KEY (`project_id`) REFERENCES `apitest_project` (`id`),
  CONSTRAINT `apitest_case_user_id_3c8af272_fk_kcauth_kcuser_uid` FOREIGN KEY (`user_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_case
-- ----------------------------
BEGIN;
INSERT INTO `apitest_case` VALUES (11, '快乐购H5接口', '', '2020-06-01 09:24:57.537983', 64, 'NaBt3eKRDqvSP8D3sw9Uoo');
COMMIT;

-- ----------------------------
-- Table structure for apitest_case_api_list
-- ----------------------------
DROP TABLE IF EXISTS `apitest_case_api_list`;
CREATE TABLE `apitest_case_api_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apitest_case_api_list_case_id_api_id_965362db_uniq` (`case_id`,`api_id`),
  KEY `apitest_case_api_list_api_id_c8a72314_fk_apitest_api_id` (`api_id`),
  CONSTRAINT `apitest_case_api_list_api_id_c8a72314_fk_apitest_api_id` FOREIGN KEY (`api_id`) REFERENCES `apitest_api` (`id`),
  CONSTRAINT `apitest_case_api_list_case_id_770c3084_fk_apitest_case_id` FOREIGN KEY (`case_id`) REFERENCES `apitest_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_case_api_list
-- ----------------------------
BEGIN;
INSERT INTO `apitest_case_api_list` VALUES (18, 11, 12);
INSERT INTO `apitest_case_api_list` VALUES (26, 11, 15);
COMMIT;

-- ----------------------------
-- Table structure for apitest_caseapirunrecord
-- ----------------------------
DROP TABLE IF EXISTS `apitest_caseapirunrecord`;
CREATE TABLE `apitest_caseapirunrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `http_method` varchar(10) NOT NULL,
  `headers` longtext,
  `data` longtext,
  `create_time` datetime(6) NOT NULL,
  `return_code` varchar(10) NOT NULL,
  `return_content` longtext,
  `api_id` int(11) DEFAULT NULL,
  `case_record_id` int(11) NOT NULL,
  `user_id` varchar(22) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_caseapirunrecord_api_id_35fef186_fk_apitest_api_id` (`api_id`),
  KEY `apitest_caseapirunre_case_record_id_38218a28_fk_apitest_c` (`case_record_id`),
  KEY `apitest_caseapirunrecord_user_id_87dce8ae_fk_kcauth_kcuser_uid` (`user_id`),
  CONSTRAINT `apitest_caseapirunre_case_record_id_38218a28_fk_apitest_c` FOREIGN KEY (`case_record_id`) REFERENCES `apitest_caserunrecord` (`id`),
  CONSTRAINT `apitest_caseapirunrecord_api_id_35fef186_fk_apitest_api_id` FOREIGN KEY (`api_id`) REFERENCES `apitest_api` (`id`),
  CONSTRAINT `apitest_caseapirunrecord_user_id_87dce8ae_fk_kcauth_kcuser_uid` FOREIGN KEY (`user_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_caseapirunrecord
-- ----------------------------
BEGIN;
INSERT INTO `apitest_caseapirunrecord` VALUES (60, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-01 03:40:47.123855', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 58, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_caseapirunrecord` VALUES (61, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-01 08:08:26.545465', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 59, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_caseapirunrecord` VALUES (62, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-01 09:25:00.226561', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 60, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_caseapirunrecord` VALUES (63, 'https://testh5api.kcwlmall.com/api/seller/supplier/supplierList?pagerStart=1&pagerSize=10&lng=112.5605965169271&lat=37.78589274088542&cooperationModel=&code=&codeType=&goodsName=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-01 09:25:00.413917', '200', '{\"code\":\"200\",\"data\":[{\"supplierName\":\"我我也是醉了\",\"distance\":\"24\",\"lng\":112.560616,\"baseAddress\":\"山西省太原市小店区山西国新科莱天然气有限公司学府园区营业大厅\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/8237e800-97c6-4a04-80bd-def2f9359611.png\",\"phone\":\"15968114212\",\"id\":\"1060421260745511413\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-25 11:20:58\",\"delFlag\":\"0\",\"id\":165,\"marketId\":9,\"name\":\"测试\",\"supplierId\":\"1060421260745511413\",\"updateDate\":\"2020-02-25 11:20:58\"}],\"lat\":37.785677},{\"supplierName\":\"宋庆庆加气站\",\"distance\":\"45\",\"lng\":112.560942,\"baseAddress\":\"山西省太原市小店区太原高新技术产业开发区巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/10853802-2d49-49d2-b5ed-70ec377e3376.jpg\",\"phone\":\"15003431913\",\"id\":\"1060421260745511401\",\"supplierTagMarkets\":[{\"createDate\":\"2020-03-01 11:45:55\",\"delFlag\":\"0\",\"id\":217,\"marketId\":25,\"name\":\"看电影\",\"supplierId\":\"1060421260745511401\",\"updateDate\":\"2020-03-01 11:45:55\"},{\"createDate\":\"2020-03-01 11:45:55\",\"delFlag\":\"0\",\"id\":219,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511401\",\"updateDate\":\"2020-03-01 11:45:55\"}],\"lat\":37.786186},{\"supplierName\":\"梁浩加气站20200407\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-05-22 17:51:20\",\"delFlag\":\"0\",\"id\":1549,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511529\",\"updateDate\":\"2020-05-22 17:51:20\"}],\"mainBusiness\":\"<a href=\\\"javascript:window.opener = null;window.open(\'\', \'_self\');window.close();>关闭</a>\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/4e3983e5-04c2-4f8e-96d1-31386b96a034.png\",\"phone\":\"18634406059\",\"id\":\"1060421260745511529\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"梁浩加油站20200522\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1551,\"name\":\"标签1\",\"serviceId\":51,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"},{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1555,\"name\":\"保养\",\"serviceId\":13,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"},{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1553,\"name\":\"标签3\",\"serviceId\":55,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"}],\"mainBusiness\":\"阿诗丹顿啊是撒的阿萨德阿萨德撒的\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/99a7ec47-ee3d-4b48-aedb-df048c91ec65.png\",\"phone\":\"17636689468\",\"id\":\"1060421260745511489\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":185,\"marketId\":21,\"name\":\"7777777\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":187,\"marketId\":9,\"name\":\"测试\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":189,\"marketId\":7,\"name\":\"标签名称\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":191,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":193,\"marketId\":19,\"name\":\"66666\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"}],\"lat\":37.786269},{\"supplierName\":\"李斌的商铺\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":591,\"name\":\"保养\",\"serviceId\":13,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"},{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":593,\"name\":\"住宿\",\"serviceId\":17,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"},{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":595,\"name\":\"吃饭\",\"serviceId\":15,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"}],\"mainBusiness\":\"你好，你是谁\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/62fad248-74e3-4b22-8724-23a5b37fd325.png\",\"phone\":\"88888888\",\"id\":\"1060421260745511429\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"巨鑫加油站\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":939,\"name\":\"标签1\",\"serviceId\":51,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":941,\"name\":\"标签3\",\"serviceId\":55,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":943,\"name\":\"吃饭\",\"serviceId\":15,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":945,\"name\":\"标签8\",\"serviceId\":65,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":947,\"name\":\"标签9\",\"serviceId\":67,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":949,\"name\":\"看电影6666\",\"serviceId\":31,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":951,\"name\":\"55\",\"serviceId\":35,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"}],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/8a269496-8fb8-473e-a020-4dc01affcb28.jpg\",\"phone\":\"19935117809\",\"id\":\"1060421260745511445\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"燕子测试气站\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-03-27 14:21:44\",\"delFlag\":\"0\",\"id\":863,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511515\",\"updateDate\":\"2020-03-27 14:21:44\"}],\"mainBusiness\":\"我婆婆好哦\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5852553d-bafe-41ff-96c8-f6a452ddf5cf.jpg\",\"phone\":\"03495084560\",\"id\":\"1060421260745511515\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"万柏林区燕子服务车1\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/7e52d638-adb6-412b-a2cf-7fca1d7de686.png\",\"phone\":\"03495084560\",\"id\":\"1060421260745511423\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-25 11:07:25\",\"delFlag\":\"0\",\"id\":161,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511423\",\"updateDate\":\"2020-02-25 11:07:25\"}],\"lat\":37.786269},{\"supplierName\":\"测试一下截图\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-06-01 10:33:19\",\"delFlag\":\"0\",\"id\":1799,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511521\",\"updateDate\":\"2020-06-01 10:33:19\"}],\"mainBusiness\":\"发士大夫撒地方第三方代发的法撒旦飞洒东方闪电地方撒打发士大夫撒的辅导费水电费的电风扇多福多寿的发的发生大撒范德萨发\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/f9941e47-e283-44c2-8e3c-7bebc25993d1.png\",\"phone\":\"03495084560\",\"id\":\"1060421260745511521\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"sun的门店\",\"distance\":\"51\",\"lng\":112.560933,\"baseAddress\":\"山西省太原市小店区太原高新技术产业开发区巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/82ac3cca-18fa-45df-a0fe-5e5dda62e124.png\",\"phone\":\"13620619836\",\"id\":\"1060421260745511541\",\"supplierTagMarkets\":[],\"lat\":37.786267}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":128}', 15, 60, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_caseapirunrecord` VALUES (64, 'https://testh5api.kcwlmall.com/api/product/list?cateId=35&page=1&rows=10&sort=0&brandId=&attrsStr=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-02 02:09:03.078189', '200', '{\"code\":\"200\",\"data\":[{\"actualSales\":10,\"commentsNumber\":0,\"id\":459,\"malMobilePrice\":25.0,\"mallPcPrice\":25.0,\"marketPrice\":30.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5bc136ed-f0e2-4300-908f-342f86c65304.jfif\",\"name1\":\"促销机油002\",\"productStock\":100,\"sellerId\":1},{\"actualSales\":1,\"commentsNumber\":0,\"id\":455,\"malMobilePrice\":1.0,\"mallPcPrice\":1.0,\"marketPrice\":1.0,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/b71a3607-4661-41e6-b5ed-01b50f54431b.jpg\",\"name1\":\"测试没有门店\",\"productStock\":2,\"sellerId\":1},{\"actualSales\":23,\"commentsNumber\":0,\"id\":401,\"malMobilePrice\":0.01,\"mallPcPrice\":0.01,\"marketPrice\":0.01,\"masterImg\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/41b92119-819b-4814-8d48-72ce55e48d58.jpg\",\"name1\":\"测试机油，测试环境数据，请勿购买\",\"productStock\":7,\"sellerId\":1}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":3}', 12, 61, 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_caseapirunrecord` VALUES (65, 'https://testh5api.kcwlmall.com/api/seller/supplier/supplierList?pagerStart=1&pagerSize=10&lng=112.5605965169271&lat=37.78589274088542&cooperationModel=&code=&codeType=&goodsName=', 'POST', '{\'User-Agent\': \'python-requests/2.23.0\', \'Accept-Encoding\': \'gzip, deflate\', \'Accept\': \'*/*\', \'Connection\': \'keep-alive\', \'Content-Length\': \'0\'}', NULL, '2020-06-02 02:09:03.400579', '200', '{\"code\":\"200\",\"data\":[{\"supplierName\":\"我我也是醉了\",\"distance\":\"24\",\"lng\":112.560616,\"baseAddress\":\"山西省太原市小店区山西国新科莱天然气有限公司学府园区营业大厅\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/8237e800-97c6-4a04-80bd-def2f9359611.png\",\"phone\":\"15968114212\",\"id\":\"1060421260745511413\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-25 11:20:58\",\"delFlag\":\"0\",\"id\":165,\"marketId\":9,\"name\":\"测试\",\"supplierId\":\"1060421260745511413\",\"updateDate\":\"2020-02-25 11:20:58\"}],\"lat\":37.785677},{\"supplierName\":\"宋庆庆加气站\",\"distance\":\"45\",\"lng\":112.560942,\"baseAddress\":\"山西省太原市小店区太原高新技术产业开发区巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/10853802-2d49-49d2-b5ed-70ec377e3376.jpg\",\"phone\":\"15003431913\",\"id\":\"1060421260745511401\",\"supplierTagMarkets\":[{\"createDate\":\"2020-03-01 11:45:55\",\"delFlag\":\"0\",\"id\":217,\"marketId\":25,\"name\":\"看电影\",\"supplierId\":\"1060421260745511401\",\"updateDate\":\"2020-03-01 11:45:55\"},{\"createDate\":\"2020-03-01 11:45:55\",\"delFlag\":\"0\",\"id\":219,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511401\",\"updateDate\":\"2020-03-01 11:45:55\"}],\"lat\":37.786186},{\"supplierName\":\"梁浩加油站20200522\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1551,\"name\":\"标签1\",\"serviceId\":51,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"},{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1555,\"name\":\"保养\",\"serviceId\":13,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"},{\"createDate\":\"2020-05-22 17:53:35\",\"delFlag\":\"0\",\"id\":1553,\"name\":\"标签3\",\"serviceId\":55,\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-05-22 17:53:35\"}],\"mainBusiness\":\"阿诗丹顿啊是撒的阿萨德阿萨德撒的\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/99a7ec47-ee3d-4b48-aedb-df048c91ec65.png\",\"phone\":\"17636689468\",\"id\":\"1060421260745511489\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":185,\"marketId\":21,\"name\":\"7777777\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":187,\"marketId\":9,\"name\":\"测试\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":189,\"marketId\":7,\"name\":\"标签名称\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":191,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"},{\"createDate\":\"2020-02-27 16:55:50\",\"delFlag\":\"0\",\"id\":193,\"marketId\":19,\"name\":\"66666\",\"supplierId\":\"1060421260745511489\",\"updateDate\":\"2020-02-27 16:55:50\"}],\"lat\":37.786269},{\"supplierName\":\"巨鑫加油站\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":939,\"name\":\"标签1\",\"serviceId\":51,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":941,\"name\":\"标签3\",\"serviceId\":55,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":943,\"name\":\"吃饭\",\"serviceId\":15,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":945,\"name\":\"标签8\",\"serviceId\":65,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":947,\"name\":\"标签9\",\"serviceId\":67,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":949,\"name\":\"看电影6666\",\"serviceId\":31,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"},{\"createDate\":\"2020-04-02 09:42:13\",\"delFlag\":\"0\",\"id\":951,\"name\":\"55\",\"serviceId\":35,\"supplierId\":\"1060421260745511445\",\"updateDate\":\"2020-04-02 09:42:13\"}],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/8a269496-8fb8-473e-a020-4dc01affcb28.jpg\",\"phone\":\"19935117809\",\"id\":\"1060421260745511445\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"燕子测试气站\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-03-27 14:21:44\",\"delFlag\":\"0\",\"id\":863,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511515\",\"updateDate\":\"2020-03-27 14:21:44\"}],\"mainBusiness\":\"我婆婆好哦\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/5852553d-bafe-41ff-96c8-f6a452ddf5cf.jpg\",\"phone\":\"03495084560\",\"id\":\"1060421260745511515\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"梁浩加气站20200407\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-05-22 17:51:20\",\"delFlag\":\"0\",\"id\":1549,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511529\",\"updateDate\":\"2020-05-22 17:51:20\"}],\"mainBusiness\":\"<a href=\\\"javascript:window.opener = null;window.open(\'\', \'_self\');window.close();>关闭</a>\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/4e3983e5-04c2-4f8e-96d1-31386b96a034.png\",\"phone\":\"18634406059\",\"id\":\"1060421260745511529\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"测试一下截图\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-06-01 10:33:19\",\"delFlag\":\"0\",\"id\":1799,\"name\":\"查看标签是否正常\",\"serviceId\":43,\"supplierId\":\"1060421260745511521\",\"updateDate\":\"2020-06-01 10:33:19\"}],\"mainBusiness\":\"发士大夫撒地方第三方代发的法撒旦飞洒东方闪电地方撒打发士大夫撒的辅导费水电费的电风扇多福多寿的发的发生大撒范德萨发\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/f9941e47-e283-44c2-8e3c-7bebc25993d1.png\",\"phone\":\"03495084560\",\"id\":\"1060421260745511521\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"李斌的商铺\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":591,\"name\":\"保养\",\"serviceId\":13,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"},{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":593,\"name\":\"住宿\",\"serviceId\":17,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"},{\"createDate\":\"2020-03-23 14:02:57\",\"delFlag\":\"0\",\"id\":595,\"name\":\"吃饭\",\"serviceId\":15,\"supplierId\":\"1060421260745511429\",\"updateDate\":\"2020-03-23 14:02:57\"}],\"mainBusiness\":\"你好，你是谁\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/62fad248-74e3-4b22-8724-23a5b37fd325.png\",\"phone\":\"88888888\",\"id\":\"1060421260745511429\",\"supplierTagMarkets\":[],\"lat\":37.786269},{\"supplierName\":\"万柏林区燕子服务车1\",\"distance\":\"50\",\"lng\":112.560912,\"baseAddress\":\"山西省太原市小店区巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/7e52d638-adb6-412b-a2cf-7fca1d7de686.png\",\"phone\":\"03495084560\",\"id\":\"1060421260745511423\",\"supplierTagMarkets\":[{\"createDate\":\"2020-02-25 11:07:25\",\"delFlag\":\"0\",\"id\":161,\"marketId\":5,\"name\":\"营销标签\",\"supplierId\":\"1060421260745511423\",\"updateDate\":\"2020-02-25 11:07:25\"}],\"lat\":37.786269},{\"supplierName\":\"宋庆庆的加油站\",\"distance\":\"83\",\"lng\":112.560573,\"baseAddress\":\"山西省太原市小店区太原高新技术产业开发区赛鼎街巨鑫国际\",\"supplierTagServices\":[],\"mainBusiness\":\"\",\"storePic\":\"https://kcwl-mall-test.oss-cn-beijing.aliyuncs.com/mall-img/cd37f979-6b66-4736-b468-5aab1756ff83.jpg\",\"phone\":\"351708015\",\"id\":\"1060421260745511217\",\"supplierTagMarkets\":[],\"lat\":37.786636}],\"footer\":[],\"rows\":[],\"success\":true,\"total\":69}', 15, 61, 'NaBt3eKRDqvSP8D3sw9Uoo');
COMMIT;

-- ----------------------------
-- Table structure for apitest_caseargument
-- ----------------------------
DROP TABLE IF EXISTS `apitest_caseargument`;
CREATE TABLE `apitest_caseargument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_caseargument_case_id_871320a2_fk_apitest_case_id` (`case_id`),
  CONSTRAINT `apitest_caseargument_case_id_871320a2_fk_apitest_case_id` FOREIGN KEY (`case_id`) REFERENCES `apitest_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_caseargument
-- ----------------------------
BEGIN;
INSERT INTO `apitest_caseargument` VALUES (67, '占位符', '1', NULL);
INSERT INTO `apitest_caseargument` VALUES (74, '123', '1', NULL);
INSERT INTO `apitest_caseargument` VALUES (76, '占位符', '1', 11);
COMMIT;

-- ----------------------------
-- Table structure for apitest_caserunrecord
-- ----------------------------
DROP TABLE IF EXISTS `apitest_caserunrecord`;
CREATE TABLE `apitest_caserunrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `case_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_caserunrecord_case_id_8b694fa4_fk_apitest_case_id` (`case_id`),
  CONSTRAINT `apitest_caserunrecord_case_id_8b694fa4_fk_apitest_case_id` FOREIGN KEY (`case_id`) REFERENCES `apitest_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_caserunrecord
-- ----------------------------
BEGIN;
INSERT INTO `apitest_caserunrecord` VALUES (58, '2020-06-01 03:40:46.880407', 11);
INSERT INTO `apitest_caserunrecord` VALUES (59, '2020-06-01 08:08:26.248637', 11);
INSERT INTO `apitest_caserunrecord` VALUES (60, '2020-06-01 09:25:00.086376', 11);
INSERT INTO `apitest_caserunrecord` VALUES (61, '2020-06-02 02:09:02.838851', 11);
COMMIT;

-- ----------------------------
-- Table structure for apitest_host
-- ----------------------------
DROP TABLE IF EXISTS `apitest_host`;
CREATE TABLE `apitest_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `host` varchar(1024) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_host_project_id_ac6b0041_fk_apitest_project_id` (`project_id`),
  CONSTRAINT `apitest_host_project_id_ac6b0041_fk_apitest_project_id` FOREIGN KEY (`project_id`) REFERENCES `apitest_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_host
-- ----------------------------
BEGIN;
INSERT INTO `apitest_host` VALUES (23, '快乐购测试地址', 'https://testh5api.kcwlmall.com', '', 64);
INSERT INTO `apitest_host` VALUES (24, 'H5测试地址', 'http://testh5.kcwlmall.com', '', 64);
COMMIT;

-- ----------------------------
-- Table structure for apitest_project
-- ----------------------------
DROP TABLE IF EXISTS `apitest_project`;
CREATE TABLE `apitest_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `last_update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_project_user_id_ecbb0ed7_fk_kcauth_kcuser_uid` (`user_id`),
  CONSTRAINT `apitest_project_user_id_ecbb0ed7_fk_kcauth_kcuser_uid` FOREIGN KEY (`user_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of apitest_project
-- ----------------------------
BEGIN;
INSERT INTO `apitest_project` VALUES (64, '快乐购项目', 'web', '撒大啊是的啊是的撒的啊是的啊是的啊是大大说大神啊是啊是多少啊啊是的撒啊是', '2020-06-09 04:49:39.918684', '2020-05-29 01:16:33.787825', 'NaBt3eKRDqvSP8D3sw9Uoo');
INSERT INTO `apitest_project` VALUES (65, '快福宝', 'app', '', '2020-06-09 03:11:25.728466', '2020-06-01 08:41:58.384347', NULL);
INSERT INTO `apitest_project` VALUES (66, '项目测试1', 'web', '1', '2020-06-09 03:08:23.341321', '2020-06-09 02:33:19.912175', NULL);
INSERT INTO `apitest_project` VALUES (67, '项目翻页测试', 'app', '', '2020-06-09 02:33:28.790490', '2020-06-09 02:33:28.790528', NULL);
INSERT INTO `apitest_project` VALUES (68, '翻页测试', 'web', '', '2020-06-09 02:33:39.241705', '2020-06-09 02:33:39.241738', NULL);
INSERT INTO `apitest_project` VALUES (69, '翻页测试', 'app', '', '2020-06-09 02:33:46.477915', '2020-06-09 02:33:46.477948', NULL);
INSERT INTO `apitest_project` VALUES (72, '123', 'web', '', '2020-06-09 03:20:40.079254', '2020-06-09 03:20:40.079370', NULL);
INSERT INTO `apitest_project` VALUES (73, '123', 'web', '12312', '2020-06-09 03:20:49.225608', '2020-06-09 03:20:49.225643', NULL);
INSERT INTO `apitest_project` VALUES (74, 'qw', 'web', '', '2020-06-09 03:24:57.411751', '2020-06-09 03:24:57.411783', NULL);
INSERT INTO `apitest_project` VALUES (75, 'wqw', 'web', 'qwe', '2020-06-09 03:30:14.237553', '2020-06-09 03:30:14.237614', NULL);
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add kc user', 6, 'add_kcuser');
INSERT INTO `auth_permission` VALUES (22, 'Can change kc user', 6, 'change_kcuser');
INSERT INTO `auth_permission` VALUES (23, 'Can delete kc user', 6, 'delete_kcuser');
INSERT INTO `auth_permission` VALUES (24, 'Can view kc user', 6, 'view_kcuser');
INSERT INTO `auth_permission` VALUES (25, 'Can add project', 7, 'add_project');
INSERT INTO `auth_permission` VALUES (26, 'Can change project', 7, 'change_project');
INSERT INTO `auth_permission` VALUES (27, 'Can delete project', 7, 'delete_project');
INSERT INTO `auth_permission` VALUES (28, 'Can view project', 7, 'view_project');
INSERT INTO `auth_permission` VALUES (29, 'Can add host', 8, 'add_host');
INSERT INTO `auth_permission` VALUES (30, 'Can change host', 8, 'change_host');
INSERT INTO `auth_permission` VALUES (31, 'Can delete host', 8, 'delete_host');
INSERT INTO `auth_permission` VALUES (32, 'Can view host', 8, 'view_host');
INSERT INTO `auth_permission` VALUES (33, 'Can add api', 9, 'add_api');
INSERT INTO `auth_permission` VALUES (34, 'Can change api', 9, 'change_api');
INSERT INTO `auth_permission` VALUES (35, 'Can delete api', 9, 'delete_api');
INSERT INTO `auth_permission` VALUES (36, 'Can view api', 9, 'view_api');
INSERT INTO `auth_permission` VALUES (37, 'Can add api run record', 10, 'add_apirunrecord');
INSERT INTO `auth_permission` VALUES (38, 'Can change api run record', 10, 'change_apirunrecord');
INSERT INTO `auth_permission` VALUES (39, 'Can delete api run record', 10, 'delete_apirunrecord');
INSERT INTO `auth_permission` VALUES (40, 'Can view api run record', 10, 'view_apirunrecord');
INSERT INTO `auth_permission` VALUES (41, 'Can add api argument', 11, 'add_apiargument');
INSERT INTO `auth_permission` VALUES (42, 'Can change api argument', 11, 'change_apiargument');
INSERT INTO `auth_permission` VALUES (43, 'Can delete api argument', 11, 'delete_apiargument');
INSERT INTO `auth_permission` VALUES (44, 'Can view api argument', 11, 'view_apiargument');
INSERT INTO `auth_permission` VALUES (45, 'Can add case', 12, 'add_case');
INSERT INTO `auth_permission` VALUES (46, 'Can change case', 12, 'change_case');
INSERT INTO `auth_permission` VALUES (47, 'Can delete case', 12, 'delete_case');
INSERT INTO `auth_permission` VALUES (48, 'Can view case', 12, 'view_case');
INSERT INTO `auth_permission` VALUES (49, 'Can add case argument', 13, 'add_caseargument');
INSERT INTO `auth_permission` VALUES (50, 'Can change case argument', 13, 'change_caseargument');
INSERT INTO `auth_permission` VALUES (51, 'Can delete case argument', 13, 'delete_caseargument');
INSERT INTO `auth_permission` VALUES (52, 'Can view case argument', 13, 'view_caseargument');
INSERT INTO `auth_permission` VALUES (53, 'Can add case api run record', 14, 'add_caseapirunrecord');
INSERT INTO `auth_permission` VALUES (54, 'Can change case api run record', 14, 'change_caseapirunrecord');
INSERT INTO `auth_permission` VALUES (55, 'Can delete case api run record', 14, 'delete_caseapirunrecord');
INSERT INTO `auth_permission` VALUES (56, 'Can view case api run record', 14, 'view_caseapirunrecord');
INSERT INTO `auth_permission` VALUES (57, 'Can add case run record', 15, 'add_caserunrecord');
INSERT INTO `auth_permission` VALUES (58, 'Can change case run record', 15, 'change_caserunrecord');
INSERT INTO `auth_permission` VALUES (59, 'Can delete case run record', 15, 'delete_caserunrecord');
INSERT INTO `auth_permission` VALUES (60, 'Can view case run record', 15, 'view_caserunrecord');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` varchar(22) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_kcauth_kcuser_uid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_kcauth_kcuser_uid` FOREIGN KEY (`user_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (9, 'apitest', 'api');
INSERT INTO `django_content_type` VALUES (11, 'apitest', 'apiargument');
INSERT INTO `django_content_type` VALUES (10, 'apitest', 'apirunrecord');
INSERT INTO `django_content_type` VALUES (12, 'apitest', 'case');
INSERT INTO `django_content_type` VALUES (14, 'apitest', 'caseapirunrecord');
INSERT INTO `django_content_type` VALUES (13, 'apitest', 'caseargument');
INSERT INTO `django_content_type` VALUES (15, 'apitest', 'caserunrecord');
INSERT INTO `django_content_type` VALUES (8, 'apitest', 'host');
INSERT INTO `django_content_type` VALUES (7, 'apitest', 'project');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'kcauth', 'kcuser');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-05-07 15:38:59.093115');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-05-07 15:38:59.126518');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2020-05-07 15:38:59.170336');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-05-07 15:38:59.270142');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-05-07 15:38:59.276763');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-05-07 15:38:59.282633');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-05-07 15:38:59.288921');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-05-07 15:38:59.291318');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-05-07 15:38:59.297488');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-05-07 15:38:59.304032');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-05-07 15:38:59.309403');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-05-07 15:38:59.319671');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-05-07 15:38:59.326527');
INSERT INTO `django_migrations` VALUES (14, 'kcauth', '0001_initial', '2020-05-07 15:38:59.362101');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2020-05-07 15:38:59.463066');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2020-05-07 15:38:59.507006');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-07 15:38:59.515710');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2020-05-07 15:38:59.526076');
INSERT INTO `django_migrations` VALUES (19, 'kcauth', '0002_kcuser_username', '2020-05-08 15:44:15.951075');
INSERT INTO `django_migrations` VALUES (21, 'apitest', '0001_initial', '2020-05-13 03:30:08.001911');
INSERT INTO `django_migrations` VALUES (22, 'apitest', '0002_host', '2020-05-18 09:48:48.005665');
INSERT INTO `django_migrations` VALUES (23, 'apitest', '0003_auto_20200518_1749', '2020-05-18 09:49:34.559630');
INSERT INTO `django_migrations` VALUES (24, 'apitest', '0004_api', '2020-05-21 03:14:59.074431');
INSERT INTO `django_migrations` VALUES (25, 'apitest', '0005_apirunrecord', '2020-05-24 10:18:28.856625');
INSERT INTO `django_migrations` VALUES (26, 'apitest', '0006_apiargument_case_caseargument', '2020-05-25 13:52:54.265278');
INSERT INTO `django_migrations` VALUES (27, 'apitest', '0007_caseapirunrecord_caserunrecord', '2020-05-27 08:39:32.327258');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for kcauth_kcuser
-- ----------------------------
DROP TABLE IF EXISTS `kcauth_kcuser`;
CREATE TABLE `kcauth_kcuser` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `uid` varchar(22) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of kcauth_kcuser
-- ----------------------------
BEGIN;
INSERT INTO `kcauth_kcuser` VALUES ('pbkdf2_sha256$150000$XcaBDgYjMvaX$4bV+uY03nVqHRPkrEKvS/g5Q3BiZ0D7BDilHzgARZok=', '2020-06-09 04:33:58.115584', 1, 'NaBt3eKRDqvSP8D3sw9Uoo', '18306844119', '123@123.com', 'http://127.0.0.1:8000/media/JaiRiMF6QMP64DY7yJ5zrt.jpg', '2020-05-10 02:54:48.313338', 1, 'admin');
INSERT INTO `kcauth_kcuser` VALUES ('pbkdf2_sha256$150000$tnBMv5PlV1sW$eGmC5M61wUsoXhVjQWi81ObJTA+ln/oPbqdLPU3AOpk=', '2020-05-24 12:43:25.594075', 1, 'X44NecNi9Cqh5tDvkFY2Tn', '17636689468', NULL, '', '2020-05-08 15:45:33.847385', 1, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for kcauth_kcuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `kcauth_kcuser_groups`;
CREATE TABLE `kcauth_kcuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kcuser_id` varchar(22) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kcauth_kcuser_groups_kcuser_id_group_id_da070fb9_uniq` (`kcuser_id`,`group_id`),
  KEY `kcauth_kcuser_groups_group_id_c7b26e82_fk_auth_group_id` (`group_id`),
  CONSTRAINT `kcauth_kcuser_groups_group_id_c7b26e82_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `kcauth_kcuser_groups_kcuser_id_4cdc7cdb_fk_kcauth_kcuser_uid` FOREIGN KEY (`kcuser_id`) REFERENCES `kcauth_kcuser` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for kcauth_kcuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `kcauth_kcuser_user_permissions`;
CREATE TABLE `kcauth_kcuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kcuser_id` varchar(22) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kcauth_kcuser_user_permi_kcuser_id_permission_id_fdb6b74d_uniq` (`kcuser_id`,`permission_id`),
  KEY `kcauth_kcuser_user_p_permission_id_29c8e271_fk_auth_perm` (`permission_id`),
  CONSTRAINT `kcauth_kcuser_user_p_kcuser_id_01214045_fk_kcauth_kc` FOREIGN KEY (`kcuser_id`) REFERENCES `kcauth_kcuser` (`uid`),
  CONSTRAINT `kcauth_kcuser_user_p_permission_id_29c8e271_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 121.5.39.133腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 121.5.39.133:8081
 Source Schema         : tduck

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 01/03/2024 09:27:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ac_user
-- ----------------------------
DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别0未知 1男2女',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `reg_channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '注册渠道',
  `last_login_channel` tinyint NULL DEFAULT NULL COMMENT '最后登录渠道',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录Ip',
  `password_type` tinyint(1) NULL DEFAULT 0 COMMENT '密码类型',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `project_id` bigint NULL DEFAULT NULL COMMENT '项目地id',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目地名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15672 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user
-- ----------------------------
INSERT INTO `ac_user` VALUES (1, 'admin', '', 1, 'admin@tduckcloud.com', NULL, '$2a$10$FgOTdkh3qVLE9DNgD4XzDu2PCJB3QtnGbriBPaMhMKTVWM9XYsiIm', '1', 2, '2024-02-29 16:43:47', '127.0.0.1', 1, 0, '2021-06-13 13:49:25', '2024-02-29 16:43:47', '测试', NULL, '随州');
INSERT INTO `ac_user` VALUES (2, 'test', '', 1, 'test@tduckapp.com', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1', 2, '2023-04-06 09:35:22', '172.17.0.1', 0, 0, '2021-06-13 13:49:25', '2023-04-06 09:35:22', '二胡', NULL, '武汉');

-- ----------------------------
-- Table structure for ac_user_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_authorize`;
CREATE TABLE `ac_user_authorize`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '第三方平台类型',
  `app_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台AppId',
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台OpenId',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台用户名',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `user_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '平台用户信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id` ASC, `type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户授权信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user_authorize
-- ----------------------------

-- ----------------------------
-- Table structure for ac_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ac_user_token`;
CREATE TABLE `ac_user_token`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT 0 COMMENT '类型',
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ac_user_token
-- ----------------------------
INSERT INTO `ac_user_token` VALUES (28, 0, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzA5MTk2MjI3LCJleHAiOjE3MDk4MDEwMjd9.W6u3uHnqSf_tKPOYMVlnma9za76AEIXikrs8j0KzYxI2UaQtkFRTHzFXDXUaUVbG3tU5Ubs2h2Tw7k7sPkbQ7w', '2024-03-07 16:43:47', '2024-02-29 16:43:47', '2024-02-29 16:43:47');

-- ----------------------------
-- Table structure for fm_form_template
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template`;
CREATE TABLE `fm_form_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板Id',
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板唯一标识',
  `cover_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板I描述',
  `category_id` int NOT NULL COMMENT '模板类型',
  `scheme` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板定义',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3613 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_template_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_template_category`;
CREATE TABLE `fm_form_template_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目模板分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_template_category
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme`;
CREATE TABLE `fm_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主题名称',
  `style` bigint NOT NULL COMMENT '主题风格',
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头部图片',
  `background_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `theme_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题颜色代码',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目主题外观模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme
-- ----------------------------

-- ----------------------------
-- Table structure for fm_form_theme_category
-- ----------------------------
DROP TABLE IF EXISTS `fm_form_theme_category`;
CREATE TABLE `fm_form_theme_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单主题分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_form_theme_category
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form`;
CREATE TABLE `fm_user_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单唯一标识',
  `source_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源Id',
  `source_type` tinyint NULL DEFAULT NULL COMMENT '来源类型',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单描述',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单类型',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_folder` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '是文件夹',
  `folder_id` bigint NULL DEFAULT 0 COMMENT '文件夹Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8471 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form
-- ----------------------------
INSERT INTO `fm_user_form` VALUES (8467, 'ChsYPBMO', NULL, 1, '<h2 style=\"text-align: center;\">测试</h2>', '测试', 1, '1', 2, 0, 0, 0, '2024-02-26 10:58:18', '2024-02-22 14:08:04');
INSERT INTO `fm_user_form` VALUES (8468, 'Scnhx6B6', NULL, 1, '<h2 style=\"text-align: center;\">HJ问卷调查</h2>', '', 1, '1', 2, 0, 0, 0, '2024-02-22 14:17:38', '2024-02-22 14:11:58');
INSERT INTO `fm_user_form` VALUES (8469, 'g5jSPt4i', NULL, 1, '<h2 style=\"text-align: center;\">测试字段</h2>', '测试字段', 1, '1', 2, 0, 0, 0, '2024-02-27 17:29:29', '2024-02-27 17:26:38');
INSERT INTO `fm_user_form` VALUES (8470, 'PLCB6PH0', NULL, 1, '<h2 style=\"text-align: center;\">大阿达啊</h2>', '<p>as大</p>', 1, '1', 2, 0, 0, 0, '2024-02-28 11:12:47', '2024-02-28 09:09:38');

-- ----------------------------
-- Table structure for fm_user_form_auth
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_auth`;
CREATE TABLE `fm_user_form_auth`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `auth_group_id` bigint NULL DEFAULT NULL COMMENT '授权组id',
  `user_id_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户Id列表',
  `role_id_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '角色Id列表',
  `dept_id_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '部门Id列表',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key` ASC, `auth_group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单授权对象' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_auth
-- ----------------------------

-- ----------------------------
-- Table structure for fm_user_form_data
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_data`;
CREATE TABLE `fm_user_form_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `serial_number` int NULL DEFAULT NULL COMMENT '序号',
  `original_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '填写结果',
  `submit_ua` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提交ua',
  `submit_os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交系统',
  `submit_browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交浏览器',
  `submit_request_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `submit_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交地址',
  `complete_time` int NULL DEFAULT NULL COMMENT '完成时间 毫秒',
  `wx_open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `wx_user_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信用户信息',
  `ext_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段记录来源等',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交者姓名',
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交者手机号',
  `project_id` bigint NULL DEFAULT NULL COMMENT '提交项目地id',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交项目地名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211772 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单收集数据结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_data
-- ----------------------------
INSERT INTO `fm_user_form_data` VALUES (211738, 'ChsYPBMO', 1, '{\"input1708582087753\":\"恶趣味\",\"input1708583568203\":\"企鹅王\",\"input1708583571016\":\"的去\",\"input1708583573220\":\"qq\",\"input1708583576228\":\"请问\",\"input1708583579444\":\"请问\",\"input1708583582365\":\"阿打算\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 20832, NULL, '{}', NULL, '2024-02-27 10:17:05', NULL, '2024-02-27 10:17:05', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211739, 'ChsYPBMO', 2, '{\"input1708582087753\":\"违法\",\"input1708583568203\":\"阿萨达啊\",\"input1708583571016\":\"阿萨达\",\"input1708583573220\":\"阿达啊\",\"input1708583576228\":\"阿达啊\",\"input1708583579444\":\"阿萨达啊\",\"input1708583582365\":\"阿达啊\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 14512, NULL, '{}', NULL, '2024-02-27 11:02:00', NULL, '2024-02-27 11:02:00', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211740, 'ChsYPBMO', 3, '{\"input1708582087753\":\"违法\",\"input1708583568203\":\"阿萨达啊\",\"input1708583571016\":\"阿萨达\",\"input1708583573220\":\"阿达啊\",\"input1708583576228\":\"阿达啊\",\"input1708583579444\":\"阿萨达啊\",\"input1708583582365\":\"阿达啊\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 32001, NULL, '{}', NULL, '2024-02-27 11:03:00', NULL, '2024-02-27 11:03:00', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211741, 'ChsYPBMO', 1, '{\"input1708582087753\":\"潍坊市\",\"input1708583568203\":\"是否是\",\"input1708583571016\":\"是否是\",\"input1708583573220\":\"水费单\",\"input1708583576228\":\"是电费稍等\",\"input1708583579444\":\"是电费是否\",\"input1708583582365\":\"第三方是\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 36373, NULL, '{}', NULL, '2024-02-27 11:35:04', NULL, '2024-02-27 11:35:04', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211742, 'ChsYPBMO', 1, '{\"input1708582087753\":\"潍坊市\",\"input1708583568203\":\"是否是\",\"input1708583571016\":\"是否是\",\"input1708583573220\":\"水费单\",\"input1708583576228\":\"是电费稍等\",\"input1708583579444\":\"是电费是否\",\"input1708583582365\":\"第三方是\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 36373, NULL, '{}', NULL, '2024-02-27 11:45:26', NULL, '2024-02-27 11:45:26', NULL, '张三', '18737264919', 533453645758679, '随州');
INSERT INTO `fm_user_form_data` VALUES (211743, 'ChsYPBMO', 2, '{\"input1708582087753\":\"潍坊市\",\"input1708583568203\":\"是否是\",\"input1708583571016\":\"是否是\",\"input1708583573220\":\"水费单\",\"input1708583576228\":\"是电费稍等\",\"input1708583579444\":\"是电费是否\",\"input1708583582365\":\"第三方是\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 59459, NULL, '{}', NULL, '2024-02-27 11:58:07', NULL, '2024-02-27 11:58:07', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211744, 'ChsYPBMO', 3, '{\"input1708582087753\":\"潍坊市\",\"input1708583568203\":\"是否是\",\"input1708583571016\":\"是否是\",\"input1708583573220\":\"水费单\",\"input1708583576228\":\"是电费稍等\",\"input1708583579444\":\"是电费是否\",\"input1708583582365\":\"第三方是\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 62974, NULL, '{}', NULL, '2024-02-27 11:58:07', NULL, '2024-02-27 11:58:07', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211745, 'ChsYPBMO', 4, '{\"input1708582087753\":\"潍坊市\",\"input1708583568203\":\"是否是\",\"input1708583571016\":\"是否是\",\"input1708583573220\":\"水费单\",\"input1708583576228\":\"是电费稍等\",\"input1708583579444\":\"是电费是否\",\"input1708583582365\":\"第三方是\",\"checkbox1708916240510\":[1],\"checkbox1708916240510label\":[\"选项一\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 36373, NULL, '{}', NULL, '2024-02-27 12:21:40', NULL, '2024-02-27 12:21:40', NULL, '张三', '18737264919', 533453645758679, '随州');
INSERT INTO `fm_user_form_data` VALUES (211747, 'ChsYPBMO', 6, '{\"input1708582087753\":\"归属地\",\"input1708583568203\":\"公司\",\"input1708583571016\":\"丝瓜是\",\"input1708583573220\":\"丝瓜是\",\"input1708583576228\":\"丝瓜十多个\",\"input1708583579444\":\"阿帆啊\",\"input1708583582365\":\"阿帆发\",\"checkbox1708916240510\":[2],\"checkbox1708916240510label\":[\"选项二\"]}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 18372, NULL, '{}', NULL, '2024-02-27 13:14:11', NULL, '2024-02-27 13:14:11', NULL, '张三', NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211748, 'g5jSPt4i', 1, '{\"input1709025999522\":\"发生\",\"input1709026001087\":\"是电费\"}', NULL, '', '', '127.0.0.1', '内网IP', 0, '', NULL, NULL, '2024-02-27 17:37:27', '1', '2024-02-27 17:37:27', NULL, '历史', '18737264919', 4245346454, '武汉');
INSERT INTO `fm_user_form_data` VALUES (211749, 'g5jSPt4i', 2, '{\"input1709025999522\":\"嵌入\",\"input1709026001087\":\"额外\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 38451, NULL, '{}', NULL, '2024-02-28 08:59:27', NULL, '2024-02-28 08:59:27', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211750, 'g5jSPt4i', 3, '{\"input1709025999522\":\"为\",\"input1709026001087\":\"为\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 57246, NULL, '{}', NULL, '2024-02-28 09:06:37', NULL, '2024-02-28 09:06:37', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211751, 'g5jSPt4i', 4, '{\"input1709025999522\":\"阿发\",\"input1709026001087\":\"阿达\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 8301, NULL, '{}', NULL, '2024-02-28 09:08:28', NULL, '2024-02-28 09:08:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211752, 'PLCB6PH0', 1, '{\"input1709082581848\":\"啊啊发\",\"input1709082591646\":\"粉色是\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 12333, NULL, '{}', NULL, '2024-02-28 09:10:42', NULL, '2024-02-28 09:10:42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211753, 'PLCB6PH0', 2, '{\"input1709082581848\":\"谁跟谁\",\"input1709082591646\":\"稍等是\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 22996, NULL, '{}', NULL, '2024-02-28 11:45:21', NULL, '2024-02-28 11:45:21', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211754, 'PLCB6PH0', 3, '{\"input1709082581848\":\"施工队\",\"input1709082591646\":\"东风风光的\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 4249, NULL, '{}', NULL, '2024-02-28 11:49:14', NULL, '2024-02-28 11:49:14', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211755, 'PLCB6PH0', 4, '{\"input1709082581848\":\"网关\",\"input1709082591646\":\"儿童袜\"}', NULL, '', '', '127.0.0.1', '内网IP', 0, '', NULL, NULL, '2024-02-28 11:51:32', '1', '2024-02-28 11:51:32', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211756, 'PLCB6PH0', 5, '{\"input1709082581848\":\"热热热天\",\"input1709082591646\":\"个如果人\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 14809, NULL, '{}', NULL, '2024-02-28 16:34:11', NULL, '2024-02-28 16:34:11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211757, 'PLCB6PH0', 6, '{\"input1709082581848\":\"11\",\"input1709082591646\":\"111\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 360230, NULL, '{}', NULL, '2024-02-28 17:16:03', NULL, '2024-02-28 17:16:03', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211758, 'PLCB6PH0', 7, '{\"input1709082581848\":\"11\",\"input1709082591646\":\"111\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 6629, NULL, '{}', NULL, '2024-02-28 17:16:31', NULL, '2024-02-28 17:16:31', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211759, 'PLCB6PH0', 8, '{\"input1709082581848\":\"22\",\"input1709082591646\":\"222\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 7705, NULL, '{}', NULL, '2024-02-28 17:17:33', NULL, '2024-02-28 17:17:33', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211760, 'PLCB6PH0', 9, '{\"input1709082581848\":\"33\",\"input1709082591646\":\"333\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 7965, NULL, '{}', NULL, '2024-02-28 17:18:03', NULL, '2024-02-28 17:18:03', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211761, 'PLCB6PH0', 10, '{\"input1709082581848\":\"11\",\"input1709082591646\":\"111\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 15981, NULL, '{}', NULL, '2024-02-28 17:19:49', NULL, '2024-02-28 17:19:49', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211762, 'PLCB6PH0', 11, '{\"input1709082581848\":\"44\",\"input1709082591646\":\"44\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 4854, NULL, '{}', NULL, '2024-02-28 17:20:11', NULL, '2024-02-28 17:20:11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211763, 'PLCB6PH0', 12, '{\"input1709082581848\":\"88\",\"input1709082591646\":\"88\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 27816, NULL, '{}', NULL, '2024-02-28 17:22:13', NULL, '2024-02-28 17:22:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211764, 'PLCB6PH0', 13, '{\"input1709082581848\":\"44\",\"input1709082591646\":\"44\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 10063, NULL, '{}', NULL, '2024-02-28 17:25:07', NULL, '2024-02-28 17:25:07', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211765, 'PLCB6PH0', 14, '{\"input1709082581848\":\"44\",\"input1709082591646\":\"444\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 64195, NULL, '{}', NULL, '2024-02-28 17:29:00', NULL, '2024-02-28 17:29:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211766, 'PLCB6PH0', 15, '{\"input1709082581848\":\"66\",\"input1709082591646\":\"66\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 4665, NULL, '{}', NULL, '2024-02-28 17:31:23', NULL, '2024-02-28 17:31:23', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211767, 'PLCB6PH0', 16, '{\"input1709082581848\":\"88\",\"input1709082591646\":\"88\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 23713, NULL, '{}', NULL, '2024-02-28 17:33:37', NULL, '2024-02-28 17:33:37', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fm_user_form_data` VALUES (211768, 'PLCB6PH0', 17, '{\"input1709082581848\":\"66\",\"input1709082591646\":\"66\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 31550, NULL, '{}', NULL, '2024-02-28 17:34:27', NULL, '2024-02-28 17:34:27', NULL, NULL, '', NULL, '12');
INSERT INTO `fm_user_form_data` VALUES (211769, 'PLCB6PH0', 18, '{\"input1709082581848\":\"44\",\"input1709082591646\":\"44\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 38532, NULL, '{}', NULL, '2024-02-28 17:35:30', NULL, '2024-02-28 17:35:30', NULL, NULL, '', NULL, '刘总');
INSERT INTO `fm_user_form_data` VALUES (211770, 'PLCB6PH0', 19, '{\"input1709082581848\":\"阿萨大师\",\"input1709082591646\":\"asda\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 44330, NULL, '{}', NULL, '2024-02-28 17:41:47', NULL, '2024-02-28 17:41:47', NULL, '', '', NULL, '');
INSERT INTO `fm_user_form_data` VALUES (211771, 'PLCB6PH0', 1, '{\"input1709082581848\":\"算法\",\"input1709082591646\":\"阿萨达啊\"}', '{\"ua\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\",\"browser\":{\"name\":\"Chrome\",\"version\":\"121.0.0.0\",\"major\":\"121\"},\"engine\":{\"name\":\"Blink\",\"version\":\"121.0.0.0\"},\"os\":{\"name\":\"Windows\",\"version\":\"10\"},\"device\":{},\"cpu\":{\"architecture\":\"amd64\"}}', 'Windows', 'Chrome', '127.0.0.1', '内网IP', 6043, NULL, '{}', NULL, '2024-02-29 12:29:57', NULL, '2024-02-29 12:29:57', NULL, '', '', NULL, '');

-- ----------------------------
-- Table structure for fm_user_form_item
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_item`;
CREATE TABLE `fm_user_form_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目key',
  `form_item_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项Id',
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项类型 ',
  `label` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单项标题',
  `is_display_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '展示类型组件',
  `is_hide_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '隐藏类型组件',
  `is_special_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '特殊处理类型',
  `show_label` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示标签',
  `default_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单项默认值',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `placeholder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入型提示文字',
  `sort` bigint NULL DEFAULT 0 COMMENT '排序',
  `span` int NOT NULL DEFAULT 24 COMMENT '栅格宽度',
  `scheme` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表表单原始JSON',
  `reg_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '正则表达式 ',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59078 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_item
-- ----------------------------
INSERT INTO `fm_user_form_item` VALUES (59044, 'ChsYPBMO', 'input1708582087753', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 65536, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708582087753\",\"renderKey\":\"input17085820877531708582087753\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708582087753\"}', '[]', '2024-02-22 14:08:09', '2024-02-22 14:08:09');
INSERT INTO `fm_user_form_item` VALUES (59045, 'Scnhx6B6', 'input1708582369502', 'INPUT', '<p>对服务满意度怎样</p>', 0, 0, 0, 1, NULL, 1, '请输入对服务满意度怎样', 65536, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"<p>对服务满意度怎样</p>\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708582369502\",\"renderKey\":\"input17085823695021708582369502\"},\"placeholder\":\"请输入对服务满意度怎样\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708582369502\",\"sort\":65536,\"dId\":59045,\"displayType\":false,\"regList\":[],\"formItemId\":\"input1708582369502\",\"key\":\"input1708582369502170867604464159045\"}', '[]', '2024-02-23 16:14:11', '2024-02-22 14:12:23');
INSERT INTO `fm_user_form_item` VALUES (59046, 'Scnhx6B6', 'textarea1708582374265', 'TEXTAREA', '多行文本', 0, 0, 0, 1, NULL, 1, '请输入多行文本', 196608, 24, '{\"typeId\":\"TEXTAREA\",\"config\":{\"label\":\"多行文本\",\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"span\":24,\"regList\":[],\"changeTag\":true,\"formId\":\"textarea1708582374265\",\"renderKey\":\"textarea17085823742651708582374265\"},\"type\":\"textarea\",\"placeholder\":\"请输入多行文本\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"vModel\":\"textarea1708582374265\"}', '[]', '2024-02-22 14:12:29', '2024-02-22 14:12:29');
INSERT INTO `fm_user_form_item` VALUES (59047, 'Scnhx6B6', 'number1708582379727', 'NUMBER', '<p>数字组件</p>', 0, 0, 0, 1, NULL, 1, '请输入数字组件', 327680, 24, '{\"typeId\":\"NUMBER\",\"config\":{\"label\":\"<p>数字组件</p>\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-number\",\"tagIcon\":\"number\",\"required\":true,\"span\":24,\"regList\":[],\"formId\":\"number1708582379727\",\"renderKey\":\"number17085823797271708582379727\"},\"placeholder\":\"请输入数字组件\",\"style\":{\"width\":\"100%\"},\"min\":0,\"max\":100000000,\"step\":1,\"disabled\":false,\"vModel\":\"number1708582379727\",\"sort\":327680}', '[]', '2024-02-22 14:13:18', '2024-02-22 14:12:34');
INSERT INTO `fm_user_form_item` VALUES (59048, 'Scnhx6B6', 'rate1708582385246', 'RATE', '<p>评分组件</p>', 0, 0, 0, 1, '0', 1, '此题为必填项目', 458752, 24, '{\"typeId\":\"RATE\",\"config\":{\"label\":\"<p>评分组件</p>\",\"tag\":\"t-rate\",\"tagIcon\":\"rate\",\"defaultValue\":0,\"span\":24,\"showLabel\":true,\"showRegList\":false,\"required\":true,\"regList\":[],\"changeTag\":true,\"formId\":\"rate1708582385246\",\"renderKey\":\"rate17085823852461708582385246\"},\"style\":{},\"max\":5,\"allow-half\":false,\"show-text\":false,\"show-score\":false,\"disabled\":false,\"vModel\":\"rate1708582385246\",\"sort\":458752,\"dId\":59048,\"displayType\":false,\"regList\":[],\"placeholder\":\"此题为必填项目\",\"formItemId\":\"rate1708582385246\",\"key\":\"rate1708582385246170867604464159048\"}', '[]', '2024-02-23 16:14:22', '2024-02-22 14:12:39');
INSERT INTO `fm_user_form_item` VALUES (59049, 'Scnhx6B6', 'input1708582392607', 'INPUT', '<p>商户姓名</p>', 0, 1, 0, 1, NULL, 1, '请输入商户姓名', 393216, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"<p>商户姓名</p>\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708582392607\",\"renderKey\":\"input17085823926071708582392607\",\"hideType\":true},\"placeholder\":\"请输入商户姓名\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708582392607\",\"sort\":393216,\"dId\":59049,\"displayType\":false,\"regList\":[],\"formItemId\":\"input1708582392607\",\"key\":\"input1708582392607170867604464159049\"}', '[]', '2024-02-23 16:14:14', '2024-02-22 14:12:46');
INSERT INTO `fm_user_form_item` VALUES (59050, 'Scnhx6B6', 'sign_pad1708582643159', 'SIGN_PAD', '手写签名', 0, 0, 0, 1, '', 1, '', 589824, 24, '{\"typeId\":\"SIGN_PAD\",\"config\":{\"label\":\"手写签名\",\"defaultValue\":\"\",\"showLabel\":true,\"showDefaultValue\":true,\"showRequired\":true,\"showClearable\":false,\"showRegList\":false,\"tag\":\"sign-pad\",\"mobileTag\":\"mobile-sign-pad\",\"tagIcon\":\"sign-pad\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":false,\"formId\":\"sign_pad1708582643159\",\"renderKey\":\"sign_pad17085826431591708582643159\"},\"color\":\"#000000\",\"style\":{\"width\":\"100%\"},\"action\":\"/form/file/upload/Scnhx6B6\",\"vModel\":\"sign_pad1708582643159\"}', '[]', '2024-02-22 14:16:56', '2024-02-22 14:16:56');
INSERT INTO `fm_user_form_item` VALUES (59051, 'Scnhx6B6', 'province_city1708582654192', 'PROVINCE_CITY', '省市联动', 0, 0, 0, 1, NULL, 1, '请选择省市县省市联动', 655360, 24, '{\"typeId\":\"PROVINCE_CITY\",\"config\":{\"label\":\"省市联动\",\"showLabel\":true,\"changeTag\":false,\"tag\":\"province-city\",\"mobileTag\":\"mobile-province-city\",\"tagIcon\":\"city\",\"required\":true,\"span\":24,\"showRegList\":false,\"requireDetailAddr\":false,\"regList\":[],\"formId\":\"province_city1708582654192\",\"renderKey\":\"province_city17085826541921708582654192\"},\"placeholder\":\"请选择省市县省市联动\",\"style\":{\"width\":\"100%\"},\"vModel\":\"province_city1708582654192\"}', '[]', '2024-02-22 14:17:07', '2024-02-22 14:17:07');
INSERT INTO `fm_user_form_item` VALUES (59052, 'Scnhx6B6', 'phone_verification1708582655727', 'PHONE_VERIFICATION', '<p>手机号验证</p>', 0, 0, 0, 1, NULL, 1, '请完成手机号验证', 720896, 24, '{\"typeId\":\"PHONE_VERIFICATION\",\"config\":{\"label\":\"<p>手机号验证</p>\",\"showLabel\":true,\"changeTag\":false,\"tag\":\"phone-verification\",\"mobileTag\":\"mobile-phone-verification\",\"tagIcon\":\"mobile\",\"required\":true,\"span\":24,\"showRegList\":false,\"regList\":[],\"formId\":\"phone_verification1708582655727\",\"renderKey\":\"phone_verification17085826557271708582655727\"},\"placeholder\":\"请完成手机号验证\",\"style\":{\"width\":\"100%\"},\"vModel\":\"phone_verification1708582655727\",\"dId\":59052,\"sort\":720896,\"displayType\":false,\"regList\":[],\"formItemId\":\"phone_verification1708582655727\",\"key\":\"phone_verification1708582655727170867604464259052\"}', '[]', '2024-02-23 16:14:38', '2024-02-22 14:17:08');
INSERT INTO `fm_user_form_item` VALUES (59053, 'Scnhx6B6', 'sub_form1708582656995', 'SUB_FORM', '子表单', 0, 0, 0, 1, '[]', 1, '子表单', 786432, 24, '{\"typeId\":\"SUB_FORM\",\"config\":{\"label\":\"子表单\",\"showLabel\":true,\"changeTag\":false,\"tag\":\"t-sub-form\",\"mobileTag\":\"mobile-t-sub-form\",\"tagIcon\":\"sub-form\",\"defaultValue\":[],\"required\":true,\"span\":24,\"showRegList\":false,\"regList\":[],\"formId\":\"sub_form1708582656995\",\"renderKey\":\"sub_form17085826569951708582656995\"},\"childList\":[],\"placeholder\":\"子表单\",\"style\":{\"width\":\"100%\"},\"vModel\":\"sub_form1708582656995\"}', '[]', '2024-02-22 14:17:10', '2024-02-22 14:17:10');
INSERT INTO `fm_user_form_item` VALUES (59054, 'Scnhx6B6', 'matrix_input1708582657765', 'MATRIX_INPUT', '矩阵填空', 0, 0, 0, 1, '{\"1\":{\"1\":null,\"2\":null,\"3\":null},\"2\":{\"1\":null,\"2\":null,\"3\":null},\"3\":{\"1\":null,\"2\":null,\"3\":null}}', 1, '矩阵填空', 851968, 24, '{\"typeId\":\"MATRIX_INPUT\",\"config\":{\"label\":\"矩阵填空\",\"showLabel\":true,\"changeTag\":false,\"tag\":\"matrix-input\",\"mobileTag\":\"mobile-matrix-input\",\"tagIcon\":\"matrix-input\",\"defaultValue\":{\"1\":{},\"2\":{},\"3\":{}},\"required\":true,\"span\":24,\"showRegList\":false,\"regList\":[],\"formId\":\"matrix_input1708582657765\",\"renderKey\":\"matrix_input17085826577651708582657765\"},\"table\":{\"rows\":[{\"label\":\"矩阵行1\",\"id\":1},{\"label\":\"矩阵行2\",\"id\":2},{\"label\":\"矩阵行3\",\"id\":3}],\"columns\":[{\"label\":\"填空1\",\"id\":1},{\"label\":\"填空2\",\"id\":2},{\"label\":\"填空3\",\"id\":3}]},\"placeholder\":\"矩阵填空\",\"style\":{\"width\":\"100%\"},\"vModel\":\"matrix_input1708582657765\",\"sort\":851968}', '[]', '2024-02-22 14:17:11', '2024-02-22 14:17:10');
INSERT INTO `fm_user_form_item` VALUES (59055, 'Scnhx6B6', 'horizontal_input1708582659143', 'HORIZONTAL_INPUT', '横向填空', 0, 0, 0, 1, '[]', 1, '请输入横向填空横向填空', 917504, 24, '{\"typeId\":\"HORIZONTAL_INPUT\",\"config\":{\"label\":\"横向填空\",\"showLabel\":true,\"changeTag\":false,\"tag\":\"horizontal-input\",\"showDefaultValue\":false,\"tagIcon\":\"horizontal-input\",\"required\":true,\"span\":24,\"defaultValue\":[],\"showRegList\":false,\"regList\":[],\"formId\":\"horizontal_input1708582659143\",\"renderKey\":\"horizontal_input17085826591431708582659143\"},\"input\":\"请输入横向填空内容\",\"placeholder\":\"请输入横向填空横向填空\",\"style\":{\"width\":\"100%\"},\"vModel\":\"horizontal_input1708582659143\"}', '[]', '2024-02-22 14:17:12', '2024-02-22 14:17:12');
INSERT INTO `fm_user_form_item` VALUES (59056, 'Scnhx6B6', 'input_map1708582659979', 'INPUT_MAP', '地理位置', 0, 0, 0, 1, NULL, 1, '请选择位置地理位置', 983040, 24, '{\"typeId\":\"INPUT_MAP\",\"config\":{\"label\":\"地理位置\",\"showLabel\":true,\"changeTag\":false,\"mobileTag\":\"mobile-input-map\",\"tag\":\"input-map\",\"tagIcon\":\"map\",\"required\":true,\"span\":24,\"showRegList\":false,\"regList\":[],\"formId\":\"input_map1708582659979\",\"renderKey\":\"input_map17085826599791708582659979\"},\"placeholder\":\"请选择位置地理位置\",\"style\":{\"width\":\"100%\"},\"longAndLat\":false,\"vModel\":\"input_map1708582659979\"}', '[]', '2024-02-22 14:17:13', '2024-02-22 14:17:13');
INSERT INTO `fm_user_form_item` VALUES (59057, 'Scnhx6B6', 'pagination1708582660433', 'PAGINATION', '分页组件', 1, 0, 0, 0, '分页', 0, '', 1048576, 24, '{\"typeId\":\"PAGINATION\",\"config\":{\"label\":\"分页组件\",\"defaultValue\":\"分页\",\"displayType\":true,\"showLabel\":false,\"showDefaultValue\":false,\"showRequired\":false,\"showClearable\":false,\"showRegList\":false,\"tag\":\"form-pagination\",\"tagIcon\":\"page\",\"span\":24,\"required\":false,\"regList\":[],\"changeTag\":false,\"formId\":\"pagination1708582660433\",\"renderKey\":\"pagination17085826604331708582660433\"},\"prev\":true,\"currPage\":true,\"totalPage\":true,\"currPageNum\":1,\"totalPageNum\":1,\"style\":{\"width\":\"100%\"},\"vModel\":\"pagination1708582660433\"}', '[]', '2024-02-22 14:17:13', '2024-02-22 14:17:13');
INSERT INTO `fm_user_form_item` VALUES (59058, 'Scnhx6B6', 'image_upload1708582661060', 'IMAGE_UPLOAD', '图片上传', 0, 0, 0, 1, '[]', 1, '', 1114112, 24, '{\"typeId\":\"IMAGE_UPLOAD\",\"config\":{\"label\":\"图片上传\",\"tag\":\"t-image-upload\",\"tagIcon\":\"image-upload\",\"defaultValue\":[],\"showLabel\":true,\"showRegList\":false,\"required\":true,\"span\":24,\"showTip\":false,\"buttonText\":\"点击上传\",\"regList\":[],\"changeTag\":true,\"fileSize\":10,\"sizeUnit\":\"MB\",\"formId\":\"image_upload1708582661060\",\"renderKey\":\"image_upload17085826610601708582661060\"},\"action\":\"/tduck-api/form/file/upload/Scnhx6B6\",\"disabled\":false,\"accept\":\"image/*\",\"name\":\"file\",\"auto-upload\":true,\"limit\":2,\"multiple\":false,\"vModel\":\"image_upload1708582661060\"}', '[]', '2024-02-22 14:17:14', '2024-02-22 14:17:14');
INSERT INTO `fm_user_form_item` VALUES (59059, 'Scnhx6B6', 'slider1708582663944', 'SLIDER', '滑块组件', 0, 0, 0, 1, '0', 1, '', 1179648, 24, '{\"typeId\":\"SLIDER\",\"config\":{\"label\":\"滑块组件\",\"tag\":\"t-slider\",\"tagIcon\":\"slider\",\"defaultValue\":0,\"span\":24,\"showLabel\":true,\"showRegList\":false,\"required\":true,\"regList\":[],\"changeTag\":true,\"formId\":\"slider1708582663944\",\"renderKey\":\"slider17085826639441708582663944\"},\"style\":{},\"max\":100,\"min\":0,\"step\":1,\"vModel\":\"slider1708582663944\"}', '[]', '2024-02-22 14:17:17', '2024-02-22 14:17:17');
INSERT INTO `fm_user_form_item` VALUES (59060, 'Scnhx6B6', 'desc_text1708582664979', 'DESC_TEXT', '文字描述', 1, 0, 0, 0, '描述文字', 0, '', 1245184, 24, '{\"typeId\":\"DESC_TEXT\",\"config\":{\"label\":\"文字描述\",\"defaultValue\":\"描述文字\",\"displayType\":true,\"showDefaultValue\":false,\"showRequired\":false,\"showClearable\":false,\"showRegList\":false,\"tag\":\"desc-text\",\"tagIcon\":\"text\",\"span\":24,\"required\":false,\"regList\":[],\"changeTag\":false,\"formId\":\"desc_text1708582664979\",\"renderKey\":\"desc_text17085826649791708582664979\"},\"content\":\"描述文字\",\"style\":{\"width\":\"100%\"},\"vModel\":\"desc_text1708582664979\"}', '[]', '2024-02-22 14:17:18', '2024-02-22 14:17:18');
INSERT INTO `fm_user_form_item` VALUES (59061, 'Scnhx6B6', 'image_carousel1708582665536', 'IMAGE_CAROUSEL', '图片轮播', 1, 0, 0, 0, NULL, 0, '', 1310720, 24, '{\"typeId\":\"IMAGE_CAROUSEL\",\"config\":{\"label\":\"图片轮播\",\"showLabel\":false,\"displayType\":true,\"imageFit\":\"contain\",\"height\":300,\"showDefaultValue\":false,\"showRequired\":false,\"showClearable\":false,\"showRegList\":false,\"tag\":\"t-image-carousel\",\"tagIcon\":\"image-carousel\",\"span\":24,\"required\":false,\"regList\":[],\"changeTag\":true,\"options\":[{\"label\":\"文字\",\"image\":\"\"}],\"formId\":\"image_carousel1708582665536\",\"renderKey\":\"image_carousel17085826655361708582665536\"},\"style\":{\"width\":\"100%\"},\"vModel\":\"image_carousel1708582665536\"}', '[]', '2024-02-22 14:17:18', '2024-02-22 14:17:18');
INSERT INTO `fm_user_form_item` VALUES (59062, 'Scnhx6B6', 'checkbox1708582667016', 'CHECKBOX', '多选框组', 0, 0, 0, 1, '[]', 1, '此题为必填项目', 1376256, 24, '{\"typeId\":\"CHECKBOX\",\"config\":{\"label\":\"多选框组\",\"tag\":\"t-checkbox-group\",\"tagIcon\":\"checkbox\",\"defaultValue\":[],\"span\":24,\"showLabel\":true,\"inline\":false,\"showRegList\":false,\"optionType\":\"default\",\"required\":true,\"regList\":[],\"changeTag\":true,\"border\":false,\"otherRequired\":true,\"showVoteResult\":false,\"optionsType\":0,\"dynamicOptions\":{\"url\":\"\",\"dataPath\":\"\",\"valueField\":\"\",\"labelField\":\"\"},\"options\":[{\"label\":\"选项一\",\"value\":1},{\"label\":\"选项二\",\"value\":2}],\"exclusiveChoiceApiCodes\":[],\"withExclusiveChoice\":false,\"quotaBlankWarning\":\"\",\"quotaCycleRule\":\"fixed\",\"hideQuota\":false,\"hideChoiceWhenQuotaEmpty\":false,\"quotaRecoverable\":true,\"formId\":\"checkbox1708582667016\",\"renderKey\":\"checkbox17085826670161708582667016\"},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"vModel\":\"checkbox1708582667016\",\"sort\":1376256,\"dId\":59062,\"displayType\":false,\"regList\":[],\"placeholder\":\"此题为必填项目\",\"formItemId\":\"checkbox1708582667016\",\"key\":\"checkbox1708582667016170892855214859062\"}', '[]', '2024-02-26 14:22:49', '2024-02-22 14:17:20');
INSERT INTO `fm_user_form_item` VALUES (59063, 'Scnhx6B6', 'cascader1708582667532', 'CASCADER', '<p>级联选择</p>', 0, 0, 0, 1, '[]', 1, '请选择级联选择', 1441792, 24, '{\"typeId\":\"CASCADER\",\"config\":{\"label\":\"<p>级联选择</p>\",\"url\":\"\",\"method\":\"get\",\"dataKey\":\"list\",\"showLabel\":true,\"tag\":\"t-cascader\",\"tagIcon\":\"cascader\",\"defaultValue\":[],\"dataType\":\"static\",\"span\":24,\"required\":true,\"regList\":[],\"changeTag\":true,\"optionsType\":0,\"dynamicOptions\":{\"url\":\"\",\"dataPath\":\"\",\"valueField\":\"\",\"labelField\":\"\"},\"options\":[{\"id\":1,\"value\":1,\"label\":\"选项1\",\"children\":[{\"id\":2,\"value\":2,\"label\":\"选项1-1\"}]}],\"formId\":\"cascader1708582667532\",\"renderKey\":\"cascader17085826675321708582667532\"},\"placeholder\":\"请选择级联选择\",\"style\":{\"width\":\"100%\"},\"props\":{\"props\":{\"multiple\":false,\"label\":\"label\",\"value\":\"value\",\"children\":\"children\"}},\"show-all-levels\":true,\"disabled\":false,\"clearable\":true,\"filterable\":false,\"separator\":\"/\",\"vModel\":\"cascader1708582667532\",\"dId\":59063,\"sort\":1441792,\"displayType\":false,\"regList\":[],\"formItemId\":\"cascader1708582667532\",\"key\":\"cascader1708582667532170867604464259063\"}', '[]', '2024-02-23 16:14:48', '2024-02-22 14:17:20');
INSERT INTO `fm_user_form_item` VALUES (59064, 'Scnhx6B6', 'textarea1708582668003', 'TEXTAREA', '多行文本', 0, 0, 0, 1, NULL, 1, '请输入多行文本', 1507328, 24, '{\"typeId\":\"TEXTAREA\",\"config\":{\"label\":\"多行文本\",\"showLabel\":true,\"tag\":\"el-input\",\"tagIcon\":\"textarea\",\"required\":true,\"span\":24,\"regList\":[],\"changeTag\":true,\"formId\":\"textarea1708582668003\",\"renderKey\":\"textarea17085826680031708582668003\"},\"type\":\"textarea\",\"placeholder\":\"请输入多行文本\",\"autosize\":{\"minRows\":4,\"maxRows\":4},\"style\":{\"width\":\"100%\"},\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"vModel\":\"textarea1708582668003\"}', '[]', '2024-02-22 14:17:21', '2024-02-22 14:17:21');
INSERT INTO `fm_user_form_item` VALUES (59065, 'Scnhx6B6', 'input1708582668449', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 1572864, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708582668449\",\"renderKey\":\"input17085826684491708582668449\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708582668449\"}', '[]', '2024-02-22 14:17:21', '2024-02-22 14:17:21');
INSERT INTO `fm_user_form_item` VALUES (59066, 'ChsYPBMO', 'input1708583568203', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 196608, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583568203\",\"renderKey\":\"input17085835682031708583568203\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583568203\"}', '[]', '2024-02-22 14:32:50', '2024-02-22 14:32:50');
INSERT INTO `fm_user_form_item` VALUES (59067, 'ChsYPBMO', 'input1708583571016', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 327680, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583571016\",\"renderKey\":\"input17085835710161708583571016\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583571016\"}', '[]', '2024-02-22 14:32:53', '2024-02-22 14:32:52');
INSERT INTO `fm_user_form_item` VALUES (59068, 'ChsYPBMO', 'input1708583573220', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 458752, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583573220\",\"renderKey\":\"input17085835732201708583573220\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583573220\"}', '[]', '2024-02-22 14:32:55', '2024-02-22 14:32:54');
INSERT INTO `fm_user_form_item` VALUES (59069, 'ChsYPBMO', 'input1708583576228', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 589824, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583576228\",\"renderKey\":\"input17085835762281708583576228\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583576228\"}', '[]', '2024-02-22 14:32:58', '2024-02-22 14:32:58');
INSERT INTO `fm_user_form_item` VALUES (59070, 'ChsYPBMO', 'input1708583579444', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 720896, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583579444\",\"renderKey\":\"input17085835794441708583579444\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583579444\"}', '[]', '2024-02-22 14:33:01', '2024-02-22 14:33:01');
INSERT INTO `fm_user_form_item` VALUES (59071, 'ChsYPBMO', 'input1708583582365', 'INPUT', '<p>单行文本</p>', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 851968, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"<p>单行文本</p>\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1708583582365\",\"renderKey\":\"input17085835823651708583582365\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1708583582365\",\"dId\":59071,\"sort\":851968,\"displayType\":false,\"regList\":[],\"formItemId\":\"input1708583582365\",\"key\":\"input1708583582365170891622505959071\"}', '[]', '2024-02-26 10:57:30', '2024-02-22 14:33:04');
INSERT INTO `fm_user_form_item` VALUES (59072, 'ChsYPBMO', 'checkbox1708916240510', 'CHECKBOX', '多选框组', 0, 0, 0, 1, '[]', 1, '', 917504, 24, '{\"typeId\":\"CHECKBOX\",\"config\":{\"label\":\"多选框组\",\"tag\":\"t-checkbox-group\",\"tagIcon\":\"checkbox\",\"defaultValue\":[],\"span\":24,\"showLabel\":true,\"inline\":false,\"showRegList\":false,\"optionType\":\"default\",\"required\":true,\"regList\":[],\"changeTag\":true,\"border\":false,\"otherRequired\":true,\"showVoteResult\":false,\"optionsType\":0,\"dynamicOptions\":{\"url\":\"\",\"dataPath\":\"\",\"valueField\":\"\",\"labelField\":\"\"},\"options\":[{\"label\":\"选项一\",\"value\":1},{\"label\":\"选项二\",\"value\":2}],\"exclusiveChoiceApiCodes\":[],\"withExclusiveChoice\":false,\"quotaBlankWarning\":\"\",\"quotaCycleRule\":\"fixed\",\"hideQuota\":false,\"hideChoiceWhenQuotaEmpty\":false,\"quotaRecoverable\":true,\"formId\":\"checkbox1708916240510\",\"renderKey\":\"checkbox17089162405101708916240510\"},\"style\":{},\"size\":\"medium\",\"disabled\":false,\"vModel\":\"checkbox1708916240510\"}', '[]', '2024-02-26 10:56:55', '2024-02-26 10:56:55');
INSERT INTO `fm_user_form_item` VALUES (59073, 'g5jSPt4i', 'input1709025999522', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 65536, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1709025999522\",\"renderKey\":\"input17090259995221709025999522\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1709025999522\"}', '[]', '2024-02-27 17:26:40', '2024-02-27 17:26:40');
INSERT INTO `fm_user_form_item` VALUES (59074, 'g5jSPt4i', 'input1709026001087', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 196608, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1709026001087\",\"renderKey\":\"input17090260010871709026001087\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1709026001087\"}', '[]', '2024-02-27 17:26:42', '2024-02-27 17:26:42');
INSERT INTO `fm_user_form_item` VALUES (59075, 'PLCB6PH0', 'input1709082581848', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 65536, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1709082581848\",\"renderKey\":\"input17090825818481709082581848\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1709082581848\"}', '[]', '2024-02-28 09:09:43', '2024-02-28 09:09:43');
INSERT INTO `fm_user_form_item` VALUES (59077, 'PLCB6PH0', 'input1709082591646', 'INPUT', '单行文本', 0, 0, 0, 1, NULL, 1, '请输入单行文本', 262144, 24, '{\"typeId\":\"INPUT\",\"config\":{\"label\":\"单行文本\",\"showLabel\":true,\"changeTag\":true,\"tag\":\"t-input\",\"tagIcon\":\"input\",\"required\":true,\"span\":24,\"regList\":[],\"prepend\":\"\",\"append\":\"\",\"dataType\":{\"type\":\"\",\"message\":\"\"},\"formId\":\"input1709082591646\",\"renderKey\":\"input17090825916461709082591646\"},\"placeholder\":\"请输入单行文本\",\"style\":{\"width\":\"100%\"},\"clearable\":true,\"prefix-icon\":\"\",\"suffix-icon\":\"\",\"show-word-limit\":false,\"readonly\":false,\"disabled\":false,\"notRepeat\":false,\"vModel\":\"input1709082591646\"}', '[]', '2024-02-28 09:09:53', '2024-02-28 09:09:53');

-- ----------------------------
-- Table structure for fm_user_form_logic
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_logic`;
CREATE TABLE `fm_user_form_logic`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '逻辑Id',
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `scheme` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '逻辑定义',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1708 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目逻辑' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_logic
-- ----------------------------
INSERT INTO `fm_user_form_logic` VALUES (1707, 'ChsYPBMO', '[{\"triggerList\":[{\"type\":\"show\"}],\"conditionList\":[{\"relation\":\"AND\"}]}]', '2024-02-22 16:45:27', '2024-02-27 16:42:58');

-- ----------------------------
-- Table structure for fm_user_form_setting
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_setting`;
CREATE TABLE `fm_user_form_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `settings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '设置内容 ',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 492 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_setting
-- ----------------------------
INSERT INTO `fm_user_form_setting` VALUES (491, 'PLCB6PH0', '{\"onlyWxWrite\":true,\"recordWxUser\":true,\"saveSubmitStatus\":false,\"saveNotSubmitStatus\":false,\"passwordWriteStatus\":false,\"writePassword\":\"\",\"wxWriteCountLimitStatus\":true,\"wxWriteCountLimit\":1,\"wxWriteCountLimitDateType\":1,\"wxWriteCountLimitText\":\"\",\"ipWriteCountLimitStatus\":true,\"ipWriteCountLimit\":1,\"ipWriteCountLimitDateType\":1,\"ipWriteCountLimitText\":\"\",\"accountWriteCountLimitStatus\":false,\"accountWriteCountLimit\":1,\"accountWriteCountLimitDateType\":1,\"accountWriteCountLimitText\":\"\",\"deviceWriteCountLimitStatus\":true,\"deviceWriteCountLimit\":1,\"deviceWriteCountLimitText\":\"\",\"totalWriteCountLimitStatus\":false,\"totalWriteCountLimit\":1,\"totalWriteCountLimitDateType\":1,\"totalWriteCountLimitText\":\"\",\"writeInterviewTimeStatus\":false,\"writeInterviewDayTimeStatus\":false,\"writeInterviewDateTimeRange\":[],\"writeInterviewDateRange\":[],\"writeInterviewTimeRange\":[],\"writeInterviewTimeWhichDays\":[],\"writeInterviewTimeText\":\"\",\"formKey\":\"PLCB6PH0\"}', '2024-02-29 12:31:14', '2024-02-29 12:31:09');

-- ----------------------------
-- Table structure for fm_user_form_theme
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_theme`;
CREATE TABLE `fm_user_form_theme`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单key',
  `submit_btn_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交按钮文字',
  `logo_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo图片',
  `logo_position` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo位置',
  `background_color` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `background_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `show_title` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示标题',
  `show_describe` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示描述语',
  `theme_color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题颜色\r\n',
  `show_number` tinyint(1) NULL DEFAULT 0 COMMENT '显示序号',
  `show_submit_btn` tinyint(1) NULL DEFAULT 1 COMMENT '显示提交按钮',
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头部图片',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表单项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_theme
-- ----------------------------
INSERT INTO `fm_user_form_theme` VALUES (1772, 'ChsYPBMO', '提交', NULL, 'left', '', '', 1, 1, NULL, 1, 1, '', '2024-02-23 16:11:05', '2024-02-23 16:09:51');

-- ----------------------------
-- Table structure for fm_user_form_view_count
-- ----------------------------
DROP TABLE IF EXISTS `fm_user_form_view_count`;
CREATE TABLE `fm_user_form_view_count`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `form_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单唯一标识',
  `count` int NOT NULL DEFAULT 0,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `form_key`(`form_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表单查看次数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fm_user_form_view_count
-- ----------------------------
INSERT INTO `fm_user_form_view_count` VALUES (1, 'Scnhx6B6', 3, '2024-02-22 06:24:23', '2024-02-22 14:14:55');
INSERT INTO `fm_user_form_view_count` VALUES (2, 'ChsYPBMO', 3, '2024-02-27 03:07:30', '2024-02-22 14:34:10');
INSERT INTO `fm_user_form_view_count` VALUES (3, 'g5jSPt4i', 3, '2024-02-28 01:08:16', '2024-02-27 17:59:18');
INSERT INTO `fm_user_form_view_count` VALUES (4, 'PLCB6PH0', 30, '2024-02-28 09:45:38', '2024-02-28 09:10:26');

-- ----------------------------
-- Table structure for sys_env_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_env_config`;
CREATE TABLE `sys_env_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `env_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `env_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数键值',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统环境配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_env_config
-- ----------------------------
INSERT INTO `sys_env_config` VALUES (9, 'systemInfoConfig', '{\"webBaseUrl\": \"\", \"openWxMpLogin\": false}', '2023-04-04 14:33:29', '2023-04-06 21:19:21');
INSERT INTO `sys_env_config` VALUES (14, 'fileEnvConfig', '{\"ossType\": \"LOCAL\"}', '2023-03-26 14:34:38', '2023-04-04 22:48:43');

-- ----------------------------
-- Table structure for wx_mp_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_user`;
CREATE TABLE `wx_mp_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公众号AppId',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `head_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `union_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `is_subscribe` tinyint(1) NULL DEFAULT 1 COMMENT '是否关注',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户Id',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wx_union_id`(`head_img_url`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号用户 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_mp_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

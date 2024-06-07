/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : watar_iot

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 07/06/2024 21:06:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL COMMENT '指令id',
  `config_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令名',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令模板',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令值',
  `send_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, '温度阈值', 'temperature=?', '2001', 'input');
INSERT INTO `config` VALUES (2, '饮水机1开关', 'c1=?', '1', 'input');
INSERT INTO `config` VALUES (3, '饮水机2开关', 'c2=?', '1', 'input');

-- ----------------------------
-- Table structure for error
-- ----------------------------
DROP TABLE IF EXISTS `error`;
CREATE TABLE `error`  (
  `error_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '错误信息id',
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水机id',
  `error_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'error / warning',
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`error_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of error
-- ----------------------------
INSERT INTO `error` VALUES (1, '2', 'error', '2023-09-05 20:48:25');
INSERT INTO `error` VALUES (2, '2', 'error', '2023-09-05 20:48:26');
INSERT INTO `error` VALUES (3, '2', 'error', '2023-09-05 20:48:41');
INSERT INTO `error` VALUES (4, '2', 'error', '2023-09-05 20:48:42');
INSERT INTO `error` VALUES (5, '2', 'error', '2023-09-05 20:48:44');
INSERT INTO `error` VALUES (6, '2', 'error', '2023-09-05 20:48:45');
INSERT INTO `error` VALUES (7, '1', 'warning', '2023-09-05 22:08:56');
INSERT INTO `error` VALUES (8, '1', 'warning', '2023-09-05 22:08:57');
INSERT INTO `error` VALUES (9, '1', 'warning', '2023-09-05 22:08:58');
INSERT INTO `error` VALUES (10, '1', 'warning', '2023-09-05 22:08:59');
INSERT INTO `error` VALUES (11, '1', 'warning', '2023-09-05 22:09:00');
INSERT INTO `error` VALUES (12, '1', 'warning', '2023-09-05 22:09:01');
INSERT INTO `error` VALUES (13, '1', 'warning', '2023-09-05 22:09:02');
INSERT INTO `error` VALUES (14, '1', 'warning', '2023-09-05 22:09:03');
INSERT INTO `error` VALUES (15, '1', 'warning', '2023-09-05 22:09:04');
INSERT INTO `error` VALUES (16, '1', 'warning', '2023-09-05 22:09:05');
INSERT INTO `error` VALUES (17, '1', 'warning', '2023-09-05 22:09:07');
INSERT INTO `error` VALUES (18, '1', 'warning', '2023-09-05 22:09:08');
INSERT INTO `error` VALUES (19, '1', 'warning', '2023-09-05 22:09:10');
INSERT INTO `error` VALUES (20, '1', 'warning', '2023-09-05 22:09:11');
INSERT INTO `error` VALUES (21, '1', 'warning', '2023-09-05 22:09:13');
INSERT INTO `error` VALUES (22, '1', 'warning', '2023-09-05 22:09:14');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '饮水信息id',
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `student_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生id',
  `stime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水数量',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '实时信息1  重连信息2',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (49, '1', '10001', '2023-09-05 21:23:14', '2', '1');
INSERT INTO `order` VALUES (50, '1', '10000', '2023-09-05 21:23:21', '4', '1');
INSERT INTO `order` VALUES (51, '1', '10000', '2023-09-05 21:25:13', '0', '1');
INSERT INTO `order` VALUES (52, '1', '10000', '2023-09-05 21:25:23', '15', '1');
INSERT INTO `order` VALUES (53, '1', '10000', '2023-09-05 21:25:36', '15', '2');
INSERT INTO `order` VALUES (54, '1', '10000', '2023-09-05 21:25:39', '0', '2');
INSERT INTO `order` VALUES (55, '1', '10000', '2023-09-05 21:25:47', '4', '2');
INSERT INTO `order` VALUES (56, '1', '10001', '2023-09-05 21:25:55', '3', '2');
INSERT INTO `order` VALUES (57, '1', '10000', '2023-09-05 21:40:01', '5', '1');
INSERT INTO `order` VALUES (58, '1', '10000', '2023-09-05 21:40:10', '2', '1');
INSERT INTO `order` VALUES (59, '1', '10000', '2023-09-05 21:40:14', '0', '1');
INSERT INTO `order` VALUES (60, '1', '10001', '2023-09-05 21:40:42', '40', '1');
INSERT INTO `order` VALUES (61, '1', '10001', '2023-09-05 21:41:39', '0', '1');
INSERT INTO `order` VALUES (62, '1', '10000', '2023-09-05 21:41:50', '0', '1');
INSERT INTO `order` VALUES (63, '2', '10000', '2023-09-05 22:24:46', '0', '1');
INSERT INTO `order` VALUES (64, '2', '10001', '2023-09-05 22:24:52', '0', '1');
INSERT INTO `order` VALUES (65, '1', '10001', '2023-09-05 22:25:14', '0', '1');
INSERT INTO `order` VALUES (66, '1', '10000', '2023-09-05 22:25:16', '0', '1');
INSERT INTO `order` VALUES (67, '2', '10001', '2023-09-05 21:39:57', '0', '1');
INSERT INTO `order` VALUES (68, '2', '10001', '2023-09-05 21:40:16', '0', '2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '小米');
INSERT INTO `student` VALUES ('2', '小李');

-- ----------------------------
-- Table structure for water_device
-- ----------------------------
DROP TABLE IF EXISTS `water_device`;
CREATE TABLE `water_device`  (
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '饮水机id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水机状态  0 : 复位  1：暂停  2：正常  3:  故障  4：报警',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水机名称',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置信息',
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device
-- ----------------------------
INSERT INTO `water_device` VALUES ('1', '1', '饮水机1', '图书馆');
INSERT INTO `water_device` VALUES ('2', '1', '饮水机2', '教学楼');

-- ----------------------------
-- Table structure for water_device_info
-- ----------------------------
DROP TABLE IF EXISTS `water_device_info`;
CREATE TABLE `water_device_info`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '数据id',
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水机id',
  `t1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常温水水温',
  `t2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热水水温',
  `tds1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水源水质\r\n',
  `tds2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮水水质',
  `time` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '实时信息1  重连信息2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15846 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_device_info
-- ----------------------------
INSERT INTO `water_device_info` VALUES (15032, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:22:19', '1');
INSERT INTO `water_device_info` VALUES (15033, '1', '26.01', '25.98', '0', '0', '2023-09-05 22:22:19', '1');
INSERT INTO `water_device_info` VALUES (15034, '2', '25.34', '25.48', '3', '2', '2023-09-05 22:22:20', '1');
INSERT INTO `water_device_info` VALUES (15035, '1', '26.01', '25.98', '0', '0', '2023-09-05 22:22:20', '1');
INSERT INTO `water_device_info` VALUES (15036, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:22:21', '1');
INSERT INTO `water_device_info` VALUES (15037, '1', '26.01', '25.97', '0', '0', '2023-09-05 22:22:21', '1');
INSERT INTO `water_device_info` VALUES (15038, '2', '25.37', '25.48', '2', '2', '2023-09-05 22:22:22', '1');
INSERT INTO `water_device_info` VALUES (15039, '1', '26.02', '26', '0', '0', '2023-09-05 22:22:22', '1');
INSERT INTO `water_device_info` VALUES (15040, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:22:23', '1');
INSERT INTO `water_device_info` VALUES (15041, '1', '25.99', '25.95', '0', '0', '2023-09-05 22:22:23', '1');
INSERT INTO `water_device_info` VALUES (15042, '2', '25.37', '25.45', '3', '3', '2023-09-05 22:22:24', '1');
INSERT INTO `water_device_info` VALUES (15043, '1', '25.99', '26', '0', '0', '2023-09-05 22:22:24', '1');
INSERT INTO `water_device_info` VALUES (15044, '2', '25.37', '25.46', '2', '2', '2023-09-05 22:22:25', '1');
INSERT INTO `water_device_info` VALUES (15045, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:22:25', '1');
INSERT INTO `water_device_info` VALUES (15046, '2', '25.37', '25.46', '2', '2', '2023-09-05 22:22:26', '1');
INSERT INTO `water_device_info` VALUES (15047, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:22:26', '1');
INSERT INTO `water_device_info` VALUES (15048, '2', '25.37', '25.48', '2', '2', '2023-09-05 22:22:27', '1');
INSERT INTO `water_device_info` VALUES (15049, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:22:27', '1');
INSERT INTO `water_device_info` VALUES (15050, '2', '25.37', '25.46', '2', '3', '2023-09-05 22:22:28', '1');
INSERT INTO `water_device_info` VALUES (15051, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:22:28', '1');
INSERT INTO `water_device_info` VALUES (15052, '2', '25.4', '25.45', '2', '2', '2023-09-05 22:22:29', '1');
INSERT INTO `water_device_info` VALUES (15053, '1', '25.99', '25.94', '0', '0', '2023-09-05 22:22:29', '1');
INSERT INTO `water_device_info` VALUES (15054, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:22:30', '1');
INSERT INTO `water_device_info` VALUES (15055, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:22:30', '1');
INSERT INTO `water_device_info` VALUES (15056, '2', '25.34', '25.48', '2', '2', '2023-09-05 22:22:31', '1');
INSERT INTO `water_device_info` VALUES (15057, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:22:31', '1');
INSERT INTO `water_device_info` VALUES (15058, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:22:32', '1');
INSERT INTO `water_device_info` VALUES (15059, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:22:32', '1');
INSERT INTO `water_device_info` VALUES (15060, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:22:33', '1');
INSERT INTO `water_device_info` VALUES (15061, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:22:33', '1');
INSERT INTO `water_device_info` VALUES (15062, '2', '25.35', '25.45', '2', '3', '2023-09-05 22:22:34', '1');
INSERT INTO `water_device_info` VALUES (15063, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:22:34', '1');
INSERT INTO `water_device_info` VALUES (15064, '2', '25.35', '25.45', '2', '3', '2023-09-05 22:22:35', '1');
INSERT INTO `water_device_info` VALUES (15065, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:22:35', '1');
INSERT INTO `water_device_info` VALUES (15066, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:22:36', '1');
INSERT INTO `water_device_info` VALUES (15067, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:22:36', '1');
INSERT INTO `water_device_info` VALUES (15068, '2', '25.35', '25.46', '2', '2', '2023-09-05 22:22:37', '1');
INSERT INTO `water_device_info` VALUES (15069, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:22:37', '1');
INSERT INTO `water_device_info` VALUES (15070, '2', '25.34', '25.49', '2', '2', '2023-09-05 22:22:38', '1');
INSERT INTO `water_device_info` VALUES (15071, '1', '25.99', '25.95', '0', '0', '2023-09-05 22:22:38', '1');
INSERT INTO `water_device_info` VALUES (15072, '2', '25.38', '25.45', '2', '2', '2023-09-05 22:22:39', '1');
INSERT INTO `water_device_info` VALUES (15073, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:22:39', '1');
INSERT INTO `water_device_info` VALUES (15074, '2', '25.37', '25.48', '2', '2', '2023-09-05 22:22:40', '1');
INSERT INTO `water_device_info` VALUES (15075, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:22:40', '1');
INSERT INTO `water_device_info` VALUES (15076, '2', '25.38', '25.48', '2', '2', '2023-09-05 22:22:41', '1');
INSERT INTO `water_device_info` VALUES (15077, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:22:41', '1');
INSERT INTO `water_device_info` VALUES (15078, '2', '25.38', '25.45', '2', '2', '2023-09-05 22:22:42', '1');
INSERT INTO `water_device_info` VALUES (15079, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:22:42', '1');
INSERT INTO `water_device_info` VALUES (15080, '2', '25.34', '25.45', '2', '3', '2023-09-05 22:22:43', '1');
INSERT INTO `water_device_info` VALUES (15081, '1', '25.99', '25.98', '0', '0', '2023-09-05 22:22:43', '1');
INSERT INTO `water_device_info` VALUES (15082, '2', '25.34', '25.48', '2', '2', '2023-09-05 22:22:44', '1');
INSERT INTO `water_device_info` VALUES (15083, '1', '25.99', '26.01', '0', '0', '2023-09-05 22:22:44', '1');
INSERT INTO `water_device_info` VALUES (15084, '2', '25.38', '25.46', '2', '2', '2023-09-05 22:22:45', '1');
INSERT INTO `water_device_info` VALUES (15085, '1', '25.99', '26.01', '0', '0', '2023-09-05 22:22:45', '1');
INSERT INTO `water_device_info` VALUES (15086, '2', '25.38', '25.45', '2', '2', '2023-09-05 22:22:46', '1');
INSERT INTO `water_device_info` VALUES (15087, '1', '25.98', '25.98', '0', '0', '2023-09-05 22:22:46', '1');
INSERT INTO `water_device_info` VALUES (15088, '2', '25.37', '25.46', '3', '2', '2023-09-05 22:22:47', '1');
INSERT INTO `water_device_info` VALUES (15089, '1', '26.01', '25.98', '0', '0', '2023-09-05 22:22:47', '1');
INSERT INTO `water_device_info` VALUES (15090, '2', '25.37', '25.43', '3', '2', '2023-09-05 22:22:48', '1');
INSERT INTO `water_device_info` VALUES (15091, '1', '25.99', '25.98', '0', '0', '2023-09-05 22:22:48', '1');
INSERT INTO `water_device_info` VALUES (15092, '2', '25.38', '25.46', '2', '3', '2023-09-05 22:22:49', '1');
INSERT INTO `water_device_info` VALUES (15093, '1', '26.01', '25.98', '0', '0', '2023-09-05 22:22:49', '1');
INSERT INTO `water_device_info` VALUES (15094, '2', '25.38', '25.45', '2', '2', '2023-09-05 22:22:50', '1');
INSERT INTO `water_device_info` VALUES (15095, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:22:50', '1');
INSERT INTO `water_device_info` VALUES (15096, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:22:51', '1');
INSERT INTO `water_device_info` VALUES (15097, '1', '26.04', '26', '0', '0', '2023-09-05 22:22:51', '1');
INSERT INTO `water_device_info` VALUES (15098, '2', '25.37', '25.46', '2', '2', '2023-09-05 22:22:52', '1');
INSERT INTO `water_device_info` VALUES (15099, '1', '26.02', '26.01', '0', '0', '2023-09-05 22:22:52', '1');
INSERT INTO `water_device_info` VALUES (15100, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:22:53', '1');
INSERT INTO `water_device_info` VALUES (15101, '1', '26.02', '26.01', '0', '0', '2023-09-05 22:22:53', '1');
INSERT INTO `water_device_info` VALUES (15102, '2', '25.37', '25.46', '2', '2', '2023-09-05 22:22:54', '1');
INSERT INTO `water_device_info` VALUES (15103, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:22:54', '1');
INSERT INTO `water_device_info` VALUES (15104, '2', '25.35', '25.46', '2', '2', '2023-09-05 22:22:55', '1');
INSERT INTO `water_device_info` VALUES (15105, '1', '25.99', '26', '0', '0', '2023-09-05 22:22:55', '1');
INSERT INTO `water_device_info` VALUES (15106, '2', '25.35', '25.43', '2', '3', '2023-09-05 22:22:56', '1');
INSERT INTO `water_device_info` VALUES (15107, '1', '26.02', '25.98', '0', '0', '2023-09-05 22:22:56', '1');
INSERT INTO `water_device_info` VALUES (15108, '2', '25.35', '25.46', '3', '2', '2023-09-05 22:22:57', '1');
INSERT INTO `water_device_info` VALUES (15109, '1', '26.02', '26', '0', '0', '2023-09-05 22:22:57', '1');
INSERT INTO `water_device_info` VALUES (15110, '2', '25.35', '25.43', '2', '2', '2023-09-05 22:22:58', '1');
INSERT INTO `water_device_info` VALUES (15111, '1', '26.04', '26.03', '0', '0', '2023-09-05 22:22:58', '1');
INSERT INTO `water_device_info` VALUES (15112, '2', '25.35', '25.43', '2', '2', '2023-09-05 22:22:59', '1');
INSERT INTO `water_device_info` VALUES (15113, '1', '26.05', '26.01', '0', '0', '2023-09-05 22:22:59', '1');
INSERT INTO `water_device_info` VALUES (15114, '2', '25.37', '25.45', '2', '2', '2023-09-05 22:23:00', '1');
INSERT INTO `water_device_info` VALUES (15115, '1', '26.05', '26.04', '0', '0', '2023-09-05 22:23:00', '1');
INSERT INTO `water_device_info` VALUES (15116, '2', '25.37', '25.45', '3', '2', '2023-09-05 22:23:01', '1');
INSERT INTO `water_device_info` VALUES (15117, '1', '26.05', '26.04', '0', '0', '2023-09-05 22:23:01', '1');
INSERT INTO `water_device_info` VALUES (15118, '2', '25.35', '25.43', '3', '2', '2023-09-05 22:23:02', '1');
INSERT INTO `water_device_info` VALUES (15119, '1', '26.04', '26.05', '0', '0', '2023-09-05 22:23:02', '1');
INSERT INTO `water_device_info` VALUES (15120, '2', '25.35', '25.46', '2', '2', '2023-09-05 22:23:03', '1');
INSERT INTO `water_device_info` VALUES (15121, '1', '26.05', '26.05', '0', '0', '2023-09-05 22:23:03', '1');
INSERT INTO `water_device_info` VALUES (15122, '2', '25.35', '25.45', '3', '3', '2023-09-05 22:23:04', '1');
INSERT INTO `water_device_info` VALUES (15123, '1', '26.05', '26.05', '0', '0', '2023-09-05 22:23:04', '1');
INSERT INTO `water_device_info` VALUES (15124, '2', '25.34', '25.45', '2', '2', '2023-09-05 22:23:05', '1');
INSERT INTO `water_device_info` VALUES (15125, '1', '26.04', '26.04', '0', '0', '2023-09-05 22:23:05', '1');
INSERT INTO `water_device_info` VALUES (15126, '2', '25.34', '25.46', '2', '2', '2023-09-05 22:23:06', '1');
INSERT INTO `water_device_info` VALUES (15127, '1', '26.05', '26.04', '0', '0', '2023-09-05 22:23:06', '1');
INSERT INTO `water_device_info` VALUES (15128, '2', '25.35', '25.46', '2', '3', '2023-09-05 22:23:07', '1');
INSERT INTO `water_device_info` VALUES (15129, '1', '26.05', '26.03', '0', '0', '2023-09-05 22:23:07', '1');
INSERT INTO `water_device_info` VALUES (15130, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:23:08', '1');
INSERT INTO `water_device_info` VALUES (15131, '1', '26.05', '26.07', '0', '0', '2023-09-05 22:23:08', '1');
INSERT INTO `water_device_info` VALUES (15132, '2', '25.35', '25.43', '2', '3', '2023-09-05 22:23:09', '1');
INSERT INTO `water_device_info` VALUES (15133, '1', '26.05', '26.07', '0', '0', '2023-09-05 22:23:09', '1');
INSERT INTO `water_device_info` VALUES (15134, '2', '25.34', '25.43', '2', '3', '2023-09-05 22:23:10', '1');
INSERT INTO `water_device_info` VALUES (15135, '1', '26.08', '26.05', '0', '0', '2023-09-05 22:23:10', '1');
INSERT INTO `water_device_info` VALUES (15136, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:23:11', '1');
INSERT INTO `water_device_info` VALUES (15137, '1', '26.08', '26.07', '0', '0', '2023-09-05 22:23:11', '1');
INSERT INTO `water_device_info` VALUES (15138, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:23:12', '1');
INSERT INTO `water_device_info` VALUES (15139, '1', '26.08', '26.07', '0', '0', '2023-09-05 22:23:12', '1');
INSERT INTO `water_device_info` VALUES (15140, '2', '25.33', '25.46', '3', '3', '2023-09-05 22:23:13', '1');
INSERT INTO `water_device_info` VALUES (15141, '1', '26.08', '26.07', '0', '0', '2023-09-05 22:23:13', '1');
INSERT INTO `water_device_info` VALUES (15142, '2', '25.33', '25.43', '3', '2', '2023-09-05 22:23:14', '1');
INSERT INTO `water_device_info` VALUES (15143, '1', '26.11', '26.09', '0', '0', '2023-09-05 22:23:14', '1');
INSERT INTO `water_device_info` VALUES (15144, '2', '25.34', '25.43', '2', '2', '2023-09-05 22:23:15', '1');
INSERT INTO `water_device_info` VALUES (15145, '1', '26.11', '26.09', '0', '0', '2023-09-05 22:23:15', '1');
INSERT INTO `water_device_info` VALUES (15146, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:23:16', '1');
INSERT INTO `water_device_info` VALUES (15147, '1', '26.11', '26.09', '0', '0', '2023-09-05 22:23:16', '1');
INSERT INTO `water_device_info` VALUES (15148, '2', '25.33', '25.43', '2', '3', '2023-09-05 22:23:17', '1');
INSERT INTO `water_device_info` VALUES (15149, '1', '26.11', '26.09', '0', '0', '2023-09-05 22:23:17', '1');
INSERT INTO `water_device_info` VALUES (15150, '2', '25.31', '25.45', '2', '2', '2023-09-05 22:23:18', '1');
INSERT INTO `water_device_info` VALUES (15151, '1', '26.12', '26.09', '0', '0', '2023-09-05 22:23:18', '1');
INSERT INTO `water_device_info` VALUES (15152, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:23:19', '1');
INSERT INTO `water_device_info` VALUES (15153, '1', '26.11', '26.09', '0', '0', '2023-09-05 22:23:19', '1');
INSERT INTO `water_device_info` VALUES (15154, '2', '25.33', '25.45', '2', '3', '2023-09-05 22:23:20', '1');
INSERT INTO `water_device_info` VALUES (15155, '1', '26.11', '26.07', '0', '0', '2023-09-05 22:23:20', '1');
INSERT INTO `water_device_info` VALUES (15156, '2', '25.31', '25.46', '2', '2', '2023-09-05 22:23:21', '1');
INSERT INTO `water_device_info` VALUES (15157, '1', '26.08', '26.08', '0', '0', '2023-09-05 22:23:21', '1');
INSERT INTO `water_device_info` VALUES (15158, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:23:22', '1');
INSERT INTO `water_device_info` VALUES (15159, '1', '26.09', '26.08', '0', '0', '2023-09-05 22:23:22', '1');
INSERT INTO `water_device_info` VALUES (15160, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:23:23', '1');
INSERT INTO `water_device_info` VALUES (15161, '1', '26.07', '26.08', '0', '0', '2023-09-05 22:23:23', '1');
INSERT INTO `water_device_info` VALUES (15162, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:23:24', '1');
INSERT INTO `water_device_info` VALUES (15163, '1', '26.09', '26.07', '0', '0', '2023-09-05 22:23:24', '1');
INSERT INTO `water_device_info` VALUES (15164, '2', '25.31', '25.46', '2', '2', '2023-09-05 22:23:25', '1');
INSERT INTO `water_device_info` VALUES (15165, '1', '26.09', '26.07', '0', '0', '2023-09-05 22:23:25', '1');
INSERT INTO `water_device_info` VALUES (15166, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:23:26', '1');
INSERT INTO `water_device_info` VALUES (15167, '1', '26.07', '26.07', '0', '0', '2023-09-05 22:23:26', '1');
INSERT INTO `water_device_info` VALUES (15168, '2', '25.31', '25.39', '2', '2', '2023-09-05 22:23:27', '1');
INSERT INTO `water_device_info` VALUES (15169, '1', '26.07', '26.05', '0', '0', '2023-09-05 22:23:27', '1');
INSERT INTO `water_device_info` VALUES (15170, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:23:28', '1');
INSERT INTO `water_device_info` VALUES (15171, '1', '26.07', '26.05', '0', '0', '2023-09-05 22:23:28', '1');
INSERT INTO `water_device_info` VALUES (15172, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:23:29', '1');
INSERT INTO `water_device_info` VALUES (15173, '1', '26.08', '26.04', '0', '0', '2023-09-05 22:23:29', '1');
INSERT INTO `water_device_info` VALUES (15174, '2', '25.28', '25.42', '3', '3', '2023-09-05 22:23:30', '1');
INSERT INTO `water_device_info` VALUES (15175, '1', '26.05', '26.05', '0', '0', '2023-09-05 22:23:30', '1');
INSERT INTO `water_device_info` VALUES (15176, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:23:31', '1');
INSERT INTO `water_device_info` VALUES (15177, '1', '26.05', '26.03', '0', '0', '2023-09-05 22:23:31', '1');
INSERT INTO `water_device_info` VALUES (15178, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:23:32', '1');
INSERT INTO `water_device_info` VALUES (15179, '1', '26.05', '26.07', '0', '0', '2023-09-05 22:23:32', '1');
INSERT INTO `water_device_info` VALUES (15180, '2', '25.28', '25.4', '2', '3', '2023-09-05 22:23:33', '1');
INSERT INTO `water_device_info` VALUES (15181, '1', '26.05', '26.05', '0', '0', '2023-09-05 22:23:33', '1');
INSERT INTO `water_device_info` VALUES (15182, '2', '25.3', '25.43', '2', '3', '2023-09-05 22:23:34', '1');
INSERT INTO `water_device_info` VALUES (15183, '1', '26.09', '26.05', '0', '0', '2023-09-05 22:23:34', '1');
INSERT INTO `water_device_info` VALUES (15184, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:23:35', '1');
INSERT INTO `water_device_info` VALUES (15185, '1', '26.08', '26.05', '0', '0', '2023-09-05 22:23:35', '1');
INSERT INTO `water_device_info` VALUES (15186, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:23:36', '1');
INSERT INTO `water_device_info` VALUES (15187, '1', '26.08', '26.05', '0', '0', '2023-09-05 22:23:36', '1');
INSERT INTO `water_device_info` VALUES (15188, '2', '25.3', '25.42', '3', '3', '2023-09-05 22:23:37', '1');
INSERT INTO `water_device_info` VALUES (15189, '1', '26.07', '26.05', '0', '0', '2023-09-05 22:23:37', '1');
INSERT INTO `water_device_info` VALUES (15190, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:23:38', '1');
INSERT INTO `water_device_info` VALUES (15191, '1', '26.09', '26.05', '0', '0', '2023-09-05 22:23:38', '1');
INSERT INTO `water_device_info` VALUES (15192, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:23:39', '1');
INSERT INTO `water_device_info` VALUES (15193, '1', '26.09', '26.07', '0', '0', '2023-09-05 22:23:39', '1');
INSERT INTO `water_device_info` VALUES (15194, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:23:40', '1');
INSERT INTO `water_device_info` VALUES (15195, '1', '26.09', '26.05', '0', '0', '2023-09-05 22:23:40', '1');
INSERT INTO `water_device_info` VALUES (15196, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:23:41', '1');
INSERT INTO `water_device_info` VALUES (15197, '1', '26.07', '26.07', '0', '0', '2023-09-05 22:23:41', '1');
INSERT INTO `water_device_info` VALUES (15198, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:23:42', '1');
INSERT INTO `water_device_info` VALUES (15199, '1', '26.07', '26.07', '0', '0', '2023-09-05 22:23:42', '1');
INSERT INTO `water_device_info` VALUES (15200, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:23:43', '1');
INSERT INTO `water_device_info` VALUES (15201, '1', '26.07', '26.05', '0', '0', '2023-09-05 22:23:43', '1');
INSERT INTO `water_device_info` VALUES (15202, '2', '25.31', '25.4', '2', '3', '2023-09-05 22:23:44', '1');
INSERT INTO `water_device_info` VALUES (15203, '1', '26.09', '26.05', '0', '0', '2023-09-05 22:23:44', '1');
INSERT INTO `water_device_info` VALUES (15204, '2', '25.28', '25.42', '3', '2', '2023-09-05 22:23:45', '1');
INSERT INTO `water_device_info` VALUES (15205, '1', '26.08', '26.07', '0', '0', '2023-09-05 22:23:45', '1');
INSERT INTO `water_device_info` VALUES (15206, '2', '25.3', '25.46', '2', '2', '2023-09-05 22:23:46', '1');
INSERT INTO `water_device_info` VALUES (15207, '1', '26.09', '26.08', '0', '0', '2023-09-05 22:23:46', '1');
INSERT INTO `water_device_info` VALUES (15208, '2', '25.3', '25.39', '3', '3', '2023-09-05 22:23:47', '1');
INSERT INTO `water_device_info` VALUES (15209, '1', '26.08', '26.08', '0', '0', '2023-09-05 22:23:47', '1');
INSERT INTO `water_device_info` VALUES (15210, '2', '25.3', '25.39', '2', '3', '2023-09-05 22:23:48', '1');
INSERT INTO `water_device_info` VALUES (15211, '1', '26.09', '26.09', '0', '0', '2023-09-05 22:23:48', '1');
INSERT INTO `water_device_info` VALUES (15212, '2', '25.28', '25.4', '2', '3', '2023-09-05 22:23:49', '1');
INSERT INTO `water_device_info` VALUES (15213, '1', '26.12', '26.09', '0', '0', '2023-09-05 22:23:49', '1');
INSERT INTO `water_device_info` VALUES (15214, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:23:50', '1');
INSERT INTO `water_device_info` VALUES (15215, '1', '26.12', '26.11', '0', '0', '2023-09-05 22:23:50', '1');
INSERT INTO `water_device_info` VALUES (15216, '2', '25.3', '25.42', '3', '3', '2023-09-05 22:23:51', '1');
INSERT INTO `water_device_info` VALUES (15217, '1', '26.11', '26.11', '0', '0', '2023-09-05 22:23:51', '1');
INSERT INTO `water_device_info` VALUES (15218, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:23:52', '1');
INSERT INTO `water_device_info` VALUES (15219, '1', '26.11', '26.11', '0', '0', '2023-09-05 22:23:52', '1');
INSERT INTO `water_device_info` VALUES (15220, '2', '25.28', '25.38', '3', '2', '2023-09-05 22:23:53', '1');
INSERT INTO `water_device_info` VALUES (15221, '1', '26.12', '26.09', '0', '0', '2023-09-05 22:23:53', '1');
INSERT INTO `water_device_info` VALUES (15222, '2', '25.3', '25.4', '3', '3', '2023-09-05 22:23:54', '1');
INSERT INTO `water_device_info` VALUES (15223, '1', '26.12', '26.09', '0', '0', '2023-09-05 22:23:54', '1');
INSERT INTO `water_device_info` VALUES (15224, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:23:55', '1');
INSERT INTO `water_device_info` VALUES (15225, '1', '26.09', '26.09', '0', '0', '2023-09-05 22:23:55', '1');
INSERT INTO `water_device_info` VALUES (15226, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:23:56', '1');
INSERT INTO `water_device_info` VALUES (15227, '1', '26.11', '26.07', '0', '0', '2023-09-05 22:23:56', '1');
INSERT INTO `water_device_info` VALUES (15228, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:23:57', '1');
INSERT INTO `water_device_info` VALUES (15229, '1', '26.09', '26.09', '0', '0', '2023-09-05 22:23:57', '1');
INSERT INTO `water_device_info` VALUES (15230, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:23:58', '1');
INSERT INTO `water_device_info` VALUES (15231, '1', '26.08', '26.08', '0', '0', '2023-09-05 22:23:58', '1');
INSERT INTO `water_device_info` VALUES (15232, '2', '25.25', '25.4', '2', '2', '2023-09-05 22:23:59', '1');
INSERT INTO `water_device_info` VALUES (15233, '1', '26.08', '26.08', '0', '0', '2023-09-05 22:23:59', '1');
INSERT INTO `water_device_info` VALUES (15234, '2', '25.25', '25.39', '3', '2', '2023-09-05 22:24:00', '1');
INSERT INTO `water_device_info` VALUES (15235, '1', '26.08', '26.11', '0', '0', '2023-09-05 22:24:00', '1');
INSERT INTO `water_device_info` VALUES (15236, '2', '25.27', '25.39', '3', '2', '2023-09-05 22:24:01', '1');
INSERT INTO `water_device_info` VALUES (15237, '1', '26.08', '26.09', '0', '0', '2023-09-05 22:24:01', '1');
INSERT INTO `water_device_info` VALUES (15238, '2', '25.25', '25.39', '3', '3', '2023-09-05 22:24:02', '1');
INSERT INTO `water_device_info` VALUES (15239, '1', '26.09', '26.07', '0', '0', '2023-09-05 22:24:02', '1');
INSERT INTO `water_device_info` VALUES (15240, '2', '25.27', '25.42', '3', '2', '2023-09-05 22:24:03', '1');
INSERT INTO `water_device_info` VALUES (15241, '1', '26.04', '26.01', '0', '0', '2023-09-05 22:24:03', '1');
INSERT INTO `water_device_info` VALUES (15242, '2', '25.27', '25.42', '2', '2', '2023-09-05 22:24:04', '1');
INSERT INTO `water_device_info` VALUES (15243, '1', '26.05', '26.04', '0', '0', '2023-09-05 22:24:04', '1');
INSERT INTO `water_device_info` VALUES (15244, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:05', '1');
INSERT INTO `water_device_info` VALUES (15245, '1', '26.02', '26.04', '0', '0', '2023-09-05 22:24:05', '1');
INSERT INTO `water_device_info` VALUES (15246, '2', '25.24', '25.39', '2', '2', '2023-09-05 22:24:06', '1');
INSERT INTO `water_device_info` VALUES (15247, '1', '26.07', '26.04', '0', '0', '2023-09-05 22:24:06', '1');
INSERT INTO `water_device_info` VALUES (15248, '2', '25.25', '25.38', '3', '2', '2023-09-05 22:24:07', '1');
INSERT INTO `water_device_info` VALUES (15249, '1', '26.07', '26.04', '0', '0', '2023-09-05 22:24:07', '1');
INSERT INTO `water_device_info` VALUES (15250, '2', '25.25', '25.38', '3', '2', '2023-09-05 22:24:08', '1');
INSERT INTO `water_device_info` VALUES (15251, '1', '26.02', '26.04', '0', '0', '2023-09-05 22:24:08', '1');
INSERT INTO `water_device_info` VALUES (15252, '2', '25.27', '25.38', '3', '2', '2023-09-05 22:24:09', '1');
INSERT INTO `water_device_info` VALUES (15253, '1', '26.04', '26.04', '0', '0', '2023-09-05 22:24:09', '1');
INSERT INTO `water_device_info` VALUES (15254, '2', '25.23', '25.4', '3', '3', '2023-09-05 22:24:10', '1');
INSERT INTO `water_device_info` VALUES (15255, '1', '26.04', '26.03', '0', '0', '2023-09-05 22:24:10', '1');
INSERT INTO `water_device_info` VALUES (15256, '2', '25.24', '25.38', '2', '3', '2023-09-05 22:24:11', '1');
INSERT INTO `water_device_info` VALUES (15257, '1', '26.05', '26.03', '0', '0', '2023-09-05 22:24:11', '1');
INSERT INTO `water_device_info` VALUES (15258, '2', '25.24', '25.38', '3', '2', '2023-09-05 22:24:12', '1');
INSERT INTO `water_device_info` VALUES (15259, '1', '26.05', '26.03', '0', '0', '2023-09-05 22:24:12', '1');
INSERT INTO `water_device_info` VALUES (15260, '2', '25.24', '25.38', '2', '2', '2023-09-05 22:24:13', '1');
INSERT INTO `water_device_info` VALUES (15261, '1', '26.05', '26.05', '0', '0', '2023-09-05 22:24:13', '1');
INSERT INTO `water_device_info` VALUES (15262, '2', '25.23', '25.39', '2', '2', '2023-09-05 22:24:14', '1');
INSERT INTO `water_device_info` VALUES (15263, '1', '26.04', '26.04', '0', '0', '2023-09-05 22:24:14', '1');
INSERT INTO `water_device_info` VALUES (15264, '2', '25.24', '25.4', '2', '2', '2023-09-05 22:24:15', '1');
INSERT INTO `water_device_info` VALUES (15265, '1', '26.04', '26.03', '0', '0', '2023-09-05 22:24:15', '1');
INSERT INTO `water_device_info` VALUES (15266, '2', '25.23', '25.39', '2', '2', '2023-09-05 22:24:16', '1');
INSERT INTO `water_device_info` VALUES (15267, '1', '26.02', '26.03', '0', '0', '2023-09-05 22:24:16', '1');
INSERT INTO `water_device_info` VALUES (15268, '2', '25.25', '25.38', '2', '2', '2023-09-05 22:24:17', '1');
INSERT INTO `water_device_info` VALUES (15269, '1', '26.02', '26.01', '0', '0', '2023-09-05 22:24:17', '1');
INSERT INTO `water_device_info` VALUES (15270, '2', '25.24', '25.4', '2', '2', '2023-09-05 22:24:18', '1');
INSERT INTO `water_device_info` VALUES (15271, '1', '26.02', '26.03', '0', '0', '2023-09-05 22:24:18', '1');
INSERT INTO `water_device_info` VALUES (15272, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:19', '1');
INSERT INTO `water_device_info` VALUES (15273, '1', '26.02', '26.03', '0', '0', '2023-09-05 22:24:19', '1');
INSERT INTO `water_device_info` VALUES (15274, '2', '25.21', '25.38', '2', '2', '2023-09-05 22:24:20', '1');
INSERT INTO `water_device_info` VALUES (15275, '1', '26.02', '26.01', '0', '0', '2023-09-05 22:24:20', '1');
INSERT INTO `water_device_info` VALUES (15276, '2', '25.21', '25.38', '2', '2', '2023-09-05 22:24:21', '1');
INSERT INTO `water_device_info` VALUES (15277, '1', '26.04', '26.03', '0', '0', '2023-09-05 22:24:21', '1');
INSERT INTO `water_device_info` VALUES (15278, '2', '25.24', '25.38', '2', '1', '2023-09-05 22:24:22', '1');
INSERT INTO `water_device_info` VALUES (15279, '1', '26.02', '26', '0', '0', '2023-09-05 22:24:22', '1');
INSERT INTO `water_device_info` VALUES (15280, '2', '25.24', '25.39', '2', '2', '2023-09-05 22:24:23', '1');
INSERT INTO `water_device_info` VALUES (15281, '1', '26.02', '26', '0', '0', '2023-09-05 22:24:23', '1');
INSERT INTO `water_device_info` VALUES (15282, '2', '25.24', '25.39', '2', '2', '2023-09-05 22:24:24', '1');
INSERT INTO `water_device_info` VALUES (15283, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:24', '1');
INSERT INTO `water_device_info` VALUES (15284, '2', '25.23', '25.39', '2', '2', '2023-09-05 22:24:25', '1');
INSERT INTO `water_device_info` VALUES (15285, '1', '26.02', '26.01', '0', '0', '2023-09-05 22:24:25', '1');
INSERT INTO `water_device_info` VALUES (15286, '2', '25.23', '25.38', '2', '2', '2023-09-05 22:24:26', '1');
INSERT INTO `water_device_info` VALUES (15287, '1', '26.02', '26.04', '0', '0', '2023-09-05 22:24:26', '1');
INSERT INTO `water_device_info` VALUES (15288, '2', '25.24', '25.38', '2', '2', '2023-09-05 22:24:27', '1');
INSERT INTO `water_device_info` VALUES (15289, '1', '26.02', '26', '0', '0', '2023-09-05 22:24:27', '1');
INSERT INTO `water_device_info` VALUES (15290, '2', '25.25', '25.38', '2', '3', '2023-09-05 22:24:28', '1');
INSERT INTO `water_device_info` VALUES (15291, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:28', '1');
INSERT INTO `water_device_info` VALUES (15292, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:29', '1');
INSERT INTO `water_device_info` VALUES (15293, '1', '26.04', '26.01', '0', '0', '2023-09-05 22:24:29', '1');
INSERT INTO `water_device_info` VALUES (15294, '2', '25.23', '25.39', '2', '2', '2023-09-05 22:24:30', '1');
INSERT INTO `water_device_info` VALUES (15295, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:30', '1');
INSERT INTO `water_device_info` VALUES (15296, '2', '25.24', '25.39', '3', '2', '2023-09-05 22:24:31', '1');
INSERT INTO `water_device_info` VALUES (15297, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:31', '1');
INSERT INTO `water_device_info` VALUES (15298, '2', '25.24', '25.36', '2', '2', '2023-09-05 22:24:32', '1');
INSERT INTO `water_device_info` VALUES (15299, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:32', '1');
INSERT INTO `water_device_info` VALUES (15300, '2', '25.24', '25.35', '2', '2', '2023-09-05 22:24:33', '1');
INSERT INTO `water_device_info` VALUES (15301, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:33', '1');
INSERT INTO `water_device_info` VALUES (15302, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:34', '1');
INSERT INTO `water_device_info` VALUES (15303, '1', '26.01', '26.01', '0', '0', '2023-09-05 22:24:34', '1');
INSERT INTO `water_device_info` VALUES (15304, '2', '25.25', '25.38', '2', '2', '2023-09-05 22:24:35', '1');
INSERT INTO `water_device_info` VALUES (15305, '1', '26.02', '26', '0', '0', '2023-09-05 22:24:35', '1');
INSERT INTO `water_device_info` VALUES (15306, '2', '25.24', '25.39', '2', '2', '2023-09-05 22:24:36', '1');
INSERT INTO `water_device_info` VALUES (15307, '1', '26.01', '25.98', '0', '0', '2023-09-05 22:24:36', '1');
INSERT INTO `water_device_info` VALUES (15308, '2', '25.24', '25.39', '2', '3', '2023-09-05 22:24:37', '1');
INSERT INTO `water_device_info` VALUES (15309, '1', '26.01', '26', '0', '0', '2023-09-05 22:24:37', '1');
INSERT INTO `water_device_info` VALUES (15310, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:38', '1');
INSERT INTO `water_device_info` VALUES (15311, '1', '26.02', '25.98', '0', '0', '2023-09-05 22:24:38', '1');
INSERT INTO `water_device_info` VALUES (15312, '2', '25.24', '25.38', '3', '2', '2023-09-05 22:24:39', '1');
INSERT INTO `water_device_info` VALUES (15313, '1', '26.02', '25.98', '0', '0', '2023-09-05 22:24:39', '1');
INSERT INTO `water_device_info` VALUES (15314, '2', '25.25', '25.36', '3', '2', '2023-09-05 22:24:40', '1');
INSERT INTO `water_device_info` VALUES (15315, '1', '25.98', '25.98', '0', '0', '2023-09-05 22:24:40', '1');
INSERT INTO `water_device_info` VALUES (15316, '2', '25.24', '25.4', '2', '2', '2023-09-05 22:24:41', '1');
INSERT INTO `water_device_info` VALUES (15317, '1', '25.98', '25.98', '0', '0', '2023-09-05 22:24:41', '1');
INSERT INTO `water_device_info` VALUES (15318, '2', '25.25', '25.36', '2', '2', '2023-09-05 22:24:42', '1');
INSERT INTO `water_device_info` VALUES (15319, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:24:42', '1');
INSERT INTO `water_device_info` VALUES (15320, '2', '25.24', '25.39', '2', '2', '2023-09-05 22:24:43', '1');
INSERT INTO `water_device_info` VALUES (15321, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:24:43', '1');
INSERT INTO `water_device_info` VALUES (15322, '2', '25.27', '25.38', '2', '2', '2023-09-05 22:24:44', '1');
INSERT INTO `water_device_info` VALUES (15323, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:24:44', '1');
INSERT INTO `water_device_info` VALUES (15324, '2', '25.27', '25.4', '3', '2', '2023-09-05 22:24:45', '1');
INSERT INTO `water_device_info` VALUES (15325, '1', '25.98', '26', '0', '0', '2023-09-05 22:24:45', '1');
INSERT INTO `water_device_info` VALUES (15326, '2', '25.27', '25.4', '2', '2', '2023-09-05 22:24:46', '1');
INSERT INTO `water_device_info` VALUES (15327, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:24:46', '1');
INSERT INTO `water_device_info` VALUES (15328, '2', '25.24', '25.38', '2', '2', '2023-09-05 22:24:47', '1');
INSERT INTO `water_device_info` VALUES (15329, '1', '25.99', '25.95', '0', '0', '2023-09-05 22:24:47', '1');
INSERT INTO `water_device_info` VALUES (15330, '2', '25.24', '25.38', '2', '2', '2023-09-05 22:24:48', '1');
INSERT INTO `water_device_info` VALUES (15331, '1', '25.99', '25.95', '0', '0', '2023-09-05 22:24:48', '1');
INSERT INTO `water_device_info` VALUES (15332, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:49', '1');
INSERT INTO `water_device_info` VALUES (15333, '1', '25.99', '25.95', '0', '0', '2023-09-05 22:24:49', '1');
INSERT INTO `water_device_info` VALUES (15334, '2', '25.25', '25.36', '2', '2', '2023-09-05 22:24:50', '1');
INSERT INTO `water_device_info` VALUES (15335, '1', '25.97', '25.94', '0', '0', '2023-09-05 22:24:50', '1');
INSERT INTO `water_device_info` VALUES (15336, '2', '25.25', '25.38', '3', '3', '2023-09-05 22:24:51', '1');
INSERT INTO `water_device_info` VALUES (15337, '1', '25.99', '25.93', '0', '0', '2023-09-05 22:24:51', '1');
INSERT INTO `water_device_info` VALUES (15338, '2', '25.25', '25.36', '2', '2', '2023-09-05 22:24:52', '1');
INSERT INTO `water_device_info` VALUES (15339, '1', '25.97', '25.95', '0', '0', '2023-09-05 22:24:52', '1');
INSERT INTO `water_device_info` VALUES (15340, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:24:53', '1');
INSERT INTO `water_device_info` VALUES (15341, '1', '26.01', '25.95', '0', '0', '2023-09-05 22:24:53', '1');
INSERT INTO `water_device_info` VALUES (15342, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:24:54', '1');
INSERT INTO `water_device_info` VALUES (15343, '1', '25.99', '25.97', '0', '0', '2023-09-05 22:24:54', '1');
INSERT INTO `water_device_info` VALUES (15344, '2', '25.27', '25.39', '3', '2', '2023-09-05 22:24:55', '1');
INSERT INTO `water_device_info` VALUES (15345, '1', '25.97', '25.97', '0', '0', '2023-09-05 22:24:55', '1');
INSERT INTO `water_device_info` VALUES (15346, '2', '25.27', '25.39', '2', '2', '2023-09-05 22:24:56', '1');
INSERT INTO `water_device_info` VALUES (15347, '1', '25.97', '25.94', '0', '0', '2023-09-05 22:24:56', '1');
INSERT INTO `water_device_info` VALUES (15348, '2', '25.24', '25.36', '2', '2', '2023-09-05 22:24:57', '1');
INSERT INTO `water_device_info` VALUES (15349, '1', '25.98', '25.94', '0', '0', '2023-09-05 22:24:57', '1');
INSERT INTO `water_device_info` VALUES (15350, '2', '25.27', '25.39', '2', '2', '2023-09-05 22:24:58', '1');
INSERT INTO `water_device_info` VALUES (15351, '1', '25.97', '25.97', '0', '0', '2023-09-05 22:24:58', '1');
INSERT INTO `water_device_info` VALUES (15352, '2', '25.27', '25.4', '2', '2', '2023-09-05 22:24:59', '1');
INSERT INTO `water_device_info` VALUES (15353, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:24:59', '1');
INSERT INTO `water_device_info` VALUES (15354, '2', '25.27', '25.38', '3', '3', '2023-09-05 22:25:00', '1');
INSERT INTO `water_device_info` VALUES (15355, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:25:00', '1');
INSERT INTO `water_device_info` VALUES (15356, '2', '25.27', '25.39', '3', '3', '2023-09-05 22:25:01', '1');
INSERT INTO `water_device_info` VALUES (15357, '1', '25.97', '25.94', '0', '0', '2023-09-05 22:25:01', '1');
INSERT INTO `water_device_info` VALUES (15358, '2', '25.27', '25.39', '2', '3', '2023-09-05 22:25:02', '1');
INSERT INTO `water_device_info` VALUES (15359, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:25:02', '1');
INSERT INTO `water_device_info` VALUES (15360, '2', '25.24', '25.4', '2', '2', '2023-09-05 22:25:03', '1');
INSERT INTO `water_device_info` VALUES (15361, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:25:03', '1');
INSERT INTO `water_device_info` VALUES (15362, '2', '25.27', '25.39', '3', '2', '2023-09-05 22:25:04', '1');
INSERT INTO `water_device_info` VALUES (15363, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:25:04', '1');
INSERT INTO `water_device_info` VALUES (15364, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:25:05', '1');
INSERT INTO `water_device_info` VALUES (15365, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:25:05', '1');
INSERT INTO `water_device_info` VALUES (15366, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:25:06', '1');
INSERT INTO `water_device_info` VALUES (15367, '1', '25.97', '25.95', '0', '0', '2023-09-05 22:25:06', '1');
INSERT INTO `water_device_info` VALUES (15368, '2', '25.27', '25.38', '2', '2', '2023-09-05 22:25:07', '1');
INSERT INTO `water_device_info` VALUES (15369, '1', '25.97', '25.95', '0', '0', '2023-09-05 22:25:07', '1');
INSERT INTO `water_device_info` VALUES (15370, '2', '25.28', '25.38', '2', '2', '2023-09-05 22:25:08', '1');
INSERT INTO `water_device_info` VALUES (15371, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:25:08', '1');
INSERT INTO `water_device_info` VALUES (15372, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:25:09', '1');
INSERT INTO `water_device_info` VALUES (15373, '1', '25.98', '25.95', '0', '0', '2023-09-05 22:25:09', '1');
INSERT INTO `water_device_info` VALUES (15374, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:25:10', '1');
INSERT INTO `water_device_info` VALUES (15375, '1', '25.95', '25.95', '0', '0', '2023-09-05 22:25:10', '1');
INSERT INTO `water_device_info` VALUES (15376, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:25:11', '1');
INSERT INTO `water_device_info` VALUES (15377, '1', '25.94', '25.94', '0', '0', '2023-09-05 22:25:11', '1');
INSERT INTO `water_device_info` VALUES (15378, '2', '25.3', '25.42', '2', '3', '2023-09-05 22:25:12', '1');
INSERT INTO `water_device_info` VALUES (15379, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:25:12', '1');
INSERT INTO `water_device_info` VALUES (15380, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:25:13', '1');
INSERT INTO `water_device_info` VALUES (15381, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:25:13', '1');
INSERT INTO `water_device_info` VALUES (15382, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:25:14', '1');
INSERT INTO `water_device_info` VALUES (15383, '1', '25.95', '25.94', '0', '0', '2023-09-05 22:25:14', '1');
INSERT INTO `water_device_info` VALUES (15384, '2', '25.28', '25.39', '2', '3', '2023-09-05 22:25:15', '1');
INSERT INTO `water_device_info` VALUES (15385, '1', '25.97', '25.94', '0', '0', '2023-09-05 22:25:15', '1');
INSERT INTO `water_device_info` VALUES (15386, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:25:16', '1');
INSERT INTO `water_device_info` VALUES (15387, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:25:16', '1');
INSERT INTO `water_device_info` VALUES (15388, '2', '25.28', '25.38', '2', '2', '2023-09-05 22:25:17', '1');
INSERT INTO `water_device_info` VALUES (15389, '1', '25.94', '25.91', '0', '0', '2023-09-05 22:25:17', '1');
INSERT INTO `water_device_info` VALUES (15390, '2', '25.3', '25.38', '3', '2', '2023-09-05 22:25:18', '1');
INSERT INTO `water_device_info` VALUES (15391, '1', '25.92', '25.93', '0', '0', '2023-09-05 22:25:18', '1');
INSERT INTO `water_device_info` VALUES (15392, '2', '25.3', '25.42', '2', '3', '2023-09-05 22:25:19', '1');
INSERT INTO `water_device_info` VALUES (15393, '1', '25.92', '25.93', '0', '0', '2023-09-05 22:25:19', '1');
INSERT INTO `water_device_info` VALUES (15394, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:25:20', '1');
INSERT INTO `water_device_info` VALUES (15395, '1', '25.92', '25.91', '0', '0', '2023-09-05 22:25:20', '1');
INSERT INTO `water_device_info` VALUES (15396, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:25:21', '1');
INSERT INTO `water_device_info` VALUES (15397, '1', '25.92', '25.91', '0', '0', '2023-09-05 22:25:21', '1');
INSERT INTO `water_device_info` VALUES (15398, '2', '25.31', '25.39', '3', '2', '2023-09-05 22:25:22', '1');
INSERT INTO `water_device_info` VALUES (15399, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:25:22', '1');
INSERT INTO `water_device_info` VALUES (15400, '2', '25.3', '25.4', '3', '2', '2023-09-05 22:25:23', '1');
INSERT INTO `water_device_info` VALUES (15401, '1', '25.94', '25.9', '0', '0', '2023-09-05 22:25:23', '1');
INSERT INTO `water_device_info` VALUES (15402, '2', '25.3', '25.38', '3', '3', '2023-09-05 22:25:24', '1');
INSERT INTO `water_device_info` VALUES (15403, '1', '25.91', '25.93', '0', '0', '2023-09-05 22:25:24', '1');
INSERT INTO `water_device_info` VALUES (15404, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:25:25', '1');
INSERT INTO `water_device_info` VALUES (15405, '1', '25.92', '25.93', '0', '0', '2023-09-05 22:25:25', '1');
INSERT INTO `water_device_info` VALUES (15406, '2', '25.28', '25.39', '2', '3', '2023-09-05 22:25:26', '1');
INSERT INTO `water_device_info` VALUES (15407, '1', '25.94', '25.91', '0', '0', '2023-09-05 22:25:26', '1');
INSERT INTO `water_device_info` VALUES (15408, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:25:27', '1');
INSERT INTO `water_device_info` VALUES (15409, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:25:27', '1');
INSERT INTO `water_device_info` VALUES (15410, '2', '25.3', '25.4', '3', '2', '2023-09-05 22:25:28', '1');
INSERT INTO `water_device_info` VALUES (15411, '1', '25.94', '25.91', '0', '0', '2023-09-05 22:25:28', '1');
INSERT INTO `water_device_info` VALUES (15412, '2', '25.28', '25.39', '1', '2', '2023-09-05 22:25:29', '1');
INSERT INTO `water_device_info` VALUES (15413, '1', '25.94', '25.91', '0', '0', '2023-09-05 22:25:29', '1');
INSERT INTO `water_device_info` VALUES (15414, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:25:30', '1');
INSERT INTO `water_device_info` VALUES (15415, '1', '25.94', '25.9', '0', '0', '2023-09-05 22:25:30', '1');
INSERT INTO `water_device_info` VALUES (15416, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:25:31', '1');
INSERT INTO `water_device_info` VALUES (15417, '1', '25.91', '25.9', '0', '0', '2023-09-05 22:25:31', '1');
INSERT INTO `water_device_info` VALUES (15418, '2', '25.31', '25.39', '3', '3', '2023-09-05 22:25:32', '1');
INSERT INTO `water_device_info` VALUES (15419, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:25:32', '1');
INSERT INTO `water_device_info` VALUES (15420, '2', '25.3', '25.42', '3', '3', '2023-09-05 22:25:33', '1');
INSERT INTO `water_device_info` VALUES (15421, '1', '25.92', '25.9', '0', '0', '2023-09-05 22:25:33', '1');
INSERT INTO `water_device_info` VALUES (15422, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:25:34', '1');
INSERT INTO `water_device_info` VALUES (15423, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:25:34', '1');
INSERT INTO `water_device_info` VALUES (15424, '2', '25.31', '25.39', '2', '2', '2023-09-05 22:25:35', '1');
INSERT INTO `water_device_info` VALUES (15425, '1', '25.92', '25.9', '0', '0', '2023-09-05 22:25:35', '1');
INSERT INTO `water_device_info` VALUES (15426, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:25:36', '1');
INSERT INTO `water_device_info` VALUES (15427, '1', '25.91', '25.88', '1', '0', '2023-09-05 22:25:36', '1');
INSERT INTO `water_device_info` VALUES (15428, '2', '25.27', '25.39', '2', '2', '2023-09-05 22:25:37', '1');
INSERT INTO `water_device_info` VALUES (15429, '1', '25.91', '25.88', '0', '0', '2023-09-05 22:25:37', '1');
INSERT INTO `water_device_info` VALUES (15430, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:25:38', '1');
INSERT INTO `water_device_info` VALUES (15431, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:25:38', '1');
INSERT INTO `water_device_info` VALUES (15432, '2', '25.3', '25.42', '3', '2', '2023-09-05 22:25:39', '1');
INSERT INTO `water_device_info` VALUES (15433, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:25:39', '1');
INSERT INTO `water_device_info` VALUES (15434, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:25:40', '1');
INSERT INTO `water_device_info` VALUES (15435, '1', '25.89', '25.85', '0', '0', '2023-09-05 22:25:40', '1');
INSERT INTO `water_device_info` VALUES (15436, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:25:41', '1');
INSERT INTO `water_device_info` VALUES (15437, '1', '25.89', '25.85', '0', '0', '2023-09-05 22:25:41', '1');
INSERT INTO `water_device_info` VALUES (15438, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:25:42', '1');
INSERT INTO `water_device_info` VALUES (15439, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:25:42', '1');
INSERT INTO `water_device_info` VALUES (15440, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:25:43', '1');
INSERT INTO `water_device_info` VALUES (15441, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:25:43', '1');
INSERT INTO `water_device_info` VALUES (15442, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:25:44', '1');
INSERT INTO `water_device_info` VALUES (15443, '1', '25.85', '25.84', '0', '0', '2023-09-05 22:25:44', '1');
INSERT INTO `water_device_info` VALUES (15444, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:25:45', '1');
INSERT INTO `water_device_info` VALUES (15445, '1', '25.84', '25.85', '0', '0', '2023-09-05 22:25:45', '1');
INSERT INTO `water_device_info` VALUES (15446, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:25:46', '1');
INSERT INTO `water_device_info` VALUES (15447, '1', '25.84', '25.85', '0', '0', '2023-09-05 22:25:46', '1');
INSERT INTO `water_device_info` VALUES (15448, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:25:47', '1');
INSERT INTO `water_device_info` VALUES (15449, '1', '25.84', '25.85', '0', '0', '2023-09-05 22:25:47', '1');
INSERT INTO `water_device_info` VALUES (15450, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:25:48', '1');
INSERT INTO `water_device_info` VALUES (15451, '1', '25.84', '25.87', '0', '0', '2023-09-05 22:25:48', '1');
INSERT INTO `water_device_info` VALUES (15452, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:25:49', '1');
INSERT INTO `water_device_info` VALUES (15453, '1', '25.85', '25.84', '0', '0', '2023-09-05 22:25:49', '1');
INSERT INTO `water_device_info` VALUES (15454, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:25:50', '1');
INSERT INTO `water_device_info` VALUES (15455, '1', '25.84', '25.81', '0', '0', '2023-09-05 22:25:50', '1');
INSERT INTO `water_device_info` VALUES (15456, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:25:51', '1');
INSERT INTO `water_device_info` VALUES (15457, '1', '25.84', '25.81', '0', '0', '2023-09-05 22:25:51', '1');
INSERT INTO `water_device_info` VALUES (15458, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:25:52', '1');
INSERT INTO `water_device_info` VALUES (15459, '1', '25.83', '25.81', '0', '0', '2023-09-05 22:25:52', '1');
INSERT INTO `water_device_info` VALUES (15460, '2', '25.28', '25.43', '2', '3', '2023-09-05 22:25:53', '1');
INSERT INTO `water_device_info` VALUES (15461, '1', '25.81', '25.8', '0', '0', '2023-09-05 22:25:53', '1');
INSERT INTO `water_device_info` VALUES (15462, '2', '25.3', '25.38', '2', '2', '2023-09-05 22:25:54', '1');
INSERT INTO `water_device_info` VALUES (15463, '1', '25.81', '25.8', '0', '0', '2023-09-05 22:25:54', '1');
INSERT INTO `water_device_info` VALUES (15464, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:25:55', '1');
INSERT INTO `water_device_info` VALUES (15465, '1', '25.84', '25.8', '0', '0', '2023-09-05 22:25:55', '1');
INSERT INTO `water_device_info` VALUES (15466, '2', '25.3', '25.38', '3', '2', '2023-09-05 22:25:56', '1');
INSERT INTO `water_device_info` VALUES (15467, '1', '25.83', '25.81', '0', '0', '2023-09-05 22:25:56', '1');
INSERT INTO `water_device_info` VALUES (15468, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:25:57', '1');
INSERT INTO `water_device_info` VALUES (15469, '1', '25.83', '25.83', '0', '0', '2023-09-05 22:25:57', '1');
INSERT INTO `water_device_info` VALUES (15470, '2', '25.25', '25.39', '2', '2', '2023-09-05 22:25:58', '1');
INSERT INTO `water_device_info` VALUES (15471, '1', '25.84', '25.83', '0', '0', '2023-09-05 22:25:58', '1');
INSERT INTO `water_device_info` VALUES (15472, '2', '25.25', '25.42', '2', '2', '2023-09-05 22:25:59', '1');
INSERT INTO `water_device_info` VALUES (15473, '1', '25.83', '25.8', '0', '0', '2023-09-05 22:25:59', '1');
INSERT INTO `water_device_info` VALUES (15474, '2', '25.3', '25.42', '2', '3', '2023-09-05 22:26:00', '1');
INSERT INTO `water_device_info` VALUES (15475, '1', '25.81', '25.8', '0', '0', '2023-09-05 22:26:00', '1');
INSERT INTO `water_device_info` VALUES (15476, '2', '25.28', '25.39', '2', '2', '2023-09-05 22:26:01', '1');
INSERT INTO `water_device_info` VALUES (15477, '1', '25.83', '25.83', '0', '0', '2023-09-05 22:26:01', '1');
INSERT INTO `water_device_info` VALUES (15478, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:26:02', '1');
INSERT INTO `water_device_info` VALUES (15479, '1', '25.83', '25.83', '0', '0', '2023-09-05 22:26:02', '1');
INSERT INTO `water_device_info` VALUES (15480, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:26:03', '1');
INSERT INTO `water_device_info` VALUES (15481, '1', '25.85', '25.83', '0', '0', '2023-09-05 22:26:03', '1');
INSERT INTO `water_device_info` VALUES (15482, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:26:04', '1');
INSERT INTO `water_device_info` VALUES (15483, '1', '25.83', '25.83', '0', '0', '2023-09-05 22:26:04', '1');
INSERT INTO `water_device_info` VALUES (15484, '2', '25.3', '25.39', '3', '3', '2023-09-05 22:26:05', '1');
INSERT INTO `water_device_info` VALUES (15485, '1', '25.81', '25.81', '0', '0', '2023-09-05 22:26:05', '1');
INSERT INTO `water_device_info` VALUES (15486, '2', '25.27', '25.42', '2', '2', '2023-09-05 22:26:06', '1');
INSERT INTO `water_device_info` VALUES (15487, '1', '25.81', '25.83', '0', '0', '2023-09-05 22:26:06', '1');
INSERT INTO `water_device_info` VALUES (15488, '2', '25.27', '25.42', '2', '3', '2023-09-05 22:26:07', '1');
INSERT INTO `water_device_info` VALUES (15489, '1', '25.84', '25.83', '0', '0', '2023-09-05 22:26:07', '1');
INSERT INTO `water_device_info` VALUES (15490, '2', '25.31', '25.4', '3', '2', '2023-09-05 22:26:08', '1');
INSERT INTO `water_device_info` VALUES (15491, '1', '25.84', '25.83', '0', '0', '2023-09-05 22:26:08', '1');
INSERT INTO `water_device_info` VALUES (15492, '2', '25.28', '25.4', '2', '3', '2023-09-05 22:26:09', '1');
INSERT INTO `water_device_info` VALUES (15493, '1', '25.84', '25.83', '0', '0', '2023-09-05 22:26:09', '1');
INSERT INTO `water_device_info` VALUES (15494, '2', '25.31', '25.38', '2', '2', '2023-09-05 22:26:10', '1');
INSERT INTO `water_device_info` VALUES (15495, '1', '25.84', '25.84', '0', '0', '2023-09-05 22:26:10', '1');
INSERT INTO `water_device_info` VALUES (15496, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:11', '1');
INSERT INTO `water_device_info` VALUES (15497, '1', '25.84', '25.84', '0', '0', '2023-09-05 22:26:11', '1');
INSERT INTO `water_device_info` VALUES (15498, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:26:12', '1');
INSERT INTO `water_device_info` VALUES (15499, '1', '25.85', '25.87', '0', '0', '2023-09-05 22:26:12', '1');
INSERT INTO `water_device_info` VALUES (15500, '2', '25.28', '25.45', '3', '3', '2023-09-05 22:26:13', '1');
INSERT INTO `water_device_info` VALUES (15501, '1', '25.83', '25.85', '0', '0', '2023-09-05 22:26:13', '1');
INSERT INTO `water_device_info` VALUES (15502, '2', '25.31', '25.4', '2', '3', '2023-09-05 22:26:14', '1');
INSERT INTO `water_device_info` VALUES (15503, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:26:14', '1');
INSERT INTO `water_device_info` VALUES (15504, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:15', '1');
INSERT INTO `water_device_info` VALUES (15505, '1', '25.87', '25.9', '0', '0', '2023-09-05 22:26:15', '1');
INSERT INTO `water_device_info` VALUES (15506, '2', '25.31', '25.42', '2', '4', '2023-09-05 22:26:16', '1');
INSERT INTO `water_device_info` VALUES (15507, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:26:16', '1');
INSERT INTO `water_device_info` VALUES (15508, '2', '25.33', '25.42', '2', '4', '2023-09-05 22:26:17', '1');
INSERT INTO `water_device_info` VALUES (15509, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:26:17', '1');
INSERT INTO `water_device_info` VALUES (15510, '2', '25.31', '25.39', '2', '2', '2023-09-05 22:26:18', '1');
INSERT INTO `water_device_info` VALUES (15511, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:26:18', '1');
INSERT INTO `water_device_info` VALUES (15512, '2', '25.3', '25.42', '3', '2', '2023-09-05 22:26:19', '1');
INSERT INTO `water_device_info` VALUES (15513, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:26:19', '1');
INSERT INTO `water_device_info` VALUES (15514, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:26:20', '1');
INSERT INTO `water_device_info` VALUES (15515, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:26:20', '1');
INSERT INTO `water_device_info` VALUES (15516, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:26:21', '1');
INSERT INTO `water_device_info` VALUES (15517, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:21', '1');
INSERT INTO `water_device_info` VALUES (15518, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:26:22', '1');
INSERT INTO `water_device_info` VALUES (15519, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:26:22', '1');
INSERT INTO `water_device_info` VALUES (15520, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:26:23', '1');
INSERT INTO `water_device_info` VALUES (15521, '1', '25.87', '25.9', '0', '0', '2023-09-05 22:26:23', '1');
INSERT INTO `water_device_info` VALUES (15522, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:26:24', '1');
INSERT INTO `water_device_info` VALUES (15523, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:26:24', '1');
INSERT INTO `water_device_info` VALUES (15524, '2', '25.31', '25.39', '3', '2', '2023-09-05 22:26:25', '1');
INSERT INTO `water_device_info` VALUES (15525, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:25', '1');
INSERT INTO `water_device_info` VALUES (15526, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:26:26', '1');
INSERT INTO `water_device_info` VALUES (15527, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:26', '1');
INSERT INTO `water_device_info` VALUES (15528, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:26:27', '1');
INSERT INTO `water_device_info` VALUES (15529, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:27', '1');
INSERT INTO `water_device_info` VALUES (15530, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:28', '1');
INSERT INTO `water_device_info` VALUES (15531, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:28', '1');
INSERT INTO `water_device_info` VALUES (15532, '2', '25.3', '25.4', '3', '2', '2023-09-05 22:26:29', '1');
INSERT INTO `water_device_info` VALUES (15533, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:29', '1');
INSERT INTO `water_device_info` VALUES (15534, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:30', '1');
INSERT INTO `water_device_info` VALUES (15535, '1', '25.87', '25.9', '0', '0', '2023-09-05 22:26:30', '1');
INSERT INTO `water_device_info` VALUES (15536, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:26:31', '1');
INSERT INTO `water_device_info` VALUES (15537, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:26:31', '1');
INSERT INTO `water_device_info` VALUES (15538, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:26:32', '1');
INSERT INTO `water_device_info` VALUES (15539, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:32', '1');
INSERT INTO `water_device_info` VALUES (15540, '2', '25.31', '25.42', '3', '2', '2023-09-05 22:26:33', '1');
INSERT INTO `water_device_info` VALUES (15541, '1', '25.89', '25.91', '0', '0', '2023-09-05 22:26:33', '1');
INSERT INTO `water_device_info` VALUES (15542, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:26:34', '1');
INSERT INTO `water_device_info` VALUES (15543, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:26:34', '1');
INSERT INTO `water_device_info` VALUES (15544, '2', '25.28', '25.43', '2', '2', '2023-09-05 22:26:35', '1');
INSERT INTO `water_device_info` VALUES (15545, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:26:35', '1');
INSERT INTO `water_device_info` VALUES (15546, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:36', '1');
INSERT INTO `water_device_info` VALUES (15547, '1', '25.85', '25.87', '0', '0', '2023-09-05 22:26:36', '1');
INSERT INTO `water_device_info` VALUES (15548, '2', '25.31', '25.42', '2', '3', '2023-09-05 22:26:37', '1');
INSERT INTO `water_device_info` VALUES (15549, '1', '25.85', '25.88', '0', '0', '2023-09-05 22:26:37', '1');
INSERT INTO `water_device_info` VALUES (15550, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:26:38', '1');
INSERT INTO `water_device_info` VALUES (15551, '1', '25.87', '25.9', '0', '0', '2023-09-05 22:26:38', '1');
INSERT INTO `water_device_info` VALUES (15552, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:26:39', '1');
INSERT INTO `water_device_info` VALUES (15553, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:39', '1');
INSERT INTO `water_device_info` VALUES (15554, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:26:40', '1');
INSERT INTO `water_device_info` VALUES (15555, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:40', '1');
INSERT INTO `water_device_info` VALUES (15556, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:26:41', '1');
INSERT INTO `water_device_info` VALUES (15557, '1', '25.87', '25.9', '0', '0', '2023-09-05 22:26:41', '1');
INSERT INTO `water_device_info` VALUES (15558, '2', '25.33', '25.42', '3', '2', '2023-09-05 22:26:42', '1');
INSERT INTO `water_device_info` VALUES (15559, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:26:42', '1');
INSERT INTO `water_device_info` VALUES (15560, '2', '25.31', '25.4', '2', '3', '2023-09-05 22:26:43', '1');
INSERT INTO `water_device_info` VALUES (15561, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:43', '1');
INSERT INTO `water_device_info` VALUES (15562, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:26:44', '1');
INSERT INTO `water_device_info` VALUES (15563, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:26:44', '1');
INSERT INTO `water_device_info` VALUES (15564, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:45', '1');
INSERT INTO `water_device_info` VALUES (15565, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:26:45', '1');
INSERT INTO `water_device_info` VALUES (15566, '2', '25.34', '25.42', '3', '3', '2023-09-05 22:26:46', '1');
INSERT INTO `water_device_info` VALUES (15567, '1', '25.88', '25.91', '0', '0', '2023-09-05 22:26:46', '1');
INSERT INTO `water_device_info` VALUES (15568, '2', '25.31', '25.43', '2', '3', '2023-09-05 22:26:47', '1');
INSERT INTO `water_device_info` VALUES (15569, '1', '25.91', '25.9', '0', '0', '2023-09-05 22:26:47', '1');
INSERT INTO `water_device_info` VALUES (15570, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:26:48', '1');
INSERT INTO `water_device_info` VALUES (15571, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:26:48', '1');
INSERT INTO `water_device_info` VALUES (15572, '2', '25.34', '25.43', '2', '2', '2023-09-05 22:26:49', '1');
INSERT INTO `water_device_info` VALUES (15573, '1', '25.91', '25.9', '0', '0', '2023-09-05 22:26:49', '1');
INSERT INTO `water_device_info` VALUES (15574, '2', '25.31', '25.42', '3', '2', '2023-09-05 22:26:50', '1');
INSERT INTO `water_device_info` VALUES (15575, '1', '25.89', '25.91', '0', '0', '2023-09-05 22:26:50', '1');
INSERT INTO `water_device_info` VALUES (15576, '2', '25.31', '25.42', '3', '2', '2023-09-05 22:26:51', '1');
INSERT INTO `water_device_info` VALUES (15577, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:51', '1');
INSERT INTO `water_device_info` VALUES (15578, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:26:52', '1');
INSERT INTO `water_device_info` VALUES (15579, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:26:52', '1');
INSERT INTO `water_device_info` VALUES (15580, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:26:53', '1');
INSERT INTO `water_device_info` VALUES (15581, '1', '25.89', '25.91', '0', '0', '2023-09-05 22:26:53', '1');
INSERT INTO `water_device_info` VALUES (15582, '2', '25.31', '25.4', '2', '3', '2023-09-05 22:26:54', '1');
INSERT INTO `water_device_info` VALUES (15583, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:26:54', '1');
INSERT INTO `water_device_info` VALUES (15584, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:55', '1');
INSERT INTO `water_device_info` VALUES (15585, '1', '25.91', '25.94', '0', '0', '2023-09-05 22:26:55', '1');
INSERT INTO `water_device_info` VALUES (15586, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:26:56', '1');
INSERT INTO `water_device_info` VALUES (15587, '1', '25.94', '25.91', '0', '0', '2023-09-05 22:26:56', '1');
INSERT INTO `water_device_info` VALUES (15588, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:26:57', '1');
INSERT INTO `water_device_info` VALUES (15589, '1', '25.91', '25.93', '0', '0', '2023-09-05 22:26:57', '1');
INSERT INTO `water_device_info` VALUES (15590, '2', '25.31', '25.42', '3', '2', '2023-09-05 22:26:58', '1');
INSERT INTO `water_device_info` VALUES (15591, '1', '25.91', '25.94', '0', '0', '2023-09-05 22:26:58', '1');
INSERT INTO `water_device_info` VALUES (15592, '2', '25.33', '25.43', '2', '3', '2023-09-05 22:26:59', '1');
INSERT INTO `water_device_info` VALUES (15593, '1', '25.92', '25.93', '0', '0', '2023-09-05 22:26:59', '1');
INSERT INTO `water_device_info` VALUES (15594, '2', '25.33', '25.43', '3', '2', '2023-09-05 22:27:00', '1');
INSERT INTO `water_device_info` VALUES (15595, '1', '25.92', '25.93', '0', '0', '2023-09-05 22:27:00', '1');
INSERT INTO `water_device_info` VALUES (15596, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:01', '1');
INSERT INTO `water_device_info` VALUES (15597, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:27:01', '1');
INSERT INTO `water_device_info` VALUES (15598, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:27:02', '1');
INSERT INTO `water_device_info` VALUES (15599, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:27:02', '1');
INSERT INTO `water_device_info` VALUES (15600, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:27:03', '1');
INSERT INTO `water_device_info` VALUES (15601, '1', '25.92', '25.94', '0', '0', '2023-09-05 22:27:03', '1');
INSERT INTO `water_device_info` VALUES (15602, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:27:04', '1');
INSERT INTO `water_device_info` VALUES (15603, '1', '25.91', '25.94', '0', '0', '2023-09-05 22:27:04', '1');
INSERT INTO `water_device_info` VALUES (15604, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:27:05', '1');
INSERT INTO `water_device_info` VALUES (15605, '1', '25.92', '25.98', '0', '0', '2023-09-05 22:27:05', '1');
INSERT INTO `water_device_info` VALUES (15606, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:27:06', '1');
INSERT INTO `water_device_info` VALUES (15607, '1', '25.95', '25.93', '0', '0', '2023-09-05 22:27:06', '1');
INSERT INTO `water_device_info` VALUES (15608, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:27:07', '1');
INSERT INTO `water_device_info` VALUES (15609, '1', '25.95', '25.94', '0', '0', '2023-09-05 22:27:07', '1');
INSERT INTO `water_device_info` VALUES (15610, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:27:08', '1');
INSERT INTO `water_device_info` VALUES (15611, '1', '25.94', '25.94', '0', '0', '2023-09-05 22:27:08', '1');
INSERT INTO `water_device_info` VALUES (15612, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:27:09', '1');
INSERT INTO `water_device_info` VALUES (15613, '1', '25.92', '25.94', '0', '0', '2023-09-05 22:27:09', '1');
INSERT INTO `water_device_info` VALUES (15614, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:27:10', '1');
INSERT INTO `water_device_info` VALUES (15615, '1', '25.97', '25.95', '0', '0', '2023-09-05 22:27:10', '1');
INSERT INTO `water_device_info` VALUES (15616, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:27:11', '1');
INSERT INTO `water_device_info` VALUES (15617, '1', '25.94', '25.95', '0', '0', '2023-09-05 22:27:11', '1');
INSERT INTO `water_device_info` VALUES (15618, '2', '25.3', '25.4', '3', '2', '2023-09-05 22:27:12', '1');
INSERT INTO `water_device_info` VALUES (15619, '1', '25.98', '25.97', '0', '0', '2023-09-05 22:27:12', '1');
INSERT INTO `water_device_info` VALUES (15620, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:27:13', '1');
INSERT INTO `water_device_info` VALUES (15621, '1', '25.94', '25.94', '0', '0', '2023-09-05 22:27:13', '1');
INSERT INTO `water_device_info` VALUES (15622, '2', '25.33', '25.4', '2', '3', '2023-09-05 22:27:14', '1');
INSERT INTO `water_device_info` VALUES (15623, '1', '25.97', '25.94', '0', '0', '2023-09-05 22:27:14', '1');
INSERT INTO `water_device_info` VALUES (15624, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:27:15', '1');
INSERT INTO `water_device_info` VALUES (15625, '1', '25.95', '25.94', '0', '0', '2023-09-05 22:27:15', '1');
INSERT INTO `water_device_info` VALUES (15626, '2', '25.3', '25.4', '3', '3', '2023-09-05 22:27:16', '1');
INSERT INTO `water_device_info` VALUES (15627, '1', '25.95', '25.94', '0', '0', '2023-09-05 22:27:16', '1');
INSERT INTO `water_device_info` VALUES (15628, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:27:17', '1');
INSERT INTO `water_device_info` VALUES (15629, '1', '25.91', '25.94', '0', '0', '2023-09-05 22:27:17', '1');
INSERT INTO `water_device_info` VALUES (15630, '2', '25.3', '25.42', '2', '3', '2023-09-05 22:27:18', '1');
INSERT INTO `water_device_info` VALUES (15631, '1', '25.94', '25.93', '0', '0', '2023-09-05 22:27:18', '1');
INSERT INTO `water_device_info` VALUES (15632, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:19', '1');
INSERT INTO `water_device_info` VALUES (15633, '1', '25.95', '25.95', '0', '0', '2023-09-05 22:27:19', '1');
INSERT INTO `water_device_info` VALUES (15634, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:20', '1');
INSERT INTO `water_device_info` VALUES (15635, '1', '25.92', '25.94', '0', '0', '2023-09-05 22:27:20', '1');
INSERT INTO `water_device_info` VALUES (15636, '2', '25.28', '25.42', '2', '3', '2023-09-05 22:27:21', '1');
INSERT INTO `water_device_info` VALUES (15637, '1', '25.91', '25.93', '0', '0', '2023-09-05 22:27:21', '1');
INSERT INTO `water_device_info` VALUES (15638, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:27:22', '1');
INSERT INTO `water_device_info` VALUES (15639, '1', '25.91', '25.91', '0', '0', '2023-09-05 22:27:22', '1');
INSERT INTO `water_device_info` VALUES (15640, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:23', '1');
INSERT INTO `water_device_info` VALUES (15641, '1', '25.91', '25.9', '0', '0', '2023-09-05 22:27:23', '1');
INSERT INTO `water_device_info` VALUES (15642, '2', '25.28', '25.4', '2', '2', '2023-09-05 22:27:24', '1');
INSERT INTO `water_device_info` VALUES (15643, '1', '25.91', '25.9', '0', '0', '2023-09-05 22:27:24', '1');
INSERT INTO `water_device_info` VALUES (15644, '2', '25.3', '25.39', '2', '3', '2023-09-05 22:27:25', '1');
INSERT INTO `water_device_info` VALUES (15645, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:27:25', '1');
INSERT INTO `water_device_info` VALUES (15646, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:27:26', '1');
INSERT INTO `water_device_info` VALUES (15647, '1', '25.91', '25.88', '0', '0', '2023-09-05 22:27:26', '1');
INSERT INTO `water_device_info` VALUES (15648, '2', '25.31', '25.4', '3', '3', '2023-09-05 22:27:27', '1');
INSERT INTO `water_device_info` VALUES (15649, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:27:27', '1');
INSERT INTO `water_device_info` VALUES (15650, '2', '25.3', '25.42', '3', '2', '2023-09-05 22:27:28', '1');
INSERT INTO `water_device_info` VALUES (15651, '1', '25.91', '25.87', '0', '0', '2023-09-05 22:27:28', '1');
INSERT INTO `water_device_info` VALUES (15652, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:27:29', '1');
INSERT INTO `water_device_info` VALUES (15653, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:27:29', '1');
INSERT INTO `water_device_info` VALUES (15654, '2', '25.31', '25.4', '3', '3', '2023-09-05 22:27:30', '1');
INSERT INTO `water_device_info` VALUES (15655, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:27:30', '1');
INSERT INTO `water_device_info` VALUES (15656, '2', '25.31', '25.42', '2', '3', '2023-09-05 22:27:31', '1');
INSERT INTO `water_device_info` VALUES (15657, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:31', '1');
INSERT INTO `water_device_info` VALUES (15658, '2', '25.31', '25.42', '2', '3', '2023-09-05 22:27:32', '1');
INSERT INTO `water_device_info` VALUES (15659, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:32', '1');
INSERT INTO `water_device_info` VALUES (15660, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:27:33', '1');
INSERT INTO `water_device_info` VALUES (15661, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:33', '1');
INSERT INTO `water_device_info` VALUES (15662, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:27:34', '1');
INSERT INTO `water_device_info` VALUES (15663, '1', '25.85', '25.85', '0', '0', '2023-09-05 22:27:34', '1');
INSERT INTO `water_device_info` VALUES (15664, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:27:35', '1');
INSERT INTO `water_device_info` VALUES (15665, '1', '25.85', '25.84', '0', '0', '2023-09-05 22:27:35', '1');
INSERT INTO `water_device_info` VALUES (15666, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:36', '1');
INSERT INTO `water_device_info` VALUES (15667, '1', '25.88', '25.84', '0', '0', '2023-09-05 22:27:36', '1');
INSERT INTO `water_device_info` VALUES (15668, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:27:37', '1');
INSERT INTO `water_device_info` VALUES (15669, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:27:37', '1');
INSERT INTO `water_device_info` VALUES (15670, '2', '25.34', '25.4', '2', '3', '2023-09-05 22:27:38', '1');
INSERT INTO `water_device_info` VALUES (15671, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:27:38', '1');
INSERT INTO `water_device_info` VALUES (15672, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:27:39', '1');
INSERT INTO `water_device_info` VALUES (15673, '1', '25.87', '25.84', '0', '0', '2023-09-05 22:27:39', '1');
INSERT INTO `water_device_info` VALUES (15674, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:27:40', '1');
INSERT INTO `water_device_info` VALUES (15675, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:40', '1');
INSERT INTO `water_device_info` VALUES (15676, '2', '25.33', '25.43', '2', '2', '2023-09-05 22:27:41', '1');
INSERT INTO `water_device_info` VALUES (15677, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:41', '1');
INSERT INTO `water_device_info` VALUES (15678, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:27:42', '1');
INSERT INTO `water_device_info` VALUES (15679, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:27:42', '1');
INSERT INTO `water_device_info` VALUES (15680, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:27:43', '1');
INSERT INTO `water_device_info` VALUES (15681, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:27:43', '1');
INSERT INTO `water_device_info` VALUES (15682, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:27:44', '1');
INSERT INTO `water_device_info` VALUES (15683, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:27:44', '1');
INSERT INTO `water_device_info` VALUES (15684, '2', '25.31', '25.4', '3', '3', '2023-09-05 22:27:45', '1');
INSERT INTO `water_device_info` VALUES (15685, '1', '25.89', '25.85', '0', '0', '2023-09-05 22:27:45', '1');
INSERT INTO `water_device_info` VALUES (15686, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:27:46', '1');
INSERT INTO `water_device_info` VALUES (15687, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:27:46', '1');
INSERT INTO `water_device_info` VALUES (15688, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:27:47', '1');
INSERT INTO `water_device_info` VALUES (15689, '1', '25.85', '25.87', '0', '0', '2023-09-05 22:27:47', '1');
INSERT INTO `water_device_info` VALUES (15690, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:27:48', '1');
INSERT INTO `water_device_info` VALUES (15691, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:27:48', '1');
INSERT INTO `water_device_info` VALUES (15692, '2', '25.31', '25.39', '2', '2', '2023-09-05 22:27:49', '1');
INSERT INTO `water_device_info` VALUES (15693, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:27:49', '1');
INSERT INTO `water_device_info` VALUES (15694, '2', '25.3', '25.42', '3', '2', '2023-09-05 22:27:50', '1');
INSERT INTO `water_device_info` VALUES (15695, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:27:50', '1');
INSERT INTO `water_device_info` VALUES (15696, '2', '25.31', '25.43', '3', '3', '2023-09-05 22:27:51', '1');
INSERT INTO `water_device_info` VALUES (15697, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:27:51', '1');
INSERT INTO `water_device_info` VALUES (15698, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:27:52', '1');
INSERT INTO `water_device_info` VALUES (15699, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:27:52', '1');
INSERT INTO `water_device_info` VALUES (15700, '2', '25.33', '25.42', '2', '3', '2023-09-05 22:27:53', '1');
INSERT INTO `water_device_info` VALUES (15701, '1', '25.85', '25.85', '0', '0', '2023-09-05 22:27:53', '1');
INSERT INTO `water_device_info` VALUES (15702, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:27:54', '1');
INSERT INTO `water_device_info` VALUES (15703, '1', '25.87', '25.84', '0', '0', '2023-09-05 22:27:54', '1');
INSERT INTO `water_device_info` VALUES (15704, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:27:55', '1');
INSERT INTO `water_device_info` VALUES (15705, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:27:55', '1');
INSERT INTO `water_device_info` VALUES (15706, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:27:56', '1');
INSERT INTO `water_device_info` VALUES (15707, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:27:56', '1');
INSERT INTO `water_device_info` VALUES (15708, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:27:57', '1');
INSERT INTO `water_device_info` VALUES (15709, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:27:57', '1');
INSERT INTO `water_device_info` VALUES (15710, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:27:58', '1');
INSERT INTO `water_device_info` VALUES (15711, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:27:58', '1');
INSERT INTO `water_device_info` VALUES (15712, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:27:59', '1');
INSERT INTO `water_device_info` VALUES (15713, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:27:59', '1');
INSERT INTO `water_device_info` VALUES (15714, '2', '25.3', '25.39', '3', '3', '2023-09-05 22:28:00', '1');
INSERT INTO `water_device_info` VALUES (15715, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:28:00', '1');
INSERT INTO `water_device_info` VALUES (15716, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:01', '1');
INSERT INTO `water_device_info` VALUES (15717, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:28:01', '1');
INSERT INTO `water_device_info` VALUES (15718, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:02', '1');
INSERT INTO `water_device_info` VALUES (15719, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:02', '1');
INSERT INTO `water_device_info` VALUES (15720, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:03', '1');
INSERT INTO `water_device_info` VALUES (15721, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:28:03', '1');
INSERT INTO `water_device_info` VALUES (15722, '2', '25.3', '25.43', '2', '3', '2023-09-05 22:28:04', '1');
INSERT INTO `water_device_info` VALUES (15723, '1', '25.91', '25.87', '0', '0', '2023-09-05 22:28:04', '1');
INSERT INTO `water_device_info` VALUES (15724, '2', '25.31', '25.39', '2', '2', '2023-09-05 22:28:05', '1');
INSERT INTO `water_device_info` VALUES (15725, '1', '25.91', '25.87', '0', '0', '2023-09-05 22:28:05', '1');
INSERT INTO `water_device_info` VALUES (15726, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:06', '1');
INSERT INTO `water_device_info` VALUES (15727, '1', '25.88', '25.9', '0', '0', '2023-09-05 22:28:06', '1');
INSERT INTO `water_device_info` VALUES (15728, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:07', '1');
INSERT INTO `water_device_info` VALUES (15729, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:28:07', '1');
INSERT INTO `water_device_info` VALUES (15730, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:28:08', '1');
INSERT INTO `water_device_info` VALUES (15731, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:28:08', '1');
INSERT INTO `water_device_info` VALUES (15732, '2', '25.3', '25.4', '3', '3', '2023-09-05 22:28:09', '1');
INSERT INTO `water_device_info` VALUES (15733, '1', '25.89', '25.87', '0', '0', '2023-09-05 22:28:09', '1');
INSERT INTO `water_device_info` VALUES (15734, '2', '25.3', '25.43', '3', '2', '2023-09-05 22:28:10', '1');
INSERT INTO `water_device_info` VALUES (15735, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:10', '1');
INSERT INTO `water_device_info` VALUES (15736, '2', '25.28', '25.43', '2', '2', '2023-09-05 22:28:11', '1');
INSERT INTO `water_device_info` VALUES (15737, '1', '25.89', '25.91', '0', '0', '2023-09-05 22:28:11', '1');
INSERT INTO `water_device_info` VALUES (15738, '2', '25.3', '25.43', '2', '3', '2023-09-05 22:28:12', '1');
INSERT INTO `water_device_info` VALUES (15739, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:28:12', '1');
INSERT INTO `water_device_info` VALUES (15740, '2', '25.31', '25.39', '2', '3', '2023-09-05 22:28:13', '1');
INSERT INTO `water_device_info` VALUES (15741, '1', '25.89', '25.9', '0', '0', '2023-09-05 22:28:13', '1');
INSERT INTO `water_device_info` VALUES (15742, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:28:14', '1');
INSERT INTO `water_device_info` VALUES (15743, '1', '25.87', '25.88', '0', '0', '2023-09-05 22:28:14', '1');
INSERT INTO `water_device_info` VALUES (15744, '2', '25.3', '25.39', '2', '2', '2023-09-05 22:28:15', '1');
INSERT INTO `water_device_info` VALUES (15745, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:15', '1');
INSERT INTO `water_device_info` VALUES (15746, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:28:16', '1');
INSERT INTO `water_device_info` VALUES (15747, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:28:16', '1');
INSERT INTO `water_device_info` VALUES (15748, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:17', '1');
INSERT INTO `water_device_info` VALUES (15749, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:17', '1');
INSERT INTO `water_device_info` VALUES (15750, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:28:18', '1');
INSERT INTO `water_device_info` VALUES (15751, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:28:18', '1');
INSERT INTO `water_device_info` VALUES (15752, '2', '25.3', '25.4', '2', '3', '2023-09-05 22:28:19', '1');
INSERT INTO `water_device_info` VALUES (15753, '1', '25.91', '25.88', '0', '0', '2023-09-05 22:28:19', '1');
INSERT INTO `water_device_info` VALUES (15754, '2', '25.31', '25.42', '2', '3', '2023-09-05 22:28:20', '1');
INSERT INTO `water_device_info` VALUES (15755, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:28:20', '1');
INSERT INTO `water_device_info` VALUES (15756, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:21', '1');
INSERT INTO `water_device_info` VALUES (15757, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:28:21', '1');
INSERT INTO `water_device_info` VALUES (15758, '2', '25.28', '25.43', '2', '2', '2023-09-05 22:28:22', '1');
INSERT INTO `water_device_info` VALUES (15759, '1', '25.87', '25.87', '0', '0', '2023-09-05 22:28:22', '1');
INSERT INTO `water_device_info` VALUES (15760, '2', '25.28', '25.42', '2', '2', '2023-09-05 22:28:23', '1');
INSERT INTO `water_device_info` VALUES (15761, '1', '25.87', '25.85', '0', '0', '2023-09-05 22:28:23', '1');
INSERT INTO `water_device_info` VALUES (15762, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:28:24', '1');
INSERT INTO `water_device_info` VALUES (15763, '1', '25.87', '25.84', '0', '0', '2023-09-05 22:28:24', '1');
INSERT INTO `water_device_info` VALUES (15764, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:25', '1');
INSERT INTO `water_device_info` VALUES (15765, '1', '25.85', '25.83', '0', '0', '2023-09-05 22:28:25', '1');
INSERT INTO `water_device_info` VALUES (15766, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:26', '1');
INSERT INTO `water_device_info` VALUES (15767, '1', '25.87', '25.84', '0', '0', '2023-09-05 22:28:26', '1');
INSERT INTO `water_device_info` VALUES (15768, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:27', '1');
INSERT INTO `water_device_info` VALUES (15769, '1', '25.84', '25.83', '0', '0', '2023-09-05 22:28:27', '1');
INSERT INTO `water_device_info` VALUES (15770, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:28:28', '1');
INSERT INTO `water_device_info` VALUES (15771, '1', '25.84', '25.85', '0', '0', '2023-09-05 22:28:28', '1');
INSERT INTO `water_device_info` VALUES (15772, '2', '25.31', '25.4', '2', '2', '2023-09-05 22:28:29', '1');
INSERT INTO `water_device_info` VALUES (15773, '1', '25.84', '25.85', '0', '0', '2023-09-05 22:28:29', '1');
INSERT INTO `water_device_info` VALUES (15774, '2', '25.28', '25.4', '3', '2', '2023-09-05 22:28:30', '1');
INSERT INTO `water_device_info` VALUES (15775, '1', '25.87', '25.83', '0', '0', '2023-09-05 22:28:30', '1');
INSERT INTO `water_device_info` VALUES (15776, '2', '25.31', '25.43', '3', '2', '2023-09-05 22:28:31', '1');
INSERT INTO `water_device_info` VALUES (15777, '1', '25.85', '25.85', '0', '0', '2023-09-05 22:28:31', '1');
INSERT INTO `water_device_info` VALUES (15778, '2', '25.3', '25.4', '2', '2', '2023-09-05 22:28:32', '1');
INSERT INTO `water_device_info` VALUES (15779, '1', '25.85', '25.85', '0', '0', '2023-09-05 22:28:32', '1');
INSERT INTO `water_device_info` VALUES (15780, '2', '25.34', '25.45', '2', '2', '2023-09-05 22:28:33', '1');
INSERT INTO `water_device_info` VALUES (15781, '1', '25.89', '25.85', '0', '0', '2023-09-05 22:28:33', '1');
INSERT INTO `water_device_info` VALUES (15782, '2', '25.31', '25.43', '2', '3', '2023-09-05 22:28:34', '1');
INSERT INTO `water_device_info` VALUES (15783, '1', '25.87', '25.84', '0', '0', '2023-09-05 22:28:34', '1');
INSERT INTO `water_device_info` VALUES (15784, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:35', '1');
INSERT INTO `water_device_info` VALUES (15785, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:28:35', '1');
INSERT INTO `water_device_info` VALUES (15786, '2', '25.31', '25.42', '3', '2', '2023-09-05 22:28:36', '1');
INSERT INTO `water_device_info` VALUES (15787, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:28:36', '1');
INSERT INTO `water_device_info` VALUES (15788, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:28:37', '1');
INSERT INTO `water_device_info` VALUES (15789, '1', '25.88', '25.85', '0', '0', '2023-09-05 22:28:37', '1');
INSERT INTO `water_device_info` VALUES (15790, '2', '25.31', '25.43', '4', '2', '2023-09-05 22:28:38', '1');
INSERT INTO `water_device_info` VALUES (15791, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:38', '1');
INSERT INTO `water_device_info` VALUES (15792, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:39', '1');
INSERT INTO `water_device_info` VALUES (15793, '1', '25.89', '25.88', '0', '0', '2023-09-05 22:28:39', '1');
INSERT INTO `water_device_info` VALUES (15794, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:28:40', '1');
INSERT INTO `water_device_info` VALUES (15795, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:28:40', '1');
INSERT INTO `water_device_info` VALUES (15796, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:28:41', '1');
INSERT INTO `water_device_info` VALUES (15797, '1', '25.87', '25.88', '0', '0', '2023-09-05 22:28:41', '1');
INSERT INTO `water_device_info` VALUES (15798, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:28:42', '1');
INSERT INTO `water_device_info` VALUES (15799, '1', '25.88', '25.88', '0', '0', '2023-09-05 22:28:42', '1');
INSERT INTO `water_device_info` VALUES (15800, '2', '25.3', '25.43', '3', '2', '2023-09-05 22:28:43', '1');
INSERT INTO `water_device_info` VALUES (15801, '1', '25.88', '25.87', '0', '0', '2023-09-05 22:28:43', '1');
INSERT INTO `water_device_info` VALUES (15802, '2', '25.31', '25.4', '1', '2', '2023-09-05 22:28:44', '1');
INSERT INTO `water_device_info` VALUES (15803, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:28:45', '1');
INSERT INTO `water_device_info` VALUES (15804, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:28:46', '1');
INSERT INTO `water_device_info` VALUES (15805, '2', '25.33', '25.42', '3', '1', '2023-09-05 22:28:47', '1');
INSERT INTO `water_device_info` VALUES (15806, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:48', '1');
INSERT INTO `water_device_info` VALUES (15807, '2', '25.33', '25.43', '3', '4', '2023-09-05 22:28:49', '1');
INSERT INTO `water_device_info` VALUES (15808, '2', '25.3', '25.43', '2', '2', '2023-09-05 22:28:50', '1');
INSERT INTO `water_device_info` VALUES (15809, '2', '25.3', '25.42', '2', '2', '2023-09-05 22:28:51', '1');
INSERT INTO `water_device_info` VALUES (15810, '2', '25.34', '25.42', '2', '3', '2023-09-05 22:28:52', '1');
INSERT INTO `water_device_info` VALUES (15811, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:53', '1');
INSERT INTO `water_device_info` VALUES (15812, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:28:54', '1');
INSERT INTO `water_device_info` VALUES (15813, '2', '25.33', '25.4', '2', '2', '2023-09-05 22:28:55', '1');
INSERT INTO `water_device_info` VALUES (15814, '2', '25.34', '25.43', '2', '2', '2023-09-05 22:28:56', '1');
INSERT INTO `water_device_info` VALUES (15815, '2', '25.31', '25.42', '2', '2', '2023-09-05 22:28:57', '1');
INSERT INTO `water_device_info` VALUES (15816, '2', '25.31', '25.43', '2', '2', '2023-09-05 22:28:58', '1');
INSERT INTO `water_device_info` VALUES (15817, '2', '25.34', '25.42', '2', '2', '2023-09-05 22:28:59', '1');
INSERT INTO `water_device_info` VALUES (15818, '2', '25.34', '25.42', '2', '2', '2023-09-05 22:29:00', '1');
INSERT INTO `water_device_info` VALUES (15819, '2', '25.34', '25.43', '3', '3', '2023-09-05 22:29:01', '1');
INSERT INTO `water_device_info` VALUES (15820, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:29:02', '1');
INSERT INTO `water_device_info` VALUES (15821, '2', '25.34', '25.43', '2', '2', '2023-09-05 22:29:03', '1');
INSERT INTO `water_device_info` VALUES (15822, '2', '25.33', '25.42', '3', '3', '2023-09-05 22:29:04', '1');
INSERT INTO `water_device_info` VALUES (15823, '2', '25.33', '25.45', '2', '2', '2023-09-05 22:29:05', '1');
INSERT INTO `water_device_info` VALUES (15824, '2', '25.34', '25.43', '2', '2', '2023-09-05 22:29:06', '1');
INSERT INTO `water_device_info` VALUES (15825, '2', '25.34', '25.42', '2', '2', '2023-09-05 22:29:07', '1');
INSERT INTO `water_device_info` VALUES (15826, '2', '25.34', '25.42', '2', '3', '2023-09-05 22:29:08', '1');
INSERT INTO `water_device_info` VALUES (15827, '2', '25.33', '25.42', '2', '2', '2023-09-05 22:29:09', '1');
INSERT INTO `water_device_info` VALUES (15828, '2', '25.34', '25.45', '2', '3', '2023-09-05 22:29:10', '1');
INSERT INTO `water_device_info` VALUES (15829, '2', '25.33', '25.45', '3', '3', '2023-09-05 22:29:11', '1');
INSERT INTO `water_device_info` VALUES (15830, '2', '25.33', '25.45', '3', '2', '2023-09-05 22:29:12', '1');
INSERT INTO `water_device_info` VALUES (15831, '2', '25.33', '25.43', '2', '3', '2023-09-05 22:29:13', '1');
INSERT INTO `water_device_info` VALUES (15832, '2', '25.34', '25.45', '2', '3', '2023-09-05 22:29:14', '1');
INSERT INTO `water_device_info` VALUES (15833, '2', '25.34', '25.46', '2', '2', '2023-09-05 22:29:15', '1');
INSERT INTO `water_device_info` VALUES (15834, '2', '25.34', '25.46', '2', '2', '2023-09-05 22:29:16', '1');
INSERT INTO `water_device_info` VALUES (15835, '2', '25.33', '25.45', '2', '2', '2023-09-05 22:29:17', '1');
INSERT INTO `water_device_info` VALUES (15836, '2', '25.35', '25.45', '3', '3', '2023-09-05 22:29:18', '1');
INSERT INTO `water_device_info` VALUES (15837, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:29:19', '1');
INSERT INTO `water_device_info` VALUES (15838, '2', '25.34', '25.48', '2', '2', '2023-09-05 22:29:20', '1');
INSERT INTO `water_device_info` VALUES (15839, '2', '25.34', '25.45', '3', '2', '2023-09-05 22:29:21', '1');
INSERT INTO `water_device_info` VALUES (15840, '2', '25.37', '25.45', '3', '3', '2023-09-05 22:29:22', '1');
INSERT INTO `water_device_info` VALUES (15841, '2', '25.37', '25.48', '2', '3', '2023-09-05 22:29:23', '1');
INSERT INTO `water_device_info` VALUES (15842, '2', '25.37', '25.48', '2', '2', '2023-09-05 22:29:24', '1');
INSERT INTO `water_device_info` VALUES (15843, '2', '25.35', '25.45', '2', '2', '2023-09-05 22:29:25', '1');
INSERT INTO `water_device_info` VALUES (15844, '2', '25.34', '25.46', '3', '2', '2023-09-05 22:29:26', '1');
INSERT INTO `water_device_info` VALUES (15845, '2', '25.37', '25.48', '2', '2', '2023-09-05 22:29:27', '1');

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : restaurant

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2022-11-28 22:42:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `name` varchar(255) DEFAULT NULL COMMENT '字典键名',
  `type` tinyint(4) DEFAULT NULL COMMENT '字典类型',
  `value` text COMMENT '字典键值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKag4shuprf2tjot9i1mhh37kk6` (`create_by`),
  KEY `FKoyng5jlifhsme0gc1lwiub0lr` (`update_by`),
  CONSTRAINT `FKag4shuprf2tjot9i1mhh37kk6` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKoyng5jlifhsme0gc1lwiub0lr` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '数据状态', 'DATA_STATUS', '2', '1:正常,2:冻结,3:删除', '', '2018-10-05 16:03:11', '2018-10-05 16:11:41', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('2', '字典类型', 'DICT_TYPE', '2', '2:键值对', '', '2018-10-05 20:08:55', '2019-01-17 23:39:23', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('3', '用户性别', 'USER_SEX', '2', '1:男,2:女', '', '2018-10-05 20:12:32', '2018-10-05 20:12:32', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('4', '菜单类型', 'MENU_TYPE', '2', '1:目录,2:菜单,3:按钮', '', '2018-10-05 20:24:57', '2019-11-06 20:08:46', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('5', '搜索栏状态', 'SEARCH_STATUS', '2', '1:正常,2:冻结', '', '2018-10-05 20:25:45', '2019-02-26 00:34:34', '1', '1', '1');
INSERT INTO `sys_dict` VALUES ('6', '日志类型', 'LOG_TYPE', '2', '1:业务,2:登录,3:系统', '', '2018-10-05 20:28:47', '2019-02-26 00:31:43', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型（1:一级菜单,2:子级菜单,3:不是菜单）',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKoxg2hi96yr9pf2m0stjomr3we` (`create_by`),
  KEY `FKsiko0qcr8ddamvrxf1tk4opgc` (`update_by`),
  CONSTRAINT `FKoxg2hi96yr9pf2m0stjomr3we` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKsiko0qcr8ddamvrxf1tk4opgc` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '菜单管理', '2', '[0],[2]', '/system/menu/index', 'system:menu:index', '', '2', '3', '', '2018-09-29 00:02:10', '2019-02-24 16:10:40', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('2', '系统管理', '0', '[0]', '#', '#', 'fa fa-cog', '1', '5', '', '2018-09-29 00:05:50', '2022-11-26 15:59:32', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '添加', '1', '[0],[2],[1]', '/system/menu/add', 'system:menu:add', '', '3', '1', '', '2018-09-29 00:06:57', '2019-02-24 16:12:59', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('4', '角色管理', '2', '[0],[2]', '/system/role/index', 'system:role:index', '', '2', '2', '', '2018-09-29 00:08:14', '2019-02-24 16:10:34', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('5', '添加', '4', '[0],[2],[4]', '/system/role/add', 'system:role:add', '', '3', '1', '', '2018-09-29 00:09:04', '2019-02-24 16:12:04', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '主页', '0', '[0]', '/manage/order/statistics', 'manage:order:statistics', 'layui-icon layui-icon-home', '1', '1', '', '2018-09-29 00:09:56', '2022-11-28 22:34:24', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('7', '用户管理', '2', '[0],[2]', '/system/user/index', 'system:user:index', '', '2', '1', '', '2018-09-29 00:43:50', '2019-04-05 17:43:25', '1', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '编辑', '1', '[0],[2],[1]', '/system/menu/edit', 'system:menu:edit', '', '3', '2', '', '2018-09-29 00:57:33', '2019-02-24 16:13:05', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '详细', '1', '[0],[2],[1]', '/system/menu/detail', 'system:menu:detail', '', '3', '3', '', '2018-09-29 01:03:00', '2019-02-24 16:13:12', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('10', '修改状态', '1', '[0],[2],[1]', '/system/menu/status', 'system:menu:status', '', '3', '4', '', '2018-09-29 01:03:43', '2019-02-24 16:13:21', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '编辑', '4', '[0],[2],[4]', '/system/role/edit', 'system:role:edit', '', '3', '2', '', '2018-09-29 01:06:13', '2019-02-24 16:12:10', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '授权', '4', '[0],[2],[4]', '/system/role/auth', 'system:role:auth', '', '3', '3', '', '2018-09-29 01:06:57', '2019-02-24 16:12:17', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('13', '详细', '4', '[0],[2],[4]', '/system/role/detail', 'system:role:detail', '', '3', '4', '', '2018-09-29 01:08:00', '2019-02-24 16:12:24', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '修改状态', '4', '[0],[2],[4]', '/system/role/status', 'system:role:status', '', '3', '5', '', '2018-09-29 01:08:22', '2019-02-24 16:12:43', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '编辑', '7', '[0],[2],[7]', '/system/user/edit', 'system:user:edit', '', '3', '2', '', '2018-09-29 21:17:17', '2019-02-24 16:11:03', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('16', '添加', '7', '[0],[2],[7]', '/system/user/add', 'system:user:add', '', '3', '1', '', '2018-09-29 21:17:58', '2019-02-24 16:10:28', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('17', '修改密码', '7', '[0],[2],[7]', '/system/user/pwd', 'system:user:pwd', '', '3', '3', '', '2018-09-29 21:19:40', '2019-02-24 16:11:11', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('18', '权限分配', '7', '[0],[2],[7]', '/system/user/role', 'system:user:role', '', '3', '4', '', '2018-09-29 21:20:35', '2019-02-24 16:11:18', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('19', '详细', '7', '[0],[2],[7]', '/system/user/detail', 'system:user:detail', '', '3', '5', '', '2018-09-29 21:21:00', '2019-02-24 16:11:26', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('20', '修改状态', '7', '[0],[2],[7]', '/system/user/status', 'system:user:status', '', '3', '6', '', '2018-09-29 21:21:18', '2019-02-24 16:11:35', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('192', '菜品分类', '0', '[0]', '/manage/category/index', 'manage:category:index', '', '1', '2', '', '2022-03-04 01:31:51', '2022-11-26 15:59:32', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('193', '菜品管理', '0', '[0]', '/manage/food/index', 'manage:food:index', '', '1', '3', '', '2022-03-04 01:43:43', '2022-11-26 15:59:32', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('194', '订单管理', '0', '[0]', '/manage/order/index', 'manage:order:index', '#', '1', '4', '', '2022-03-04 10:18:47', '2022-11-26 15:59:32', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('197', '新增', '193', '[0],[193]', '/manage/food/add', 'manage:food:add', '#', '3', '1', '', '2022-11-28 22:35:59', '2022-11-28 22:35:59', null, null, '1');
INSERT INTO `sys_menu` VALUES ('198', '修改', '193', '[0],[193]', '/manage/food/edit', 'manage:food:edit', '#', '3', '2', '', '2022-11-28 22:36:40', '2022-11-28 22:36:40', null, null, '1');
INSERT INTO `sys_menu` VALUES ('199', '删除', '193', '[0],[193]', '/manage/food/status', 'manage:food:status', '#', '3', '3', '', '2022-11-28 22:37:11', '2022-11-28 22:37:11', null, null, '1');
INSERT INTO `sys_menu` VALUES ('200', '新增', '192', '[0],[192]', '/manage/category/add', 'manage:category:add', '#', '3', '1', '', '2022-11-28 22:37:49', '2022-11-28 22:37:49', null, null, '1');
INSERT INTO `sys_menu` VALUES ('201', '修改', '192', '[0],[192]', '/manage/category/edit', 'manage:category:edit', '#', '3', '2', '', '2022-11-28 22:38:25', '2022-11-28 22:38:25', null, null, '1');
INSERT INTO `sys_menu` VALUES ('202', '删除', '192', '[0],[192]', '/manage/category/status', 'manage:category:status', '#', '3', '3', '', '2022-11-28 22:38:47', '2022-11-28 22:38:47', null, null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '角色名称（中文名）',
  `name` varchar(255) DEFAULT NULL COMMENT '标识名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKdkwvv0rm6j3d5l6hwsy2dplol` (`create_by`),
  KEY `FKrouqqi3f2bgc5o83wdstlh6q4` (`update_by`),
  CONSTRAINT `FKdkwvv0rm6j3d5l6hwsy2dplol` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKrouqqi3f2bgc5o83wdstlh6q4` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '', '2018-09-29 00:12:40', '2019-01-18 21:09:51', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '商家', 'merchant', '', '2018-09-30 16:04:32', '2022-11-27 17:14:43', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('3', '用户组', 'group1', '', '2018-09-30 16:24:20', '2019-04-28 00:11:09', '1', '1', '3');
INSERT INTO `sys_role` VALUES ('4', '客户', 'customer', '', '2022-11-27 16:53:11', '2022-11-27 16:53:11', null, null, '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKf3mud4qoc7ayew8nml4plkevo` (`menu_id`),
  CONSTRAINT `FKf3mud4qoc7ayew8nml4plkevo` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FKkeitxsgxwayackgqllio4ohn5` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '192');
INSERT INTO `sys_role_menu` VALUES ('2', '193');
INSERT INTO `sys_role_menu` VALUES ('2', '194');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `picture` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别（1:男,2:女）',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  `role_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb3pkx0wbo6o8i8lj0gxr37v1n` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154', '7rl2t9', '1', null, '1', '10086@163.com', '10086', '', '2018-08-09 23:00:03', '2022-11-27 17:00:24', '1', null, '32');
INSERT INTO `sys_user` VALUES ('2', 'linln', '小懒虫', '28bfc4f19b0d4b8a40018faf9aec4ad9db5491082dda439040b1c35ff8c533a7', 'gzNkXt', '2', null, '2', '1008612@qq.com', '1008612', '', '2018-09-30 16:25:22', '2019-11-06 20:09:17', '3', null, null);
INSERT INTO `sys_user` VALUES ('3', 'test01', '张三', '86beb3f54f47a43be4da4f9ad9a538328b723ffce129e9225b1b20d48ac681cf', 'uTX9AT', null, null, '男', '1564156454@163.com', '13522112254', '', '2022-02-19 01:37:54', '2022-11-27 17:16:12', '1', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `FKb40xxfch70f5qnyfw8yme1n1s` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '001', '2022-03-04 01:32:43', '炒饭', '1');
INSERT INTO `tb_category` VALUES ('2', '003', '2022-03-04 01:33:03', '炒菜', '1');

-- ----------------------------
-- Table structure for tb_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_food`;
CREATE TABLE `tb_food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `food_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_food
-- ----------------------------
INSERT INTO `tb_food` VALUES ('1', '炒菜', '2022-03-04 02:06:19', '香香辣辣大闸蟹', 'http://localhost:9090/order/food/1646377670993_1.jpg', '94', '香辣大闸蟹', '100', '1', '3', null);
INSERT INTO `tb_food` VALUES ('2', '早餐', '2022-03-04 15:34:58', '肉包', 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2752141757,3804422851&fm=26&gp=0.jpg', '100', '包子', '2', '1', '3', null);
INSERT INTO `tb_food` VALUES ('3', '早餐', '2022-03-04 15:37:25', '粥类早点', 'https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1895136375,217917637&fm=26&gp=0.jpg', '99', '黑米粥', '5', '1', '3', null);
INSERT INTO `tb_food` VALUES ('4', '', '2022-03-04 15:38:27', '招牌菜', 'http://localhost:9090/order/food/1669435513754_微信图片_20201015141850.png', '95', '宫保鸡丁', '35', '1', '1', null);
INSERT INTO `tb_food` VALUES ('5', '午餐', '2022-03-04 15:39:54', '招牌菜', 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=241541046,4188508908&fm=26&gp=0.jpg', '89', '鱼香肉丝', '20', '1', '3', null);
INSERT INTO `tb_food` VALUES ('6', '炒饭', '2022-03-04 15:40:27', '晚餐', 'https://dss0.baidu.com/73F1bjeh1BF3odCf/it/u=3078223824,3085812261&amp;fm=85', '99', '西红柿鸡蛋面', '15', '1', '1', '1');
INSERT INTO `tb_food` VALUES ('7', '炒饭', '2022-11-27 16:59:46', '鸭头', 'http://localhost:9090/order/food/1669539580239_1.jpg', '12', '鸭头', '100', '1', '1', '1');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `food_image` varchar(255) DEFAULT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `order_amount` decimal(19,2) DEFAULT NULL,
  `order_state` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `food_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh4qadnsqmn3u0j0eixrngwnah` (`create_by`),
  CONSTRAINT `FKh4qadnsqmn3u0j0eixrngwnah` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '2022-11-27 16:50:23', '超级管理员', 'https://dss0.baidu.com/73F1bjeh1BF3odCf/it/u=3078223824,3085812261&fm=85', '西红柿鸡蛋面', '15.00', '下单成功', '15.00', '1', null, '6', '1');
INSERT INTO `tb_order` VALUES ('2', '1', '2022-11-27 17:00:24', '超级管理员', 'http://localhost:9090/order/food/1669539580239_1.jpg', '鸭头', '100.00', '下单成功', '100.00', '1', null, '7', '1');

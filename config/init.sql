SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
                          `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                          `created_at` datetime DEFAULT NULL,
                          `updated_at` datetime DEFAULT NULL,
                          `deleted_at` datetime DEFAULT NULL,
                          `id` varchar(36) NOT NULL,
                          `name` varchar(191) NOT NULL,
                          `sequence` bigint(20) NOT NULL,
                          `icon` varchar(191) DEFAULT NULL,
                          `router` varchar(191) DEFAULT NULL,
                          `component` varchar(191) DEFAULT NULL,
                          `parent_id` varchar(36) DEFAULT NULL,
                          `parent_path` varchar(191) DEFAULT NULL,
                          `hidden` bigint(20) NOT NULL,
                          `status` bigint(20) NOT NULL,
                          `remark` varchar(191) DEFAULT NULL,
                          `created_by` varchar(191) NOT NULL,
                          PRIMARY KEY (`record_id`),
                          KEY `idx_t_menu_name` (`name`),
                          KEY `idx_t_menu_sequence` (`sequence`),
                          KEY `idx_t_menu_parent_id` (`parent_id`),
                          KEY `idx_t_menu_deleted_at` (`deleted_at`),
                          KEY `idx_t_menu_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `sequence`, `icon`, `router`, `component`, `parent_id`, `parent_path`, `hidden`, `status`, `remark`, `created_by`) VALUES (1, '2023-12-25 22:13:56', '2023-12-25 22:13:56', NULL, '1739288371659804672', '控制台', 1000, 'cpanel', '', '', '', '', -1, 1, '', '');
INSERT INTO `t_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `sequence`, `icon`, `router`, `component`, `parent_id`, `parent_path`, `hidden`, `status`, `remark`, `created_by`) VALUES (2, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288372456722432', '系统管理', 1100, 'setting', '', '', '', '', -1, 1, '', '');
INSERT INTO `t_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `sequence`, `icon`, `router`, `component`, `parent_id`, `parent_path`, `hidden`, `status`, `remark`, `created_by`) VALUES (3, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288373505298432', '菜单管理', 1101, 'menu', '/system/menu', 'system/menu/index', '1739288372456722432', '1739288372456722432', -1, 1, '', '');
INSERT INTO `t_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `sequence`, `icon`, `router`, `component`, `parent_id`, `parent_path`, `hidden`, `status`, `remark`, `created_by`) VALUES (4, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288378601377792', '角色管理', 1102, 'role', '/system/role', 'system/role/index', '1739288372456722432', '1739288372456722432', -1, 1, '', '');
INSERT INTO `t_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `sequence`, `icon`, `router`, `component`, `parent_id`, `parent_path`, `hidden`, `status`, `remark`, `created_by`) VALUES (5, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288383689068544', '用户管理', 1103, 'user', '/system/user', 'system/user/index', '1739288372456722432', '1739288372456722432', -1, 1, '', '');
COMMIT;

-- ----------------------------
-- Table structure for t_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action`;
CREATE TABLE `t_menu_action` (
                                 `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                 `created_at` datetime DEFAULT NULL,
                                 `updated_at` datetime DEFAULT NULL,
                                 `deleted_at` datetime DEFAULT NULL,
                                 `id` varchar(36) NOT NULL,
                                 `menu_id` varchar(36) NOT NULL,
                                 `code` varchar(191) NOT NULL,
                                 `name` varchar(191) NOT NULL,
                                 PRIMARY KEY (`record_id`),
                                 KEY `idx_t_menu_action_deleted_at` (`deleted_at`),
                                 KEY `idx_t_menu_action_id` (`id`),
                                 KEY `idx_t_menu_action_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_action
-- ----------------------------
BEGIN;
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (1, '2023-12-25 22:13:56', '2023-12-25 22:13:56', NULL, '1739288371936628736', '1739288371659804672', 'visible', '可见');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (2, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288372729352192', '1739288372456722432', 'visible', '可见');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (3, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288373790511104', '1739288373505298432', 'add', '新建');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (4, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288374327382016', '1739288373505298432', 'edit', '编辑');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (5, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288375141076992', '1739288373505298432', 'delete', '删除');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (6, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288375677947904', '1739288373505298432', 'query', '查询');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (7, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288376487448576', '1739288373505298432', 'query-actions', '查询动作');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (8, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288377020125184', '1739288373505298432', 'disable', '禁用');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (9, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288377561190400', '1739288373505298432', 'enable', '启用');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (10, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288378869813248', '1739288378601377792', 'add', '新增');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (11, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288379679313920', '1739288378601377792', 'edit', '编辑');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (12, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288380748861440', '1739288378601377792', 'delete', '删除');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (13, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288381289926656', '1739288378601377792', 'query', '查询');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (14, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288382095233024', '1739288378601377792', 'disable', '禁用');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (15, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288382632103936', '1739288378601377792', 'enable', '启用');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (16, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288383961698304', '1739288383689068544', 'add', '新增');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (17, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288384771198976', '1739288383689068544', 'edit', '编辑');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (18, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288385844940800', '1739288383689068544', 'delete', '删除');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (19, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288386381811712', '1739288383689068544', 'query', '查询');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (20, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288386918682624', '1739288383689068544', 'disable', '禁用');
INSERT INTO `t_menu_action` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `menu_id`, `code`, `name`) VALUES (21, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288387472330752', '1739288383689068544', 'enable', '启用');
COMMIT;

-- ----------------------------
-- Table structure for t_menu_action_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action_resource`;
CREATE TABLE `t_menu_action_resource` (
                                          `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                          `created_at` datetime DEFAULT NULL,
                                          `updated_at` datetime DEFAULT NULL,
                                          `deleted_at` datetime DEFAULT NULL,
                                          `id` varchar(36) NOT NULL,
                                          `action_id` varchar(36) NOT NULL,
                                          `method` varchar(191) NOT NULL,
                                          `path` varchar(191) NOT NULL,
                                          PRIMARY KEY (`record_id`),
                                          KEY `idx_t_menu_action_resource_deleted_at` (`deleted_at`),
                                          KEY `idx_t_menu_action_resource_id` (`id`),
                                          KEY `idx_t_menu_action_resource_action_id` (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_action_resource
-- ----------------------------
BEGIN;
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (1, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288374058946560', '1739288373790511104', 'POST', '/api/v1/menus');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (2, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288374595817472', '1739288374327382016', 'GET', '/api/v1/menus/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (3, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288374872641536', '1739288374327382016', 'PUT', '/api/v1/menus/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (4, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288375409512448', '1739288375141076992', 'DELETE', '/api/v1/menus/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (5, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288375946383360', '1739288375677947904', 'GET', '/api/v1/menus');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (6, '2023-12-25 22:13:57', '2023-12-25 22:13:57', NULL, '1739288376219013120', '1739288375677947904', 'GET', '/api/v1/publics/sys/routes');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (7, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288376751689728', '1739288376487448576', 'GET', '/api/v1/menus/:id/actions');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (8, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288377288560640', '1739288377020125184', 'PATCH', '/api/v1/menus/:id/disable');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (9, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288377825431552', '1739288377561190400', 'PATCH', '/api/v1/menus/:id/enable');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (10, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288379142443008', '1739288378869813248', 'GET', '/api/v1/menus');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (11, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288379410878464', '1739288378869813248', 'POST', '/api/v1/roles');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (12, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288379943555072', '1739288379679313920', 'GET', '/api/v1/menus');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (13, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288380211990528', '1739288379679313920', 'GET', '/api/v1/roles/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (14, '2023-12-25 22:13:58', '2023-12-25 22:13:58', NULL, '1739288380480425984', '1739288379679313920', 'PUT', '/api/v1/roles/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (15, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288381021491200', '1739288380748861440', 'DELETE', '/api/v1/roles/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (16, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288381558362112', '1739288381289926656', 'GET', '/api/v1/roles');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (17, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288381826797568', '1739288381289926656', 'GET', '/api/v1/roles/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (18, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288382363668480', '1739288382095233024', 'PATCH', '/api/v1/roles/:id/disable');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (19, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288382896345088', '1739288382632103936', 'PATCH', '/api/v1/roles/:id/enable');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (20, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288384230133760', '1739288383961698304', 'GET', '/api/v1/roles');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (21, '2023-12-25 22:13:59', '2023-12-25 22:13:59', NULL, '1739288384502763520', '1739288383961698304', 'POST', '/api/v1/users');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (22, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288385039634432', '1739288384771198976', 'GET', '/api/v1/roles');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (23, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288385303875584', '1739288384771198976', 'GET', '/api/v1/users/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (24, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288385576505344', '1739288384771198976', 'PUT', '/api/v1/users/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (25, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288386109181952', '1739288385844940800', 'DELETE', '/api/v1/users/:id');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (26, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288386650247168', '1739288386381811712', 'GET', '/api/v1/users');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (27, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288387187118080', '1739288386918682624', 'PATCH', '/api/v1/users/:id/disable');
INSERT INTO `t_menu_action_resource` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `action_id`, `method`, `path`) VALUES (28, '2023-12-25 22:14:00', '2023-12-25 22:14:00', NULL, '1739288387740766208', '1739288387472330752', 'PATCH', '/api/v1/users/:id/enable');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
                          `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                          `created_at` datetime DEFAULT NULL,
                          `updated_at` datetime DEFAULT NULL,
                          `deleted_at` datetime DEFAULT NULL,
                          `id` varchar(36) NOT NULL,
                          `name` varchar(191) NOT NULL,
                          `remark` varchar(191) NOT NULL,
                          `sequence` bigint(20) NOT NULL,
                          `status` bigint(20) NOT NULL DEFAULT '0',
                          `created_by` varchar(191) NOT NULL,
                          PRIMARY KEY (`record_id`),
                          KEY `idx_t_role_deleted_at` (`deleted_at`),
                          KEY `idx_t_role_id` (`id`),
                          KEY `idx_t_role_sequence` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `name`, `remark`, `sequence`, `status`, `created_by`) VALUES (2, '2023-12-25 22:51:29', '2023-12-25 22:51:29', NULL, '1739297803508649984', '管理员', '管理员', 1000, 1, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
                               `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                               `created_at` datetime DEFAULT NULL,
                               `updated_at` datetime DEFAULT NULL,
                               `deleted_at` datetime DEFAULT NULL,
                               `id` varchar(36) NOT NULL,
                               `role_id` varchar(36) NOT NULL,
                               `menu_id` varchar(36) NOT NULL,
                               `action_id` varchar(36) NOT NULL,
                               PRIMARY KEY (`record_id`),
                               KEY `idx_t_role_menu_deleted_at` (`deleted_at`),
                               KEY `idx_t_role_menu_role_id` (`role_id`),
                               KEY `idx_t_role_menu_menu_id` (`menu_id`),
                               KEY `idx_t_role_menu_action_id` (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (32, '2023-12-25 22:51:25', '2023-12-25 22:51:25', NULL, '1739297803508649985', '1739297803508649984', '1739288371659804672', '1739288371936628736');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (33, '2023-12-25 22:51:25', '2023-12-25 22:51:25', NULL, '1739297804217487360', '1739297803508649984', '1739288372456722432', '1739288372729352192');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (34, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297804917936128', '1739297803508649984', '1739288373505298432', '1739288377561190400');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (35, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297805601607680', '1739297803508649984', '1739288373505298432', '1739288377020125184');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (36, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297806289473536', '1739297803508649984', '1739288373505298432', '1739288376487448576');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (37, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297806968950784', '1739297803508649984', '1739288373505298432', '1739288375677947904');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (38, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297807694565376', '1739297803508649984', '1739288373505298432', '1739288375141076992');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (39, '2023-12-25 22:51:26', '2023-12-25 22:51:26', NULL, '1739297808374042624', '1739297803508649984', '1739288373505298432', '1739288374327382016');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (40, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297809070297088', '1739297803508649984', '1739288373505298432', '1739288373790511104');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (41, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297809749774336', '1739297803508649984', '1739288378601377792', '1739288382632103936');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (42, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297810441834496', '1739297803508649984', '1739288378601377792', '1739288382095233024');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (43, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297811150671872', '1739297803508649984', '1739288378601377792', '1739288381289926656');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (44, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297811859509248', '1739297803508649984', '1739288378601377792', '1739288380748861440');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (45, '2023-12-25 22:51:27', '2023-12-25 22:51:27', NULL, '1739297812555763712', '1739297803508649984', '1739288378601377792', '1739288379679313920');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (46, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297813239435264', '1739297803508649984', '1739288378601377792', '1739288378869813248');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (47, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297813935689728', '1739297803508649984', '1739288383689068544', '1739288387472330752');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (48, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297814619361280', '1739297803508649984', '1739288383689068544', '1739288386918682624');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (49, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297815315615744', '1739297803508649984', '1739288383689068544', '1739288386381811712');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (50, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297815999287296', '1739297803508649984', '1739288383689068544', '1739288385844940800');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (51, '2023-12-25 22:51:28', '2023-12-25 22:51:28', NULL, '1739297816682958848', '1739297803508649984', '1739288383689068544', '1739288384771198976');
INSERT INTO `t_role_menu` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `role_id`, `menu_id`, `action_id`) VALUES (52, '2023-12-25 22:51:29', '2023-12-25 22:51:29', NULL, '1739297817362436096', '1739297803508649984', '1739288383689068544', '1739288383961698304');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
                          `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                          `created_at` datetime DEFAULT NULL,
                          `updated_at` datetime DEFAULT NULL,
                          `deleted_at` datetime DEFAULT NULL,
                          `id` varchar(36) NOT NULL,
                          `username` varchar(64) NOT NULL,
                          `realname` varchar(64) NOT NULL,
                          `password` varchar(191) NOT NULL,
                          `email` varchar(191) DEFAULT '',
                          `phone` varchar(191) DEFAULT '',
                          `status` bigint(20) NOT NULL DEFAULT '0',
                          `created_by` varchar(191) NOT NULL,
                          PRIMARY KEY (`record_id`),
                          KEY `idx_t_user_deleted_at` (`deleted_at`),
                          KEY `idx_t_user_id` (`id`),
                          KEY `idx_t_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `username`, `realname`, `password`, `email`, `phone`, `status`, `created_by`) VALUES (2, '2023-12-25 22:52:38', '2023-12-25 22:52:38', NULL, '1739298108870758400', 'leejun', '李先生', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'lawyky.ll@gmail.com', '15922333447', 1, 'leejun');
COMMIT;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
                               `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                               `created_at` datetime DEFAULT NULL,
                               `updated_at` datetime DEFAULT NULL,
                               `deleted_at` datetime DEFAULT NULL,
                               `id` varchar(36) NOT NULL,
                               `user_id` varchar(36) NOT NULL,
                               `role_id` varchar(36) NOT NULL,
                               PRIMARY KEY (`record_id`),
                               KEY `idx_t_user_role_deleted_at` (`deleted_at`),
                               KEY `idx_t_user_role_user_id` (`user_id`),
                               KEY `idx_t_user_role_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role` (`record_id`, `created_at`, `updated_at`, `deleted_at`, `id`, `user_id`, `role_id`) VALUES (2, '2023-12-25 22:52:38', '2023-12-25 22:52:38', NULL, '1739298108870758401', '1739298108870758400', '1739297803508649984');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

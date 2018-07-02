-- ----------------------------
-- Table structure for dict_items
-- ----------------------------
DROP TABLE IF EXISTS `dict_items`;
CREATE TABLE `dict_items` (
  `dict_name` varchar(64) NOT NULL DEFAULT '' COMMENT '字典名，业务领域的逻辑命名空间，用点分隔，单词最好为驼峰风格',
  `item_key` varchar(255) NOT NULL COMMENT '项名,单词驼峰风格',
  `item_value` varchar(255) DEFAULT '' COMMENT '项值',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dict_name`,`item_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- 示例数据
-- ----------------------------
INSERT INTO `dict_items` VALUES ('sensor', 'MAGNETOMETER', '门磁传感器', null);
INSERT INTO `dict_items` VALUES ('sensor', 'PIR', '红外探测器', null);
INSERT INTO `dict_items` VALUES ('sensor', 'V', '摄像头', null);
INSERT INTO `dict_items` VALUES ('user.gender', '0', '男', null);
INSERT INTO `dict_items` VALUES ('user.gender', '1', '女', null);
INSERT INTO `dict_items` VALUES ('user.type', '0', '子女App用户', '');
INSERT INTO `dict_items` VALUES ('user.type', '1', '老人App用户', '');
INSERT INTO `dict_items` VALUES ('user.type', '2', '持卡用户', '');
INSERT INTO `dict_items` VALUES ('user.type', '9', '设备用户', '');
INSERT INTO `dict_items` VALUES ('yesno', '0', '否', null);
INSERT INTO `dict_items` VALUES ('yesno', '1', '是', null);

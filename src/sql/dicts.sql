-- ----------------------------
-- Table structure for dicts
-- ----------------------------
DROP TABLE IF EXISTS `dicts`;
CREATE TABLE `dicts` (
  `dict_name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dict_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典';

-- ----------------------------
-- 示例数据
-- ----------------------------
INSERT INTO `dicts` VALUES ('sensor', '传感器');
INSERT INTO `dicts` VALUES ('user.gender', '用户性别');
INSERT INTO `dicts` VALUES ('user.type', '用户类型');
INSERT INTO `dicts` VALUES ('yesno', 'yesno');

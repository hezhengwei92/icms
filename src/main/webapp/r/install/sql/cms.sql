#
# Structure for table "ic_admin"
#

DROP TABLE IF EXISTS `ic_admin`;
CREATE TABLE `ic_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` char(64) DEFAULT NULL COMMENT '盐',
  `lastip` varchar(64) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '登陆时间',
  `lastdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登陆时间',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点id（0，为默认）',
  `loginsum` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员';

#
# Structure for table "ic_admin_role"
#

DROP TABLE IF EXISTS `ic_admin_role`;
CREATE TABLE `ic_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理员权限';

#
# Structure for table "ic_area"
#

DROP TABLE IF EXISTS `ic_area`;
CREATE TABLE `ic_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '区域名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父区域ID',
  `pname` varchar(255) NOT NULL DEFAULT '' COMMENT '父区域名称',
  `list_order` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有效标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3523 DEFAULT CHARSET=utf8;

#
# Structure for table "ic_category"
#

DROP TABLE IF EXISTS `ic_category`;
CREATE TABLE `ic_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT '' COMMENT '短名称',
  `category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类明细',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点编号',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父类编号',
  `model_id` int(11) DEFAULT NULL COMMENT '模型编号',
  `alone` tinyint(1) DEFAULT '0' COMMENT '单页（0：不是，1：是）',
  `content` mediumtext COMMENT '文本',
  `index_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `list_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '列表页面',
  `content_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '内容页面',
  `is_nav` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航',
  `allow_front_post` tinyint(1) DEFAULT '0',
  `url` varchar(255) DEFAULT '' COMMENT '地址',
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`),
  KEY `short_name` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='分类表';

#
# Structure for table "ic_commont"
#

DROP TABLE IF EXISTS `ic_commont`;
CREATE TABLE `ic_commont` (
  `commont_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章id',
  `reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复id',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`commont_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='评论留言';

#
# Structure for table "ic_config"
#

DROP TABLE IF EXISTS `ic_config`;
CREATE TABLE `ic_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_path` varchar(64) NOT NULL DEFAULT '',
  `upload_allowType` varchar(255) NOT NULL DEFAULT '',
  `upload_max` varchar(50) DEFAULT NULL COMMENT '文件上传最大值',
  `http_protocol` varchar(16) NOT NULL DEFAULT '',
  `dynamic_suffix` varchar(255) NOT NULL DEFAULT '',
  `allow_member_reg` tinyint(1) NOT NULL DEFAULT '0',
  `member_email_check` tinyint(1) NOT NULL DEFAULT '0',
  `email_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `email_host` varchar(128) NOT NULL DEFAULT '',
  `email_port` int(11) NOT NULL DEFAULT '0',
  `email_username` varchar(64) NOT NULL DEFAULT '',
  `email_password` varchar(128) NOT NULL DEFAULT '',
  `email_address` varchar(100) DEFAULT NULL,
  `qiniu_on` tinyint(1) NOT NULL DEFAULT '0',
  `qiniu_url` varchar(128) NOT NULL DEFAULT '',
  `qiniu_bucketName` varchar(64) NOT NULL DEFAULT '',
  `qiniu_accessKey` varchar(255) NOT NULL DEFAULT '',
  `qiniu_secretKey` varchar(128) NOT NULL DEFAULT '',
  `sms_type` int(11) NOT NULL DEFAULT '0',
  `sms_username` varchar(64) NOT NULL DEFAULT '',
  `sms_password` varchar(128) NOT NULL DEFAULT '',
  `oauth_on` tinyint(1) NOT NULL DEFAULT '0',
  `oauth_sina_on` tinyint(1) NOT NULL DEFAULT '0',
  `oauth_sina_openid` varchar(128) DEFAULT NULL,
  `oauth_sina_openkey` varchar(128) DEFAULT NULL,
  `oauth_sina_redirect` varchar(100) DEFAULT NULL,
  `oauth_qq_on` tinyint(1) NOT NULL DEFAULT '0',
  `oauth_qq_openid` varchar(128) DEFAULT NULL,
  `oauth_qq_openkey` varchar(128) DEFAULT NULL,
  `oauth_qq_redirect` varchar(128) DEFAULT NULL,
  `is_dev` tinyint(1) NOT NULL DEFAULT '0',
  `is_demo` tinyint(1) NOT NULL DEFAULT '0',
  `beian` varchar(20) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT '',
  `refuse_ip` text COMMENT '过滤ip',
  `allow_login_error` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

#
# Structure for table "ic_config_attr"
#

DROP TABLE IF EXISTS `ic_config_attr`;
CREATE TABLE `ic_config_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `is_preset` tinyint(1) NOT NULL DEFAULT '0' COMMENT '预置数据',
  PRIMARY KEY (`id`),
  KEY `key` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局配置表';

#
# Structure for table "ic_content"
#

DROP TABLE IF EXISTS `ic_content`;
CREATE TABLE `ic_content` (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `model_id` int(11) NOT NULL DEFAULT '0' COMMENT '模型id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` char(40) DEFAULT '' COMMENT '关键字',
  `description` text COMMENT '描述',
  `top` tinyint(1) DEFAULT NULL COMMENT '顶置',
  `recommend` tinyint(1) DEFAULT NULL COMMENT '推荐',
  `thumb` varchar(255) DEFAULT NULL COMMENT '封面',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `inputdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `updatedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `url` char(100) DEFAULT '' COMMENT '文章地址',
  `username` char(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `content` text COMMENT '内容',
  PRIMARY KEY (`content_id`),
  KEY `catid` (`category_id`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='内容表';

#
# Structure for table "ic_content_news"
#

DROP TABLE IF EXISTS `ic_content_news`;
CREATE TABLE `ic_content_news` (
  `content_id` bigint(20) NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `photo` text,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "ic_form"
#

DROP TABLE IF EXISTS `ic_form`;
CREATE TABLE `ic_form` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单';

#
# Structure for table "ic_link"
#

DROP TABLE IF EXISTS `ic_link`;
CREATE TABLE `ic_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

#
# Structure for table "ic_member"
#

DROP TABLE IF EXISTS `ic_member`;
CREATE TABLE `ic_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL COMMENT '级别',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `salt` char(64) DEFAULT NULL COMMENT '盐',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(128) NOT NULL DEFAULT '',
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Structure for table "ic_member_group"
#

DROP TABLE IF EXISTS `ic_member_group`;
CREATE TABLE `ic_member_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `need_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '需要审核',
  `need_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '需要验证码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组别';

#
# Structure for table "ic_member_session"
#

DROP TABLE IF EXISTS `ic_member_session`;
CREATE TABLE `ic_member_session` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_obj` blob NOT NULL,
  `last_active_time` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员会话表';

#
# Structure for table "ic_menu"
#

DROP TABLE IF EXISTS `ic_menu`;
CREATE TABLE `ic_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL DEFAULT '',
  `menu_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义菜单';

#
# Structure for table "ic_model"
#

DROP TABLE IF EXISTS `ic_model`;
CREATE TABLE `ic_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) DEFAULT NULL COMMENT '模型名称',
  `table_name` varchar(255) DEFAULT NULL COMMENT '模型表名称',
  `front_submit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '前台投稿',
  `admin_submit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台投稿',
  `site_id` bigint(20) DEFAULT NULL COMMENT '站点id',
  `desc` varchar(255) DEFAULT '' COMMENT '字段描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `is_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '判断是否为内容模型',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='模型表';

#
# Structure for table "ic_model_filed"
#

DROP TABLE IF EXISTS `ic_model_filed`;
CREATE TABLE `ic_model_filed` (
  `filed_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段编号',
  `model_id` int(11) NOT NULL DEFAULT '0' COMMENT '模型编号',
  `filed_name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `filed_class` varchar(255) NOT NULL DEFAULT '' COMMENT '字段类型（如文本）',
  `filed_value` text COMMENT '字段值',
  `filed_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '字段类别（数据库类别）',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `not_null` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为空',
  `filed_length` int(11) DEFAULT '0',
  PRIMARY KEY (`filed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='模型字段';

#
# Structure for table "ic_permission"
#

DROP TABLE IF EXISTS `ic_permission`;
CREATE TABLE `ic_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='权限';

#
# Structure for table "ic_role"
#

DROP TABLE IF EXISTS `ic_role`;
CREATE TABLE `ic_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` text COMMENT '描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

#
# Structure for table "ic_role_permission"
#

DROP TABLE IF EXISTS `ic_role_permission`;
CREATE TABLE `ic_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `permisson_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`role_id`),
  KEY `pid` (`permisson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

#
# Structure for table "ic_search_words"
#

DROP TABLE IF EXISTS `ic_search_words`;
CREATE TABLE `ic_search_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '优先级',
  `name_initial` varchar(500) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索热词';

#
# Structure for table "ic_tag"
#

DROP TABLE IF EXISTS `ic_tag`;
CREATE TABLE `ic_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(64) NOT NULL DEFAULT '',
  `letter` varchar(255) NOT NULL DEFAULT '',
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `name` (`tag_name`),
  KEY `letter` (`letter`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='标记';

#
# Structure for table "ic_tag_content"
#

DROP TABLE IF EXISTS `ic_tag_content`;
CREATE TABLE `ic_tag_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `content_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `tag_Id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='标签内容';

#
# Structure for table "ic_task_content"
#

DROP TABLE IF EXISTS `ic_task_content`;
CREATE TABLE `ic_task_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '名称',
  `exp` varchar(50) NOT NULL COMMENT '表达式',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for table "ic_topic"
#

DROP TABLE IF EXISTS `ic_topic`;
CREATE TABLE `ic_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_ids` varchar(128) DEFAULT '',
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

#
# Structure for table "ic_website"
#

DROP TABLE IF EXISTS `ic_website`;
CREATE TABLE `ic_website` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `sitename` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '域名',
  `language` char(10) DEFAULT '' COMMENT '语言',
  `template` varchar(20) DEFAULT '' COMMENT '模板',
  `keyword` varchar(60) DEFAULT '' COMMENT '关键字',
  `description` text COMMENT '描述',
  `title` varchar(255) DEFAULT '' COMMENT '首页标题',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '移动是否开启',
  `mobile_tpl` varchar(255) DEFAULT NULL COMMENT '手机模板',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站点';

DROP DATABASE IF EXISTS ovs;
CREATE DATABASE ovs;
USE ovs;

CREATE TABLE user(
  id VARCHAR(32) NOT NULL ,
  name VARCHAR(15)  DEFAULT NULL ,
  nick_name VARCHAR(20) NOT NULL ,
  password VARCHAR(50) NOT NULL ,
  salt VARCHAR(20) NOT NULL ,
  phone VARCHAR(14) DEFAULT NULL ,
  email VARCHAR(15) DEFAULT NULL ,
  gender VARCHAR(2) DEFAULT NULL ,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  age INT NOT NULL DEFAULT '0',
  avatars VARCHAR(100) DEFAULT NULL ,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses(
  id INT NOT NULL AUTO_INCREMENT ,
  name VARCHAR(32) NOT NULL ,
  description VARCHAR(255) DEFAULT '',
  img VARCHAR(100) DEFAULT '',
  contents_id INT NOT NULL ,
  attention INT NOT NULL DEFAULT '0',
  collect INT NOT NULL DEFAULT '0',
  disagree INT NOT NULL DEFAULT '0',
  agree INT NOT NULL DEFAULT '0' ,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  dir VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses_rel(
  id INT NOT NULL AUTO_INCREMENT ,
  courses_id INT NOT NULL ,
  user_id VARCHAR(32) NOT NULL ,
  FOREIGN KEY (courses_id) REFERENCES courses(id),
  FOREIGN KEY (user_id) REFERENCES user(id),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE contents(
  id INT NOT NULL AUTO_INCREMENT ,
  name VARCHAR(32) NOT NULL ,
  description VARCHAR(255) DEFAULT '',
  parent_id INT NOT NULL ,
  is_top TINYINT NOT NULL DEFAULT 0,
  top_id INT NOT NULL DEFAULT 0 ,
  path VARCHAR(50) NOT NULL ,
  contents_type VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses_index(
  id INT NOT NULL AUTO_INCREMENT ,
  courses_id INT NOT NULL ,
  contents_id INT NOT NULL ,
  PRIMARY KEY (id),
  FOREIGN KEY (courses_id) REFERENCES courses(id),
  FOREIGN KEY (contents_id) REFERENCES contents(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE comment(
  id INT NOT NULL AUTO_INCREMENT ,
  commentator VARCHAR(32) NOT NULL ,
  comment_target INT NOT NULL ,
  content VARCHAR(255) DEFAULT NULL ,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  disagree INT NOT NULL DEFAULT '0',
  agree INT NOT NULL DEFAULT '0' ,
  PRIMARY KEY (id) ,
  FOREIGN KEY (comment_target) REFERENCES courses(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `contents` VALUES ('39', '编程开发', 'C++,JAVA,C#', '0', '0', '0', '0|', 'system_category');
INSERT INTO `contents` VALUES ('44', '效率办公', '效率办公', '0', '0', '0', '0|', 'system_category');
INSERT INTO `contents` VALUES ('45', 'office操作', 'office操作', '44', '0', '0', '0|44|', 'system_category');
INSERT INTO `contents` VALUES ('46', '产品和设计', '产品和设计', '0', '0', '0', '0|', 'system_category');
INSERT INTO `contents` VALUES ('47', '产品经理', '产品经理', '46', '0', '0', '0|46|', 'system_category');
INSERT INTO `contents` VALUES ('48', '需求分析', '需求分析', '47', '0', '0', '0|46|47|', 'system_category');
INSERT INTO `contents` VALUES ('51', '产品设计', '产品设计', '47', '0', '0', '0|46|47|', 'system_category');
INSERT INTO `contents` VALUES ('52', '编程语言', '编程语言', '39', '0', '0', '0|39|', 'system_category');
INSERT INTO `contents` VALUES ('53', 'JAVA', 'JAVA', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('54', 'C#', 'C#', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('55', 'php', 'php', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('56', 'c++', 'c++', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('57', 'C', 'C', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('58', 'other', 'other', '52', '0', '0', '0|39|52|', 'system_category');
INSERT INTO `contents` VALUES ('59', '前端开发', '前端开发', '39', '0', '0', '0|39|', 'system_category');
INSERT INTO `contents` VALUES ('60', 'html/html5', 'html/html5', '59', '0', '0', '0|39|59|', 'system_category');
INSERT INTO `contents` VALUES ('61', 'CSS/CSS3', 'CSS/CSS3', '59', '0', '0', '0|39|59|', 'system_category');
INSERT INTO `contents` VALUES ('62', 'javascript', 'javascript', '59', '0', '0', '0|39|59|', 'system_category');
INSERT INTO `contents` VALUES ('63', 'jQuery', 'jQuery', '59', '0', '0', '0|39|59|', 'system_category');
INSERT INTO `contents` VALUES ('64', 'other', 'other', '59', '0', '0', '0|39|59|', 'system_category');
INSERT INTO `contents` VALUES ('65', '后端开发', '后端开发', '39', '0', '0', '0|39|', 'system_category');
INSERT INTO `contents` VALUES ('66', 'javaEE', 'javaEE', '65', '0', '0', '0|39|65|', 'system_category');
INSERT INTO `contents` VALUES ('67', '.NET', '.NET', '65', '0', '0', '0|39|65|', 'system_category');
INSERT INTO `contents` VALUES ('68', 'other', 'other', '65', '0', '0', '0|39|65|', 'system_category');
INSERT INTO `contents` VALUES ('69', '市场营销', '市场营销', '0', '0', '0', '0|', 'system_category');
INSERT INTO `contents` VALUES ('70', '网络营销', '网络营销', '69', '0', '0', '0|69|', 'system_category');
INSERT INTO `contents` VALUES ('71', '推广', '推广', '69', '0', '0', '0|69|', 'system_category');
INSERT INTO `contents` VALUES ('72', '生活', '生活', '0', '0', '0', '0|', 'system_category');
INSERT INTO `contents` VALUES ('73', '摄影', '摄影', '72', '0', '0', '0|72|', 'system_category');
INSERT INTO `contents` VALUES ('74', '亲子', '亲子', '72', '0', '0', '0|72|', 'system_category');
INSERT INTO `contents` VALUES ('75', '理财', '理财', '72', '0', '0', '0|72|', 'system_category');
INSERT INTO `contents` VALUES ('82', 'python自然语言处理', 'python自然语言处理', '0', '1', '0', '0|', 'courses_contents');
INSERT INTO `contents` VALUES ('83', '语言处理与python', '语言处理与python', '82', '0', '82', '0|82|', 'courses_contents');
INSERT INTO `contents` VALUES ('84', '语言计算：文本与词汇', '语言计算：文本与词汇', '83', '0', '82', '0|82|83|', 'courses_contents');
INSERT INTO `contents` VALUES ('85', '计算语言：简单的统计', '计算语言：简单的统计', '83', '0', '82', '0|82|83|', 'courses_contents');
INSERT INTO `contents` VALUES ('86', '自动理解自然语言', '自动理解自然语言', '83', '0', '82', '0|82|83|', 'courses_contents');
INSERT INTO `contents` VALUES ('87', '获得文本资料和词汇资源', '获得文本资料和词汇资源', '82', '0', '82', '0|82|', 'courses_contents');
INSERT INTO `contents` VALUES ('88', '获取文本资料库', '获取文本资料库', '87', '0', '82', '0|82|87|', 'courses_contents');
INSERT INTO `contents` VALUES ('89', '条件频率分布', '条件频率分布', '87', '0', '82', '0|82|87|', 'courses_contents');
INSERT INTO `contents` VALUES ('90', '词典资源', '词典资源', '87', '0', '82', '0|82|87|', 'courses_contents');
INSERT INTO `contents` VALUES ('91', '处理原始文本', '处理原始文本', '82', '0', '82', '0|82|', 'courses_contents');
INSERT INTO `contents` VALUES ('92', '从网络和硬盘访问文本', '从网络和硬盘访问文本', '91', '0', '82', '0|82|91|', 'courses_contents');
INSERT INTO `contents` VALUES ('93', '字符串：最底层的文本处理', '字符串：最底层的文本处理', '91', '0', '82', '0|82|91|', 'courses_contents');
INSERT INTO `contents` VALUES ('94', '使用unicode进行文字处理', '使用unicode进行文字处理', '91', '0', '82', '0|82|91|', 'courses_contents');
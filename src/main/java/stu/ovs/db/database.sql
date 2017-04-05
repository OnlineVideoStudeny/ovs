CREATE DATABASE ovs;
USE ovs;

CREATE TABLE user(
  id VARCHAR(32) NOT NULL ,
  name VARCHAR(15)  DEFAULT NULL ,
  nick_name VARCHAR(20) NOT NULL ,
  password VARCHAR(20) NOT NULL ,
  salt VARCHAR(10) NOT NULL ,
  phone VARCHAR(14) DEFAULT NULL ,
  email VARCHAR(15) DEFAULT NULL ,
  gender VARCHAR(2) DEFAULT NULL ,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  age INT NOT NULL DEFAULT '0',
  avatars VARCHAR(100) DEFAULT NULL ,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses(
  id INT NOT NULL ,
  name VARCHAR(32) NOT NULL ,
  description VARCHAR(255) DEFAULT '',
  img VARCHAR(100) DEFAULT '',
  contents_id INT NOT NULL ,
  attention INT NOT NULL DEFAULT '0',
  collect INT NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses_rel(
  id INT NOT NULL ,
  courses_id INT NOT NULL ,
  user_id VARCHAR(32) NOT NULL ,
  FOREIGN KEY (courses_id) REFERENCES courses(id),
  FOREIGN KEY (user_id) REFERENCES user(id),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE contents(
  id INT NOT NULL ,
  name VARCHAR(32) NOT NULL ,
  description VARCHAR(255) DEFAULT '',
  parent_id INT NOT NULL ,
  is_top TINYINT NOT NULL DEFAULT 0,
  path VARCHAR(50) NOT NULL ,
  contents_type VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE courses_index(
  id INT NOT NULL ,
  courses_id INT NOT NULL ,
  contents_id INT NOT NULL ,
  PRIMARY KEY (id),
  FOREIGN KEY (courses_id) REFERENCES courses(id),
  FOREIGN KEY (contents_id) REFERENCES contents(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE comment(
  id INT NOT NULL ,
  commentator VARCHAR(32) NOT NULL ,
  comment_target INT NOT NULL ,
  content VARCHAR(255) DEFAULT NULL ,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  disagree INT NOT NULL DEFAULT '0',
  agree INT NOT NULL DEFAULT '0' ,
  PRIMARY KEY (id) ,
  FOREIGN KEY (comment_target) REFERENCES courses(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;
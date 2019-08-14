/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2018-11-16 11:51:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_affiche`
-- ----------------------------
DROP TABLE IF EXISTS `tb_affiche`;
CREATE TABLE `tb_affiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiche` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `creaTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_affiche
-- ----------------------------
INSERT INTO `tb_affiche` VALUES ('1', '六一儿童节', '推出大量儿童商品特价！', '2015-11-03 11:05:31');
INSERT INTO `tb_affiche` VALUES ('2', '全场8折优惠', '全场8折优惠！！！', '2015-12-04 21:50:02');
INSERT INTO `tb_affiche` VALUES ('3', 'jklj', 'fj', '2018-07-17 13:50:26');

-- ----------------------------
-- Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `sortId` int(11) DEFAULT NULL,
  `bookName` varchar(50) DEFAULT NULL,
  `introduce` text,
  `publisher` varchar(50) DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `nowprice` float DEFAULT NULL,
  `freeprice` float DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `mark` bit(1) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goodsId`),
  KEY `FK_Reference_4` (`sortId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`sortId`) REFERENCES `tb_sort` (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('0', null, null, null, null, null, null, null, null, null, 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('1', '1', 'CSS基础教程', '本书是优秀的CSS 入门书，重点讲述了如何使用CSS 实现基于Web 标准的网站开发，实现网站内容和表现相分离。 　　本书包括两部分。第一部分介绍了CSS 的基础知识和基本概念，再利用CSS 分别对网页创建中的一些基本元素加上样式，包括：文本、图像、列表、链接、表格、表单等。第二部分主要讨论了基于CSS 来实现网页基本布局的相关概念与技术，包括浮动、流体布局等。本书最后还给出了一个真实的案例，将本书的所有内容进行了综合讨论。 　　本书适合于各层次Web 开发人员、设计人员和测试人员学习参考。', '机械工业出版社', '2015-10-15', '34', '24', 'goodspicture/1.jpg', '', 'https://www.baidu.com/');
INSERT INTO `tb_goods` VALUES ('2', '1', '精通CSS', '本书将最有用的CSS技术汇总在一起，在介绍基本的CSS概念和最佳实践之后，讨论了核心的CSS技术，例如图像、链接、列表操纵、表单设计、数据表格设计以及纯CSS布局。每一章内容由浅入深，直到建立比较复杂的示例。 本书将最有用的CSS技术汇总在一起，在介绍基本的CSS概念和最佳实践之后，讨论了核心的CSS技术，例如图像、链接、列表操纵、表单设计、数据表格设计以及纯CSS布局。每一章内容由浅入深，直到建立比较复杂的示例。', '机械工业出版社', '2015-10-15', '27', '14', 'goodspicture/2.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('3', '1', 'JavaScript 高级程序设计', 'JavaScript是目前Web客户端开发的主要编程语言，也是Ajax的核心技术之一。本书从最早期Netscape浏览器中的JavaScript开始讲起，直到当前它对XML和Web服务的具体支持，内容主要涉及JavaScript的语言特点、JavaScript与浏览器的交互、更高级的JavaScript技巧，以及与在Web应用程序中部署JavaScript解决方案有关的问题，如错误处理、调试、安全性、优化/混淆化、XML和Web服务，最后介绍应用所有这些知识来创建动态用户界面。', '人民邮电出版社', '2015-10-15', '33', '23', 'goodspicture/3.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('4', '1', '无懈可击的Web设计', '本书将最有用的CSS技术汇总在一起，在介绍基本的CSS概念和最佳实践之后，讨论了核心的CSS技术，例如图像、链接、列表操纵、表单设计、数据表格设计以及纯CSS布局。每一章内容由浅入深，直到建立比较复杂的示例。之后本书用两章讨论招数、过滤器、bug和bug修复，最后由Simon Collison和Cameron Moll两位杰出的CSS设计人员，将书中讨论的许多技术组合起来，给出了两个实例研究。本书还集中介绍了现实的浏览器问题，是弥补CSS知识欠缺不可或缺的参考书。本书适合具有(X)HTML和CSS基本知识的任何网页设计人员阅读。', '人民邮电出版社', '2015-10-15', '45', '26', 'goodspicture/4.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('5', '1', 'Ajax实战', '本书是目前Ajax领域最为全面深入的一本著作，其中不仅有对于基础知识的介绍，还有对于Ajax开发中重大的体系架构问题的深入探讨，总结了大量Ajax开发中的设计模式，并讨论了框架、安全性与性能等等。书中提供了几个典型的例子，兼顾各种开发平台，这些例子的代码稍作修改就可以直接应用于项目开发之中，代码源文件可以从图灵网站下载。本书内容广泛且深入，同时适用于各个层次的Web应用开发人员。', '科学出版社', '2015-10-15', '44', '34', 'goodspicture/5.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('6', '2', '藏地密码6', '从来没有一本小说，能像《藏地密码》这样，奇迹般地赢得专家、学者、名人、书店、媒体、全球最知名的出版机构以及成千上万普通读者的狂热追捧，《藏地密码》是当下中国数千万“西藏迷”了解西藏的首选读本，也是当下最畅销的华语小说，目前销量已达到惊人的200多万册。', '科学出版社', '2015-10-15', '34', '23', 'goodspicture/6.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('7', '2', '红烧茄子', '本书超越了一般意义的反特故事，它将跨度拉长到近半个世纪，把5个主要人物的命运由每个历史时期的案件串联起来，故事的终极意义在于通过人物过去的付出和现时的遭遇，再现国家发展过程中那些默默无闻的幕后英雄精神不屈的本质。', '文艺出版社', '2015-10-15', '27', '11', 'goodspicture/7.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('8', '3', '货币战争', '为什么你不知道美联储是私有的中央银行？ 为什么华尔街风险资本会选中希特勒作为“投资”对象？ 为什么美国总统遇刺的比例高于美军诺曼底登陆一线部队的伤亡率？ 自1694年英格兰银行成立以来的３００年间，几乎每一场世界重大变故背后，都能看到国际金融资本势力的身影。他们通过左右一国的经济命脉掌握国家的政治命运，通过煽动政治事件、诱发经济危机，控制着世界财富的流向与分配。可以说，一部世界金融史，就是一部谋求主宰人类财富的阴谋史。 通过描摹国际金融集团及其代言人在世界金融史上翻云覆雨的过程，本书揭示了对金钱的角逐如何主导着西方历史的发展与国家财富的分配，通过再现统治世界的精英俱乐部在政治与经济领域不断掀起金融战役的手段与结果，本书旨在告诫人们警惕潜在的金融打击，为迎接一场“不流血”的战争做好准备。', '清华大学出版社', '2015-10-15', '34', '23', 'goodspicture/8.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('9', '4', '新编考研英语读真题记单词', '本书对历年真题选项中的疑难词语也进行了逐一分析，并且根据大纲要求进行了注解，旨在保障考生在考试时不要输在题干和选项上，这就为考生彻底扫清了考试中的障碍词语。', '机械工业出版社', '2015-10-15', '33', '22', 'goodspicture/9.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('10', '4', '奥巴马演说集', '本书中共收录奥巴马激情演说十四篇（包含就职演说），每篇演说后都附有详尽的背景注释与难词解析，是了解美国历史与现状、了解奥巴马心路历程的绝佳资料，也是学习英文及演讲技巧的最好范例。 　　从夏威夷到印度尼西亚，从印度尼西亚到芝加哥，从芝加哥到白宫，巴拉克?奥巴马演绎了美国政治史上一段最不可思议、最令人着迷的传奇。自他决定参选之日起，权力之路就已经向他展开。他要用激情、智慧和口才去征服和感动全美国人民。作为一位非裔美国人、一位参议员、一位律师、一位大学讲师、一位父亲、一位天主教徒、一位持异见的政客，奥巴马在演说中叙述了个人的成长经历、价值取向、对伊拉克战争的态度，并就种族、信仰、社区、教育、税收等政治和社会方面的诸多问题提出了多项改革方案。其演讲逻辑缜密，激情澎湃，震撼人心。', '科学出版社', '2015-10-15', '27', '20', 'goodspicture/10.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('11', '3', '领导力是什么', '《领导力是什么》汇集了众多新文章，集中讨论如何领导变革、如何处理复杂局面和不确定因素、如何建立学习型组织、如何促进创新以及在当今国际性组织中管理知识型员工必备的新技能等问题。 本书的撰稿者都是当今世界最受尊重的商业思想家和顾问中的佼佼者。他们涉猎的领域广泛深入，为营销和研发提供了新的领导方法，为促进下一代领导力的发展提供了新的技巧，为危机管理提供了新的领导方法，也为打造在竞争中获胜的灵活组织提供了新的路径。本书如同一本代表专业技术与智慧的名副其实的名人录，为我们描画了一幅21世纪的领导力蓝图。', '文艺出版社', '2015-10-15', '23', '18', 'goodspicture/11.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('12', '4', '四级考试历年真题', '本书对历年真题选项中的疑难词语也进行了逐一分析，并且根据大纲要求进行了注解，旨在保障考生在考试时不要输在题干和选项上，这就为考生彻底扫清了考试中的障碍词语。', '人民邮电出版社', '2015-10-15', '34', '17', 'goodspicture/13.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('13', '3', '管理是什么', '作者在欧洲和美国的成功管理实践保证了本书与实际管理生活的密切接近，为管理者们提供了现实的操作指南。', '商务出版社', '2015-10-15', '27', '19', 'goodspicture/12.jpg', '', 'https://www.taobao.com/');
INSERT INTO `tb_goods` VALUES ('14', '3', '巴菲特教你读财报', '金融传奇天才巴菲特的前儿媳玛丽?巴菲特与研究巴菲特法则的权威人士戴维?克拉克探秘沃伦?巴菲特的思想精髓，在本书中深入浅出地介绍巴菲特分析公司财务报表的黄金法则。书中以巴菲特的投资实例告诉你：巴菲特在分析损益表和资产负债表时那些久经考验的黄金法则，巴菲特用以寻找具有持续性竞争优势公司的财务指标——据此，他可以获得丰厚的长期投资回报，巴菲特如何使用财务报表去评估一家公司的价值，巴菲特对哪类股价便宜的公司避而远之。毋庸置疑，巴菲特诠释公司报表的简单财务指标会帮你识别出在明天的商战中，哪些公司会大获全胜，哪些公司会惨败而终。学会像巴菲特一样分析公司财报，你一定能在股市中收获累累硕果！', '文艺出版社', '2015-10-15', '34', '15', 'goodspicture/14.jpg', '', 'https://www.taobao.com/');

-- ----------------------------
-- Table structure for `tb_leavewords`
-- ----------------------------
DROP TABLE IF EXISTS `tb_leavewords`;
CREATE TABLE `tb_leavewords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `creaTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`account`),
  KEY `FK_Reference_7` (`goodsId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`account`) REFERENCES `tb_member` (`account`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`goodsId`) REFERENCES `tb_goods` (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_leavewords
-- ----------------------------
INSERT INTO `tb_leavewords` VALUES ('1', '14', 'root', '不错', '可读性很高，快递也很快', '2015-11-03 10:57:23');
INSERT INTO `tb_leavewords` VALUES ('2', '10', 'root', '快递很快', '快递很快', '2015-11-03 10:57:43');
INSERT INTO `tb_leavewords` VALUES ('3', '2', 'root', '快递很快', '快递很快', '2015-11-03 10:57:51');
INSERT INTO `tb_leavewords` VALUES ('4', '1', 'root', '快递很快', '快递很快', '2015-11-03 10:57:57');
INSERT INTO `tb_leavewords` VALUES ('5', '11', 'root', '快递很快', '快递很快', '2015-11-03 10:58:03');
INSERT INTO `tb_leavewords` VALUES ('6', '5', 'root', '快递很快', '快递很快', '2015-11-03 10:58:13');
INSERT INTO `tb_leavewords` VALUES ('7', '4', 'root', '快递很快', '快递很快', '2015-11-03 10:58:19');
INSERT INTO `tb_leavewords` VALUES ('8', '6', 'root', '快递很快', '快递很快', '2015-11-03 10:58:25');
INSERT INTO `tb_leavewords` VALUES ('9', '12', 'root', '无', '？？？', '2018-03-07 04:29:56');
INSERT INTO `tb_leavewords` VALUES ('10', '7', '12', '内容：还行吧', '标题：质量不错', '2018-03-08 18:17:51');
INSERT INTO `tb_leavewords` VALUES ('11', '3', '1', '??????', '??', '2018-03-30 14:57:51');
INSERT INTO `tb_leavewords` VALUES ('12', '5', '1', '??????', '??', '2018-03-30 15:05:34');
INSERT INTO `tb_leavewords` VALUES ('13', '9', '1', '??????', '??', '2018-03-30 15:07:58');
INSERT INTO `tb_leavewords` VALUES ('14', '4', '1', '??????', '??', '2018-03-31 21:44:19');

-- ----------------------------
-- Table structure for `tb_link`
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(50) DEFAULT NULL,
  `linkAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link` VALUES ('1', '北京邮电大学', 'http://www.bupt.edu.cn/');
INSERT INTO `tb_link` VALUES ('2', '一号店', 'http://www.yhd.com/');
INSERT INTO `tb_link` VALUES ('3', '淘宝', 'http://www.taobao.com/');
INSERT INTO `tb_link` VALUES ('4', '天猫', 'http://www.tmall.com/');
INSERT INTO `tb_link` VALUES ('5', '聚划算', 'http://ju.taobao.com/');
INSERT INTO `tb_link` VALUES ('6', '京东', 'http://www.jd.com/');
INSERT INTO `tb_link` VALUES ('7', '亚马逊', 'http://www.amazon.cn/');
INSERT INTO `tb_link` VALUES ('122', 'fghgh', null);

-- ----------------------------
-- Table structure for `tb_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `account` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `reallyName` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `sign` int(11) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('1', '1', '会员管理员', 'EQWEQE', '0');
INSERT INTO `tb_manager` VALUES ('admin1', '123456', '商品管理员', '13412345678', '1');
INSERT INTO `tb_manager` VALUES ('admin2', '123456', '会员管理员', '13412345678', '2');
INSERT INTO `tb_manager` VALUES ('admin3', '123456', '订单管理员', '13412345678', '3');
INSERT INTO `tb_manager` VALUES ('root', '111111', '总管理员', '13412345678', '0');

-- ----------------------------
-- Table structure for `tb_member`
-- ----------------------------
DROP TABLE IF EXISTS `tb_member`;
CREATE TABLE `tb_member` (
  `account` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `reallyName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `idCard` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_member
-- ----------------------------
INSERT INTO `tb_member` VALUES ('1', '1', '一一', '358223504@qq.com', '48888888877', '365555548454965612');
INSERT INTO `tb_member` VALUES ('12', '123456', '王伟', '358223504@qq.com', '18888888888', '350111111111111111');
INSERT INTO `tb_member` VALUES ('krystal976', 'krystal9212276', '李唤', '1192938351@qq.com', '17777812776', '130131199201270067');
INSERT INTO `tb_member` VALUES ('li', '12345678', '李唤', 'lihuan976@aliyun.com', '17777812776', '130131199901270066');
INSERT INTO `tb_member` VALUES ('lixuan', '123456', '李煊', 'lixuan@gmail.com', '18500000000', '111111111111111111');
INSERT INTO `tb_member` VALUES ('lll', '123456', '林', '358223504@qq.com', '18888834344', '350111111111111111');
INSERT INTO `tb_member` VALUES ('lqwer', '123456', '林', '358223504@qq.com', '18888834344', '350121111111111111');
INSERT INTO `tb_member` VALUES ('root', '123456', 'py', '123456@qq.com', '13412345678', '123456789012345678');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` varchar(50) NOT NULL,
  `account` varchar(50) DEFAULT NULL,
  `reallyName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `setMoney` varchar(50) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `sign` bit(1) DEFAULT NULL,
  `creaTime` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_Reference_1` (`account`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`account`) REFERENCES `tb_member` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1450578938353', 'root', 'py', '北京交通大学', '13123456789', '银行付款', '普通邮寄', '无', '', '2015-12-20 00:00:05');
INSERT INTO `tb_order` VALUES ('1450579756262', 'root', 'py', '北京交通大学', '13123456789', '银行付款', '普通邮寄', '无', '', '2015-12-20 01:00:00');
INSERT INTO `tb_order` VALUES ('1450580370866', 'root', 'py', '北京林业大学', '13123456789', '邮政付款', '特快专递', '无', '', '2015-12-20 01:01:00');
INSERT INTO `tb_order` VALUES ('1450580453716', 'root', 'py', '清华大学', '13123456789', '邮政付款', '特快专递', '无', '', '2015-12-20 03:00:04');
INSERT INTO `tb_order` VALUES ('1450580806532', 'root', 'py', '北京林业大学', '13123456789', '银行付款', '普通邮寄', '无', '', '2015-12-20 01:02:02');
INSERT INTO `tb_order` VALUES ('1450581220451', 'root', 'py', '清华大学', '13123456789', '银行付款', '特快专递', '无', '', '2015-12-20 01:02:59');
INSERT INTO `tb_order` VALUES ('1450581492104', 'root', 'py', '北京邮电大学', '13123456789', '银行付款', '普通邮寄', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450581722477', 'root', 'py', '北京邮电大学', '13123456789', '邮政付款', '特快专递', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450581889015', 'root', 'py', '北京邮电大学', '13123456789', '银行付款', '普通邮寄', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450582384809', 'root', 'py', '清华大学', '13123456789', '现金支付', '普通邮寄', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450582632937', 'root', 'py', '天安门', '13123456789', '邮政付款', '普通邮寄', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450583439861', 'root', 'py', '北京林业大学', '13123456789', '邮政付款', '特快专递', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1450583787952', 'root', 'py', '北京林业大学', '13123456789', '邮政付款', '普通邮寄', '无', '', '2015-12-20 00:00:00');
INSERT INTO `tb_order` VALUES ('1520521121333', '12', '12', '中国地质大学', '18888888888', '邮政付款', '普通邮寄', '12', '', '2018-03-08 06:59:10');

-- ----------------------------
-- Table structure for `tb_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE `tb_orderdetail` (
  `orderditialid` varchar(50) DEFAULT NULL,
  `orderId` varchar(50) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  KEY `FK_Reference_2` (`orderId`),
  KEY `FK_Reference_5` (`goodsId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`goodsId`) REFERENCES `tb_goods` (`goodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_orderdetail
-- ----------------------------
INSERT INTO `tb_orderdetail` VALUES ('1', '1450578938353', '3', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('2', '1450579756262', '5', '26', '1');
INSERT INTO `tb_orderdetail` VALUES ('3', '1450579756262', '8', '26', '1');
INSERT INTO `tb_orderdetail` VALUES ('4', '1450579756262', '4', '26', '1');
INSERT INTO `tb_orderdetail` VALUES ('5', '1450580370866', '1', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('6', '1450580370866', '3', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('7', '1450580453716', '6', '23', '6');
INSERT INTO `tb_orderdetail` VALUES ('8', '1450580806532', '4', '11', '1');
INSERT INTO `tb_orderdetail` VALUES ('9', '1450580806532', '7', '33', '1');
INSERT INTO `tb_orderdetail` VALUES ('10', '1450581220451', '2', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('11', '1450581220451', '5', '14', '1');
INSERT INTO `tb_orderdetail` VALUES ('12', '1450581220451', '11', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('13', '1450581492104', '7', '11', '1');
INSERT INTO `tb_orderdetail` VALUES ('14', '1450581492104', '11', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('15', '1450581722477', '1', '34', '1');
INSERT INTO `tb_orderdetail` VALUES ('16', '1450581722477', '12', '34', '1');
INSERT INTO `tb_orderdetail` VALUES ('17', '1450581889015', '2', '26', '1');
INSERT INTO `tb_orderdetail` VALUES ('18', '1450581889015', '4', '26', '1');
INSERT INTO `tb_orderdetail` VALUES ('19', '1450582384809', '1', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('20', '1450582384809', '2', '14', '1');
INSERT INTO `tb_orderdetail` VALUES ('21', '1450582632937', '8', '45', '1');
INSERT INTO `tb_orderdetail` VALUES ('22', '1450582632937', '10', '27', '1');
INSERT INTO `tb_orderdetail` VALUES ('23', '1450583439861', '9', '23', '1');
INSERT INTO `tb_orderdetail` VALUES ('24', '1450583439861', '11', '16', '1');
INSERT INTO `tb_orderdetail` VALUES ('25', '1450583787952', '3', '21', '1');
INSERT INTO `tb_orderdetail` VALUES ('26', '1450583787952', '8', '34', '1');
INSERT INTO `tb_orderdetail` VALUES ('27', '1520521121333', '13', '19', '1');
INSERT INTO `tb_orderdetail` VALUES ('28', '1520521121333', '4', '26', '1');

-- ----------------------------
-- Table structure for `tb_sort`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sort`;
CREATE TABLE `tb_sort` (
  `sortId` int(11) NOT NULL AUTO_INCREMENT,
  `sortName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_sort
-- ----------------------------
INSERT INTO `tb_sort` VALUES ('1', '鲁菜');
INSERT INTO `tb_sort` VALUES ('2', '川菜');
INSERT INTO `tb_sort` VALUES ('3', '粤菜');
INSERT INTO `tb_sort` VALUES ('4', '淮扬菜');
INSERT INTO `tb_sort` VALUES ('5', '111');
INSERT INTO `tb_sort` VALUES ('7', '23');

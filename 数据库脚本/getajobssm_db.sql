/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.53 : Database - getajobssm_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`getajobssm_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `getajobssm_db`;

/*Table structure for table `baoming` */

DROP TABLE IF EXISTS `baoming`;

CREATE TABLE `baoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(255) DEFAULT NULL,
  `wid` int(255) DEFAULT NULL,
  `qyid` int(11) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `baoming` */

insert  into `baoming`(`id`,`mid`,`wid`,`qyid`,`savetime`,`filename`) values (11,4,13,9,'2018-12-07 20:59:59','1544187521365.txt'),(12,11,12,9,'2018-12-08 21:27:56','1544275675168.txt'),(14,14,16,15,'2020-02-23 18:38:39','1582454311998.jpg'),(15,18,17,19,'2020-02-23 19:30:32','1582457429535.jpg');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `hfcontent` text,
  `savetime` varchar(255) DEFAULT NULL,
  `memberid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

insert  into `chat`(`id`,`content`,`hfcontent`,`savetime`,`memberid`) values (3,'不错不错','真的？','2018-12-08 21:39:57',9),(4,'aaaaaaaaaaaa','','2020-02-23 18:30:24',15),(5,'bbbbbbbbbbbbbb','','2020-02-23 18:30:28',15),(6,'ccccccccccccccccc','','2020-02-23 18:30:33',15);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  `hfcontent` text,
  `qyid` int(11) DEFAULT NULL,
  `workid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`memberid`,`content`,`savetime`,`hfcontent`,`qyid`,`workid`) values (3,11,'我觉得这个不错','2018-12-08 21:28:19',NULL,9,12);

/*Table structure for table `findjob` */

DROP TABLE IF EXISTS `findjob`;

CREATE TABLE `findjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `ziwei` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `findjob` */

insert  into `findjob`(`id`,`memberid`,`title`,`salary`,`ziwei`,`addr`,`content`,`savetime`) values (2,4,'java开发','8000','java工程师','武汉光谷广场周边','111','2018-12-06 14:18:51'),(3,4,'NET开发','9000','NET工程师','武汉光谷广场周边','22222222231','2018-12-06 14:20:04'),(4,14,'java工程师','20000','高级工程师','上海长宁','javav','2020-02-23 18:26:01'),(5,14,'c++','10000','高级工程师','苏州','11111111111111','2020-02-23 18:27:21'),(6,18,'java工作','20000','高级工程师','北京','1111','2020-02-23 19:29:45');

/*Table structure for table `jianli` */

DROP TABLE IF EXISTS `jianli`;

CREATE TABLE `jianli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mianmao` varchar(255) DEFAULT NULL,
  `xueli` varchar(255) DEFAULT NULL,
  `ziwei` varchar(255) DEFAULT NULL,
  `xueyuan` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `qzyixiang` text,
  `gzjingli` text,
  `delstatus` varchar(255) DEFAULT NULL,
  `memberid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `jianli` */

insert  into `jianli`(`id`,`sex`,`email`,`mianmao`,`xueli`,`ziwei`,`xueyuan`,`salary`,`filename`,`qzyixiang`,`gzjingli`,`delstatus`,`memberid`) values (21,'女','lisi@126.com','党员','本科','美工，会计','华中科技大学','7000','1544112991767.jpg','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','0',6),(22,'女','zhangsan@126.com','团员','本科','java工程师，会计','文华学院','8000','1544116328991.jpg','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','0',4),(23,'女','zhouqi@126.com','党员','本科','java工程师，会计','华中科技大学','7000','1544275462671.jpg','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','负责日常的图书数据加工工作，培训CN-MARC编目员，组建图书编目加工部；出差各高校事业单位，提供图书加工上架服务；安排本部门日常工作','0',11),(24,'男','adsf@qq.com','团员','1111111111','高级工程师','南通大学','10000','nopic.jpg','aaaaaaaaaaaa','aaaaaaaaaaaa','0',14),(25,'男','asdfas@qq.com','团员','11','aaa',' 南京大学','111111','nopic.jpg','111','11','0',18);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `ziwei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`age`,`tel`,`delstatus`,`savetime`,`utype`,`shstatus`,`filename`,`major`,`addr`,`ziwei`) values (0,'zhangsan','123456','zhangsan@126.com','张三','23','13893784349','0','2018-12-05 20:01:17','求职者','通过审核','1544011266900.jpg','计算机','湖北省武汉市洪山广场209号','java工程师，会计'),(5,'jack','123456','jack@126.com','方正集团',NULL,'13893784349','0','2018-12-05 20:02:08','招聘者','通过审核','1544011315641.jpg',NULL,'湖北省武汉市洪山广场209号','人事行政主管人事行政主管人事行政主管人事行政主管人事行政主管人事行政主管人事行政主管人事行政主管人事行政主管'),(6,'lisi','123456','lisi@126.com','李四','23','13874628204','0','2018-12-06 01:05:02','求职者','通过审核','1544112057858.jpg','室内设计','湖北省武汉市洪山广场209号','美工，会计'),(8,'wangwu','123456','wangwu@126.com','王五','21','13893784349','0','2018-12-07 00:09:23','求职者','通过审核','1544112554699.jpg','计算机','湖北省武汉市洪山广场219号','java工程师，会计'),(9,'calivn','123456','calvin@126.com','calvin科技有限公司1',NULL,'13893784349','0','2018-12-07 14:29:58','招聘者','通过审核','1544164190056.jpg',NULL,'湖北省武汉市洪山广场209号','我们公司全是精英！！！！！！！'),(10,'songliu','123456','songliu@126.com','孙六','21','13483098201','0','2018-12-07 19:22:28','求职者','通过审核','1544181721087.jpg','计算机','湖北省武汉市洪山广场209号','人事行政主管'),(11,'zhouqi','123456','zhouqi@126.com','周柒','23','13732921236','0','2018-12-08 21:21:39','求职者','通过审核','1544275256733.jpg','工商管理','湖北省武汉市洪山广场19号','java工程师，会计'),(12,'gpj','gpj','dsafdsf@qq.com',NULL,NULL,NULL,'0','2020-02-22 21:29:31','æ±èè','待审核','1582378156788.jpg',NULL,NULL,NULL),(13,'xijia','123456','adsf@qq.com',NULL,NULL,NULL,'0','2020-02-22 21:31:56','求职者','待审核','1582378282589.jpg',NULL,NULL,NULL),(14,'employee1','123456','adsf@qq.com','求职者1','40','15211111111','0','2020-02-23 17:47:39','求职者','通过审核','1582451243026.jpg','计算机','上海长宁','高级工程师'),(15,'company1','123456','adsfas@qq.com','阿里巴巴',NULL,'15211111111','0','2020-02-23 17:48:34','招聘者','通过审核','1582451300748.jpg',NULL,'杭州','不说了'),(18,'employee2','123456','asdfas@qq.com','求职者2','34','15266666666','0','2020-02-23 19:25:26','求职者','通过审核','1582457115543.jpg','计算机','南京','aaa'),(19,'company2','123456','sdfasdf@qq.com','百度',NULL,'15233333333','0','2020-02-23 19:25:46','招聘者','通过审核','1582457135248.jpg',NULL,'北京','很好');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `filename` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`filename`,`savetime`) values (1,'情商的最大敌人就是愤怒','<span style=\"color:#6D6E71;font-family:\" font-size:medium;\"=\"\">\r\n<div class=\"editor-show-main\" style=\"margin:0px;padding:18px 22px 4px 15px;border:0px;font-size:17px;color:#555555;\">\r\n	步入社会参加工作以后，我们会经常自觉不自觉的，观察一个人的性格，我们很快就发现，有一种性格的人，他们的情绪非常的不稳定，很容易激动，在工作上，同事稍微有些话说得不投机，他们就会怒不可遏，同时呢，他们还非常的敏感，别人一些无意的动作和失误，可能都会被他们视为极大的冒犯，他们的自尊心，还非常的强大，甚至又过于强大，非常害怕被否定，非常害怕失去，更恐怖的是他们非常习惯的喜欢用愤怒的方式，来面对所有的人和事。显而易见，这种人在职场上是非常不受欢迎的，也是极其没有发展前途的，那么，我们如何面对愤怒，如何不成为愤怒的俘虏呢，这就需要我们，对愤怒有一个正确的认知。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://www.jianzhiba.net/newsimage/image/201811/20181115101913_864.jpg\" alt=\"\" /><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;第一，我们要明白，愤怒在很多时候，它只是一种外在的情绪，他并不是问题的根源所在，我们一定要仔细探索自己的内心，看清楚导致自己愤怒的背后的根源在哪里？这个时候我们需要冷静下来，进行自我分析，一旦把愤怒的根源找出来，我们才能够有效的解决问题。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; 第二，我们一定要明白，不管我们如何的愤怒，我们是不应该把愤怒发泄到无辜的人身上的，虽然明明知道对这个无辜的人发火比较安全，但是，迁怒于他人，是非常没有修养的象征，如果我们真的愤怒了，也应该选择无害于他人和自己的方式来宣泄，比如说，大哭一场，运动出汗等等。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; 第三，我们不应该习惯用愤怒来掩盖自尊心受到伤害，毕竟，为了面子问题，而让自己陷入糟糕的情绪当中，是非常不值当的，是我们缺乏自信和安全感的表现。\r\n</div>\r\n</span>','/getajobssh/upfile/u=4243313200,932744511&fm=27&gp=0.jpg','2018-11-28 16:41:03'),(4,'职场压力那么大我们如何消除内心的焦虑','<span style=\"color:#6D6E71;font-family:\" font-size:medium;\"=\"\">\r\n<div class=\"editor-show-main\" style=\"margin:0px;padding:18px 22px 4px 15px;border:0px;font-size:17px;color:#555555;\">\r\n	焦虑，就是一种强烈的担心和害怕的情绪体验，焦虑，不但不能够帮助我们处理遇到的困难和困境，而且会严重影响到我们学习和工作的开展，那么我们如何做才能有效的消除我们的焦虑心理呢，我们可以，按照以下三个步骤进行：<br />\r\n<img src=\"https://www.jianzhiba.net/newsimage/image/201811/20181115101951_373.jpg\" alt=\"\" /><br />\r\n第一，一旦遇到问题，我们开始焦虑的时候，立马提醒自己，要冷静下来，深呼吸，当我们能够心平气和的坐下来，开始分析出现的糟糕的状况的时候，我们就可以冷静的面对设想到的可能会出现的最坏结果，对自己说，这只是可能会出现的最糟糕的结果，并不是一定会出现，我们还有办法，还可以来得及改变，但是我们最先需要做的就是冷静，冷静，再冷静。<br />\r\n第二，当我们能够冷静下来，理智的分析我们预测到的最坏结果之后，我们对自己说，最坏也就不过如此，我们还是能够承受起这样的结果的，这个时候我们心里就会觉得很轻松，不会再觉得很压抑和憋屈。<br />\r\n第三步，也是带领我们走出焦虑的关键，就是在心情平静理智回归之后，我们应该把我们所有的时间和精力，都用在工作上，努力想出各种办法去解决，出现的问题，调动我们所有能够利用的资源，尽量把工作以最好的状态，完成在力所能及的最佳效果，即使确实是困难重重，我们也应该尽最大的努力，而把损失降到最低。<br />\r\n这三个步骤，是可以处理任何一个人的焦虑情绪的，毕竟，我们一旦陷入到这种焦虑状态，我们就无法思考，无法作出正确的判断和行动，所以，在我们焦虑不安的时候，我们可以尝试学习从这三个步骤开始，把自己从焦虑中解救出来。11111\r\n</div>\r\n</span>','1543997669392.jpg','2018-11-28 17:35:08');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`title`,`filename`,`content`,`savetime`,`author`) values (5,'吉林企事业单位首次赴上海地区进行人才招聘','1543995329862.jpg','<span style=\"background-color:#FFFFFF;\">12月2日，由吉林省人才交流开发中心组织的省内部分企事业单位赴上海市参加了“2018年长三角地区人才交流洽谈会暨高校毕业生择业招聘会”，这是吉林省首次组团赴上海地区进行人才招聘。此次招聘会，是吉林省人社厅贯彻落实省委、省政府年初出台的人才18条政策、推进吉人回乡所采取的重要举措之一，也是继7.29北京专场人才招聘会、10.21深圳专场人才招聘会后，吉林省在省外开展的规模校大的一次招聘会。此次招聘会，吉林省共有56家企事业单位参会，提供岗位991个，其中有30家企事业单位到现场参会，交流洽谈113人次，达成初步就业意向51人次。</span><span style=\"color:#2F2F2F;font-family:宋体;font-size:12px;background-color:#FFFFFF;\"></span>\r\n<p style=\"font-size:14px;color:#2F2F2F;font-family:宋体;background-color:#FFFFFF;\">\r\n	<span>&emsp;&emsp;虽然此次招聘会受国家公务员考试和上海市同时举办的两场招聘会的影响，到现场求职的人员数量不是太多，但吉林省的招聘区仍然受到了较为密切的关注。吉林省的招聘展区设在场馆入口处，悬挂在招聘区上方的“振兴吉林 人才先行 欢迎吉林学子回乡就业创业”的红色条幅格处醒目，省内十二个地区的政策宣传展架夹道欢迎长三角地区各类人才前来咨询洽谈，工作人员更是在现场广泛发放吉林省高校毕业生就业创业宣传手册、各类人才政策宣传折页和用人单位岗位需求信息一览表共计2400多份，充分展现了吉林省求才的渴望、引才的热情和爱才的姿态。</span>\r\n</p>\r\n<p style=\"font-size:14px;color:#2F2F2F;font-family:宋体;background-color:#FFFFFF;\">\r\n	<span>&emsp;&emsp;在招聘会现场，到我省招聘区咨询的基本都是吉林藉各类人才，有的是接到智联招聘的邀约到现场投递简历和洽谈的，有的是得知招聘会消息后，提前精准匹配岗位后到现场対接的；有的是被现场发放的吉林省招才引才政策宣传资料和现场的12个招才引才政策展架吸引到吉林省招聘展区的。</span>\r\n</p>\r\n<p style=\"font-size:14px;color:#2F2F2F;font-family:宋体;background-color:#FFFFFF;\">\r\n	<span>&emsp;&emsp;吉林省招聘团在沪招才引智的做法和热情也受到了上海媒体的重点关注。中新社、解放日报、上海青年报、上海日报等媒体的记者纷纷前来采访，特别关注到吉林省企业提供的岗位薪资待遇都非常高，岗位发展空间设计非常完善，吉林省政府出台的政策也营造了很好的就业创业环境，记者们表示将会大力宣传吉林省的做法，希望企业能成功招聘到人才。</span>\r\n</p>','2018-12-05 15:35:31','王老大'),(6,'找工作的看这里 12月西安将有12场招聘会','1543995371167.jpg','<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	12月份西安招聘会比较多，记者昨日从陕西中大人力资源管理有限公司获悉，还有12场大型招聘会帮您找工作。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	&emsp;&emsp;12月2日：2018职场面对面大型人才招聘会；5日：房地产、建筑装饰、物业管理、家居建材类专场人才招聘会；8-9日：中国（西部）冬季大型综合人才交流会；12日：医疗卫生、医药、教育培训类专场人才招聘会；15-16日：2018综合人才交流大会；19日：商超、酒店、旅游、物流管理专场人才招聘会；22-23日：“迎新年”大型现场招聘会；26日：营销、文职、技术、财务、管理综合类专场人才招聘会。招聘会地址：陕西省图书馆一层中大人力资源服务大厅。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	&emsp;&emsp;此外， 还有西安创业咖啡街区·人才大市场专场招聘会，分别于12月5日、12日、19日、26日举行。首席记者 姬娜\r\n</p>','2018-12-05 15:36:18','王老大'),(7,'东莞：百万年薪招博士人才','1543995432938.jpg','<p style=\"font-size:18px;font-family:&quot;color:#222222;\">\r\n	12月3日，记者从2018东莞高层次人才活动周新闻发布会上获悉，活动周将于本月10日~12日举行。\r\n</p>\r\n<p style=\"font-size:18px;font-family:&quot;color:#222222;\">\r\n	&emsp;&emsp;值得一提的是，今年高层次人才交流洽谈会将开展百名博士党政国企人才计划首场招聘。东莞13家国企提供18个中层副职以上岗位，年薪最高80万元，另外还有100万元的生活补贴。\r\n</p>','2018-12-05 15:37:26','王老大');

/*Table structure for table `sysuser` */

DROP TABLE IF EXISTS `sysuser`;

CREATE TABLE `sysuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sysuser` */

insert  into `sysuser`(`id`,`username`,`userpwd`,`realname`,`sex`,`idcard`,`tel`,`email`,`addr`,`delstatus`,`savetime`,`filename`) values (1,'admin','123456','王老大','男','429000199012120000','13667899876','admin@163.com','湖北武汉东湖高新金地格林东郡1-18-2','0','2018-12-05 12:00:00','1544276294531.jpg'),(2,'root','123','冯涛1','男','429000199012120000','13893784349','root@126.com','湖北省武汉市洪山广场209号','0','2018-12-05 10:35:18','1543977307804.jpg');

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `workid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `vote` */

insert  into `vote`(`id`,`memberid`,`workid`) values (6,4,13),(7,11,12),(8,14,16);

/*Table structure for table `work` */

DROP TABLE IF EXISTS `work`;

CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `xueli` varchar(255) DEFAULT NULL,
  `content` text,
  `salary` varchar(255) DEFAULT NULL,
  `ziwei` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `memberid` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `work` */

insert  into `work`(`id`,`title`,`filename`,`savetime`,`xueli`,`content`,`salary`,`ziwei`,`delstatus`,`memberid`,`name`,`tel`,`pnum`,`vote`) values (10,'诚聘XX地区商务经理','1544163908112.jpg','2018-12-07 14:25:50','本科以上','&nbsp;1、在区域内独立开展销售业务，以区域内大客户为主线、为重点销售； 2、完成所在区域内的具体销售的推动和实施；3、建立健全的区域客户信息管理体系；4、负责本区域大客户销售合同的谈判与签订；5、负责本区域销售数据统计分析和回款管理；6、分解本区域年度工作目标，执行绩效考核奖惩制度；7、完成部门领导交代的其它临时事宜。<br />','8000','主管','0',5,'小薇','13732921234',20,0),(11,'诚聘XX地区java前端技术','1544164129485.jpg','2018-12-07 14:29:23','本科以上',' 1、在区域内独立开展销售业务，以区域内大客户为主线、为重点销售； 2、完成所在区域内的具体销售的推动和实施；3、建立健全的区域客户信息管理体系；4、负责本区域大客户销售合同的谈判与签订；5、负责本区域销售数据统计分析和回款管理；6、分解本区域年度工作目标，执行绩效考核奖惩制度；7、完成部门领导交代的其它临时事宜。<br />','8000','java工程师','0',5,'王经理','13893784349',10,0),(12,'诚聘XX地区.net工程师','1544164301554.jpg','2018-12-07 14:32:34','本科以上','&nbsp;1、在区域内独立开展销售业务，以区域内大客户为主线、为重点销售； 2、完成所在区域内的具体销售的推动和实施；3、建立健全的区域客户信息管理体系；4、负责本区域大客户销售合同的谈判与签订；5、负责本区域销售数据统计分析和回款管理；6、分解本区域年度工作目标，执行绩效考核奖惩制度；7、完成部门领导交代的其它临时事宜。<br />','9000','NET工程师','0',9,'赵经理','13893784348',8,1),(13,'诚聘XX地区行政助理','1544164559093.jpg','2018-12-07 14:36:40','本科以上','&nbsp;1、在区域内独立开展销售业务，以区域内大客户为主线、为重点销售； 2、完成所在区域内的具体销售的推动和实施；3、建立健全的区域客户信息管理体系；4、负责本区域大客户销售合同的谈判与签订；5、负责本区域销售数据统计分析和回款管理；6、分解本区域年度工作目标，执行绩效考核奖惩制度；7、完成部门领导交代的其它临时事宜。<br />','7000','经理1','0',9,'孙经理','13893784377',7,0),(15,'诚聘XX地区服务员','1544276014259.jpg','2018-12-08 21:34:16','中专以上','能吃苦耐劳，有责任心','3000','普通职员','1',9,'孙小梅','13850948512',10,0),(16,'java岗位','1582453953442.jpg','2020-02-23 18:33:10','本科','aaaaaaa','20000','java','0',15,'负责人','15222222222',2,1),(17,'java工程师','1582457281197.jpg','2020-02-23 19:28:28','本科','aaaa','10000','高级','0',19,'李先生','15211111111',2,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

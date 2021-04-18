/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : tom

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2021-03-31 12:17:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- database create
-- ----------------------------

drop database if exists `tom`;

CREATE DATABASE  `tom`;

USE  `tom`;

-- ----------------------------
-- Table structure for mcq
-- ----------------------------
DROP TABLE IF EXISTS `mcq`;
CREATE TABLE `mcq` (
  `mcq_id` int(11) NOT NULL auto_increment,
  `tet` varchar(10) NOT NULL,
  `mcq_name` varchar(6000) NOT NULL,
  `Options1` varchar(4000) NOT NULL,
  `Options2` varchar(4000) NOT NULL,
  `Options3` varchar(4000) NOT NULL,
  `Options4` varchar(4000) NOT NULL,
  `Answer` varchar(10) NOT NULL,
  UNIQUE KEY `mcq_id` (`mcq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of mcq
-- ----------------------------
INSERT INTO `mcq` VALUES ('1', 'java基础题', '那2个数相加等于5？', '1+4', '2+3', '1+1', '2+2', 'AB');
INSERT INTO `mcq` VALUES ('2', 'java基础题', '多少相加等于4？', '1+1', '2+2', '3+3', '1+3', 'BD');
INSERT INTO `mcq` VALUES ('3', 'java基础题', 'java有哪三种？', 'javaEE', 'javaME', 'javaSE', 'javaC', 'ABC');
INSERT INTO `mcq` VALUES ('5', 'java基础题', '以下用于创建容器对象的类是（）', 'Frame', 'Checkbox', 'Panel', 'TextField', 'AC');
INSERT INTO `mcq` VALUES ('6', '英语', '11', '1', '1', '1', '1', 'AB');
INSERT INTO `mcq` VALUES ('10', '英语', '2', '2', '2', '2', '2', 'AB');
INSERT INTO `mcq` VALUES ('12', '英语', '45', '4', '4', '4', '4', 'BC');
INSERT INTO `mcq` VALUES ('13', '英语', '55', '55', '5', '5', '5', 'CD');
INSERT INTO `mcq` VALUES ('14', 'java基础题', '下列哪些是关系型数据库？', 'Order', 'MySQL', 'SQL server', 'redis', 'ABC');

-- ----------------------------
-- Table structure for mcs
-- ----------------------------
DROP TABLE IF EXISTS `mcs`;
CREATE TABLE `mcs` (
  `mcs_id` int(11) NOT NULL auto_increment,
  `tet` varchar(10) NOT NULL,
  `mcs_name` varchar(6000) NOT NULL,
  `Options1` varchar(4000) NOT NULL,
  `Options2` varchar(4000) NOT NULL,
  `Options3` varchar(4000) NOT NULL,
  `Options4` varchar(4000) NOT NULL,
  `Answer` varchar(10) NOT NULL,
  UNIQUE KEY `mcs_id` (`mcs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of mcs
-- ----------------------------
INSERT INTO `mcs` VALUES ('1', 'java基础题', '请问，以下哪些是合法的变量名?请选择一个正确答案:', 'int', '$marie', 'much', '选项A、B均正确', 'D');
INSERT INTO `mcs` VALUES ('2', 'java基础题', '请问，以下哪些是JAVA应用的入口程序main ()的方法正确语法形式?:', 'public static void main(StingD]args)', 'static public void main(String[args)', 'public void main(String args[)', '选项A、B均正确', 'D');
INSERT INTO `mcs` VALUES ('3', 'java基础题', '请问，以下哪些是JAVA应用的入口程序main ()的方法正确语法形式?:', 'public static void main(StingD]args)', 'static public void main(String[args)', 'public void main(String args[)', '选项A、B均正确', 'D');
INSERT INTO `mcs` VALUES ('4', 'java基础题', '请问，以下哪些是字节型数据的的取值范围?请选择一个 正确答案:', '0, +255', '-127..+128', '-128..+127', '0..65535', 'C');
INSERT INTO `mcs` VALUES ('5', 'java基础题', '请问，以下哪些是字节型数据的的取值范围?请选择一个 正确答案:', '0, +255', '-127..+128', '-128..+127', '0..65535', 'C');
INSERT INTO `mcs` VALUES ('6', 'java基础题', '请问，以下哪些是逻辑短路运算符?请选择-一个 正确答案:', '&', '&&', '|', '$', 'B');
INSERT INTO `mcs` VALUES ('7', 'java基础题', '请问，现有- -组 int MyArray[]={1,2,3}拟 下哪些语句用于获取该数组的元素个数?请选择一一个 正确答案:', 'MyArray.size;', 'MyArray siae();', 'MyArray.length;', 'MyArray.length();', 'C');
INSERT INTO `mcs` VALUES ('8', 'java基础题', '请问，如何强制垃圾回收器回收一个对象?请选择一个正确答案:', '调用System.gc0方法', '调用Runtime.gc0方法', '将对象赋值null.', '无法强制垃圾回收器执行。', 'D');
INSERT INTO `mcs` VALUES ('9', 'java基础题', '请问，以下哪些Java源文件中顶层元素出现次序?请选择一个 正确答案:', 'import,package,class.', 'classe import,package.', 'package语句必须位于最前面，import语句和class声明\n之间无次序要求。', 'package, import, class', 'D');
INSERT INTO `mcs` VALUES ('10', 'java基础题', '请问，如何强制垃圾回收器回收一个对象?请选择一个 正确答案:', '无法强制垃圾回收器执行。', '调用System.gc0方法。', '调用System.gcO方法。', '调用Runtime.gcO方法。', 'A');
INSERT INTO `mcs` VALUES ('11', 'java基础题', '请问，以下哪些描述是正确的?请选择一个正确答案:', 'transien方法不能被重载。', 'transien方法必须被重载。', 'transien类不 能被序列化。', 'transien变 量不能被序列化。', 'D');
INSERT INTO `mcs` VALUES ('12', 'java基础题', '下列说法正确的是', 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来', 'A');
INSERT INTO `mcs` VALUES ('13', 'java基础题', '变量命名规范说法正确的是()', '变量由字母、下划线、数字、$符号随意组成', '变量不能以数字作为开头', ' A和a在java中是同一个变量；', '不同类型的变量，可以起相同的名字；', 'B');
INSERT INTO `mcs` VALUES ('14', 'java基础题', '表达式(11+3*8)/4%3的值是()', '31', '0', ' 1', ' 2', 'D');
INSERT INTO `mcs` VALUES ('15', 'java基础题', '下面有关for循环的描述正确的是()', ' for循环体语句中，可以包含多条语句，但要用大括号括起来', ' for循环只能用于循环次数已经确定的情况', ' 在for循环中，不能使用break语句跳出循环', 'for循环是先执行循环体语句，后进行条件判断', 'A');
INSERT INTO `mcs` VALUES ('16', 'java基础题', '下面（）不是String类提供的合法的方法', 'equals(String)', 'trim()', ' append()', ' indexOf()', 'C');
INSERT INTO `mcs` VALUES ('17', 'java基础题', '在Java中,关于构造方法，下列说法错误的是( )', '构造方法的名称必须与类名相同', '构造方法可以带参数', '构造方法不可以重载', ' 构造方法绝对不能有返回值', 'C');
INSERT INTO `mcs` VALUES ('18', 'java基础题', ' 在JAVA中，以下（ ）类的对象以键-值的方式存储对象', ' 一个类可以继承多个父类', ' 一个类可以具有多个子类', ' 子类可以使用父类的所有方法', '子类一定比父类有更多的成员方法', 'B');
INSERT INTO `mcs` VALUES ('19', 'java基础题', '下列选项中关于Java中super关键字的说法正确的是（）', ' super关键字是在子类对象内部指代其父类对象的引用', ' super关键字不仅可以指代子类的直接父类，还可以指代父类的父类', '子类通过super关键字只能调用父类的方法，而不能调用父类的属性', '子类通过super关键字只能调用父类的属性，而不能调用父类的方法', 'A');
INSERT INTO `mcs` VALUES ('20', 'java基础题', ' 在JAVA中，Object类是所有类的父亲，用户自定义类默认扩展自Object类，下列选项中的（）方法不属于Object类的方法', ' equals(Object obj)', ' getClass()', 'toString()', 'trim()', 'D');
INSERT INTO `mcs` VALUES ('21', 'java基础题', '在JAVA的异常处理模型中，能单独和finally语句一起使用的块是（）', 'try', ' catch', ' throw', 'throws', 'A');
INSERT INTO `mcs` VALUES ('22', 'java基础题', '以下关于布局的说法，错误的是（）', 'BorderLayout是边框布局，它是窗体的默认布局', 'null是空布局，它是面板的默认布局', 'FlowLayout是流布局，这种布局将其中的组件按照加入的先后顺序从左向右排列， 一行排满之后就转到下一行继续从左至右排列', 'GridLayout是网格布局，它以矩形网格形式对容器的组件进行布置。容器被分成大小相等的矩形，一个矩形中放置一个组件', 'B');
INSERT INTO `mcs` VALUES ('23', 'java基础题', '以下用于创建容器对象的类是（）（选择两项）', 'Frame', 'Checkbox', 'Panel', 'TextField', 'AC');
INSERT INTO `mcs` VALUES ('24', 'java基础题', '以下关于抽象类和接口的说法错误的是（）', '抽象类在Java语言中表示的是一种继承关系，一个类只能使用一次继承。但是一个类却可以实现多个接口。', '在抽象类中可以没有抽象方法', '实现抽象类和接口的类必须实现其中的所有方法，除非它也是抽象类。接口中的方法都不能被实现', ' 接口中的方法都必须加上public关键字。', 'D');
INSERT INTO `mcs` VALUES ('25', 'java基础题', '关于面向对象的说法正确的是（）', '类可以让我们用程序模拟现实世界中的实体 ', '有多少个实体就要创建多少个类', '对象的行为和属性被封装在类中，外界通过调用类的方法来获得，但是要知道类的内部是如何实现', '现实世界中的某些实体不能用类来描述', 'A');
INSERT INTO `mcs` VALUES ('26', '英语', 'The girl in red is Mary, _____ monitor of Class Four.', '/ ', 'an', ' a', 'the ', 'A');
INSERT INTO `mcs` VALUES ('27', '英语', '.It’s very _nice_____ you to get the tickets ______ the World Cup.', 'for,of', 'of,for', 'of,to', 'to,for', 'C');
INSERT INTO `mcs` VALUES ('28', '英语', 'How many teachers are there in your school?', 'hundred', 'Hundreds', 'Hundreds of', 'Huandreds or thousands', 'B');
INSERT INTO `mcs` VALUES ('29', '英语', 'How many teachers are there in your school?', 'set out', 'set aside', 'set up', 'set off', 'D');
INSERT INTO `mcs` VALUES ('30', '英语', 'The train _________ for twenty minutes.', 'left', ' has left', 'is leaving ', 'has been away', 'D');
INSERT INTO `mcs` VALUES ('31', '英语', 'Which is the way to the __________?', ' shoe factory ', 'shoes factory ', 'shoe’s factory ', 'shoes’ factory', 'A');
INSERT INTO `mcs` VALUES ('32', '英语', 'This class ________ now. Miss Gao teaches them.', 'are studying', 'is studying ', 'be studying ', 'studying', 'A');
INSERT INTO `mcs` VALUES ('33', '英语', 'We will have a _________ holiday after the exam.', 'two month', 'two-month ', 'two month’s ', 'two-months', 'B');
INSERT INTO `mcs` VALUES ('34', '英语', 'There is no enough ________ on the corner to put the table.', ' place ', ' room ', 'floor', 'ground', 'B');
INSERT INTO `mcs` VALUES ('35', '英语', 'We can have _____ blue sky if we create _____ less polluted world.', ' a; a ', ' a; the', 'the; a ', 'the; the', 'A');
INSERT INTO `mcs` VALUES ('36', '英语', 'Are you ________ American or English? ', 'a ', ' \\ ', 'the ', ' an', 'B');
INSERT INTO `mcs` VALUES ('37', '英语', 'You like playing basketball, and he likes running, _______?', 'don’t you ', 'doesn’t he ', 'do you', ' does he', 'B');
INSERT INTO `mcs` VALUES ('38', '英语', 'Why not take ____ umbrella with the sign \" Made in China\"? It is _____ useful umbrella.What _______ good advice it is!', ' an; an; a ', 'an; a; \\ ', ' a; an; a ', ' \\; an; a', 'B');
INSERT INTO `mcs` VALUES ('39', '英语', 'Robert has gone to ____ city and he’ll be back in a week.', ' other ', 'the other ', 'another ', ' any other', 'C');
INSERT INTO `mcs` VALUES ('40', '英语', 'Mrs. Lee teaches ________ math. We all like her.', 'we ', ' us ', 'our ', 'ours', 'B');
INSERT INTO `mcs` VALUES ('41', '英语', 'There are many trees on ________ side of the street.', ' either ', ' any ', 'all ', 'both', 'A');
INSERT INTO `mcs` VALUES ('42', '英语', '________ is the population of the city?', 'How many ', ' What ', 'How many people ', 'How much', 'B');
INSERT INTO `mcs` VALUES ('43', '英语', 'The teacher asked the boy many questions,but he only answered___ of them.', 'some ', 'lots ', 'each ', 'few', 'A');
INSERT INTO `mcs` VALUES ('44', '英语', 'About ______ the fans are waiting here. They want to see the great singer.', 'two thousand of ', 'two thousand ', '.thousand of ', '.two thousands of', 'A');
INSERT INTO `mcs` VALUES ('45', '英语', 'You can have ______. I want none of them.', 'one ', ' all ', 'both', 'some', 'B');
INSERT INTO `mcs` VALUES ('46', '英语', 'Japan is ________ the east of China. Taiwan is ____ the southeast of China', ' in; in', ' to; in', ' on ; to ', ' in; to', 'B');
INSERT INTO `mcs` VALUES ('47', '英语', 'The postman shouted, \" Mr Green, here is a letter ________ you.\"', 'to ', ' from ', 'for ', ' of', 'C');
INSERT INTO `mcs` VALUES ('48', '英语', 'He hasn’t heard from his friend __________ last month.', 'since ', 'by the end of ', ' for ', 'until', 'A');
INSERT INTO `mcs` VALUES ('49', '英语', 'You’ve passed the exam. I’m happy ______ you.', 'on ', ' at ', 'in ', 'for', 'D');
INSERT INTO `mcs` VALUES ('50', '英语', 'I wonder ________ they finished so many different jobs in such a short time。', ' why ', 'how', 'when ', 'where', 'B');
INSERT INTO `mcs` VALUES ('51', '英语', '.It was very hot yesterday, but it is___ today.', 'even hotter', 'more hotter', ' much more hot ', 'much hot', 'B');
INSERT INTO `mcs` VALUES ('52', '英语', ' ____ of her parents are looking after her.', 'None', 'Neither', 'All', 'Both', 'D');
INSERT INTO `mcs` VALUES ('53', '英语', '____ of my friends has been to Canada.', 'Every ', 'Everyone ', 'Neither', 'All', 'D');
INSERT INTO `mcs` VALUES ('54', '英语', 'You had better _____here. We are going to have a meeting.', 'not stay ', 'not to stay ', 'to not stay', 'stay not', 'A');
INSERT INTO `mcs` VALUES ('55', '英语', ' Will you please ______me some snacks?', 'bringing', 'bring', 'brings', 'to bring', 'B');
INSERT INTO `mcs` VALUES ('56', '英语', 'If you often practise _____ English, your English will be better and better.', 'speak', 'to speak', 'speaks', 'speaking', 'D');
INSERT INTO `mcs` VALUES ('57', '英语', 'The sun is shining. _________ fine day it is!', 'How ', 'How much', 'What', 'What a', 'D');
INSERT INTO `mcs` VALUES ('58', '英语', 'You _____come here early tomorrow.', 'don’t need', 'need', 'don’t need to', 'won’t need', 'C');
INSERT INTO `mcs` VALUES ('59', '英语', ' It was_____ interesting story that I finished it in one night.', 'such', 'such an', 'so', 'so an', 'B');
INSERT INTO `mcs` VALUES ('60', '英语', 'There is ______ rain this year than last year.', 'much', 'plenty', 'more', 'plenty of', 'C');
INSERT INTO `mcs` VALUES ('62', '英语', '1', '1', '1', '1', '1', 'A');
INSERT INTO `mcs` VALUES ('63', 'java基础题', '1+1=？', '1', '2', '3', '4', 'B');
INSERT INTO `mcs` VALUES ('64', '数学', '1+1=？', '1', '3', '2', '4', 'C');
INSERT INTO `mcs` VALUES ('65', 'java基础题', '1+2=？', '1', '2', '3', '4', 'B');
INSERT INTO `mcs` VALUES ('66', '数学', '1+2=？', '1', '2', '3', '4', 'C');

-- ----------------------------
-- Table structure for pwps
-- ----------------------------
DROP TABLE IF EXISTS `pwps`;
CREATE TABLE `pwps` (
  `pwps_id` int(11) NOT NULL auto_increment,
  `results_id` int(11) NOT NULL,
  `wps_id` int(11) NOT NULL,
  `Answers` varchar(4000) NOT NULL,
  `Tf` varchar(20) NOT NULL,
  UNIQUE KEY `pwps_id` (`pwps_id`),
  KEY `wps_id` (`wps_id`),
  KEY `results_id` (`results_id`),
  CONSTRAINT `pwps_ibfk_1` FOREIGN KEY (`wps_id`) REFERENCES `wps` (`wps_id`),
  CONSTRAINT `pwps_ibfk_2` FOREIGN KEY (`results_id`) REFERENCES `results` (`results_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of pwps
-- ----------------------------
INSERT INTO `pwps` VALUES ('27', '14', '4', '', 'true');
INSERT INTO `pwps` VALUES ('28', '14', '2', '', 'true');
INSERT INTO `pwps` VALUES ('33', '17', '5', '', 'true');
INSERT INTO `pwps` VALUES ('34', '17', '3', '', 'true');
INSERT INTO `pwps` VALUES ('35', '18', '2', '', '0');
INSERT INTO `pwps` VALUES ('36', '18', '7', '', '0');
INSERT INTO `pwps` VALUES ('37', '19', '7', 'aaaa', 'true');
INSERT INTO `pwps` VALUES ('38', '19', '3', '', 'true');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `results_id` int(11) NOT NULL auto_increment,
  `Student_id` int(11) NOT NULL,
  `tet` varchar(10) NOT NULL,
  `mcs` int(11) NOT NULL,
  `mcq` int(11) NOT NULL,
  `wps` int(11) default '0',
  `tg` int(11) default NULL,
  `Pwps` int(11) NOT NULL,
  `testTime` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`results_id`),
  KEY `Student_id` (`Student_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES ('14', '3', 'java基础题', '0', '0', '20', '20', '0', '2020-12-19 15:46:19');
INSERT INTO `results` VALUES ('17', '1', 'java基础题', '4', '4', '20', '28', '0', '2020-12-21 14:08:29');
INSERT INTO `results` VALUES ('18', '1', 'java基础题', '0', '0', '0', null, '2', '2021-01-18 15:33:31');
INSERT INTO `results` VALUES ('19', '8', 'java基础题', '2', '0', '20', '22', '0', '2021-03-16 09:15:39');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL auto_increment,
  `student_class` varchar(50) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', '318', 'aaa', 'aaa', 'aaa');
INSERT INTO `students` VALUES ('3', '318', 'ccc', 'ccc', 'ccc');
INSERT INTO `students` VALUES ('4', '320', 'ddd', 'ddd', 'ddd');
INSERT INTO `students` VALUES ('5', '317', 'eee', 'eee', 'eee');
INSERT INTO `students` VALUES ('7', '18353', '张三', 'zs', '123');
INSERT INTO `students` VALUES ('8', '18353', '李四', 'ls', '123');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `Teacher_id` int(11) NOT NULL auto_increment,
  `Teacher_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`Teacher_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('3', 'aaa', 'aaa', 'aaa');
INSERT INTO `teachers` VALUES ('5', '管理员', 'admin', 'admin');
INSERT INTO `teachers` VALUES ('8', 'mmm', 'mmm', 'mmm');
INSERT INTO `teachers` VALUES ('9', 'hhh', 'hhh', 'hhh');

-- ----------------------------
-- Table structure for wps
-- ----------------------------
DROP TABLE IF EXISTS `wps`;
CREATE TABLE `wps` (
  `wps_id` int(11) NOT NULL auto_increment,
  `tet` varchar(10) NOT NULL,
  `wps_name` varchar(6000) NOT NULL,
  `answer` varchar(4000) NOT NULL,
  PRIMARY KEY  (`wps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wps
-- ----------------------------
INSERT INTO `wps` VALUES ('1', 'java基础题', 'hashcode相等的两个类一定相等吗？equals呢？相反呢？', '1.equal()相等的两个对象他们的hashCode()肯定相等，也就是用equal()对比是绝对可靠的。 ');
INSERT INTO `wps` VALUES ('2', 'java基础题', 'hashmap与treemap的区别，底层数据结构是什么样的？', 'HashMap底层就是一个数组，数组中根据存入的Key的HashCode决定存放位置，其Entry单元中有四个属性，分别为HashCode，Key，Vaule，和下一个Entry，这样就形成了一个链表，当HashMap中的另一个拥有相同的HashCode值的不同的Key存入时，会将原来的Entry赋到新Entry的属性中，然后形成Entry链，查询的时候先比较HashCode，如果相同且Key值相同则直接取出，如果HashCode相同Key值不同则继续顺着链表寻找直到寻找到相同的Key值。 ');
INSERT INTO `wps` VALUES ('3', 'java基础题', 'cas知道么？如何实现的？', 'CAS全称Compare and swap 意思为比较和互换，使用一个期望值和一个变量的当前值进行比较，如果当前变量的值与我们期望的值相等，就使用一个新值替换当前变量的值（比如 锁模式）。需要注意的一点是：CAS必须保证自己操作的原子性（可以使用synchronized确保原子性）。');
INSERT INTO `wps` VALUES ('4', 'java基础题', '用4个写法写一个单例', '四种写法：懒汉 饿汉 sychnized方法饿汉 sychnized代码块饿汉 双层判断sychnized饿汉 枚举 ');
INSERT INTO `wps` VALUES ('5', 'java基础题', 'spring机制，AOP和IOC的底层实现。', '简而言之IOC依赖注入，就是单例模式。底层就是一个spring的注册中心一样的东西，无论是xml配置还是注解的方式都会将其读取生成beandefinition，获取时有两种方式，一种是在注册时就创建单例，还有一种是第一次调用时。（当然也可以选择多例模式） ');
INSERT INTO `wps` VALUES ('6', 'java基础题', 'cglib和jdk动态代理的区别，写一个动态代理。', 'dk的动态代理需要基于接口，他是在程序运行时通过继承原有类的接口封装原有类的方法和切入逻辑生成一个代理类进行处理。必须要有接口。 ');
INSERT INTO `wps` VALUES ('7', 'java基础题', '类加载机制，都有哪些类加载器，这些加载器加载哪些文件？手写一下类加载器demo。', '核心库的类：加载是由原生代码实现的 不是继承ClassLoader的类。如rt.jar ');
INSERT INTO `wps` VALUES ('8', '英语', '老师进教bai室时，学生们在干什么呢？', 'What were the students doing when the teacher came into the classroom.');
INSERT INTO `wps` VALUES ('9', '英语', '吉姆正在墙上画马吗？是的，那是一匹相当不错的马。', 'Is Jim drawing a horse on the wall?');
INSERT INTO `wps` VALUES ('10', '英语', '你在干什么呢？ 我在试图修好自行车。', 'What are you doing now?-I’m trying to mend my bike.');
INSERT INTO `wps` VALUES ('11', '英语', '将来我想成为一名艺术家', 'I want to be a artist in the furure.');
INSERT INTO `wps` VALUES ('12', '英语', '我们对他很反感', 'We have had enough of him.');
INSERT INTO `wps` VALUES ('13', '英语', '我一看完，就把书还给你。', 'I’ll lend the book to you as soon as I finish reading it.');
INSERT INTO `wps` VALUES ('14', '英语', '进来之前他总是敲门。', 'He always knocked at the door before he comes in.');
INSERT INTO `wps` VALUES ('15', '英语', '他想跟我借些钱。', 'He wanted to borrow some money from me.');
INSERT INTO `wps` VALUES ('16', '英语', '这把剪刀不便宜。', 'This pair of Scissors is not cheap.');
INSERT INTO `wps` VALUES ('17', '英语', '上星期天我去看我奶奶了。', 'Last Sunday I went to see my grandma.');
INSERT INTO `wps` VALUES ('18', '英语', '1', '1');

/*
 Navicat MySQL Data Transfer

 Source Server         : db_film
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : db_film

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 20/04/2024 15:47:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员联系电话',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '出生年月日',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员头像',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin', '男', '13118211219', '2001-12-19', '/images/admin/admin.jpg');

-- ----------------------------
-- Table structure for t_cinema
-- ----------------------------
DROP TABLE IF EXISTS `t_cinema`;
CREATE TABLE `t_cinema`  (
  `cinema_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `cinema_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院名称',
  `cinema_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院电话',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在区县',
  `specified_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院详细地址',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cinema
-- ----------------------------
INSERT INTO `t_cinema` VALUES (1, '中国电影博物馆', '13498471122', '北京', '北京', '', '北京市电影博物馆');
INSERT INTO `t_cinema` VALUES (2, '万达影院', '13711223344', '天津', '天津', '', '万达');
INSERT INTO `t_cinema` VALUES (3, '大吉利影院', '13409989898', '天津', '天津', '', '大吉利');
INSERT INTO `t_cinema` VALUES (4, '天津工业大学电影院', '13422334455', '天津', '天津', '', '天津工业大学');
INSERT INTO `t_cinema` VALUES (5, '中国电影资料馆', '13118211219', '北京', '北京', NULL, '小西天');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `user_score` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户评分',
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '用户评论内容',
  `comment_date` datetime(6) NULL DEFAULT NULL COMMENT '评论日期',
  `support_num` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数',
  `is_pass` int(1) NULL DEFAULT 0 COMMENT '评论是否通过审核',
  `support_user` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '点赞用户数组',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `t_comment_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_comment_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 2, 9, 10, '烟花与海边剪影 烛光与火中长廊', '2024-03-31 15:25:27.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (2, 2, 10, 10, '几处幽默特别出彩，最后的悬念抓人，特别最后黑屏后几声，精彩', '2024-04-01 16:36:24.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (3, 2, 15, 9, 'sss', '2024-04-07 10:05:42.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (4, 3, 15, 8, '好看', '2024-04-15 13:08:19.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (5, 3, 6, 10, '最好的电影', '2024-04-15 13:33:31.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (6, 3, 19, 7, '111', '2024-04-15 13:35:21.000000', 0, 0, NULL);

-- ----------------------------
-- Table structure for t_hall
-- ----------------------------
DROP TABLE IF EXISTS `t_hall`;
CREATE TABLE `t_hall`  (
  `hall_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名称',
  PRIMARY KEY (`hall_id`) USING BTREE,
  INDEX `t_hall_ibfk_1`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hall
-- ----------------------------
INSERT INTO `t_hall` VALUES (1, 1, '1号激光厅');
INSERT INTO `t_hall` VALUES (2, 2, '1号激光厅');
INSERT INTO `t_hall` VALUES (3, 3, '1号激光厅');
INSERT INTO `t_hall` VALUES (4, 4, '1号激光厅');
INSERT INTO `t_hall` VALUES (5, 4, '2号激光厅');
INSERT INTO `t_hall` VALUES (6, 1, 'IMAX GT');
INSERT INTO `t_hall` VALUES (7, 5, '一号厅');
INSERT INTO `t_hall` VALUES (8, 5, 'imax厅');

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie`  (
  `movie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影名称',
  `poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影海报',
  `director` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导演',
  `actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主演',
  `movie_long` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影片长',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影语言版本',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '电影简介',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影类型',
  `public_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影上映时间',
  `wish_num` int(4) UNSIGNED NULL DEFAULT 0 COMMENT '想看人数',
  `score` decimal(4, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES (6, '爱乐之城', '/images/movie/1713158034346.jpg', '查泽雷', '石头姐', '120分钟', '英语', 'no.1', '爱情', '2024-5-20', 0, 10.0);
INSERT INTO `t_movie` VALUES (7, '末路狂花', '/images/movie/1711613002918.jpg', '雷德利斯科特', '小美', '130分钟', '英语', '该片被认为是向男权社会发出抗争的女性主义电影代表作。\n　　生活在沉闷与琐碎家务中的家庭主妇赛尔玛（Geena Davis）与在某间咖啡厅做女侍应生的闺中密友路易丝（Susan Sarandon）对平凡的生活与工作产生厌倦后，结伴一起外出旅游散心。路上，在某家酒吧外的停车厂， 赛尔玛险遭无名男子强暴，幸好路易丝及时赶到，拔枪将该男子射杀。惊慌失措的两人掉头逃亡，自此踏上不归路，过程中两人性格均有了很重大的改变。', '剧情', '2024-8-1', 1, 8.0);
INSERT INTO `t_movie` VALUES (8, '断背山', '/images/movie/1711614182160.jpg', '李安', '希斯莱杰', '96分钟', '英语', '美国怀俄明州的西部，沉默寡言的农夫恩尼斯（希斯•莱杰饰）和热情开朗的牛仔杰克（杰克•吉伦希尔饰)一道被派到山上牧羊，那里人迹罕至，他们只有与羊群为伴，生活单调无味。一个天寒地冻的夜晚，在酒精与荷尔蒙的作用下，他们做了“不该做的事情”，也就此他们在断背山上度过了人生中最美好的时光。\n　　季节性放牧结束，迫于世俗压力，杰克和恩尼斯不舍地与对方分离并各自结婚生子。恩尼斯迎娶了自幼相识的阿尔玛，并有了两个可爱的女儿；杰克到了德州，在妻子露琳家族的扶植下事业顺利，还有了个儿子。虽然彼此真心相应，他们只能每年定期约会。一边知情的阿尔玛痛苦无比，而他们又无法满足一年只有几天的团聚。这时意外发生……', '爱情', '2024-9-9', 2, NULL);
INSERT INTO `t_movie` VALUES (9, '新桥恋人', '/images/movie/1711614356196.jpg', '卡拉克斯', '朱丽叶比诺什', '125分钟', '其它', '米歇尔（朱丽叶·比诺什 Juliette Binoche 饰）是个富家女，心里却并不幸福。她失恋，患上眼疾，情绪低落之下决定到外面的世界去流浪。她喜欢画画，在街头遇到断了腿的埃里克斯（德尼·拉旺 Denis Lavant 饰），画下了他抽搐的脸。克劳斯是个一无所有的流浪汉，却爱上了米歇尔。两人开始了热恋，流浪中互相取暖互相疗伤。米歇尔的视力慢慢模糊，她的心愿是在失明前看看博物馆的画。满街都贴着米歇尔家人的寻人启事，埃里克斯感到米歇尔即将离他而去，悲伤不已。他用枪打碎自己的手指以宣泄痛苦，疯狂的烧掉寻人通知，却没有留得住一段即将幻灭的感情。然而，米歇尔最后还是提出分手，重新回到她原来生活的世界。后来米希尔终于在飘雪的圣诞夜跟埃里克斯在烟花灿烂的塞纳河上重逢', '爱情', '2024-10-1', 2, 10.0);
INSERT INTO `t_movie` VALUES (10, '大佛普拉斯', '/images/movie/1711644052214.jpg', '黄信尧', '庄增益', '102分钟', '国语', '菜埔（庄益增 饰）是一家雕塑厂的夜间保安，家中有一位重病的老母亲需要照顾。肚财（陈竹昇 饰）是菜埔唯一的朋友，菜埔经常在值夜班的时候把肚财叫过来和他作伴。一天，两人突发奇想决定看一看菜埔的老板黄启文（戴立忍 饰）的行车记录仪里记录了哪些影像，希望向来风流的老板能够贡献出一些精彩的片段以解两个独身男人内心里的寂寞之苦。\n　　行车记录仪所记录的影像果然没有让菜埔和肚财失望，但与此同时，两人也发现了黄启文的许多不可告人的秘密。实际上，菜埔和肚财的一举一动皆没有逃过黄启文的眼睛，为了保住自己的地位和名声，他决定采取一些必要的行动', '剧情', '2024-3-24', 1, 10.0);
INSERT INTO `t_movie` VALUES (11, '本杰明巴顿奇事', '/images/movie/1711644288174.jpg', '大卫芬奇', '布拉德·皮特', '166分钟', '英语', '飓风正在侵袭美国新奥尔良，一位病危的老妇睁开了她的睡眼。老妇名叫戴茜（凯特·布兰切特饰），她叫女儿凯若琳（朱莉娅•奥蒙德饰）为她阅读一本日记。这本日记的作者叫本杰明•巴顿（布拉德•皮特饰）。本杰明出生在第一次世界大战停战之时，但生来便像个老人的他被父亲当作怪物，被遗弃在了养老院。本杰明在养老院与老人们一起生活。但谁都没有想到，本杰明逆向发育——越活越年轻！也许“越活越年轻”是某些人的梦想，但真正这样成长的本杰明却有了别人无法理解的烦恼与快乐。穿越半世纪的世界变革，本杰明身处其中，感受别人感受不到的感受。\n　　为何母亲会让自己念这本日记？本杰明•巴顿此人与母亲有什么关系？凯若琳陷入了深深的疑惑与好奇之中。', '剧情', '2024-12-12', 0, NULL);
INSERT INTO `t_movie` VALUES (12, '七武士', '/images/movie/1711644199055.jpg', '黑泽明', '三船敏郎', '207分钟', '日语', '日本战国时代，一小山村面临着山贼的威胁，为了保护秋天的收成，村中长老决定让去请武士来保护村子安全，但只能拿出的报酬是一天三顿的白米饭。在城里，他们遭到了武士白眼甚至被打。直到勘兵卫（志村乔饰）的出现，他现今已沦为浪人，几经考虑最后答应了。他对农民说至少需要七名武士，于是久藏（宫口精二饰）、胜四郎（木村功饰）、五郎（稻叶义男饰）、七郎（加东大介饰）、平八（千秋实饰）和菊千代（三船敏郎饰）等六人也加入了队伍，七个人肩负保卫村子的任务。\n　　整个防御准备的过程中，武士与农民间发生许多摩擦也闹出不少笑话。而在一次偷袭行动中，有武士为救农民被火枪打死，很快山贼的反扑随之而来，一场恶战即将开始', '剧情', '2024-11-12', 2, 0.0);
INSERT INTO `t_movie` VALUES (13, '复仇者联盟4', '/images/movie/7.jpg', '乔·罗素', '小罗伯特·唐尼', '181分钟', '英语', '改编自漫威漫画，也是漫威电影宇宙第22部影片。复仇者联盟的一众超级英雄，必须抱着牺牲一切的信念，与史上最强大反派灭霸殊死一搏，阻止其摧毁宇宙的邪恶计划。', '动作', '2024-4-20', 3, 0.0);
INSERT INTO `t_movie` VALUES (14, '雪豹', '/images/movie/1711645124351.jpg', '万玛才旦', '金巴', '109分钟', '其它', '这是一部关于人跟动物最终如何相处的故事。一只雪豹闯进了一家牧民的羊圈，咬死了九只羯羊。因此，牧民父子争执不下。儿子坚持要打死这只豹子，父亲却要执意放了雪豹', '剧情', '2024-8-1', 0, NULL);
INSERT INTO `t_movie` VALUES (15, '红色天空', '/images/movie/1711645133495.jpg', '克里斯蒂安·佩措尔德', '葆拉·贝尔', '103分钟', '其它', '一个炎热、干燥的夏日，如同过去几年一般。森林火灾是无法控制的。四个年轻人在离阿伦斯霍普不远的波罗的海度假屋里相遇。慢慢地，不知不觉中，他们被火焰筑成的围墙所包围。红色的天空笼罩着他们。他们充满怀疑，他们满是害怕——但却不是因为火灾。是爱让他们害怕：“谁会在坠入爱河时死去 ……！”他们越来越亲近，他们渴望着，他们相爱着。然而熊熊火焰已无限逼近', '剧情', '2024-4-4', 1, 8.5);
INSERT INTO `t_movie` VALUES (16, '坠落的审判', '/images/movie/1711645142771.jpg', '茹斯汀·特里耶', '桑德拉·惠勒', '151分钟', '英语', '桑德拉（桑德拉·惠勒 Sandra Hüller 饰）、萨穆埃尔（塞缪尔·泰斯 Samuel Theis 饰）以及他们视力有障碍的儿子丹尼尔（米洛·马查多·格拉纳 Milo Machado Graner 饰）在偏远山区生活了一年。一天，萨穆埃尔在房子外面被发现死亡，警方立即展开了涉嫌命案的调查。在不确定的情况下，桑德拉被控：这是自杀还是谋杀？一年后，丹尼尔参加了母亲的审判，这也是对他父母关系的真正剖析', '悬疑', '2024-7-16', 0, NULL);
INSERT INTO `t_movie` VALUES (17, '绿皮书', '/images/movie/hot7.jpg', '皮特·法雷里', '维果·莫腾森', '130分钟', '英语', '一名黑人钢琴家，为前往种族歧视严重的南方巡演，找了一个粗暴的白人混混做司机。在一路开车南下的过程里，截然不同的两人矛盾不断，引发了不少争吵和笑料。但又在彼此最需要的时候，一起共渡难关。行程临近结束，两人也慢慢放下了偏见...... 绿皮书，是一本专为黑人而设的旅行指南，标注了各城市中允许黑人进入的旅店、餐馆。电影由真实故事改编。', '剧情', '2029-3-1', 1, 0.0);
INSERT INTO `t_movie` VALUES (18, '守望者', '/images/movie/1711645153302.jpg', '扎克·施奈德', '玛琳·阿克曼', '215分钟', '英语', '由于邪恶势力肆意蔓延，一群具有超群实力的正义之士挺身而出，他们戴着面具，身着奇装异服，与各种坏蛋展开较量。不久，他们的英雄事迹通过媒体传遍全国，美元钞票、丝绸鬼魂、罗夏、城市队长等超级英雄的名字广为传播，他们更参与到大大小小的重大事件之中，也因各自的性格遭受着不同的命运。但是在20世纪70年代，政府出台的法令导致一部分不愿成为权贵爪牙的英雄退休，超级英雄集团由此分化。\n　　1985年的一天，效力政府的超级英雄“喜剧演员”爱德华·布莱克（杰弗里·迪恩·摩根 Jeffrey Dean Morgan 饰）被人杀害。四处逃亡的“罗夏”的沃尔特·科瓦奇（杰基·厄尔·哈利 Jackie Earle Haley 饰）意识到有人正向曾经的超级英雄痛下杀手，而这背后隐藏着更大的阴谋……', '动作', '2024-3-30', 0, NULL);
INSERT INTO `t_movie` VALUES (19, '偶然与想象', '/images/movie/1711645162129.jpg', '滨口龙介', '古川琴音', '121分钟', '日语', '影片由三个短片构成——《魔法（比魔法更不真切）》《开着的门》《再来一次》。女性角色的多重性和镜像性是滨口之前的作品中的主题，在他的新作《偶然与想象》中也是如此。前作《欢乐时光》和《夜以继日》，从字面上看，颇有小说的味道，而《偶然与想象》则可以说是一部短篇小说集。叙事节奏 更强化了这一印象：三集，每集围绕一个女性角色展开，又分为三幕。三个短片讲述了一个意想不到的三角恋、一场未遂的诱惑和一个因误会而相遇的故事。尽管零散，但仍保持了有机的叙事流程，甚至还强调了这一点。虽然大部分的动作都发生在一个空间里，而且只有两个演员参与，这部电影却不让人觉得像一出室内剧。这不仅仅是由于对话的缘故，还在于其复杂的时空概念，最后一集几乎变成了科幻片。我们所见证的时刻都与感人的普遍命运相连，以选择、遗憾、欺骗和巧合为标志，它们是影片真正的主角', '剧情', '2024-4-2', 0, 0.0);
INSERT INTO `t_movie` VALUES (20, '亲切的金子 친절한 금자씨', '/images/movie/1711645171637.jpg', '朴赞郁', '李英爱', '115分钟', '其它', '金子（李英爱饰）20岁时，就因被控“诱拐儿童”入狱而成为头条新闻，人们惊诧于她的美貌、她的年轻。\n　　在13年的牢狱生活中，有着天使般容貌的她是狱中绝对的模范。金子尽心尽力地帮助身边的每一个人，因此狱友们都称她为“亲切的金子”。表面上金子似乎比谁都诚实守纪，但内心里的复仇火焰一天也没有熄灭。\n　　当金子出狱后，她还是马上展开复仇计划——它已经暗中策划准备了13年之久的，而狱友们也都在不同的地方帮助着她。\n　　金子的仇人是当年让她入狱的白老师（崔岷植饰），那是什么让他们在13年前结怨呢？金子又将怎样复仇呢？能否成功？', '剧情', '2024-4-6', 2, 0.0);
INSERT INTO `t_movie` VALUES (33, '罗马', '/images/movie/1711546669575.jpg', '阿方索卡隆', '李四', '1200分钟', '其它', '嘻嘻嘻嘻嘻', '剧情', '2029-5-23', 1, 0.0);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `schedule_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `order_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下单手机',
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户下单时间',
  `ticket_num` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '购买电影票数',
  `ticket_total_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '电影票单价',
  `order_seat_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '座位信息',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `phone_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机取票码',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `t_order_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_order_ibfk_2`(`schedule_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `t_schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 2, 92, '13118211219', '2024-3-28', 1, 89.00, '[16]', '1', '753127');
INSERT INTO `t_order` VALUES (2, 2, 68, '13118211219', '2024-3-30', 4, 136.00, '[15,25,45,47]', '0', '842152');
INSERT INTO `t_order` VALUES (3, 2, 68, '13118211219', '2024-3-30', 3, 102.00, '[26,36,35]', '1', '384111');
INSERT INTO `t_order` VALUES (4, 3, 68, '13808269558', '2024-4-15', 1, 34.00, '[46]', '0', '935659');

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule`  (
  `schedule_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '排片id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `hall_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名字',
  `show_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映日期',
  `show_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '电影售价',
  `seat_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '座位信息',
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `hall_id`(`hall_name`) USING BTREE,
  INDEX `t_schedule_ibfk_1`(`movie_id`) USING BTREE,
  INDEX `t_schedule_ibfk_2`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES (50, 20, 4, '1号激光厅', '2028-5-22', '20:05', 56.00, '[]');
INSERT INTO `t_schedule` VALUES (54, 16, 3, '1号激光厅', '2028-7-10', '20:05', 44.00, '[]');
INSERT INTO `t_schedule` VALUES (68, 15, 1, '1号激光厅', '2029-7-21', '16:05', 34.00, '[15,25,45,47,26,36,35,46]');
INSERT INTO `t_schedule` VALUES (70, 20, 4, '1号激光厅', '2029-5-24', '16:05', 56.00, '[]');
INSERT INTO `t_schedule` VALUES (78, 13, 2, '1号激光厅', '2029-6-30', '20:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (82, 16, 1, '1号激光厅', '2029-7-21', '20:05', 65.00, '[]');
INSERT INTO `t_schedule` VALUES (83, 18, 2, '1号激光厅', '2029-7-30', '12:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (90, 10, 2, '1号激光厅', '2029-11-30', '12:05', 56.00, NULL);
INSERT INTO `t_schedule` VALUES (91, 18, 4, '2号激光厅', '2029-7-25', '20:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (92, 7, 1, '1号激光厅', '2029-8-31', '16:05', 89.00, '[27,16]');
INSERT INTO `t_schedule` VALUES (94, 9, 2, '1号激光厅', '2029-7-30', '16:05', 45.00, '[]');
INSERT INTO `t_schedule` VALUES (102, 10, 1, 'IMAX GT', '2024-3-31', '20:05', 100.00, NULL);
INSERT INTO `t_schedule` VALUES (103, 8, 1, 'IMAX GT', '2024-9-10', '20:05', 100.00, NULL);
INSERT INTO `t_schedule` VALUES (104, 10, 4, '2号激光厅', '2024-3-31', '16:05', 123.00, NULL);
INSERT INTO `t_schedule` VALUES (105, 11, 2, '1号激光厅', '2025-3-6', '08:05', 333.00, NULL);
INSERT INTO `t_schedule` VALUES (106, 19, 1, '1号激光厅', '2025-3-1', '12:05', 11.00, NULL);
INSERT INTO `t_schedule` VALUES (107, 33, 3, '1号激光厅', '2030-3-1', '12:05', 4.00, NULL);
INSERT INTO `t_schedule` VALUES (108, 14, 5, '一号厅', '2024-8-2', '20:05', 33.00, NULL);
INSERT INTO `t_schedule` VALUES (109, 19, 3, '1号激光厅', '2024-4-16', '16:05', 22.00, NULL);
INSERT INTO `t_schedule` VALUES (110, 6, 1, 'IMAX GT', '2024-5-31', '08:05', 22.00, NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户出生年月日',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户签名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'ly_jr', '/images/avatar/1711541315835.jpg', '123456', '16629264703', '男', '2023-3-30', 'test');
INSERT INTO `t_user` VALUES (2, '刘源0333', '/images/avatar/1711541972326.jpg', '123456', '13118211219', NULL, '2001-12-19', 'test');
INSERT INTO `t_user` VALUES (3, 'lhy', '/images/avatar/monkey.png', '1', '13808269558', '男', '2024-4-14', NULL);
INSERT INTO `t_user` VALUES (4, '15308044093', '/images/avatar/monkey.png', '123456', '15308044093', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_wishmovie
-- ----------------------------
DROP TABLE IF EXISTS `t_wishmovie`;
CREATE TABLE `t_wishmovie`  (
  `wishMovie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '想看电影id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  PRIMARY KEY (`wishMovie_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_wishmovie_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_wishmovie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wishmovie
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

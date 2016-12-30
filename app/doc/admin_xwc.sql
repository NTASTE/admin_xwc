-- phpMyAdmin SQL Dump
-- version 4.4.15.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-12-30 18:26:02
-- 服务器版本： 5.6.29-log
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_xwc`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与用户关联表';

--
-- 转存表中的数据 `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1483065650),
('author', '1', 1483065650),
('author', '7', 1476066412),
('author', '8', 1483088188),
('author', '9', 1483088785);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与权限表';

--
-- 转存表中的数据 `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, '管理员', NULL, NULL, 1470205381, 1470205381),
('article/create', 2, '文章添加', NULL, NULL, NULL, NULL),
('article/del', 2, '文章删除', NULL, NULL, NULL, NULL),
('article/edit', 2, '文章编辑', NULL, NULL, NULL, NULL),
('article/list', 2, '文章列表', NULL, NULL, NULL, NULL),
('author', 1, '编辑', NULL, NULL, 1470205381, 1470205381),
('rabc/rcreate', 2, '角色添加', NULL, NULL, NULL, NULL),
('rabc/rdel', 2, '角色删除', NULL, NULL, NULL, NULL),
('rabc/redit', 2, '角色编辑', NULL, NULL, NULL, NULL),
('rabc/rescreate', 2, '资源添加', NULL, NULL, NULL, NULL),
('rabc/resdel', 2, '资源删除', NULL, NULL, NULL, NULL),
('rabc/resedit', 2, '资源编辑', NULL, NULL, NULL, NULL),
('rabc/reslist', 2, '资源列表', NULL, NULL, NULL, NULL),
('rabc/rlist', 2, '角色列表', NULL, NULL, NULL, NULL),
('rabc/ucreate', 2, '用户添加', NULL, NULL, NULL, NULL),
('rabc/udel', 2, '用户删除', NULL, NULL, NULL, NULL),
('rabc/uedit', 2, '用户编辑', NULL, NULL, NULL, NULL),
('rabc/ulist', 2, '用户列表', NULL, NULL, NULL, NULL),
('site/index', 2, '概述', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'article/create'),
('author', 'article/create'),
('test', 'article/create'),
('admin', 'article/del'),
('test', 'article/del'),
('admin', 'article/edit'),
('author', 'article/edit'),
('test', 'article/edit'),
('admin', 'article/list'),
('author', 'article/list'),
('test', 'article/list'),
('admin', 'rabc/rcreate'),
('admin', 'rabc/rdel'),
('admin', 'rabc/redit'),
('admin', 'rabc/rescreate'),
('admin', 'rabc/resdel'),
('admin', 'rabc/resedit'),
('admin', 'rabc/reslist'),
('admin', 'rabc/rlist'),
('admin', 'rabc/ucreate'),
('admin', 'rabc/udel'),
('admin', 'rabc/uedit'),
('admin', 'rabc/ulist'),
('admin', 'site/index'),
('author', 'site/index'),
('test', 'site/index');

-- --------------------------------------------------------

--
-- 表的结构 `auth_menu`
--

CREATE TABLE IF NOT EXISTS `auth_menu` (
  `id` int(11) NOT NULL,
  `pid` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `depth` tinyint(3) NOT NULL DEFAULT '1' COMMENT '菜单层级',
  `sort` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- 转存表中的数据 `auth_menu`
--

INSERT INTO `auth_menu` (`id`, `pid`, `name`, `depth`, `sort`) VALUES
(2, 0, '权限', 1, 1),
(3, 0, '概述', 1, 1),
(5, 0, '文章', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `auth_menu_item`
--

CREATE TABLE IF NOT EXISTS `auth_menu_item` (
  `menu_id` int(11) NOT NULL,
  `item_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限关联表';

--
-- 转存表中的数据 `auth_menu_item`
--

INSERT INTO `auth_menu_item` (`menu_id`, `item_name`) VALUES
(2, 'rabc/rcreate'),
(2, 'rabc/rdel'),
(2, 'rabc/redit'),
(2, 'rabc/rescreate'),
(2, 'rabc/resdel'),
(2, 'rabc/resedit'),
(2, 'rabc/reslist'),
(2, 'rabc/rlist'),
(2, 'rabc/ucreate'),
(2, 'rabc/udel'),
(2, 'rabc/uedit'),
(2, 'rabc/ulist'),
(3, 'site/index'),
(4, 'mmeber/itemadd'),
(5, 'article/create'),
(5, 'article/del'),
(5, 'article/edit'),
(5, 'article/list');

-- --------------------------------------------------------

--
-- 表的结构 `cl_article`
--

CREATE TABLE IF NOT EXISTS `cl_article` (
  `id` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '類別，0正體1簡體2英文',
  `class` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '類別',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签，多个标签用","分隔',
  `source` varchar(60) NOT NULL COMMENT '來源，比如“蘋果日報”',
  `author` varchar(60) NOT NULL COMMENT '作者',
  `pub_time` varchar(255) NOT NULL DEFAULT '' COMMENT '新聞在源網頁的發佈時間',
  `url` varchar(255) NOT NULL COMMENT '文章外鏈',
  `thumb` varchar(255) NOT NULL COMMENT '縮略圖地址',
  `focus` varchar(255) NOT NULL DEFAULT '' COMMENT '焦點圖片',
  `title` varchar(255) NOT NULL COMMENT '標題',
  `simple_title` varchar(255) NOT NULL COMMENT '短標題',
  `description` text NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '文章內容',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加時間',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新時間',
  `status` mediumint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2846 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_article`
--

INSERT INTO `cl_article` (`id`, `category`, `class`, `tag`, `source`, `author`, `pub_time`, `url`, `thumb`, `focus`, `title`, `simple_title`, `description`, `content`, `create_time`, `update_time`, `status`) VALUES
(727, 0, 0, 'Europol，EC3，CCIS', 'news.softpedia.com', '', '2014年11月12日', 'http://news.softpedia.com/news/Europol-Extends-Network-of-Partners-Adds-CCIS-On-the-List-464809.shtml', 'thumb/54811d262ffff.jpg', 'thumb/54811d262ffff.jpg', '欧洲刑警组织合作网络又添一员：CCIS', '欧洲刑警组织合作网络又添一员：CCIS', '        欧洲刑警组织与欧洲网络犯罪中心（EC3）的合作关系随着与欧洲主要安全公司的合作得到了增强，本周二它们与挪威网络及信息安全中心（CCIS）签署了一份谅解备忘录，共同打击网络犯罪行为......', '<p>欧洲刑警组织与欧洲网络犯罪中心（EC3）的合作关系随着与欧洲主要安全公司的合作得到了增强，本周二它们与挪威网络及信息安全中心（CCIS）签署了一份谅解备忘录，共同打击网络犯罪行为。CCIS是挪威一家公私合作机构，至少有25个实体在网络及信息安全研究、培训及教育领域有着共同兴趣，这也是欧洲刑警组织视CCIS为其重要联盟的部分原因。</p>\r\n', 1415939034, 1419327074, 1),
(728, 0, 0, '指数基金，ISE，HACK，黑客', 'www.reuters.com', '', '11月12日', 'http://www.reuters.com/article/2014/11/12/cybersecurity-etf-idUSL2N0T11FU20141112', 'thumb/', 'thumb/', '指数基金进军网络安全市场', '指数基金进军网络安全市场', '        一项旨在投资网络安全行业的指数基金为投资者如何看待去年美国企业遭受数据泄露一事带来一线曙光。PureFunds ISE 网络安全交易型开放式指数基金（即PureFunds ISE Cyber Security ETF，它是PureFunds公司与ISE合作开发的产品......', '<p>一项旨在投资网络安全行业的指数基金为投资者如何看待去年美国企业遭受数据泄露一事带来一线曙光。PureFunds ISE 网络安全交易型开放式指数基金（即PureFunds ISE Cyber Security ETF，它是PureFunds公司与ISE合作开发的产品。ISE即International Securities Exchange意为国际证券交易所）定于周三在纽约证券交易所高增长板挂牌交易，将对阻止恶意软件相关的产品或服务进行投资&mdash;&mdash;这一想法是基于网络攻击不断增长、旨在阻止网络攻击的行业也将不断壮大的事实。</p>\r\n\r\n<p>ISE网络安全指数为HACK（&ldquo;黑客&rdquo;），它由约30家公司组成，其中包括云安全提供商Qualys、防火墙制造商Fortinet以及赛门铁克及思科系统。相关业内人士指出，希望ETF能够同时吸引那些对网络安全市场未来增长潜力感兴趣的投资者加入，以及那些希望播报轰动事件新闻的投资者加入。</p>\r\n', 1415939125, 1419329140, 1),
(729, 0, 0, '社交，iOS，缺陷，GroupMe', 'news.softpedia.com', '', '2014年11月1日', 'http://news.softpedia.com/news/GroupMe-for-iOS-Patched-Against-Account-Take-Over-Flaw-463716.shtml', 'thumb/', 'thumb/', '社交小组修复iOS账户接管缺陷', '社交小组修复iOS账户接管缺陷', '社交小组（GroupMe）iOS版本最近收到了修复一个可允许个人通过电话号码劫持他人账户漏洞的更新。', '<p>社交小组（GroupMe）iOS版本最近收到了修复一个可允许个人通过电话号码劫持他人账户漏洞的更新。社交小组这一软件属于微软，可支持多种平台，包括桌面（OS X、Windows）以及移动（iOS以及安卓）平台，其中安卓平台已至少被安装了500万次。最先发现这一漏洞的安全研究人员表示，在登记时对移动设备所有权进行确认的代码可被暴力破解，这样第三方可利用任意电话号码创建一个社交小组账户并获得访问其他用户预置文件的权限。</p>\r\n', 1416195689, 1419329107, 1),
(1073, 0, 0, 'ATM，树莓派，Raspberry Pi', 'blog.ptsecurity.com', '', '2015年1月20日', 'http://blog.ptsecurity.com/2015/01/hacking-atm-with-raspberry-pi.html', 'thumb/54be4a619041e.jpg', 'thumb/54be4a619041e.jpg', '用树莓派入侵ATM机', '用树莓派入侵ATM机', '新年伊始就出现一种针对ATM机的“黑盒攻击”新型诈骗。根据Krebs OnSecurity报道，犯罪分子物理接近ATM机并将自己的电脑跟ATM机进行连接，以此迫使机器吐钱。实际上这类技术并不新鲜。', '<p>新年伊始就出现一种针对ATM机的&ldquo;黑盒攻击&rdquo;新型诈骗。根据Krebs OnSecurity报道，犯罪分子物理接近ATM机并将自己的电脑跟ATM机进行连接，以此迫使机器吐钱。实际上这类技术并不新鲜。来自Positive Technologies公司的专家Olga Kochetova及Alexey Osipov在阿姆斯特丹举行的2014年欧洲黑客大会上展示了类似攻击。</p>\r\n\r\n<p>为了便于实验，研究人员使用一台ATM机以及一个流行控制器树莓派（Raspberry Pi）。这款小型工具很容易被隐藏在一个ATM机器中。由于体积较小，树莓派不会引起服务工程师的注意，如替换内置打印机纸张的工程师。</p>\r\n\r\n<p>找到ATM界面文档并不难。如果不考虑提供商，ATM机以及支付终端享有相同的API，可访问并控制多种模块，并且还根据金融服务扩展（XFS）来使用Windows平台。</p>\r\n\r\n<p>获得API之后，人们可以轻易访问ATM的主机，并且直接管理多个安装在ATM机中的多个外围设备，例如读卡器、PIN键盘、触摸屏、分配装置等。可别忘了ATM操作系统的漏洞&mdash;&mdash;未来Windows会有多个漏洞等待释放。</p>\r\n\r\n<p><strong>漏洞检测</strong></p>\r\n\r\n<p>在树莓派被安装至ATM机以及连接至Ethernet、USB或者RS-232端口之前，攻击者需要打开ATM机盖。在机器顶部有一个服务区，供主机管理ATM设备及网络硬件包括保护不善的GSM/GPRS调制解调器。不像底部的安全区域，顶部非常容易被接触&mdash;&mdash;在机器顶部几乎没有任何监控设备。攻击者可以通过简单易做的钥匙以及手边材料打开服务区域。</p>\r\n\r\n<p>然而，打开它还需要几步&mdash;&mdash;动作要快而且你对它的控制必须保证不被发现。</p>\r\n\r\n<p>在黑帽大会上，两名专家进行了计时：看一下将树莓派安装至ATM服务区以拦截PIN码以及信用卡信息或者当做一个几乎不可能从外部检测到的盗取工具需要多长时间。研究人员完成打开ATM机、安装、伪装及联机的步骤仅仅用了2分钟。</p>\r\n\r\n<p>当准备黑帽大会演讲时，安全专家对树莓派进行了编程以管理ATM外设模块。电脑被连接至一个WiFi适配器，你可从任何设备如智能手机进行访问。还涉及了一个特别的web界面以指导ATM将钱盒清空。专家展示了如何让ATM机少出几张钞票，并且对代码进行调整后，让ATM机吐出所有的钱。顺便说一句，通常ATM机钱盒装有几千块，而且在一个普通的ATM机中，通常有四种不同面额。</p>\r\n\r\n<p>毋庸置疑，研究人员的概念验证显示，攻击之后ATM机吐出了所有的钱而且在主机上未留下任何痕迹；而且虽然监控视频是开着的，视频本身被树莓派所控制，这跟被入侵的ATM机上的其他设备被控制是一样的。</p>\r\n\r\n<p><strong>如何让ATM机变得安全？</strong></p>\r\n\r\n<p>为ATM机提供足够的安全保护措施并非易事。很多事情依赖于攻击情境。例如，来自英国LINK的专家建议替换服务区的默认锁并且用摄像机监控ATM机。</p>\r\n\r\n<p>同时，Positive Technologies的专家表示，主要的安全问题在于存在这样一种可能性：利用操作系统以及设备的漏洞将任何设备或程序（包括愤怒的小鸟在内）安装至ATM机。如果ATM提供商能够一起为ATM机中的组件制定一种新型的开放规范，并安全地进行交互以及认证，这种局面可能会被扭转。这有助于阻止拥有服务区钥匙的任何人轻易地连接至想要的系统。</p>\r\n', 1421757025, 1421757025, 1),
(1074, 0, 0, '英国，美国，网络作战演习', 'www.v3.co.uk', '', '2015年1月20日', 'http://www.v3.co.uk/v3-uk/analysis/2390927/us-and-uk-cyber-war-games-will-not-stop-the-hacker-army', 'thumb/54be4aa5e609c.jpg', 'thumb/54be4aa5e609c.jpg', '英美联合网络作战演习无法阻止黑客部队', '英美联合网络作战演习无法阻止黑客部队', '安全专家表示，英美两国进行网络作战演习迈出了积极的一步，但并不会解决影响政府机构及行业的安全危机。', '<p>安全专家表示，英美两国进行网络作战演习迈出了积极的一步，但并不会解决影响政府机构及行业的安全危机。1月16日，英国首相卡梅隆及美国总统奥巴马宣布计划启动一系列网络作战演习。演习针对的第一个目标是金融机构，之后会创立一个由英美两国运行的合作&ldquo;网络部队&rdquo;。</p>\r\n\r\n<p>从总体上看，这一行动得到了安全社区的欢迎。有网络安全专家表示，演习最终不得不将涉及关键基础设施的企业拉进来，如电力部门以让演习顺利进行。网络作战有望成为核武器威胁的情况，它带来的影响更多地不是表现在物理意义上，而是表现在经济及心理意义上。也有人发出警告称，即便满足了这些条件，黑客依然会找到攻击一些系统的方法。</p>\r\n', 1421757093, 1421757093, 1),
(1075, 0, 0, 'VLC，0day 漏洞', 'news.softpedia.com', '', '2015年1月20日', 'http://news.softpedia.com/news/Two-Zero-Days-Found-in-the-Codec-Library-Used-by-VLC-2-1-5-470547.shtml', 'thumb/54be4b023ee8f.jpg', 'thumb/54be4b023ee8f.jpg', 'VLC 2.1.5使用的编解码库中出现两个0day漏洞', 'VLC 2.1.5使用的编解码库中出现两个0day漏洞', '土耳其安全研究员Veysel Hatas在VLC媒体播放器2.1.5版本（最新版本）使用的开源编解码库中发现两个内存泄露漏洞。', '<p>土耳其安全研究员Veysel Hatas在VLC媒体播放器2.1.5版本（最新版本）使用的开源编解码库中发现两个内存泄露漏洞。如果这两个漏洞被成功利用，攻击者能够在运行漏洞视频播放器的机器上执行任意代码。这可通过内存泄露来实现，而内存泄露是由具有某种特点的文件触发的。</p>\r\n\r\n<p><strong>已创建演示文件</strong></p>\r\n\r\n<p>其中的一个漏洞是数据执行保护访问冲突CVE-2014-9597，可通过一个恶意编制的FLV文件对用户发动攻击。另外一个是CVE-2014-9598，它是一个写访问冲突漏洞，可以同样的方式触发，但它使用的是MV2文件类型。在这两种情况下，用户都必须将恶意文件加载到VLC中。</p>\r\n\r\n<p>为了演示用，Hatas创建了两个可以触发漏洞的文件，并且在VideoLan的问题跟踪系统中粘贴了标签。目前，标签处于关闭状态，因为libavcodec库而不是媒体播放器处于故障状态。</p>\r\n\r\n<p><strong>VLC 2.2.0未受安全漏洞影响</strong></p>\r\n\r\n<p>Hatas表示，漏洞是在11月24日发现的，他将内存泄露问题于12月26日提交，但似乎最新的媒体播放器依然存在这个问题。Hatas指出自己是在Windows XP上安装最新服务包进行测试后发现这个问题的。</p>\r\n\r\n<p>尽管2.1.5版本包含有漏洞的libavcodec，开发人员表示VLC 2.2.0中并不存在这两个问题。需要注意的是，libavcodec被其他免费媒体播放器所使用如MPlayer等作为他们主要的解码引擎。</p>\r\n\r\n<p>VLC支持所有平台（Windows、Mac、Linux）并且颇具人气，下载量超过10亿次。这一应用同时也支持移动平台，如安装、iOS以及Windows Phone。</p>\r\n', 1421757186, 1421757186, 1),
(1076, 0, 0, '弱密码，黑客', 'bgr.com', '', '2015年1月21日', 'http://bgr.com/2015/01/20/worst-passwords-2014-splashdata/', 'thumb/54bf1e2a35619.jpg', 'thumb/54bf1e2a35619.jpg', '让黑客喜欢上你的25个密码', '让黑客喜欢上你的25个密码', '2013年，“password”最终取代之前曾多年雄踞第一的“123456”赢得最差密码霸主地位。今年，这两个密码依然稳居状元、榜眼位置，它们是人们在2014年使用最频繁的密码。', '<p>恶意黑客耗费大量时间开发复杂的攻击活动，并钻研新方法窃取人们的信用卡号、银行卡信息以及其他私人数据。远离这些入侵对于我们来说变得越来越难，尤其是在这个人人都可雇佣一个黑客的时代。</p>\r\n\r\n<p>但对于许多人而言，黑客所有的这些辛勤劳动根本是在浪费时间，因为他们使用的密码是地球上最糟糕的密码，黑客几乎不费吹灰之力便可破解。</p>\r\n\r\n<p>Splash Data每年都会选出25个最常见的密码&mdash;&mdash;当然，在这种情况下，&ldquo;最常见&rdquo;是一件特别特别糟糕的事儿。</p>\r\n\r\n<p>2013年，&ldquo;password&rdquo;最终取代之前曾多年雄踞第一的&ldquo;123456&rdquo;赢得最差密码霸主地位。今年，这两个密码依然稳居状元、榜眼位置，它们是人们在2014年使用最频繁的密码。</p>\r\n\r\n<p>有意思的是，&ldquo;12345&rdquo;一路过五关斩六将，迅速飙升了17个位置，夺得探花宝座，直接导致&ldquo;12345678&rdquo;以及&ldquo;qwerty&rdquo;各下降一个名次，屈居第四第五。</p>\r\n\r\n<p>2014年列表中还新晋10个全新面孔，包括&ldquo;baseball&rdquo;、&ldquo;football&rdquo;、&ldquo;superman&rdquo;、&ldquo;batman&rdquo;、以及&ldquo;michael&rdquo;。</p>\r\n\r\n<p>以下是完整名录：</p>\r\n\r\n<table border="1" cellpadding="0" cellspacing="0" style="width:104.02%">\r\n	<tbody>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p><strong>名次</strong></p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p><strong>密码</strong></p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p><strong>相对</strong><strong>2013</strong><strong>年的排名</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>1</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>123456</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>未变</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>2</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>password</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>未变</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>3</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>12345</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>上升17位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>4</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>12345678</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 1位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>5</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>qwerty</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 1位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>6</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>123456789</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>未变</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>7</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>1234</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>上升9位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>8</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>baseball</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>9</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>dragon</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>10</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>football</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>11</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>1234567</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降4位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>12</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>monkey</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>上升5位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>13</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>letmein</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>上升1位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>14</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>abc123</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 9位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>15</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>111111</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 8位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>16</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>mustang</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>17</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>access</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>18</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>shadow</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>未变</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>19</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>master</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>20</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>michael</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>21</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>superman</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>22</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>696969</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>23</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>123123</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 12位</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>24</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>batman</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>新晋</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="width:19.74%">\r\n			<p>25</p>\r\n			</td>\r\n			<td style="width:37.68%">\r\n			<p>trustno1</p>\r\n			</td>\r\n			<td style="width:42.58%">\r\n			<p>下降 1位</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1421811242, 1421841573, 1),
(1077, 0, 0, '', 'arstechnica.com', '', '2015年1月21日', ' http://arstechnica.com/security/2015/01/wireless-device-in-two-million-cars-wide-open-to-hacking/ ', 'thumb/54bf1f285cc4a.jpg', 'thumb/54bf1f285cc4a.jpg', '无线设备导致200万汽车易受攻击', '无线设备导致200万汽车易受攻击', '据公开报告称，用来连接超过200万辆汽车及卡车上车载诊断系统的电子加密狗对入侵行为几乎没有任何防御措施，导致这些车辆易受攻击甚至被控制。', '<p>据公开报告称，用来连接超过200万辆汽车及卡车上车载诊断系统的电子加密狗对入侵行为几乎没有任何防御措施，导致这些车辆易受攻击甚至被控制。</p>\r\n\r\n<p>总部位于美国的前进保险公司表示，他们在2008年起便在200万辆汽车中使用了SnapShot设备。电子狗会追踪用户的行驶记录以帮助确定他们是否有资格获得更低的利率。安全专家Corey Thuen表示，电子狗并没有执行对固件更新的验证或者签名，没有安全的启动机制，没有蜂窝通信认证，也没有使用安全的通讯协议。据《福布斯》报道称，SnapShot连接至Thuen的2013年丰田苔原皮卡OBD II端口。它在CANbus网络上运行，可控制刹车、泊车辅助以及转向，还有一写其他敏感功能。</p>\r\n\r\n<p>&ldquo;公共汽车上的所有一切都可以相互交流&rdquo;，Thuen在Dark Reading上指出。&ldquo;你可以发动一个蜂窝式的中间人攻击&rdquo;，假设攻击者有能力欺骗一个从设备发送和接收数据的蜂窝信号塔。</p>\r\n\r\n<p>这是在迈阿密举行的S4x15会议上展示的评判。这只是关于许多广泛使用的车载电脑系统中最低防护措施的最新研究成果。Argus Cyber Security研究人员对连接至汽车服务商的Zubie进行分析后得出类似结论，发现它缺少很多反入侵的防御措施。前进保险公司告知《福布斯》称，他们有信心SnapShot是安全的，但欢迎来自Thuen的数据以便进行评估并作出改进。</p>\r\n', 1421811496, 1421841524, 1),
(1081, 0, 0, 'Flash Player，0day', 'malware.dontneedcoffee.com', '', '2015年1月22日', 'http://malware.dontneedcoffee.com/2015/01/unpatched-vulnerability-0day-in-flash.html', 'thumb/54c06921d3048.jpg', 'thumb/54c06921d3048.jpg', 'Flash Player未修复漏洞（0day）被Angler EK利用', 'Flash Player未修复漏洞（0day）被Angler EK利用', '安全研究员Kafeine发现Adobe Flash Player中存在两个0day漏洞。', '<p>安全研究员Kafeine发现Adobe Flash Player中存在两个0day漏洞。他的帖子全文如下：</p>\r\n\r\n<p>这是一个快速发帖，我将会在未来几个小时/几天进行更新。</p>\r\n\r\n<p>我发现一例Angler EK正在针对Flash Player发送三个不同项目：</p>\r\n\r\n<p>他们的&ldquo;标准&rdquo;CVE-2014-8440 - cb89e2da32a672a2b2bfea5b41f45ad5；</p>\r\n\r\n<p>一个新项目（现在提到的这个）- 86ee0a34b6f9b57c732b1aa9f4c45575 ，它将Flash Player 推至15.0.0.223；</p>\r\n\r\n<p>另外一个（md5没有公开分享，抱歉）。注意：这个利用并没有被用于所有的Angler例子中。</p>\r\n\r\n<p>看起来第三个有问题.</p>\r\n\r\n<p>在一段时间内禁用Flash Player可能是个不错的主意。</p>\r\n\r\n<p>我知道大家会给我发送很多问题及邮件，这是我做的一些测试：</p>\r\n\r\n<p>&shy;<strong>被利用的：</strong></p>\r\n\r\n<p>&mdash;Windows XP、IE 6至8、Flash 16.0.0.257</p>\r\n\r\n<p>&mdash;Windows 7、IE8、Flash 16.0.0.257</p>\r\n\r\n<p>UA : Mozilla/4.0 (兼容；MSIE 8.0；Windows NT 6.1；WOW64；Trident/4.0； SLCC2；.NET CLR 2.0.50727；.NET CLR 3.5.30729； .NET CLR 3.0.30729；Media Center PC 6.0)</p>\r\n\r\n<p>-带有Windows8-RT-KB3008925-x86 (Flash 16.0.0.235) 的Win 8 IE10 -</p>\r\n\r\n<p>UA : Mozilla/5.0 (兼容；MSIE 10.0；Windows NT 6.2；Trident/6.0)</p>\r\n\r\n<p>- Win8 IE10所有更新(Flash 16.0.0.257)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>安全的：</strong></p>\r\n\r\n<p>- Win 8.1 完全更新：这个项目未造成重大影响，但稍有影响，我认为可能是CVE-2014-0332（还未证实）帮了忙。</p>\r\n\r\n<p>UA : Mozilla/5.0（Windows NT 6.3；Trident/7.0； rv:11.0）如Gecko</p>\r\n\r\n<p>- Chrome : 他们没有触发这个项目</p>\r\n\r\n<p>UA：Mozilla/5.0 （Windows NT 5.1） AppleWebKit/537.36 （KHTML, 如Gecko）Chrome/39.0.2171.99 Safari/537.36</p>\r\n\r\n<p>我还在进行更多的测试。之后帖子会更新。</p>\r\n\r\n<p><strong>文件：</strong></p>\r\n\r\n<p>未发现任何现象。如果有情况请联系我。</p>\r\n\r\n<p>另据赛门铁克报道，Adobe尚未证实这个漏洞的存在，且没有发布安全公告。赛门铁克经过初步分析证实攻击中使用的SWF文件覆盖为：</p>\r\n\r\n<p>Trojan.Swifi</p>\r\n', 1421895969, 1421895969, 1),
(1078, 0, 0, 'Facebook，点赞，计算机算法', 'nakedsecurity.sophos.com', '', '2015年1月21日', 'https://nakedsecurity.sophos.com/2015/01/20/does-facebook-know-you-better-than-your-friends-and-family-do/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+nakedsecurity+%28Naked+Security+-+Sophos%29', 'thumb/54bf92110bcc1.jpg', 'thumb/54bf92110bcc1.jpg', 'Facebook比朋友跟家人更了解你吗？', 'Facebook比朋友跟家人更了解你吗？', '要是电脑能预测你的行为并且比你的同事、朋友、兄弟姐妹甚至是你的配偶更懂你的个性，该怎么办？来自剑桥大学及斯坦福大学的研究人员表示，这种情况已成为可能，通过研究你的Facebook点赞就可分析出相应结果。', '<p>要是电脑能预测你的行为并且比你的同事、朋友、兄弟姐妹甚至是你的配偶更懂你的个性，该怎么办？</p>\r\n\r\n<p>来自剑桥大学及斯坦福大学的研究人员表示，这种情况已成为可能，通过研究你的Facebook点赞就可分析出相应结果。</p>\r\n\r\n<p>研究人员Youyou Wu、Michal Kosinski、及David Stillwell在美国科学院院刊上发表了题为《基于计算机的个性判断比人为判断更准确》（Computer-based personality judgments are more accurate than those made by humans）的论文。研究人员披露称，比起人类来，对Facebook点赞进行研究分析的计算机算法更擅长判断Facebook账户的五个关键个性特征。</p>\r\n\r\n<p>该研究同时发现，比起熟人，这个计算机模型更擅长预测人生结果如物质滥用、政治态度以及身体健康，并且&ldquo;甚至有一些结果比自我个性评定的分数还要准确。&rdquo;</p>\r\n\r\n<p>虽然研究人员指出人类依然更擅长评估个性特征，因为个性特征的评定要求&ldquo;细微认知或者在数字化行为中这点不太明显&rdquo;，他们仍然认为判断人类个性的计算机能够消除人类判断如申请工作时的不一致性以及偏见。</p>\r\n\r\n<p>&ldquo;计算机并不关心你是男人、女人、老人、年轻人、黑人或者白人&rdquo;，Kosinski在一次Wired采访中表示。</p>\r\n\r\n<p>然而，Wu跟Kosinski表示该技术可能会造成麻烦的后果，而且可能加剧人们对数字平台如社交网络、搜索引擎及浏览器的不信任程度，因为这些平台收集我们的个人信息。</p>\r\n\r\n<p>虽然挖掘个人数据能够帮助人们在找工作、买东西、甚至是寻找伴侣时作出更好的决策，但我们仍然不喜欢那些能够收集我们所有信息的政府及企业。因此，研究人员表示，用户必须&ldquo;对自己的数字足迹有足够的控制权&ldquo;，并且政策制定者应当支持&rdquo;隐私保护及技术&rdquo;。从这项研究、以及流向挖掘上网足迹信息企业的市场营销及广告费用来看，技术提供商可能并不想放弃这一控制权。</p>\r\n', 1421840913, 1421841301, 1),
(1079, 0, 0, '美国，医保，个人数据，隐私', 'news.yahoo.com', '', '2015年1月21日', 'http://news.yahoo.com/government-health-care-website-quietly-222835005.html', 'thumb/54bf9250ad5bc.jpg', 'thumb/54bf9250ad5bc.jpg', '美政府医保网站正悄悄分享个人数据', '美政府医保网站正悄悄分享个人数据', '美联社报道称，美国政府的医疗保险网站正悄悄将消费者的个人数据发送给私营企业，这些企业主要从事广告、网络业绩及营销数据分析工作。', '<p>美联社报道称，美国政府的医疗保险网站正悄悄将消费者的个人数据发送给私营企业，这些企业主要从事广告、网络业绩及营销数据分析工作。虽然披露的数据范围或者数据的使用方式目前尚不清楚，但个人数据可能包括年龄、收入、邮编、是否抽烟、是否怀孕等信息。同时也可能包含计算机互联网地址，可结合网络营销或广告公司收集的信息识别出个人姓名或地址。</p>\r\n\r\n<p>奥巴马当局表示HealthCare.gov与信息公司的联网旨在改善消费者体验。官员表示，外界公司禁止使用这些数据来获取自己的商业利益。</p>\r\n\r\n<p>目前尚不存在个人信息被滥用的情况。但与几十家三方科技公司的联网被分析HealthCare.gov的技术专家所记录，这一点被美联社所证明。几家公司还收集特别具体的信息。这种联网引起人们的担忧。</p>\r\n\r\n<p>周二，主要的立法人员请求奥巴马当局对如何监督数据公司处理个人信息的方式进行解释。但当局并未解释如何确保企业遵守政府的隐私及安全政策。</p>\r\n\r\n<p>美联社从最近访问网站的结果来看，一些个人信息包括年龄、收入及抽烟习惯被传输给广告及Web分析网站，而消费者对此很可能并不知情。</p>\r\n\r\n<p>Cathpoint Systems公司发现约50个第三方网站被嵌入HealthCare.gov网站。这些网站在后台运行，多数消费者看不到。美联社重现了这一结果。美联社最近在HealthCare.gov网站上停留了10分钟，结果发现几十家网站在后台访问，其中包括谷歌的数据分析服务、推特、Facebook以及很多网络广告提供商。</p>\r\n\r\n<p>HealthCare.gov依照美国总统医疗保健法律创立，它是没有工作保险的人们进入由政府补贴的私人保险的网络入口。它所服务的消费者遍布37个州，其余州运营着自己的保险市场。</p>\r\n', 1421840976, 1421840976, 1),
(1080, 0, 0, '法国，巴黎，安全', 'news.yahoo.com', '', '2015年1月21日', 'http://news.yahoo.com/france-issues-first-charges-against-4-terror-attacks-081915018.html', 'thumb/54bf9291433a3.jpg', 'thumb/54bf9291433a3.jpg', '法国安全队伍获更好武器对抗恐怖分子', '法国安全队伍获更好武器对抗恐怖分子', '法国总理Manuel Valls表示，将为安全队伍配备更好的武器及保护措施，并且法国将会迎来一个招聘潮，雇佣2600名反恐新官员。', '<p>法国总理Manuel Valls表示，将为安全队伍配备更好的武器及保护措施，并且法国将会迎来一个招聘潮，雇佣2600名反恐新官员。Manuel Valls表示，法国政府将在未来三年投入4.25亿欧元应对巴黎恐怖袭击事件。法国巴黎恐怖事件造成包括3名凶手在内的20人死亡，其中也包括3名警察。</p>\r\n\r\n<p>Valls周三表示，法国同时将加强情报机构的力量，将推出一项旨在让电话窃听变得更容易的措施。</p>\r\n', 1421841041, 1421841041, 1),
(1082, 0, 0, '内部威胁', 'www.securityweek.com', '', '2015年1月22日', 'http://www.securityweek.com/privileged-users-top-list-insider-threat-concerns-survey', 'thumb/54c0697ab4015.jpg', 'thumb/54c0697ab4015.jpg', 'Ovum关于内部威胁的研究报告', 'Ovum关于内部威胁的研究报告', '几周之前，摩根斯坦利开除了一名访问客户信息并在网上公开部分信息的员工。研究公司Ovum及数据安全公司Vormetric对此发布了一份研究报告。', '<p>几周之前，摩根斯坦利开除了一名访问客户信息并在网上公开部分信息的员工。研究公司Ovum及数据安全公司Vormetric对此发布了一份研究报告。报告的主要成果如下：</p>\r\n\r\n<p>1、全球范围内，有89%的受访者认为自己的组织机构受到内部攻击的风险增大；34%的人认为非常或者极其容易受到攻击。<br />\r\n2、当问到谁会给企业数据带来最大的内部威胁时，55%的受访者的回答是有特权的用户，46%的人认为是承包商以及服务提供商，43%的人认为是商业合作伙伴。<br />\r\n3、数据库、文件服务器以及云存储着大批敏感数据资产，但对于很多人（38%）来说，移动是高风险区域。</p>\r\n', 1421896058, 1421896058, 1),
(1083, 0, 0, '谷歌，app管理控制台，XSS', 'www.securityweek.com', '', '2015年1月22日', 'https://www.securityweek.com/researcher-gets-5000-xss-flaw-google-apps-admin-console', 'thumb/54c069d9897f3.jpg', 'thumb/54c069d9897f3.jpg', '研究人员因发现谷歌App管理控制台中的XSS漏洞获5000美元', '因发现谷歌XSS漏洞获奖励5000美元', '几个月之前，谷歌修复了影响谷歌app管理控制台的一个严重XSS漏洞。这一漏洞是安全研究员Brett Buerhaus发现的。', '<p>几个月之前，谷歌修复了影响谷歌app管理控制台的一个严重XSS漏洞。这一漏洞是安全研究员Brett Buerhaus发现的。</p>\r\n\r\n<p>Google app控制台允许管理人员管理他们的组织机构账户。Admins可以通过控制台添加新用户、管理安全设置并启用谷歌服务。这一功能被许多使用Gmail服务的企业用户使用。当用户访问一个未对域名进行配置的服务时，他们会看到&ldquo;ServiceNotAllowed&rdquo;页面。这个页面允许用户在账户（他们必须登录两个账户）之间进行切换以登录进服务。Brett Buerhaus指出问题是，当选择一个账户后，会执行一个JavaScript代码以重新定向Web浏览器。用户能够在URL的&ldquo;继续&rdquo;参数中提供JavaScript代码，这样会引发XSS攻击。</p>\r\n\r\n<p>这个漏洞可允许攻击者执行多个动作。攻击者可能强迫管理员创建新的账户、为个人账户（包括双因素认证）禁用安全设置，并且修改域设置。攻击者也有可能通过重新设置密码、禁用双因素认证、并暂时移除登录问题（10分钟）的方法劫持账户。</p>\r\n', 1421896153, 1421896153, 1),
(1084, 0, 0, '澳大利亚，黑客，隐私', 'www.scmagazine.com', '', '2015年1月22日', ' http://www.scmagazine.com/over-870k-personal-records-leaked-following-australian-insurer-breach/article/393459/ ', 'thumb/54c06be317fa7.jpg', 'thumb/54c06be317fa7.jpg', '澳大利亚旅游保险公司被黑87万个人记录遭泄露', '澳大利亚旅游保险公司被黑87万个人记录遭泄露', '澳大利亚旅游保险公司Aussie Travel Cover (ATC)公司去年12月被一名少年黑客攻击，导致大批个人数据被泄露。', '<p>澳大利亚旅游保险公司Aussie Travel Cover (ATC)公司去年12月被一名少年黑客攻击，导致大批个人数据被泄露。ATC于12月23日被告知此事件，但公司并未立即通知消费者及投保人。昆士兰名为Abdilo的黑客窃取了公司的两个数据库，其中包含87万个人信息。个人信息包括姓名、家庭住址、信用卡部分卡号。黑客于2015年1月16日通过推特称为该事件负责并提供了一个链接可打开包含数据库信息的网站，随后信息被删除。</p>\r\n', 1421896283, 1421896675, 1),
(1085, 0, 0, '丝绸之路', 'yro.slashdot.org', '', '2015年1月22日', 'http://yro.slashdot.org/story/15/01/21/1918213/silk-road-20-deputy-arrested', 'thumb/54c06aa02e72f.jpg', 'thumb/54c06aa02e72f.jpg', '丝绸之路2.0管理员DoctorClu被捕', '丝绸之路2.0管理员DoctorClu被捕', '随着针对第一版“丝绸之路”乌布利希审判的进展，美国国土安全局在该网站关闭超过2.5个月之后逮捕了“丝绸之路2.0”的一名管理员。', '<p>随着针对第一版&ldquo;丝绸之路&rdquo;乌布利希审判的进展，美国国土安全局在该网站关闭超过2.5个月之后逮捕了&ldquo;丝绸之路2.0&rdquo;的一名管理员。这名管理员名为Brian Richard Farrell，绰号为&ldquo;DoctorClu&rdquo;。文章写道，&ldquo;国土安全局7月份对丝绸之路2.0活动的追踪最后到达Farrell在贝尔维尤的家。在接下来的几个月，国土安全局观察了他的行踪并采访了他的一名室友。他的室友称Farrell每天都在接收来自UPS、FedEx以及邮政包裹。国土安全局特工Larson表示，其中一个包裹中装有107粒赞安诺药丸。1月2日，国土安全局展开搜查，追缴了电脑、吸毒用具、价值3900美元的银条、以及35,000美元的现金。&rdquo;</p>\r\n', 1421896352, 1421896352, 1),
(1086, 0, 0, '黑客，孟加拉，巴基斯坦', 'tribune.com.pk', '', '2015年1月22日', 'http://tribune.com.pk/story/824698/bangladeshi-hackers-take-down-jis-website/', 'thumb/54c06ad90da71.jpg', 'thumb/54c06ad90da71.jpg', '孟加拉国黑客黑掉巴基斯坦伊斯兰党网站', '孟加拉国黑客黑掉巴基斯坦伊斯兰党网站', '周二，巴基斯坦伊斯兰党的官方网站被声称来自孟加拉国的黑客入侵。\r\n', '<p>周二，巴基斯坦伊斯兰党的官方网站被声称来自孟加拉国的黑客入侵。黑客警告称这么做是为了阻止伊斯兰党干涉孟加拉国内政，并警告称如果对此警告不屑一顾，他们将会卷土重来。该黑客组织名为CyBER71。</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1421896409, 1421896409, 1),
(2845, 0, 0, 'gfd ,hgfgG', 'gg', '佚名ff', '2016年12月23日', 'ggg', 'thumb/201612/23/dd213a4193c6a39753688c9a5ffe83f0.jpg', 'thumb/201612/23/1ec90de6d72f28abb08b7f5535b6143c.jpg', '测试短标题', '测试短标题b', 'gs ', '<p>d s&nbsp;<img alt="韩国副本.jpg" src="http://adminx.com/uploads/img/editor/201612/23/7077bbf03e2f9343dd2b237f94f3d5aa.jpg" width="600" height="334"></img></p>', 1483084502, 1483084502, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dy_log`
--

CREATE TABLE IF NOT EXISTS `dy_log` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `action` tinyint(3) NOT NULL DEFAULT '0' COMMENT '操作类型 1 insert 2 update',
  `otable` varchar(255) NOT NULL DEFAULT '' COMMENT '表名',
  `oid` varchar(20) NOT NULL COMMENT '记录ID',
  `odata` text NOT NULL COMMENT '详情',
  `year` char(4) NOT NULL COMMENT '年',
  `month` char(2) NOT NULL COMMENT '月',
  `day` char(2) DEFAULT NULL COMMENT '日',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='日志表';

--
-- 转存表中的数据 `dy_log`
--

INSERT INTO `dy_log` (`id`, `username`, `action`, `otable`, `oid`, `odata`, `year`, `month`, `day`, `create_time`) VALUES
(1, 'admin', 1, 'auth_item', 'site/index', '{"last":{"type":2,"description":"概述1"},"cur":{"type":"2","description":"概述"}}', '2016', '12', '30', 1483084824),
(2, 'admin', 1, 'auth_item', 'article/create', '{"last":{"type":2},"cur":{"type":"2"}}', '2016', '12', '30', 1483084976),
(3, 'admin', 1, 'auth_item', 'article/create', '{"last":{"type":2,"description":"添加文章"},"cur":{"type":"2","description":"添加文章11"}}', '2016', '12', '30', 1483085029),
(4, 'admin', 1, 'auth_item', 'article/create', '{"last":{"type":2,"description":"添加文章11"},"cur":{"type":"2","description":"添加文章1"}}', '2016', '12', '30', 1483085081),
(5, 'admin', 1, 'auth_item', 'article/create', '{"last":{"type":2},"cur":{"type":"2"}}', '2016', '12', '30', 1483085096),
(6, 'admin', 1, 'auth_item', 'article/create', '{"last":{"type":2,"description":"添加文章1"},"cur":{"type":"2","description":"添加文章"}}', '2016', '12', '30', 1483085108),
(7, 'admin', 1, 'auth_item', 'site/index', '{"last":{"type":2,"description":"概述"},"cur":{"type":"2","description":"概述eqwe"}}', '2016', '12', '30', 1483087025),
(8, 'admin', 1, 'auth_item', 'site/index', '{"last":{"type":2,"description":"概述eqwe"},"cur":{"type":"2","description":"概述"}}', '2016', '12', '30', 1483087035),
(9, 'gaojiyong', 0, 'auth_item', 'test', '{"cur":{"name":"test","type":"1","description":"测试"}}', '2016', '12', '30', 1483089559),
(10, 'gaojiyong', 0, 'auth_item', 'rabc/ucreate', '{"cur":{"name":"rabc\\/ucreate","type":"2","description":"用户添加"}}', '2016', '12', '30', 1483090270),
(11, 'gaojiyong', 1, 'auth_item', 'rabc/ulist', '{"last":{"type":2,"description":"用户列表2"},"cur":{"type":"2","description":"用户列表"}}', '2016', '12', '30', 1483090280),
(12, 'gaojiyong', 0, 'auth_item', 'rabc/uedit', '{"cur":{"name":"rabc\\/uedit","type":"2","description":"用户编辑"}}', '2016', '12', '30', 1483090414),
(13, 'gaojiyong', 0, 'auth_item', 'rabc/rlist', '{"cur":{"name":"rabc\\/rlist","type":"2","description":"角色列表"}}', '2016', '12', '30', 1483090437),
(14, 'gaojiyong', 0, 'auth_item', 'rabc/rcreate', '{"cur":{"name":"rabc\\/rcreate","type":"2","description":"角色添加"}}', '2016', '12', '30', 1483090459),
(15, 'gaojiyong', 0, 'auth_item', 'rabc/rdel', '{"cur":{"name":"rabc\\/rdel","type":"2","description":"角色删除"}}', '2016', '12', '30', 1483090477),
(16, 'gaojiyong', 0, 'auth_item', 'rabc/udel', '{"cur":{"name":"rabc\\/udel","type":"2","description":"用户删除"}}', '2016', '12', '30', 1483090518),
(17, 'gaojiyong', 0, 'auth_item', 'rabc/reslist', '{"cur":{"name":"rabc\\/reslist","type":"2","description":"资源列表"}}', '2016', '12', '30', 1483090555),
(18, 'gaojiyong', 0, 'auth_item', 'rabc/rescreate', '{"cur":{"name":"rabc\\/rescreate","type":"2","description":"资源添加"}}', '2016', '12', '30', 1483090576),
(19, 'gaojiyong', 1, 'auth_item', 'article/create', '{"last":{"type":2,"description":"添加文章"},"cur":{"type":"2","description":"文章添加"}}', '2016', '12', '30', 1483090621),
(20, 'gaojiyong', 1, 'auth_item', 'article/del', '{"last":{"type":2,"description":"删除文章"},"cur":{"type":"2","description":"文章删除"}}', '2016', '12', '30', 1483090631),
(21, 'gaojiyong', 1, 'auth_item', 'article/edit', '{"last":{"type":2,"description":"编辑文章"},"cur":{"type":"2","description":"文章编辑"}}', '2016', '12', '30', 1483090640),
(22, 'gaojiyong', 0, 'auth_item', 'rabc/resedit', '{"cur":{"name":"rabc\\/resedit","type":"2","description":"资源编辑"}}', '2016', '12', '30', 1483090676),
(23, 'gaojiyong', 0, 'auth_item', 'rabc/resdel', '{"cur":{"name":"rabc\\/resdel","type":"2","description":"资源删除"}}', '2016', '12', '30', 1483090788),
(24, 'admin', 1, 'auth_item', 'admin', '{"last":{"type":1},"cur":{"type":"1"}}', '2016', '12', '30', 1483090912),
(25, 'admin', 1, 'auth_item', 'author', '{"last":{"type":1},"cur":{"type":"1"}}', '2016', '12', '30', 1483090932),
(26, 'admin', 0, 'auth_item', 'rabc/redit', '{"cur":{"name":"rabc\\/redit","type":"2","description":"角色编辑"}}', '2016', '12', '30', 1483093132),
(27, 'admin', 1, 'auth_item', 'admin', '{"last":{"type":1},"cur":{"type":"1"}}', '2016', '12', '30', 1483093139);

-- --------------------------------------------------------

--
-- 表的结构 `dy_user`
--

CREATE TABLE IF NOT EXISTS `dy_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT '' COMMENT '鏄电О',
  `auth_key` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dy_user`
--

INSERT INTO `dy_user` (`id`, `username`, `nickname`, `auth_key`, `password`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '超级管理员', '', '$2y$13$T73JrpOm8Srd9fimsbF0ke6YMA70ZisHcZGKol1CP6blAjuoEkmAe', NULL, 'admin@123.com', 10, 0, 1483093049),
(8, 'gaojiyong', 'gaojiyong', 'qMkzfHEJ3QUZsKXIVwg9f5fhvILklXZg', '$2y$13$iiPN6yhMk7C5uviwo3CKY.1t3X5S4fkQJQfFbfuN6WrA13L3iv3De', NULL, '3323@qq.com', 10, 1483087465, 1483090980),
(9, 'jjj', 'jjj', 'TsIggWrDPUCXLAn7vgg2m8WITKU2ynSE', '$2y$13$FTd5.7SxmO1Z.s3HnZis.OriM7/ro2DRVXl.SXD4/IXddFRLAAnf.', NULL, 'ss', 0, 1483088785, 1483088784);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_menu`
--
ALTER TABLE `auth_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_menu_item`
--
ALTER TABLE `auth_menu_item`
  ADD UNIQUE KEY `gg` (`menu_id`,`item_name`);

--
-- Indexes for table `cl_article`
--
ALTER TABLE `cl_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dy_log`
--
ALTER TABLE `dy_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dy_user`
--
ALTER TABLE `dy_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_menu`
--
ALTER TABLE `auth_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cl_article`
--
ALTER TABLE `cl_article`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2846;
--
-- AUTO_INCREMENT for table `dy_log`
--
ALTER TABLE `dy_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `dy_user`
--
ALTER TABLE `dy_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- 限制导出的表
--

--
-- 限制表 `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

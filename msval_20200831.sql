-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Počítač: innodb.endora.cz:3306
-- Vytvořeno: Pon 31. srp 2020, 08:46
-- Verze serveru: 5.6.45-86.1
-- Verze PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `msval`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(2, 'Seznam věcí do školky', '<p>Co d&aacute;t d&iacute;těti do &scaron;kolky:</p>\n<p>Obuv: Bačkory (ne pantofle), tenisky, hol&iacute;nky, př&iacute;padně sand&aacute;ly na ven&nbsp;</p>\n<p>Oblečen&iacute;: Tepl&aacute;ky 2x,&nbsp;Kraťasy 2x,&nbsp;Tričko kr&aacute;tk&yacute; 2x i dlouh&yacute; ruk&aacute;v 1x</p>\n<p>Mikinu a slabou bundu - ide&aacute;lně nepromokavou</p>\n<p>N&aacute;hradn&iacute; ponožky a spodn&iacute; pr&aacute;dlo (u mal&yacute;ch dět&iacute; v&iacute;ce kusů)</p>\n<p>K&scaron;iltovku</p>\n<p>Pl&aacute;&scaron;těnku</p>\n<p>L&aacute;hev na pit&iacute; - označenou tak, aby si ji d&iacute;tě bezpečně poznalo - ne jup&iacute;ka :)</p>\n<p>Dětem d&aacute;vejte oblečen&iacute;, kter&eacute; si mohou za&scaron;pinit!</p>', 'andrsak85@gmail.com', 1581332797, 'reditelka@msval.cz', 1598014362),
(3, 'Zahájení školního roku', '<p>Tě&scaron;&iacute;me se na V&aacute;s v &uacute;ter&yacute; 1.9.2020&nbsp;</p>\n<p>Vstup do budovy bude pro rodiče bez rou&scaron;ky (a už to měnit nebudeme:), děti si přeb&iacute;r&aacute; pedagogick&yacute; pracovn&iacute;k, kter&yacute; změř&iacute; d&iacute;těti teplotu.&nbsp;</p>\n<p>Ž&aacute;d&aacute;me rodiče, aby pohyb v budově minimalizovali na co nejkrat&scaron;&iacute; dobu.&nbsp;</p>\n<p>Informativn&iacute; schůzka bude ve středu 2.9. od 15:30 hodin.&nbsp;</p>', 'andrsak85@gmail.com', 1581489026, 'reditelka@msval.cz', 1598014595),
(4, 'Přednáška pro rodiče', '<p>Dovolte n&aacute;m pozvat V&aacute;s na předn&aacute;&scaron;ku Soni Proch&aacute;zkov&eacute;.</p>\n<p>Kdy: ponděl&iacute; 5.10. od 16 hodin</p>\n<p>Pro rodiče dět&iacute; doch&aacute;zej&iacute;c&iacute;ch do M&Scaron; Val je předn&aacute;&scaron;ka ZDARMA, ostatn&iacute; rodiče: 50 Kč/os</p>\n<p>Maxim&aacute;ln&iacute; počet &uacute;častn&iacute;ků je 25, registrovat se můžete na reditelka@msval.cz</p>\n<p>T&eacute;ma: Pr&aacute;ce s pravidly</p>\n<p>Rodiče si mohou ověřit zda jsou pravidla podstatn&aacute; a jak moc s nimi pracuj&iacute;, zda je chtěj&iacute;, a využ&iacute;vaj&iacute; je t&iacute;m spr&aacute;vn&yacute;m způsobem. Je někdy vyčerp&aacute;vaj&iacute;c&iacute; od r&aacute;na do večera křičet a držet pravidla. Je mnohdy pro rodiče nepředstaviteln&eacute; vědom&iacute;, že se postupně d&iacute;tě může do t&eacute;to činnosti zapojovat a v&scaron;e spoluvytv&aacute;řen&iacute; a dokonce vn&iacute;mat svou spolu&uacute;čast. V r&aacute;mci tohoto semin&aacute;ře je možn&eacute; zjistit jak na to. Je vhodn&yacute; již pro rodiče mal&yacute;ch dět&iacute;, tak aby se daly aktivity zapojit je&scaron;tě před n&aacute;stupem do &scaron;koly a t&iacute;m usnadnit adaptaci na &scaron;koln&iacute; doch&aacute;zku. Heslo tohoto semin&aacute;ře je: \"Nikdy nen&iacute; pozdě.\"</p>', 'reditelka@msval.cz', 1598014551, 'reditelka@msval.cz', 1598015162);

-- --------------------------------------------------------

--
-- Struktura tabulky `articles_gallery`
--

CREATE TABLE `articles_gallery` (
  `id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `articles_gallery`
--

INSERT INTO `articles_gallery` (`id`, `articles_id`, `gallery_id`) VALUES
(1, 3, 20),
(2, 2, 21),
(3, 4, 22);

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Article comments';

-- --------------------------------------------------------

--
-- Struktura tabulky `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `filename` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Images (URL)';

-- --------------------------------------------------------

--
-- Struktura tabulky `files_category`
--

CREATE TABLE `files_category` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `files_category`
--

INSERT INTO `files_category` (`id`, `short_name`, `name`) VALUES
(1, 'nezarazeno', 'Nezařazeno'),
(4, 'formulare', 'Formuláře');

-- --------------------------------------------------------

--
-- Struktura tabulky `food_alergens`
--

CREATE TABLE `food_alergens` (
  `id` int(11) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `long_name` varchar(100) NOT NULL,
  `detail` text NOT NULL,
  `image_url` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Food alergens (alergeny)';

--
-- Vypisuji data pro tabulku `food_alergens`
--

INSERT INTO `food_alergens` (`id`, `short_name`, `long_name`, `detail`, `image_url`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, '1', 'Obiloviny obsahující lepek', '<p>p&scaron;enice, žito, ječmen, oves, &scaron;palda, kamut nebo jejich hybridn&iacute; odrůdy a v&yacute;robky z nich</p>', '/img/food_menu/obiloviny.jpg', 'andrsak85@gmail.com', 2147483647, 'andrsak85@gmail.com', 1588677339),
(2, '2', 'Korýši', '<p>Kor&yacute;&scaron;i a v&yacute;robky z nich</p>', '/img/food_menu/korysi.jpg', 'andrsak85@gmail.com', 2147483647, 'andrsak85@gmail.com', 1588677351),
(5, '3', 'Vejce', '<p>Vejce a v&yacute;robky z nich</p>', '/img/food_menu/vejce.jpg', 'jidelna@msval.cz', 1587629791, 'andrsak85@gmail.com', 1588677363),
(6, '4', 'Ryby', '<p>Ryby a v&yacute;robky z nich</p>', '/img/food_menu/ryby.jpg', 'jidelna@msval.cz', 1587631126, 'andrsak85@gmail.com', 1588677372),
(7, '5', 'Podzemnice olejná (arašídy)', '<p>Ara&scaron;&iacute;dy a v&yacute;robky z nich</p>', '/img/food_menu/arasidy.jpg', 'jidelna@msval.cz', 1587631168, 'andrsak85@gmail.com', 1588677400),
(8, '6', 'Sojové boby (sója)', '<p>Sojov&eacute; boby a v&yacute;robky z nich</p>', '/img/food_menu/sojove-boby.jpg', 'jidelna@msval.cz', 1587631226, 'andrsak85@gmail.com', 1588677409),
(9, '7', 'Mléko', '<p>Ml&eacute;ko a v&yacute;robky z něj</p>', '/img/food_menu/mleko.jpg', 'jidelna@msval.cz', 1587631329, 'andrsak85@gmail.com', 1588677428),
(10, '8', 'Skořápkové plody', '<p>mandle, l&iacute;skov&eacute; ořechy, vla&scaron;sk&eacute; ořechy, ke&scaron;u ořechy, pekanov&eacute;<br />ořechy, para ořechy, pist&aacute;cie, makadamie a v&yacute;robky z nich</p>', '/img/food_menu/orechy.jpg', 'jidelna@msval.cz', 1587631378, 'andrsak85@gmail.com', 1588677438),
(11, '9', 'Celer', '<p>Celer a v&yacute;robky z něj</p>', '/img/food_menu/celer.jpg', 'jidelna@msval.cz', 1587631400, 'andrsak85@gmail.com', 1588677447),
(12, '10', 'Hořčice', '<p>Hořčice a v&yacute;robky z n&iacute;</p>', '/img/food_menu/horcice.jpg', 'jidelna@msval.cz', 1587631426, 'andrsak85@gmail.com', 1588677457),
(13, '11', 'Sezamová semena (sezam)', '<p>Sezamov&aacute; semena a v&yacute;robky z nich</p>', '/img/food_menu/sezam.png', 'jidelna@msval.cz', 1587631464, 'andrsak85@gmail.com', 1588677472),
(14, '12', 'Oxid siřičitý a siřičitany', '<p>v koncentrac&iacute;ch vy&scaron;&scaron;&iacute;ch 10 mg, ml/kg, l, vyj&aacute;dřeno SO<sub>2</sub></p>', '/img/food_menu/so2.png', 'jidelna@msval.cz', 1587631538, 'andrsak85@gmail.com', 1588677510),
(15, '13', 'Vlčí bob (lupina)', '<p>Vlč&iacute; bob a v&yacute;robky z něj</p>', '/img/food_menu/lupina.jpg', 'jidelna@msval.cz', 1587631570, 'andrsak85@gmail.com', 1588677519),
(16, '14', 'Měkkýši', '<p>Měkk&yacute;&scaron;i a v&yacute;robky z nich</p>', '/img/food_menu/mekkysi.jpg', 'jidelna@msval.cz', 1587631595, 'andrsak85@gmail.com', 1588677531);

-- --------------------------------------------------------

--
-- Struktura tabulky `food_menu`
--

CREATE TABLE `food_menu` (
  `id` int(11) NOT NULL,
  `day` date NOT NULL,
  `week` int(5) NOT NULL,
  `breakfast` varchar(255) NOT NULL,
  `breakfast_alergens` varchar(100) NOT NULL,
  `soup` varchar(255) NOT NULL,
  `soup_alergens` varchar(100) NOT NULL,
  `main_course` varchar(255) NOT NULL,
  `main_course_alergens` varchar(100) NOT NULL,
  `snack` varchar(255) NOT NULL,
  `snack_alergens` varchar(100) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='menu (jidelnicek)';

--
-- Vypisuji data pro tabulku `food_menu`
--

INSERT INTO `food_menu` (`id`, `day`, `week`, `breakfast`, `breakfast_alergens`, `soup`, `soup_alergens`, `main_course`, `main_course_alergens`, `snack`, `snack_alergens`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, '2020-08-24', 35, 'Rybičková pomazánka, rohlík, rajče, mléko, čaj', '1, 4, 7', 'Z červené řepy se zeleninou', '7, 9', 'Rizoto s kuřecím masem, okurka, šťáva, voda', '9', 'Bábovka, čaj, mléko, jablko', '1, 3, 7', 'reditelka@msval.cz', 1597993379, 'reditelka@msval.cz', 1598016700),
(2, '2020-08-25', 35, 'Mrkvová pomazánka, kaiserka, okurek, mléko, čaj', '1, 7', 'Zeleninová s jáhly', '1, 9', 'Boloňské špagety sypané sýrem, mátová voda, ovo šťáva', '', 'Patifu pomazánka, slunečnicový chléb, mléko, čaj', '1, 7', 'reditelka@msval.cz', 1598016621, 'reditelka@msval.cz', 1598016747),
(3, '2020-08-26', 35, 'Sýrová pomazánka, žitný chléb, paprika, mléko, čaj', '1, 7', 'Rybí se zeleninou', '4, 9', 'Koprová omáčka s vejci, brambory, ovo šťáva, voda', '1, 3, 7', 'Šunková pomazánka, veka, paprika, mléko, čaj', '1, 7', 'reditelka@msval.cz', 1598016857, '', 0),
(4, '2020-08-27', 35, 'Špenátová pomazánka, chléb semínkový, okurek, čaj, mléko', '1, 7', 'Zeleninová s vejcem', '1, 3, 7', 'Rybí prsty, dýňovo-bramborové pyré, ovo šťáva, voda', '1, 3, 4', 'Rohlík, pomazánkové máslo, rajče, mléko, čaj', '1, 7', 'reditelka@msval.cz', 1598016982, '', 0),
(5, '2020-08-28', 35, 'Cereální toustový chléb, máslo, plátkový sýr, rajče, čaj, mléko', '1, 7', 'Luštěninová', '9', 'Zapečené bramborové krucánky s vepř. kýtou, okurkový salát', '1, 3, 7', 'Cereálie s mlékem, hruška', '1, 7', 'reditelka@msval.cz', 1598017108, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `url_thumb` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Images (URL)';

--
-- Vypisuji data pro tabulku `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `description`, `album_id`, `url`, `url_thumb`, `creator`, `created_at`) VALUES
(20, 'coronavirus-sars-cov-2-causes-covid-19-disease.jpg', '', 1, '/img/galerie/coronavirus-sars-cov-2-causes-covid-19-disease.jpg', '/img/galerie/thumb/coronavirus-sars-cov-2-causes-covid-19-disease.jpg', 'reditelka@msval.cz', '2020-08-20 12:28:40'),
(21, '100609369-150034419911028-1340891246532493312-o.jpg', '', 1, '/img/galerie/100609369-150034419911028-1340891246532493312-o.jpg', '/img/galerie/thumb/100609369-150034419911028-1340891246532493312-o.jpg', 'reditelka@msval.cz', '2020-08-20 12:36:16'),
(22, 'img-6697.jpg', '', 1, '/img/galerie/img-6697.jpg', '/img/galerie/thumb/img-6697.jpg', 'reditelka@msval.cz', '2020-08-21 13:06:02'),
(23, 'img-20200525-055707.jpg', '', 2, '/img/galerie/img-20200525-055707.jpg', '/img/galerie/thumb/img-20200525-055707.jpg', 'reditelka@msval.cz', '2020-08-21 13:09:48'),
(24, 'img-20200525-055715.jpg', '', 2, '/img/galerie/img-20200525-055715.jpg', '/img/galerie/thumb/img-20200525-055715.jpg', 'reditelka@msval.cz', '2020-08-21 13:09:49'),
(25, 'img-20200525-055846.jpg', '', 2, '/img/galerie/img-20200525-055846.jpg', '/img/galerie/thumb/img-20200525-055846.jpg', 'reditelka@msval.cz', '2020-08-21 13:09:50'),
(26, 'img-20200525-055932.jpg', '', 2, '/img/galerie/img-20200525-055932.jpg', '/img/galerie/thumb/img-20200525-055932.jpg', 'reditelka@msval.cz', '2020-08-21 13:09:50'),
(28, 'img-20200525-060019.jpg', '', 2, '/img/galerie/img-20200525-060019.jpg', '/img/galerie/thumb/img-20200525-060019.jpg', 'reditelka@msval.cz', '2020-08-21 13:09:51'),
(33, '22424195-376637232759511-8208698983822804899-o.jpg', '', 3, '/img/galerie/22424195-376637232759511-8208698983822804899-o.jpg', '/img/galerie/thumb/22424195-376637232759511-8208698983822804899-o.jpg', 'reditelka@msval.cz', '2020-08-24 07:41:39'),
(34, '22467448-376655249424376-5978657987224014271-o.jpg', '', 3, '/img/galerie/22467448-376655249424376-5978657987224014271-o.jpg', '/img/galerie/thumb/22467448-376655249424376-5978657987224014271-o.jpg', 'reditelka@msval.cz', '2020-08-24 07:41:39'),
(35, 'img-20200219-093912.jpg', '', 3, '/img/galerie/img-20200219-093912.jpg', '/img/galerie/thumb/img-20200219-093912.jpg', 'reditelka@msval.cz', '2020-08-24 07:50:45'),
(36, 'img-20180322-091148.jpg', '', 3, '/img/galerie/img-20180322-091148.jpg', '/img/galerie/thumb/img-20180322-091148.jpg', 'reditelka@msval.cz', '2020-08-24 07:50:46'),
(37, 'martinske-rohlicky.jpg', '', 3, '/img/galerie/martinske-rohlicky.jpg', '/img/galerie/thumb/martinske-rohlicky.jpg', 'reditelka@msval.cz', '2020-08-24 07:50:46'),
(38, 'domecky.jpg', '', 4, '/img/galerie/domecky.jpg', '/img/galerie/thumb/domecky.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:31'),
(39, '1skolni-zahradka.jpg', '', 4, '/img/galerie/1skolni-zahradka.jpg', '/img/galerie/thumb/1skolni-zahradka.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:31'),
(40, '22550488-379718662451368-4921921139221629928-o.jpg', '', 4, '/img/galerie/22550488-379718662451368-4921921139221629928-o.jpg', '/img/galerie/thumb/22550488-379718662451368-4921921139221629928-o.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:31'),
(41, 'img-20200303-105356.jpg', '', 4, '/img/galerie/img-20200303-105356.jpg', '/img/galerie/thumb/img-20200303-105356.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:32'),
(42, 'pecujeme-o-zahradu.jpg', '', 4, '/img/galerie/pecujeme-o-zahradu.jpg', '/img/galerie/thumb/pecujeme-o-zahradu.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:32'),
(43, 'dsc09012.jpg', '', 4, '/img/galerie/dsc09012.jpg', '/img/galerie/thumb/dsc09012.jpg', 'reditelka@msval.cz', '2020-08-24 07:53:33'),
(44, 'dsc08922.jpg', '', 5, '/img/galerie/dsc08922.jpg', '/img/galerie/thumb/dsc08922.jpg', 'reditelka@msval.cz', '2020-08-24 09:23:53'),
(45, 'v-lanovem-centru.jpg', '', 5, '/img/galerie/v-lanovem-centru.jpg', '/img/galerie/thumb/v-lanovem-centru.jpg', 'reditelka@msval.cz', '2020-08-24 09:23:54'),
(47, '105634836-158927065688430-520917776181921666-o.jpg', '', 5, '/img/galerie/105634836-158927065688430-520917776181921666-o.jpg', '/img/galerie/thumb/105634836-158927065688430-520917776181921666-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:23:54'),
(52, '109653345-166117961636007-7468281197873990477-o.jpg', '', 7, '/img/galerie/109653345-166117961636007-7468281197873990477-o.jpg', '/img/galerie/thumb/109653345-166117961636007-7468281197873990477-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:28:07'),
(53, '109736014-166123198302150-8256083884651164820-o.jpg', '', 7, '/img/galerie/109736014-166123198302150-8256083884651164820-o.jpg', '/img/galerie/thumb/109736014-166123198302150-8256083884651164820-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:28:07'),
(54, '110076020-166904964890640-6230873432377219955-o.jpg', '', 7, '/img/galerie/110076020-166904964890640-6230873432377219955-o.jpg', '/img/galerie/thumb/110076020-166904964890640-6230873432377219955-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:28:07'),
(55, '110031765-167036648210805-6342444523250239231-o.jpg', '', 7, '/img/galerie/110031765-167036648210805-6342444523250239231-o.jpg', '/img/galerie/thumb/110031765-167036648210805-6342444523250239231-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:28:07'),
(56, '110041477-166901924890944-2381779167662279843-o.jpg', '', 7, '/img/galerie/110041477-166901924890944-2381779167662279843-o.jpg', '/img/galerie/thumb/110041477-166901924890944-2381779167662279843-o.jpg', 'reditelka@msval.cz', '2020-08-24 09:28:08'),
(58, 'img-20200219-095119.jpg', '', 3, '/img/galerie/img-20200219-095119.jpg', '/img/galerie/thumb/img-20200219-095119.jpg', 'reditelka@msval.cz', '2020-08-24 09:30:39'),
(59, 'img-20200525-055932.jpg', '', 2, '/img/galerie/img-20200525-055932.jpg', '/img/galerie/thumb/img-20200525-055932.jpg', 'reditelka@msval.cz', '2020-08-24 09:35:49'),
(63, '116593246-168939731353830-4411503959164347652-o.jpg', '', 7, '/img/galerie/116593246-168939731353830-4411503959164347652-o.jpg', '/img/galerie/thumb/116593246-168939731353830-4411503959164347652-o.jpg', 'reditelka@msval.cz', '2020-08-24 12:41:45'),
(64, '45188709-577262029363696-8096531360375635968-o.jpg', '', 5, '/img/galerie/45188709-577262029363696-8096531360375635968-o.jpg', '/img/galerie/thumb/45188709-577262029363696-8096531360375635968-o.jpg', 'reditelka@msval.cz', '2020-08-24 15:34:40'),
(65, '46853638-593265791096653-4515155666377113600-o.jpg', '', 5, '/img/galerie/46853638-593265791096653-4515155666377113600-o.jpg', '/img/galerie/thumb/46853638-593265791096653-4515155666377113600-o.jpg', 'reditelka@msval.cz', '2020-08-24 15:35:18'),
(66, '105565791-158927305688406-1940696064785346128-o.jpg', '', 5, '/img/galerie/105565791-158927305688406-1940696064785346128-o.jpg', '/img/galerie/thumb/105565791-158927305688406-1940696064785346128-o.jpg', 'reditelka@msval.cz', '2020-08-24 15:35:55'),
(67, 'img-20200525-060032.jpg', '', 2, '/img/galerie/img-20200525-060032.jpg', '/img/galerie/thumb/img-20200525-060032.jpg', 'reditelka@msval.cz', '2020-08-24 15:36:44'),
(68, 'img-20200618-111556.jpg', '', 6, '/img/galerie/img-20200618-111556.jpg', '/img/galerie/thumb/img-20200618-111556.jpg', 'reditelka@msval.cz', '2020-08-24 15:49:00'),
(70, 'img-20200824-152626.jpg', '', 6, '/img/galerie/img-20200824-152626.jpg', '/img/galerie/thumb/img-20200824-152626.jpg', 'reditelka@msval.cz', '2020-08-24 15:49:31'),
(73, 'dscn6576.jpg', '', 6, '/img/galerie/dscn6576.jpg', '/img/galerie/thumb/dscn6576.jpg', 'reditelka@msval.cz', '2020-08-24 15:52:21'),
(74, '74807464-800171293739434-481324361953837056-o.jpg', '', 6, '/img/galerie/74807464-800171293739434-481324361953837056-o.jpg', '/img/galerie/thumb/74807464-800171293739434-481324361953837056-o.jpg', 'reditelka@msval.cz', '2020-08-24 15:54:05'),
(75, 'img-20200824-152552.jpg', '', 6, '/img/galerie/img-20200824-152552.jpg', '/img/galerie/thumb/img-20200824-152552.jpg', 'reditelka@msval.cz', '2020-08-24 15:58:16'),
(76, '106196852-160291832218620-6470930196877930273-o.jpg', '', 6, '/img/galerie/106196852-160291832218620-6470930196877930273-o.jpg', '/img/galerie/thumb/106196852-160291832218620-6470930196877930273-o.jpg', 'reditelka@msval.cz', '2020-08-24 15:59:53');

-- --------------------------------------------------------

--
-- Struktura tabulky `gallery_album`
--

CREATE TABLE `gallery_album` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `gallery_album`
--

INSERT INTO `gallery_album` (`id`, `short_name`, `name`) VALUES
(1, 'nezarazeno', 'Nezařazeno'),
(2, 'prostory', 'Prostory'),
(3, 've-skolce', 'Ve školce'),
(4, 'venku', 'Venku'),
(5, 'akce', 'Akce'),
(6, 'kuchyne', 'Kuchyně'),
(7, 'primestsky-tabor', 'Příměstský tábor');

-- --------------------------------------------------------

--
-- Struktura tabulky `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(100) NOT NULL,
  `confirmed` varchar(5) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `token`, `confirmed`, `created_at`) VALUES
(1, 'andrsak85@gmail.com', '8d8037f57d896b45d704073e35bc460412154572', 'ANO', 1584975519),
(2, 'katerina.ptak@gmail.com', 'c8c424a36d22dc6ff04e7c813971e7cf2b36a49c', '', 1598018626);

-- --------------------------------------------------------

--
-- Struktura tabulky `organisation`
--

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gsm` varchar(20) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal` varchar(10) NOT NULL,
  `ico` varchar(15) NOT NULL,
  `dic` varchar(15) NOT NULL,
  `account` varchar(50) NOT NULL,
  `section_about` varchar(5) NOT NULL,
  `section_univ` varchar(5) NOT NULL,
  `section_news` varchar(5) NOT NULL,
  `section_team` varchar(5) NOT NULL,
  `section_gallery` varchar(5) NOT NULL,
  `section_sponsors` varchar(5) NOT NULL,
  `section_clients` varchar(5) NOT NULL,
  `section_rank` varchar(5) NOT NULL,
  `section_contact` varchar(5) NOT NULL,
  `section_food` varchar(5) NOT NULL,
  `section_download` varchar(5) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='about organisation';

--
-- Vypisuji data pro tabulku `organisation`
--

INSERT INTO `organisation` (`id`, `short_name`, `name`, `logo`, `email`, `phone`, `gsm`, `street`, `city`, `postal`, `ico`, `dic`, `account`, `section_about`, `section_univ`, `section_news`, `section_team`, `section_gallery`, `section_sponsors`, `section_clients`, `section_rank`, `section_contact`, `section_food`, `section_download`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, 'MŠ Val', 'Mateřská školka Val', '/organisations/1/main_logo.png', 'reditel@msval.cz', '+420 733 325 281', '+420 603 270 944', 'Val 14', 'Dobruška', '518 01', '70188386', '', '162920512/0600', 'ANO', 'ANO', 'ANO', 'ANO', 'ANO', 'ANO', 'NE', 'ANO', 'ANO', 'ANO', 'ANO', 'andrsak85@gmail.com', 1582889043, 'reditelka@msval.cz', 1598014145);

-- --------------------------------------------------------

--
-- Struktura tabulky `organisation_clients`
--

CREATE TABLE `organisation_clients` (
  `id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `image_url` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `organisation_clients`
--

INSERT INTO `organisation_clients` (`id`, `organisation_id`, `name`, `link`, `image_url`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, 1, 'fgjgfjh', 'ghjhg', '/organisations/1/image_client_1.png', 'andrsak85@gmail.com', 1588753330, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `organisation_employees`
--

CREATE TABLE `organisation_employees` (
  `id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gsm` varchar(20) NOT NULL,
  `position` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `organisation_employees`
--

INSERT INTO `organisation_employees` (`id`, `organisation_id`, `firstname`, `lastname`, `email`, `gsm`, `position`, `image`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(4, 1, 'Kateřina', 'Ptáčková', 'reditelka@msval.cz', '+420 603 270 944', 'ředitelka MŠ', '/organisations/1/image_employee_4.jpg', 'andrsak85@gmail.com', 1584024274, 'reditelka@msval.cz', 1598014118),
(5, 1, 'Helena', 'Čepelková', '', '', 'učitelka', '/organisations/1/image_employee_5.png', 'andrsak85@gmail.com', 1584024331, 'andrsak85@gmail.com', 1585808274),
(6, 1, 'Olga', 'Ryglová', '', '', 'učitelka / chůva', '/organisations/1/image_employee_6.png', 'andrsak85@gmail.com', 1584024372, 'andrsak85@gmail.com', 1585808513),
(7, 1, 'Kamila', 'Vondřejcová', '', '', 'učitelka', '/organisations/1/image_employee_7.png', 'andrsak85@gmail.com', 1584024402, 'andrsak85@gmail.com', 1585808546),
(8, 1, 'Petra', 'Polášková', 'jidelna@msval.cz', '', 'Vedoucí školní jídelny / kuchařka', '/organisations/1/image_employee_8.png', 'andrsak85@gmail.com', 1584024451, 'andrsak85@gmail.com', 1585808560),
(10, 1, 'Michal', 'Poláček', '', '', 'školník', '/organisations/1/image_employee_10.png', 'andrsak85@gmail.com', 1584024512, 'andrsak85@gmail.com', 1585808587);

-- --------------------------------------------------------

--
-- Struktura tabulky `organisation_ranks`
--

CREATE TABLE `organisation_ranks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `stars` int(11) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ranks (napsali o nas)';

--
-- Vypisuji data pro tabulku `organisation_ranks`
--

INSERT INTO `organisation_ranks` (`id`, `title`, `content`, `stars`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(6, 'Skvělá kuchařka', '<p>Skvěl&aacute; mateřsk&aacute; &scaron;kolka pln&aacute; př&iacute;rody, skvěl&yacute;ch aktivit pro děti, individu&aacute;ln&iacute;ho a l&aacute;skypln&eacute;ho př&iacute;stupu ke každ&eacute;mu, porozuměn&iacute; a vstř&iacute;cnosti. Zdej&scaron;&i', 5, 'Lada', 1598017600, '', 0),
(7, 'Parádní škola', '<p>Za mne a moje tři holky super. Z lidsk&eacute; str&aacute;nky jsem moc spokojen&aacute;. Když jsem d&aacute;vala prvn&iacute; dceru, bylo j&iacute; dva a půl. Byla jsem moc r&aacute;da, když mi řekli, že to tam probreci... Zkusila jsem to za půl roku z', 5, 'Klára', 1598017796, '', 0),
(8, 'Vesnická', '<p>M&Scaron; Val vřele doporučuji. Tato &scaron;kolka je velice vstř&iacute;cn&aacute;, př&aacute;telsk&aacute; až rodinn&eacute;ho typu. Pan&iacute; učitelky vč. pan&iacute; kuchařky jsou každ&yacute; den usměvav&eacute;, vesel&eacute;, mil&eacute;. V&ya', 5, 'Žaneta', 1598017981, '', 0),
(9, 'Individuální přístup', '<p>Ve &scaron;kolce je super individu&aacute;ln&iacute; př&iacute;stup, rodinn&yacute; kolektiv, že děti drž&iacute; při sobě. Hodně času tr&aacute;v&iacute; v př&iacute;rodě. ????Za n&aacute;s nejlep&scaron;&iacute; &scaron;kolka ?</p>', 5, 'Pavel', 1598018052, '', 0),
(10, 'Čím víc špinavý, tím víc šťastní', '<p>Př&aacute;la bych v&scaron;em dětem , aby mohly vyrůstat v tak pohodov&eacute; &scaron;kolce , jako je tato.&nbsp; Kluci nejdř&iacute;v chodili na ,,zvykačku&rdquo; a po určit&eacute; době na cel&yacute; den. Byla jsem vždy zvědav&aacute; a tě&scaron;ila se na info ze &scaron;kolky. Komunikace je a byla perfektn&iacute;.&nbsp; &Uacute;směvy , perfektn&iacute; n&aacute;lada a lidsky př&iacute;stup, to je to nejdůležitěj&scaron;&iacute;. Děti se k sobě chovaj&iacute; moc hezky. L&iacute;b&iacute; se mi, že se snaž&iacute; naj&iacute;t cestičku, když je nějak&yacute; probl&eacute;m , aby se vyře&scaron;il v klidu. Cel&yacute; Person&aacute;l je perfektn&iacute; a k pan&iacute; kuchaře půjdu na kurz vařen&iacute;?Děkuji za v&scaron;e a d&iacute;ky za kluky, č&iacute;m v&iacute;c &scaron;pinav&yacute;, t&iacute;m v&iacute;c &scaron;ťastn&iacute; ?</p>\n<p>Moc V&aacute;m fand&iacute;m ❤️</p>', 5, 'Petra', 1598265919, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `organisation_sponsors`
--

CREATE TABLE `organisation_sponsors` (
  `id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `image_url` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `organisation_sponsors`
--

INSERT INTO `organisation_sponsors` (`id`, `organisation_id`, `name`, `link`, `image_url`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, 1, 'LA-MA', 'https://www.fler.cz/la-ma-kids-and-women', '/organisations/1/image_sponsor_1.jpg', 'andrsak85@gmail.com', 1586860858, 'reditelka@msval.cz', 1598013742),
(6, 1, 'Kominictví M&M', 'http://mm-kominictvi.cz/', '/organisations/1/image_sponsor_6.jpg', 'andrsak85@gmail.com', 1586863906, 'reditelka@msval.cz', 1598013873),
(7, 1, 'Kovošubrt', 'http://www.kovosubrt.cz/', '/organisations/1/image_sponsor_7.jpg', 'reditelka@msval.cz', 1598013968, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section_type` varchar(100) NOT NULL,
  `section_priority` int(11) NOT NULL,
  `section_width` int(11) NOT NULL,
  `section_columns` int(11) NOT NULL,
  `section_title` text NOT NULL,
  `section_content` text NOT NULL,
  `section_image` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `sections`
--

INSERT INTO `sections` (`id`, `section_type`, `section_priority`, `section_width`, `section_columns`, `section_title`, `section_content`, `section_image`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, 'about', 1, 12, 4, 'Vítá Vás Mateřská školka VAL', '', '/sections/1/logo.png', 'andrsak85@gmail.com', 1582889043, 'reditelka@msval.cz', 1595332819),
(2, 'univ', 2, 12, 6, 'Denní režim a životospráva', '', '', 'andrsak85@gmail.com', 1584359030, 'reditelka@msval.cz', 1598256421);

-- --------------------------------------------------------

--
-- Struktura tabulky `sections_details`
--

CREATE TABLE `sections_details` (
  `id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `detail_title` varchar(255) NOT NULL,
  `detail_content` text NOT NULL,
  `detail_image` varchar(255) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `created_at` int(11) NOT NULL,
  `editor` varchar(100) NOT NULL,
  `edited_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='souvisejici obory s organizaci';

--
-- Vypisuji data pro tabulku `sections_details`
--

INSERT INTO `sections_details` (`id`, `sections_id`, `detail_title`, `detail_content`, `detail_image`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(11, 1, 'Příroda', '<p style=\"text-align: center;\">Valsk&aacute; &scaron;kolka je v&yacute;bornou alternativou mezi lesn&iacute; a st&aacute;tn&iacute; &scaron;kolkou. Maximum času tr&aacute;v&iacute;me s dětmi venku. M&aacute;me rozlehlou zahradu, na kterou navazuje star&yacute; sad, pole a les.&nbsp;</p>', '/sections/1/image_detail_11.jpg', 'andrsak85@gmail.com', 1584539515, 'reditelka@msval.cz', 1598253933),
(12, 2, 'Denní režim', '<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\">&nbsp;</p>\n<table class=\"MsoNormalTable\" style=\"border-collapse: collapse; border-color: initial; border-style: solid; float: left;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">Tř&iacute;da mlad&scaron;&iacute;ch dět&iacute;</span></strong></p>\n</td>\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">Tř&iacute;da star&scaron;&iacute;ch dět&iacute;</span></strong></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">6:00 - 8:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- spont&aacute;nn&iacute; hry a činnosti dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- jazykov&eacute; chvilky, smyslov&eacute; hry</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pohybov&eacute; chvilky</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- didakticky c&iacute;len&aacute; činnost</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- individu&aacute;ln&iacute; p&eacute;če o děti</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">6:00 - 8:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- spont&aacute;nn&iacute; hry a činnosti dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- jazykov&eacute; chvilky, smyslov&eacute; hry</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pohybov&eacute; chvilky</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- didakticky c&iacute;len&aacute; činnost</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- individu&aacute;ln&iacute; p&eacute;če o děti</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- komunitn&iacute; kruh</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">8:00 - 8:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, svačina</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">8:30 - 9:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, svačina</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 3;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">8:30 - 11:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- komunitn&iacute; kruh</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pobyt venku</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- didakticky ř&iacute;zen&aacute; činnost</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pohybov&eacute; činnosti</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hry dle volby a př&aacute;n&iacute; dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- aktu&aacute;ln&iacute; nepl&aacute;novan&eacute; vzděl&aacute;vac&iacute; činnosti</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">9:00 - 12:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pobyt venku</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- didakticky ř&iacute;zen&aacute; činnost</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- pohybov&eacute; činnosti</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hry dle volby a př&aacute;n&iacute; dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- aktu&aacute;ln&iacute; nepl&aacute;novan&eacute; vzděl&aacute;vac&iacute; činnosti</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 4;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">11:30 - 12:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, oběd</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">12:00 - 12:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, oběd</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 5;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">12:00 - 14:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, př&iacute;prava na odpočinek</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- poslech a četba</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- odpočinek a klidov&eacute; činnosti</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">12:30 - 14:30</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, př&iacute;prava na odpočinek</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- poslech a četba</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- odpočinek a klidov&eacute; činnosti</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 6;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">14:30 - 15:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, svačina</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">14:30 - 15:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- hygiena, svačina</span></p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 7; mso-yfti-lastrow: yes;\">\n<td style=\"width: 230.3pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">15:00 - 16:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- dokončov&aacute;n&iacute; dopoledn&iacute;ch činnost&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- spont&aacute;nn&iacute; a skupinov&eacute; hry dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- individu&aacute;ln&iacute; p&eacute;če o děti</span></p>\n</td>\n<td style=\"width: 230.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"307\">\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><strong style=\"mso-bidi-font-weight: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">15:00 - 16:00</span></strong></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- dokončov&aacute;n&iacute; dopoledn&iacute;ch činnost&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- spont&aacute;nn&iacute; a skupinov&eacute; hry dět&iacute;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">- individu&aacute;ln&iacute; p&eacute;če o děti</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; text-align: center; line-height: normal;\" align=\"center\"><span style=\"font-size: 12.0pt; font-family: \'Times New Roman\',\'serif\';\">&nbsp;</span></p>\n<p class=\"ListParagraph\" style=\"margin: 0cm; margin-bottom: .0001pt; line-height: normal;\">&nbsp;</p>', '/sections/2/image_detail_12.jpg', 'andrsak85@gmail.com', 1584614272, 'reditelka@msval.cz', 1598013089),
(15, 1, 'Budoucnost', '<p style=\"text-align: center;\">Jsme typickou vesnickou &scaron;kolkou a z toho vych&aacute;z&iacute; i na&scaron;e filozofie. Na&scaron;&iacute;m z&aacute;měrem je vychovat samostatn&eacute;, sebevědom&eacute; d&iacute;tě s respektem ke v&scaron;emu živ&eacute;mu. Podporujeme v dětech &uacute;ctu k tradic&iacute;m na&scaron;ich předků a k venkovsk&eacute;mu stylu života. Ke každ&eacute;mu d&iacute;těti přistupujeme individu&aacute;lně a db&aacute;me na v&scaron;estrann&yacute; rozvoj va&scaron;eho d&iacute;těte.</p>', '/sections/1/image_detail_15.jpg', 'andrsak85@gmail.com', 1598254401, 'reditelka@msval.cz', 1598256052),
(16, 1, 'Rodina', '<p style=\"text-align: center;\"><span style=\"color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; text-align: center; background-color: #ffffff;\">Dobře funguj&iacute;c&iacute; spolupr&aacute;ce s rodinou je z&aacute;kladn&iacute;m stavebn&iacute;m kamenem na&scaron;&iacute; pr&aacute;ce. Je pro n&aacute;s důležit&eacute; přistupovat ke v&scaron;em individu&aacute;lně, s respektem a důvěrou.&nbsp;</span></p>', '/sections/1/image_detail_16.jpg', 'reditelka@msval.cz', 1598256297, '', 0),
(17, 2, 'Životospráva', '<p>V&scaron;echny děti jsou podporov&aacute;ny k samostatn&eacute; př&iacute;pravě svačiny a oběda. Men&scaron;&iacute;m dětem pom&aacute;h&aacute; učitelka nebo star&scaron;&iacute; děti. V&scaron;echny děti si mažou pečivo samy, pokud maj&iacute; např. lup&iacute;nky, zept&aacute; se učitelka každ&eacute;ho zvl&aacute;&scaron;ť, zda chce ml&eacute;ko či ne. K dětem přistupujeme v oblasti stravov&aacute;n&iacute; velmi individu&aacute;lně. Mus&iacute; se ale dodržet dan&aacute; pravidla. Děti mohou ovlivnit množstv&iacute; j&iacute;dla pod&aacute;van&eacute;ho pan&iacute; kuchařkou. Umožňujeme dětem možnost v&yacute;běru.</p>\n<p>Pravidla pro děti:</p>\n<p>- J&iacute;dlo alespoň ochutn&aacute;m</p>\n<p>- J&iacute;dlo j&iacute;st nemus&iacute;m, ale nemluv&iacute;m o něm o&scaron;klivě</p>\n<p>- Co si d&aacute;me na tal&iacute;ř, to se snaž&iacute;me sn&iacute;st (d&aacute;v&aacute;me si raději m&aacute;lo, a pak si přid&aacute;me)</p>\n<p>- Řekneme pan&iacute; kuchařce, co chceme a co ne</p>\n<p>&nbsp;</p>\n<p>Pravidla pro pedagogy:</p>\n<p>- J&iacute;t dětem př&iacute;kladem &ndash; obědv&aacute;me s dětmi, dovedeme j&iacute;dlo ocenit.</p>\n<p>- Nikdy do j&iacute;dla děti nenut&iacute;me, snaž&iacute;me se motivovat a určujeme s dětmi pravidla t&yacute;kaj&iacute;c&iacute; se j&iacute;dla.</p>\n<p>&nbsp;</p>\n<p>Děti jsou každ&yacute; den venku, kde maj&iacute; dostatek voln&eacute;ho pohybu. D&eacute;lky dopoledn&iacute;ch a odpoledn&iacute;ch pobytů venku jsou přizpůsobeny počas&iacute; a stavu ovzdu&scaron;&iacute;.&nbsp;</p>\n<p>V denn&iacute;m programu je respektov&aacute;na individu&aacute;ln&iacute; potřeba aktivity, sp&aacute;nku a odpočinku jednotliv&yacute;ch dět&iacute;. Děti s potřebou sp&aacute;nku po obědě odpoč&iacute;vaj&iacute; na lůžku. Dětem s niž&scaron;&iacute; potřebou sp&aacute;nku je nab&iacute;zen klidov&yacute; program nebo je tento čas využit učitelkou pro individu&aacute;ln&iacute; pr&aacute;ci s d&iacute;tětem. Pokud n&aacute;m to počas&iacute; umožn&iacute;, odpoč&iacute;vaj&iacute; děti i venku.&nbsp;</p>\n<p>&nbsp;</p>', '/sections/2/image_detail_17.jpg', 'reditelka@msval.cz', 1598258500, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL COMMENT 'user ID',
  `firstname` varchar(50) NOT NULL COMMENT 'firstname',
  `lastname` varchar(50) NOT NULL COMMENT 'lastname',
  `password` text NOT NULL COMMENT 'user password',
  `email` varchar(100) NOT NULL COMMENT 'e-mail',
  `street` varchar(100) NOT NULL COMMENT 'street address',
  `city` varchar(100) NOT NULL COMMENT 'city address',
  `postal` varchar(10) NOT NULL COMMENT 'zip/postal code',
  `gsm` varchar(20) NOT NULL COMMENT 'telephone, GSM',
  `notice` text NOT NULL COMMENT 'notice',
  `role` varchar(50) NOT NULL COMMENT 'user role',
  `active` varchar(5) NOT NULL COMMENT 'active user (true/false)',
  `token` varchar(100) NOT NULL,
  `creator` varchar(100) NOT NULL COMMENT 'creator name',
  `created_at` int(11) NOT NULL COMMENT 'date of create',
  `editor` varchar(100) NOT NULL COMMENT 'editors name',
  `edited_at` int(11) NOT NULL COMMENT 'date of edit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `password`, `email`, `street`, `city`, `postal`, `gsm`, `notice`, `role`, `active`, `token`, `creator`, `created_at`, `editor`, `edited_at`) VALUES
(1, 'Tomáš', 'Andrš', '$2y$10$/2pFh9cWtl6m.TgZunDUxOiyyzqvQpLbQdneacW21L1yCIuxFcF.a', 'andrsak85@gmail.com', 'Ulice 25', 'Město', '123 45', '724 708 808', 'Poznámka', 'Admin', 'ANO', '', '', 0, 'admin@example.com', 1589368934),
(2, 'Kateřina', 'Ptáčková', '$2y$10$yRRkdfjb8Ec0lvlUWpVbQO7/dHXFpyolESBLZJWWfVUL/N7YrvHB6', 'reditelka@msval.cz', '', '', '', '', '', 'Admin', 'ANO', '9933d8c193d969c33dfc53d1b9a9abe24329ebaa', 'andrsak85@gmail.com', 1591096189, 'andrsak85@gmail.com', 1595309723);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `articles_gallery`
--
ALTER TABLE `articles_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`articles_id`),
  ADD KEY `gallery_id` (`gallery_id`) USING BTREE;

--
-- Klíče pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_id` (`articles_id`) USING BTREE;

--
-- Klíče pro tabulku `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Klíče pro tabulku `files_category`
--
ALTER TABLE `files_category`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `food_alergens`
--
ALTER TABLE `food_alergens`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `food_menu`
--
ALTER TABLE `food_menu`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`) USING BTREE;

--
-- Klíče pro tabulku `gallery_album`
--
ALTER TABLE `gallery_album`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `organisation_clients`
--
ALTER TABLE `organisation_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_id` (`organisation_id`) USING BTREE;

--
-- Klíče pro tabulku `organisation_employees`
--
ALTER TABLE `organisation_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_id` (`organisation_id`);

--
-- Klíče pro tabulku `organisation_ranks`
--
ALTER TABLE `organisation_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `organisation_sponsors`
--
ALTER TABLE `organisation_sponsors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_id` (`organisation_id`) USING BTREE;

--
-- Klíče pro tabulku `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `sections_details`
--
ALTER TABLE `sections_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_id` (`sections_id`) USING BTREE;

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `articles_gallery`
--
ALTER TABLE `articles_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pro tabulku `files_category`
--
ALTER TABLE `files_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `food_alergens`
--
ALTER TABLE `food_alergens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pro tabulku `food_menu`
--
ALTER TABLE `food_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pro tabulku `gallery_album`
--
ALTER TABLE `gallery_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `organisation_clients`
--
ALTER TABLE `organisation_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `organisation_employees`
--
ALTER TABLE `organisation_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `organisation_ranks`
--
ALTER TABLE `organisation_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `organisation_sponsors`
--
ALTER TABLE `organisation_sponsors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `sections_details`
--
ALTER TABLE `sections_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'user ID', AUTO_INCREMENT=3;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `articles_gallery`
--
ALTER TABLE `articles_gallery`
  ADD CONSTRAINT `articles_gallery_ibfk_1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_gallery_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `files_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `gallery_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `organisation_clients`
--
ALTER TABLE `organisation_clients`
  ADD CONSTRAINT `organisation_clients_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `organisation_employees`
--
ALTER TABLE `organisation_employees`
  ADD CONSTRAINT `organisation_employees_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `organisation_sponsors`
--
ALTER TABLE `organisation_sponsors`
  ADD CONSTRAINT `organisation_sponsors_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `sections_details`
--
ALTER TABLE `sections_details`
  ADD CONSTRAINT `sections_details_ibfk_1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

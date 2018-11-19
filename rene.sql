-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2018 at 02:34 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rene`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(6) NOT NULL COMMENT 'Category ID',
  `name` varchar(255) NOT NULL COMMENT 'Category name',
  `description` text COMMENT 'Category description',
  `image` text COMMENT 'Category image',
  `parent_category_id` int(6) DEFAULT NULL COMMENT 'Parent Category ID',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active' COMMENT 'Category status',
  `content_type_id` int(6) DEFAULT NULL COMMENT 'ID of content type which hosts this category',
  `slug` varchar(255) NOT NULL COMMENT 'This is slug of category',
  `color` text COMMENT 'Color of category',
  `category_order` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Category model';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `image`, `parent_category_id`, `status`, `content_type_id`, `slug`, `color`, `category_order`) VALUES
(1, 'Doručak', 'U kategoriji Vesti možete pronaći najnovije informacije iz sveta automobilizma.', '', NULL, 'active', 2, 'dorucak', NULL, 1),
(2, 'Ručak', 'U ovoj kategoriji možete pročitati najnovije informacije o novim automobilima koje testiramo za Vas.', '', NULL, 'active', 2, 'rucak', NULL, 2),
(3, 'Večera', 'U ovoj kategoriji možete pročitati sve o četvorotočkašima koji su tek izašli na svetsko tržište.', '', NULL, 'active', 2, 'vecera', NULL, 3),
(4, 'Salate', 'U ovoj kategoriji možete pronaći informacije o turističkim destinacijama koje obilazimo za Vas.', '', NULL, 'active', 2, 'salate', NULL, 4),
(5, 'Dezerti', 'U ovoj rubrici možete pročitati zanimjive vesti.', '', NULL, 'active', 2, 'dezerti', '', 5),
(6, 'Dečija', '', '', NULL, 'active', 2, 'decija', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(9) NOT NULL COMMENT 'This is id of comment',
  `content_id` bigint(9) NOT NULL COMMENT 'This is content id',
  `author_name` varchar(55) NOT NULL COMMENT 'This is name of author',
  `created_on` datetime NOT NULL COMMENT 'This is date and time when comment created',
  `comment_content` text NOT NULL COMMENT 'This is content of comment',
  `status` enum('on moderation','approve','disapprove') NOT NULL DEFAULT 'on moderation',
  `comment_parent_id` bigint(9) DEFAULT NULL COMMENT 'This is id of parent comment',
  `user_id` int(11) DEFAULT NULL COMMENT 'This is id of (login) user',
  `email` varchar(255) DEFAULT NULL,
  `recommend` int(11) DEFAULT '0',
  `not_recommend` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Comment Model';

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content_id`, `author_name`, `created_on`, `comment_content`, `status`, `comment_parent_id`, `user_id`, `email`, `recommend`, `not_recommend`) VALUES
(1, 1, 'Boris', '2018-11-16 00:00:00', 'što su plave?', 'approve', NULL, NULL, 'boris.dovecer@gmail.com', 0, 0),
(2, 2, 'Boris', '2018-11-21 00:00:00', 'cccccccc', 'approve', NULL, NULL, 'vdvds', 0, 0),
(3, 3, 'rizbo', '2018-11-16 13:02:58', 'ne radi kako treba', 'approve', NULL, NULL, NULL, 0, 0),
(4, 5, 'Kata', '2018-11-16 18:46:58', 'ovo sam ja spremala', 'approve', NULL, NULL, 'dovecer.katarina@gmail.com', 0, 0),
(5, 10, 'Alisa', '2018-11-16 23:38:13', 'Krastavci su odlični', 'on moderation', NULL, NULL, 'nema@mail.jbg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` bigint(9) NOT NULL COMMENT 'Content ID',
  `title` varchar(255) NOT NULL COMMENT 'Content title',
  `description` text COMMENT 'Content description',
  `content_text` text COMMENT 'Content text',
  `image` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL COMMENT 'Datetime the Content was created on',
  `last_modified` datetime DEFAULT NULL COMMENT 'Datetime the Content was last modified on',
  `author_id` int(11) NOT NULL COMMENT 'ID of the User who created Content ',
  `ct_id` int(6) NOT NULL COMMENT 'Content Type of the created Content ',
  `category_id` int(6) DEFAULT NULL COMMENT 'Category of the created Content ',
  `produced_by` int(11) DEFAULT NULL COMMENT 'ID of the manufacturer of the Content ',
  `status` enum('on moderation','approve','request for edit','disapprove','journalist_finished','editor_finished') NOT NULL DEFAULT 'on moderation',
  `remark_approve` text COMMENT 'Remark for approve of content',
  `remark_request_for_edit` text COMMENT 'Remark for request for edit of product',
  `remark_disapprove` text COMMENT 'Remark for disapprove of product',
  `slug` varchar(255) NOT NULL COMMENT 'This is url_slug',
  `comments_allowed` enum('allow','not allow') NOT NULL DEFAULT 'allow' COMMENT 'This is status of comment',
  `hits` int(11) DEFAULT NULL COMMENT 'This is hits of content',
  `price` double DEFAULT '0' COMMENT 'This is price of content',
  `currency_id` int(6) DEFAULT NULL COMMENT 'This is currency_id of content price',
  `mod_title` varchar(50) DEFAULT NULL COMMENT 'On moderation content title',
  `mod_description` text COMMENT 'On moderation content description',
  `mod_content_text` text COMMENT 'On moderation content text',
  `mod_image` text COMMENT 'On moderation content image',
  `mod_category_id` int(6) DEFAULT NULL COMMENT 'On moderation category id of content',
  `mod_price` double DEFAULT NULL COMMENT 'On moderation content price',
  `mod_currency_id` int(6) DEFAULT NULL COMMENT 'Moderation currency id',
  `headline` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `lead` varchar(200) DEFAULT NULL,
  `gloss` varchar(60) DEFAULT NULL,
  `figure` varchar(60) DEFAULT NULL,
  `entrefilet_title` varchar(100) DEFAULT NULL,
  `entrefilet` varchar(300) DEFAULT NULL,
  `slider` int(1) DEFAULT '0',
  `order_in_slider` int(4) DEFAULT NULL,
  `recommended_on_site` int(1) DEFAULT '0',
  `order_in_recommended_on_site` int(4) DEFAULT NULL,
  `recommended_on_category` int(1) DEFAULT '0',
  `order_in_recommended_on_category` int(4) DEFAULT NULL,
  `text_image` int(11) DEFAULT NULL,
  `gloss_image` int(11) DEFAULT NULL,
  `entrefilet_image` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Content model';

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `title`, `description`, `content_text`, `image`, `created_on`, `last_modified`, `author_id`, `ct_id`, `category_id`, `produced_by`, `status`, `remark_approve`, `remark_request_for_edit`, `remark_disapprove`, `slug`, `comments_allowed`, `hits`, `price`, `currency_id`, `mod_title`, `mod_description`, `mod_content_text`, `mod_image`, `mod_category_id`, `mod_price`, `mod_currency_id`, `headline`, `subtitle`, `lead`, `gloss`, `figure`, `entrefilet_title`, `entrefilet`, `slider`, `order_in_slider`, `recommended_on_site`, `order_in_recommended_on_site`, `recommended_on_category`, `order_in_recommended_on_category`, `text_image`, `gloss_image`, `entrefilet_image`) VALUES
(1, 'Palačinke', '<p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p>', '<h5>Sastojci:&nbsp;</h5><ul><li>Brašno</li><li>Voda</li><li>Humus od cvekle</li><li>Masline</li><li>Majonez</li></ul>\r\n\r\n<h5>Priprema:&nbsp;</h5><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p>', 1, '2018-11-13 00:00:00', NULL, 1, 1, 3, 1, 'approve', NULL, NULL, NULL, 'palacinke-1', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 'Sojine šnicle i pire', '<p>Lagano. Zablejite na laptopu dok se vaša žena bavi Sojama. Skrolovati po fejzbuku, gledati memeove, istraživati najveće moguće gluposti i pritom biti što neefikasniji.&nbsp;</p>', '<p>Priprema:&nbsp;</p><p>Lagano. Zablejite na laptopu dok se vaša žena bavi Sojama.&nbsp;</p><p>Skrolovati po fejzbuku, gledati memeove, istraživati najveće moguće gluposti i pritom biti što neefikasniji.</p><p>Kad se zamorite od blejanja proverite da li je vaša žena spremila, ako nije onda treba smotati još jednu buksnu. Ako jeste, onda opet smotati da se pripremite psihički za tu količiinu soje.</p><p>&nbsp;</p><p>Savet:&nbsp;</p><p>Pohvaliti ženu šta god da uradi, glad ne bira.</p>', 2, '2018-11-06 00:00:00', NULL, 1, 1, 2, NULL, 'approve', NULL, NULL, NULL, 'sojine-snicle-i-pire-2', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(3, 'Pirinač i pečurke', '<p>Malo ovako, sve se pomeša, proprži da bude do jaja. Onda se stave začini da bude začinjeno.&nbsp;</p>', '<p>Malo ovako, sve se pomeša, proprži da bude do jaja. Onda se stave začini da bude začinjeno.&nbsp;</p>\r\n\r\n<h4>Priprema: &nbsp;</h4><p>Malo ovako, sve se pomeša, proprži da bude do jaja. Onda se stave začini da bude začinjeno.&nbsp;</p><p>Pakuje se po porcijama, jede se prohlađeno. Ne da bude hladno, al vrelo ne može da se jede. Zato je najbolje pustiti da se oladi. Jede se viljuškom koliko se sećam i ne treba <strong>hleb</strong>.</p><p>&nbsp;</p><h4>Savet:</h4><p>Može da se pije i <strong>jogurt</strong>. Ali veganski, ima na okretnici za 120 dinara pola kila.</p>', 3, '2018-01-29 00:00:00', NULL, 1, 1, 1, NULL, 'approve', NULL, NULL, NULL, 'pirinac-i-pecurke-3', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(4, 'Vegetarijanstvo i veganizam', '<p>Vegetarijanstvo i veganizam su još jedna od stvari koje su u ovoj zemlji totalno pogrešno shvaćene...</p>', '<p>Vegetarijanstvo i veganizam su još jedna od stvari koje su u ovoj zemlji totalno pogrešno shvaćene i ljudi se prema njima odnose sa određenom dozom konzervativnosti, kao i prema mnogim drugim veoma važnim stvarima.</p><p>Većina ljudi koji su otvorili ovu stranicu je već pri samom čitanju naslova okrenula stranicu i počela čitati neki drugi tekst u ovom magazinu.&nbsp;</p><p>Ali, nadam se da vas je dosta nastavilo, jer u ovom tekstu \"ćete naći mnoge stvari koje su vas možda zanimale, a nadam se da će se bar neko od vas odlučiti za ovaj način prehrane, koji je ujedno i jeftiniji od prehrane koja se zasniva na unošenju namirnica životinjskog porijekla!</p>', 4, '2018-11-15 00:00:00', NULL, 1, 2, NULL, NULL, 'approve', NULL, NULL, NULL, 'vegetarijanstvo-i-veganizam-4', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 'Uz dobru rižu svatko može', '<p>Riža se jednostavno priprema, dostupna je svima i vrlo brzo od nje nastaje prilog ili cjelovit obrok.</p>', '<p>Riža se jednostavno priprema, dostupna je svima i vrlo brzo od nje nastaje prilog ili cjelovit obrok.</p><p>Za pripremu jela s rižom ne morate imati godine iskustva ili biti vrhunski kuhar. S osnovnim kulinarskim vještinama može se napraviti puno, a uz malo učenja i prakse, jelo se može dovesti do savršenstva. Baš kao i tjestenina, <a href=\"https://www.podravka.hr/proizvodi/?query=ri%C5%BEa\">riža </a>ostavlja mnogo prostora za igranje okusima pa je se tako može spajati s povrćem, morskim plodovima, sirom, piletinom ili nekim drugim mesom.</p><p>Ukusna je i jednostavno kuhana te začinjena s malo kvalitetnog maslinova ulja. Ipak, treba imati na umu da je svaka riža specifična i ima odgovarajuću namjenu. Primjerice, za kremasti rižoto najbolja je <a href=\"https://www.podravka.hr/proizvod/riza-arborio-vakum/\">arborio riža</a>, a za priloge i salate savršena riža parboiled.&nbsp;</p>', 5, '2018-11-14 00:20:00', NULL, 1, 2, NULL, NULL, 'approve', NULL, NULL, NULL, 'uz-dobru-rizu-svatko-moze-biti-majstor kuhinje-5', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(6, 'Beskvasni kruh - pogača', '<p>Pjenjačom pomiješajte suhe sastojke, dodajte mineralnu vodu pa sve izmiješajte u jednoličnu smjesu - ovo je kruh koji se ne mijesi.</p>', '<h4>Sastojci</h4><ul><li>250 g integralnog brašna od pira&nbsp;</li><li>po 1 žlica mljevenog lana, sezama i suncokreta&nbsp;</li><li>½ žličice ninske soli&nbsp;</li><li>½ žličice sode bikarbone (bez aluminija)&nbsp;</li><li>250 ml <a href=\"https://www.coolinarika.com/namirnica/mineralna-voda/\">mineralne vode</a>&nbsp;</li><li>1 žlica <a href=\"https://www.coolinarika.com/namirnica/maslinovo-ulje/\">maslinova ulja</a>&nbsp;</li></ul><p>&nbsp;</p><h4>Priprema</h4><p>Pjenjačom pomiješajte suhe sastojke, dodajte mineralnu vodu pa sve izmiješajte u jednoličnu smjesu - <strong>ovo je kruh koji se ne mijes</strong>i.</p><p>Tijesto premažite maslinovim uljem i špatulom prebacite na lim prekriven papirom za pečenje.</p><p>Pecite u prethodno zagrijanoj pećnici na 200°C 30-35 minuta. Pečeni kruh stavite na rešetku od pećnice te prekrijte s više slojeva krpe dok se ne ohladi.</p><p>&nbsp;</p><h4>Posluživanje</h4><p>Kruh se prepuručuje kod određenih zdravstvenih problema prema preporuci specijaliste ili liječnika. Nama se svidio pa sam se odlučila poigrati i s drugim varijantama beskvasnog kruha.</p><p>&nbsp;</p><p><strong>Savjet:</strong> Upotrebom neprosijanog brašna koji sadrži sve sastavne dijelove zrna preporučuje se da tijesto miruje 20 minuta prije njegove daljnje obrade.</p><p>&nbsp;</p>', 6, '2018-11-16 00:00:00', NULL, 1, 2, NULL, NULL, 'approve', NULL, NULL, NULL, 'beskvasni-kruh---pogaca', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(7, 'Krem od limuna', '<p>Da li znate da jedete nezrele krastavce? Zreli su veći, žuti i sa velikim semenkama.&nbsp;</p>', '<p>sadasda<br></p>', 1, '2018-11-16 23:18:03', NULL, 1, 1, 5, NULL, 'on moderation', NULL, NULL, NULL, 'krem-od-limuna', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(8, 'ssss', '<p>Da li znate da jedete nezrele krastavce? Zreli su veći, žuti i sa velikim semenkama.&nbsp;</p>', '<p>dssdds<br></p>', 2, '2018-11-16 23:20:16', NULL, 1, 1, 4, NULL, 'on moderation', NULL, NULL, NULL, 'sss', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(9, 'Karamel krem za tortu', '<p>Zagrejte sveže mleko dok ne bude vruće. Odvojite malo od njega za &nbsp;rastvaranje bra&scaron;na.</p>', '<header><h2><span style=\"font-size: 18px;\">Potrebni sastojci</span></h2></header><ul><li><strong>sveže mleko</strong> - &nbsp;1, 5 l</li><li><strong>&scaron;ećer</strong> - &nbsp;8 - 9 ka&scaron;ika za karamel + 5 ka&scaron;ika</li><li><strong>bra&scaron;no</strong> - &nbsp;9 ka&scaron;ika</li><li><strong>jaja</strong> - &nbsp;4 komada</li><li><strong>vanila</strong> - &nbsp;1 - 2 kesice</li><li><strong>maslac</strong> - &nbsp;oko 60 - 80 g</li></ul><p><br></p><p>Zagrejte sveže mleko dok ne bude vruće. Odvojite malo od njega za &nbsp;rastvaranje bra&scaron;na. U posebnoj posudi na pari karamelizirajte &scaron;ećer, dok &nbsp;ne dobijete lepu braon boju.</p><p><br></p><p>Postepeno dodajte vruće mleko i me&scaron;ajte, dok se karamel ne rastvori. Skinite sa vatre i ostavite da se lagano ohladi.</p><p><br></p><p>Umutite bra&scaron;no sa odvojenim mlekom i malo vode da dobijete glatku ka&scaron;u, &nbsp;pa sve to umutite sa jajima. Smesu sa jajima polako sipajte u <a href=\"https://bonapeti.rs/recepti/r-64170-Krem-karamel\">karamel</a> i mleko, uz neprestano mućenje mikserom.</p><p><br></p><p>&Scaron;erpu nakon toga stavite ponovo na vatru i me&scaron;ajte dok se krem ne zgusne. Na samom kraju dodajte <a href=\"https://bonapeti.rs/n8-85820-Vanila\">vanilu</a> za aromu i maslac, pa sve dobro prome&scaron;ajte. Krem možete konzumirati u ča&scaron;icama za desert ili ga možete koristiti za torte.</p><p><br></p><p>Po želji, možete da miksate prvo žumanca i krem, pa da posle u ohlađeni krem umutite sa snegom od umućenih belanaca.</p>', 7, '2018-11-16 23:25:44', NULL, 1, 1, 5, NULL, 'on moderation', NULL, NULL, NULL, 'karamel-krem-za-tortu', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL),
(10, 'Ovako se prave ukusni kiseli krastavčići', '<p>Da li znate da jedete nezrele krastavce? Zreli su veći, žuti i sa velikim semenkama.&nbsp;</p>', '<p>Da li znate da jedete nezrele <a href=\"https://bonapeti.rs/n7-84111-Krastavac\">krastavce</a>? Zreli su veći, žuti i sa velikim <a href=\"https://bonapeti.rs/semenke\">semenkama</a>. Između ostalog, u prevodu sa grčkog, reč &quot;aguros&quot; (tako su drevni Grci nazivali krastavac) znači - nezreo.&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p>90% ovog povrća je voda, &scaron;to ga čini idealnim za držanje zdrave &nbsp;dijete. Jedna od najpopularnijih varijanti za spremanje zimnice jesu <a href=\"https://bonapeti.rs/recepti/r-77109-Kiseli_krastavčići\">kiseli krastavčići</a>, koji su uvek popularni.&nbsp;</p><p>Priprema ukusnih kiselih krastavčića nimalo nije te&scaron;ka, a najvažnije je da se pridržavate recepta, korak po korak.&nbsp;</p><p>Sastojci koji su vam potrebni: sveži i mali krastavčići (korni&scaron;oni), koren i listovi <a href=\"https://bonapeti.rs/n8-82968-Ren\">rena</a>, semenke mirođije, <a href=\"https://bonapeti.rs/n7-83215-Beli_luk\">beli luk</a>, listići belog luka, zrna bibera, zrna <a href=\"https://bonapeti.rs/n8-86166-Piment\">pimenta</a>, sirće, &scaron;ećer i so.&nbsp;</p><p><img src=\"https://gradcontent.com/lib/600x350/kornishoni_prigotvqne.jpg\" style=\"width: 421px; height: 245.583px;\" class=\"fr-fic fr-dib\"></p><p>Obavezan uslov jeste da su krastavčići sveži, da imaju tvrdu koru i da su sitni.&nbsp;</p><p>Veoma dobro ih operite pod mlazom tekuće vode i potopite ih u hladnu vodu na 4-5 sati.&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp;</p><p>Dobro operite ren (koren i listove) i mirođiju pod mlazom &nbsp;tekuće vode i isecite ih. Očistite čenove belog luka i crni luk, pa ih &nbsp;isecite na polumesece.&nbsp;</p><p>Operite tegle i poklopce, pa ih poparite u vreloj vodi. Na dno &nbsp;tegle stavite isečen ren, mirođiju, beli i crni luk i zrna bibera. &nbsp;Isecite dr&scaron;ke krastavaca i poređajte ih u teglu, gusto da ih &nbsp;rasporedite, tako da prvi red bude uspravan, a preko da idu blago ukoso, &nbsp;ali nemojte puniti celu teglu do vrha, već da ima 2 prsta prostora.&nbsp;</p><p>Dodajte so, &scaron;ećer i sirće, tako da količina bude prema receptu, &nbsp;sipajte hladnu vodu (najbolje da bude prokuvana) jedan prst ispod vrha &nbsp;tegle. Zavijte pažljivo poklopac.&nbsp;</p><p>Kuvajte tegle u &scaron;erpi sa ro&scaron;tiljom ispod, a voda u kojoj se tegle &nbsp;kuvaju neka bude 3 prsta iznad poklopaca. Kada voda proključa, sklonite &nbsp;teglu sa vatre. Izvadite tegle iz vode i okrenite ih, tako da poklopac &nbsp;bude nadole. Ostavite ih tako, da se u potpunosti ohlade i va&scaron;i kiseli &nbsp;krastavčići su gotovi za zimu.&nbsp;</p><p><img src=\"https://gradcontent.com/lib/600x350/marinovani-kiseli-krastavichki.JPG\" style=\"width: 442px; height: 257.833px;\" class=\"fr-fic fr-dib\"></p><h3><span style=\"font-size: 18px;\">Recept za klasične sterilzovane kisele krastavčiće</span></h3><p>korni&scaron;oni - količina prema tegli&nbsp;</p><p>so - 1 ravna ka&scaron;ičica</p><p>&scaron;ećer - 1 puna ka&scaron;ičica</p><p>sirće - 40 ml (9 stepeni)</p><p>luk - 2-3 polumeseca</p><p>beli luk - 1 čen&nbsp;</p><p>piment - 1 zrno&nbsp;</p><p>biber - 5-6 zrna</p><p>koren rena - 1 parče</p><p>listovi rena - 2 komada</p><p>mirođija - 1 procvetali struk&nbsp;</p><p>Pripremite korni&scaron;one prema gorenavedenom receptu. Va&scaron;i hrskavi krastavčići su spremni za hladnu zimu!&nbsp;</p>', 6, '2018-11-16 23:36:30', NULL, 1, 2, 6, NULL, 'on moderation', NULL, NULL, NULL, 'naslov-7', 'allow', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_type`
--

CREATE TABLE `content_type` (
  `id` int(6) NOT NULL COMMENT 'ID of the Content Type',
  `name` varchar(50) NOT NULL COMMENT 'Name of the Content Type',
  `description` text COMMENT 'Description of the Content Type',
  `comments_allowed` enum('allow','not allow') NOT NULL DEFAULT 'allow' COMMENT 'This is status of comment',
  `slug` varchar(255) NOT NULL COMMENT 'This is content-type slug',
  `content_type_order` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Content Type model';

--
-- Dumping data for table `content_type`
--

INSERT INTO `content_type` (`id`, `name`, `description`, `comments_allowed`, `slug`, `content_type_order`) VALUES
(1, 'Recepti', 'Content Type of Product', 'allow', 'product', 1),
(2, 'Clanci', NULL, 'allow', 'article', 2),
(3, 'BlogArticle', NULL, 'allow', 'blog', 3),
(4, 'Page', NULL, 'allow', 'page', 4),
(5, 'Page', NULL, 'allow', 'page', 4),
(6, 'Gallery', NULL, 'allow', 'gallery', 5);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(6) NOT NULL COMMENT 'This is id of currency',
  `name` varchar(25) NOT NULL COMMENT 'This is name of currency'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Currency model';

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`) VALUES
(1, 'RSD'),
(2, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(9) NOT NULL,
  `content_id` bigint(9) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `status_image` enum('on moderation','approve','request for edit','disapprove') DEFAULT NULL COMMENT 'Image status ',
  `status_video` enum('on moderation','approve','request for edit','disapprove') DEFAULT NULL COMMENT 'Video status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `content_id`, `title`, `image`, `video_url`, `status_image`, `status_video`) VALUES
(1, 1, 'galerija', 'palacinke.jpg', NULL, 'approve', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(5) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `copyright_holder` varchar(100) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `filename`, `type`, `description`, `author`, `copyright_holder`, `keywords`, `meta_title`, `created_at`, `updated_at`) VALUES
(1, 'palacinke.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '2018-11-14 00:00:00', '0000-00-00 00:00:00'),
(2, 'snicle.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '2018-11-14 00:00:00', '2018-11-15 00:00:00'),
(3, 'pecurke.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'raw-puding.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '2018-11-14 00:00:00', '0000-00-00 00:00:00'),
(5, 'veg.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL),
(6, 'kruh.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '2018-11-13 00:00:00', NULL),
(7, 'torta.jpg', 'jpg', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) UNSIGNED DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  `birthday` date DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `user_type` int(4) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `surname`, `public_email`, `sex`, `avatar`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `birthday`, `city`, `phone`, `country`, `user_type`) VALUES
(1, 'Rene', 'Vegan', NULL, NULL, NULL, NULL, NULL, NULL, 'renevegan.rs', 'Spremao hranu od kad se rodio, završio neke škole za to i svašta', '2018-11-07', 'Beograd', NULL, 'Srbija', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frequency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag_content`
--

CREATE TABLE `tag_content` (
  `tag_id` int(11) NOT NULL,
  `content_id` bigint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `status` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `status`) VALUES
(1, 'rene', 'rene@vegan.rs', '123', '', NULL, NULL, NULL, NULL, 0, 0, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PARENT_CATEGORY_FK` (`parent_category_id`),
  ADD KEY `content_type_id` (`content_type_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `USER_ID_FK` (`user_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AUTHOR_ID_FK` (`author_id`),
  ADD KEY `PRODUCED_BY_FK` (`produced_by`),
  ADD KEY `CATEGORY_ID_FK` (`category_id`),
  ADD KEY `CT_ID_FK` (`ct_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `idx-content_image_id` (`image`),
  ADD KEY `idx-content_text_image_id` (`text_image`),
  ADD KEY `idx-content_gloss_image_id` (`gloss_image`),
  ADD KEY `idx-content_entrefilet_image_id` (`entrefilet_image`);

--
-- Indexes for table `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CONTENT_ID_FK` (`content_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_content`
--
ALTER TABLE `tag_content`
  ADD PRIMARY KEY (`tag_id`,`content_id`),
  ADD KEY `fk-content-id` (`content_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_email` (`email`),
  ADD UNIQUE KEY `user_unique_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'Category ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(9) NOT NULL AUTO_INCREMENT COMMENT 'This is id of comment', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` bigint(9) NOT NULL AUTO_INCREMENT COMMENT 'Content ID', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `content_type`
--
ALTER TABLE `content_type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'ID of the Content Type', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'This is id of currency', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `CONTENT_TYPE_CATEGORY_FK` FOREIGN KEY (`content_type_id`) REFERENCES `content_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `PARENT_CATEGORY_FK` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `CONTENT_ID_FK` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `USER_ID_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `AUTHOR_ID_FK` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `CATEGORY_ID_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `CT_ID_FK` FOREIGN KEY (`ct_id`) REFERENCES `content_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `CURRENCY_ID_FK` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PRODUCED_BY_FK` FOREIGN KEY (`produced_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-content_entrefilet_image_id` FOREIGN KEY (`entrefilet_image`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-content_gloss_image_id` FOREIGN KEY (`gloss_image`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-content_image_id` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-content_text_image_id` FOREIGN KEY (`text_image`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `CONTENT_ID_FOREIGNKEY` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_content`
--
ALTER TABLE `tag_content`
  ADD CONSTRAINT `fk-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

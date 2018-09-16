-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2018 at 04:30 PM
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
-- Database: `it255`
--

-- --------------------------------------------------------

--
-- Table structure for table `poruke`
--

CREATE TABLE `poruke` (
  `poruka_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poruke`
--

INSERT INTO `poruke` (`poruka_id`, `name`, `email`, `message`) VALUES
(1, 'Rizbo', 'boris.dovecer.1720@metropolitan.ac.rs', 'radi...'),
(2, 'boris', 'boris.dovecer@gmail.com', 'sta sad??'),
(3, 'Kata', 'kata@salata.pizza', 'salaaaata, krompir, urnebes, pavlaka u pečurkama, kečap, majonez, krastavci, paprika, paradajz, čeri i sve ostalo što ima'),
(4, 'Alisa', 'boris.dovecer.1720@metropolitan.ac.rs', '!!!!!');

-- --------------------------------------------------------

--
-- Table structure for table `recepti`
--

CREATE TABLE `recepti` (
  `recept_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sastojci` text NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recepti`
--

INSERT INTO `recepti` (`recept_id`, `title`, `sastojci`, `description`, `author`, `img`, `category`, `created_on`) VALUES
(7, 'Pirinač i pečurke', '<h3>Sastojci:&nbsp;</h3><ul><li>200g od dobar pirinač</li><li>200g opranih <strong>pečurki</strong></li><li>100g tofe</li><li>prstohvat začina</li></ul>', '<h4>Priprema: &nbsp;</h4><p>Malo ovako, sve se pomeša, proprži da bude do jaja. Onda se stave začini da bude začinjeno.&nbsp;</p><p>Pakuje se po porcijama, jede se prohlađeno. Ne da bude hladno, al vrelo ne može da se jede. Zato je najbolje pustiti da se oladi. Jede se viljuškom koliko se sećam i ne treba <strong>hleb</strong>.</p><p>&nbsp;</p><h4>Savet:</h4><p>Može da se pije i <strong>jogurt</strong>. Ali veganski, ima na okretnici za 120 dinara pola kila.</p>', 'Boris', 'https://i.imgur.com/Tv9ctuo.jpg', 'slatko', '0000-00-00'),
(8, 'Panačinke', '<h4>Sastojci:&nbsp;</h4><ul><li>Brašno</li><li>Voda</li><li>Humus od cvekle</li><li>Masline</li><li>Majonez</li></ul>', '<h4>Priprema:&nbsp;</h4><p>U blender se ubaci brašno pa voda i onda se to izvrti dok se ne dobije kako treba. Onda se peku palačinke. Zašto su plave to niko ne zna.</p><p>Kad se napeče dobra količina palačinjaka onda bi trebalo da se namažu.&nbsp;</p><p>Godinama smo istraživali koje se boje najbolje slažu i to su plava i roze. Kao na upaljačima. Zato palačinke mažemo roze humusom od cvekle. Malo maslina i majoneza i to je to.<br>&nbsp;</p><h4>Savet:&nbsp;</h4><p>Možete i slatke praviti, kako god...</p>', 'Boris', 'https://i.imgur.com/21Myq3j.jpg', 'slano', '0000-00-00'),
(9, 'Sojine šnicle i pire', '<p>Sastojci:&nbsp;</p><ul><li>Sojine šnicle</li><li>Sojino mleko</li><li>Soja sos</li><li>Krompir od soje</li><li>Donaći čeri paradajz... od soje</li></ul>', '<p>Priprema:&nbsp;</p><p>Lagano. Zablejite na laptopu dok se vaša žena bavi Sojama.&nbsp;</p><p>Skrolovati po fejzbuku, gledati memeove, istraživati najveće moguće gluposti i pritom biti što neefikasniji.</p><p>Kad se zamorite od blejanja proverite da li je vaša žena spremila, ako nije onda treba smotati još jednu buksnu. Ako jeste, onda opet smotati da se pripremite psihički za tu količiinu soje.</p><p>&nbsp;</p><p>Savet:&nbsp;</p><p>Pohvaliti ženu šta god da uradi, glad ne bira.</p>', 'Boris', 'https://i.imgur.com/XuMPOe0.jpg', 'slano', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`, `lastname`, `email`) VALUES
(1, 'rene', '123456', 'Rene', 'Vegan', 'rene@vegan.de');

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

CREATE TABLE `vesti` (
  `vesti_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`vesti_id`, `title`, `description`, `author`, `img`, `created_on`) VALUES
(5, 'Ove sezone nosimo zeleno', '<p>Zima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in!&nbsp;</p><p>Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća.&nbsp;</p><p>U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća.</p><p>&nbsp;U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreac</p>', 'Kata', 'https://coolinarika.azureedge.net/images/_variations/b/d/bd5ab496340a0cdcd8a419c081de058b_listing_xl.jpg?v=46', '0000-00-00'),
(6, 'Poslasticepera', 'Zima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreacZima je konačno out, proljeće je in! Ma jedva smo dočekali topliji i sunčaniji travanj koji je našim vrtovima i tržnicama podario obilje jestivih vjesnika proljeća. U društvu s coolkom jako se veselimo uživanju u isprobavanju cool ideja i maštovitih kreac', 'Boris', 'https://coolinarika.azureedge.net/images/_variations/f/3/f36c337ea7e5008ceff83c0fef09deeb_header.jpg?v=49', '0000-00-00'),
(12, 'Vegetarijanstvo i veganizam', '<p>Vegetarijanstvo i veganizam su još jedna od stvari koje su u ovoj zemlji totalno pogrešno shvaćene i ljudi se prema njima odnose sa određenom dozom konzervativnosti, kao i prema mnogim drugim veoma važnim stvarima.</p><p>Većina ljudi koji su otvorili ovu stranicu je već pri samom čitanju naslova okrenula stranicu i počela čitati neki drugi tekst u ovom magazinu.&nbsp;</p><p>Ali, nadam se da vas je dosta nastavilo, jer u ovom tekstu \"ćete naći mnoge stvari koje su vas možda zanimale, a nadam se da će se bar neko od vas odlučiti za ovaj način prehrane, koji je ujedno i jeftiniji od prehrane koja se zasniva na unošenju namirnica životinjskog porijekla!</p>', 'boris', 'https://tinkturedrsulca.com/wp-content/uploads/2017/07/raw-puding.jpg', '0000-00-00'),
(14, 'Najnovija vest', '<p>Poštovani/na,<br><br>Vaš račun za mesec <strong>06/2018</strong> nalazi se u prilogu e-maila.<br><br>Kreiran račun je za broj: <strong>0603003325</strong><br><br>Iznos od <strong>1.398,96 </strong>dinara možete da uplatite najkasnije do <strong>20/07/2018</strong>&nbsp;<br>na tekući račun <strong>265-1110312345678-24</strong>, sa pozivom na broj <strong>09600119125926</strong>, model <strong>97</strong>.</p>', 'Boris', 'https://veganjamcije.files.wordpress.com/2017/10/72.jpg?w=2360', '0000-00-00'),
(15, 'Uz dobru rižu svatko može biti majstor kuhinje', '<p>Riža se jednostavno priprema, dostupna je svima i vrlo brzo od nje nastaje prilog ili cjelovit obrok.</p><p>Za pripremu jela s rižom ne morate imati godine iskustva ili biti vrhunski kuhar. S osnovnim kulinarskim vještinama može se napraviti puno, a uz malo učenja i prakse, jelo se može dovesti do savršenstva. Baš kao i tjestenina, <a href=\"https://www.podravka.hr/proizvodi/?query=ri%C5%BEa\">riža </a>ostavlja mnogo prostora za igranje okusima pa je se tako može spajati s povrćem, morskim plodovima, sirom, piletinom ili nekim drugim mesom.</p><p>Ukusna je i jednostavno kuhana te začinjena s malo kvalitetnog maslinova ulja. Ipak, treba imati na umu da je svaka riža specifična i ima odgovarajuću namjenu. Primjerice, za kremasti rižoto najbolja je <a href=\"https://www.podravka.hr/proizvod/riza-arborio-vakum/\">arborio riža</a>, a za priloge i salate savršena riža parboiled.&nbsp;</p>', 'Kata', 'https://coolinarika.azureedge.net/images/_variations/c/4/c441e43ca176a6f816b610e49c9771fe_header.jpg?v=41', '0000-00-00'),
(16, 'Beskvasni kruh - pogača', '<h4>Sastojci</h4><ul><li>250 g integralnog brašna od pira&nbsp;</li><li>po 1 žlica mljevenog lana, sezama i suncokreta&nbsp;</li><li>½ žličice ninske soli&nbsp;</li><li>½ žličice sode bikarbone (bez aluminija)&nbsp;</li><li>250 ml <a href=\"https://www.coolinarika.com/namirnica/mineralna-voda/\">mineralne vode</a>&nbsp;</li><li>1 žlica <a href=\"https://www.coolinarika.com/namirnica/maslinovo-ulje/\">maslinova ulja</a>&nbsp;</li></ul><p>&nbsp;</p><h4>Priprema</h4><p>Pjenjačom pomiješajte suhe sastojke, dodajte mineralnu vodu pa sve izmiješajte u jednoličnu smjesu - <strong>ovo je kruh koji se ne mijes</strong>i.</p><p>Tijesto premažite maslinovim uljem i špatulom prebacite na lim prekriven papirom za pečenje.</p><p>Pecite u prethodno zagrijanoj pećnici na 200°C 30-35 minuta. Pečeni kruh stavite na rešetku od pećnice te prekrijte s više slojeva krpe dok se ne ohladi.</p><p>&nbsp;</p><h4>Posluživanje</h4><p>Kruh se prepuručuje kod određenih zdravstvenih problema prema preporuci specijaliste ili liječnika. Nama se svidio pa sam se odlučila poigrati i s drugim varijantama beskvasnog kruha.</p><p>&nbsp;</p><p><strong>Savjet:</strong> Upotrebom neprosijanog brašna koji sadrži sve sastavne dijelove zrna preporučuje se da tijesto miruje 20 minuta prije njegove daljnje obrade.</p><p>&nbsp;</p>', 'Rene', 'https://coolinarika.azureedge.net/images/_variations/0/b/0b1a34924dafb788374ba5b22452f0c3_view_l.jpg?v=0', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `poruke`
--
ALTER TABLE `poruke`
  ADD PRIMARY KEY (`poruka_id`);

--
-- Indexes for table `recepti`
--
ALTER TABLE `recepti`
  ADD PRIMARY KEY (`recept_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vesti`
--
ALTER TABLE `vesti`
  ADD PRIMARY KEY (`vesti_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poruke`
--
ALTER TABLE `poruke`
  MODIFY `poruka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recepti`
--
ALTER TABLE `recepti`
  MODIFY `recept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vesti`
--
ALTER TABLE `vesti`
  MODIFY `vesti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

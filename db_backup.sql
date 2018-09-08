-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2018 at 08:42 PM
-- Server version: 10.1.35-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comitede_votes`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `value` text CHARACTER SET latin1 NOT NULL,
  `answer_options` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `value`, `answer_options`) VALUES
(1, 'Selecione a sua empresa:', '<select class=\"answer\">\r\n  <option value=\"CAETANO BAVIERA, S.A.\">CAETANO BAVIERA, S.A.</option>\r\n  <option value=\"LUSILECTRA, S.A.\">LUSILECTRA, S.A.</option>\r\n  <option value=\"Rigor-Consult. Gestão, SA\">Rigor-Consult. Gestão, SA</option>\r\n  <option value=\"Portianga, SA\">Portianga, SA</option>\r\n  <option value=\"Caetano Renting, S. A.\">Caetano Renting, S. A.</option>\r\n  <option value=\"CARPLUS, S.A.\">CARPLUS, S.A.</option>\r\n  <option value=\"Guerin-Rent-a Car (Dois)\">Guerin-Rent-a Car (Dois)</option>\r\n  <option value=\"CAETSU PUBLICIDADE, S.A.\">CAETSU PUBLICIDADE, S.A.</option>\r\n  <option value=\"FINLOG  S.A.\">FINLOG  S.A.</option>\r\n  <option value=\"CHOICE CAR, S.A.\">CHOICE CAR, S.A.</option>\r\n  <option value=\"CAETANO AUTO, S.A.\">CAETANO AUTO, S.A.</option>\r\n  <option value=\"Caetano City e Active, SA\">Caetano City e Active, SA</option>\r\n  <option value=\"CAETANO DRIVE,SPORT URBAN\">CAETANO DRIVE,SPORT URBAN</option>\r\n  <option value=\"Caetano Active, SA\">Caetano Active, SA</option>\r\n  <option value=\"CAETANO POWER, S.A.\">CAETANO POWER, S.A.</option>\r\n  <option value=\"CAETANO TECHNIK, S.A.\">CAETANO TECHNIK, S.A.</option>\r\n  <option value=\"CAETANO RETAIL,SGPS,S.A.\">CAETANO RETAIL,SGPS,S.A.</option>\r\n  <option value=\"CAETANO MOTORS, S.A.\">CAETANO MOTORS, S.A.</option>\r\n  <option value=\"CAETANO STAR, S.A.\">CAETANO STAR, S.A.</option>\r\n  <option value=\"CAETANO PARTS, LDA\">CAETANO PARTS, LDA</option>\r\n  <option value=\"CAETANO FÓRMULA, S.A.\">CAETANO FÓRMULA, S.A.</option>\r\n  <option value=\"Movicargo Mov. Ind., Lda\">Movicargo Mov. Ind., Lda</option>\r\n  <option value=\"HYUNDAI PORTUGAL, S.A.\">HYUNDAI PORTUGAL, S.A.</option>\r\n  <option value=\"CAETANO ENERGY, S.A.\">CAETANO ENERGY, S.A.</option>\r\n  <option value=\"SOZO PORTUGAL,S.A.\">SOZO PORTUGAL,S.A.</option>\r\n  <option value=\"Caetano Aeronautic, SA\">Caetano Aeronautic, SA</option>\r\n  <option value=\"TLSPT, Ldª\">TLSPT, Ldª</option>\r\n  <option value=\"Caetano Bus\">Caetano Bus</option>\r\n  <option value=\"Toyota Caetano Portugal\">Toyota Caetano Portugal</option>\r\n  <option value=\"Caetano Retail\">Caetano Retail</option>\r\n</select>\r\n<div class=\"btn next select\">\r\n  Seguinte &rarr;\r\n</div>'),
(2, 'Considera importante a Salvador Caetano promover, durante todo o ano, atividades desportivas e iniciativas de Saúde e Bem Estar junto dos Colaboradores? ', '<div class=\"btn next bool\" data-vote=\"sim\">SIM</div>\r\n<div class=\"btn next bool\" data-vote=\"nao\">NÃO</div>'),
(3, 'Estaria interessado em inscrever-se em modalidades desportivas?', '<div class=\"btn next bool\" data-vote=\"sim\">SIM</div>\r\n<div class=\"btn next bool\" data-vote=\"nao\">NÃO</div>'),
(4, 'Estaria interessado em participar em iniciativas de Saúde e Bem Estar?', '<div class=\"btn next bool\" data-vote=\"sim\">SIM</div>\r\n<div class=\"btn next bool\" data-vote=\"nao\">NÃO</div>'),
(5, 'Em que modalidades gostaria de se inscrever? (Pode selecionar mais do que uma opção)', '<div class=\"left\">\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Basquetebol\" value=\"Basquetebol\"> Basquetebol<br />\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Futsal\" value=\"Futsal\"> Futsal<br />\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Peddy Paper\" value=\"Peddy Paper\"> Peddy Paper<br />\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Corta Mato\" value=\"Corta Mato\"> Corta Mato<br />\r\n</div>\r\n<div class=\"right\">\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Ping Pong\" value=\"Ping Pong\"> Ping Pong<br />\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Matrecos\" value=\"Matrecos\"> Matrecos<br />\r\n	<input type=\"checkbox\" class=\"answer\" name=\"Padel\" value=\"Padel\"> Padel<br />\r\n</div>\r\n<div style=\"clear: both;\">\r\n<span>Outros: </span><input type=\"text\" class=\"answer other\" name=\"other\" value=\"\">\r\n<div class=\"btn next checkbox\">\r\n  Terminar\r\n</div>');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `uid` varchar(20) NOT NULL DEFAULT 'VOTE_',
  `question_id` int(11) NOT NULL DEFAULT '0',
  `answer` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `FK_VOTES_QUESTIONS_ID` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 25-Nov-2025 às 20:16
-- Versão do servidor: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `banco_gamezone`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE IF NOT EXISTS `biblioteca` (
  `LIB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GAME_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LIB_ID`),
  KEY `GAME_ID` (`GAME_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `COMPRA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GAME_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `DATA_AQUISICAO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `GAME_PRECO` decimal(5,2) DEFAULT NULL,
  `METODO_PAG` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COMPRA_ID`),
  KEY `GAME_ID` (`GAME_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE IF NOT EXISTS `jogos` (
  `GAME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GAME_TITULO` varchar(150) NOT NULL,
  `GAME_DEV` varchar(100) NOT NULL,
  `GAME_PUBLICADORA` varchar(100) DEFAULT NULL,
  `GAME_DATA_LANCAMENTO` date DEFAULT NULL,
  `GAME_DESCRICAO` text,
  `GAME_PRECO` decimal(10,2) DEFAULT NULL,
  `GAME_DESCONTO` decimal(5,2) DEFAULT '0.00',
  `GAME_AVALIACAO_MEDIA` decimal(3,2) DEFAULT '0.00',
  `GAME_TOTAL_AVALIACOES` int(11) DEFAULT '0',
  `GAME_IDIOMAS_SUPORTADOS` varchar(255) DEFAULT NULL,
  `GAME_TAMANHO_ARQUIVO` varchar(50) DEFAULT NULL,
  `GAME_DATA_CADASTRO` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `GAME_REQUISITOS_MINIMOS` text,
  `GAME_REQUISITOS_RECOMENDADOS` text,
  `GAME_SO_SUPORTADOS` varchar(100) DEFAULT NULL,
  `GAME_CAPA_URL` varchar(255) DEFAULT NULL,
  `GAME_STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`GAME_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `jogos`
--

INSERT INTO `jogos` (`GAME_ID`, `GAME_TITULO`, `GAME_DEV`, `GAME_PUBLICADORA`, `GAME_DATA_LANCAMENTO`, `GAME_DESCRICAO`, `GAME_PRECO`, `GAME_DESCONTO`, `GAME_AVALIACAO_MEDIA`, `GAME_TOTAL_AVALIACOES`, `GAME_IDIOMAS_SUPORTADOS`, `GAME_TAMANHO_ARQUIVO`, `GAME_DATA_CADASTRO`, `GAME_REQUISITOS_MINIMOS`, `GAME_REQUISITOS_RECOMENDADOS`, `GAME_SO_SUPORTADOS`, `GAME_CAPA_URL`, `GAME_STATUS`) VALUES
(1, '$G_titulo', '$G_dev', '$G_publicadora', NULL, '$G_descricao', '0.00', '0.00', '0.00', 0, '$G_idiomas', '66', '0000-00-00', '$G_RM', '$55', '$G_SO', '555', 1),
(2, 'dbeve2r2f', 'fwfwf', 'r32r2r', NULL, 'fwfwfw', '444.00', '0.00', '0.00', 0, 'dqdwd', '4343434', '0000-00-00', 'qdqdqdq', 'qwdsdqd', 'ewewd', '../upload/capa-ordem.jpg', 0),
(3, 'dbeve2r2f', 'fwfwf', 'r32r2r', NULL, 'fwfwfw', '444.00', '0.00', '0.00', 0, 'dqdwd', '4343434', '0000-00-00', 'qdqdqdq', 'qwdsdqd', 'ewewd', '../upload/capa-ordem.jpg', 1),
(4, 'dbeve2r2f', 'fwfwf', 'r32r2r', NULL, 'fwfwfw', '444.00', '0.00', '0.00', 0, 'dqdwd', '4343434', '0000-00-00', 'qdqdqdq', 'qwdsdqd', 'ewewd', '../upload/capa-ordem.jpg', 0),
(5, '23esedw', 'pdaoxida', 'r32r2r', NULL, 'sssacaxzxcdasc xzaDWFACZDC', '4523.00', '0.00', '0.00', 0, 'DVCWVB', '333', '0000-00-00', 'uylululy', 'nbescdfsed', 'DDWD', '../upload/capa-ordem.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo_categorias`
--

CREATE TABLE IF NOT EXISTS `jogo_categorias` (
  `GAME_ID` int(11) NOT NULL,
  `CATEGORIA_ID` int(11) NOT NULL,
  `CATEGORIA_NOME` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`GAME_ID`,`CATEGORIA_ID`),
  KEY `CATEGORIA_ID` (`CATEGORIA_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogo_categorias`
--

INSERT INTO `jogo_categorias` (`GAME_ID`, `CATEGORIA_ID`, `CATEGORIA_NOME`) VALUES
(0, 1, 'Ação'),
(0, 2, 'Casual'),
(0, 3, 'Estratégia'),
(0, 4, 'Esporte'),
(0, 5, 'Ficção Científica'),
(0, 6, 'FPS'),
(0, 7, 'Hack and Slash'),
(0, 8, 'Luta'),
(0, 9, 'Mistério'),
(0, 10, 'Mundo Aberto'),
(0, 11, 'Quebra-cabeça'),
(0, 12, 'RPG'),
(0, 13, 'Simulador'),
(0, 14, 'Sobrevivência'),
(0, 15, 'Terror'),
(0, 16, 'Tiro'),
(2, 1, NULL),
(2, 3, NULL),
(2, 4, NULL),
(3, 1, NULL),
(3, 3, NULL),
(3, 4, NULL),
(4, 1, NULL),
(4, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(5, 8, NULL),
(5, 13, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(100) NOT NULL,
  `USER_CPF` varchar(11) NOT NULL,
  `USER_SENHA` varchar(20) NOT NULL,
  `USER_DTNASC` date NOT NULL,
  `GAME_ID` int(11) DEFAULT NULL,
  `USER_EMAIL` varchar(100) DEFAULT NULL,
  `LIB_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `GAME_ID` (`GAME_ID`),
  KEY `LIB_ID` (`LIB_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`USER_ID`, `USER_NAME`, `USER_CPF`, `USER_SENHA`, `USER_DTNASC`, `GAME_ID`, `USER_EMAIL`, `LIB_ID`) VALUES
(1, 'Marcelo Rossi', '443335243-1', 'revev3rv4hb', '1999-03-22', NULL, 'Huadhahi@gamisl', NULL),
(2, 'Pyssicosis', '344222568-1', '44424323', '2001-03-11', NULL, 'Pysicoscossis@hotmail.com', NULL),
(3, 'barbie', '343653544', 'kengozei', '4242-03-22', NULL, 'barbiegirl@gmail.com', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

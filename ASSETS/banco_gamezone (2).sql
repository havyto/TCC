-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2025 às 01:11
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
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `CATEGORIA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORIA_NOME` varchar(50) NOT NULL,
  PRIMARY KEY (`CATEGORIA_ID`)
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
  `GAME_DATA_CADASTRO` date NOT NULL,
  `GAME_REQUISITOS_MINIMOS` text,
  `GAME_REQUISITOS_RECOMENDADOS` text,
  `GAME_SO_SUPORTADOS` varchar(100) DEFAULT NULL,
  `GAME_CAPA_URL` varchar(255) DEFAULT NULL,
  `GAME_STATUS` varchar(20) DEFAULT 'DISPONIVEL',
  PRIMARY KEY (`GAME_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo_categorias`
--

CREATE TABLE IF NOT EXISTS `jogo_categorias` (
  `GAME_ID` int(11) NOT NULL,
  `CATEGORIA_ID` int(11) NOT NULL,
  PRIMARY KEY (`GAME_ID`,`CATEGORIA_ID`),
  KEY `CATEGORIA_ID` (`CATEGORIA_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`USER_ID`),
  KEY `GAME_ID` (`GAME_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

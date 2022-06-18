CREATE DATABASE  IF NOT EXISTS `metamarcha` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `metamarcha`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: metamarcha
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `controle_financeiro`
--

DROP TABLE IF EXISTS `controle_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controle_financeiro` (
  `id_financeiro` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_revenda` smallint unsigned NOT NULL,
  `valor_lucro` smallint unsigned NOT NULL,
  `id_despezas` int unsigned DEFAULT NULL,
  `saida` int unsigned NOT NULL,
  `entrada` int unsigned NOT NULL,
  PRIMARY KEY (`id_financeiro`),
  KEY `fk_id_despezas_opcional` (`id_despezas`),
  CONSTRAINT `fk_id_despezas_opcional` FOREIGN KEY (`id_despezas`) REFERENCES `despezas` (`id_despezas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle_financeiro`
--

LOCK TABLES `controle_financeiro` WRITE;
/*!40000 ALTER TABLE `controle_financeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `controle_financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito` (
  `id_credito` int unsigned NOT NULL AUTO_INCREMENT,
  `id_pagamento` int unsigned DEFAULT NULL,
  `numeroCartao` int unsigned NOT NULL,
  `nomeTitular` varchar(250) NOT NULL,
  `cvv` smallint unsigned NOT NULL,
  `dataValidade` date NOT NULL,
  `bandeira` varchar(50) NOT NULL,
  PRIMARY KEY (`id_credito`),
  KEY `fk_id_forma_pagamento_credito` (`id_pagamento`),
  CONSTRAINT `fk_id_forma_pagamento_credito` FOREIGN KEY (`id_pagamento`) REFERENCES `formapagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debito`
--

DROP TABLE IF EXISTS `debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debito` (
  `id_debito` int unsigned NOT NULL AUTO_INCREMENT,
  `id_pagamento` int unsigned DEFAULT NULL,
  `numeroCartao` int NOT NULL,
  `nomeTitular` varchar(250) NOT NULL,
  `cvv` int NOT NULL,
  `dataValidade` date NOT NULL,
  `bandeira` varchar(50) NOT NULL,
  PRIMARY KEY (`id_debito`),
  KEY `fk_id_forma_pagamento_debito` (`id_pagamento`),
  CONSTRAINT `fk_id_forma_pagamento_debito` FOREIGN KEY (`id_pagamento`) REFERENCES `formapagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debito`
--

LOCK TABLES `debito` WRITE;
/*!40000 ALTER TABLE `debito` DISABLE KEYS */;
/*!40000 ALTER TABLE `debito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despezas`
--

DROP TABLE IF EXISTS `despezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despezas` (
  `id_despezas` int unsigned NOT NULL AUTO_INCREMENT,
  `mes` date DEFAULT NULL,
  `aluguel` smallint unsigned DEFAULT NULL,
  `luz` smallint unsigned DEFAULT NULL,
  `agua` smallint unsigned DEFAULT NULL,
  `internet` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_despezas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despezas`
--

LOCK TABLES `despezas` WRITE;
/*!40000 ALTER TABLE `despezas` DISABLE KEYS */;
/*!40000 ALTER TABLE `despezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int unsigned NOT NULL AUTO_INCREMENT,
  `id_mercadoria` int unsigned DEFAULT NULL,
  `classe_produto` varchar(150) DEFAULT NULL,
  `quantidade` int unsigned NOT NULL,
  `numero_lote` smallint unsigned DEFAULT NULL,
  `validade_lote` date DEFAULT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_id_mercadoria` (`id_mercadoria`),
  CONSTRAINT `fk_id_mercadoria` FOREIGN KEY (`id_mercadoria`) REFERENCES `mercadoria` (`id_mercadoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fisica`
--

DROP TABLE IF EXISTS `fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fisica` (
  `id_fisica` int unsigned NOT NULL AUTO_INCREMENT,
  `cpf` int unsigned NOT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_fisica`),
  KEY `fk_id_usuario_fisica` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_fisica` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fisica`
--

LOCK TABLES `fisica` WRITE;
/*!40000 ALTER TABLE `fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `id_pagamento` int unsigned NOT NULL AUTO_INCREMENT,
  `id_credito` int unsigned DEFAULT NULL,
  `id_debito` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_id_credito` (`id_credito`),
  KEY `fk_id_debito` (`id_debito`),
  CONSTRAINT `fk_id_credito` FOREIGN KEY (`id_credito`) REFERENCES `credito` (`id_credito`),
  CONSTRAINT `fk_id_debito` FOREIGN KEY (`id_debito`) REFERENCES `debito` (`id_debito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juridica`
--

DROP TABLE IF EXISTS `juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juridica` (
  `id_juridica` int unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` int unsigned NOT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_juridica`),
  KEY `fk_id_usuario_juridico` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_juridico` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juridica`
--

LOCK TABLES `juridica` WRITE;
/*!40000 ALTER TABLE `juridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercadoria`
--

DROP TABLE IF EXISTS `mercadoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercadoria` (
  `id_mercadoria` int unsigned NOT NULL AUTO_INCREMENT,
  `id_estoque` int unsigned DEFAULT NULL,
  `valor_produto` int unsigned NOT NULL,
  `nome_produto` varchar(250) NOT NULL,
  `validade_produto` date DEFAULT NULL,
  `categoria_produto` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_mercadoria`),
  KEY `fk_id_estoque` (`id_estoque`),
  CONSTRAINT `fk_id_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercadoria`
--

LOCK TABLES `mercadoria` WRITE;
/*!40000 ALTER TABLE `mercadoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercadoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `id_juridica` int unsigned DEFAULT NULL,
  `id_fisica` int unsigned DEFAULT NULL,
  `nome_usuario` varchar(250) NOT NULL,
  `nome_empresa` varchar(250) NOT NULL,
  `email_usuario` varchar(250) NOT NULL,
  `senha_usuario` varchar(250) NOT NULL,
  `tipo_empresa` varchar(250) NOT NULL,
  `plano` varchar(250) NOT NULL,
  `telefone_usuario` int unsigned NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_id_fisica` (`id_fisica`),
  KEY `fk_id_id_juridica` (`id_juridica`),
  CONSTRAINT `fk_id_fisica` FOREIGN KEY (`id_fisica`) REFERENCES `fisica` (`id_fisica`),
  CONSTRAINT `fk_id_id_juridica` FOREIGN KEY (`id_juridica`) REFERENCES `juridica` (`id_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id_vendas` int unsigned NOT NULL AUTO_INCREMENT,
  `id_mercadoria` int unsigned DEFAULT NULL,
  `id_usuario` int unsigned DEFAULT NULL,
  `quantidade_vendido` int unsigned NOT NULL,
  `lucro_vendas` int unsigned NOT NULL,
  PRIMARY KEY (`id_vendas`),
  KEY `fk_id_mercadoria_vendas` (`id_mercadoria`),
  CONSTRAINT `fk_id_mercadoria_vendas` FOREIGN KEY (`id_mercadoria`) REFERENCES `mercadoria` (`id_mercadoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18  1:58:35

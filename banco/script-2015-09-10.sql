-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: sisdo_dbs
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_type` varchar(7) DEFAULT NULL COMMENT 'Tipo Rua: Avenida, Rua, Alameda, Praça...',
  `street` varchar(100) DEFAULT NULL COMMENT 'Rua',
  `city` varchar(100) DEFAULT NULL COMMENT 'cidade',
  `neighborhood` varchar(100) DEFAULT NULL COMMENT 'Bairro',
  `zip_code` varchar(10) DEFAULT NULL COMMENT 'Código Postal',
  `uf` varchar(2) DEFAULT NULL COMMENT 'Unidade Federal',
  `country` varchar(100) DEFAULT NULL COMMENT 'País',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adress_user1_idx` (`user_id`),
  CONSTRAINT `fk_adress_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Alameda','Rua Sao Carlos da Uniao','Belo Horizonte','Centro','31814710','MG','Brasil',2);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(15) DEFAULT NULL COMMENT 'Telefone do tipo varchar, suporte até 15 caracteres pois pode incluir o prefixo do páis, ddd da cidade mais o númeor atualmente no padrão brasileiro como nono digito.\n05531900000000',
  `email` varchar(100) DEFAULT NULL COMMENT 'email do usuário',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_user1_idx` (`user_id`),
  CONSTRAINT `fk_contact_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'3133333333','apae@gmail.com',2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_model`
--

DROP TABLE IF EXISTS `email_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `modelo_email` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_model`
--

LOCK TABLES `email_model` WRITE;
/*!40000 ALTER TABLE `email_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corporate_name` varchar(100) NOT NULL COMMENT 'Razão Social',
  `fancy_name` varchar(100) DEFAULT NULL COMMENT 'Nome Fantasia',
  `cnpj` varchar(14) NOT NULL COMMENT 'Cadastro NACIONAL PESSOA JURÍDICA',
  `branch` varchar(50) NOT NULL COMMENT 'Ramo de atuação: Educação, saúde, alimenticios, etc...',
  `about` varchar(500) NOT NULL COMMENT 'Sobre: pequena descrição de no máximo 500 caracteres sobre a institução beneficente.',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_institution_user_idx` (`user_id`),
  CONSTRAINT `fk_institution_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (2,'Sao Joao','Instituicao Sao Joao','22222222222222','1','Uma instituicao legal',4),(3,'Apae','Instituicao Apae','11111111111111','1','Apae uma instituicao que atua com crianÃ§as com deficiÃªncia.',2);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_transacao` int(11) DEFAULT NULL,
  `id_user` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO sisdo_dbs.message (id, id_transacao, id_user, date, message) VALUES (1, 1, '2', '2015-09-10 10:28:42', 'Ola gostaria de fazer uma doacao');
INSERT INTO sisdo_dbs.message (id, id_transacao, id_user, date, message) VALUES (2, 1, '3', '2015-09-11 10:29:24', 'Ola Albo, basta fazer a doacao pelo app, caso queira pode nos ligar ou vir ate a instituicao.');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `sex` char(1) NOT NULL COMMENT 'Sexo',
  `birth_date` date DEFAULT NULL COMMENT 'Data de Nascimento',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_person_user1_idx` (`user_id`),
  CONSTRAINT `fk_person_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Albo Borges Vieira','M','1989-12-24',3);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL COMMENT 'Título do produto a sr inserido',
  `quantity` float NOT NULL COMMENT 'quantidade do produto a ser inserido',
  `description` varchar(500) NOT NULL COMMENT 'Descrição da finalidade do produto que será inserido',
  `date` date DEFAULT NULL COMMENT 'Data e hora que o produto está sendo inserido',
  `institution_user_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `unity` char(2) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_institution1_idx` (`institution_user_id`),
  KEY `fk_product_product_type1_idx` (`product_type_id`),
  CONSTRAINT `fk_product_institution1` FOREIGN KEY (`institution_user_id`) REFERENCES `institution` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_product_type1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Doacao de Cobertores',12,'Estamos precisando de cobertores para as criacas.','2015-09-06',2,1,'UN','A'),(2,'Campanha de doacao de comida',0,'Estamos aguardando doacoes para as criancas.','2015-09-07',2,3,'UN','A');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL COMMENT 'descrição do produto, pode ser serviço, alimenticio, higiêne, saúde, agasalhos, roupa de cama, roupa de mesa, roupas banho, diversos, brinquedos, utensilios...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'Jogo de Cama'),(2,'Roupa'),(3,'Alimento'),(4,'Serviços');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `institution_user_id` int(11) NOT NULL,
  `person_user_id` int(11) NOT NULL,
  PRIMARY KEY (`institution_user_id`,`person_user_id`),
  KEY `fk_user_person_relationship_idx` (`person_user_id`),
  CONSTRAINT `fk_user_person_relationship` FOREIGN KEY (`person_user_id`) REFERENCES `person` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_institution_relationship` FOREIGN KEY (`institution_user_id`) REFERENCES `institution` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (2,3);
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL COMMENT 'Data de abertura da transação',
  `quantity` varchar(45) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL COMMENT 'Data fim ao qual a transação é gravada',
  `status` char(1) DEFAULT NULL COMMENT 'Status da transação: Aberta, Finalizada, Cancelada',
  `product_id` int(11) NOT NULL,
  `institution_user_id` int(11) NOT NULL,
  `person_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_product1_idx` (`product_id`),
  KEY `fk_transaction_institution1_idx` (`institution_user_id`),
  KEY `fk_transaction_person1_idx` (`person_user_id`),
  CONSTRAINT `fk_transaction_institution1` FOREIGN KEY (`institution_user_id`) REFERENCES `institution` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_person1` FOREIGN KEY (`person_user_id`) REFERENCES `person` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO sisdo_dbs.transaction (id, start_date, quantity, end_date, status, product_id, institution_user_id, person_user_id) VALUES (1, '2015-09-11 10:25:02', '2', '2015-10-11 10:25:05', '1', 1, 2, 3);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária da tabela utilizada para controle dos usuários e temporalidade dos mesmos.',
  `username` varchar(12) NOT NULL COMMENT 'Campo destinado ao armazenamento do nome de usuário criado no processo de cadastro.',
  `password` varchar(145) NOT NULL COMMENT 'Campos destinado ao armazenamento de senhas dos usuários criados no processo de cadastro.',
  `date` date DEFAULT NULL,
  `profile` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'apae','$2y$12$UvmZXBjBIRED94YrBPGFeeBVHYC9u3qRGabHedgxDtlRNrmrenMG.','2015-09-05',1,'apae@gmail.com'),(3,'albo','$2y$12$UvmZXBjBIRED94YrBPGFeeBVHYC9u3qRGabHedgxDtlRNrmrenMG.','2015-09-05',2,'albovieira@gmail.com'),(4,'saojoao','$2y$12$UvmZXBjBIRED94YrBPGFeeBVHYC9u3qRGabHedgxDtlRNrmrenMG.','2015-09-05',1,'saojoao@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-10 20:37:06



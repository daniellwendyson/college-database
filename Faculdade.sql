CREATE DATABASE  IF NOT EXISTS `db_faculdade` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_faculdade`;
-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_faculdade
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `ra` int(11) NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(20) NOT NULL,
  `sobrenome_aluno` varchar(20) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `status_aluno` tinyint(1) NOT NULL,
  `cod_turma` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `cod_curso` int(11) DEFAULT NULL,
  `nome_pai` varchar(50) NOT NULL,
  `nome_mae` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `whatsapp` varchar(20) NOT NULL,
  PRIMARY KEY (`ra`),
  KEY `fk_cod_turma_aluno` (`cod_turma`),
  KEY `fk_cod_curso_aluno` (`cod_curso`),
  CONSTRAINT `fk_cod_curso_aluno` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`),
  CONSTRAINT `fk_cod_turma_aluno` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Marcos','Aurelio Martins','14278914536',1,2,'M',3,'Marcio Aurelio','Maria de Fátima','marcoaurelio@gmail.com','99995555'),(2,'Gabriel','Fernando de Almeida','14470954536',1,1,'M',1,'Adão Almeida','Fernanda Cristine','gabrielfernando@gmail.com','55559999'),(3,'Beatriz','Sonia Meneguel','1520984537',1,3,'F',3,'Samuel Meneguel','Sonia Abrão','beatrizmeneguel@gmail.com','22221111'),(4,'Jorge','Soares','14223651562',1,3,'M',4,'João Soares','Maria Ritcher','jorgesoares@gmail.com','33334444'),(5,'Ana Paula','Ferretti','32968914522',1,3,'F',5,'Marcio Ferretti','Ana Flávia','anaferretti@gmail.com','11112222'),(6,'Mônica','Yamaguti','32988914510',1,2,'F',6,'Wilson Oliveira','Fernanda Yamaguti','monicayamaguti@gmail.com','44445555');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disc`
--

DROP TABLE IF EXISTS `aluno_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_disc` (
  `ra` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`ra`,`cod_disciplina`),
  KEY `fk_cod_disciplina_aluno` (`cod_disciplina`),
  CONSTRAINT `fk_cod_disciplina_aluno` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_ra_aluno` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disc`
--

LOCK TABLES `aluno_disc` WRITE;
/*!40000 ALTER TABLE `aluno_disc` DISABLE KEYS */;
INSERT INTO `aluno_disc` VALUES (1,2),(2,3),(3,1),(4,3),(5,4),(6,1);
/*!40000 ALTER TABLE `aluno_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `cod_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(30) DEFAULT NULL,
  `cod_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `fk_cod_departamento` (`cod_departamento`),
  CONSTRAINT `fk_cod_departamento` FOREIGN KEY (`cod_departamento`) REFERENCES `departamento` (`cod_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Matemática',2),(2,'Psicologia',1),(3,'Análise de Sistemas',2),(4,'Biologia',3),(5,'História',1),(6,'Engenharia',2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disciplina`
--

DROP TABLE IF EXISTS `curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_disciplina` (
  `cod_curso` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`cod_curso`,`cod_disciplina`),
  KEY `fk_cod_disciplina_disci` (`cod_disciplina`),
  CONSTRAINT `fk_cod_curso_disci` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`),
  CONSTRAINT `fk_cod_disciplina_disci` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disciplina`
--

LOCK TABLES `curso_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_disciplina` DISABLE KEYS */;
INSERT INTO `curso_disciplina` VALUES (1,1),(2,2),(3,3),(6,4);
/*!40000 ALTER TABLE `curso_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `cod_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_departamento` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Ciências Humanas'),(2,'Matemática'),(3,'Biológicas'),(4,'Estágio');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_hist`
--

DROP TABLE IF EXISTS `disc_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disc_hist` (
  `cod_historico` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  `NOTA` float(4,2) DEFAULT NULL,
  `frequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_historico`,`cod_disciplina`),
  KEY `fk_cod_disciplina_hist` (`cod_disciplina`),
  CONSTRAINT `fk_cod_disciplina_hist` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_historico` FOREIGN KEY (`cod_historico`) REFERENCES `historico` (`cod_historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_hist`
--

LOCK TABLES `disc_hist` WRITE;
/*!40000 ALTER TABLE `disc_hist` DISABLE KEYS */;
INSERT INTO `disc_hist` VALUES (1,2,7.00,6),(2,3,8.50,2),(3,1,6.80,8);
/*!40000 ALTER TABLE `disc_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `cod_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `cod_disciplina_depende` int(11) DEFAULT NULL,
  `nome_disciplina` varchar(30) DEFAULT NULL,
  `cod_departamento` int(11) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `num_alunos` int(11) NOT NULL,
  PRIMARY KEY (`cod_disciplina`),
  KEY `fk_cod_departamento_disciplina` (`cod_departamento`),
  KEY `fk_cod_disciplina` (`cod_disciplina_depende`),
  CONSTRAINT `fk_cod_departamento_disciplina` FOREIGN KEY (`cod_departamento`) REFERENCES `departamento` (`cod_departamento`),
  CONSTRAINT `fk_cod_disciplina` FOREIGN KEY (`cod_disciplina_depende`) REFERENCES `disciplina` (`cod_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,NULL,'Raciocínio Lógico',2,1200,'Desenvolver o raciocínio lógico',50),(2,NULL,'Psicologia Cognitiva',1,1400,'Entender o funcionamento do aprendizado',40),(3,NULL,'Programação em C',2,1200,'Aprender uma linguagem de programação',20),(4,NULL,'Eletrônica Digital',2,300,'Funcionamento de circuito digitais',30);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_aluno`
--

DROP TABLE IF EXISTS `endereco_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco_aluno` (
  `cod_endereco_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `ra` int(11) NOT NULL,
  `cod_tipo_logradouro` int(11) NOT NULL,
  `nome_rua` varchar(50) NOT NULL,
  `num_rua` int(11) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  PRIMARY KEY (`cod_endereco_aluno`),
  KEY `fk_cod_ra_end` (`ra`),
  KEY `fk_cod_tipo_logradouro` (`cod_tipo_logradouro`),
  CONSTRAINT `fk_cod_ra_end` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`),
  CONSTRAINT `fk_cod_tipo_logradouro` FOREIGN KEY (`cod_tipo_logradouro`) REFERENCES `tipo_logradouro` (`cod_tipo_logradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_aluno`
--

LOCK TABLES `endereco_aluno` WRITE;
/*!40000 ALTER TABLE `endereco_aluno` DISABLE KEYS */;
INSERT INTO `endereco_aluno` VALUES (1,2,1,'das Giestas',255,'Casa 02','2854000'),(2,3,3,'Lorena',10,'Apto 15','2945000'),(3,1,2,'do Cursino',1248,'','851040'),(4,4,1,'das Heras',495,'','3563142'),(5,5,3,'Santos',1856,'','4523963'),(6,6,4,'Matão',206,'','4213650');
/*!40000 ALTER TABLE `endereco_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `cod_historico` int(11) NOT NULL AUTO_INCREMENT,
  `ra` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  PRIMARY KEY (`cod_historico`),
  KEY `fk_cod_ra` (`ra`),
  CONSTRAINT `fk_cod_ra` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,2,'2016-05-12','2017-10-15'),(2,3,'2014-05-12','2020-03-05'),(3,1,'2010-05-12','2012-05-10');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_disciplina`
--

DROP TABLE IF EXISTS `prof_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prof_disciplina` (
  `cod_professor` int(11) NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  PRIMARY KEY (`cod_professor`,`cod_disciplina`),
  KEY `fk_cod_disciplina_prof` (`cod_disciplina`),
  CONSTRAINT `fk_cod_disciplina_prof` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_professor_prof` FOREIGN KEY (`cod_professor`) REFERENCES `professor` (`cod_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_disciplina`
--

LOCK TABLES `prof_disciplina` WRITE;
/*!40000 ALTER TABLE `prof_disciplina` DISABLE KEYS */;
INSERT INTO `prof_disciplina` VALUES (1,2),(2,1),(2,4),(3,3);
/*!40000 ALTER TABLE `prof_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `cod_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_professor` varchar(20) NOT NULL,
  `sobrenome_professor` varchar(50) NOT NULL,
  `status_professor` tinyint(4) DEFAULT NULL,
  `cod_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_professor`),
  KEY `fk_codigo_departamento` (`cod_departamento`),
  CONSTRAINT `fk_codigo_departamento` FOREIGN KEY (`cod_departamento`) REFERENCES `departamento` (`cod_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Fábio','dos Reis',0,2),(2,'Sophie','Allemand',1,1),(3,'Monica','Barroso',1,3);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefones_aluno`
--

DROP TABLE IF EXISTS `telefones_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefones_aluno` (
  `cod_telefones_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `ra` int(11) NOT NULL,
  `cod_tipo_telefone` int(11) NOT NULL,
  `num_telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_telefones_aluno`),
  KEY `fk_cod_ra_tel` (`ra`),
  KEY `fk_cod_tipo_telefone` (`cod_tipo_telefone`),
  CONSTRAINT `fk_cod_ra_tel` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`),
  CONSTRAINT `fk_cod_tipo_telefone` FOREIGN KEY (`cod_tipo_telefone`) REFERENCES `tipo_telefone` (`cod_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefones_aluno`
--

LOCK TABLES `telefones_aluno` WRITE;
/*!40000 ALTER TABLE `telefones_aluno` DISABLE KEYS */;
INSERT INTO `telefones_aluno` VALUES (1,1,1,'28467853'),(2,2,1,'24653298'),(3,2,3,'996324521'),(4,3,1,'36549875'),(5,3,3,'994532165'),(6,4,1,'21956345'),(7,4,3,'986321452'),(8,5,1,'24569832'),(9,5,2,'23854696'),(10,6,1,'27698753');
/*!40000 ALTER TABLE `telefones_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_logradouro`
--

DROP TABLE IF EXISTS `tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_logradouro` (
  `cod_tipo_logradouro` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_logradouro` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_logradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_logradouro`
--

LOCK TABLES `tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tipo_logradouro` DISABLE KEYS */;
INSERT INTO `tipo_logradouro` VALUES (1,'Rua'),(2,'Avenida'),(3,'Alameda'),(4,'Travessa');
/*!40000 ALTER TABLE `tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `cod_tipo_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_telefone` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'Res'),(2,'Com'),(3,'Cel'),(4,'Rec');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `cod_turma` int(11) NOT NULL AUTO_INCREMENT,
  `cod_curso` int(11) DEFAULT NULL,
  `periodo` varchar(8) DEFAULT NULL,
  `num_alunos` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  PRIMARY KEY (`cod_turma`),
  KEY `fk_cod_curso` (`cod_curso`),
  CONSTRAINT `fk_cod_curso` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,2,'Manhã',20,'2016-05-12','2017-10-15'),(2,1,'Noite',10,'2014-05-12','2020-03-05'),(3,3,'Tarde',15,'2012-05-12','2014-05-10');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 17:28:24

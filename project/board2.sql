--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT 'no_name',
  `content` varchar(80) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `pw` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=euckr;


-- MySQL dump 10.13  Distrib 5.6.15, for osx10.7 (x86_64)
--
-- Host: 192.168.82.119    Database: mars
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('1201',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�ђ)\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0�IDATx���	pT՚��c ,BD�(a(Z\"�Z����/�QTpa)u(�2���LxdUT6�P\"� a|$�!1��l��{��N5!A�tw���_խ�{\'��{�w�=�\\c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|XE\0��a���|���(����GII��n�S0M�D��6������1b$f\0�u�ȑ�sss_?}��E�:u2mڴ1�[�6���NibR\\\\l$Y1999g*++���%�1\"�13\0g9z��Ç��ڵ��ܹ���)����$�Ln�:t�Zb�\Z\"�\"\0�;)�etϞ=Mǎ١z��\"]|��a����\'%%�[�x�?�!r������SFFƳ�C���>����9&{�j�}`�9y�+S��DDŘЈh\n�����M�v�\"N�8q[bb�g)))�C�B�18\0�C:H[�顧�v��vh�O�d�Ug��^iJ������_(@7���2���������!b��@5=sNi�x���e~m*ϔ���`OI�\0ݤK�.�CCC�ڴi�\r�-�@b��Ng�g��7��<=\Z���СC���\"�h13\0�t�)�Π>������`^*w����Y�C�B�R��щ?��.4?�.�UGb�Chz�\0?�V2�g�d�B�!Z���\n�lW�s����H�\0xM��Lhx�9���E���R@ �\03\0�ҪcOաG�����b 1�MUe�<Vy�b 1�-gJr��ًs��\\�o���>�^C\0�\0*��-;��5\r�SZ�i2v�5�G��Q����o�\0��9����͸zY}���&�_o36k\Z%C��i��@{/.t��J{E2wΣ\0A$f\0�E{/\Z�a��\0A^¡L \0�\r�A!�|\0=f\0\0\0$f\0\0\0 1\0\0 1\0\0@}���p8l�������ˉ\'�dee]TTTZ^^nBCC�[��h߾�/�������<y�O�\Z\04����.���w\r��}d�$K+Y�eɖ:}�<�MHHȲ%K�\'1|(![�j��3f����B{��i����e�]f$36��Hrt�ԩ�cǎŦ����޽�/\'N<ZRR2c���(E\0��q���!�\'�v� I���x�M����e}GUU��ǎ�&�.]�4��h��o���̙3�+,,��\r�\\s�5FZW�n咜�ұcGs�uי��/h�޽ݖ-[�~rr�yyy�>���)Q\0���5�z_\Z�#\Z��xy_�|F�$j�k}Mb�%h�\'�|�qѢECn��vs뭷֙���&q��lذ!n���?<��cO�{\0�0688�=�������ٽz�2���7ݻw7m۶5�[�6�������ddd�;v�ݻw���\n�����7n�x�=#1��&e[�lٶy���\'M�d���&}ވ#L\\\\\\�Y��z�G\",X�.�\0nK�FJR�\"IY�3!�����í��]t�E�ҹsg3`�\0+I����_|a����%�d?𿒜�$9��4ge�\'iO�ʕ+�饗���9u���L�>=R*�Y��\'Q�\0���L{��H\"e%e�l���k:�Τ�.ړ������a�F��V_�����2i5\r�0a�o�J?oڴi����ޖ�=�����1e!!!�9��=z�W^y��!�}��޽{�&gs���&1�Oѳ/7n�8Wǔ����6�9�^������&$���cʴ���g��Ɛ5��|�g\\�;=����֬Y�P���1a�t�m�E�i�&�C�\0�8:%�$e��:�L���&e�ə5q9�k����$f��[���~�N����KNNn\'��\'�����E�����9A�|5�j�O���×���9r��>\"���\"����_\r�).��ꫯ�����1�Z���}�ݝ<���Jf�%�\\�/߯g�\"��ʗ~/=�J+�3g��<VTT���γ��jݺu�������b���ԩSABBBJCbHg�����<�n��׆�����/�%���Y�o�XO�ݻw���~;Fn�vi�����w�y���?((H+�$�Τ��`�?��RI�-ZTޒ��\'��Ǐ[c�t<`xx�5`���$�]�vfʔ)fذa�����~��N�������͛7[�8���N�:q\'b�31t��Q���z�ϔ��t�ڕj�(��D��D��\"I~����/��/�dU�Zo�X<A���	å�v>tV}Mbx�^�R/��M���o+�`�\r]� �{�TN�r;�[�Trmeu�T����������ck�\\֥��U���*33�dgg�]�v�?�М:u�<���a�o��F�l#��\\S���4uRʼ������Uqb�31��[LL�y?W_C5I�&�C�J��߰\\�յc��ڗ�~��y���wI���^�$�V�7]q��t�S�S��mI�o�Z�,�������r^/ᢖ�R=\'�y��Ǎ�n�{��\'��_n�~�i�����W_�!C���{o��k��� ��C��u���C�c���}){�Iۨײ�����K=��?Bc�E_������x��s�ε�w�-z��瞫��ff��2\Z%-�\\Yo��W�gc�(ϡѣG_y�]w5��=Ҋ���a����?[�j��V��;ކ��Mz��=����t쑎E�С�Y��3gN����ɓ\'MJJ����1DJ	ͦ�q�������`��|�ᇝw˗-[���:z��3��դLm߾]��C몠�q��或TN�w]�זk�^S�N���;X�	j��t;~�x��ʕ+�ޑ��K긟~������fl]���/�4���zMe�:V��|����a7bȳ1�P�hCUsr�������l�Ǒ��gDDD8���fr֯_��+V�h[W�Y����9૛���<U-�VE}�o߾W4��s�Nk`�̙�ݧ�~j<h�R8EGG[kM�\\O{?שRt|ѪU�̍7�x�kN�>m=��٥K�f-��n��\Z/UWo1�j,b��1T%�����\ZCvy�J�j��s7M�]�y3�K��(((�q$�\"I@�T0�5�J}�IHH�^^����cǎ��B,��N�/¹3��r�,K$y]��z�!Gs�^:h[{]��rrrLII����k^k�y��\\�}�����o��=�ݫ��j��ͽCUzXL�\Z�<y21��jb�q1$�����}\Z?!սvgŐ4���s���:�\'3�|\'I�\0/���Qi5v�fb�o߾C�\"���yz\0n��}<h�,�Z	V?�^�����Ͳs)hi��Na���ϛC�Y���Б�7m�4�y=��{�i�����VOGTT�u_\00��|ݙ�T>�\"�Zz��ϯ�؉t��7�$���L�>���e]edd���CbxItt�����������wn۶M{\r���5���ۥ��ݥ�^���}�F+�Jp�,��l�u-}*�Sj޼yZ�����f����\0�~��z���T\r�p��z(c�޽�䠽z����%#��Ck׮�u.�su0��Q����	wI��0�$��\"��9Ŭ$W��y�~��-$f�������`UUU��&�-?x�`�q��H}���u��ۯӦ�d�&��Q�4��[�Yd:m�SO=ef͚e�ԝ�U��5O�CDz�mc-_�\\�r���Ġ:�[o�e�uew#��C�G��b�e�Phh�\Z���[oj«����dVc�ڵK��Y&V��^2cƌC�&M:\"��:���6nܸ�n�w��;�^�t�ғnn��$��i��h�\Zu�11[�n=뱡C�Z��:w�\\s�[S�d�}���>�U�V>��1�O1�dɒ��ƍK��n�Nҫ=����n��ׯ_�Wp&e[/��&1ܨ��p�?��hC=�kV��G��TJs�����e���v�n-��4�{ #���C��bM\0��٠A��:��رcz�lMo������ܹ�9|�?...>��\'͞=[{�JN�8��R��[�t�\ZY��m�5{�7��3�A����URO����K}Mb�SXX��W�.���<a߾}��ڵ�vi}=�Ү\0>�AS=�EVV�u��ə&e��9~���a�b��I��st��3g�\r�477׭�-�7�f��#�����?J\0�V_;�	r�J��lZ�z��l}��/�\\%\r�KJJ}=ޟ�k3�����%���^|��bw��iO�/�pYUU�\\��S(e\0h���T=���39Ӟ3��֒%KjO[/}��A;e�מ2=ct������ϒ��Ä����ӧ�3fL�ȑ#�\ZyB@��9s��ܹ��=U*�E�.\0��$U����3;���1g:�����I���g]�^/��W	�Õ����zY�O���$gO�Χ6��k3�|Kl�رۗ/_�P6�?%\'\'G_{����M�6�Y�xq�����RY��%\0x������FC�m�����\\��m�1e�Z_���Zb���l�cfϞ=><<�w\\\\\\���[��Ɔ�o߾�^����,GZ`����?�u�֐���JA/��nvvv\n��+���Z_Kr�,	Z|r��n����$f�\r^g|^����e�޽c���s���+�v��di#K�,:�͗��������k��>F4g}ݩ���z[���k_�e�VJ}Mb��3N��g�~��\0\0�k_�Y�\0\0\0$f\0\0\0 1\0\0 1\0\0\0�\0\0\0�\0\0\0H�\0\0\0H�\0\0\0@b\0\0@b\0\0\03\0\0\03\0\0\0��\0\0��\0\0����m�����NA�\0�;dʪ�B��H�\0T��l��:u��h����e��B��H�\0T�ZXXHA�\0���E�J#�h13\0�����&�y���0�WF^^�5�^I!�b$f\0�\r\Z4h��P��ʢ0�Qzz�&��n�����-�@b�EYYYRFFFiQQ��������卲���!j��B(�?�������{wH�>:::�A�xq�����;((�?���B��H�\0�X�x�ᤤ��rrr�\n�Dv����`<\'Cv�gff��a��C�Bðu`Æ\rq���o���\\s�C���iӦ�<F�4��1���s:H[�顧#F�C �@b�^7n�#���f�,}e�Q*M��Si����A��1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���V`h1z��\0\0\0\0IEND�B`�',NULL),('1602',1,'processEric.bpmn20.xml','1601','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions  xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/test\"><process  id=\"processEric\" name=\"测试流程11111\" isExecutable=\"true\"><startEvent  id=\"startNode\" name=\"开始\"></startEvent><userTask  id=\"one\" name=\"第一步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\" sourceRef=\"startNode\" targetRef=\"one\"></sequenceFlow><userTask  id=\"two\" name=\"第二步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\" sourceRef=\"one\" targetRef=\"two\"></sequenceFlow><endEvent  id=\"endNode\" name=\"结束\"></endEvent><sequenceFlow  id=\"sid-C9475C24-996C-40E7-9603-B06464B146D0\" sourceRef=\"two\" targetRef=\"endNode\"></sequenceFlow></process><bpmndi:BPMNDiagram  id=\"BPMNDiagram_processEric\"><bpmndi:BPMNPlane  bpmnElement=\"processEric\" id=\"BPMNPlane_processEric\"><bpmndi:BPMNShape  bpmnElement=\"startNode\" id=\"BPMNShape_startNode\"><omgdc:Bounds  height=\"30.0\" width=\"30.0\" x=\"171.0\" y=\"78.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"one\" id=\"BPMNShape_one\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"246.0\" y=\"53.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"two\" id=\"BPMNShape_two\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"391.0\" y=\"53.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"endNode\" id=\"BPMNShape_endNode\"><omgdc:Bounds  height=\"28.0\" width=\"28.0\" x=\"536.0\" y=\"79.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNEdge  bpmnElement=\"sid-C9475C24-996C-40E7-9603-B06464B146D0\" id=\"BPMNEdge_sid-C9475C24-996C-40E7-9603-B06464B146D0\"><omgdi:waypoint  x=\"491.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"536.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\" id=\"BPMNEdge_sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\"><omgdi:waypoint  x=\"346.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"391.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\" id=\"BPMNEdge_sid-C1B16C79-863A-402A-B194-B3576329D6EE\"><omgdi:waypoint  x=\"201.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"246.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('1603',1,'processEric.processEric.png','1601','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0>\0\0\0�\0\0\0�;�U\0\0\r9IDATx���il�u��q�A\r��0��7j4Fc�o$Qs�N���j[�X�\r\\���T�A�f��̕��\\�%��7�BD�\"XDFEdk����������I�P�9�6�{������\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������]�v�;３/^��|�MU�jiiIK�.���IR��!�����lٲ��ޞv�ܩ��6oޜZ[[;����Z�@��Z��U>�+[{�)C��2P2�kB�(���2�j-C\0%I�BӒ!0�նmLk?�G��徼��xL�ѴdH�\0��i��uCZ������ݹO�c�fc�!��������kX�j�|�fc�!�����[�ش�9���#C2P5Mk՛�zlZ�fc�!д��G�d�ҚV���Sӊ�4���@�4�5˟�i�s���G�d�j�֖\r+Ӫ7�\"{,��l>2$C\0UӴ���p�~M+�h4-�!��jZ;v�5+��E�X<��|dH�\0��i�UuW/���ψ�\\y��#C2P�M+[߸fI��»{lX����k��|dH�\0*�il\rݚ��%C2P5�ϡ��h�]�1�ȐTL��k�*��c�!����4-�!\0��ҴdH�\0>����N�\04-e�Q2�����+W�0gΜ577w�r�-i���骫�J���i	�{����C��9s�\r>JӒ!\Z:\r\r\r�QWW���2z��W_�+��3��{kwV�g5?^��A��g�ܹ_���i�ĉ驧�J��nڰaC����S�?����G}����t뭷�I�&�������4-���Ɇ��@�%�3\r:��[�����yـ��ӧ�;�3j��ٓէ�~�&O�����v�9�?\r>JӒ!\ZԁgDV�u��~���5�f+ϰ�^{m��������{5�t�p��4f̘T-[4-MK�d�����ͮ��/ޕ�\Z\Z\ZҌ3Ғ%K�w�}�~��|���o��[�/_�f͚�F�\Z�}�����z�z�m7�|sZ�zu\Z�~�m�!j�ر�c�Q��z�R�[+�^x!?��Plݺ5}��n�����	��\'��C���x�q��U�����iɐ�Ӗ����n˷��E��8��x��凪��Ė�����G[~F�\Z��ee�Q2�wqLO�S�v����\r��t��u��H���\Z~�}�����t644�j�Q%C�\Z|�o����S<�t���IU�7o�7�]�v��6a�J݄�iiZ2$Ce0��(>������۫�����ʭ=q��8e�>��T�[}4-MK�dh��uz\nCI�<^z�%[}�^qE�8��?����u�]����iA��<4-MK�d��3WZ.�[e�l�2(��8۫�T�rZ^C��m(�}��TJ�f���K/�N�����n���iɐ�c��ކ\"�̙3{9]��g�nIՈ{o�m(JiŊq��Me��)��?Z�Ҵ4-����P�{��|kk�.��\"�E?�&ݒ�7ݸqcI�M�6ud�=e���Z�*^�hZ����Pfh�\rG�������\n�E?�ݒ�wY/�p�T��Ň�8]k^�鹜�֎;�*~,~��}~�������%C244*��@��~�Sۋ��nIՈ@�~�LoH���V��w��\'�9s�������:+]y��\'��kŊ}z�?�0?h2���E$��d96-��Z�P�J���-�\Z�^{mɷ�l߾��B��l�{�\\x���i7����:�t���M�K.I�Ϙ��.������9�y����\'�pBjii�jZ��rJ:��S�z��׭��`�{�t�q��X�\r~��jʶ�@?�t�M%?�����Y����Ӭ��������j�q��hRq�E4���o���;��Ͼ������/����i�^�����~��=248r��{�wW���Z�hQ{����k\\�{�*��5cƌt��gwU4��O?=����NJ]tQ��3\Z�رcӰa���_�����}�!�x��3T�@Ӓ!\Z�9���?�U���3mڴ�2������s�z��RsssW~����z|\r�д�Ν�<h�.��K����+M�<9M�81���#�̟���Ӵj\'C�)\Z����)S�\\��Jy�����]�x%�rjZ7�xc:��3�����:�������Xh��,X��㎃��y�l�}��G�\r2����+��b7E�e���-C/��\\|����rscc�+7S�&M���T��Z�h�7�z�rjZ�~:��s���D�\Z9r�>[q�ح޾��wߝN<�Ĵf͚}�V�z�1Ǥ/��RӒ!\Z�-C���5f̘��~����ә�Qnww��׋/���y�4bĈt����M+�وݖ�g�Ώ���A�?��S:���U�]q�iʔ)y�z���]��3g}n۶��������0@���~�?��N=q<Q�=�8M��g�Dc:�s�g���A�qq��XێJ�=��>]����֭[��~��t��\r+�,]|�634}��|:X=���2T��gka0������8�=V����T��\Z�4\"6m�^�zP���+Wn̾GG��pY���ʥi}����.��{._P�cѴ��⋼i�1;��O��n9�#���k���\\u�v3C�W_}uЊ��P���P�QP�N����\'rCn���Y��k8$���kjj�`i���?g�ݕ�ɴ�ﳴjժ|M�����c�?��$C2T����f_�\'���u�W��n[z�⢦����7�s�����ҳ;��.��ߍLjZ2$C�$P�-V�؜إge��[q s�1=Qհ��^�IdP端��ُ�;}��5�{+>���{Ѵ4-��r\\^g��}\0����EckNa7X�Ί+2��	���eQ��EwV��\Zz-�!����4~���O>��WO�0Y�\rN����j�G�iiZ2$C庼.>ͽ���cz���&�h������;�~��=mmm{\n76��ƽ�ZZZ~�6m��쵻�k\r�v6���iɐ���PU.���⊡�Z�+{����gO��%.k^�W�Դ4-�!�k�fhZ�����GiZ2$C\0�iɐ|��G����>J�\04-e�Q2�iiZ2�>\0���%C���iiZ2�>\0���%C2���iɐ|��%C2`�Q�����G|������>J�\04-e�Q2�i)��2�\0hZ��)����iɐ2�\0hZ���\0���%C2P�/^�YhZ2$C\0�aٲe���\ZFT[[ۺ�i�!Uk(�%K�<������?hCܰZZZvg���Z�@Ieʿdk��b�\Z��Y�\rK�d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�&�Nr��G>�\0\0\0\0IEND�B`�',1),('1802',2,'source',NULL,'{\"resourceId\":\"1801\",\"properties\":{\"process_id\":\"processDemo\",\"name\":\"流程测试\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-25C15E6A-F8FA-4604-BD2F-5B056987C9C8\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"开始\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\"}],\"bounds\":{\"lowerRight\":{\"x\":109,\"y\":86},\"upperLeft\":{\"x\":79,\"y\":56}},\"dockers\":[]},{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\",\"properties\":{\"overrideid\":\"one\",\"name\":\"第一步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户1\",\"assigneeDbId\":\"c567ca3b-7c95-422a-a025-2d93e43a98a5\",\"assigneeId\":\"user1\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\"}],\"bounds\":{\"lowerRight\":{\"x\":254,\"y\":111},\"upperLeft\":{\"x\":154,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\"}],\"bounds\":{\"lowerRight\":{\"x\":153.15625,\"y\":71},\"upperLeft\":{\"x\":109.609375,\"y\":71}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\"}},{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\",\"properties\":{\"overrideid\":\"two\",\"name\":\"第二步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户2\",\"assigneeDbId\":\"f2b7cdf4-a689-4006-8c83-f6a2accd837b\",\"assigneeId\":\"user2\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\"}],\"bounds\":{\"lowerRight\":{\"x\":399,\"y\":111},\"upperLeft\":{\"x\":299,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\"}],\"bounds\":{\"lowerRight\":{\"x\":298.15625,\"y\":71},\"upperLeft\":{\"x\":254.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\"}},{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\",\"properties\":{\"overrideid\":\"three\",\"name\":\"第三步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户3\",\"assigneeDbId\":\"00651061-a87e-4ac9-9c54-737002f49aaf\",\"assigneeId\":\"user3\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\"}],\"bounds\":{\"lowerRight\":{\"x\":544,\"y\":111},\"upperLeft\":{\"x\":444,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\"}],\"bounds\":{\"lowerRight\":{\"x\":443.15625,\"y\":71},\"upperLeft\":{\"x\":399.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\"}},{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\",\"properties\":{\"overrideid\":\"four\",\"name\":\"第四步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户4\",\"assigneeDbId\":\"8953750f-92f8-4cf9-9be7-9e3b5444b6fa\",\"assigneeId\":\"user4\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\"}],\"bounds\":{\"lowerRight\":{\"x\":689,\"y\":111},\"upperLeft\":{\"x\":589,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\"}],\"bounds\":{\"lowerRight\":{\"x\":588.15625,\"y\":71},\"upperLeft\":{\"x\":544.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\"}},{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\",\"properties\":{\"overrideid\":\"five\",\"name\":\"第五步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户5\",\"assigneeDbId\":\"d2965713-bb42-40c1-a689-73e9907f214b\",\"assigneeId\":\"user5\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\"}],\"bounds\":{\"lowerRight\":{\"x\":834,\"y\":111},\"upperLeft\":{\"x\":734,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\"}],\"bounds\":{\"lowerRight\":{\"x\":733.15625,\"y\":71},\"upperLeft\":{\"x\":689.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\"}},{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"结束\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":907,\"y\":85},\"upperLeft\":{\"x\":879,\"y\":57}},\"dockers\":[]},{\"resourceId\":\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\"}],\"bounds\":{\"lowerRight\":{\"x\":878.375,\"y\":71},\"upperLeft\":{\"x\":834.390625,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2',4,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-1EEB2C11-AAC7-4D00-9B90-3AEEFB903290\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"开始\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34C69F9-5F8A-4373-B702-95EF7D9C3CC8\"}],\"bounds\":{\"lowerRight\":{\"x\":210,\"y\":159},\"upperLeft\":{\"x\":180,\"y\":129}},\"dockers\":[]},{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\",\"properties\":{\"overrideid\":\"one\",\"name\":\"第一步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"普通用户\",\"assigneeDbId\":\"1\",\"assigneeId\":\"user\",\"type\":\"role\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D08FF132-6C77-40F9-B83F-89BD8BE61F2C\"}],\"bounds\":{\"lowerRight\":{\"x\":355,\"y\":184},\"upperLeft\":{\"x\":255,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-C34C69F9-5F8A-4373-B702-95EF7D9C3CC8\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\"}],\"bounds\":{\"lowerRight\":{\"x\":254.15625,\"y\":144},\"upperLeft\":{\"x\":210.609375,\"y\":144}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\"}},{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\",\"properties\":{\"overrideid\":\"two\",\"name\":\"第二步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-71564709-5258-453A-9270-F358EB49F391\"}],\"bounds\":{\"lowerRight\":{\"x\":500,\"y\":184},\"upperLeft\":{\"x\":400,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-D08FF132-6C77-40F9-B83F-89BD8BE61F2C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\"}],\"bounds\":{\"lowerRight\":{\"x\":399.15625,\"y\":144},\"upperLeft\":{\"x\":355.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\"}},{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\",\"properties\":{\"overrideid\":\"three\",\"name\":\"第三步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C782DE7F-74D1-4761-AC69-905EB20382CB\"}],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":184},\"upperLeft\":{\"x\":545,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-71564709-5258-453A-9270-F358EB49F391\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\"}],\"bounds\":{\"lowerRight\":{\"x\":544.15625,\"y\":144},\"upperLeft\":{\"x\":500.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\"}},{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\",\"properties\":{\"overrideid\":\"four\",\"name\":\"第四步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-080B3F2F-927F-4481-962E-FFD4A0F902EC\"}],\"bounds\":{\"lowerRight\":{\"x\":790,\"y\":184},\"upperLeft\":{\"x\":690,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-C782DE7F-74D1-4761-AC69-905EB20382CB\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\"}],\"bounds\":{\"lowerRight\":{\"x\":689.15625,\"y\":144},\"upperLeft\":{\"x\":645.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\"}},{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"结束\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":863,\"y\":158},\"upperLeft\":{\"x\":835,\"y\":130}},\"dockers\":[]},{\"resourceId\":\"sid-080B3F2F-927F-4481-962E-FFD4A0F902EC\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\"}],\"bounds\":{\"lowerRight\":{\"x\":834.375,\"y\":144},\"upperLeft\":{\"x\":790.390625,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2001',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0!��\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0�IDATx���	|Uս/��P��*^��Z�P��RE��ux�J(8u�>�-�֡��:T>�Zk�VP��e-��#�h)\n�P}^�\0�!@�o�}	7�0�����ٟ3d��}~g�{��V�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|D�M@K���-,--����|����_�n]aMM�\r��/uNNmaa��ڵ��y��;�����!C2$C2$C2$C(z������]�b�/7nܸ_�^��.]�$�;wNrssm�&�?�I��L�/_�����\r60`�\"B�dH�dH�dH�P�B�-Y�d�[o�u�A�x��qO���Eeee�GuC�:���O\\��!�!�!�!ڒ<���n��r�G����C���}�c�V�Xq�СC�3�?e�!�!�!B��𔔔\\������}c��d٫�%�^{<���g����N\n:�L��l�&j߾}ҵkׂ�K��3dȐ\'ǎ��!C2$C2$C2$C�N�Y�A\Z�9+���\Z�w�?�T|�zRS�)���J֯|3Y2oTRY��\r�;vL���S���w�!C2$C2$C2$C(z!�⨄q��x�JcV��-�ڴ�#�����gـһw�n�����9s��d�!�!�!B��Ꮳn\r;�{�z�9ݻw_..�!dH�dH�dH�dE/dH�w.ÿ=�՛���Zs�eRϞ=�G��/CȐɐɐ�mA�M@s���Q�hy�s8 \\��!d�!�!�-p��f\'7��^����!_��!dH�dH�dE/4�v�n�o���\"C�2��^�a�:9�o��#���t;��\r�!C�2(z�wu�qDұ���߹�62�!C���e�V�y�G�ڸֆA��!d��6�[�,�7*�X��G�����ɒH�B��!dP��OYS6?4�#������:�W�&%s�MV-y>�5G2�!CȐ���0ݴ���r��)�s�+j�7��]�Z�����S�!C2�!C��c���\"��]m��{@K_��D��!d����=U[Se\"C�2��D�fZD�3n��!dB���s�\0\0\0E/\0\0\0(z\0\0@�\0\0\0�e �,���-\\�p�/���ח.]zLYY�~�������I~~~m�Ν7w��������^w�u��j\0\0��2dH着�srrN\r7�	K��t\nKeX���dA��syyyƍ����&��>��n���~�a�G����?��\'>��\"7),,LBᛳv�����N�E���?�ׇ�dݺu���i+\0\0�b�����+kjjN	Em�FV)�!�o�������}РA���Q�Ǐ��e�̙3���~��׬YS��}��I^^�GS\n߸���#9��K.�$��_>x	�\r6�ڕ+W���#��a�\0\0�	�F,d﫭����?<ǰP_�ZkEo���?��3F�}ڹ瞛|�K_j��ݑX �%o���}\'M���w���9�\0\04T\\\\<(77��555]���ǧ?��䤓NJ;�d���O:w_�>Y�zuRRR�̝;7�?~�y�溇��{i���W�ƣ�����>���O?��	�\\sM��O~�I�7`���o߾F�qϷ�����#G��V\0\0��煂wl(x���x���J{�6��~��ˁ��|��i��O&O=�TR]]W�j��\n��P����nFoΐx�wʔ)\'���?mr�[���Nn��!�#B����\0\0��#�SC�������;� V����G����qqܡ:�9hm���7�9�O=��iW_}�.�lW����;�k��7!|}mm\0\0h��9�yyy��+x?����oަp��q��GuT�����T{(z�(��<cƌ{�9��:��P<�[\\\\\\�����-\0\0mW�	F֝���^{��9�M�=��?�_8Ǯ�(zIM�:uT�v(���M�sN�.]����\0\0ڦ8-Q(x�5^����B��o��7�\\�7o��R{(z� �]�h���D�ڵ���\r6�knn�-�o\r�ƛ◬��?C��!d�����Z Z��]��\'>�y�W����m�.\\x��￟�j���g�������8?��W��+�/k�c���W�׏���^�Ӿ�y��b�iӦ�����ǣ�u#�eԴiӒ��o��62$C2$C2�:3TYY�lذa�K\\G�dh{Z�|yRVV��%�#C���^�z�...�;\Z2dH�pqZ�^7Rs6�}�����kX{��j��^z����ݹx�⨣�Z���c`�zg�=0��=�{�zq�_?\'\'\'~)��������O����5z��ʽ��\Z>|x����H��۷o���_w_�K�v�\\���g��G����&	�X\Z�dժU��O?�v���/9c]P2I����%K�$\'N��s�r�Aɐ5������)U�]vY�ʓ!j,Cq��O}�S�c,X���YUU����ɑG���ꫯ���!j,C�rٲe[����=���?��s���3y��eh�t9\Z^sHx��PX>n�ǎ2���u��#� ݺu����:w�qI�9��ڦ�P��1K�.=������\'�t��!���ބ	����e���j���t���K�����\r��\'���eڬY����Ϫ��4m��͛�<����ڵk�+��2���s��Ih`ҿ5E|���x�|�ʕ[og�HN&�Pv2�#�#�#q���e(�[��i�:t�̘1#�~��\'�<�HzT�?�a2eʔ���qʐ���C��8�~�ar���j�2�(�!C�U��0)77���\n�:����\'���7��^�{���\r+++�/�kN�zh�MvL#�\"-��Z������{��W�^kBc���������2�q���~7���I�ꪫ�C9$������޼ys��3�$��vZ�^�s��\\:��>B�2������K/�!�ɐ�P��Ћ/��|������*�Iw���#�3��Q1C�>�^M��73Q�1�zݦ�m�����x��9���G�T�/��\r��9������i�M�%,����󄊋��\\�bE�^}��M��ԙ>}z��o�{8��#G&�����G!vۉ���������J����e&O��ͺ�o{�}:>���d����ɐɐ���[�.�b\Zs!C2����9vi��N��t��1y�\'�>��c��:��e\\<<0���[ν���C�k���]�ۆ��6�kΙ3\'vm��ۿ5�[�?~I��{�v\n��_�Ν�\\t�E-�y�p�\r[o/]�4m���c�\r�W\\�^�]���]\'�禼��+��Y�f%��zj���/�K��_�2�?v�>KK�����v_���fhw�~���2����$=�Ҙx��w�!C2��v(vK������!ڝUTT$/����\\���u�c���/�<���e�yl�8��D7��\n�}���	\n\n\njCÑӜ��\'����ɓ�_�۷���a�����K��.�S7`�\r�[���-�y�:����t���ŋo3\0LQQQz���õ�H���90�>�h�/|a�u6nܘ�_�w��-����/�����2���)������k�e����ː5��؍���nJ��l���k���>��@z2$C�e�O�>ɭ�ޚ^���XF�;@ CM�Pu(�k�誟��pwZ�6<o:��Ή��J�mXh6�^��}<o���ke|�	n��:���/�ufe��A�m��!~����5����p�鰌+((�s<����FmK^qІ������fz;��z���ܦa��o����Ɲ\Z���� ��h6�����Er��xu��==:t�u��P3�\'dH�\Z����)C2�X���U�ȩ+j��?����ԋuG�dH�v�[VRR��$�+x�C��P<}1�\n���h�6���\\�vX\\?N=�͢7>=(z۰��������,z�ԛq��NV��	�qgSX:��Ö�/���L�С�ӡ�[��}^�����G�4\rq0��\'%���ӿ�Q���������OJ�j�s]�8\0��\'��>�q����CdH�dH�d��d(N����T2ubo����C�4�N8A;�Y���W��t�wTw�\n󂺢�����z.u6ĝ�,P��aEEE�.Z�谓N:��^��矏{���:\'N�~�^<���\n7�����T�KG%x���p��>/]�3�����0��]��܄q��8`C���Hu�eԨQ[��.!/��r:{�����{3jz���tJ�]�����2$C�d(�~cv�ycF�����e�k��~�����^�y�����՝��ˍ�`�u����bϸx_<z�E��ni_og�N3\n�g��q��tB<g:[���󬢷\r[�f�����WWW���A��ŋ���+w�bnnn�`h��@�f.f��x�������*6�q��}�{Ɉ#��˱�O[���t4��X�{�{�\Z�&M��Bĉ��>���{�I\'��P�2����Оf(�G3�\'sWĮ���!j�[׉]Uw���C2�h�b1[7\0U4{��t�/f%>|xzDW����������{���΄xT~wN��U�k�y�⁶������-G��4�\\s�C���xN@�͘1c�C=tphH�����A�ݔ��S����d�̙3kO9唽곋\rE���������i#��S�N{un��׿&g�yf�ɐɐ��UUU��(��9�#C2�ڻ34x����`N�z����:$��1=���u�D�i��6њ5kn���裏������?��䮖�w�����>�L��ٳg� C2$C2$C{K�vV�6\\G�dH;��g�waI���]<�D�乽��N]{�Q�P{��\Z�{��5ͨQ����x-�.����)555�.]:�V\0��g���S�Ŭx���:�����2!����_��:�uG�g���Cћk֬�_�=�؆8�Y6,\\���y�杛����,�\0\0�.O�L#TVV��w���7����}��꺮V���Cћ&L(ٴiӷC�֯X�\"����܈#�	���������\r\0\0m������:\\M�8���7ߜvM��q?��Ϫ.\\����P{\\њjEo��;v\\EE��7�tSE����#�?��?Q]]}o�X[\0\0�8qb�v���7���q�ƥ�트^���믯�7�,}Ck�=d�A!d���[�8p`�y��q�Z}�]wM}���o�m�\0\0uB�::�q�{srr����N�6-�*Nu�\'&�zh:�]�Ν�.̱�-))�Sťf�ƍ� h��8_�խ��P�fX��2hР9�&M\Zw�aÊ�=�����ʙ3gN3f�aUUU���K3\0\0���#�\r�Me������N���;;���ZkEo�~���_C\0�y�W�o����}���ׯ_�>}���֭[����dÆ\r�W�^���W_]<{��ŋB�;<�w˖-k�*\0\0`j�3c�\n�a���u�찌j��7��.&2���/�<p��_��K�P�.a��8�_�rŖ�\0\0�Q�QSS30�u�G�-�G�A����l\\�����f0nܸw���[\0\0\0�G31z3\0\0\0�^\0\0\0P�\0\0��\0\0\0�\0\0\0��\0\0\0E/\0\0\0�^\0\0\0P�\0\0��\0\0\0�\0\0\0��\0\0\0E/\0\0\0�^\0\0\0P���-7����Ɔ��ϡ4\\T�2�ɐɐ��),,|�ڵ6�^`ժU���B��!�!�!��!�ڵ��f�\Zb/�lٲ�p1K��!dH�dH�dE/dHee��	�����Z�e��\\���p9E��!dH�dH�dE/d�)��274𯔕��-hѢE3��Pv�gΑ!d�!�!B��aÆ�%%%����m��jժ�W�\\y~MM�pB�dH�dH�dH�h+�l��رc?���熆悢�����E������:��2�ɐɐɐ��,3f�[C�}q����g]h�;�K&{JB��Hii�鱁?�3��2$C2$C2$C2D[��E��>}z����_���۳g�w�w�~@�.]z��l�&����a�㨄q��x�J��3`��E2�ɐɐɐ��f4cƌcrrr.\nW������*M\'Z����\n˔�>H�ɐɐɐ��3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�����3�Fs\0\0\0\0IEND�B`�',NULL),('2003',1,'processDemo.bpmn20.xml','2002','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions  xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/test\"><process  id=\"processDemo\" name=\"流程测试\" isExecutable=\"true\"><startEvent  id=\"startNode\" name=\"开始\"></startEvent><userTask  id=\"one\" name=\"第一步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\" sourceRef=\"startNode\" targetRef=\"one\"></sequenceFlow><userTask  id=\"two\" name=\"第二步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\" sourceRef=\"one\" targetRef=\"two\"></sequenceFlow><userTask  id=\"three\" name=\"第三步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\" sourceRef=\"two\" targetRef=\"three\"></sequenceFlow><userTask  id=\"four\" name=\"第四步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\" sourceRef=\"three\" targetRef=\"four\"></sequenceFlow><userTask  id=\"five\" name=\"第五步\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\" sourceRef=\"four\" targetRef=\"five\"></sequenceFlow><endEvent  id=\"endNode\" name=\"结束\"></endEvent><sequenceFlow  id=\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\" sourceRef=\"five\" targetRef=\"endNode\"></sequenceFlow></process><bpmndi:BPMNDiagram  id=\"BPMNDiagram_processDemo\"><bpmndi:BPMNPlane  bpmnElement=\"processDemo\" id=\"BPMNPlane_processDemo\"><bpmndi:BPMNShape  bpmnElement=\"startNode\" id=\"BPMNShape_startNode\"><omgdc:Bounds  height=\"30.0\" width=\"30.0\" x=\"79.0\" y=\"56.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"one\" id=\"BPMNShape_one\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"154.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"two\" id=\"BPMNShape_two\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"299.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"three\" id=\"BPMNShape_three\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"444.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"four\" id=\"BPMNShape_four\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"589.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"five\" id=\"BPMNShape_five\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"734.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"endNode\" id=\"BPMNShape_endNode\"><omgdc:Bounds  height=\"28.0\" width=\"28.0\" x=\"879.0\" y=\"57.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNEdge  bpmnElement=\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\" id=\"BPMNEdge_sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\"><omgdi:waypoint  x=\"254.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"299.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\" id=\"BPMNEdge_sid-0B02859D-E76D-4F27-9799-D34A49B900C7\"><omgdi:waypoint  x=\"689.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"734.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\" id=\"BPMNEdge_sid-58E75DAB-AEE8-4892-889B-E75209B61C50\"><omgdi:waypoint  x=\"109.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"154.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\" id=\"BPMNEdge_sid-4BF56CEB-6C89-4799-A900-BE82D570734A\"><omgdi:waypoint  x=\"544.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"589.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\" id=\"BPMNEdge_sid-D98CE82E-563C-417F-B7C1-66B262A38486\"><omgdi:waypoint  x=\"834.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"879.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\" id=\"BPMNEdge_sid-A0D0A014-64B6-4671-95E0-3E8789900350\"><omgdi:waypoint  x=\"399.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"444.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('2004',1,'processDemo.processDemo.png','2002','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0y\0\0\0���\0\01IDATx���ylTu��qwQ��FML����(���k��c��JBdeUn,�RP.nѸ=ϕ�\'���$�.(p1*DA��E������3�P:-��0S^��Ng�S�y���{~��9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`_!����WΛ7/L�6-L�:U\n����0s���$/sH8�!q�C���\"�Y�f�����u�V�OY�n]�1cFmRP��pH8�!q�C\0J�xFN-�B:u�ԭ	�8�!q@��x(`œ8��C�!��8�!(�V�RD9�!	��C��\0䵈n�}M���o�O��>E�C��8$��5��������:,����裁�$>_S��9�!q�C�!�^S	h*sf�7�V@3Y��$�ρ�C��8$��5���2w��td�\"\Z_S��9�!q�C�!�^S	h*sf�ԡ9�h|M�s ��8�!	��{M%��TDQq�C�!��8��h��Y�\"\Z_S��9�!q�C�!�^S	h*sfٜs�����@�!q�C���J@S�3��%��}�G�\\|M�s ��8�!	��{M%��l4˿�[��)|�(�8�!qH8d�k*Me�ٲ%,����S=���k��1�8�!qH8d�k*Me��kCuX:煜k�kqЁ�C��8$��5���r��qk�M�7��4��M��Y:bq�C�p�C�J@S���8g�Qq�C�p�C�����ٸ���)����8�!q��J�\0n*�[@3Q�9�!q�C�4���T�\"�!q�C	�\0(��(�8�!�p�C��*�	�8�!q�\"*��!q�C�h*�z!��x��qcǎ������O�>�s����;�:t�z�\n�<����#G�8jԨ��T�\"�!q�C	��KEEE۲��\'������oK�����?ٞdu�Iq;�Z	4�&L��\'�������J�?~����7o�����&,X� ��曡o߾���ۻw����JQD9�!q�C�!�О�4�#�fq}�5d5��&�vCyy�˺�\"$i�5|��0p���aܱcG�S.\\\r\Zz�����o�/M�(���8�!�p��f�]�u{�H�����(���6|����={�I�&�U3Y�)S��.]���2j��*����C�!q�e)++{���<{zk���#F�ӧO?��s���?�����NgMΙ3\'�3&t�ر~cYkԲ\Z�O?�tc�޽�ҥKCK�bŊԮ]����bq�C�pH4�Y\r�쩮��7n\\��nOذaC�}���M�}Sw���#����ӝ�����֭[ɟ5PDQq�C�!��8�r#��\r��Q�����l/��4b��k(�bK�P64bٱc��X�CS)��!q�C�!9p�ʸ�2{��!Cꦸ6�85��\'��?�d{��#^����O�P�ɓ\'�VTT���b��8�!��M����}m(��z#���\n�ĉ��_��m�B��ի��R�VDQq�C�!��8��\r��5�͝���T��5���h�2އ2�6�,Z�(��h�\"��r�C	�8ġ}#އ2��ŋ������,$�//γ/��[���qu1���{z)��(�8�!�p�CʟCm3牣��ׯ�K��\n�}��b�=Z%cǎ����_�d̘1���;��>\0�֗��uUDQq�C�!��8��%��;�ݨQ���sd�VM��*�����?~A�ʹs�nOv��\"�\0d����,��\"�!qH8$����P�����3f��k�1gΜ��ڃ�?���֬YSЦr�ڵ;����?\0ugY�?��\"�!qH8$����P�u[����@O}�����\r;B��ܹsؼysA������-�@�Y�8�_LEt˖-i����ז�9����n?G��8�!q�C�Ps����n#���E���/�;��]����+��z�a�رi���p��;�#���i�Ν۬����/�E�555��V�XQ�E�C�P�84{��0a��9s&�8�ӡ8�j���M&n�!5�Pl4}��&�.��9t~y�S�N�ܴi����XVV6�ꫯnSL�=���p�G�뮻.-r�_}H���N7�pC�Z�.]�ĉ���\'�tR����+�g�qF8묳�|�����=����˙�:�8ԘC�z�\n\\pA�t�ޝC����m�v�\Zn���t�nݺ�c�9&�|��������8ԐC�ߞ��u9��ù瞻�s17n�P�J�\Z�l��w�}_S�z��E��r��YlkV�Z�O���xe��G����\'�|.���ks߿~}����c��VD<�����y����CR�8Ԓe���x�������i���^�#>n���:��k��6<��s��~pȚ�V�c�=���W���k���%���_<���ƌ1\"\\t�Eu���s�I�r�)�k������7��mӦM�馛�]wݕ�o��P|>�}�C�\0(���8ġv(���裏�mr5��P�:���)�˗/�|:����͇:T�\\������O_��T:����S����b.��}�Y�����!������c�ѸV��Ԏ�k\\���C�A��~����;����8��k�����ބCj̡�E���w˃>�!5�PvS��SO�[o�5gS�!�C�ѓ�r�W�Cr�}*[)��&N�ݱcG������m�۷oWj��b*���{o8���CϞ=�|����Z�}�e�	=��Mfʔ)��w�Ou�Qi�������{��q�9������;Էoߺײӻwoq�Q�2Me\\�s�y�խ�>���ða�¼y�v���!5T��\\�x�p饗�]96N��n*9�_***�f\Z��q:��6l�:t�P�T�b�Qr���ۂ\n5�uy�c�(��S1�+��\"\\r�%u#����~��>f_oO�����O>9,[�l�\"\Z�}����SD9�!q�Cu(�T�f�[n��Bgl.����BO�M%�8�X�Mal83߿���5������L�7nܸ���Ǐ��,�ޣ��ҥ��������M�����ܷ���[��^�ڵ\'�xbZD㺂8����O�{�����~K��/��y��n�NhS����P�:t�\Z^S��q�C����P���#�W��N������Cm۶MG+s5��?q�e�heK_�\'�_|���(�ޣ$�ѣ��I�&嵣��7㙂���+��\'^�,ʋ/�8�ϖŹ��-JϬ���{l�n��i~���ꫯ����*-��,����\r><�\Z���uN�PC�+%�?ƚJ܎CjȡLSoM�+�#��P}�������K/�9��#������x�<���q��ǡ�5�2M_��oK�^$�d��e٣���{T�;�]�\"�t�Ҽ4��/^��������(��Q��~�!��ϲe�\0�\"��ߦE4��L~��z�x?�C=��~L�����f�ąq(�����&���\Zr�w�I�%5���8ԐC�I8����ȑ#s&����\Zr��w�M�g�T�mC8T��#i�vf��!C��sc=�\'ó\Z��R�=J�:�ԣG��Öd�ʕ$�l/���b��Q?K�,�9%ho��3}�C]������8�!q�C��TF��ʞϾ�e�l�T�����4�u?7���֭[mK�X�g�r{\"͔R��s=�@,q�C�P�6����{=��k!�4㸆zO��\Z/ʓ��2�5�%O<k�4����~�>\\��v������(Kk��(��(�8�!�p�Cj��#Im��2��2ދ6�Bf���)����aΜ9��N�:��L�)����h�y�������sg\\ܼ7$r��4�����4�YUD9�!	��C�P~z��[�43XCY�g���e�ΝwVVVn�={��U�V�WĊlڴi��ի�VUU�2t��uɶ���gZە�QE�C�pH8�!��hFs�*{�VIEEE���ۿ�찕I��ۑ;��M2)�eh��ET��8$q�Cz@UD9$	�8�!\0��\"�@,q�C␿�ET��C��8�!�T�JQD9�!q�C�!�\0ET��8$q�C\0QE�C�!��8�!PDŁX8�!q�CM%��E�C��8$�J�K��8$�w��*�	��C�\0ET�pH8�!q�C\0Qq q�C��DS	h*E��8�!	��C\0QE�C�pH8�!PDQ	��C��8@b��8�!qH4���RQq�C�pH4���R�RD9�!	��C�!\0��\"�!qH8$��\0(��(��C�!q�C����p�C��8$�J�u3m�4�K��8$�w�<f͚����F+��Z�ꧤ�n�pH8�!q�C\0J��ӧ?5cƌ�_~�E!�����j{�g8$q�C���\"���:u��8�@�[��r��8�!	��@w\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����P#�M|\0\0\0\0IEND�B`�',1),('201',2,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0;�� \0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0�IDATx���tU՝?��P������Z+uY�T�c��m�\r|�I��mն���`e�Xk�C��P�0<E�E�.q]AR�;TMP	��c�>C�y�����Y��:��p�}��}�I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��!�\"\0����敔�\\_^^>r�֭\'oٲ%���Ƃ9܆6+�6//�v��-ڱc�=�~N��!�!�!�@����og�ڵ�ضm�Q�{�N�v�t��%��ζpS�xټys6h�5k�l���z���b�!C�d�!�!B	�:+W����[o]v�q�%}��{-�&TZZ\Z7t*����w�2�ɐɐњ�X���e��rJҳgO+�# ���G>�n�ڵ�9r�ĉ�K��!�!�!�@����W����z}��5���OV��D���璭�N:t��vȷ�S���nݺuX�j�E#F�xjҤI��2$C2$C2Dk��8�Qq��x�H������;KI6�{#��ޞ��T%[׿��\\<>�,�l�:uJ���W���s�!C2$C2$C(\"�-�\\�������$U۷|���^��|����۷{nn�Ǟy���2$C2$C2�\"h����q亽�7R��=�q�.��G����2�ɐɐ��Z�x�8����V����k]o�1�����M�!C2$C2$C���M���qd5�_��	7=eB�dH�h\r��6*^4�ŗ[HC�?�C�!CȐ��H��jױ�^_��`�/2�!C�����qg%��;}���v������!dE$�����S����|�^�Z@�2��\"`w�;*>�\\նM2�!C���_۷�MV.�l^���^����d����!C�(\"�6��tIX�K�nx{��l�X�/z ٰ�Ť�u��!d�6�0�@*�]�_J���������־���?%y�塐!B��!�t�D��7�@W��Ž�%/=d\"C�2�H�-�{cUmM��!C������珱�!d�ˑH\0\0\0�\0\0\0(\"\0\0PD\0\0�\ZX�6���6o���W���+_]�jՀ��ң���s+++�����.]���޽�{���/�����[ny�R\0h�F�ѷ���򬬬s��a���a���m�4��BNN��ɓ\'����+{�ߏ3f�|�{�)�$ɱ����1���KB!��iӦ���N����~K�,��7޸r˖-c~��ߏ�\0چ�Ç_n����9;���0K^�N��n/�����aÆ���O�2e�\"Z��~�����]YYY��;9��ӓ�������SϞ=�3�8#�ꪫ��-[v�ԩS5j���ׯ���G��%\n\0��¶b,���ro/�+�1*�_���FE$-�\'�}��\'�M�0�܋/�8������q_b����s���>}��������$\0@�),,��������nu��m�O|�ɠA���N:)9�裓.]�$[�nM6nܘ\'�-J�,Y��ر��m���^>|���xTRIF��?����>��o���c��a}ސ!C����w;v�����7;�72\0@����rR( s��x\0�.H{�5t�QG�S�>}���:+-(�z�dΜ9Iuuu��s������dF�0:++��9s��vY���O��Ύ��\Z���2\0@F���P��d,���8���=�G(���}q̍:�3δ�FE$)�9gΜso��������v�m�۵k��� ���\0Z�xdNN���\nȓO>9��;v+F|_|�i��V��| ���d�8\n�y���@6�Ȇ���������a�\0��(;{\\�9����7ߜ��x8b7������ص�aE$�P�f�\Z/��alJ]tQǮ]��ӭ\0�u����?����X�nY������\r�88S��d�x����+�2�ڵk��5jT�������\Z���ǆ����\0Y�2�!C�f�v\\D�P���M��K.�����(E$�0˗/�����ύ��8>��O��СC�ؗ���1�������M���\Z\Z��?�яn�G��0|g���{�Q�b��}��]ϕ��ǣ�u��5�ٳg\'>�`�X62$C2$C2�����L***�9�yd��2Իw���&C#F��n΍��Fbm\n^xa���n7�F���Q^y啯��`�y8N;����_�����=\Z���7�{�{eSVVVl(G������\'��P�Ο0aBeK��n�����w�M�1�篶o�>=	�Q�t��-���[���?����׿�uV,IX�$6lH�}�ٴ{I�/~��m�1�P�dh�ʕɴi�����ߟw�q2$C{�P�������k��&����!�S��u?���]�tiz�������7�LN=�����^{-}��N!G#�w��Y\n�\'����W��r�<̓n4����ݻ7�Gm=�3���X��nۍ�Hhf�V�\ZPPPpD�sРAG�F����ԩS+�Q�+����%4�G���BzUeeeE��i�\'�r�=�����[���$�W�N/^�<��#ɦM��뮻.����/�Ih���G���+�xa�����z�G\Z\Z�5M���]�^����q���e(��\'�j�:v�̛7/��y�%�>�hz��?�A2s�������Aˏ�k�Е!C��o�����x��\\�Sw���M��ϯWD������������H:����{x��8�s(j?�L+��a�&�\r���ݻ,4�O��rBK٫���w�󝤦�&}���ON8��{��^�xǎ�s�=��{�����gғ�[	j��=�W_}�ɐvH�d��d(/d&�)2�P������r@��&�#b&��ڷ��d������e�H\n+���a�\n��\r_��s�1��k�y�t\rSa�{\n�y���o�]���������{�̝;7������ōƍ�������]}bw���6vo���{�=��3f�6o|�P��6�u��%K�,IdH�dH�d�meh˖-i�Ԙ:\"�ʡ����Ӛ��z�����PDB����#��.��!���i�Zx>6���������-J���f��F����U��e�y q%|�צ�c����@����C^}�������s�9\'�3gN��?�9��/~�>��?�����/I�<�P�f�`ō1��=e��?�q���/����yOw�}���~ۡ>� l%vo�5�]��6�9�\r~����SD�Q:t�P\Z�#YH8p݌3�\r�]{���0��o�����n���\r\Z��<�����z饗�=sw��?���c�bŊ�����OocQX��}�y�x�c�=�|����m�m۶�����۷o�.��}�s�y5a��3j�*����\"�?g}\rϩ�!�S�b���o�=�җ����x�������K�\Z-Cա��ݹӿ~�j��i!���������Ђ�Fz�ƍ��󞎔P���P�ԩS���<�����y�7�I�Æ\r�[�Y��}�V�������0M����<������{Ł�^�o|���5k֤]{����횧_�~�o~�$;;;�$8�ϏG/�q�m�����?O.���f_�F=z�H�^�r�-2Ԅ:2$C{�����(C2����tb�YWh�\\����K�������P<�(����b~rv\r�-C�����k\'���Z�����_�:E$� �A^YRRrґ,\"C��f�õ�ٚ����a�\nS�0u�\r���Ӵ�;>V@[���!���k��v�^��n�-}=�<���|�?�O�S��S�N��xR�Yg��~~\\��km�\"2$C2$C2�!���S}��u��n:$���W��t�w�q�\n�Һ\"��J�=��&����T	-H~~��EEE\'\r\Z4�}�/�w>��y�M��0�,^>�c��k�?�s��2�i�T^^��~m�x;�z(.��6v��Ɗ��A��\rF3;(�Ǐ�u?v#Y�lYz��xM�=��m�d��3��O�C��8@ť�^*C2�[��as@�3�%ʐ5\\�Ůп��/�]	��.-C�}����P(8���k6�y<紩�ϯ�yE$� eeew���|���:;�bvT�X����n3fggǳ�G6��f�������s��᷊���K-|���MƎ�vW�+޴�߼9�5kV�=�8��>}z�FU:�A�8�^������[#:�]v�e�$C2t����MD��H����8O�޺��:��͝�cE���x��`���ؕu����C�Χf(\"�3f̛7�t�ۡ!���/��͛7ofMM��q/�߼S�L���s��O�������f����{ϝX�`�n�ŋ.�.:}���5���(((H�~^�Ν[}�eH�d�y3������CqНP���s�$\'CM��ɓ\'�;|����\0=?���#F4���駟N����\n��ݨ��#���l���~zn����?���ặ9���\Z�i�]c���իW:!C2$C2$C-%C�+ �#CM��߆)��f,\"�>��F=7�wމ���:\n�ʄ�-zd����?�y���cCД��xr˪U��Z�\0\0�ϔ)Sf����~<\Zy�}����h��_��W�a{q�Q�L�nTD�����������]F����˟\\�x��YYY�j���\0\082����Fiii�\r�p�X@������ޫ��9���d���|����\n��ֵk�6�g�����c�\r��L���-m\0�ֽ�X[[{C��xqT�;�#�z(��~�ӟV/_���d��zm&m7*\"�X�&M��y��n���͍uD2��я~tluu��!�d)\0�~ӦM��L�UWH�#��G���藍��8_I��[o�2�;:Ӷ\r�CF��),,�z�w>4t�МK.���!����{���K/]�\r�K\0 s�pB�n�#�>���ut<Gr����;�*LN<���>]�tI���±��8^�#N5۶m���@��Uސ�ۍ�H2^ܳ4lذ�ӧO\Z�SG�\Z���O}�����g��5q�ē���N\n\rʹ��\0d�vc��{8^�#>��%K���~��� ���ۍ�Hڄ������(��{�m߾�i���_;x������k߽{��yyyIEEŚ�7����k+,X��bŊ�C��7����W��d\0�6������\n�Q��,8��)^8t|�o7*\"ik�p3cĈ}�-[6t�ҥ�\r��S캐��a��x=�?���L� ,\0\0���XSS34�uۍ�wn7���8���0=�m+ۍ�Hڤɓ\'�n��9\0���dtV\0\0\0�\0\0\0(\"\0\0PD\0\0��\0\0@	\0\0�\"\0\0\0�\0\0\0(\"\0\0PD\0\0��\0\0@	\0\0�\"\0\0\0�\0\0\0(\"���ϟ�][SScA�\0�w(	7U2�!C2$C(\"�+//��M�6Y-��\r���RB��!�!�@�ծ]�eeeD�z���p3_��!dH�dE$�bUVV�[h�w���Zͫx�����ۙ2�!C2$C(\"����^V�����Zͨ����;�~��_(C�2$C2�\"h�***Fo-//�0���\r�X�~��5557�2$C2$C2Dk�c@�5iҤuW^y���_����סC��t���N�����\\p�B�dH�dH�PD��ĉ�\Z9r��k֬�<���p�pk�4���}���伸�=���g�2$C2$C2Dk���;wn����_���|�W�^����㘮]���Y8�)^;+}G����Fb��!C��2$C2$C2�\"h��͛7 ++�p� Lg�)�R9l�����Y��43��!�!�!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z���]�@\'��\0\0\0\0IEND�B`�',NULL),('2802',2,'source',NULL,'{\"resourceId\":\"2801\",\"properties\":{\"process_id\":\"processAtest\",\"name\":\"cccc\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-6BB6A95C-E338-40A4-BC11-4849A221170B\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"开始\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E2C950AE-E244-48D2-9AB8-CF830FFD0486\"}],\"bounds\":{\"lowerRight\":{\"x\":207,\"y\":83},\"upperLeft\":{\"x\":177,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\",\"properties\":{\"overrideid\":\"one\",\"name\":\"一步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户1\",\"assigneeDbId\":\"c567ca3b-7c95-422a-a025-2d93e43a98a5\",\"assigneeId\":\"user1\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B4958380-5E4A-468E-A734-4F6472AEEE26\"}],\"bounds\":{\"lowerRight\":{\"x\":352,\"y\":108},\"upperLeft\":{\"x\":252,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-E2C950AE-E244-48D2-9AB8-CF830FFD0486\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\"}],\"bounds\":{\"lowerRight\":{\"x\":251.15625,\"y\":68},\"upperLeft\":{\"x\":207.609375,\"y\":68}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\"}},{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\",\"properties\":{\"overrideid\":\"two\",\"name\":\"二步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户2\",\"assigneeDbId\":\"f2b7cdf4-a689-4006-8c83-f6a2accd837b\",\"assigneeId\":\"user2\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8BA5CF36-C9F0-4121-93D7-09331666419B\"}],\"bounds\":{\"lowerRight\":{\"x\":497,\"y\":108},\"upperLeft\":{\"x\":397,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-B4958380-5E4A-468E-A734-4F6472AEEE26\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\"}],\"bounds\":{\"lowerRight\":{\"x\":396.15625,\"y\":68},\"upperLeft\":{\"x\":352.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\"}},{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\",\"properties\":{\"overrideid\":\"three\",\"name\":\"三步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户3\",\"assigneeDbId\":\"00651061-a87e-4ac9-9c54-737002f49aaf\",\"assigneeId\":\"user3\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AB8F32B0-3F36-49C5-86D2-037C6253935A\"}],\"bounds\":{\"lowerRight\":{\"x\":642,\"y\":108},\"upperLeft\":{\"x\":542,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-8BA5CF36-C9F0-4121-93D7-09331666419B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\"}],\"bounds\":{\"lowerRight\":{\"x\":541.15625,\"y\":68},\"upperLeft\":{\"x\":497.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\"}},{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\",\"properties\":{\"overrideid\":\"four\",\"name\":\"四步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户4\",\"assigneeDbId\":\"8953750f-92f8-4cf9-9be7-9e3b5444b6fa\",\"assigneeId\":\"user4\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FCA98EC6-2ACD-407E-BF70-506313548327\"}],\"bounds\":{\"lowerRight\":{\"x\":787,\"y\":108},\"upperLeft\":{\"x\":687,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-AB8F32B0-3F36-49C5-86D2-037C6253935A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\"}],\"bounds\":{\"lowerRight\":{\"x\":686.15625,\"y\":68},\"upperLeft\":{\"x\":642.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\"}},{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\",\"properties\":{\"overrideid\":\"five\",\"name\":\"五步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"测试用户5\",\"assigneeDbId\":\"d2965713-bb42-40c1-a689-73e9907f214b\",\"assigneeId\":\"user5\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-41EE32F1-6990-4999-9CA0-42A33B47B49E\"}],\"bounds\":{\"lowerRight\":{\"x\":932,\"y\":108},\"upperLeft\":{\"x\":832,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-FCA98EC6-2ACD-407E-BF70-506313548327\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\"}],\"bounds\":{\"lowerRight\":{\"x\":831.15625,\"y\":68},\"upperLeft\":{\"x\":787.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\"}},{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"结束\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1005,\"y\":82},\"upperLeft\":{\"x\":977,\"y\":54}},\"dockers\":[]},{\"resourceId\":\"sid-41EE32F1-6990-4999-9CA0-42A33B47B49E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\"}],\"bounds\":{\"lowerRight\":{\"x\":976.375,\"y\":68},\"upperLeft\":{\"x\":932.390625,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3001',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0�\0\0\0z���\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0>IDATx���tT��/�$�K)P�R�bՂV�Z�����q���@�WW[��񮪽�Q�C�V�=�Z�Zm�\\8�-E���������	\"A�$3���N�\02	�|>k�5����ɞ���o���O\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0hX�M\0�-�N�VVV���͛�o۶�[���R)�Hw����ҏZ�j5׮]�0��e�!�!�!B��;���w׮]��;v׭[��cǎI�����B��X�����OL�f͚�555om߾}��A���2$C2$C2$C2����/_>��w߽ꤓNJ�w�+�6J�\\�2�s�=\\z��?-CȐɐɐ����&��,<���O?=�ҥ�m3�ߠ|��h�v��ˇ�xܸq�)CȐɐɐ��@N�]+**n��:|��Uk��K�JV��t��O�mx/)i�5).�`��֭[\'\'�pBɪU�.6lس�Ǐ�P��!�!�!�!�� �����9��k����/x<�Z�v��ݙ�S5ɶ��$�_�To��lm۶Mz��***zH��!�!�!�!��Gq��)�s\Z���/I�έ�=x׽7�l\"=z��T\\\\��^x�|B�dH�dH�dH�P|\0rJ�>*�⼿s\Z������t��yu��F��!�!�!�!��筎�G�O�v��9m��Եk��.�d�!�!�!\"��?�n�Z\ZG�����p�E��!dH�dH�d�|���T*���;߿��2�!C2$C2$C���m\0uZ�9a�����\0B��!d8<���N� )n��c��j�t:y�\r�!C�2�`�v]NO�v>����w=�B��!d�����]�?v[͎-62�!C�p����[�&�_�T�}�c�m�hY���G3�!C�2(>\0�l���@�X�m�{�]g��ʤb��Ɇ�$is\\#C�2��hpLky,V����2���H��̬�e�[I��~YR����!dB�����X��7�@[_�F����ـ�2�!C@�(>@���ÕN�؀�2�!C@�8��XmdB��! ��|\0\0\0\0�J�\0\0\0�*�\0\0\0 �\0\0\0��2�$y!�N�.^���7�x��V��r���6o�\\\\]]��۷o��S�Nt��ᕰ�=��~�۶\Z\0\0p8�\r֣���ꂂ��}��-,��R�ա}�0��rQQѤ	&�ȇm��@N�E�\'�|���G���G�~��IYYY�O}*�ԩSRZZ�TWWlٲ�����sɒ%=,X��[n�e�֭[G�����V\0\0\Zc�СW���R�\n\nZ7�JiXN	��.������!C��	?��8q��\\�6��y��}�g?��o7m�T>�I�>}������KK3K�.]�s�9\'���\n-Zt�I�1b�m�ׯ�r�ԩ��\0\0\Z����H:�t�^~�,<ƈ���s���@�	��g�yf�رc�t��\'_��W\Z,:H,T������=eʔ7����/� \0\0�}���),,�m*�:����8��3����\'�z�J�?���}��ɶmے�7&����$�v������:t�M��B�+<���K������z�ɧ?��#z�A�%�{�ns�}�=��o}������\0\0�.<\\QXX8>�J�◟�\\rI�g���;��ҽ{��.�\"�}��d֬YImmm\\�]h��ߡC��N�81���4�9%�x�>}�y?�񏏸�P��ONF�\Z�&�T�;��2\0\0���Ìt:�)<Ă½���l��А�#\"�/�KW\'<棹��P| g�1f͚���o����Ɗ�w�]w�kժկ�N���\r\0\0�+��PTT�ۺ��i����9r�¡�������s[x�s���@N��Z̞=��8�CS�x�W�Q^^^RXX�[\0\0�Wh<V7�C��p�m�e�t8�t�������Gsf��\r�`ƌc�t�q��l����t�ر��/\0\0 ?��4S��?��q��X08��C�X��=��\r�? W���b��%K��S�N�U�VY�#F�PXX����[��xw�ٕ��,B��!dZ&C{�qp��=�b��]q���;#ra���r�[�x��~�aq��9|���m]RR�3��5iҤ������555��N��:�OO��$���\'����(((��snxΪ|��̙3�+V$���w�ٿA�dH�dH��m��ձ�p�u�ߛ���ʐ5h͚5u3�W�F<��2��֭�����q���fhذa=R�ԗ�ދX|ȆK/�4�ӟ�T7\r�}����x�o��C��IYw�Yg�����68\\�����_��k���� �.\\�9<�,7���3�rbIIɜ�c�V��{��_�:4����Ɇ\r�_|1�U��W���&��d��,_�<�<y��	gr�I\'ɐ�w���>���nH�T�2$C\r�իW��|&s}�əg���M��;�$g�qF���K�f\Z�2$C\r��;�ի����׿�5���?��:]�vM�x�	j\ZmC�����ssh�?~��e(|���d\Z�\rҩS����8�9眓�6G�M{�=��Z��oYYY�>g����;����\0&M��H8�;��p}Ns����;>\\\\v��UWWo�?9��t�.3�̙S�����-[�:�n۶-Y�~�������F��L�֭3��l��������~H�W�6m�ٳgg�_|���ԩS�͛7\'?����ӧgn�w`l�������\Z����>J���d֬Y�CͣC,x�]2T^Ô��§��P��Eu������^��\"�ha+W�<.�DќN=��XN���]7�)q����k�]���^�\rݺu�v�υ��|�q���g�9���a���\\��2$C�C2$C2�z�ג�}�s2�2*\r���B�b�����11C���}�	��\"N9��?�=��T��y�7o.�ݒ�Ӯ]����QM�����p{��O����cX���)�砖����v�ڜx�cw���9V���6<�@曥�;w&ӦM�k�x������aݺuɂ�!�!��mݺ5��=�B�d���k��ZD3f�Hڶm�<��3{�?���n(C�&��^���� UwG�� �<~g�haq\'�����e޼y��U���˾�Ł�v65�h�N�u�����k���{cW�Q�F5jݑ#Gf�]|��73?ϙ3\'�袋2]���?\'���/2��.���w<���/��$2�2�?`2$C\r�я~����!���{�W�d�bw�8W<\r�~H�EUUU�ꫯ��E<���_~9����k��V�Z֞#�=��>�]ir�S|��WRR����.h�D�~��M�6���S��~V97,�,�T?��4b���/[���s�=�h|c1��tBR:��<y��\'�/|�{��cǎ�m���=z������TVV��Oe��Ȑ���n�|kؐ}��!jH*�J����k_�ڞ��[o���B�oeH�\Zҳg��{��\\�_�����\Z�Z�j���/�g(n� �o����Q=��ig��:t�k�ƍ�����%4�ׇO��I�F�o����7�:s�r��!C��oG�=����d����/��JJJ���8~��L��aaaa,\"���r��2�����?�yr���ڨs�ΙoQo��vj!2$C\r9�Q�eH�\Z��]��fE�S\"���?�S�l\ZN���������\n�C͓�xZu�H���)���b�UWW/����6HV����Y��\0-,��WVV�j��C��pq����=PN��8�چ���S��LnӦ͋�`�1W��8�q���s!�8 �\\��u�]I�N��2$C2$C2t�e(N�����ub�\Z������w�y�C͓����kCv�����\r2da]���w��3G��P�,T|�֡C���,Yҫ��������J���t�u&O�</���ډ\'�������2���9�Q��---��#�Gcƌ�s=vI[�hQ��#�d�To��,���{��3S�5F��z�Wʐ�e���I8�4jݘ�������Z0;w&���/��c�5$�bŊ��8nC�޽��K��?�{���bo��?�5����V�P:�~)�?8^��8�F��ǯ�%�ha�6m����������8�o3�^�lY�p����XXXxg���/ v�\ns��?�{ڨ����O�2%���Z�*ٰaCr饗&=�PҧO���;e�q�\\q�!:\\����~c�.��� C2���ʜ��u�d�!��P7Pd4w���R_�J�q�-�dz8�P�g���xFhw�*cq,��_���N�k�x��믿��;�f����ѣG�s뭷�>���˶ٳgOO�R\'�}��֝8qb<7�)+�?.((�(--��/=����,�۷oҽ{��]�v9�wʐ�P����E�d�H,[�,6L�N��eH��;���3c����0a�C��I��kkk3=L�\r���s�=������6���\0�`ӦMw�[ЧO��,�~���O|&�h��3�tF{���k׮��!�!:j��..>�udH�쇎��&,�X|����t���?�R���Ch{�.�{��ƌ3������Ϧ��?�zغjժI�:\0\0䟉\'�s�������L������կjC�cO��\\i{(>�36m��?�z���c6,^����_�򂂂ogi�]\0\0��pc�{�˕+Wf��8�D,<<����>���+wU.�=��<��;w~;|�]��I;�\0^��������8q���\0\0��m�t:}s��)�����ȑ#3�L��{?��Oj/^\\��!�nqS.�=�)�Ǐ�PUUu��w�]�T= b���������}8|����\0\0��ɓ���Nv b�;�3J����1�zqƒ;~��8ǝ���0�$9\'|�///�6jԨ�\r<��+�h{��Pn|��f��꫗��w���X[\0\0�3iҤ���g�x�����8�̙33Q�)O��뗜z꩙i�۷o�9�\"***�T�qI�ر#v\n���P��s���@N�U�!C�̛2eʘ��?cĈ�>��6����^xaƸq�z����\n;�/9�\0\08P�#��Sp��bb���� ꟍ07��m�r��p�1����7�n���޽{�0`@��={��ԩS����d���k6nܸi�ҥ��Ν[�lٲ��΢G��߬^�z��%\0�F�=��#��t�!���eL��=ȇ��p1mذa=-Z4x�_?���=�4,ò+,q.�?���;\0\0��j{�R���t����mw�#�A�,��R\\7_���	&��^\0\0\0�=���.\0\0\0��R|\0\0\0\0�J�\0\0\0�*�\0\0\0 �\0\0\0��R|\0\0\0\0�J�\0\0\0�*�\0\0\0 �\0\0\0��R|\0\0\0\0�J�\0\0\0�*�\0\0\0 �\0\0\0��R|\0\0\0\0�J���_X�N�R6�Q ���F��!dH�dH�d��h���?JKK?ܲe�\rqذaÒp�P��!dH�dH�d�|��\0y�U�Vs7m�dCV�^�9\\̑!d�!�!\"(>@����?a\'�+�N�-�b���}��tB��!�!�!���/�p~8о�r�J�-Y���>���<O��!dH�dH�d� �l߾}xEEŶ͛7�-`Æ\rO�_���T*u�!C2$C2$C2$C�\"�\0������]{�����:�����(�x�]�d�Y��K.�+CȐɐɐ��@�\Z7nܻÇm͚5W���p�m.m��٩�������g�2$C2$C2$C2D>��<�����.,,�UQQ��]�v]ѹs�;v��-�f��8ou�>*��S��4Ʈ��\rZ\"CȐɐɐ��@ޙ={v߂��k�ղ���R[��$��zNX���`J2$C2$C2$C2D�g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0r���� �YId\0\0\0\0IEND�B`�',NULL),('602',2,'source',NULL,'{\"resourceId\":\"601\",\"properties\":{\"process_id\":\"processEric\",\"name\":\"测试流程11111\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-E5A6B933-9FD5-4299-9EFF-BE1F91F3A972\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"开始\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\"}],\"bounds\":{\"lowerRight\":{\"x\":201,\"y\":108},\"upperLeft\":{\"x\":171,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\",\"properties\":{\"overrideid\":\"one\",\"name\":\"第一步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\"}],\"bounds\":{\"lowerRight\":{\"x\":346,\"y\":133},\"upperLeft\":{\"x\":246,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\"}],\"bounds\":{\"lowerRight\":{\"x\":245.15625,\"y\":93},\"upperLeft\":{\"x\":201.609375,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\"}},{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\",\"properties\":{\"overrideid\":\"two\",\"name\":\"第二步\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C9475C24-996C-40E7-9603-B06464B146D0\"}],\"bounds\":{\"lowerRight\":{\"x\":491,\"y\":133},\"upperLeft\":{\"x\":391,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\"}],\"bounds\":{\"lowerRight\":{\"x\":390.15625,\"y\":93},\"upperLeft\":{\"x\":346.84375,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\"}},{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"结束\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":564,\"y\":107},\"upperLeft\":{\"x\":536,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-C9475C24-996C-40E7-9603-B06464B146D0\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\"}],\"bounds\":{\"lowerRight\":{\"x\":535.375,\"y\":93},\"upperLeft\":{\"x\":491.390625,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','5201',27),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('2206',NULL,'candidate','user1','2205',NULL),('2406',NULL,'candidate','user1','2405',NULL),('2604',NULL,'candidate','user2','2603',NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1601','processEric.bpmn20.xml','personAdd',NULL,'','2018-01-18 21:09:42.748',NULL),('2002','processDemo.bpmn20.xml','test',NULL,'','2018-01-23 15:59:41.383',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
INSERT INTO `act_re_model` VALUES ('1',6,'工作流6.0','process','shipin','2017-12-12 01:35:34.739','2017-12-13 02:22:59.599',1,'{\"revision\":1,\"description\":\"测试activiti6.0的版本\",\"name\":\"工作流6.0\",\"bpmnXML\":\"/opt/workspace/platform-work/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/artron-core/workflow/process/process.bpmn20.xml\",\"processDefinitionName\":\"processName\",\"bpmnImage\":\"/opt/workspace/platform-work/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/artron-core/workflow/process/process.1.png\",\"processDefinitionId\":\"process\"}',NULL,'2','201',''),('1801',5,'测试流程','processDemo','test','2018-01-23 14:17:18.536','2018-01-23 15:59:42.121',1,'{\"processDefinitionId\":\"processDemo\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processDemo/processDemo.1801.png\",\"name\":\"测试流程\",\"description\":\"\",\"processDefinitionName\":\"流程测试\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processDemo/processDemo.bpmn20.xml\",\"revision\":1}','2002','1802','2001',''),('2801',7,'测试模型111111','processAtest','guji','2018-01-24 16:58:58.416','2018-01-25 16:58:51.063',1,'{\"processDefinitionId\":\"processAtest\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processAtest/processAtest.2801.png\",\"name\":\"测试模型111111\",\"description\":\"111111\",\"processDefinitionName\":\"cccc\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processAtest/processAtest.bpmn20.xml\",\"revision\":1}',NULL,'2802','3001',''),('601',9,'工作流6.0版本流程测试333333','processEric','personAdd','2018-01-18 15:24:16.763','2018-01-18 21:09:43.759',1,'{\"processDefinitionId\":\"processEric\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp4/wtpwebapps/artron-core/workflow/processEric/processEric.601.png\",\"name\":\"工作流6.0版本流程测试333333\",\"description\":\"测试activiti6.0的版本\",\"processDefinitionName\":\"测试流程11111\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp4/wtpwebapps/artron-core/workflow/processEric/processEric.bpmn20.xml\",\"revision\":1}','1601','602','1201','');
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('processDemo:1:2005',1,'http://activiti.org/test','流程测试','processDemo',1,'2002','processDemo.bpmn20.xml','processDemo.processDemo.png',NULL,0,1,1,'',NULL),('processEric:1:1604',1,'http://activiti.org/test','测试流程11111','processEric',1,'1601','processEric.bpmn20.xml','processEric.processEric.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_address`
--

DROP TABLE IF EXISTS `app_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_address` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `CODE` varchar(50) NOT NULL COMMENT '编码',
  `NAME` varchar(100) DEFAULT '' COMMENT '名称',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态',
  `TAB_INDEX` int(11) DEFAULT '1',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_address`
--

LOCK TABLES `app_address` WRITE;
/*!40000 ALTER TABLE `app_address` DISABLE KEYS */;
INSERT INTO `app_address` VALUES ('1','code1','测试1',1,1),('13e2cde3-7b84-4a75-8aa9-cbca3653b332','abc111','Name222222',1,0),('2','2','a',1,1),('4cecf5b7-7f4f-4422-811e-b034adfbadc1','atron','测试添加1111',1,0),('759939f0-c988-4b58-b08f-f0e28745136e','123','abc',1,0),('f01ca999-2f10-4f68-892a-5f878628f88d','abc','Name123',1,0),('f3c542db-e114-473f-9821-ebc8cd9756aa','amb','测试',1,0);
/*!40000 ALTER TABLE `app_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_event`
--

DROP TABLE IF EXISTS `plt_cmn_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_event` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `CODE` varchar(100) NOT NULL COMMENT '编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `EVENT_TYPE` varchar(50) DEFAULT NULL,
  `SYSTEM_ID` varchar(50) DEFAULT NULL COMMENT '系统',
  `CLASS_NAME` varchar(100) DEFAULT NULL COMMENT 'JAVA类名',
  `SPRING_BEAN_ID` varchar(100) DEFAULT NULL COMMENT 'SPRING中ID',
  `METHOD_NAME` varchar(50) DEFAULT NULL COMMENT '方法名',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `VERSION` int(11) DEFAULT '0' COMMENT '版本号',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cmn_event`
--

LOCK TABLES `plt_cmn_event` WRITE;
/*!40000 ALTER TABLE `plt_cmn_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cmn_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_id`
--

DROP TABLE IF EXISTS `plt_cmn_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_id` (
  `DB_ID` varchar(50) NOT NULL,
  `KEY_` varchar(255) NOT NULL COMMENT '生成序列号KEY',
  `VALUE_` varchar(255) DEFAULT NULL COMMENT '当前序列号值',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cmn_id`
--

LOCK TABLES `plt_cmn_id` WRITE;
/*!40000 ALTER TABLE `plt_cmn_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cmn_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_log`
--

DROP TABLE IF EXISTS `plt_cmn_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_log` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `MODEL_NAME` varchar(100) NOT NULL COMMENT '模块名',
  `USER_CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '操作者编码',
  `USER_NAME` varchar(100) NOT NULL COMMENT '操作者名称',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT '操作',
  `BUSINESSKEY` varchar(50) NOT NULL COMMENT '业务主键',
  `OPERATE_TIME` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cmn_log`
--

LOCK TABLES `plt_cmn_log` WRITE;
/*!40000 ALTER TABLE `plt_cmn_log` DISABLE KEYS */;
INSERT INTO `plt_cmn_log` VALUES ('0addd642-e094-4621-8240-ffad441dbaac','net.artron.systemmgr.menu.menu.command.MenuNonAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:36:26'),('12727a24-d5b0-4c59-b79a-e9ff3a73d615','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:44'),('2323b895-a6fe-419a-8922-a87e2c03d61b','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:24:47'),('26b3ebb6-cb5e-42fc-9730-6ac39431e750','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-01 18:04:29'),('288e5654-a278-4f66-bbc4-af312675698f','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-01 18:15:09'),('3300cc37-a0b0-45a9-a47d-103a996f1871','net.artron.organization.user.command.UserAddCommand.executeService','admin','管理员','增加','22604b77-eef9-4ffe-ade5-59b810ce7f9a','2018-02-02 11:50:36'),('3442cdf2-a959-40a8-a77e-af9f82bf0caa','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 15:11:49'),('40e94465-e9c4-4814-bd7b-036b6cac55db','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:20'),('42c6f66a-7f14-4912-900f-4e3a65b3faf3','net.artron.organization.org.command.OrgAddCommand.executeService','admin','管理员','增加','0c1d0420-fdad-4640-a922-f7ef981b30ae','2018-02-05 11:13:51'),('441d5185-9d86-4c89-a63d-26d4942ea5ff','net.artron.organization.user.command.UserAllocateRoleCommand.executeService','admin','管理员','增加','null','2018-02-01 16:50:08'),('50414d89-ee43-4552-8eb3-8d5753efa4d0','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:24:37'),('521655de-745f-4d3c-9361-11ba45c167ec','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:52'),('587b4a0f-3e28-4f48-8b18-e42f4c8976b7','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','增加','null','2018-02-02 11:24:42'),('59f0ca3d-e8a1-4656-ab2f-4e99ad47fe53','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:24:15'),('5c0dbb2e-2f35-4747-b84d-61e9a4e63096','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:37'),('5c55bcbe-64f0-4790-bfec-bb7d0964d416','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-01 18:22:20'),('60b3076a-ee45-4224-9170-40d624ff1b0c','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','增加','null','2018-02-02 11:41:31'),('664e3457-349d-4b8b-b662-d1d7399a4889','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:03:23'),('79c89bb9-c28c-4fff-a8c6-45697e41f413','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:24:55'),('7c20644f-629c-4352-9f47-248124b4e5d3','net.artron.organization.org.command.OrgAddCommand.executeService','admin','管理员','增加','41a0f6c3-8699-4663-883f-825630e6551d','2018-02-05 11:14:25'),('82d07b3d-28b5-4cb5-aa7a-afd46563c2db','net.artron.organization.role.command.RoleDeleteCommand.executeService','admin','管理员','删除','null','2018-02-01 16:40:59'),('97983f6c-afda-4745-a3af-f9f23035c24e','net.artron.organization.role.command.RoleUpdateCommand.executeService','admin','管理员','修改','dc8c1647-269b-4969-94ab-17566fda4550','2018-02-01 16:40:50'),('9bdf72c7-a903-45fb-82fa-0aaae1811abe','net.artron.organization.org.command.OrgAddCommand.executeService','admin','管理员','增加','6c60550d-aaad-4061-8056-b72c277a00ae','2018-02-05 11:15:24'),('a53d1e21-1fbb-4b10-a514-6cc69eaa9319','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','增加','null','2018-02-02 11:25:32'),('a5fe6d3c-7f0a-470a-9262-db2c6aaf2bb1','net.artron.organization.org.command.OrgAddCommand.executeService','admin','管理员','增加','04e6b192-0257-41eb-b32b-2b327d349295','2018-02-05 11:15:02'),('a854bbf3-a874-4216-b8ba-7e6df84f9f6d','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:07:23'),('ad3bb0e3-c1e9-410b-9f15-b94d4e857c31','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:36:36'),('b0fd2a3f-d85f-473e-bc54-fe4fcfe984f0','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 11:35:13'),('b61df1e7-0bc1-4774-aa2c-e83a13f8f892','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:58'),('b6234034-f0ae-4360-993f-9498901769cc','net.artron.organization.user.command.UserNonAllocateRoleCommand.executeService','admin','管理员','增加','null','2018-02-01 16:50:04'),('bdbd47b4-9a85-4c6e-83fb-e87760907685','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:24:28'),('c1649044-8b6e-4c72-9492-faa92962165c','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-02 16:25:01'),('c7fcc7e7-bd41-409e-b661-117cd57fa780','net.artron.organization.user.command.UserNonAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-01 18:22:14'),('d2b33b01-01b6-402c-a2c3-7246d3ed86cd','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','增加','null','2018-02-04 20:38:30'),('ec48ead4-7367-409b-b56c-06d8624a3895','net.artron.systemmgr.menu.menu.command.MenuNonAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:36:33'),('ed0e97d6-5963-40a4-a54d-5850b2e16773','net.artron.organization.group.command.GroupUpdateCommand.executeService','admin','管理员','修改','850cf5ff-da81-441d-b85f-06ca10c423db','2018-02-01 16:03:05'),('efb87374-a122-4eab-8f07-5cdecfdb1364','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:09:45'),('f4b610b0-bf68-4a1f-9e51-f5d4beab1491','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','管理员','增加','null','2018-02-02 10:36:30');
/*!40000 ALTER TABLE `plt_cmn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_variable`
--

DROP TABLE IF EXISTS `plt_cmn_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_variable` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `CODE` varchar(50) DEFAULT '' COMMENT '变量名称',
  `NAME` varchar(200) DEFAULT '' COMMENT '变量中文名称',
  `TYPE` varchar(20) DEFAULT '' COMMENT '变量类型',
  `SCOPE` varchar(50) DEFAULT '' COMMENT '范围',
  `SYSTEM_ID` varchar(50) DEFAULT NULL COMMENT '系统',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变量定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cmn_variable`
--

LOCK TABLES `plt_cmn_variable` WRITE;
/*!40000 ALTER TABLE `plt_cmn_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cmn_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_authority`
--

DROP TABLE IF EXISTS `plt_cor_data_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_authority` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `REF_R_DB_ID` varchar(50) DEFAULT NULL COMMENT '数据表TBL_CORE_DATA_REF_R主键',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT '数据表TBL_WF_DATA_DEF主键',
  `COLUMN_DB_ID` varchar(50) DEFAULT NULL COMMENT '数据表TBL_WF_DATA_COLUMN主键',
  `AUTHED_DB_ID` varchar(50) DEFAULT NULL COMMENT '被授权者主键',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '授权类型（用户、角色或者用户组）',
  `DATA_TYPE` varchar(10) DEFAULT 'COMMON' COMMENT '数据类型，基础数据OR业务数据（COMMON OR BUSINESS）',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用，默认启用',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_authority`
--

LOCK TABLES `plt_cor_data_authority` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_authority` DISABLE KEYS */;
INSERT INTO `plt_cor_data_authority` VALUES ('04b3399c-f0e4-11e6-b194-0fa3073a0d94','8f23c30c-f0d1-11e6-b194-0fa3073a0d94','8524e5cd-1978-48c6-8a5f-ece86280c18a','501fffc8-f0d0-11e6-b194-0fa3073a0d94','749906a4-f0c8-11e6-b194-0fa3073a0d94','role','BUSINESS',1),('33f64dfc-f0e4-11e6-b194-0fa3073a0d94','93c3dcc6-f0d1-11e6-b194-0fa3073a0d94','1d3b63da-e3df-44dc-b225-18cb65c75f08','5963ec7a-f0d0-11e6-b194-0fa3073a0d94','749906a4-f0c8-11e6-b194-0fa3073a0d94','role','BUSINESS',1),('edd00a4a-f10e-11e6-b194-0fa3073a0d94','','8524e5cd-1978-48c6-8a5f-ece86280c18a','501fffc8-f0d0-11e6-b194-0fa3073a0d94','749906a4-f0c8-11e6-b194-0fa3073a0d94','role','COMMON',1);
/*!40000 ALTER TABLE `plt_cor_data_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_authority_value`
--

DROP TABLE IF EXISTS `plt_cor_data_authority_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_authority_value` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `AUTHORITY_DB_ID` varchar(50) NOT NULL COMMENT '权限要素设置表TBL_WF_DATA_AUTH_CONFIG的主键',
  `DATA_VALUE` varchar(200) NOT NULL COMMENT '授权数据的值',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用，默认启用',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_authority_value`
--

LOCK TABLES `plt_cor_data_authority_value` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_authority_value` DISABLE KEYS */;
INSERT INTO `plt_cor_data_authority_value` VALUES ('35429b04-f10f-11e6-b194-0fa3073a0d94','edd00a4a-f10e-11e6-b194-0fa3073a0d94','ec96f7b6-f0ea-11e6-b194-0fa3073a0d94',1),('4ac94d0c-f0eb-11e6-b194-0fa3073a0d94','04b3399c-f0e4-11e6-b194-0fa3073a0d94','e4ae6bd8-f0ea-11e6-b194-0fa3073a0d94',1),('612ca256-f0eb-11e6-b194-0fa3073a0d94','04b3399c-f0e4-11e6-b194-0fa3073a0d94','e6803ff4-f0ea-11e6-b194-0fa3073a0d94',1),('7fbb6162-f0eb-11e6-b194-0fa3073a0d94','33f64dfc-f0e4-11e6-b194-0fa3073a0d94','61088624-f0ea-11e6-b194-0fa3073a0d94',1),('8c599542-f0eb-11e6-b194-0fa3073a0d94','33f64dfc-f0e4-11e6-b194-0fa3073a0d94','62da1c10-f0ea-11e6-b194-0fa3073a0d94',1),('a18214e4-f0eb-11e6-b194-0fa3073a0d94','04b3399c-f0e4-11e6-b194-0fa3073a0d94','ec96f7b6-f0ea-11e6-b194-0fa3073a0d94',1);
/*!40000 ALTER TABLE `plt_cor_data_authority_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_column`
--

DROP TABLE IF EXISTS `plt_cor_data_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_column` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库自增，主键',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT '数据定义表主键',
  `CODE` varchar(100) NOT NULL COMMENT '字段编码',
  `NAME` varchar(200) NOT NULL COMMENT '字段名称',
  `BEAN_FIELD_NAME` varchar(100) NOT NULL COMMENT '字段别名',
  `FIELD_SIZE` int(11) NOT NULL COMMENT '字段长度',
  `FIELD_PRECISION` int(11) DEFAULT '0' COMMENT '字段精度',
  `FIELD_TYPE` varchar(50) DEFAULT '' COMMENT '字段类型',
  `DEFAULT_VALUE` varchar(200) DEFAULT NULL COMMENT '字段的默认值',
  `FIELD_COMMENT` varchar(500) DEFAULT NULL COMMENT '字段注释',
  `PRIMARY_FIELD` int(11) DEFAULT '0' COMMENT '是否是主键，1为主键 ；0为否， 默认为非主键',
  `QUOTE_FIELD` int(11) DEFAULT '0' COMMENT '是否为引用字段，1为是 ；0为否， 默认为否',
  `DISPLAY_FIELD` int(11) DEFAULT '0' COMMENT '是否为显示字段，1为是 ；0为否， 默认为是',
  `TREE_FIELD` int(11) DEFAULT '0' COMMENT '是否树节点，1为是 ；0为否， 默认为否',
  `RESOURCE_TYPE_CODE` varchar(50) DEFAULT NULL COMMENT '资源类型与TBL_WF_RESOURCE_TYPE关联',
  `MARK` varchar(1000) DEFAULT NULL COMMENT '备注说明信息',
  `QUERY_FIELD` int(11) DEFAULT '0' COMMENT '是否是查询条件，1为是 ；0为否， 默认为否',
  `MANDATORY_FIELD` int(11) DEFAULT '0' COMMENT '是否为必须输入字段，1为是 ；0为否， 默认为是',
  `VALID_TYPE` varchar(100) DEFAULT NULL COMMENT '验证类型',
  `MISSING_MESSAGE` varchar(500) DEFAULT NULL COMMENT '提示信息',
  `INVALID_MESSAGE` varchar(500) DEFAULT NULL COMMENT '无效提示信息',
  `MIN_VALUE` varchar(100) DEFAULT NULL COMMENT '最小值',
  `MAX_VALUE` varchar(100) DEFAULT NULL COMMENT '最大值',
  `PRECISION_VALUE` varchar(100) DEFAULT NULL COMMENT '精度',
  `DATA_OPTIONS` varchar(200) DEFAULT NULL COMMENT '自定义验证类型',
  `UNIQUE_FIELD` int(11) DEFAULT '0' COMMENT '是否唯一，1为是 ；0为否， 默认为否',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据详细字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_column`
--

LOCK TABLES `plt_cor_data_column` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_column` DISABLE KEYS */;
INSERT INTO `plt_cor_data_column` VALUES ('370b48c2-f0cf-11e6-b194-0fa3073a0d94','c19c8f10-672a-43ce-a95e-3f58bd71faa9','agency_code','单位','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('3f7263ec-f0cf-11e6-b194-0fa3073a0d94','c19c8f10-672a-43ce-a95e-3f58bd71faa9','kemu_code','科目','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('501fffc8-f0d0-11e6-b194-0fa3073a0d94','8524e5cd-1978-48c6-8a5f-ece86280c18a','DB_ID','主键','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('5963ec7a-f0d0-11e6-b194-0fa3073a0d94','1d3b63da-e3df-44dc-b225-18cb65c75f08','DB_ID','主键','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0);
/*!40000 ALTER TABLE `plt_cor_data_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_def`
--

DROP TABLE IF EXISTS `plt_cor_data_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_def` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `ORG_DB_ID` varchar(50) DEFAULT NULL COMMENT '所属机构',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '业务数据编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '业务数据名称',
  `DATA_TYPE` varchar(50) DEFAULT NULL COMMENT '数据类型(业务数据 OR 基础数据)',
  `AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT '是否是权限控制要素, Y : 是; N : 否',
  `TABLE_NAME` varchar(50) DEFAULT NULL COMMENT '对应的数据库表名称',
  `TABLE_COMMENTS` varchar(100) DEFAULT NULL COMMENT '对应的数据库表注释',
  `CURRENT_YEAR` varchar(10) DEFAULT NULL COMMENT '当前年度',
  `TREE_TABLE` int(11) DEFAULT '0' COMMENT '是否树形结构',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_DEF_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_def`
--

LOCK TABLES `plt_cor_data_def` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_def` DISABLE KEYS */;
INSERT INTO `plt_cor_data_def` VALUES ('1d3b63da-e3df-44dc-b225-18cb65c75f08',NULL,'kemu','科目','common','N',NULL,NULL,'2017',0,1,0,0),('1e8530b3-ee00-4478-b5e7-5fbbd2696bc0',NULL,'guji','古籍','business','N','',NULL,NULL,0,1,0,0),('23018554-c443-4568-ac66-4b4b7253a605',NULL,'test','文物','business','N','',NULL,NULL,0,1,0,0),('24a4e404-e74a-4c11-a5e2-dd8985087af6',NULL,'shipin','视频','business','N','',NULL,NULL,0,1,0,1),('8524e5cd-1978-48c6-8a5f-ece86280c18a',NULL,'agency','单位','common','Y',NULL,NULL,'2017',0,1,0,0),('c19c8f10-672a-43ce-a95e-3f58bd71faa9',NULL,'orgcategory','机构分类','common','N','plt_ogz_category',NULL,'2017',0,1,0,0);
/*!40000 ALTER TABLE `plt_cor_data_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_event_r`
--

DROP TABLE IF EXISTS `plt_cor_data_event_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_event_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT '数据表主键',
  `EVENT_DB_ID` varchar(50) NOT NULL COMMENT '事件表主键',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据与事件关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_event_r`
--

LOCK TABLES `plt_cor_data_event_r` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_event_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cor_data_event_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_ref_r`
--

DROP TABLE IF EXISTS `plt_cor_data_ref_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_ref_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT '数据表TBL_WF_DATA_DEF主键',
  `COLUMN_DB_ID` varchar(50) NOT NULL COMMENT '数据表TBL_WF_DATA_COLUMN主键',
  `REF_DB_ID` varchar(50) NOT NULL COMMENT '引用数据表TBL_WF_DATA_COLUMN主键',
  `REF_COLUMN_DB_ID` varchar(50) NOT NULL COMMENT '引用数据表TBL_WF_DATA_COLUMN主键',
  `DATA_AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT '是否启用数据权限标志。 Y：启用； N：禁用； 默认N',
  `PROCESS_AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT '是否用流程权限标志。 Y：启用； N：禁用； 默认N',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据引用关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_ref_r`
--

LOCK TABLES `plt_cor_data_ref_r` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_ref_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cor_data_ref_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_variable_r`
--

DROP TABLE IF EXISTS `plt_cor_data_variable_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_variable_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT '数据表主键',
  `VAR_DB_ID` varchar(50) NOT NULL COMMENT '变量表主键',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据与变量关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_variable_r`
--

LOCK TABLES `plt_cor_data_variable_r` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_variable_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_cor_data_variable_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_menu`
--

DROP TABLE IF EXISTS `plt_cor_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_menu` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `PARENT_DB_ID` varchar(50) DEFAULT '0' COMMENT '上级节点数据库DB_ID',
  `ORG_DB_ID` varchar(50) DEFAULT NULL COMMENT '所属机构数据库主键',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '资源标识符',
  `NAME` varchar(100) DEFAULT '' COMMENT '资源名称',
  `URL` varchar(500) DEFAULT '' COMMENT '连接地址',
  `ICON` varchar(1000) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `CREATED_DT` datetime DEFAULT NULL,
  `IS_LEAF` int(11) DEFAULT '0' COMMENT '是否叶子节点，1 是 0 否，默认否',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_MENU_ID` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_menu`
--

LOCK TABLES `plt_cor_menu` WRITE;
/*!40000 ALTER TABLE `plt_cor_menu` DISABLE KEYS */;
INSERT INTO `plt_cor_menu` VALUES ('0aabb991-c046-4b96-ac4c-5dcb466c347e','0',NULL,'test_1','测试菜单','',NULL,NULL,'2018-01-15 14:20:55',1,0,1,0),('1','0','0','test1','测试菜单','',NULL,NULL,NULL,0,0,1,0),('1f4fa203-eeb7-4e8c-9801-f56ba5348c8d','a6057f5e-0f2c-4cbf-9d00-8ca244f3c822',NULL,'data','数据定义','/data/toIndex',NULL,NULL,'2018-01-17 11:00:28',1,0,1,7),('2','1','0','one1','子菜单一级一','/open/a',NULL,NULL,NULL,1,0,1,0),('3','1','0','one11','子菜单一级二','',NULL,NULL,NULL,0,0,1,0),('31abffd8-6620-47c3-9836-0a36c0fdf560','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'category','机构类型','/data/common/toIndex?code=orgcategory',NULL,NULL,'2018-01-16 15:45:56',1,0,1,5),('35ef152b-6c81-4210-b732-2d0f850429e6','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'rolemgr','角色管理','/role/toIndex',NULL,NULL,'2018-01-19 09:59:01',1,0,1,12),('3bf4ea0a-bfd0-4f22-940b-62bcf01a7871','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'area','区域管理','/area/toIndex',NULL,NULL,'2018-01-16 14:20:59',1,0,1,4),('4','3','0','one2','子菜单二级一','http://192.168.82.119:8080/artron-core/open/test2',NULL,NULL,NULL,1,0,1,0),('5','0','0','systemmgr','系统管理','',NULL,NULL,NULL,0,0,1,1),('6','5','0','menu','菜单管理','/menu/toIndex',NULL,NULL,NULL,1,0,1,2),('60e01a58-ca78-41a3-a487-2b34d88f5009','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'usergroup','用户组管理','/group/toIndex',NULL,NULL,'2018-02-01 10:58:53',1,0,1,16),('677392f5-7ffd-4648-b217-efa8e5492dc8','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'processInstanceMgr','流程实例管理','/wkflow/processinstence/toIndex',NULL,NULL,'2018-01-23 15:35:04',1,0,1,15),('940274ad-32ae-4b77-90c8-d97b0edd88ba','f690acd5-48c0-41ff-bb1c-785c0e3c2389',NULL,'test_41','测试菜单41','http://image2.artup.com/artup-build/builder/wx/token/callback.do',NULL,NULL,'2018-01-15 13:23:03',1,1,1,0),('9cad12e1-798d-45ac-8c1d-eb8b278509fb','0',NULL,'organization','组织机构管理','',NULL,NULL,'2018-02-01 10:58:53',0,0,1,0),('a6057f5e-0f2c-4cbf-9d00-8ca244f3c822','0',NULL,'dataMgr','数据管理','',NULL,NULL,'2018-01-17 11:00:28',0,0,1,6),('b92ae0c7-d5a0-405f-8e60-70fef6d284ac','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'deployed','已部署流程','/wkflow/deployed/toIndex',NULL,NULL,'2018-01-18 15:22:25',1,0,1,10),('bd38feb5-2626-40e0-a1c5-32dabba85cdd','0',NULL,'workflow','流程管理','',NULL,NULL,'2018-01-23 15:35:04',0,0,1,0),('d132b431-f176-4ae1-9572-8169d03c207f','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'usermgr','用户管理','/user/toIndex',NULL,NULL,'2018-01-19 09:59:27',1,0,1,13),('d6dfc8b2-2d8e-4aef-9803-be866c727351','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'orgmgr','机构管理','/org/toIndex',NULL,NULL,'2018-01-19 09:56:24',1,0,1,11),('ee8ee355-4870-417f-901f-b7e56522797c','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'wfmodel','流程模型管理','/wkflow/model/toIndex',NULL,NULL,'2018-01-17 13:17:23',1,0,1,9);
/*!40000 ALTER TABLE `plt_cor_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_area`
--

DROP TABLE IF EXISTS `plt_ogz_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_area` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `CODE` varchar(100) NOT NULL COMMENT '编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `STATUS` tinyint(4) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `VERSION` int(11) DEFAULT '0' COMMENT '版本号',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_area`
--

LOCK TABLES `plt_ogz_area` WRITE;
/*!40000 ALTER TABLE `plt_ogz_area` DISABLE KEYS */;
INSERT INTO `plt_ogz_area` VALUES ('1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','NorthChina','华北地区',1,0,0),('54f42757-4057-451a-af79-5336d60074c1','EastChina','华东地区',1,0,0),('b44f9c1a-faeb-444f-a5b5-c1e615f33d7f','NorthEast','东北地区',1,0,0);
/*!40000 ALTER TABLE `plt_ogz_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_category`
--

DROP TABLE IF EXISTS `plt_ogz_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_category` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `CODE` varchar(50) NOT NULL COMMENT '唯一标识',
  `NAME` varchar(100) DEFAULT '' COMMENT '名称',
  `MASTER` tinyint(11) DEFAULT '0' COMMENT '是否主体; 1 : 主; 0 : 从',
  `MARK` varchar(500) DEFAULT '' COMMENT '备注',
  `CREATED_DT` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_CATEGORY_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_category`
--

LOCK TABLES `plt_ogz_category` WRITE;
/*!40000 ALTER TABLE `plt_ogz_category` DISABLE KEYS */;
INSERT INTO `plt_ogz_category` VALUES ('1','mesum','博物馆',0,'',NULL,0,1,0);
/*!40000 ALTER TABLE `plt_ogz_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_group`
--

DROP TABLE IF EXISTS `plt_ogz_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_group` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `NAME` varchar(100) DEFAULT '' COMMENT '中文名称',
  `DESCRIPTION` varchar(500) DEFAULT '' COMMENT '描述',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_GROUP_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_group`
--

LOCK TABLES `plt_ogz_group` WRITE;
/*!40000 ALTER TABLE `plt_ogz_group` DISABLE KEYS */;
INSERT INTO `plt_ogz_group` VALUES ('850cf5ff-da81-441d-b85f-06ca10c423db','group1','测试组1','测试用户组','2018-02-01 16:03:05',0,1,0);
/*!40000 ALTER TABLE `plt_ogz_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_menu_group_r`
--

DROP TABLE IF EXISTS `plt_ogz_menu_group_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_menu_group_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `MENU_DB_ID` varchar(50) NOT NULL COMMENT '功能菜单',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT '用户组',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用，默认启用',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDINX_MENU_GROUP_R` (`MENU_DB_ID`,`GROUP_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单与用户组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_menu_group_r`
--

LOCK TABLES `plt_ogz_menu_group_r` WRITE;
/*!40000 ALTER TABLE `plt_ogz_menu_group_r` DISABLE KEYS */;
INSERT INTO `plt_ogz_menu_group_r` VALUES ('32946cc0-1561-4ae0-9c4c-c0286b98bf0c','0aabb991-c046-4b96-ac4c-5dcb466c347e','850cf5ff-da81-441d-b85f-06ca10c423db',1),('7fea05be-ef31-40d8-80dd-7fcbcc5129ac','1f4fa203-eeb7-4e8c-9801-f56ba5348c8d','850cf5ff-da81-441d-b85f-06ca10c423db',1),('d71677ed-13ad-407f-a950-644b24c014fb','a6057f5e-0f2c-4cbf-9d00-8ca244f3c822','850cf5ff-da81-441d-b85f-06ca10c423db',1),('e3391262-b46d-4e43-bafe-575e61267912','ee8ee355-4870-417f-901f-b7e56522797c','850cf5ff-da81-441d-b85f-06ca10c423db',1),('f3195747-e675-4456-9c75-cc91a5b729c6','bd38feb5-2626-40e0-a1c5-32dabba85cdd','850cf5ff-da81-441d-b85f-06ca10c423db',1);
/*!40000 ALTER TABLE `plt_ogz_menu_group_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_menu_role_r`
--

DROP TABLE IF EXISTS `plt_ogz_menu_role_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_menu_role_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `MENU_DB_ID` varchar(50) NOT NULL COMMENT '功能菜单',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT '角色',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用，默认启用',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDINX_MENU_ROLE_R` (`MENU_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与功能菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_menu_role_r`
--

LOCK TABLES `plt_ogz_menu_role_r` WRITE;
/*!40000 ALTER TABLE `plt_ogz_menu_role_r` DISABLE KEYS */;
INSERT INTO `plt_ogz_menu_role_r` VALUES ('1','5','3',1),('2','6','3',1),('258a2539-71ec-4436-8412-c8686aa7a872','a6057f5e-0f2c-4cbf-9d00-8ca244f3c822','3',1),('45db356f-2fc8-4f54-b855-54b13708c22c','35ef152b-6c81-4210-b732-2d0f850429e6','3',1),('6152136e-9094-4e52-8a12-50a07bda65b5','31abffd8-6620-47c3-9836-0a36c0fdf560','3',1),('6dadcd37-3f41-4fbd-ab89-c40c71be84b3','3bf4ea0a-bfd0-4f22-940b-62bcf01a7871','2',1),('75f0ceec-f476-4900-9962-7465c1d9e2c3','9cad12e1-798d-45ac-8c1d-eb8b278509fb','2',1),('7bd38d8e-2e6c-4257-b438-a1cb4610a005','d132b431-f176-4ae1-9572-8169d03c207f','3',1),('7ea4de82-a830-4539-8a5d-b324ed85084f','60e01a58-ca78-41a3-a487-2b34d88f5009','3',1),('802aed37-2062-427e-b981-e402574db8ec','d6dfc8b2-2d8e-4aef-9803-be866c727351','3',1),('a0baa4a3-53b6-4877-9478-7b30b8716c45','d6dfc8b2-2d8e-4aef-9803-be866c727351','2',1),('a460b342-f2b7-4943-a701-aa1886bab7d6','d132b431-f176-4ae1-9572-8169d03c207f','2',1),('a5a48fc9-a3ec-4664-868e-bc4056c7abbf','1f4fa203-eeb7-4e8c-9801-f56ba5348c8d','3',1),('b3318a31-2d6d-4f88-9037-5de0d1d63888','60e01a58-ca78-41a3-a487-2b34d88f5009','2',1),('d93db481-b38a-404c-989a-36836a0f89c9','31abffd8-6620-47c3-9836-0a36c0fdf560','2',1),('ef3b3b0c-4105-4d64-82e5-eedcf3cc56b9','3bf4ea0a-bfd0-4f22-940b-62bcf01a7871','3',1),('fd3565d6-07d0-420e-8311-559f8b997d7c','9cad12e1-798d-45ac-8c1d-eb8b278509fb','3',1),('fe3fff14-302a-4824-82f9-608e735bd9ff','35ef152b-6c81-4210-b732-2d0f850429e6','2',1);
/*!40000 ALTER TABLE `plt_ogz_menu_role_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_org`
--

DROP TABLE IF EXISTS `plt_ogz_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_org` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `PARENT_DB_ID` varchar(50) NOT NULL COMMENT '上级节点',
  `CATEGORY_DB_ID` varchar(50) DEFAULT NULL COMMENT '机构分类',
  `AREA_DB_ID` varchar(50) DEFAULT NULL COMMENT '区域',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `NAME` varchar(100) DEFAULT '' COMMENT '中文名称',
  `ENNAME` varchar(100) DEFAULT '' COMMENT '英文名称',
  `ORG_CODE` varchar(9) DEFAULT '' COMMENT '机构代码标识',
  `ORG_TYPE` varchar(50) DEFAULT '' COMMENT '机构类型',
  `PRINCIPAL_NAME` varchar(100) DEFAULT '' COMMENT '法人或负责人姓名',
  `PRINCIPAL_ID_TYPE` varchar(10) DEFAULT '' COMMENT '法人或者负责人证件类型',
  `PRINCIPAL_ID_NUM` varchar(50) DEFAULT '' COMMENT '法人或者负责人证件号码',
  `DESCRIPTION` varchar(500) DEFAULT '' COMMENT '描述',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `IS_LEAF` int(11) DEFAULT NULL COMMENT '叶子节点',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_ORG_ID` (`CATEGORY_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_org`
--

LOCK TABLES `plt_ogz_org` WRITE;
/*!40000 ALTER TABLE `plt_ogz_org` DISABLE KEYS */;
INSERT INTO `plt_ogz_org` VALUES ('04e6b192-0257-41eb-b32b-2b327d349295','0','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','啊啊啊','费瓦符文啊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:15:24',0,0,1,0),('0c1d0420-fdad-4640-a922-f7ef981b30ae','0','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','111','发阿尔违法问啊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:14:26',0,0,1,0),('41a0f6c3-8699-4663-883f-825630e6551d','0c1d0420-fdad-4640-a922-f7ef981b30ae','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','发违法未啊','发额娃娃',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:14:25',1,0,1,2),('6c60550d-aaad-4061-8056-b72c277a00ae','04e6b192-0257-41eb-b32b-2b327d349295','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','阿发','啊打算发大水',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:15:24',1,0,1,6),('abf8a6d2-e140-4fc2-8333-8783c82f04ff','0','1','b44f9c1a-faeb-444f-a5b5-c1e615f33d7f','org','一级机构',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-19 11:25:50',1,0,1,1);
/*!40000 ALTER TABLE `plt_ogz_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_role`
--

DROP TABLE IF EXISTS `plt_ogz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_role` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `ORG_DB_ID` varchar(50) DEFAULT '0' COMMENT '机构表数据库DB_ID',
  `CODE` varchar(50) DEFAULT NULL COMMENT '角色编码',
  `NAME` varchar(100) DEFAULT '' COMMENT '名称',
  `MARK` varchar(500) DEFAULT NULL COMMENT '备注说明',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` tinyint(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_ORG_ID` (`ORG_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_role`
--

LOCK TABLES `plt_ogz_role` WRITE;
/*!40000 ALTER TABLE `plt_ogz_role` DISABLE KEYS */;
INSERT INTO `plt_ogz_role` VALUES ('1','-1','user','普通用户',NULL,NULL,0,1,0),('2','-1','admin','管理员',NULL,NULL,0,1,0),('3','0','systemAdministrator','系统管理员',NULL,NULL,0,1,0),('ad30e8f6-0f3c-45d5-b04f-a58a09b98fad','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role4','测试角色4',NULL,'2018-01-25 18:40:00',0,1,3),('b5970414-00b3-49e1-85b7-4c845c76427a','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role1','测试角色1',NULL,'2018-01-25 18:39:27',0,1,0),('c4115e5e-04a4-4021-863b-d75c550682c0','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role2','测试角色2',NULL,'2018-01-25 18:39:38',0,1,1),('c63b8184-c7d1-4d34-90e3-dfc73e4a3721','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role5','测试角色5',NULL,'2018-01-25 18:40:14',0,1,4),('f566973e-2266-4fc0-abd6-853a0e4c3fa0','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role3','测试角色3',NULL,'2018-01-25 18:39:49',0,1,2);
/*!40000 ALTER TABLE `plt_ogz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_role_group_r`
--

DROP TABLE IF EXISTS `plt_ogz_role_group_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_role_group_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT '用户组表数据库自增，主键',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT '角色表数据库自增，主键',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_GROUP_ROLE_R` (`GROUP_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组与角色的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_role_group_r`
--

LOCK TABLES `plt_ogz_role_group_r` WRITE;
/*!40000 ALTER TABLE `plt_ogz_role_group_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_ogz_role_group_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_user`
--

DROP TABLE IF EXISTS `plt_ogz_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_user` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT '用户ID，登陆名',
  `NAME` varchar(100) DEFAULT '' COMMENT '用户名称',
  `DISPLAY_NAME` varchar(100) DEFAULT '' COMMENT '用户显示的名称',
  `USER_PASSWORD` varchar(50) DEFAULT NULL COMMENT '用户登陆密码',
  `ORG_DB_ID` varchar(50) DEFAULT '0' COMMENT 'TBL_CORE_ORG的主键DB_ID',
  `CREATED_DT` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER` (`ORG_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_user`
--

LOCK TABLES `plt_ogz_user` WRITE;
/*!40000 ALTER TABLE `plt_ogz_user` DISABLE KEYS */;
INSERT INTO `plt_ogz_user` VALUES ('00651061-a87e-4ac9-9c54-737002f49aaf','user3','测试用户3',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:16',0,1,0),('1','test','测试用户','','c4ca4238a0b923820dcc509a6f75849b','-1',NULL,0,1,0),('2','admin','管理员','','c4ca4238a0b923820dcc509a6f75849b','-1',NULL,0,1,0),('22604b77-eef9-4ffe-ade5-59b810ce7f9a','111','111',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-02-02 11:50:36',0,1,0),('3','eric','Eric','','c4ca4238a0b923820dcc509a6f75849b','0',NULL,0,1,0),('8953750f-92f8-4cf9-9be7-9e3b5444b6fa','user4','测试用户4',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:28',0,1,1),('c567ca3b-7c95-422a-a025-2d93e43a98a5','user1','测试用户1',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-22 10:56:04',0,1,0),('d2965713-bb42-40c1-a689-73e9907f214b','user5','测试用户5',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:42',0,1,2),('f2b7cdf4-a689-4006-8c83-f6a2accd837b','user2','测试用户2',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-22 11:02:15',0,1,0);
/*!40000 ALTER TABLE `plt_ogz_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_user_ext`
--

DROP TABLE IF EXISTS `plt_ogz_user_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_user_ext` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `CORE_USER_DB_ID` varchar(50) NOT NULL COMMENT '系统用户表主键',
  `OFFICIAL` tinyint(11) DEFAULT '1' COMMENT '是否在编: 1 在编; 0 不在编; 默认 1',
  `CAUID` varchar(200) DEFAULT '' COMMENT 'CA证书唯一标识',
  `EMAIL` varchar(50) DEFAULT '' COMMENT '邮件地址',
  `SEX` varchar(10) DEFAULT '' COMMENT '性别: "男", "女", "未知"',
  `BIRTHDAY` date DEFAULT NULL COMMENT '出生日期',
  `OFFICE_PHONE` varchar(20) DEFAULT '' COMMENT '办公电话',
  `MOBILE_PHONE` varchar(50) DEFAULT '' COMMENT '移动电话',
  `QQ` varchar(50) DEFAULT '' COMMENT 'QQ',
  `WEIXIN` varchar(50) DEFAULT '' COMMENT '微信',
  `IDEN_ID` varchar(50) DEFAULT '' COMMENT '身份证号',
  `CREATED_DT` date DEFAULT NULL,
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_user_ext`
--

LOCK TABLES `plt_ogz_user_ext` WRITE;
/*!40000 ALTER TABLE `plt_ogz_user_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_ogz_user_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_user_group_r`
--

DROP TABLE IF EXISTS `plt_ogz_user_group_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_user_group_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `USER_DB_ID` varchar(50) NOT NULL COMMENT '用户表数据库主键',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT '用户组表数据库主键',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER_GROUP_R` (`USER_DB_ID`,`GROUP_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组与角色的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_user_group_r`
--

LOCK TABLES `plt_ogz_user_group_r` WRITE;
/*!40000 ALTER TABLE `plt_ogz_user_group_r` DISABLE KEYS */;
INSERT INTO `plt_ogz_user_group_r` VALUES ('15651835-7bd7-4c34-8a9c-5bf7613f67e8','2','850cf5ff-da81-441d-b85f-06ca10c423db',1),('b64e7e19-339b-43c5-94fe-dade89bbd93e','00651061-a87e-4ac9-9c54-737002f49aaf','850cf5ff-da81-441d-b85f-06ca10c423db',1);
/*!40000 ALTER TABLE `plt_ogz_user_group_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_user_role_r`
--

DROP TABLE IF EXISTS `plt_ogz_user_role_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_user_role_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT '数据库主键',
  `USER_DB_ID` varchar(50) NOT NULL COMMENT '用户表数据库主键',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT '角色表数据库主键',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态，1 启用 0 禁用 默认为启用',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER_ROLE_R` (`USER_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_user_role_r`
--

LOCK TABLES `plt_ogz_user_role_r` WRITE;
/*!40000 ALTER TABLE `plt_ogz_user_role_r` DISABLE KEYS */;
INSERT INTO `plt_ogz_user_role_r` VALUES ('1','1','1',1),('2','2','2',1),('3','c567ca3b-7c95-422a-a025-2d93e43a98a5','b5970414-00b3-49e1-85b7-4c845c76427a',1),('4','c567ca3b-7c95-422a-a025-2d93e43a98a5','c4115e5e-04a4-4021-863b-d75c550682c0',1),('43d4af8a-cbf6-404c-ac74-09f422648278','f2b7cdf4-a689-4006-8c83-f6a2accd837b','c4115e5e-04a4-4021-863b-d75c550682c0',1),('5','3','3',1),('8c96aca9-0aa7-437f-8e35-2b6180063040','00651061-a87e-4ac9-9c54-737002f49aaf','f566973e-2266-4fc0-abd6-853a0e4c3fa0',1),('92401417-6913-4536-83d9-26630fbc181e','d2965713-bb42-40c1-a689-73e9907f214b','c63b8184-c7d1-4d34-90e3-dfc73e4a3721',1),('d664e25e-bef7-46fd-8581-5c6ed1b4cb8c','8953750f-92f8-4cf9-9be7-9e3b5444b6fa','ad30e8f6-0f3c-45d5-b04f-a58a09b98fad',1);
/*!40000 ALTER TABLE `plt_ogz_user_role_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_wkf_assignees`
--

DROP TABLE IF EXISTS `plt_wkf_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_wkf_assignees` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `NODE_DB_ID` varchar(50) NOT NULL COMMENT '流程节点设置表主键(TBL_CORE_ACTIVITY_NODE的DB_ID)',
  `ASSIGNEE_DB_ID` varchar(50) DEFAULT '' COMMENT '节点参与值DB_ID',
  `ASSIGNEE_ID` varchar(100) DEFAULT '' COMMENT '节点参与值ID',
  `ASSIGNEE_NAME` varchar(200) DEFAULT '' COMMENT '节点参与者名称',
  `ASSIGNEE_TYPE` varchar(10) DEFAULT '' COMMENT '节点参与者类型: USER, ROLE, GROUP',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流流程节点参与者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_wkf_assignees`
--

LOCK TABLES `plt_wkf_assignees` WRITE;
/*!40000 ALTER TABLE `plt_wkf_assignees` DISABLE KEYS */;
INSERT INTO `plt_wkf_assignees` VALUES ('0cfe1e4d-b679-421e-ae39-d0598b3dc322','f9367c6a-0fd0-4e8a-bb32-d307caae716a','f2b7cdf4-a689-4006-8c83-f6a2accd837b','user2','测试用户2','user',NULL,1,0,0),('5cae033c-a2d3-4e14-b0ab-2d441b2765ef','629e1abd-daad-4d89-b083-9e7416f79861','1','user','普通用户','role',NULL,1,0,0),('8ef4ff17-fb9b-4e73-936c-c43018b99ff4','7beafd74-f9d5-4efd-be21-3a4811c92c64','8953750f-92f8-4cf9-9be7-9e3b5444b6fa','user4','测试用户4','user',NULL,1,0,0),('971c3e14-4e0e-41fb-aa51-51499582c26c','acbe4871-35a9-4ced-8e24-4be29d640336','00651061-a87e-4ac9-9c54-737002f49aaf','user3','测试用户3','user',NULL,1,0,0),('d0d6eb98-b232-4ffa-ba2e-d0ba0b17dc30','eea4101f-2fba-436f-b645-3e20031aca09','c567ca3b-7c95-422a-a025-2d93e43a98a5','user1','测试用户1','user',NULL,1,0,0),('f7e1a912-f918-4991-a2c7-0f2eb2d08ab9','1d34004b-10d8-4c31-a516-26ee75ca65b2','d2965713-bb42-40c1-a689-73e9907f214b','user5','测试用户5','user',NULL,1,0,0);
/*!40000 ALTER TABLE `plt_wkf_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_wkf_back`
--

DROP TABLE IF EXISTS `plt_wkf_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_wkf_back` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `PROCESSDEFINITION_ID` varchar(100) NOT NULL COMMENT '流程模型ID',
  `PROCESSINSTANCE_ID` varchar(100) NOT NULL COMMENT '流程实例ID',
  `ACTIVITY_ID_FROM` varchar(100) NOT NULL COMMENT '退回时的流程节点ID',
  `ACTIVITY_NAME_FROM` varchar(200) DEFAULT NULL COMMENT '退回时的流程节点名称',
  `ACTIVITY_ID_TO` varchar(100) NOT NULL COMMENT '退回到的流程节点ID',
  `ACTIVITY_NAME_TO` varchar(200) DEFAULT NULL COMMENT '退回到的流程节点名称',
  `OPERATOR` varchar(100) NOT NULL COMMENT '操作：BACK（退回） CANCEL (撤销) ',
  `IN_USE` char(1) DEFAULT 'Y' COMMENT '是否有效，Y 有效， N 无效',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程回退操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_wkf_back`
--

LOCK TABLES `plt_wkf_back` WRITE;
/*!40000 ALTER TABLE `plt_wkf_back` DISABLE KEYS */;
/*!40000 ALTER TABLE `plt_wkf_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_wkf_node`
--

DROP TABLE IF EXISTS `plt_wkf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_wkf_node` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `PROCESSDEFINITION_KEY` varchar(100) DEFAULT '' COMMENT '流程定义唯一标识符',
  `PROCESSDEFINITION_NAME` varchar(200) DEFAULT '' COMMENT '流程定义名称',
  `ACTIVITY_ID` varchar(100) DEFAULT '' COMMENT '节点ID',
  `ACTIVITY_NAME` varchar(200) DEFAULT '' COMMENT '节点名称',
  `ACTIVITY_TYPE` varchar(50) DEFAULT '' COMMENT '节点类型',
  `FORM_URL` varchar(100) DEFAULT '' COMMENT '业务表单URL',
  `IS_MULTI_TASK` int(11) DEFAULT '0' COMMENT '是否为多实例任务',
  `IS_SEQUENTIAL` int(11) DEFAULT '0' COMMENT '是否顺序执行多实例任务',
  `MUL_INS_COMPLET_CONDITION` varchar(20) DEFAULT '' COMMENT '多实例任务完成条件',
  `TASK_LISTENER` varchar(500) DEFAULT NULL COMMENT '事件监听器,JSON格式',
  `VARIABLE_EXPRESSION` varchar(500) DEFAULT NULL COMMENT '变量表达式，JSON格式',
  `CREATED_DT` datetime DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT '并发版本控制',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '排序码',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流流程节点设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_wkf_node`
--

LOCK TABLES `plt_wkf_node` WRITE;
/*!40000 ALTER TABLE `plt_wkf_node` DISABLE KEYS */;
INSERT INTO `plt_wkf_node` VALUES ('1d34004b-10d8-4c31-a516-26ee75ca65b2','processDemo','流程测试','five','第五步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('37b5fb5c-420d-48b3-b968-f9314dc0ad7a','processEric','测试流程11111','one','第一步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('629e1abd-daad-4d89-b083-9e7416f79861','process','processName','one','第一步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('7beafd74-f9d5-4efd-be21-3a4811c92c64','processDemo','流程测试','four','第四步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('9a404605-43f4-4570-8523-098e999986e0','process','processName','three','第三步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('acbe4871-35a9-4ced-8e24-4be29d640336','processDemo','流程测试','three','第三步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('b3717ef0-1387-45af-aedd-a0e84d8d8224','processEric','测试流程11111','two','第二步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('b47d133c-80da-4008-9deb-d89a936e1eaa','process','processName','four','第四步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('c3992f1c-89d3-4c4c-a44e-9640367ed690','process','processName','two','第二步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('eea4101f-2fba-436f-b645-3e20031aca09','processDemo','流程测试','one','第一步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('f9367c6a-0fd0-4e8a-bb32-d307caae716a','processDemo','流程测试','two','第二步','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `plt_wkf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_core_datasource`
--

DROP TABLE IF EXISTS `tbl_core_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_core_datasource` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `DS_KEY` varchar(100) NOT NULL COMMENT '数据源标识名',
  `DB_TYPE` varchar(50) DEFAULT '' COMMENT '数据库类型',
  `DB_NAME` varchar(50) DEFAULT '' COMMENT '数据库名称',
  `DRIVER_CLASS` varchar(100) DEFAULT '' COMMENT '数据库驱动类',
  `JDBC_URL` varchar(100) DEFAULT '' COMMENT '数据库连接地址',
  `JDBC_USER` varchar(50) DEFAULT '' COMMENT '数据库用户名',
  `JDBC_PASSWORD` varchar(50) DEFAULT '' COMMENT '数据库密码',
  `INIT_POOL_SIZE` int(11) DEFAULT NULL COMMENT '数据库连接池初始值',
  `MIN_POOL_SIZE` int(11) DEFAULT NULL COMMENT '数据库连接池最小值',
  `MAX_POOL_SIZE` int(11) DEFAULT NULL COMMENT '数据库连接池最大值',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态: 1 启用;  0 禁用; 默认 1',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_DSKEY` (`DS_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_core_datasource`
--

LOCK TABLES `tbl_core_datasource` WRITE;
/*!40000 ALTER TABLE `tbl_core_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_core_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_core_message`
--

DROP TABLE IF EXISTS `tbl_core_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_core_message` (
  `DB_ID` varchar(50) NOT NULL COMMENT '主键',
  `TITLE` varchar(200) NOT NULL COMMENT '标题',
  `SENDER` varchar(100) NOT NULL COMMENT '发送者',
  `RECEIVER` varchar(1000) NOT NULL COMMENT '接收者',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `SEND_TIME` datetime DEFAULT NULL COMMENT '发送时间',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `STATUS` int(11) DEFAULT '0' COMMENT '发送状态。1：已发送；0：未发送',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_core_message`
--

LOCK TABLES `tbl_core_message` WRITE;
/*!40000 ALTER TABLE `tbl_core_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_core_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_core_variable_type`
--

DROP TABLE IF EXISTS `tbl_core_variable_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_core_variable_type` (
  `DBID` varchar(50) NOT NULL,
  `CODE` varchar(50) DEFAULT '',
  `NAME` varchar(200) DEFAULT '',
  `CURRENTYEAR` varchar(4) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1',
  `TABINDEX` int(11) DEFAULT '0',
  PRIMARY KEY (`DBID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变量类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_core_variable_type`
--

LOCK TABLES `tbl_core_variable_type` WRITE;
/*!40000 ALTER TABLE `tbl_core_variable_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_core_variable_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-07 17:00:47

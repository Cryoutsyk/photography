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
INSERT INTO `act_ge_bytearray` VALUES ('1201',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0·\0\0\0¸Ñ’)\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0ßIDATxÚíİ	pTÕšÀñ“½c ,BDÁ(a(Z\"‚Z¢—¸/‘QTpa)u(õ2î‚ƒLxdUT6ËP\"… a|$€!1˜l¤{¾ïšN5!A’twÒİÿ_Õ­Û{\'§¿{îwÎ=÷\\c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|XE\0‡ÃaËÌÌ|²¨¨(©´´´GII‰Ín·S0M­Dƒ‚6›í·°°°³ø1b$f\0êuäÈ‘Çsss_?}úôE:u2mÚ´1­[·6ÁÁÁNibR\\\\l$Y1999g*++”••%1\"13\0g9zôèšÃ‡îÚµ«éÜ¹³¶Î)ÊÊÊÒ$¦Ln:tèZbÄ\Z\"„\"\0ü;)“etÏ=MÇÙ¡zö\"]|ñÅa¹¹¹·\'%%í[¼xñ?‰!rÄ€ùıĞSFFÆ³ºC>çùÓÅ9&{ÿj“}`­9yä+SšÄDDÅ˜Ğˆh\n¯‰ÂÃÃM»ví\"Nœ8q[bbâg)))¿CÄBÃ18\0ğC:H[Çé¡§úv¨ÇvhŠOşdìUgŒÃ^iJó™£»šò¢_(@7ˆŠŠ2±±±ö·ˆ!bÄ@5=sNiëx ºäe~m*Ï”œó¸î`OI£\0İ¤K—.íCCC¯Ú´iÓ\rÄ-†@b šNg gÎÕ7¨ì<=\ZÚ÷éĞ¡C¶¬î\"†h13\0Õt)Î >ªŠúßì`^*wŠ‰‰ùYÅC´Bã„R€ÿÑ‰?õÌ.4?ù.•UGbChzÌ\0?¤V2ñg©dÿB‰!ZÄÀ\n‹lWïs¡ô’€HÌ\0xMû®LhxÔ9‡„EšöİR@ †\03\0ŞÒªcOÕ¡G·ùb 1àMUeç<Vyúb 1à-gJr­ÙÙ‹sœó\\ÉoÍÑï>°^C\0‰\0*ÌÚ-;ÔÖ5\rëSZi2vÌ5ùG·óQ¼ŠÓo\0 ½9ÿüÜêÍ¸zY}ı©Ü&æ_o36k\Z%CÄàiô˜@{/.t‡êJ{E2wÎ£\0A$f\0ÜE{/\ZËa¯¤\0A^Â¡L \0Ä\r›A!€|\0=f\0\0\0$f\0\0\0 1\0\0 1\0\0@}ü¿âp8lûöí»ÿûï¿ÿË‰\'údee]TTTZ^^nBCC­[·®hß¾ı/ÑÑÑÛäå<yòO”\Z\04ÄÄÄ.•••w\r–»}dé$K+YÊeÉ–:}<÷MHHÈ²%K–\'1|(![µjÕü3fŒûí·ßB{öìiâããÍe—]f$36›ÍHrtêÔ©ğcÇÅ¦§§ÇîŞ½û/\'N<ZRR2cşüù(E\0ğqãÆİ!«\'ìvû I¼Âëx‰M–Ëå¹Ëe}GUUÕßÇ›&÷.]º4…ÄhÁ¶oßşĞÌ™3ß+,,Œ\r×\\sÍ5FZWçnå’œéÒ±cGsİu×™ûî»/hïŞ½İ–-[ö~rrò³yyy£>şøãŸ)Q\0ğ©£5Ùz_\ZÓ#\Zñöxy_¼|F²$júk}MbŸ%hè\'Ÿ|²qÑ¢ECn¿ıvsë­·Ö™&q²„lØ°!nùòå?<öØcOÑ{\0î—0688ø=»İŞÎù˜ÖÙ½zõ2ıû÷7İ»w7mÛ¶5­[·6¥¥¥¦  Àddd˜;v˜İ»w›ŠŠ\nçÛÊû¾7nÜxì=#1ƒÏ&e[¶lÙ¶yóæë\'Mšd®ºêª&}Şˆ#L\\\\\\ä¬Y³Şzä‘G\",Xğ.¥\0nKÊFJR–\"IYˆ3!ÓÆôğáÃ­£µ]tÑEÖÒ¹sg3`À\0+Iûì³ÏÌ_|aªªªô%­d?ğ¿’œÙ$9ó«Æ4geÂ\'iOÙÊ•+¯é¥—šœ”9uëÖÍLŸ>=R*Y²±\'QÊ\0à–¤L{ÊÖH\"e%ešl½öÚk:ğ¿Î¤¬.Ú“¦¯×÷éØa—FúşV_“˜Áçè˜2i5\r™0aÂoÔJ?oÚ´i­ÂÂÂŞ–=Ò€ÆÓ1e!!!ï9“²=z˜W^yå¬äª!ô}úşŞ½{»&gsı©¾&1ƒOÑ³/7nÜ8WÇ”¹«§¬6í9“^„´ğş‡€&$ÁÁœcÊ´§ìÙgŸµÆ5…â|æ™g\\“;=¬ù‰ĞÖ¬Y³P§¼Ğ1atÛm·E¶iÓ&–Cš\0Ğ8:%†$eÖÛ:¦L“©¦&e®É™5q9ák ¿Ô×$fğÚ[–~N‰æñïKNNn\'­½\'šã•ÿñE­Ôâãã9AÄ|5†jêOèßØÃ—õÑÏ9r¤ë>\"™Äğ\"Ñÿ×_\rÕ).¼áê«¯ˆˆˆÕ1µZÏÜ}÷İ<üõ•Jfõ%—\\’/ß¯gİ\"ßÙÊ—~/=‹J+ã3gÎÔ<VTT¤½‘Î³ªÜjİºuæı÷ß÷•bˆò™êÔ©SABBBJCbHgô—Õ½í<Ón¹å×†úÀÚõµ/¢%Ÿ¡—YªoòXOéİ»wö·ß~;FnÎvi••Ëßğw¹y¯§¿?((H+Á$ùÎ¤àà`­?‘õRIÓ-ZTŞ’¯‰\'šãÇ[cöt<`xx¸5`×ù˜$¦]»vfÊ”)fØ°aú·ß~ÛÈNÃÈÎÂäçç›Í›7[‡8œî¼óN·:q\'bÈ31tôèQ“ššzŞÏ”ÿßtíÚ•j˜(‰£DùÎDùÎ\"I~ÖÊıœ/†ª/³dUÖZoëX<AÏÖÔ	Ã¥v>tV}Mbx^ûR/³äMıû÷o+ü`×\r]¯ •{²TNñr;Í[‹TrmeuŸT÷•———É÷§Êck¥\\Ö¥¥¥U¶¤ß*33Ódgg›]»v™?üĞœ:uÊ<ñÄÖa‡o¾ùF“l#ºõ\\Sèçºî4uRÊ¼¼¼šûèUqbÈ31¤‰[LLÌy?W_C5I´&ƒC÷J•Ëß°\\ıÕµc¨úÚ—–~ıúyôÒÏwIÌ“˜^¢$×V²7]qÅÚtîSÇSãõmI¯o¦Z¤,Èßğ€´ö¥r^/á¢–ÒR=\'œyüñÇİn·{òÉ\'Íå—_n~úië¾ÎâıÕW_™!C†¸í{o¸ák€± †ÜCÚóuÿı÷CŞc“˜±}){íIÛ¨×²Ô’œ­K=êÑ?BcÂE_ß×±»‡¯xàsçÎµ®wé-zÈä¹ç«”Êffíç¤2\Z%-Å\\Yo÷ÀWÿgcß(Ï¡Ñ£G_y×]w5ëï¥=ÒŠ®¹¿aÃóóÏ?[½jÁ‚V…­;Ş†ÒÃMzÅı=´­‡tì‘EêĞ¡ÃY¯3gN£•ºÃÉ“\'MJJŠöğü1DJ	Í¦­qìóçÏ÷èá`íå|øá‡wË—-[éËû:zÌà3¤æÕ¤Lmß¾]»äCëª äq­õæˆ–TNòw]©×–kîªş^S§N­¹¯;Xİ	j²«t;~üxëöÊ•+­Ş‘¡“Kê¸Ÿ~øÁºŸ––fl]ªåË/¿4¯¿şzMeí:V¨¹|ıõ×Öa7bÈ³1ÔPšhCUsr¡§ÇèÕúlÆÇ‘˜ÁgDDD8¤¢òfrÖ¯_¿“+V¬h[WYµ¾²è9à«›¡¥ê<U-¼VE}¸oß¾W4÷ïµsçNk`îÌ™¿İ§Ÿ~j<hõR8EGG[kM´\\O{?×©Rt|ÑªU«Ì7ŞxÖkNŸ>m=¦ßÙ¥K—f-‡›nºÉ\Z/UWo1ä¾j,b¨É1T%‰¡£ºë\ZCvyØJÎjãs7M ]óy3ÀK¤®(((×q$Ş\"I@T0Ú5şJ}¯IHHø^^“æÎ¸cÇ­¯B,ÓÊN¾/Â¹3•ûr³,K$y]¯ãƒzè!Gsÿ^:h[{]œ‡rrrLII‰ùñÇk^kŞyç\\ï}¾ö²éàoíå¨=¯İ«¯¾jôêÍ½CUzXLÏ\Z›<y21äÁjb¨q1$ñ¢ãÙìò}\Z?!Õ½vgÅ4¢÷Ésİõõ:í‰\'3ı|\'IÌ\0/‘–óQi5v÷fb¶oß¾CÚ\"üƒ—yz\0n±ù}<h”,‘Z	V?¶^–ÔÈÈÈÍ²s)hi¿—NağüóÏ›C‡Yƒ©õĞ‘7mÚ4ëy=óí{îiôçşùçVOGTT”u_\00Àú|İ™ëœT>„\"†Zz‘Ï¯’Ø‰té«7†$©ÛãLÌ>ìöÉe]edd¸ŞİCbxIttô–ôôôîıû÷÷ÚwnÛ¶M{\r¶œï5©©©Û¥µúİ¥—^ú¤Ü}ÃF+—Jp…,ŸÙl¶u-}*SjŞ¼yZ†ÖúÀfÿşıÖ\0ëŸ~úÉz¼ÖÙT\r²páÂšÛz(cïŞ½Öä ½zõª³¤%#†šCk×®Õu.èsu0ÿ¨Q£ˆ¡†	wIèÿ0†$‰Û\"¯×9Å¬$WÇğyŠ~¾‹-$f€—¾–™™ù`UUU°—&™-?xğ`œq¹¬H}‚ƒƒu„²Û¯Ó¦‡d•&ŸÿQõ4¾ğ[éYd:mÁSO=efÍšeªÔªU«ë5O­CDz–mc-_¾\\çr²„ëÄ :ø[o½e¼uew#†šC£G¶b¨eÄPhhè\Z©«ÿ[ojÂ«½›˜dVcîÚµKĞÎY&V˜^2cÆŒC“&M:\"ù•:ŞÂÓ6nÜ¸Òn·w“Š;ã^»téÒ“nn¥¾$­Íi‘®hé½\ZuÑ11[·n=ë±¡C‡Z‡‰:wî\\sÖ[SèdÃ}úô±>¯U«V>ßÄ1äO1´dÉ’ããÆK“¤n˜NÒ«=‰‰‰nÿŸ×¯_¯Wp&e[/¤¾&1Ü¨°°pê?„´hC=ÜkVğÑGı›TJsšãÿ”Êe†¿ıvîn-ëï4Ë{ #†ˆ¡CïÊbM\0§‰Ù AƒÜ:ÖìØ±czÖlMo™Ô×óü¡Ü¹ˆ9|ÊÂ…?...> ¹\'Í=[{ËJNœ8±ŒR€†[ºté\ZY¥émí5{ã7¬©3ÜAÇ¾ùæ›URO×ô–ùK}MbŸSXXøï«W¯.ÓùŒ<aß¾}ŸìÚµëvi}=ÚÒ®\0>æAS=…EVV–uº©É™&e’ä9~ùåça“bª¯IÌàstÁ™3g•\r¼477×­Ÿ-ú7³fÍê#ùóÒÚû?J\0šV_;	rÓJšôlZ½z‡†l}ßË/¿\\%\rèšKJJ}=ŞŸêk3ø¤”””%ÅÅÅ^|ñÅbwõœiOÙ/¼pYUUÕ\\ÙÈS(e\0hºÔÔT=Äø¨39Ó3½ÔÖ’%KjO[/}A;eÊ×2=ctª¿Õ×ş‡Ï’úÃ„„„ÒéÓ§Ï3fLÈÈ‘#£\ZyB@Áœ9sÖìÜ¹ó¹=U*‘E”.\0¸$U‹¤¾Ö3;çµÕ1g:¯ÖéIúõëg]^/Á¥W	ĞÃ•šŒéä±zYì§OŸÖÎ$gO™Î§6Áëk3ø|KlìØ±Û—/_¾P6ğ?%\'\'G_{íµ‘øöòM›6­Y¼xq÷ÊÊÊîRYáğ%\0x¶¾–ºöFCÓm÷îİÖò\\ğmÕ1eşZ_“˜ÁZb²ú³lğcfÏ=><<¼w\\\\\\îÀ[ÅÆÆ†·oß¾“^ø¼¬¬,GZ`…û÷ï?¸uëÖƒöJA/„÷nvvv\nıÀ+õõÍZ_Kr•,	Z|rØn¡¿××$fğ§\r^g|^‘˜˜ØeïŞ½cöìÙs£Üï+‹vŸÛdi#K…,:ïÍ—²Œ÷‡ÉÀ—ëk»İ>F4g}İ©º¾Öz[ÏæÔk_êe–VJ}Mb¿£3N›ßg¿~ƒÒ\0\0êk_ÂY™\0\0\0$f\0\0\0 1\0\0 1\0\0\0‰\0\0\0‰\0\0\0HÌ\0\0\0HÌ\0\0\0@b\0\0@b\0\0\03\0\0\03\0\0\0˜\0\0˜\0\0€ÄÀ…mØÁÁ»İNA´\0ò;dÊª’B ÅHÌ\0T³Ùl¿:uŠ‚hòóóÓeµ‡B ÅHÌ\0TÛZXXHA´\0ÙÙÙE²J#†h13\0ÕÊËËÿ&•y…Ãá 0šWF^^Ş5²^I!Ğb$f\0ª\r\Z4h‡ìPÈÊÊ¢0šQzzú&ù²n¾ùæíÄ-†@bÀEYYYRFFFiQQ…Ñòóó×æåå²Ûí‰!j¡áB(À?¥¤¤œ¼÷Ş{wHÅ>:::ÚA¡xq‡šŞ;((è?†¾•B ÆHÌ\0¸X¼xñá¤¤¤ïrrrî\n¾Dv®‘²¦`<\'Cv¦gffÕê°aÃÖCôBÃ°u`Ã†\rqÁÁÁo†„„\\s¼C‡—¶iÓ¦“<Fá4‘Î1¥Óè™s:H[Çé¡§#F¤C †@b ^7nì#­ğ»äf¼,}e±Q*M¦êSi²¬ô÷AÚÄ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0æÿàV`h1z¦Ã\0\0\0\0IEND®B`‚',NULL),('1602',1,'processEric.bpmn20.xml','1601','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions  xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/test\"><process  id=\"processEric\" name=\"æµ‹è¯•æµç¨‹11111\" isExecutable=\"true\"><startEvent  id=\"startNode\" name=\"å¼€å§‹\"></startEvent><userTask  id=\"one\" name=\"ç¬¬ä¸€æ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\" sourceRef=\"startNode\" targetRef=\"one\"></sequenceFlow><userTask  id=\"two\" name=\"ç¬¬äºŒæ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\" sourceRef=\"one\" targetRef=\"two\"></sequenceFlow><endEvent  id=\"endNode\" name=\"ç»“æŸ\"></endEvent><sequenceFlow  id=\"sid-C9475C24-996C-40E7-9603-B06464B146D0\" sourceRef=\"two\" targetRef=\"endNode\"></sequenceFlow></process><bpmndi:BPMNDiagram  id=\"BPMNDiagram_processEric\"><bpmndi:BPMNPlane  bpmnElement=\"processEric\" id=\"BPMNPlane_processEric\"><bpmndi:BPMNShape  bpmnElement=\"startNode\" id=\"BPMNShape_startNode\"><omgdc:Bounds  height=\"30.0\" width=\"30.0\" x=\"171.0\" y=\"78.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"one\" id=\"BPMNShape_one\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"246.0\" y=\"53.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"two\" id=\"BPMNShape_two\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"391.0\" y=\"53.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"endNode\" id=\"BPMNShape_endNode\"><omgdc:Bounds  height=\"28.0\" width=\"28.0\" x=\"536.0\" y=\"79.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNEdge  bpmnElement=\"sid-C9475C24-996C-40E7-9603-B06464B146D0\" id=\"BPMNEdge_sid-C9475C24-996C-40E7-9603-B06464B146D0\"><omgdi:waypoint  x=\"491.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"536.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\" id=\"BPMNEdge_sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\"><omgdi:waypoint  x=\"346.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"391.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\" id=\"BPMNEdge_sid-C1B16C79-863A-402A-B194-B3576329D6EE\"><omgdi:waypoint  x=\"201.0\" y=\"93.0\"></omgdi:waypoint><omgdi:waypoint  x=\"246.0\" y=\"93.0\"></omgdi:waypoint></bpmndi:BPMNEdge></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('1603',1,'processEric.processEric.png','1601','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0>\0\0\0\0\0\0ú;ÑU\0\0\r9IDATxÚíİilÕuºğq‰A\r‰¾0úÎ7j4Fc®o$QsNô¥˜j[”XÄ\r\\ÔŒ¢TÔA¹fŒÛÌ•õŞ\\È% Ü7£BD‘\"XDFEdkóş—ÓŠºåóIPÎ9œ6å{şÏóßÿô\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ²¤”†­]»vı;ï¼“/^œŞ|óMUâjiiIK—.íÌêIRµ˜!€’‰†µlÙ²ÔŞŞvîÜ©†¨6oŞœZ[[;³öˆ©ZË@ÉÄZº†U>+[{ß)CªÖ2P2±kBÃ(ŸŠİ2¤j-C\0%IÍBÓ’!0øÕ¶mLk?øGú¼å¾¼âëxL£Ñ´dH†\0ªªiıºuCZµèŞôÙÿİ¹OÅcñœfcğ‘!¨š¦µşó×÷kX…jû|¾fcğ‘!¨¦õÅ[õØ´â9ÍÆà#C2P5MkÕ›ÓzlZñœfcğ‘!Ğ´”ÁG†d ÒšVœÓSÓŠç4ƒÉ@Õ4­5ËŸè±iÅsšÁG†d jšÖ–\r+Óª7¦î¿‹\"{,Ól>2$C\0UÓ´¢¾ùpÎ~M+Óh4-’!€êjZ;v¤5+ÜEöX<§Ù|dH†\0ª¢iÅUuW/ÿ¯Ïˆç\\y×à#C2PÙM+[ß¸fIúçÂ»{lX…Š×Äk­¹|dH†\0*®il\rİš»¦%C2P5ƒÏ¡¬¡hÍ]ó1øÈTLÓêkÃ*”æcğ‘!¨˜¦¥4-’!\0ƒÒ´dH†\0>ÊàãÿN†\04-eğQ2”ƒ”Òğ•+W¾0gÎœ577wŞrË-iôèÑéª«®JiÂ„	é{îÙıĞC­9sæŸ\r>JÓ’!\Z:\r\r\rÿQWW÷¿Ù2zıÕW_½+û³3–×{kwVßg5?^§ÃA·gîÜ¹_ßÿıiâÄ‰é©§Jï¾ûnÚ°aCúı÷ßSˆ?ÛÛÛÓG}”şùtë­·¦I“&í¾şúëÿÛà£4-’¡ÒÉ†œÙ@³%û3\r:¬ìµ[ëëëŸÔñ¨yÙ€óéÓ§§;ï¼3jöìÙ“Õ§Ÿ~š&Oœšššv9ò?\r>JÓ’!\ZÔgDV›uØé¡~®¦å5ôf+Ï°×^{mëøñãÓüùó{5ğt·páÂ4fÌ˜T-[4-MK†d¨ÜÔÕÕÍ®¯¯/Ş••\Z\Z\ZÒŒ3Ò’%KÒwß}—~ùå—|™üÛo¿å[ì—/_fÍš•F\ZÕ}øé´õ‡šzŞzë­m7ß|sZ½zu\Zß~ûmŠ!jìØ±ÿcğQ’¡zşR¼[+^x!?üàPlİº5}ü»n»¿×©	±¥\'†CıĞªx¿qãÆUüš„¦¥iÉ•Ó–â¡ç¶ÛnË·îôEü»8¬¡xø±å‡ªÇôÄ–™ÚÒóG[~F\ZÃÏeeğQ2ÔwqLOñî­©S§víÎê«Ø\röÀtßíu™îHµîâ\Z~ß}÷åÇô¦t644üjğQ%Cı\Z|¶oééïĞS<ütÛòó³IUš7oŞ7ö]»v¥Á6aÂ„Jİ„ªiiZ2$Ce0ôÌ(>¦§¯»·´Û«ø˜»¼¨Ê­=q8e½>ûì³T©[}4-MK†dh¨Åuz\nCI˜<^zé%[}¨^qEæ8 ¹?§­÷Öu×]×û¨ËiA’ı<4-MK†d¨œ3WZ.Ğ[e¶lÙ2(Ëè8Û«øT÷rZ^C¿Åm(}öÙTJ³fÍÚ—K/£Ná¾¥®®n¬¦¥iÉ•c†öŞ†\"İÌ™3{9]¼Õg¾nIÕˆ{oÅm(JiÅŠq¯˜Me¸À)Ôæ?ZóÒ´4-’¡¡ÌPÜ{«ğ|kkë .§ã\"‡E?Ë&İ’ª7İ¸qcIŸM›6ud¤=e¼ÀéZó*^ğhZš–ÉĞPfhï\rGóÇú æîâ\nÏE?Ãİ’ªwY/Üp´TâûÅ‡©8]k^±é¹œšÖ;ò*~,~¯ı}~üñÇı¾¦%C244*şû@Â~ SÛ‹¿ŸnIÕˆ@…~ŞLoHªœšVœ‰wòÉ\'§9sæäõÁ¤³Î:+]yå•é‰\'ÈkÅŠ}zï?ü0?h2®¸E$¿ød96-’¡ZÌP¡J½œÖ-©\Z×^{mÉ·ølß¾½£B¶øl‹{á\\xá…ÃÊi7ÅÇœ:ê¨tñÅçMå’K.IÙÏ˜†.½ôÒü¹¸9ì¼yóúôş\'œpBjiiéjZ§œrJ:õÔSózıõ×­­×`†{ì±tÜqÇõXñ¼\r~†âjÊ¶ø@?İtÓM%?Æçûï¿ßYæÇøìÓ¬ÊíøŒ¶¶¶üj­qçåhRqöE4¸åo¼‘Î;ï¼üÏ¾¾÷¦õòË/çŠï­iÕ^†âõï¿ÿ~Õ=248rŒ€{ï½wW©ÏêZ´hQ{™Õõk\\µ{³*·¦5cÆŒtöÙgwU4—ÓO?=ÿú¤“NJ]tQ¯ß3\ZİØ±cÓ°aÃÒå—_®¹æšü}ãº!ñx¡ú3TÕ@Ó’!\Z´9«ÀÃ?üU©¯ã3mÚ´ö2»Ï®—sÓzï½÷RsssW~øáùÚz|\r§Ğ´æÎŒ<hÅ.¥K—¦»îº+M<9Mœ81ÿúÈ#ÌŸ¯¯Ó´j\'C½)\ZÜ¹€)S¦\\»»Jyåæúúú]•x%ĞrjZ7Şxc:óÌ3Óøñãó:ì°Ãâ÷Úõ÷XhÅë,Xî¸ãƒÖÂ…÷yïl›}ôÑGç\r2¾¾á†Ò+¯¼b7Ee¨¯ï-C/®Ü\\|Ÿ®Á¼rscc£+7S½&Mš´«T÷êZ´hÑ7•zï—rjZçŸ~:÷Üs»¶ØDÓ\Z9rä>[qâØ­Ş¾ïİwßN<ñÄ´fÍš}šVzÌ1Ç¤/¿üRÓ’!\ZÚ-CîÕı5fÌ˜¿Ş~ûí¥ØêÓ™­Qnwwöş×‹/¾˜yæ™4bÄˆtüñÇçM+Ùˆİ–³gÏÎ«èíA¤?ıôS:í´ÓòƒU]qÅiÊ”)yÃzüñÇ]ƒ¥3g}nÛ¶í ¯“¡Áçîì0@ššš~Ÿ?ş N=q<Q¬=ì8MëÀgÊDc:çœsÒgœ‘¯AÇqqçûXÛJ=öØ>]Œ®ĞÀÖ­[—~úétÁä\r+Ö,]|®634}úô|:X=øàƒ2Tºágka0‰³óêÔö8…=V‚‹·öTêò\Zåƒ4\"6m¯^½zP†•+WnÌ¾GG¶öpY¥şÊ¥i}ıõ×ù.Šç{._PÅcÑ´¾øâ‹¼iÅ1;Ùï»Oï×n9âˆ#º®½kêñı\\u·v3CÒW_}uĞŠ×ÉPé–×ÙPÒQP¦NÚïá\'rCnÑĞÓYÉËk8$kjjÊ`iıúõ?gÔİ•¾É´œï³´jÕª|M»¿ï›¹cí?¢î³$C2T¾êêêf_÷\'¶üôu·Wü»n[zìâ¢¦†Ÿ¿7®s ¶üìİÒ³;û.¬ôßLjZ2$Cå$P-VâØœØ¥geêÙ[q sñ1=QÕ°¼†^¯IdPç«¯¾ÚÙ;}ôÑ5±{+>œÕğ{Ñ´4-’¡r\\^gÕÙ}\0ŠëüÄEckNa7XìÎŠ+2ÇÅ	ã¯¸eQ·«EwVËò\Zz-ö!×××ÿ4~üøO>ù¤WO¶0Y—\rNÛâÀ¸jÚG¬iiZ2$Cåº¼.>Í½õ³czàÿ×&‰hôèÑÍÍÍ;Ş~ûí=mmm{\n76Æ½·ZZZ~˜6mÚæìµ»ãk\rÕv6€¦¥iÉ•ûòºPU.¯¡ßâŠ¡ÙZÅ+{ï³»ÛgOÜË%.k^ÍWøÔ´4-’!Ëk fhZš–É€ÁGiZ2$C\0¥iÉ|”ÁGÉ€¦¥>J†\04-eğQ2 iiZ2¤>\0š–¦%CÊà iiZ2¤>\0š–¦%C2€¦¥iÉ|”¦%C2`ğQš–É€ÁG|üßÉ€¦¥>J†\04-eğQ2 i)ƒ2ø\0hZš–)ƒ€¦¥iÉ2ø\0hZš–É\0š–¦%C2P³/^¬YhZ2$C\0µaÙ²eííí\ZFT[[Ûº¬ií”!Uk(™%K–<ØÚÚÚùÃ?hCÜ°ZZZvgõˆ©ZË@IeÊ¿dk‰Ûb¹\Z²ÚYÉ\rK†d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 &ıNr•·G>Ê\0\0\0\0IEND®B`‚',1),('1802',2,'source',NULL,'{\"resourceId\":\"1801\",\"properties\":{\"process_id\":\"processDemo\",\"name\":\"æµç¨‹æµ‹è¯•\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-25C15E6A-F8FA-4604-BD2F-5B056987C9C8\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"å¼€å§‹\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\"}],\"bounds\":{\"lowerRight\":{\"x\":109,\"y\":86},\"upperLeft\":{\"x\":79,\"y\":56}},\"dockers\":[]},{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\",\"properties\":{\"overrideid\":\"one\",\"name\":\"ç¬¬ä¸€æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·1\",\"assigneeDbId\":\"c567ca3b-7c95-422a-a025-2d93e43a98a5\",\"assigneeId\":\"user1\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\"}],\"bounds\":{\"lowerRight\":{\"x\":254,\"y\":111},\"upperLeft\":{\"x\":154,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\"}],\"bounds\":{\"lowerRight\":{\"x\":153.15625,\"y\":71},\"upperLeft\":{\"x\":109.609375,\"y\":71}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A9EA6CB9-8B83-4A19-8FF3-43C374DC3E6C\"}},{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\",\"properties\":{\"overrideid\":\"two\",\"name\":\"ç¬¬äºŒæ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·2\",\"assigneeDbId\":\"f2b7cdf4-a689-4006-8c83-f6a2accd837b\",\"assigneeId\":\"user2\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\"}],\"bounds\":{\"lowerRight\":{\"x\":399,\"y\":111},\"upperLeft\":{\"x\":299,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\"}],\"bounds\":{\"lowerRight\":{\"x\":298.15625,\"y\":71},\"upperLeft\":{\"x\":254.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-6E44E7FE-C892-4F47-81F2-DDFC82641FD1\"}},{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\",\"properties\":{\"overrideid\":\"three\",\"name\":\"ç¬¬ä¸‰æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·3\",\"assigneeDbId\":\"00651061-a87e-4ac9-9c54-737002f49aaf\",\"assigneeId\":\"user3\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\"}],\"bounds\":{\"lowerRight\":{\"x\":544,\"y\":111},\"upperLeft\":{\"x\":444,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\"}],\"bounds\":{\"lowerRight\":{\"x\":443.15625,\"y\":71},\"upperLeft\":{\"x\":399.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-3461B0B6-903D-4B68-9006-96F6C18A53AA\"}},{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\",\"properties\":{\"overrideid\":\"four\",\"name\":\"ç¬¬å››æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·4\",\"assigneeDbId\":\"8953750f-92f8-4cf9-9be7-9e3b5444b6fa\",\"assigneeId\":\"user4\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\"}],\"bounds\":{\"lowerRight\":{\"x\":689,\"y\":111},\"upperLeft\":{\"x\":589,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\"}],\"bounds\":{\"lowerRight\":{\"x\":588.15625,\"y\":71},\"upperLeft\":{\"x\":544.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-55953126-65F1-4713-99B5-1AD1288A0785\"}},{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\",\"properties\":{\"overrideid\":\"five\",\"name\":\"ç¬¬äº”æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·5\",\"assigneeDbId\":\"d2965713-bb42-40c1-a689-73e9907f214b\",\"assigneeId\":\"user5\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\"}],\"bounds\":{\"lowerRight\":{\"x\":834,\"y\":111},\"upperLeft\":{\"x\":734,\"y\":31}},\"dockers\":[]},{\"resourceId\":\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\"}],\"bounds\":{\"lowerRight\":{\"x\":733.15625,\"y\":71},\"upperLeft\":{\"x\":689.84375,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-50306DFC-0222-43D0-A681-965969235897\"}},{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"ç»“æŸ\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":907,\"y\":85},\"upperLeft\":{\"x\":879,\"y\":57}},\"dockers\":[]},{\"resourceId\":\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\"}],\"bounds\":{\"lowerRight\":{\"x\":878.375,\"y\":71},\"upperLeft\":{\"x\":834.390625,\"y\":71}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-2C8FB573-120D-441D-B3E0-9916651185FA\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2',4,'source',NULL,'{\"resourceId\":\"1\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-1EEB2C11-AAC7-4D00-9B90-3AEEFB903290\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"å¼€å§‹\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34C69F9-5F8A-4373-B702-95EF7D9C3CC8\"}],\"bounds\":{\"lowerRight\":{\"x\":210,\"y\":159},\"upperLeft\":{\"x\":180,\"y\":129}},\"dockers\":[]},{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\",\"properties\":{\"overrideid\":\"one\",\"name\":\"ç¬¬ä¸€æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æ™®é€šç”¨æˆ·\",\"assigneeDbId\":\"1\",\"assigneeId\":\"user\",\"type\":\"role\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D08FF132-6C77-40F9-B83F-89BD8BE61F2C\"}],\"bounds\":{\"lowerRight\":{\"x\":355,\"y\":184},\"upperLeft\":{\"x\":255,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-C34C69F9-5F8A-4373-B702-95EF7D9C3CC8\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\"}],\"bounds\":{\"lowerRight\":{\"x\":254.15625,\"y\":144},\"upperLeft\":{\"x\":210.609375,\"y\":144}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-94C5DF0B-C5B4-4833-BE71-79489CE63ABE\"}},{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\",\"properties\":{\"overrideid\":\"two\",\"name\":\"ç¬¬äºŒæ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-71564709-5258-453A-9270-F358EB49F391\"}],\"bounds\":{\"lowerRight\":{\"x\":500,\"y\":184},\"upperLeft\":{\"x\":400,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-D08FF132-6C77-40F9-B83F-89BD8BE61F2C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\"}],\"bounds\":{\"lowerRight\":{\"x\":399.15625,\"y\":144},\"upperLeft\":{\"x\":355.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-ABFD0EDE-B4C5-4025-8021-F8A6EC1856FF\"}},{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\",\"properties\":{\"overrideid\":\"three\",\"name\":\"ç¬¬ä¸‰æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C782DE7F-74D1-4761-AC69-905EB20382CB\"}],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":184},\"upperLeft\":{\"x\":545,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-71564709-5258-453A-9270-F358EB49F391\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\"}],\"bounds\":{\"lowerRight\":{\"x\":544.15625,\"y\":144},\"upperLeft\":{\"x\":500.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C732F703-49CF-4C9F-A0C8-110EB6982928\"}},{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\",\"properties\":{\"overrideid\":\"four\",\"name\":\"ç¬¬å››æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-080B3F2F-927F-4481-962E-FFD4A0F902EC\"}],\"bounds\":{\"lowerRight\":{\"x\":790,\"y\":184},\"upperLeft\":{\"x\":690,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-C782DE7F-74D1-4761-AC69-905EB20382CB\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\"}],\"bounds\":{\"lowerRight\":{\"x\":689.15625,\"y\":144},\"upperLeft\":{\"x\":645.84375,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-AD866AF9-B008-460F-A9A6-185621E01176\"}},{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"ç»“æŸ\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":863,\"y\":158},\"upperLeft\":{\"x\":835,\"y\":130}},\"dockers\":[]},{\"resourceId\":\"sid-080B3F2F-927F-4481-962E-FFD4A0F902EC\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\"}],\"bounds\":{\"lowerRight\":{\"x\":834.375,\"y\":144},\"upperLeft\":{\"x\":790.390625,\"y\":144}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-8D235F67-22CE-4240-82A4-CE21CD658D03\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('2001',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0½\0\0\0¡\0\0\0!ØÑ\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0ìIDATxÚíİ	|UÕ½/ğ‚P è£*^ûÄZëP‡ÖRE¯ŠuxÚJ(8u¢>µ-ÚÖ¡¶×:T>ïZkí VPäÁe-Öö#¶h)\n¢P}^Ô\0¢!@€o­}	7Ä0æœ’ï÷óÙŸ3dŸ}~gş{¯½V’\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|DM@K©­­-,--½ª¼¼|èúõë_·n]aMM\rÓÔ/uNNmaaá‡íÚµ›»yóæ;ûõë÷Œ!C2$C2$C2$C(z¡½ıöÛß]±bÅ/7nÜ¸_¯^½’.]º$;wNrssmœ&Š?”IøñL–/_¾©ªªêµ\r60`À\"B†dH†dH†dH†PôB–-Y²dê[o½uÁA”xàqOœ’EeeeñGuC¸:øôÓO\\†!’!’!’!Ú’<›€ænàÃrÁG‘ôèÑCßâã}ìcíV¬XqîĞ¡C3æ?e’!’!’!BÑ»ğ”””\\ø¢¢¢ü}cÅòdÙ«%Ë^{<ùàíg’õ«ŞN\n:öLòŠl¼&jß¾}Òµk×‚¥K—3dÈ\'Çû¾!C2$C2$C2$C´N YÄA\Zâ9+±Ïö\Zøwæ?˜T|ğzRS½)©­©JÖ¯|3Y2oTRYş\r˜;vLúôéS“——w!C2$C2$C2$C(z!ƒâ¨„q†xÎJcV–ş-©Ú´î#÷Çÿƒ·gÙ€Ò»wïnùùùŸœ9sæçd’!’!’!BÑ‡á£nïœ•\r;Ø{÷z’9İ»w_..’!dH†dH†dH†dE/dHœw.Ã¿=µÕ›·ÿàZsÕeRÏ=ÿG¸è/CÈÉÉÉmA¾M@sˆ­ÇQóhyás8 \\ô!d’!’!¢-p¤—f\'7Ñú^ò¥ÿ¯Ï!_†!dH†dH†dE/4“vºn÷oùöˆ\"CÈ2„Š^öaİ:9Éoßñ#÷çµët;¸Ÿ\r„!CÈ2(zÙwuêqDÒ±ûáŞß¹ç‘62„!CÈ èeßV½yÃGî«Ú¸Ö†A†!d½ì»6­[‘,™7*©XñÚGş¶îÃÅÉ’H×B†!dPô²OYS6?4ğ#“õ«ŞŞî:ëW—&%sïMV-y>©5G2„!CÈ»Á0İ´ˆ¸§rùş)İs¹+jª7¥ë¯]ñZÒó“¦S«!C2„!CÈ°côÒ\"âÊ]màë‹{@K_¸ßD†!d½ì½âÊ=U[Se\"CÈ2„»D÷fZDß3n³!dB†€¬s¤\0\0\0E/\0\0\0(z\0\0@Ñ\0\0\0Ùe «,«­­-\\¸pá¥/½ôÒ×—.]zLYYÙ~åååù•••I~~~mçÎ7wëÖí½¢¢¢çÃê·^wİu¯Ûj\0\0À2dHïªªªsrrN\r7	K¯°t\nKeX–…údAøÛsyyyÆ÷®¢—&»>úèn»í¶Á~øaşG‘ôïß?ùÄ\'>‘„\"7),,LBá›³víÚöï¼óNŸE‹õ™?ş×‡¾dİºu·ıái+\0\0»bğàÁ†‹+kjjN	EmûFV)Ë!áo‡„Ë«««ÿ}Ğ A³ÂíQãÇ«èe·Ì™3ç·ß~ûï×¬YS‚”}ôÑI^^ŞGS\nß¸ôèÑ#9î¸ã’K.¹$çå—_>xÂ„	÷\r6ìÚ•+WÿÈ#¼a‹\0\0	õF,dï«­­°ï×?<Ç°P_ŞZkEo…Àä?ñÄ3F}Ú¹ç›|éK_j´Øİ‘X ‡%oúôé}\'MšôÊw¾óï9ê\0\04T\\\\<(77÷÷555]ëî‹õÇ§?ıéä¤“NJ;ì°dÿı÷O:wîœ¬_¿>Y½zuRRR’Ì;7™?~²yóæº‡õ{iğàÁW´Æ£¾ŠŞ¼Ï>ûìóO?ıô	×\\sMòÉO~²IÏ7`À€¤oß¾FŒqÏ·¾õ­‚‘#GşÎV\0\0¶¼ç…‚wl(xóêŠİxĞí¬³ÎJ{’6´ß~û¥Ë˜œ|òÉiüä“O&O=õTR]]Wéjšÿ\nßÂPø¶ªƒnFoÎx„wÊ”)\'üô§?mrÁ[çàƒNn¹å–!Ì#Bø†ÚÊ\0\0À–#¼SC‘š¼±½ã;â V¼‰G€ãúñqqÜ¡:á9hmµ‡¢7â9¼O=õÔiW_}õ.‡lWÅç»ñÆ;µk×î7!|}mm\0\0h»â9¼yyy¿¯+x?üğäæ›oŞ¦pİñqññGuTıÂ÷ŞÖT{(z›(Ò<cÆŒ{ã9¼™:ÂÛP<â[\\\\\\››û-\0\0mW¨	FÖÃğ^{íµé9»M»=ÿà?¨_8Ç®Î(zIM:uTœv(ƒ›MçœsN‡.]ºôÑÍ\0\0Ú¦8-Q(xÿ5^çğÆBµ©oıÂ7ö\\­7o¿ÖR{(z› å]´hÑ×â´DíÚµËúë\r6¬knnî•-ño\rÿÆ›â—¬ÿş?C†!d‚–ÉĞÖZ Zµ§]š·\'>ßyçW¿Ş¦èmã.\\xéûï¿Ÿ§jŸùÌgÚô‰ıøëß¾8?øêW¿Ú+Ë/kıcÿøÇW…×£º^³Ó¾ôyÅêbã°iÓ¦­÷•——Ç£èu#ÖeÔ´iÓ’ûî»oŸØ62$C2$C2Ô:3TYY™lØ°a‡K\\G†dh{Z¾|yRVV¶Ã%®#C»—¡^½z­...»;\Z2dHïpqZ¼^7Rs6œ}öÙõèõkX{ì‹ì¥j‚—^zéë±àİİ¹x›â¨£Zöüc`¸zg½=0•á=ü{¸zq¶_?\'\'\'~)‡†×š››¿¬O„Ëñ¡Ÿ5zôèÊ½ùó\Z>|xòî»ï¦çHÇó¯Û·oŸ°_w_øKºvíš\\ıõÉgœ±G¯ñ›ßü&	X\Z¯dÕªUÉÓO?v©óå/9c]P2I†²“¡%K–$\'NÜás†rĞAÉ5š¡˜‡Øñ)U—]vY§Ê“!j,CqÎO}êSéc,XÎİYUU•¼ùæ›É‘G™Şÿê«¯¦—!j,CñrÙ²e[ÿ÷¿ÿ=ùüç?¿ÍsöìÙ3yøá‡eh÷t9\Z^sHxÍòPX>nÿÇ2¾»†uÒÂ#Ö İºuËÊ‹£:wÜqI¨9êîÚ¦öPô¶1K—.=¦ÿşÍúš\'tÒş!€§ÖŞ„	îí°ğeé®Ïj®÷¾tû‡‹KÂ—õ’ÊÊÊ\ráõ\'†ûÛeÚ¬Y³ªö¦Ïª´´4m°çÍ›—<øàƒÉÚµk“+¯¼2í¾ñÜsÏÅIh`Ò¿5E|Şúxœ|åÊ•[ogãHN&ÈPv2ÿ#ÿ#°#q’¡íe([ííi†:tèÌ˜1#½~úé§\'<òHzTï‡?üa2eÊ”ôş†qÊÕÏĞCı÷8ª~øarÁ¤óºj‡2ª(Ú!C‡U†÷0)77÷±†\n¹:µîú‰\'˜Õ7Ÿ¿^Ñ{ª¢·\r+++Û/îkN‡zhÜMvL#º\"-ŠğZ¨í–ËÂ{¸¬W¯^kBcñçğÅ½·ìñÜ2çqòİï~7©©©Iï»êª«’C9$ùş÷¿ŸŞŞ¼ysòÌ3Ï$§vZÆ^÷sŸû\\:ÀÀ>B†2œ¡¸—ûÒK/•!ÒÉÉP«ÈĞ‹/¾˜|ö³Ÿ•¡ì*™Iw¢„Å#À3ÂíQ1C¡>¦^MÕ73QÏ1ûzİ¦èm‚òòòüxø¿9…†¨GøT…/ÀÍ\rÿî¯9à€¦…¿ÍiáMÓ%,ÅáıÇó„Š‹‹ß\\±bE‹^}ûöM»èÔ™>}zòÆo¤{8£‘#G&¯¿şúıG!vÛ‰İãÍØİı®»îJ÷¤Çóe&O¼Íºño{Ú}:>øàƒdşüù‰ÉÉµ­­[·.íb\Zs!C2´«Šï9vi¦NštìØ1yâ‰\'¶>şØcİ:˜’e\\<<0¼Ÿ[Î½¯©ûC¶kÏß]ÑÛ†Åğ6ëkÎ™3\'vmˆŸÛ¿5ü[¸?~IãÕ{Óv\nïë_æÎ›\\tÑE-şyİpÃ\r[o/]º4m”ëÎcŠ\rşW\\‘^]¾âĞ]\'óç¦¼òÊ+éíY³f%§zjÚõç/ùKòË_ş2½?ví©>KKùÛßş–v_’¡ìfhwÅ~’¡Æ2ô“Ÿü$=ºÒ˜xÎÕwÜ!C2´Óv(vKÓÄîÎÚ!ÚUTT$/¼ğÂÖ\\ÄîÍu·c—èË/¿<¹øâ‹e¨yl„8ÛçD7øŒ\n“}œ¢·	\n\n\njCÃ‘Óœ…ï‰\'øÁäÉ“÷_ÆÛ·³Êña‰»ÛËğKÿÛ.¬S7`û\rÇ[Çü¡-ıyÅ:îµºıöÿÚtüã“Å‹o3\0LQQQz‹ØúÃµïHıéªâ90>úhò…/|a›u6nÜ˜Ş_³wïŞ-º¾øÅ/¦çô„†şç2”½í)’¡†ºöÚk·eµ¾†ç„Ë5–¡Øõ¦›nJ¾ò•¯lıÏìk¯½–>¶ş@z2$Ce¨OŸ>É­·Şš^âÚXFÛ;@ CMÎPu(ºk·èªŸ¡špwZø6<o:ÓâÎ‰úûJ½mXh6¯^½º}<o¯¹„ke|å„	nŞŞ:ÅÅÅ/…ufeòüAƒmïº!~ùÂëÔ5îáöêpûé°Œ+((øs<‡åßøFmK^qĞ†¸‡õ›ßüfz;¯»zıóŸÿÜ¦aÿío›äææÆ\Z»õüñ‡ ş÷h6œ·ù¿øErî¹ç¶xuïŞ==:tİu×ÉP3´\'dH†\ZËĞîŒÎ)C2ÔX†âàU±È©+jâè¼?ÿùÏãÔ‹uG³dH†vú[VRR’î$©+xµC™ÍP<}1î£\n¯ó“·åhó6ª¬¬\\şvX\\?N=•Í¢7>=(zÛ°ğ²¤´´ô°æ,zÃÔ›qïÏNVËö	øqgSX:†¥Ã–Æ/Ş÷ç°LìĞ¡ÃÓ¡±[½·}^ñü•ıèGé4\rq0…Ø\'%¹ñÆÓ¿ÇQ¿öµ¯íñóÿéOJ÷jÆs]¢8\0ÀÉ\'Ÿœ>üq‰óÔíCdH†dH†d¨•d(N—úâT2ubo’¡µCñ4‹N8A;”Y›ÂóW‡ìt¨wTw»\nó‚º¢÷­·ŞÚz.u6Äõ,Pô¶aEEEÏ.Z´è°“N:©Ù^óùçŸ{ŸİÑ:\'Nœ~Ü^<à€®\n7ïÎÂÛèTïKG%x²°°pÚŞ>/]œ3õşûïÛ0½Œ]»âÜ„q€…8`C¼¿ÁHu»eÔ¨Q[¯Ç.!/¿ür:{œ±±½{3jz†üñtJ]»Šşù2$CÛd(®~cvéycFâ’¡†¿e±kü¯~õ«ÿ¯»^÷y’¡úŠ÷ÕëÏËƒ`ÅuëÄÁ bÏ¸x_<z»EËĞni_ogÉN3\nägÃúqÎÜtB<g:[âó×ó¬¢·\r[³fÍ¥¥¥—WWWçÆêšAåâÅ‹û†Ë+w¶bnnn¡`h¦ß@ìf.f…çxËğû«÷…Ï*6Êqê˜ï}ï{Éˆ#ÒîË±‘O[™ŠŠt4ÂØXß{ï½{ü\Z“&MŠó»¥BÄ‰ØÏ>ûìä{îI\'ßÉPÓ2úˆ‹ÉĞf(şG3ş\'sWÄ®«±è•!jø[×‰]Uw²µC2Ôh†b1[7\0U4{öìt©/f%>|xzDW†²—¡üüü©¡îˆ{±òãÎ„xT~wNÙU±kó¼yóâ¶º¾ì“÷õº-GéÚ4×\\sÍC†ù—xN@¶Í˜1cÜC=tphH¾ØÜÿÎAƒİ”““S¾”“÷dæÌ™3kO9å”½ê³‹\rEÁğÀÌÈó½ÿşûi#Ÿ¯S§N{unÿú×¿&gyfÉÉµîUUUÅÿ(ïğ9ê¯#C2¤Ú»34xğà™¡`NçzŠƒ®†:$ãï1î´ˆ=Öêöu´Dí‘iô6Ñš5knøàè£ÎÏòÑŞÕ?üğ§Â—ä®–øw†°ßÖÚ>»LïëÙ³gº C2$C2$C{K†vVğ6\\G†dH;´×gèwaI‹ŞØ]<îDÉä¹½ï¼óN]{ëQŞP{Üß\Z¶{®è5Í¨Q£©¨¨x-†.›î¼óÎ)555ë–.]:ÁV\0€¶güøñSÃÅ¬x½ºº:¹ûî»Óé‹2!ƒıë_ÿº:ÔuG¿g·–ÚCÑ›kÖ¬ù_=öØ†8ÇY6,\\¸ğ‰yóæ›““óí,\0\0ì.O¶L#TVV–wİÔÂ7¼¡€®}ï½÷êº®V´¦ÚCÑ›&L(Ù´iÓ·CàÖ¯X±\"£Ï‚÷Üˆ#	¡ûÑøñãÿŸ­\r\0\0m»ö¨­­½:\\MÒ8êöÍ7ßœvMŞñq?ûÙÏª.\\¸õüæP{\\ÑšjEo†Œ;v\\EEÅÕ7İtSE¦øÆ#¼?şñ?Q]]}oİX[\0\0˜8qbìvüíºÂ7ñ½á†’qãÆ¥‰íŠ¸^´êúë¯¯„7,}Ck«=d•A!d¯¿å–[î8p`Şyç×q·Z}×]wM}á…Î×o¡më\0\0uBÁ::Ôqè{srröçøN›6-à*Nuâ‰\'&‡zh:­]çÎÓ.Ì±Ğ-))‰SÅ¥fãÆñ hİŞ8_ğÕ­±öPôfXÜë2hĞ 9“&M\Zwä°aÃŠ=öØ»øğÊ™3gN3fÌaUUU‡…ğ¦K3\0\0°£Ú#Ô\rÔMe‹ßùóç§ËNÔïõ;;ÃÛZkEoÄ~öáâ_C\0ŞyçW´oßş¨¾}û®è×¯_§>}ú´ïÖ­[¯ÂÂÂdÃ†\rËW¯^½æÕW_]<{öì¼Å‹BÚ;<öwË–-kĞ*\0\0`j3cí\n×a¡øí¿uŞì°Œjíµ‡¢7»œ.&2¤÷Ë/¿<pÁ‚_·Kì†P–.aÙ–8Ö_ÂrÅ–Ğ\0\0ìQíQSS30¿uµG¯-µG¬Aâ¨ÏÂòl\\·­ÔŠŞf0nÜ¸wÃÅİ[\0\0\0µG31z3\0\0\0Š^\0\0\0Pô\0\0€¢\0\0\0½\0\0\0 è\0\0\0E/\0\0\0Š^\0\0\0Pô\0\0€¢\0\0\0½\0\0\0 è\0\0\0E/\0\0\0Š^\0\0\0PôÂî-7·¶¦¦Æ†Ø„Ï¡4\\TÉ2„ÉÉ¡è…),,|íÚµ6Ä^`ÕªU‹ÂÅB†!’!’!½!íÚµ›½fÍ\Zb/°lÙ²òp1K†!dH†dH†dE/dHeeåÿ	ËæÚÚZ£e•¬\\¹òèp9E†!dH†dH†dE/dÈ)§œ274ğ¯”••Ù-hÑ¢E3ÃçPvæ™gÎ‘!d’!’!BÑ´aÃ†¡%%%ëËËËmŒ°jÕªÇW®\\y~MMÍpB†dH†dH†dH†h+òlšËØ±c?¸øâ‹ç††æ‚¢¢¢Â‚‚¥øE‹•““ó¿Ï:ë¬Ù2„ÉÉÉ¡è…,3fÌ[C‡}qùòå†g]hì;„K&{JBãşHiiéé±?ãŒ3¦É2$C2$C2$C2D[âÛE‹˜>}zßÜÜÜ_çååÛ³gÏw»wï~@—.]z…ûlœ&ŠóÎÅaøã¨„q†xÎJìÂ3`À€E2„ÉÉÉ¡è…f4cÆŒcrrr.\nWû‡åø°Ú*M\'ZóÎÍ\nË”Ö>HƒÉÉÉÑÖ3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ»ƒş3Fs\0\0\0\0IEND®B`‚',NULL),('2003',1,'processDemo.bpmn20.xml','2002','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions  xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/test\"><process  id=\"processDemo\" name=\"æµç¨‹æµ‹è¯•\" isExecutable=\"true\"><startEvent  id=\"startNode\" name=\"å¼€å§‹\"></startEvent><userTask  id=\"one\" name=\"ç¬¬ä¸€æ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\" sourceRef=\"startNode\" targetRef=\"one\"></sequenceFlow><userTask  id=\"two\" name=\"ç¬¬äºŒæ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\" sourceRef=\"one\" targetRef=\"two\"></sequenceFlow><userTask  id=\"three\" name=\"ç¬¬ä¸‰æ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\" sourceRef=\"two\" targetRef=\"three\"></sequenceFlow><userTask  id=\"four\" name=\"ç¬¬å››æ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\" sourceRef=\"three\" targetRef=\"four\"></sequenceFlow><userTask  id=\"five\" name=\"ç¬¬äº”æ­¥\"><extensionElements><activiti:taskListener event=\"create\" expression=\"${activitiNodeService.assign(task, task.eventName)}\" /></extensionElements></userTask><sequenceFlow  id=\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\" sourceRef=\"four\" targetRef=\"five\"></sequenceFlow><endEvent  id=\"endNode\" name=\"ç»“æŸ\"></endEvent><sequenceFlow  id=\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\" sourceRef=\"five\" targetRef=\"endNode\"></sequenceFlow></process><bpmndi:BPMNDiagram  id=\"BPMNDiagram_processDemo\"><bpmndi:BPMNPlane  bpmnElement=\"processDemo\" id=\"BPMNPlane_processDemo\"><bpmndi:BPMNShape  bpmnElement=\"startNode\" id=\"BPMNShape_startNode\"><omgdc:Bounds  height=\"30.0\" width=\"30.0\" x=\"79.0\" y=\"56.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"one\" id=\"BPMNShape_one\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"154.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"two\" id=\"BPMNShape_two\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"299.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"three\" id=\"BPMNShape_three\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"444.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"four\" id=\"BPMNShape_four\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"589.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"five\" id=\"BPMNShape_five\"><omgdc:Bounds  height=\"80.0\" width=\"100.0\" x=\"734.0\" y=\"31.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNShape  bpmnElement=\"endNode\" id=\"BPMNShape_endNode\"><omgdc:Bounds  height=\"28.0\" width=\"28.0\" x=\"879.0\" y=\"57.0\"></omgdc:Bounds></bpmndi:BPMNShape><bpmndi:BPMNEdge  bpmnElement=\"sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\" id=\"BPMNEdge_sid-BA9F67BF-4EF8-488F-BC74-BD7778E6D17B\"><omgdi:waypoint  x=\"254.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"299.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-0B02859D-E76D-4F27-9799-D34A49B900C7\" id=\"BPMNEdge_sid-0B02859D-E76D-4F27-9799-D34A49B900C7\"><omgdi:waypoint  x=\"689.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"734.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-58E75DAB-AEE8-4892-889B-E75209B61C50\" id=\"BPMNEdge_sid-58E75DAB-AEE8-4892-889B-E75209B61C50\"><omgdi:waypoint  x=\"109.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"154.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-4BF56CEB-6C89-4799-A900-BE82D570734A\" id=\"BPMNEdge_sid-4BF56CEB-6C89-4799-A900-BE82D570734A\"><omgdi:waypoint  x=\"544.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"589.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-D98CE82E-563C-417F-B7C1-66B262A38486\" id=\"BPMNEdge_sid-D98CE82E-563C-417F-B7C1-66B262A38486\"><omgdi:waypoint  x=\"834.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"879.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge><bpmndi:BPMNEdge  bpmnElement=\"sid-A0D0A014-64B6-4671-95E0-3E8789900350\" id=\"BPMNEdge_sid-A0D0A014-64B6-4671-95E0-3E8789900350\"><omgdi:waypoint  x=\"399.0\" y=\"71.0\"></omgdi:waypoint><omgdi:waypoint  x=\"444.0\" y=\"71.0\"></omgdi:waypoint></bpmndi:BPMNEdge></bpmndi:BPMNPlane></bpmndi:BPMNDiagram></definitions>',0),('2004',1,'processDemo.processDemo.png','2002','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0•\0\0\0y\0\0\0©Æ·\0\01IDATxÚíİylTu¿ÇqwQã’èFMLŒ‰»Ñ(ú‡—kôúcŒšJBdeUn,ŠRP.nÑ¸=Ï•Ñ\'‚‘ $ì.(p1*DA¡€EÄÙéïßÉ3ÍP:-”Î0S^ïä“NgSìyÏ÷ô{~¿ß9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`_!´ùñÇWÎ›7/L›6-L:U\nœªªª0sæÌÚ$/sH8Ä!qˆCâ€’\"ĞY³f…ššš°uëVÙOY·n]˜1cFmRPŸápH8Ä!qˆC\0J†xFN-B:uêÔ­	‡8Ä!q@É§x(`Å“8ıƒCÂ!á‡8Ä!(â‡VñRD9Ä!	‡„Cö‡\0äµˆnü}Møñ‹…oªOÇç>E”Câ‡8$²ß5•€¦²Ñüµ¡:,ùø±°è£»$>_Süˆ9Ä!qˆCÂ!û^S	h*sfå7îV@3YõÍ$ÅÏ˜Câ‡8$²ï5•€¦2w¾ıtdÎ\"\Z_Süˆ9Ä!qˆCÂ!û^S	h*sfÉÔ¡9‹h|Mñs æ‡8Ä!	‡ì{M% ©TDQqˆCÂ!á‡8 å‹h¼ºY®\"\Z_Süˆ9Ä!qˆCÂ!û^S	h*sfÙœsÑøšâç@Ì!qˆCÙ÷šJ@S™3ë«‡%ŸÙ}ªGò\\|Mñs æ‡8Ä!	‡ì{M% ©l4Ë¿»[Ï)|Š(‡8Ä!qH8d¿k*MeãÙ²%,›ûòîS=’çâkŠŸ1‡8Ä!qH8dßk*MeƒùkCuX:ç…œkâkqĞ˜Câ‡8$²ÿ5•€¦r—³qk–Mÿ7åáœ4“¸MÜÖY:bqˆCâpˆCšJ@SÙäÙ8géQqˆCâpˆC³ˆîÉÙ¸ÆÎÒ)†Äâ‡8Ä!qˆšJà\0n*›[@3Qˆ9Ä!qˆCâ4•ÀÜTŠ\"Ê!qˆC	‡\0(¢Š(‡8Ä!ápˆC ˆ*¢	‡8Ä!q€\"*ÄÂ!qˆCâh*Ñz!œ°xñâqcÇı½²²²¶OŸ>¡sçÎáÎ;ï:t½zõ\n<òÈö‘#Gş8jÔ¨ÿÖTŠ\"Ê!qˆC	‡šKEEEÛ²²²\'ıÆÊöíÛoK¾ÖÆŞã?Ùdu’Iq;İZ	4“&Løá‰\'ıúõ¯¼òJ˜?~¨®®›7o‘øµ¦¦&,X° ¼ùæ›¡oß¾¡ÿşÛ»wïş¿šJQD9Ä!qˆCÂ!áĞ’4#’fq}ò5d5‘&ÙvCyyùËº·\"$iÿ5|øğ0pàÀ´aÜ±cGØS.\\\r\Zzôè±õöÛoÿ/M¥(¢â‡8Ä!áp¨‘f²]’u{ÚHæÈ­©÷(õÑÉ6|ğÁ†={†I“&íU3YŸ)S¦„.]º„Ö2j©ˆ*¢â‡„CÂ!q¨e)++{¾¼¼<{zk¨¨¨#FŒÓ§O?ÿüsøóÏ?Óşâï¿ÿNgMÎ™3\'Œ3&tìØ±~cYkÔ²\ZÊO?ıtcïŞ½ÃÒ¥KCK°bÅŠÔ®]»¾£©bqˆCâpH4•Y\rå°ì©®±™7n\\º¼nOØ°aCº}üïêM‰}Sw·Ÿˆ#”±¡ÜÓ¸§Ä÷ëÖ­[ÉŸ5PDQqˆCÂ!á‡8Ôr#”Ù\rå€ÒQÉæÿ»¸l/»±4b¹ˆk(ãˆbKP64bÙ±cÇØXşCS)ÄÂ!qˆCÂ!9p›Ê¸†2{Êë!Cê¦¸6—85öÉ\'Ÿ¬?¶d{’#^åõñÇO×Pæ“É“\'×VTTü¥©bá‡8Ä!áĞMåúìÊ}m(³Ëz#–èö\nÄÄ‰—Ç_ş¶mÛB¾éÕ«×ÎRŠVDQqˆCÂ!á‡8´Ï\råˆì5”ÍòÚØTØì5–¦Áh”2Ş‡2Ş6¤,Z´(”êh¥\"ªˆrˆC	‡8Ä¡}#Ş‡2ÓğÅ‹ìäƒñãÇ­,$‹//Î³/·Ù[î¾ûîqu1‰ü{z)¢Š(‡8Ä!ápˆCÊŸCm3ç‰£‰ë×¯ÏK¿¯\n›}»‘bê=Z%cÇııõ×_…dÌ˜1›’;©ˆ>\0áÖ—••uUDQqˆCÂ!á‡8Ôò%Ïÿ;³İ¨Q£òİsdVMïÑ*©¬¬¬?~A›Ê¹sçnOvìÚ\"ü\0d²®¡³,Š¨\"Ê!qH8$â‡šïPòÜÊÌë3fÌÈkÏ1gÎœìËÚƒ?úôéÖ¬YSĞ¦ríÚµ;“»£ˆ?\0ugY²?Š¨\"Ê!qH8$â‡šïPòu[æù–¾@O}ª««³ÿ\r;BşèÜ¹sØ¼ysA›ÊøóâÎ-@İY–8„_LEtË–-i²Ÿ‹¿×–ş9¿şúën?Gå‡8Ä!qˆCâPsÊş¾¥n#ÒØíE²Î/Ï;°Ò]Š©ˆÆ+özê©aìØ±i¾øâ‹pá…†;î¸#¼øâ‹iæÎÛ¬÷şòË/ÓEÓ555ñÃV¬XQ”E”CâPé84{öì0aÂ„œ™9s&‡8”Ó¡8£jôèÑM&nÇ!5äPl4}ôÑ&›.…î9t~y¤S§N©Ü´iÓÎ©ÜXVV6ìê«¯nSLÓ=¾úê«pÄG„ë®».-r×_}Hşá„N7ÜpCúZ—.]ÂÄ‰›õş\'tR¨ªªª+¢gœqF8ë¬³Ò|øá‡ÎÌ€=ûì³á¸ãË™ø:‡8Ô˜C½zõ\n\\pAÎtïŞCÊéĞÂ…Ómºví\Zn¼ñÆt›nİº…c9&Ü|óÍéóñõ¸‡8ÔCÉßñîu9ûì³Ã¹ç»Ës17näPJ×\Z©l…Üwß}_S¹zõê­E¾¦r—âYlkV­Z¦OŸÍxe«øGıÀÃ\'Ÿ|.»ì²ôksß¿~}ûí·ÓïcâÏVD<‡âöŸşyÎÔ÷‚CR‡8Ô’ešÊøxòäÉéõññi§–^è#>nª©ä:”k¯½6<÷ÜsêĞ~pÈšÊVÊc=¶­ĞWıøãkŠôê¯%¢¨_<‹­ˆÆŒ1\"\\tÑEu‰ÅîœsÎIŸrÊ)ášk®Ùë÷Œ…7ímÓ¦M¸é¦›Â]wİ•¾o¼—P|>“}ùCñ\0(¢â‡8Ä¡v(»©üè£Òmr5•âP®:§²Æ)¬Ë—/Ç|:‚¿‰Í‡:T‡\\ıµ•òôÓO_èûT:´¦ÈîSÙà™¸b.¢Ÿ}öY¨¬¬¬Ë!‡’™‹cÌÑ¸V©şÔ†k\\ÓôĞC…Aƒ…~ıú¥;ì°ôõø8“úkŸÑÖíĞŞ„CjÌ¡èEÿşıwËƒ>È!5êPvSùÔSO…[o½5gSÉ!åªCñˆÑ“†rå•WªCrÈ}*[)ƒ¾&Nİ±cGÁšÊòòòmíÛ·oWj¿«b*¢÷Ş{o8ÿüóCÏ=Ó|ğÁñ÷Z÷}üe¦	=ğÀMfÊ”)»¼wòOuÔQiÁï¹çğŞ{ï™îq€9ÔÜ÷æ‡ê;Ô·oßº×²Ó»woq¨Q‡2Me\\®sŞyçÕ­ã>ıôÓÃ°aÃÂ¼yóv›şÊ!5T‡â\\ßxãpé¥—Ö]96NƒÍn*9”_***Úf\Z½äq:‚œ6lØ:tèP×T–bïQrôïßÛ‚\n5õuy²cÿ(ÅßS1Ñ+®¸\"\\rÉ%u#±ˆŞ~ûí»Œ>f_oOóğÃ‡“O>9,[¶l—\"\Z¤}ôÑá»ï¾SD9Ä!qˆCu(ÓTÆfá–[n©»Bgl.¿üòôBOÙM%‡8ÔXŠMal83ß¿ğÂ»5•ÊûˆæúL³7nÜ¸¼ôãÇÏ¥,ÉŞ£äèÒ¥ËÿÜÿı…­¬M›’¼¬©Ü·¼õÖ[áµ×^íÚµ\'xbZDãº‚8•ùùçŸO®{»ˆü·ß~K¯†/¼’yî¶ÛnƒNhSÚÑÖéP¼:t¼\Z^S‰ÛqˆCê‡òáP¦©Œ#ÙWçÌN¦©ä‡šªCmÛ¶MG+s5•Ê?q½eöheK_°\'¾_|ßÌÏ(ÕŞ£$éÑ£ÇæI“&åµ£Œë7ã™‚¦æê+¢\'^…,Ê‹/¾8Ï–Å¹ş‹-JÏ¬ÅåÇ{l³nş›i~úé§ğê«¯†«®º*- ñ,’›ı˜\r><ç\Z”ìÄuNâPCÅ+%Æ?ÆšJÜCjÈ¡LSoM“+Ù#•âP}‡¾şúëğÒK/¥9òÈ#Óõ’™ïãxÎ<óÌôqœ¹Ç¡‚5–2M_¼ŠoKİ^$ÎdˆƒeÙ£”¥Ú{T¢;¶]œ\"°téÒ¼4”‹/^“üŒåååÿ(ÕßQ±Ñ~ø!êÏ²e¦\0Å\"úí·ß¦E4®‘L~ßÍzïx?§C=´î~Lñ½øóŠñf¿Ä…q(´¿ÿşû&·ã‡\ZrèwŞI×%5•¸‡8ÔC±I8üğÃÃÈ‘#s&¾·ã‡\ZrèİwßMïgÙTâmC8T¸Ş#iøvfš¿!C†ìsc=ˆ\'Ã³\ZÊÚRî=J–:¼Ô£GôÃ–dåÊ•$âl/õ¡çbšîQ?K–,É9%ho§Ä3}ñC]¬ÿ¯Äâ‡8Ä!qˆC¥İTFÊÊÊÏ¾¯e±lîTØøßÕ¡4íu?7–ÿìÖ­[mKXşg„r{\"Í”Rÿİs=ã@,qˆCâPé6•‘¤ù{=»Œk!ã4ã¸†zO¯ò\Z/Ê“½†2¦5ô%O<k4—µï¿ÿ~í>\\¼§vôèÑËâ”×(Kkø½(¢Š(‡8Ä!ápˆCjùŞ#Imıæ2ŞÇ2Ş‹6Bf¦ÆÆ)®ÕÕÕaÎœ9éšÚN:íÒLÆ)¯­¥÷hÄyÎååå¿õìÙsg\\Ü¼7$rÿ”4¥ãÂØÖ4YUD9Ä!	‡„CâP~zì[43XCY¼g‰ÍeçÎwVVVn™={öU«VíˆWÄŠlÚ´içêÕ«·VUUı2tèĞuÉ¶ÛãgZÛ•–QE”CâpH8Ä!å·÷hFsÙ*{VIEEEÛöíÛ¿—ì°•I¶×Û‘;’¬M2)eh­¿ETå‡8$qˆCz@UD9$	‡8Ä!\0Š¨\"ê@,qˆCâ¿ÒETˆ…Câ‡8Ä!ÑTšJQD9Ä!qˆCÂ!á\0ETå‡8$qˆC\0QE”CÂ!á‡8Ä!PDÅX8Ä!qˆCM% ©E”Câ‡8$šJÅKå‡8$Ùw ˆ*¢	‡„Câ\0ETåpH8Ä!qˆC\0Qq qˆCâ‡DS	h*Eå‡8Ä!	‡„C\0QE”CâpH8Ä!PDQ	‡„Câ‡8@bá‡8Ä!qH4•€¦RQqˆCâpH4•€¦RñRD9Ä!	‡„CÂ!\0Š¨\"Ê!qH8$â‡\0(¢Š(‡„CÂ!qˆC ˆŠ±pˆCâ‡8$šJ u3mÚ4ÅKå‡8$ÙwĞ<fÍšµ³¦¦F+‚¬Zµê§¤ˆnåpH8Ä!qˆC\0J†éÓ§?5cÆŒÚ_~ùE!ÛÏ´ªªj{’g8$qˆCâ€’\"ùà›:uêÆ8Õ@ö[¶–rå‡8Ä!	‡ä@w\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 èø¢P#ÏM|\0\0\0\0IEND®B`‚',1),('201',2,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0‘\0\0\0ê\0\0\0;ßÁ \0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0¾IDATxÚíİtUÕ?ğ“‚P ÈàÇşÅZ+uYè²T£cÅúm¥\r|ôIı«mÕ¶Šµë`eÍXkíC­àPş0<E‹EĞ.q]ARı;TMP	Ècö>C˜y“äæóYë¬û:÷Şpî—}Îïœ}öI\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€–!Ë\"\0êÔÖÖæ•””\\_^^>rëÖ­\'oÙ²%¯¦¦Æ‚9Ü†6+«6//ïƒvíÚ-Ú±cÇ=ƒ~N†!’!’!‘@«ööÛogíÚµ¿Ø¶mÛQ½{÷NºvíštéÒ%ÉÎÎ¶pSÜxÙ¼ys6h’5kÖl¯ªªz½¢¢bä!CŠd’!’!B	´:+W®œõÖ[o]vÜqÇ%}úô‰{-”&TZZ\Z7t*ÂİáçwŞ2„ÉÉÑšäX €Óe§œrJÒ³gO+İ# îÿÈG>ÒníÚµ9rùÄ‰ÿK†!’!’!‘@‹»ıßWºùùùz}Ûæ5Éê×OV¿şD²îíç’­ŞN:tê•ävÈ·ğSûöí“nİºuXµjÕE#FŒxjÒ¤IïË2$C2$C2Dk ƒ8´QqàxŞHìö³·•î;KI6¯{#©©ŞÔÖT%[×¿™¬\\<>©,Ïl:uJúõëW“““s¿!C2$C2$C(\"-\\ˆçìÉú’¿$UÛ·|èù¸^÷ö|°‘ôíÛ·{nnîÇyæ™ÏÈ2$C2$C2„\"h±âĞçqäº½7R±=´qÏ.§G«ÃÍ2„ÉÉ¡ˆZ¬xí¬8ôùŞÔVïØû›k]o«1õêÕëÂM!C2$C2$C´¹´MñâËqd5š_ø	7=eB†dH†h\r‰„6*^4ØÅ—[HCü?¿C®!CÈÉŠH Õj×±Û^_Ëí`¯/2„!C ˆ¨§ûqg%¹í;}èùœv“îÇ¶€!dE$ÀÿêÜó”¤S“÷ø|—^§Z@È2„\"`wÕ;*>ô\\Õ¶M2„!C ˆø_Û·¬MV.Ÿl^ûú‡^ÛòÁŠdåË§ó€!CÈ(\"6®¬tIXéK¶nx{¯ólİX’/z Ù°òÅ¤Öu¶!d‚6Å0¼@*î]ó_J÷Îˆšêíéü›Ö¾ôú?%yéå¡!B†!ÈtD©¸7ö@WºõÅ½¼%/=d\"CÈ2ŠH -‰{cUmM•ˆ!CÈ´º³©şç±!döË‘H\0\0\0‘\0\0\0(\"\0\0PD\0\0Ğ\ZX‡6§¶¶6oùòåW¿òÊ+_]µjÕ€ÒÒÒ£ÊËËs+++“ÜÜÜÚ.]ºìèŞ½û{ùùù/†Ùÿõ–[nyÃR\0h›FŒÑ·ªªêò¬¬¬sÂÃaê¦ÎaªÓê°m¹4¼öBNNÎÔÉ“\'¿«ˆ„+{ì±ß3fø|{Ê)§$É±Ç›„¢1ÉËËKB!™µiÓ¦öï¼óN¿¢¢¢~K–,ùê7Ş¸rË–-c~ÿûß³\0Ú†áÃ‡_n®«©©9;‰í÷0K^˜N¯n/¯®®ş÷aÃ†ÍÇO™2e’\"Z¹…~ı®»îú]YYY‡ğŸ;9ıôÓ“œœœ·¡ŒSÏ=“3Î8#¹êª«²–-[vüÔ©S5jÔÍë×¯¿ôÑGı»%\n\0™Â¶b,¬­­ro/ï+Ÿ1*•_ËÔíFE$-ü\'Î}òÉ\'çM˜0áÜ‹/¾8ùÂ¾°Çâq_bÁ¦œ¹sçöŸ>}ú«ßşö·¿ë¨$\0@æ),,–ı»šššnuÏÅmÇO|âÉ Aƒ’“N:)9úè£“.]º$[·nM6nÜ˜\'‹-J–,Y’ìØ±£îmƒÃû^>|øµ™xTRIFÏ?ÿü‹Ï>ûì§oºé¦äcûØa}Ş!C’şıûw;vìıßüæ7;Œ7î·–2\0@Æ—„rR( sêŠÇx\0â‚.H{©5tÔQG¥SŸ>}’³Î:+-(Ÿzê©dÎœ9Iuuuœ¥sØı¡Ì…dF€0:++œ9sæ§ò“ŸvYçøãOî¼óÎ¡\Z„‘–2\0@Fñä¬Pô¥d,ï¾ûî8¨ÎÈ=‰G(ãüñ}qÌ:á3Î´íFE$)9gÎœso¸á†ş âçİvÛmÛµk÷ëĞ ô·´\0Z¯xdNNÎïê\nÈ“O>9¹ã;v+F|_|ÿi§V¿| “¶‘dœ8\në¼yóˆç@6ÖÈ†âÉÂÂÂÙÙÙÿa‰\0´â‚(;{\\İ9ñäÍ7ßœóx8b7×ïÿûõÑØµõaE$´P³fÍ\Z/ÓÏalJ]tQÇ®]»öÓ­\0 uŠ—ñä?ÅûñÈXønY¿Œ½âê\rê88S¶‘d”x²¨¨è+ñ2íÚµkòï5jT·ìììëšãß\Zş·Ç†¯  À\0YÈ2„!C‡f×v\\DçP»°îMü¼K.¹¤ş¶ê(E$´0Ë—/¿úı÷ßÏ—å8>ùÉO¶ïĞ¡C¿Ø—¾şó¡1ûş—¿üåŞMüõÿ\Z\Z¢Ç?úÑnßGşº0|gçÖô{ÅQÌbƒ½}ûö]Ï•——Ç£¼u£š5ªÙ³g\'>ø`«X62$C2$C2”™ª¬¬L***ö9Åydèà2Ô»wï………“&C#FŒènÎ÷ëFbm\n^xaıƒƒn7¶FöúQ^yå•¯Æò`¯y8N;í´Õıë_‡†»÷Ô=\Z³Êğ7ü{¸{eSVVVl(G†ï™Ğ\'Ãí”PÜÎŸ0aBeKş½n¼ñÆäİwßMÏ1ç¯¶oß>=	½î¹°Q‘tëÖ-¹õÖ[“óÏ?ÿ¾ã×¿şuV,IX¡$6lH}öÙ´{I/~ñ‹Öm¥1ÉPÓdhåÊ•É´iÓöù™áßŸwÜq2$C{ÌPÌÃÃïû´¦k®¹&‰—–’!ÚS†âu?şñ§ï]ºtizıÁªªªäÍ7ßLN=õÔôù×^{-}¿”N!G#ÂwßY\nµ\'ÂãÿÜW†Âr¿<Ì“n4ÆíÇîİ»7ÉGm=ãŒ3’°½X÷ÔnÛŠHhf«V­\ZPPPpD¿sĞ AG‡FáœúÁÔ©S+ÀQ¡+÷ç©¿%4„G‡›«BzUeeeEøşiá¹\'Âr™=şüª–ô[•””$«W¯N/^œ<òÈ#É¦M›’ë®».íòñÂ/ÄIhôÓ×GüÜú+Öxaàõë×ïzÜG\Z\Zƒ5M†âÆ]¯^½öù¹q’¡½e(ß\'íj†:vì˜Ì›7/½Şyç%>úhzäò?øA2sæÌôù†ÊĞAË…kÈĞ•!C•áo˜ıxÃ…\\SwàÀMúÅÏ¯WD£ˆ„¤´´ô¨¸×ïH:ñÄã®À{xéÚ8œs(j?İL+½aº&ü\r×ôîİ»,4àO‡ÆrBKÙ«»óš›Éw¾ó¤¦¦&}îúë¯ON8á„ä{ßû^úxÇÉsÏ=—œ{î¹ö½ŸùÌgÒ“æ[	jäÅ=ùW_}µÉvH†d¨íd(/d&İ)2PÎÇÇ…úr@½í¹&ı#b&êĞÚ·¹‘d”òòòÜØeàH\n+‡¡aª\nÒ\r_Ï×sÌ1³Ãk›yÑt\rSaø{\nãy………o®]»¶Ù¯şıû§İ{êÌ;7ùûßÿîÅÆ—¼ñÆ‡´â]}bw²¸÷6vo¾÷Ş{Ó=½ñœ•3fì6o|íP»Ë6†uëÖ%K–,IdH†dH†d¨mehË–-i·Ô˜:\"âÊ¡áïºó¼Óšºšzû±Áç÷PDB„¼¼¼#ú.Œİ!âÿ¥iøZx>6œñî–´œÂßõ‹-J®¸âŠfÿ½F½ëñªU«Òeİy q%|íµ×¦÷cŸ¸·÷@ÄüÆóC^}õÕôñüùó“sÎ9\'™3gNòç?ÿ9ùÅ/~‘>»Õ?§¤¹üå/I»<ÉPÓfè`Å1’¡=eèÇ?şqòòË/ïñóâyOwß}·ÉĞ~Û¡>ø l%voÕ5›]ƒŒ6õ9¥\r~£¼¤•SD’Q:tèP\Zó¬#YH8pİŒ3\rä]{™åÌ0Åñ¢oä¯ş—˜§n¨¸ö\r\Zó·Î<óÌ›û÷zé¥—Ò=swİõ?‹îüc²bÅŠİ¤ÈÏÏOocQXˆì}©y—xÊc=–|ö³ŸİmmÛ¶¥ÏÅïìÛ·o³.‡Ï}îséy5aåû3jº*’¡†Š\"¯?g}\rÏ©•!ÚS†b××Ûo¿=ùÒ—¾´«Àxıõ×Ó÷ÖØK†\Z-CÕ¡ˆ­İ¹Ó¿~†jÂÓi!Ùğ¼ÓÆ‹ıúû‘Ğ‚„FzÇÆÛÇó”P°¬PåÔ©SïØÛ<………¯„yæ7æIåÃ†\rÛ[£YÄğ}êV¸áñÆğøÙ0M…öÓñ<’¯ıëµÍı{Åâ^äo|ãéã5kÖ¤]{şö·¿íš§_¿~Éo~ó›$;;;î$8¨ÏG/ã€q¯mÃë†şüç?O.¾øâf_éF=zôH^ÜrË-2Ô„:2$C{ÊĞÁŒà(C2´§ÅÁtbáYWhÆ\\ö³ŸÅK•Õ±“¡ÃÌP<Õ(Öëáûb~rv\rİ-C•••ËÃk\'Åùã¥Zš²ˆŒŸ_Ï:E$´ ¡A^YRRrÒ‘,\"CƒÿfÜÃµŸÙšú¤òÍaÊ\nS§0uŒ\råÎçÓ´;>V@[ÚïÏ!ùá˜kˆİvâ^üÛn»-}=<÷•¯|å?ÿOúSºç¶S§NéãxRûYg•~~\\áÇkmµ\"2$C2$C2”!Š—ŠS}ñòuâÑn:$ÛÃçW‡ìt¬wÔq¯\nèÒº\"ò­·ŞJ=öØ&û‡×¸T	-H~~şóEEE\'\r\Z4èˆ}ç‹/¾w>¿¯y¦M›¶0¬,^>æ˜c®ïk‚?£s½†2iÿT^^Şì–~m­xÍ¾‡z(.Ãô6vå‰×ÆŠƒÄAâó\rF3;(ãÇßu?v#Y¶lYzæxM®=íÑmÉdèğ3ôÄO¤Cèˆ8@Å¥—^*C2´[†â¼as@Ÿ3»%Ê5\\—Å®Ğ¿üå/÷]	Õë.-C¥}½ûÍP(8ŸóÇk6¦y<ç´©ÄÏ¯çyE$´ eeew—””|­ºº:;bvT®X±¢¸½n3fggÇ³îG6ö»f„›ùáóÿ°sÈó­á·Š£¸ÅK-|÷»ßMÆ›vW+Ş´åß¼9™5kVÚ=ç8äï˜>}z¼FU:ÈA¼8ó…^˜Üÿıé…[#:¼]vÙeé$C2t¨Š¥ÄMDìª‹H’¡†ë²8OìŞºŸå¬:ÊÍÍ¶cEŸ‹óxÔø`º«¨Ø•uñâÅñ CÖÎ§f(\"¡3fÌ›7İtÓÛ¡!øÇØ/¿©Í›7ofMMÍñ¡q/Şß¼S¦L‰ıßs¯ÛO²²²Šóòòf´ô½´{ÏX°`ÁnÏÅ‹.Ç.:}úôÙ5êÜá(((H~^çÎ[}¾eH†d¨y3Ÿ“ÉĞá´CqĞP¼ìósë$\'CM—¡É“\'¿;|øğù¡\0=?“é‘İ#F4ú¿ùé§ŸNªªªê\nÈ²İ¨ˆ„#¬¬¬lô§Ÿ~znÜø‡?üáã¡áº·9ş¡\Z“i¿]cïıëÕ«W:!C2$C2$C-%Cû+ Î#CM¡ß†)½Àf,\"Ï>ûìF=7òwŞ‰£çî:\n¶Ê„å-zdšñãÇ?ºyóæ×cCĞ”î¹çxrËªU«¦Zê\0\0­Ï”)Sf…›ùñ~<\Zyß}÷¥—ûhñÖ_ıêWÕa{q×QÈLÙnTD’‘ÊÊÊşùñÇ¯ˆ]FšÂòåËŸ\\¼xñÅYYYßj¢ÑÅ\0\082¾–ì¼ìFiiiÚ\rùpÉX@†‚´ö½÷Ş«ë·9“¶‘d¤Ø×|ûöíß\nÀÖµk×6êg‡Æà…±cÇ\rÁ§L™òÿ-m\0€Ö½İX[[{C¸›xqTİ;î¸#íŠz(âû~úÓŸV/_¾¼îdìÆzm&m7*\"ÉX“&Mš¼yóæn¿ıöÍuD2üÑ~tluuõ¡!˜d)\0´~Ó¦M‹İL¿UWHÆ#’£Gƒï¤£«ˆ8_I÷Ö[o­2;:Ó¶\r¬CFÿñ),,Üzçw>4tèĞœK.¹¤Ó!¶³ñŞ{ïõÒK/]î\rÍK\0 s„pBØnŒ#¼>••ut<GröìÙé€;ñ’*LN<ñÄô>]ºtI»¬ÆÂ±¸¸8^Â#N5Û¶m‹éê@ÆëUŞ‰ÛŠH2^Ü³4lØ°…Ó§O\ZSG\Z•ÿ©O}ªã¾½ò™g™5qâÄ“ªªªN\n\rÊ¹º°\0dövcØæ{8^ú#>‹É%K–¤Ó~Ôïå¹ ™©ÛŠHÚ„×ãù§Ğ(½ç{®mß¾ıiıû÷_;xğàÎıúõkß½{÷ŞyyyIEEÅš7–½öÚk+,X³bÅŠ“CÃÑ7¼÷·«W¯d\0€6±İøù¸İ\nÁQ¡˜,8ˆº)^8t|¦o7*\"ikÂŒp3cÄˆ}—-[6téÒ¥Ÿ\rÏSìº¦®aÚ¦x=Ÿ?‡éÚL¸ ,\0\0‡¾İXSS34“uÛ½wn7ÆíÇ8ªëÒ0=çm+ÛŠHÚ¤É“\'¿nîÛ9\0€íÆdtV\0\0\0‘\0\0\0(\"\0\0PD\0\0 ˆ\0\0@	\0\0€\"\0\0\0‘\0\0\0(\"\0\0PD\0\0 ˆ\0\0@	\0\0€\"\0\0\0‘\0\0\0(\"ƒıÏŸ][SScA´\0áw(	7U2„!C2$C(\"+//ïıM›6Y-À†\rŠÂÍRB†!’!‘@‹Õ®]»eeeD°zõêòp3_†!dH†dE$ĞbUVVş[hğwÔÖÖZÍ«xıúõ§‡Û™2„!C2$C(\"ëì³Ï^Vº¯–––ZÍ¨¨¨è™ğ;”~şóŸ_(CÈ2$C2„\"hÑ***Fo-//·0šÁ†\rX¿~ı¥5557Ê2$C2$C2Dk‘c@Û5iÒ¤uW^yå¢Ğø_–ŸŸŸ×¡Cå®t‹ŠŠNËÊÊú¿\\pÁB†dH†dH†PD­ÂÄ‰ß\Z9räËkÖ¬¹<¬¶„pÇpkÁ4â°Â}´¤¤ä¼¸Ò=ÿüógË2$C2$C2Dkâš;wnÿììì_åää|ªW¯^ïöèÑã˜®]»öÏY8‡)^;+}G®‹ÄóFb·Ÿ!C†É2$C2$C2„\"hÕæÍ›7 ++ëŠp· Lg†)ÏR9lñâËñÚYóÃ43Ó!’!’!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z‰ÿ«]ø@\'»í\0\0\0\0IEND®B`‚',NULL),('2802',2,'source',NULL,'{\"resourceId\":\"2801\",\"properties\":{\"process_id\":\"processAtest\",\"name\":\"cccc\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-6BB6A95C-E338-40A4-BC11-4849A221170B\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"å¼€å§‹\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E2C950AE-E244-48D2-9AB8-CF830FFD0486\"}],\"bounds\":{\"lowerRight\":{\"x\":207,\"y\":83},\"upperLeft\":{\"x\":177,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\",\"properties\":{\"overrideid\":\"one\",\"name\":\"ä¸€æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·1\",\"assigneeDbId\":\"c567ca3b-7c95-422a-a025-2d93e43a98a5\",\"assigneeId\":\"user1\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B4958380-5E4A-468E-A734-4F6472AEEE26\"}],\"bounds\":{\"lowerRight\":{\"x\":352,\"y\":108},\"upperLeft\":{\"x\":252,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-E2C950AE-E244-48D2-9AB8-CF830FFD0486\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\"}],\"bounds\":{\"lowerRight\":{\"x\":251.15625,\"y\":68},\"upperLeft\":{\"x\":207.609375,\"y\":68}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9A1916E3-5822-438C-874A-3F2A3ED5A331\"}},{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\",\"properties\":{\"overrideid\":\"two\",\"name\":\"äºŒæ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·2\",\"assigneeDbId\":\"f2b7cdf4-a689-4006-8c83-f6a2accd837b\",\"assigneeId\":\"user2\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8BA5CF36-C9F0-4121-93D7-09331666419B\"}],\"bounds\":{\"lowerRight\":{\"x\":497,\"y\":108},\"upperLeft\":{\"x\":397,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-B4958380-5E4A-468E-A734-4F6472AEEE26\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\"}],\"bounds\":{\"lowerRight\":{\"x\":396.15625,\"y\":68},\"upperLeft\":{\"x\":352.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-EC669E60-F767-4F15-A464-68500E13F80B\"}},{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\",\"properties\":{\"overrideid\":\"three\",\"name\":\"ä¸‰æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·3\",\"assigneeDbId\":\"00651061-a87e-4ac9-9c54-737002f49aaf\",\"assigneeId\":\"user3\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AB8F32B0-3F36-49C5-86D2-037C6253935A\"}],\"bounds\":{\"lowerRight\":{\"x\":642,\"y\":108},\"upperLeft\":{\"x\":542,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-8BA5CF36-C9F0-4121-93D7-09331666419B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\"}],\"bounds\":{\"lowerRight\":{\"x\":541.15625,\"y\":68},\"upperLeft\":{\"x\":497.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E4282E9A-769B-4CB8-BE15-3958CE09B71E\"}},{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\",\"properties\":{\"overrideid\":\"four\",\"name\":\"å››æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·4\",\"assigneeDbId\":\"8953750f-92f8-4cf9-9be7-9e3b5444b6fa\",\"assigneeId\":\"user4\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FCA98EC6-2ACD-407E-BF70-506313548327\"}],\"bounds\":{\"lowerRight\":{\"x\":787,\"y\":108},\"upperLeft\":{\"x\":687,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-AB8F32B0-3F36-49C5-86D2-037C6253935A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\"}],\"bounds\":{\"lowerRight\":{\"x\":686.15625,\"y\":68},\"upperLeft\":{\"x\":642.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E3068EAB-9A34-4DE3-BAFA-10DB7507A9DD\"}},{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\",\"properties\":{\"overrideid\":\"five\",\"name\":\"äº”æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"æµ‹è¯•ç”¨æˆ·5\",\"assigneeDbId\":\"d2965713-bb42-40c1-a689-73e9907f214b\",\"assigneeId\":\"user5\",\"type\":\"user\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-41EE32F1-6990-4999-9CA0-42A33B47B49E\"}],\"bounds\":{\"lowerRight\":{\"x\":932,\"y\":108},\"upperLeft\":{\"x\":832,\"y\":28}},\"dockers\":[]},{\"resourceId\":\"sid-FCA98EC6-2ACD-407E-BF70-506313548327\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\"}],\"bounds\":{\"lowerRight\":{\"x\":831.15625,\"y\":68},\"upperLeft\":{\"x\":787.84375,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9B7F4135-719A-45DD-837E-DDA01835EA94\"}},{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"ç»“æŸ\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1005,\"y\":82},\"upperLeft\":{\"x\":977,\"y\":54}},\"dockers\":[]},{\"resourceId\":\"sid-41EE32F1-6990-4999-9CA0-42A33B47B49E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\"}],\"bounds\":{\"lowerRight\":{\"x\":976.375,\"y\":68},\"upperLeft\":{\"x\":932.390625,\"y\":68}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-F8C3E793-5D60-49D0-8F5A-AAD532D28D52\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('3001',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0z›¢Æ\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0>IDATxÚíİtTõ½/ğ$ÈK)PäR½bÕ‚VÁZª©‡Šõqµ•@ÁWW[êíñ®ª½õQÛC‘V×=ÖZ»Zm‹\\8¼-E»®¢¥¨ÂÂãáª	\"A$3÷ÿŸNÀ\02	Ì|>kí5“™™ÉïìÿoşûÿO\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0hXM\0ù-N—VVVşóæÍ›‡oÛ¶í´­[·–¦R)æHw®éÒÒÒZµj5×®]÷0àße’!’!’!BñÈ;ï½÷Şw×®]û‹;v×­[·¤cÇIûöí“ÂÂBçÅXªªª’ğOL²fÍš555omß¾}ø Aƒ–È2$C2$C2$C2„â–/_>ãİwß½ê¤“NJºwï+Ó6J­\\¹2şs³=\\zñÅ?-CÈÉÉÉù¤È&€ü,<„åªÓO?=éÒ¥‹m3ˆß |âŸhµvíÚË‡¾xÜ¸qÿ)CÈÉÉÉŠ@NŠ]+**n‹Ú:|ìşUk’ÕKŸJV¿õt²î½O¶mx/)iÛ5).é`ã¡Ö­[\'\'œpBÉªU«.6lØ³ãÇÿP†!’!’!’!ò™ ÄÁ”â9±káş´ï/x<©Z÷v’ªİ™¤S5É¶õï$Ë_“ToşÀlmÛ¶Mzöì™***zH†!’!’!’!€œGqƒ)Ås\Z²¾ò/IÍÎ­»=x×½7Çl\"=zôèT\\\\üé^xá|B†dH†dH†dH†P|\0rJœ>*â¼¿s\Z· š¿ étîÜyu¸¸F†!’!’!’!€œç­ÓGíOºv×ş9m®ë¦Ôµk×ÿ.Êd’!’!’!\"Û?¶nİZ\ZG¦å…÷áÄpÑE†!dH†dH†dˆ| çä‘T*•úØ;ß¿¿Å2„!C2$C2$CäÅûm\0uZµ9a¿÷—ø†\0B†!d8<ŠÀNº )nİöc·µj“t:y€\r„!CÈ2Å`v]NOÚv>­ÁÛÛw=ÃB†!d‹â°—Ú]Û?v[Í-62„!CÈpØ€Œ[×&Ë_“T­}ëc÷mıhY²üµG3ë€!CÈ2(>\0‡lÓÊá@ûX²mÃ{û]gÛÆÊ¤bşÃÉ†å¯$is\\#CÈ2„ÙhpLky,Vî×üçŸ2•üÆHÕîÌ¬¿eí[I×ÿ~YRš™š’!dB†€ÓóòX¬Ü7ö@[_üF òÕßÙ€È2„!C@£(>@‹•ûÃ•NÕØ€È2„!C@£8íòXï£mdB†! ëô|\0\0\0\0²Jñ\0\0\0È*Å\0\0\0 «\0\0\0€¬2à$y!N—.^¼øú7Şxã«V­ê»råÊã6oŞ\\\\]]§Û·o¿«S§NtèĞá•°ú=·ß~ûÛ¶\Z\0\0p8†\rÖ£¦¦æê‚‚‚‹Â}ÃÒ-,íÂR–Õ¡}²0Ü÷rQQÑ¤	&¬È‡m¢ø@N‹E‡\'Ÿ|ò÷£GúÑGŸ~úéIYYYò©O}*éÔ©SRZZšTWWlÙ²¥õûï¿ßsÉ’%=,Xğ[n¹eùÖ­[Gÿş÷¿ÌV\0\0\ZcèĞ¡W‡‹ï¥R©\n\nZ7°JiXN	÷.¯®­­ı×!C†Ì	?™8qâø\\Ş6Šä¬yóæ}óg?ûÙo7mÚT>ĞIŸ>}’¢¢¢úKK3K—.]’sÎ9\'¹îºë\n-Ztò¤I“1bÄmë×¯¿rêÔ©ÿÏ\0\0\ZÚ± ğH:t¿^~¯,<ÆˆÚÚÚsµí¡ø@Î	ÜâgyföØ±c¿tùå—\'_ùÊW\Z,:H,T„¥èùçŸï=eÊ”7¿óïü/½ \0\0€}•——),,üm*•:¡î¶Øş8óÌ3“şıû\'½zõJ?şø¤}ûöÉ¶mÛ’7&Éüùó“$»víªûµá÷Ş:tèM¹ØBñœ+<¼ôÒK¯¼øâ‹çİzë­É§?ıé#z¼Aƒ%½{÷nsß}÷=ô­o}«ä±Çû­\0\0ì.<\\QXX8>•JÕâ—Ÿ—\\rI¦gõ¾;î¸ÌÒ½{÷ä‚.È\"}öÙdÖ¬YImmm\\¥]hÓüß¡C‡–Nœ81§¾ü4Û9%öx˜>}úy?şñ¸ğPçä“ONF\ZÕ&ìTî;á¶2\0\0°»ÇÃŒt:)<Ä‚Â½÷Ş›l°ğĞØ#\"®/KW\'<æ£¹ÖöP| gÄ1fÍšõ¥›o¾¹ÑöÆŠw×]wµkÕªÕ¯ÃN ·­\r\0\0ù+ñPTTôÛºÂÃi§–Œ9r¯Â¡ˆ¿ÿ¬³ÎÚs[xì‡s©í¡ø@Nˆ³ZÌ=ûá8ÆCSõxØWìQ^^^RXXø[\0\0òWh<V7ÆCìñpÛm·eÆt8ñtŒïÿûõñŒGsf›‰\r¹`ÆŒcât™qŒ†lºì²ËÚtìØ±§Ó/\0\0 ?Åé4S©Ô?ÆëqŒ‡X08ÒÂCX€ˆ=¹ë\r˜? WÚŠób¯‡%K–üSœN³U«VY¾#FœPXXø½–ø[ÃßxwÜÙ•••,B†!dZ&C{ÚqpÉÃ=Õbâã]qÅõÛ;#ra»ûÀrÌ[¼xñõ~øaqœ³9|ö³Ÿm]RRÒ3ç5iÒ¤ŠºÛÃìû555“¦Nº:‹OOØù$Ÿüä\'«ÂóÏ(((˜snxÎª|ÏÁÌ™3“+V$ßıîwÙ¿A†dH†dH†mÕÕÕ±‘pÀuÂß›”––Ê5hÍš5u3ìWüF<üí2ÔêÖ­ÛÖòòòq¶ŠÆfhØ°a=R©Ô—êŞ‹X|È†K/½4ùÓŸşT7\rç€}ÛŠĞŞxãoÄÂC½®IYwÖYg­şÛßş68\\½¿î¶°«¯á_ÃÕk³ıüá Û.\\Ï9<ì,7†æ3árbIIÉœ±cÇVçË{ÿë_ÿ:4’¯ıëÉ†\r’_|1ÓU­ÎW¿úÕ&ë×dèÈ,_¾<™<yò×	grÒI\'ÉíwŸòè£>µö†nHâTÎ2$C\réÕ«Wò™Ï|&s}áÂ…É™g™„MòÎ;ï$gœqFæö¥K—f\Z‡2$C\r¹ã;’Õ«ÿ«Íı×¿ş5ùüç?¿×:]»vMxâ	j\ZmC†…çsshà?~ş·e(|¦¯ëd\Z±\rÒ©S§¬¼°8Æ9çœ“„6GİM{µ= ¬ZµªoYYY³>gÿşı;‚‹êï\0&MšôH8è;­²p}Ns½–°ó;>\\\\vš×UWWoÏ?9ÜötØ.3çÌ™S“Ëïı–-[ö:˜nÛ¶-Y¿~ıŸöÍÁÑF†LëÖ­3ÿl’¡ı‰çØÆÅ~H†W›6m’Ù³gg®_|ñÅÉÔ©S“Í›7\'?øÁ’éÓ§gnßw`l’¡úşğ‡ÿ\Z×ü£>J®ºêªdÖ¬YöCÍ£C,x„]2T^Ã”ÂÂÂ§öÍPÈÕEu×ûõë—Õ¿^ñá\"Åha+W®<.ÎDÑœN=õÔXNîÛÀ]7Å)qÊÊÊÎk¡]›°Ü^Ã\rİºuÛvÚÏ…äØ|éqşùçgü9ÆÉĞaŠßú\\ıõ2$CöC2$C2”zíµ×’Ï}îs2Ô2*\r™É³B†bˆÙáç11CÕÕÕ}ëµ	²ú\"N9å”ú?ö=ÖßTÅy›7o.İ’šÓ®]»º„QMØÜ÷¾p{êÄOœî›×Â›¦cXÊÃë)ç –——¿³víÚœxÏcwÂØí9Vúãé6<ğ@æ›¥;w&Ó¦MÛkİxßÀº¿aİºuÉ‚’!’!ÊÍmİº5Óõ=æB†d¨±âk‹§ZD3fÌHÚ¶m›<óÌ3{î?ûì³÷n(CÍ&öˆ^Ïà˜¡ UwG¶Û û<~gÅhaq\'°¿›²eŞ¼y±ËUüüüË¾÷Å¤v65èhÚNáuıÃüùó“k®¹æ¨{cWÔQ£F5jİ‘#GfÎ]|óÍ73?Ï™3\'¹è¢‹2]ÿüç?\'¿øÅ/2·Ç.‡õÏw<Úüå/‰ã•$2Ô2â?`2$C\rùÑ~”ù¶±!ñÜÛ{ï½W†dè bwù8W<\rÃ~H†EUUUòê«¯îÉE<í¢îç—_~9¹ñÆ“k¯½V†ZÖ#³=–Æ>ï]irŒS|à˜WRR’®®®.hÎD¿~ıÖM›6íø°SüÙ~V97,±,ıT?õ¿4b»/[ï³÷ÜsÏ=õh|c1¡ştBR:ÕÇ<yòÉ\'“/|á{­³cÇÌmüã“=z•¹ıâ¿˜TVVÆîOe¨åÈíë¶ÛnË|kØ}Ç‘!jH*•Jî¾ûîäk_ûÚÆÃ[o½•ÉBıoeH†\ZÒ³gÏä{îÉ\\_ÎÄ±íï‹\ZÊZ†jÓÁî/ëg(nÎ öo£©ÅâQ=ÇüigŠó:tè°kãÆ­ãùŞÍ%4€×‡Oõ¤I“Fîoòòò7Â:sšr œ!C†ìoG¹=îÃó•ÔdÃÏÃÏ/Æé§JJJ‹ç8~ó›ßLïaaaa,\"ÒïÄrø›2şú‰èç?ÿyrùå—µÚ¨sçÎ™oQo¿ıvj!2$C\r9”QËeH†\Z™Œ]¥ëfE‰S\"şô§?Sƒl\ZN’¡ı©¨¨È«ê\nöCÍ“¡xZu¸H…ç‹ù)Úİûb¯UWW/÷õŠë‡6HV‹ññëY§ø\0-,à—WVVöjÎâCøâpq°¡ƒ³=PNœ‡8‘Ú†¥ÍîƒS¼í¹°LnÓ¦Í‹á`´1Wß÷8ïq¬òÇs!£8 Ï\\Üu×]IìNç¹Î2$C2$C2tŒe(Né—úâˆubï\Z’¡ƒ‰§wŞyöCÍ“¡áñkCvÚÔëå°ß\r2da]ñáİwßİ3G¶ŠPõ,T|€Ö¡C‡—–,YÒ«ÿşÍöœ¯¼òJ¬˜¿t u&O</üóñÚ‰\'øÏáÇ³ğ2ÚÕÛ9ÆQ…---™#GcÆŒÙs=vI[´hQòÈ#dæTo¨ú,’¡Æ{úé§3SÙ5FìÂzå•WÊíeùòåI8–4jİ˜‘ø¤ÉĞÇZ0;w&¿üå/ºc™5$¹bÅŠÌõ8nCïŞ½“¥K—î¹?Î{ŠÆÛbo†ğ?°5ÖõŠVÍP:~)¬?8^8ÖF¶ÄÇ¯ç%Åha›6mº·²²òÆÚÚÚÂ8Òo3¨^¶lYïpù½ƒ­XXXxg¸ŞÔ/ vÿ\nsÂã?±{Ú¨ùö¾O™2%Î¬Zµ*Ù°aCré¥—&=ôPÒ§OŸœú;e¨qâ€\\q‘!:\\ñşøÏ~cÄ.õ±ø C2ÔÀ¶Êœ³°uì‡d¨!±¨P7Pd4wîÜÌR_ÌJìqË-·dz8ÈPóg¨¸¸xFhwÄ*cq,ö¬_¿şNÙk¬xÊÅë¯¿¿ğ¬;÷fšâ´°Ñ£G¿së­·¾>üÿÏË¶Ù³gOO¥R\'‡}ÅÁÖ8qb<7«)+´?.((¨(--–/=ö§¬¬,éÛ·oÒ½{÷¤]»v9ûwÊÉPóˆÿÄÇE†dèH,[¶,6L¸Nı–eH†ê;ÿüó3c†Øİš0aÂŠ¡C‡ÎI§Ókkk3=L†\rÖäósÏ=—ÔÔÔÔæ6¦í¡ø\0Í`Ó¦Mwş[Ğ§OŸâ,÷~ØøÄO|&ì¬h‰¿3ìtF{·ÿ®k×®™’!’!:jş±..>¤udH†ì‡Ùı&,ã•X|¸ğÂ›tì‡÷ß?ÎR²§×Ch{ü.¶{¡è‘ÆŒ3µªªê­øáÏ¦ûï¿?özØºjÕªI¶:\0\0äŸ‰\'ÎsâõØûáÁÌL»ÙâØ¿úÕ¯jC›cO¯‡\\i{(>36mÚô?zê©í±Ëc6,^¼ø™×_ıò‚‚‚ogi¤]\0\0àØpc²{úË•+WfÆë8ÒD,<<øàƒé>ø ®+wU.µ=Èñ<¨;w~;|ğ·­]»¶I;ì\0^¾ï¾ûú†ÿÿ8qâØÚ\0\0ßmt:}s¸š)¼ıöÛÉÈ‘#3§Lø{?ùÉOj/^\\×ã!nqS.µ=È)ãÇŸPUUuóİwß]ÕT= b‡şğ‡Ÿª­­}8|øÇÛÊ\0\0ÀäÉ“ãéßNv bˆ;ï¼3J™™­¢1âzqÆ’;î¸£~‡8Ç¹Öö0à$9\'|Ø///ß6jÔ¨ß\r<¸èŠ+®h{˜ƒPn|àf¼úê«—†ëw†ËX[\0\0¨3iÒ¤±¡ígÌx¸  àø8ÄÌ™33QÆ)Oûõë—œzê©™išÛ·oŸ9µ\"***âTšqIíØ±#v\n¨ëñP–›s±í¡ø@NŠUÈ!C†Ì›2eÊ˜ğÁ?cÄˆÎ>ûì6üõê^xaÆ¸qãzÕÔÔô\n;‘/9Õ\0\08PÛ#´SpÆÛbbÁ‚™å êŸ07ñ«mÅrÖî¹pÿ1ìßÿı7µnİú¬Ş½{¯0`@»={¶îÔ©S·ÒÒÒdûöík6nÜ¸iéÒ¥ËæÎ[´lÙ²ÓÂÎ¢Gøİß¬^½z¼Á%\0€F´=¾Û#ÒétÙ!´·ç†eL®·=È‡Á´p1mØ°a=-Z4xáÂ…_?Ÿ–Ø=ª4,Ã²+,q.İ?‡å¦İ;\0\0€Ãj{¤R©Áétº®íÑmwÛ#¶Aâ,ÃòR\\7_ÚŠä	&¬î^\0\0\0´=š‰Ù.\0\0\0€¬R|\0\0\0\0²Jñ\0\0\0È*Å\0\0\0 «\0\0\0€¬R|\0\0\0\0²Jñ\0\0\0È*Å\0\0\0 «\0\0\0€¬R|\0\0\0\0²Jñ\0\0\0È*Å\0\0\0 «\0\0\0€¬R|\0\0\0\0²Jñòé_X˜N¥R6ÄQ ¼•á¢F†!dH†dH†dˆ¼h‹Ø?JKK?Ü²e‹\rqØ°aÃ’p±P†!dH†dH†dˆ| ø\0y¤U«Vs7mÚdCV¯^½9\\Ì‘!d’!’!\"(>@©®®ş?a\'¿+NÛ-«bıúõ}ÂåtB†!’!’!òâä‘/¼p~8Ğ¾¹råJ£-Y²ä…ğ>¬üò—¿<O†!dH†dH†dÅ çlß¾}xEEÅ¶Í›7Û-`Ã†\rO¯_¿şÊT*u‹!C2$C2$C2$Cä‹\"›\0òËøñã×]{íµóÃÿª:”–””Ø(Íx ]²dÉYÿó’K.™+CÈÉÉÉŠ@Î\Z7nÜ»Ã‡mÍš5W‡ÿÖpĞm.m˜ì©Ù©•••ÇíÀgÊ2$C2$C2$C2D>ñé‚<öüóÏ÷.,,üUQQÑÙ]»v]Ñ¹sç;vìØ-Üfã¡8ouœ>*âSŠç4Æ®…ƒ\rZ\"CÈÉÉÉŠ@Ş™={vß‚‚‚kÂÕ²°œ–R[åˆÕ$Ÿ·zNX¦çú`J2$C2$C2$C2D¾g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0rÆÿ² YId\0\0\0\0IEND®B`‚',NULL),('602',2,'source',NULL,'{\"resourceId\":\"601\",\"properties\":{\"process_id\":\"processEric\",\"name\":\"æµ‹è¯•æµç¨‹11111\",\"process_author\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-E5A6B933-9FD5-4299-9EFF-BE1F91F3A972\",\"properties\":{\"overrideid\":\"startNode\",\"name\":\"å¼€å§‹\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\"}],\"bounds\":{\"lowerRight\":{\"x\":201,\"y\":108},\"upperLeft\":{\"x\":171,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\",\"properties\":{\"overrideid\":\"one\",\"name\":\"ç¬¬ä¸€æ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\"}],\"bounds\":{\"lowerRight\":{\"x\":346,\"y\":133},\"upperLeft\":{\"x\":246,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-C1B16C79-863A-402A-B194-B3576329D6EE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\"}],\"bounds\":{\"lowerRight\":{\"x\":245.15625,\"y\":93},\"upperLeft\":{\"x\":201.609375,\"y\":93}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-5F1B7026-980E-40CF-A804-1714633B4EB4\"}},{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\",\"properties\":{\"overrideid\":\"two\",\"name\":\"ç¬¬äºŒæ­¥\",\"exclusivedefinition\":\"false\",\"multiinstance_type\":\"\",\"multiinstance_condition\":\"\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C9475C24-996C-40E7-9603-B06464B146D0\"}],\"bounds\":{\"lowerRight\":{\"x\":491,\"y\":133},\"upperLeft\":{\"x\":391,\"y\":53}},\"dockers\":[]},{\"resourceId\":\"sid-1C36D53D-C0F1-4F28-A502-AF74562A0B4A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\"}],\"bounds\":{\"lowerRight\":{\"x\":390.15625,\"y\":93},\"upperLeft\":{\"x\":346.84375,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-03BEF3C1-7813-4305-9301-BA45AB22E319\"}},{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\",\"properties\":{\"overrideid\":\"endNode\",\"name\":\"ç»“æŸ\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":564,\"y\":107},\"upperLeft\":{\"x\":536,\"y\":79}},\"dockers\":[]},{\"resourceId\":\"sid-C9475C24-996C-40E7-9603-B06464B146D0\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"conditionsequenceflow\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\"}],\"bounds\":{\"lowerRight\":{\"x\":535.375,\"y\":93},\"upperLeft\":{\"x\":491.390625,\"y\":93}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-65A6E420-2A87-40C5-AFBC-65E6B1528E6C\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL);
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
INSERT INTO `act_re_model` VALUES ('1',6,'å·¥ä½œæµ6.0','process','shipin','2017-12-12 01:35:34.739','2017-12-13 02:22:59.599',1,'{\"revision\":1,\"description\":\"æµ‹è¯•activiti6.0çš„ç‰ˆæœ¬\",\"name\":\"å·¥ä½œæµ6.0\",\"bpmnXML\":\"/opt/workspace/platform-work/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/artron-core/workflow/process/process.bpmn20.xml\",\"processDefinitionName\":\"processName\",\"bpmnImage\":\"/opt/workspace/platform-work/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/artron-core/workflow/process/process.1.png\",\"processDefinitionId\":\"process\"}',NULL,'2','201',''),('1801',5,'æµ‹è¯•æµç¨‹','processDemo','test','2018-01-23 14:17:18.536','2018-01-23 15:59:42.121',1,'{\"processDefinitionId\":\"processDemo\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processDemo/processDemo.1801.png\",\"name\":\"æµ‹è¯•æµç¨‹\",\"description\":\"\",\"processDefinitionName\":\"æµç¨‹æµ‹è¯•\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processDemo/processDemo.bpmn20.xml\",\"revision\":1}','2002','1802','2001',''),('2801',7,'æµ‹è¯•æ¨¡å‹111111','processAtest','guji','2018-01-24 16:58:58.416','2018-01-25 16:58:51.063',1,'{\"processDefinitionId\":\"processAtest\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processAtest/processAtest.2801.png\",\"name\":\"æµ‹è¯•æ¨¡å‹111111\",\"description\":\"111111\",\"processDefinitionName\":\"cccc\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/mars-workflow/workflow/processAtest/processAtest.bpmn20.xml\",\"revision\":1}',NULL,'2802','3001',''),('601',9,'å·¥ä½œæµ6.0ç‰ˆæœ¬æµç¨‹æµ‹è¯•333333','processEric','personAdd','2018-01-18 15:24:16.763','2018-01-18 21:09:43.759',1,'{\"processDefinitionId\":\"processEric\",\"bpmnImage\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp4/wtpwebapps/artron-core/workflow/processEric/processEric.601.png\",\"name\":\"å·¥ä½œæµ6.0ç‰ˆæœ¬æµç¨‹æµ‹è¯•333333\",\"description\":\"æµ‹è¯•activiti6.0çš„ç‰ˆæœ¬\",\"processDefinitionName\":\"æµ‹è¯•æµç¨‹11111\",\"bpmnXML\":\"/opt/workspace/jdk8/artron-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp4/wtpwebapps/artron-core/workflow/processEric/processEric.bpmn20.xml\",\"revision\":1}','1601','602','1201','');
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
INSERT INTO `act_re_procdef` VALUES ('processDemo:1:2005',1,'http://activiti.org/test','æµç¨‹æµ‹è¯•','processDemo',1,'2002','processDemo.bpmn20.xml','processDemo.processDemo.png',NULL,0,1,1,'',NULL),('processEric:1:1604',1,'http://activiti.org/test','æµ‹è¯•æµç¨‹11111','processEric',1,'1601','processEric.bpmn20.xml','processEric.processEric.png',NULL,0,1,1,'',NULL);
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `CODE` varchar(50) NOT NULL COMMENT 'ç¼–ç ',
  `NAME` varchar(100) DEFAULT '' COMMENT 'åç§°',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€',
  `TAB_INDEX` int(11) DEFAULT '1',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åœ°å€è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_address`
--

LOCK TABLES `app_address` WRITE;
/*!40000 ALTER TABLE `app_address` DISABLE KEYS */;
INSERT INTO `app_address` VALUES ('1','code1','æµ‹è¯•1',1,1),('13e2cde3-7b84-4a75-8aa9-cbca3653b332','abc111','Name222222',1,0),('2','2','a',1,1),('4cecf5b7-7f4f-4422-811e-b034adfbadc1','atron','æµ‹è¯•æ·»åŠ 1111',1,0),('759939f0-c988-4b58-b08f-f0e28745136e','123','abc',1,0),('f01ca999-2f10-4f68-892a-5f878628f88d','abc','Name123',1,0),('f3c542db-e114-473f-9821-ebc8cd9756aa','amb','æµ‹è¯•',1,0);
/*!40000 ALTER TABLE `app_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_event`
--

DROP TABLE IF EXISTS `plt_cmn_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_event` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `CODE` varchar(100) NOT NULL COMMENT 'ç¼–ç ',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `EVENT_TYPE` varchar(50) DEFAULT NULL,
  `SYSTEM_ID` varchar(50) DEFAULT NULL COMMENT 'ç³»ç»Ÿ',
  `CLASS_NAME` varchar(100) DEFAULT NULL COMMENT 'JAVAç±»å',
  `SPRING_BEAN_ID` varchar(100) DEFAULT NULL COMMENT 'SPRINGä¸­ID',
  `METHOD_NAME` varchar(50) DEFAULT NULL COMMENT 'æ–¹æ³•å',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `VERSION` int(11) DEFAULT '0' COMMENT 'ç‰ˆæœ¬å·',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='äº‹ä»¶è¡¨';
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
  `KEY_` varchar(255) NOT NULL COMMENT 'ç”Ÿæˆåºåˆ—å·KEY',
  `VALUE_` varchar(255) DEFAULT NULL COMMENT 'å½“å‰åºåˆ—å·å€¼',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åºåˆ—å·è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `MODEL_NAME` varchar(100) NOT NULL COMMENT 'æ¨¡å—å',
  `USER_CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'æ“ä½œè€…ç¼–ç ',
  `USER_NAME` varchar(100) NOT NULL COMMENT 'æ“ä½œè€…åç§°',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'æ“ä½œ',
  `BUSINESSKEY` varchar(50) NOT NULL COMMENT 'ä¸šåŠ¡ä¸»é”®',
  `OPERATE_TIME` datetime DEFAULT NULL COMMENT 'æ“ä½œæ—¶é—´',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ“ä½œæ—¥å¿—è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cmn_log`
--

LOCK TABLES `plt_cmn_log` WRITE;
/*!40000 ALTER TABLE `plt_cmn_log` DISABLE KEYS */;
INSERT INTO `plt_cmn_log` VALUES ('0addd642-e094-4621-8240-ffad441dbaac','net.artron.systemmgr.menu.menu.command.MenuNonAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:36:26'),('12727a24-d5b0-4c59-b79a-e9ff3a73d615','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:44'),('2323b895-a6fe-419a-8922-a87e2c03d61b','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:24:47'),('26b3ebb6-cb5e-42fc-9730-6ac39431e750','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 18:04:29'),('288e5654-a278-4f66-bbc4-af312675698f','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 18:15:09'),('3300cc37-a0b0-45a9-a47d-103a996f1871','net.artron.organization.user.command.UserAddCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','22604b77-eef9-4ffe-ade5-59b810ce7f9a','2018-02-02 11:50:36'),('3442cdf2-a959-40a8-a77e-af9f82bf0caa','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 15:11:49'),('40e94465-e9c4-4814-bd7b-036b6cac55db','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:20'),('42c6f66a-7f14-4912-900f-4e3a65b3faf3','net.artron.organization.org.command.OrgAddCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','0c1d0420-fdad-4640-a922-f7ef981b30ae','2018-02-05 11:13:51'),('441d5185-9d86-4c89-a63d-26d4942ea5ff','net.artron.organization.user.command.UserAllocateRoleCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 16:50:08'),('50414d89-ee43-4552-8eb3-8d5753efa4d0','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:24:37'),('521655de-745f-4d3c-9361-11ba45c167ec','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:52'),('587b4a0f-3e28-4f48-8b18-e42f4c8976b7','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 11:24:42'),('59f0ca3d-e8a1-4656-ab2f-4e99ad47fe53','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:24:15'),('5c0dbb2e-2f35-4747-b84d-61e9a4e63096','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:37'),('5c55bcbe-64f0-4790-bfec-bb7d0964d416','net.artron.organization.user.command.UserAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 18:22:20'),('60b3076a-ee45-4224-9170-40d624ff1b0c','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 11:41:31'),('664e3457-349d-4b8b-b662-d1d7399a4889','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:03:23'),('79c89bb9-c28c-4fff-a8c6-45697e41f413','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:24:55'),('7c20644f-629c-4352-9f47-248124b4e5d3','net.artron.organization.org.command.OrgAddCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','41a0f6c3-8699-4663-883f-825630e6551d','2018-02-05 11:14:25'),('82d07b3d-28b5-4cb5-aa7a-afd46563c2db','net.artron.organization.role.command.RoleDeleteCommand.executeService','admin','ç®¡ç†å‘˜','åˆ é™¤','null','2018-02-01 16:40:59'),('97983f6c-afda-4745-a3af-f9f23035c24e','net.artron.organization.role.command.RoleUpdateCommand.executeService','admin','ç®¡ç†å‘˜','ä¿®æ”¹','dc8c1647-269b-4969-94ab-17566fda4550','2018-02-01 16:40:50'),('9bdf72c7-a903-45fb-82fa-0aaae1811abe','net.artron.organization.org.command.OrgAddCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','6c60550d-aaad-4061-8056-b72c277a00ae','2018-02-05 11:15:24'),('a53d1e21-1fbb-4b10-a514-6cc69eaa9319','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 11:25:32'),('a5fe6d3c-7f0a-470a-9262-db2c6aaf2bb1','net.artron.organization.org.command.OrgAddCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','04e6b192-0257-41eb-b32b-2b327d349295','2018-02-05 11:15:02'),('a854bbf3-a874-4216-b8ba-7e6df84f9f6d','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:07:23'),('ad3bb0e3-c1e9-410b-9f15-b94d4e857c31','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:36:36'),('b0fd2a3f-d85f-473e-bc54-fe4fcfe984f0','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 11:35:13'),('b61df1e7-0bc1-4774-aa2c-e83a13f8f892','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:58'),('b6234034-f0ae-4360-993f-9498901769cc','net.artron.organization.user.command.UserNonAllocateRoleCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 16:50:04'),('bdbd47b4-9a85-4c6e-83fb-e87760907685','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:24:28'),('c1649044-8b6e-4c72-9492-faa92962165c','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-02 16:25:01'),('c7fcc7e7-bd41-409e-b661-117cd57fa780','net.artron.organization.user.command.UserNonAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-01 18:22:14'),('d2b33b01-01b6-402c-a2c3-7246d3ed86cd','net.artron.systemmgr.menu.menu.command.MenuAllocateRoleCommand.executeService','eric','Eric','å¢åŠ ','null','2018-02-04 20:38:30'),('ec48ead4-7367-409b-b56c-06d8624a3895','net.artron.systemmgr.menu.menu.command.MenuNonAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:36:33'),('ed0e97d6-5963-40a4-a54d-5850b2e16773','net.artron.organization.group.command.GroupUpdateCommand.executeService','admin','ç®¡ç†å‘˜','ä¿®æ”¹','850cf5ff-da81-441d-b85f-06ca10c423db','2018-02-01 16:03:05'),('efb87374-a122-4eab-8f07-5cdecfdb1364','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:09:45'),('f4b610b0-bf68-4a1f-9e51-f5d4beab1491','net.artron.systemmgr.menu.menu.command.MenuAllocateGroupCommand.executeService','admin','ç®¡ç†å‘˜','å¢åŠ ','null','2018-02-02 10:36:30');
/*!40000 ALTER TABLE `plt_cmn_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cmn_variable`
--

DROP TABLE IF EXISTS `plt_cmn_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cmn_variable` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `CODE` varchar(50) DEFAULT '' COMMENT 'å˜é‡åç§°',
  `NAME` varchar(200) DEFAULT '' COMMENT 'å˜é‡ä¸­æ–‡åç§°',
  `TYPE` varchar(20) DEFAULT '' COMMENT 'å˜é‡ç±»å‹',
  `SCOPE` varchar(50) DEFAULT '' COMMENT 'èŒƒå›´',
  `SYSTEM_ID` varchar(50) DEFAULT NULL COMMENT 'ç³»ç»Ÿ',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å˜é‡å®šä¹‰è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `REF_R_DB_ID` varchar(50) DEFAULT NULL COMMENT 'æ•°æ®è¡¨TBL_CORE_DATA_REF_Rä¸»é”®',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®è¡¨TBL_WF_DATA_DEFä¸»é”®',
  `COLUMN_DB_ID` varchar(50) DEFAULT NULL COMMENT 'æ•°æ®è¡¨TBL_WF_DATA_COLUMNä¸»é”®',
  `AUTHED_DB_ID` varchar(50) DEFAULT NULL COMMENT 'è¢«æˆæƒè€…ä¸»é”®',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT 'æˆæƒç±»å‹ï¼ˆç”¨æˆ·ã€è§’è‰²æˆ–è€…ç”¨æˆ·ç»„ï¼‰',
  `DATA_TYPE` varchar(10) DEFAULT 'COMMON' COMMENT 'æ•°æ®ç±»å‹ï¼ŒåŸºç¡€æ•°æ®ORä¸šåŠ¡æ•°æ®ï¼ˆCOMMON OR BUSINESSï¼‰',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ï¼Œé»˜è®¤å¯ç”¨',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®æƒé™è®¾ç½®è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `AUTHORITY_DB_ID` varchar(50) NOT NULL COMMENT 'æƒé™è¦ç´ è®¾ç½®è¡¨TBL_WF_DATA_AUTH_CONFIGçš„ä¸»é”®',
  `DATA_VALUE` varchar(200) NOT NULL COMMENT 'æˆæƒæ•°æ®çš„å€¼',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ï¼Œé»˜è®¤å¯ç”¨',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®æƒé™è®¾ç½®è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“è‡ªå¢ï¼Œä¸»é”®',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®å®šä¹‰è¡¨ä¸»é”®',
  `CODE` varchar(100) NOT NULL COMMENT 'å­—æ®µç¼–ç ',
  `NAME` varchar(200) NOT NULL COMMENT 'å­—æ®µåç§°',
  `BEAN_FIELD_NAME` varchar(100) NOT NULL COMMENT 'å­—æ®µåˆ«å',
  `FIELD_SIZE` int(11) NOT NULL COMMENT 'å­—æ®µé•¿åº¦',
  `FIELD_PRECISION` int(11) DEFAULT '0' COMMENT 'å­—æ®µç²¾åº¦',
  `FIELD_TYPE` varchar(50) DEFAULT '' COMMENT 'å­—æ®µç±»å‹',
  `DEFAULT_VALUE` varchar(200) DEFAULT NULL COMMENT 'å­—æ®µçš„é»˜è®¤å€¼',
  `FIELD_COMMENT` varchar(500) DEFAULT NULL COMMENT 'å­—æ®µæ³¨é‡Š',
  `PRIMARY_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦æ˜¯ä¸»é”®ï¼Œ1ä¸ºä¸»é”® ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºéä¸»é”®',
  `QUOTE_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸ºå¼•ç”¨å­—æ®µï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºå¦',
  `DISPLAY_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸ºæ˜¾ç¤ºå­—æ®µï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºæ˜¯',
  `TREE_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦æ ‘èŠ‚ç‚¹ï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºå¦',
  `RESOURCE_TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'èµ„æºç±»å‹ä¸TBL_WF_RESOURCE_TYPEå…³è”',
  `MARK` varchar(1000) DEFAULT NULL COMMENT 'å¤‡æ³¨è¯´æ˜ä¿¡æ¯',
  `QUERY_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦æ˜¯æŸ¥è¯¢æ¡ä»¶ï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºå¦',
  `MANDATORY_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸ºå¿…é¡»è¾“å…¥å­—æ®µï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºæ˜¯',
  `VALID_TYPE` varchar(100) DEFAULT NULL COMMENT 'éªŒè¯ç±»å‹',
  `MISSING_MESSAGE` varchar(500) DEFAULT NULL COMMENT 'æç¤ºä¿¡æ¯',
  `INVALID_MESSAGE` varchar(500) DEFAULT NULL COMMENT 'æ— æ•ˆæç¤ºä¿¡æ¯',
  `MIN_VALUE` varchar(100) DEFAULT NULL COMMENT 'æœ€å°å€¼',
  `MAX_VALUE` varchar(100) DEFAULT NULL COMMENT 'æœ€å¤§å€¼',
  `PRECISION_VALUE` varchar(100) DEFAULT NULL COMMENT 'ç²¾åº¦',
  `DATA_OPTIONS` varchar(200) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰éªŒè¯ç±»å‹',
  `UNIQUE_FIELD` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦å”¯ä¸€ï¼Œ1ä¸ºæ˜¯ ï¼›0ä¸ºå¦ï¼Œ é»˜è®¤ä¸ºå¦',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¯¦ç»†å­—æ®µè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_column`
--

LOCK TABLES `plt_cor_data_column` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_column` DISABLE KEYS */;
INSERT INTO `plt_cor_data_column` VALUES ('370b48c2-f0cf-11e6-b194-0fa3073a0d94','c19c8f10-672a-43ce-a95e-3f58bd71faa9','agency_code','å•ä½','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('3f7263ec-f0cf-11e6-b194-0fa3073a0d94','c19c8f10-672a-43ce-a95e-3f58bd71faa9','kemu_code','ç§‘ç›®','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('501fffc8-f0d0-11e6-b194-0fa3073a0d94','8524e5cd-1978-48c6-8a5f-ece86280c18a','DB_ID','ä¸»é”®','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0),('5963ec7a-f0d0-11e6-b194-0fa3073a0d94','1d3b63da-e3df-44dc-b225-18cb65c75f08','DB_ID','ä¸»é”®','',0,0,'',NULL,NULL,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0);
/*!40000 ALTER TABLE `plt_cor_data_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_def`
--

DROP TABLE IF EXISTS `plt_cor_data_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_def` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `ORG_DB_ID` varchar(50) DEFAULT NULL COMMENT 'æ‰€å±æœºæ„',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'ä¸šåŠ¡æ•°æ®ç¼–ç ',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'ä¸šåŠ¡æ•°æ®åç§°',
  `DATA_TYPE` varchar(50) DEFAULT NULL COMMENT 'æ•°æ®ç±»å‹(ä¸šåŠ¡æ•°æ® OR åŸºç¡€æ•°æ®)',
  `AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT 'æ˜¯å¦æ˜¯æƒé™æ§åˆ¶è¦ç´ , Y : æ˜¯; N : å¦',
  `TABLE_NAME` varchar(50) DEFAULT NULL COMMENT 'å¯¹åº”çš„æ•°æ®åº“è¡¨åç§°',
  `TABLE_COMMENTS` varchar(100) DEFAULT NULL COMMENT 'å¯¹åº”çš„æ•°æ®åº“è¡¨æ³¨é‡Š',
  `CURRENT_YEAR` varchar(10) DEFAULT NULL COMMENT 'å½“å‰å¹´åº¦',
  `TREE_TABLE` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦æ ‘å½¢ç»“æ„',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_DEF_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®å®šä¹‰è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_data_def`
--

LOCK TABLES `plt_cor_data_def` WRITE;
/*!40000 ALTER TABLE `plt_cor_data_def` DISABLE KEYS */;
INSERT INTO `plt_cor_data_def` VALUES ('1d3b63da-e3df-44dc-b225-18cb65c75f08',NULL,'kemu','ç§‘ç›®','common','N',NULL,NULL,'2017',0,1,0,0),('1e8530b3-ee00-4478-b5e7-5fbbd2696bc0',NULL,'guji','å¤ç±','business','N','',NULL,NULL,0,1,0,0),('23018554-c443-4568-ac66-4b4b7253a605',NULL,'test','æ–‡ç‰©','business','N','',NULL,NULL,0,1,0,0),('24a4e404-e74a-4c11-a5e2-dd8985087af6',NULL,'shipin','è§†é¢‘','business','N','',NULL,NULL,0,1,0,1),('8524e5cd-1978-48c6-8a5f-ece86280c18a',NULL,'agency','å•ä½','common','Y',NULL,NULL,'2017',0,1,0,0),('c19c8f10-672a-43ce-a95e-3f58bd71faa9',NULL,'orgcategory','æœºæ„åˆ†ç±»','common','N','plt_ogz_category',NULL,'2017',0,1,0,0);
/*!40000 ALTER TABLE `plt_cor_data_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_cor_data_event_r`
--

DROP TABLE IF EXISTS `plt_cor_data_event_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_cor_data_event_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®è¡¨ä¸»é”®',
  `EVENT_DB_ID` varchar(50) NOT NULL COMMENT 'äº‹ä»¶è¡¨ä¸»é”®',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®ä¸äº‹ä»¶å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®è¡¨TBL_WF_DATA_DEFä¸»é”®',
  `COLUMN_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®è¡¨TBL_WF_DATA_COLUMNä¸»é”®',
  `REF_DB_ID` varchar(50) NOT NULL COMMENT 'å¼•ç”¨æ•°æ®è¡¨TBL_WF_DATA_COLUMNä¸»é”®',
  `REF_COLUMN_DB_ID` varchar(50) NOT NULL COMMENT 'å¼•ç”¨æ•°æ®è¡¨TBL_WF_DATA_COLUMNä¸»é”®',
  `DATA_AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT 'æ˜¯å¦å¯ç”¨æ•°æ®æƒé™æ ‡å¿—ã€‚ Yï¼šå¯ç”¨ï¼› Nï¼šç¦ç”¨ï¼› é»˜è®¤N',
  `PROCESS_AUTH_ENABLE` varchar(10) DEFAULT 'N' COMMENT 'æ˜¯å¦ç”¨æµç¨‹æƒé™æ ‡å¿—ã€‚ Yï¼šå¯ç”¨ï¼› Nï¼šç¦ç”¨ï¼› é»˜è®¤N',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®å¼•ç”¨å…³ç³»è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `DEF_DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®è¡¨ä¸»é”®',
  `VAR_DB_ID` varchar(50) NOT NULL COMMENT 'å˜é‡è¡¨ä¸»é”®',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®ä¸å˜é‡å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `PARENT_DB_ID` varchar(50) DEFAULT '0' COMMENT 'ä¸Šçº§èŠ‚ç‚¹æ•°æ®åº“DB_ID',
  `ORG_DB_ID` varchar(50) DEFAULT NULL COMMENT 'æ‰€å±æœºæ„æ•°æ®åº“ä¸»é”®',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'èµ„æºæ ‡è¯†ç¬¦',
  `NAME` varchar(100) DEFAULT '' COMMENT 'èµ„æºåç§°',
  `URL` varchar(500) DEFAULT '' COMMENT 'è¿æ¥åœ°å€',
  `ICON` varchar(1000) DEFAULT NULL COMMENT 'èœå•å›¾æ ‡',
  `MENU_TYPE` varchar(20) DEFAULT NULL COMMENT 'èœå•ç±»å‹',
  `CREATED_DT` datetime DEFAULT NULL,
  `IS_LEAF` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦å¶å­èŠ‚ç‚¹ï¼Œ1 æ˜¯ 0 å¦ï¼Œé»˜è®¤å¦',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_MENU_ID` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŠŸèƒ½èœå•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_cor_menu`
--

LOCK TABLES `plt_cor_menu` WRITE;
/*!40000 ALTER TABLE `plt_cor_menu` DISABLE KEYS */;
INSERT INTO `plt_cor_menu` VALUES ('0aabb991-c046-4b96-ac4c-5dcb466c347e','0',NULL,'test_1','æµ‹è¯•èœå•','',NULL,NULL,'2018-01-15 14:20:55',1,0,1,0),('1','0','0','test1','æµ‹è¯•èœå•','',NULL,NULL,NULL,0,0,1,0),('1f4fa203-eeb7-4e8c-9801-f56ba5348c8d','a6057f5e-0f2c-4cbf-9d00-8ca244f3c822',NULL,'data','æ•°æ®å®šä¹‰','/data/toIndex',NULL,NULL,'2018-01-17 11:00:28',1,0,1,7),('2','1','0','one1','å­èœå•ä¸€çº§ä¸€','/open/a',NULL,NULL,NULL,1,0,1,0),('3','1','0','one11','å­èœå•ä¸€çº§äºŒ','',NULL,NULL,NULL,0,0,1,0),('31abffd8-6620-47c3-9836-0a36c0fdf560','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'category','æœºæ„ç±»å‹','/data/common/toIndex?code=orgcategory',NULL,NULL,'2018-01-16 15:45:56',1,0,1,5),('35ef152b-6c81-4210-b732-2d0f850429e6','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'rolemgr','è§’è‰²ç®¡ç†','/role/toIndex',NULL,NULL,'2018-01-19 09:59:01',1,0,1,12),('3bf4ea0a-bfd0-4f22-940b-62bcf01a7871','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'area','åŒºåŸŸç®¡ç†','/area/toIndex',NULL,NULL,'2018-01-16 14:20:59',1,0,1,4),('4','3','0','one2','å­èœå•äºŒçº§ä¸€','http://192.168.82.119:8080/artron-core/open/test2',NULL,NULL,NULL,1,0,1,0),('5','0','0','systemmgr','ç³»ç»Ÿç®¡ç†','',NULL,NULL,NULL,0,0,1,1),('6','5','0','menu','èœå•ç®¡ç†','/menu/toIndex',NULL,NULL,NULL,1,0,1,2),('60e01a58-ca78-41a3-a487-2b34d88f5009','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'usergroup','ç”¨æˆ·ç»„ç®¡ç†','/group/toIndex',NULL,NULL,'2018-02-01 10:58:53',1,0,1,16),('677392f5-7ffd-4648-b217-efa8e5492dc8','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'processInstanceMgr','æµç¨‹å®ä¾‹ç®¡ç†','/wkflow/processinstence/toIndex',NULL,NULL,'2018-01-23 15:35:04',1,0,1,15),('940274ad-32ae-4b77-90c8-d97b0edd88ba','f690acd5-48c0-41ff-bb1c-785c0e3c2389',NULL,'test_41','æµ‹è¯•èœå•41','http://image2.artup.com/artup-build/builder/wx/token/callback.do',NULL,NULL,'2018-01-15 13:23:03',1,1,1,0),('9cad12e1-798d-45ac-8c1d-eb8b278509fb','0',NULL,'organization','ç»„ç»‡æœºæ„ç®¡ç†','',NULL,NULL,'2018-02-01 10:58:53',0,0,1,0),('a6057f5e-0f2c-4cbf-9d00-8ca244f3c822','0',NULL,'dataMgr','æ•°æ®ç®¡ç†','',NULL,NULL,'2018-01-17 11:00:28',0,0,1,6),('b92ae0c7-d5a0-405f-8e60-70fef6d284ac','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'deployed','å·²éƒ¨ç½²æµç¨‹','/wkflow/deployed/toIndex',NULL,NULL,'2018-01-18 15:22:25',1,0,1,10),('bd38feb5-2626-40e0-a1c5-32dabba85cdd','0',NULL,'workflow','æµç¨‹ç®¡ç†','',NULL,NULL,'2018-01-23 15:35:04',0,0,1,0),('d132b431-f176-4ae1-9572-8169d03c207f','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'usermgr','ç”¨æˆ·ç®¡ç†','/user/toIndex',NULL,NULL,'2018-01-19 09:59:27',1,0,1,13),('d6dfc8b2-2d8e-4aef-9803-be866c727351','9cad12e1-798d-45ac-8c1d-eb8b278509fb',NULL,'orgmgr','æœºæ„ç®¡ç†','/org/toIndex',NULL,NULL,'2018-01-19 09:56:24',1,0,1,11),('ee8ee355-4870-417f-901f-b7e56522797c','bd38feb5-2626-40e0-a1c5-32dabba85cdd',NULL,'wfmodel','æµç¨‹æ¨¡å‹ç®¡ç†','/wkflow/model/toIndex',NULL,NULL,'2018-01-17 13:17:23',1,0,1,9);
/*!40000 ALTER TABLE `plt_cor_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_area`
--

DROP TABLE IF EXISTS `plt_ogz_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_area` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `CODE` varchar(100) NOT NULL COMMENT 'ç¼–ç ',
  `NAME` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `STATUS` tinyint(4) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `VERSION` int(11) DEFAULT '0' COMMENT 'ç‰ˆæœ¬å·',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_area`
--

LOCK TABLES `plt_ogz_area` WRITE;
/*!40000 ALTER TABLE `plt_ogz_area` DISABLE KEYS */;
INSERT INTO `plt_ogz_area` VALUES ('1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','NorthChina','ååŒ—åœ°åŒº',1,0,0),('54f42757-4057-451a-af79-5336d60074c1','EastChina','åä¸œåœ°åŒº',1,0,0),('b44f9c1a-faeb-444f-a5b5-c1e615f33d7f','NorthEast','ä¸œåŒ—åœ°åŒº',1,0,0);
/*!40000 ALTER TABLE `plt_ogz_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_category`
--

DROP TABLE IF EXISTS `plt_ogz_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_category` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `CODE` varchar(50) NOT NULL COMMENT 'å”¯ä¸€æ ‡è¯†',
  `NAME` varchar(100) DEFAULT '' COMMENT 'åç§°',
  `MASTER` tinyint(11) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸»ä½“; 1 : ä¸»; 0 : ä»',
  `MARK` varchar(500) DEFAULT '' COMMENT 'å¤‡æ³¨',
  `CREATED_DT` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_CATEGORY_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„åˆ†ç±»è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_category`
--

LOCK TABLES `plt_ogz_category` WRITE;
/*!40000 ALTER TABLE `plt_ogz_category` DISABLE KEYS */;
INSERT INTO `plt_ogz_category` VALUES ('1','mesum','åšç‰©é¦†',0,'',NULL,0,1,0);
/*!40000 ALTER TABLE `plt_ogz_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_group`
--

DROP TABLE IF EXISTS `plt_ogz_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_group` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'å”¯ä¸€æ ‡è¯†',
  `NAME` varchar(100) DEFAULT '' COMMENT 'ä¸­æ–‡åç§°',
  `DESCRIPTION` varchar(500) DEFAULT '' COMMENT 'æè¿°',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_GROUP_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ç»„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_group`
--

LOCK TABLES `plt_ogz_group` WRITE;
/*!40000 ALTER TABLE `plt_ogz_group` DISABLE KEYS */;
INSERT INTO `plt_ogz_group` VALUES ('850cf5ff-da81-441d-b85f-06ca10c423db','group1','æµ‹è¯•ç»„1','æµ‹è¯•ç”¨æˆ·ç»„','2018-02-01 16:03:05',0,1,0);
/*!40000 ALTER TABLE `plt_ogz_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_menu_group_r`
--

DROP TABLE IF EXISTS `plt_ogz_menu_group_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_menu_group_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `MENU_DB_ID` varchar(50) NOT NULL COMMENT 'åŠŸèƒ½èœå•',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·ç»„',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ï¼Œé»˜è®¤å¯ç”¨',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDINX_MENU_GROUP_R` (`MENU_DB_ID`,`GROUP_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èœå•ä¸ç”¨æˆ·ç»„å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `MENU_DB_ID` varchar(50) NOT NULL COMMENT 'åŠŸèƒ½èœå•',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT 'è§’è‰²',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ï¼Œé»˜è®¤å¯ç”¨',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDINX_MENU_ROLE_R` (`MENU_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²ä¸åŠŸèƒ½èœå•å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `PARENT_DB_ID` varchar(50) NOT NULL COMMENT 'ä¸Šçº§èŠ‚ç‚¹',
  `CATEGORY_DB_ID` varchar(50) DEFAULT NULL COMMENT 'æœºæ„åˆ†ç±»',
  `AREA_DB_ID` varchar(50) DEFAULT NULL COMMENT 'åŒºåŸŸ',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'å”¯ä¸€æ ‡è¯†',
  `NAME` varchar(100) DEFAULT '' COMMENT 'ä¸­æ–‡åç§°',
  `ENNAME` varchar(100) DEFAULT '' COMMENT 'è‹±æ–‡åç§°',
  `ORG_CODE` varchar(9) DEFAULT '' COMMENT 'æœºæ„ä»£ç æ ‡è¯†',
  `ORG_TYPE` varchar(50) DEFAULT '' COMMENT 'æœºæ„ç±»å‹',
  `PRINCIPAL_NAME` varchar(100) DEFAULT '' COMMENT 'æ³•äººæˆ–è´Ÿè´£äººå§“å',
  `PRINCIPAL_ID_TYPE` varchar(10) DEFAULT '' COMMENT 'æ³•äººæˆ–è€…è´Ÿè´£äººè¯ä»¶ç±»å‹',
  `PRINCIPAL_ID_NUM` varchar(50) DEFAULT '' COMMENT 'æ³•äººæˆ–è€…è´Ÿè´£äººè¯ä»¶å·ç ',
  `DESCRIPTION` varchar(500) DEFAULT '' COMMENT 'æè¿°',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `IS_LEAF` int(11) DEFAULT NULL COMMENT 'å¶å­èŠ‚ç‚¹',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_ORG_ID` (`CATEGORY_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_org`
--

LOCK TABLES `plt_ogz_org` WRITE;
/*!40000 ALTER TABLE `plt_ogz_org` DISABLE KEYS */;
INSERT INTO `plt_ogz_org` VALUES ('04e6b192-0257-41eb-b32b-2b327d349295','0','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','å•Šå•Šå•Š','è´¹ç“¦ç¬¦æ–‡å•Š',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:15:24',0,0,1,0),('0c1d0420-fdad-4640-a922-f7ef981b30ae','0','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','111','å‘é˜¿å°”è¿æ³•é—®å•Š',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:14:26',0,0,1,0),('41a0f6c3-8699-4663-883f-825630e6551d','0c1d0420-fdad-4640-a922-f7ef981b30ae','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','å‘è¿æ³•æœªå•Š','å‘é¢å¨ƒå¨ƒ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:14:25',1,0,1,2),('6c60550d-aaad-4061-8056-b72c277a00ae','04e6b192-0257-41eb-b32b-2b327d349295','1','1ccc7f5c-d923-4034-aecd-b4ccef9ea2c1','é˜¿å‘','å•Šæ‰“ç®—å‘å¤§æ°´',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-05 11:15:24',1,0,1,6),('abf8a6d2-e140-4fc2-8333-8783c82f04ff','0','1','b44f9c1a-faeb-444f-a5b5-c1e615f33d7f','org','ä¸€çº§æœºæ„',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-19 11:25:50',1,0,1,1);
/*!40000 ALTER TABLE `plt_ogz_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_role`
--

DROP TABLE IF EXISTS `plt_ogz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_role` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `ORG_DB_ID` varchar(50) DEFAULT '0' COMMENT 'æœºæ„è¡¨æ•°æ®åº“DB_ID',
  `CODE` varchar(50) DEFAULT NULL COMMENT 'è§’è‰²ç¼–ç ',
  `NAME` varchar(100) DEFAULT '' COMMENT 'åç§°',
  `MARK` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨è¯´æ˜',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` tinyint(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_ORG_ID` (`ORG_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_role`
--

LOCK TABLES `plt_ogz_role` WRITE;
/*!40000 ALTER TABLE `plt_ogz_role` DISABLE KEYS */;
INSERT INTO `plt_ogz_role` VALUES ('1','-1','user','æ™®é€šç”¨æˆ·',NULL,NULL,0,1,0),('2','-1','admin','ç®¡ç†å‘˜',NULL,NULL,0,1,0),('3','0','systemAdministrator','ç³»ç»Ÿç®¡ç†å‘˜',NULL,NULL,0,1,0),('ad30e8f6-0f3c-45d5-b04f-a58a09b98fad','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role4','æµ‹è¯•è§’è‰²4',NULL,'2018-01-25 18:40:00',0,1,3),('b5970414-00b3-49e1-85b7-4c845c76427a','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role1','æµ‹è¯•è§’è‰²1',NULL,'2018-01-25 18:39:27',0,1,0),('c4115e5e-04a4-4021-863b-d75c550682c0','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role2','æµ‹è¯•è§’è‰²2',NULL,'2018-01-25 18:39:38',0,1,1),('c63b8184-c7d1-4d34-90e3-dfc73e4a3721','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role5','æµ‹è¯•è§’è‰²5',NULL,'2018-01-25 18:40:14',0,1,4),('f566973e-2266-4fc0-abd6-853a0e4c3fa0','abf8a6d2-e140-4fc2-8333-8783c82f04ff','role3','æµ‹è¯•è§’è‰²3',NULL,'2018-01-25 18:39:49',0,1,2);
/*!40000 ALTER TABLE `plt_ogz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_role_group_r`
--

DROP TABLE IF EXISTS `plt_ogz_role_group_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_role_group_r` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·ç»„è¡¨æ•°æ®åº“è‡ªå¢ï¼Œä¸»é”®',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT 'è§’è‰²è¡¨æ•°æ®åº“è‡ªå¢ï¼Œä¸»é”®',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_GROUP_ROLE_R` (`GROUP_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ç»„ä¸è§’è‰²çš„å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `CODE` varchar(50) NOT NULL DEFAULT '' COMMENT 'ç”¨æˆ·IDï¼Œç™»é™†å',
  `NAME` varchar(100) DEFAULT '' COMMENT 'ç”¨æˆ·åç§°',
  `DISPLAY_NAME` varchar(100) DEFAULT '' COMMENT 'ç”¨æˆ·æ˜¾ç¤ºçš„åç§°',
  `USER_PASSWORD` varchar(50) DEFAULT NULL COMMENT 'ç”¨æˆ·ç™»é™†å¯†ç ',
  `ORG_DB_ID` varchar(50) DEFAULT '0' COMMENT 'TBL_CORE_ORGçš„ä¸»é”®DB_ID',
  `CREATED_DT` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER` (`ORG_DB_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_ogz_user`
--

LOCK TABLES `plt_ogz_user` WRITE;
/*!40000 ALTER TABLE `plt_ogz_user` DISABLE KEYS */;
INSERT INTO `plt_ogz_user` VALUES ('00651061-a87e-4ac9-9c54-737002f49aaf','user3','æµ‹è¯•ç”¨æˆ·3',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:16',0,1,0),('1','test','æµ‹è¯•ç”¨æˆ·','','c4ca4238a0b923820dcc509a6f75849b','-1',NULL,0,1,0),('2','admin','ç®¡ç†å‘˜','','c4ca4238a0b923820dcc509a6f75849b','-1',NULL,0,1,0),('22604b77-eef9-4ffe-ade5-59b810ce7f9a','111','111',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-02-02 11:50:36',0,1,0),('3','eric','Eric','','c4ca4238a0b923820dcc509a6f75849b','0',NULL,0,1,0),('8953750f-92f8-4cf9-9be7-9e3b5444b6fa','user4','æµ‹è¯•ç”¨æˆ·4',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:28',0,1,1),('c567ca3b-7c95-422a-a025-2d93e43a98a5','user1','æµ‹è¯•ç”¨æˆ·1',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-22 10:56:04',0,1,0),('d2965713-bb42-40c1-a689-73e9907f214b','user5','æµ‹è¯•ç”¨æˆ·5',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-23 10:42:42',0,1,2),('f2b7cdf4-a689-4006-8c83-f6a2accd837b','user2','æµ‹è¯•ç”¨æˆ·2',NULL,NULL,'abf8a6d2-e140-4fc2-8333-8783c82f04ff','2018-01-22 11:02:15',0,1,0);
/*!40000 ALTER TABLE `plt_ogz_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_ogz_user_ext`
--

DROP TABLE IF EXISTS `plt_ogz_user_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_ogz_user_ext` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `CORE_USER_DB_ID` varchar(50) NOT NULL COMMENT 'ç³»ç»Ÿç”¨æˆ·è¡¨ä¸»é”®',
  `OFFICIAL` tinyint(11) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨ç¼–: 1 åœ¨ç¼–; 0 ä¸åœ¨ç¼–; é»˜è®¤ 1',
  `CAUID` varchar(200) DEFAULT '' COMMENT 'CAè¯ä¹¦å”¯ä¸€æ ‡è¯†',
  `EMAIL` varchar(50) DEFAULT '' COMMENT 'é‚®ä»¶åœ°å€',
  `SEX` varchar(10) DEFAULT '' COMMENT 'æ€§åˆ«: "ç”·", "å¥³", "æœªçŸ¥"',
  `BIRTHDAY` date DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¥æœŸ',
  `OFFICE_PHONE` varchar(20) DEFAULT '' COMMENT 'åŠå…¬ç”µè¯',
  `MOBILE_PHONE` varchar(50) DEFAULT '' COMMENT 'ç§»åŠ¨ç”µè¯',
  `QQ` varchar(50) DEFAULT '' COMMENT 'QQ',
  `WEIXIN` varchar(50) DEFAULT '' COMMENT 'å¾®ä¿¡',
  `IDEN_ID` varchar(50) DEFAULT '' COMMENT 'èº«ä»½è¯å·',
  `CREATED_DT` date DEFAULT NULL,
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿç”¨æˆ·æ‰©å±•è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `USER_DB_ID` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·è¡¨æ•°æ®åº“ä¸»é”®',
  `GROUP_DB_ID` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·ç»„è¡¨æ•°æ®åº“ä¸»é”®',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER_GROUP_R` (`USER_DB_ID`,`GROUP_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ç»„ä¸è§’è‰²çš„å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'æ•°æ®åº“ä¸»é”®',
  `USER_DB_ID` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·è¡¨æ•°æ®åº“ä¸»é”®',
  `ROLE_DB_ID` varchar(50) NOT NULL COMMENT 'è§’è‰²è¡¨æ•°æ®åº“ä¸»é”®',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ1 å¯ç”¨ 0 ç¦ç”¨ é»˜è®¤ä¸ºå¯ç”¨',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_USER_ROLE_R` (`USER_DB_ID`,`ROLE_DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·ä¸è§’è‰²çš„å…³è”è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `NODE_DB_ID` varchar(50) NOT NULL COMMENT 'æµç¨‹èŠ‚ç‚¹è®¾ç½®è¡¨ä¸»é”®(TBL_CORE_ACTIVITY_NODEçš„DB_ID)',
  `ASSIGNEE_DB_ID` varchar(50) DEFAULT '' COMMENT 'èŠ‚ç‚¹å‚ä¸å€¼DB_ID',
  `ASSIGNEE_ID` varchar(100) DEFAULT '' COMMENT 'èŠ‚ç‚¹å‚ä¸å€¼ID',
  `ASSIGNEE_NAME` varchar(200) DEFAULT '' COMMENT 'èŠ‚ç‚¹å‚ä¸è€…åç§°',
  `ASSIGNEE_TYPE` varchar(10) DEFAULT '' COMMENT 'èŠ‚ç‚¹å‚ä¸è€…ç±»å‹: USER, ROLE, GROUP',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å·¥ä½œæµæµç¨‹èŠ‚ç‚¹å‚ä¸è€…è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_wkf_assignees`
--

LOCK TABLES `plt_wkf_assignees` WRITE;
/*!40000 ALTER TABLE `plt_wkf_assignees` DISABLE KEYS */;
INSERT INTO `plt_wkf_assignees` VALUES ('0cfe1e4d-b679-421e-ae39-d0598b3dc322','f9367c6a-0fd0-4e8a-bb32-d307caae716a','f2b7cdf4-a689-4006-8c83-f6a2accd837b','user2','æµ‹è¯•ç”¨æˆ·2','user',NULL,1,0,0),('5cae033c-a2d3-4e14-b0ab-2d441b2765ef','629e1abd-daad-4d89-b083-9e7416f79861','1','user','æ™®é€šç”¨æˆ·','role',NULL,1,0,0),('8ef4ff17-fb9b-4e73-936c-c43018b99ff4','7beafd74-f9d5-4efd-be21-3a4811c92c64','8953750f-92f8-4cf9-9be7-9e3b5444b6fa','user4','æµ‹è¯•ç”¨æˆ·4','user',NULL,1,0,0),('971c3e14-4e0e-41fb-aa51-51499582c26c','acbe4871-35a9-4ced-8e24-4be29d640336','00651061-a87e-4ac9-9c54-737002f49aaf','user3','æµ‹è¯•ç”¨æˆ·3','user',NULL,1,0,0),('d0d6eb98-b232-4ffa-ba2e-d0ba0b17dc30','eea4101f-2fba-436f-b645-3e20031aca09','c567ca3b-7c95-422a-a025-2d93e43a98a5','user1','æµ‹è¯•ç”¨æˆ·1','user',NULL,1,0,0),('f7e1a912-f918-4991-a2c7-0f2eb2d08ab9','1d34004b-10d8-4c31-a516-26ee75ca65b2','d2965713-bb42-40c1-a689-73e9907f214b','user5','æµ‹è¯•ç”¨æˆ·5','user',NULL,1,0,0);
/*!40000 ALTER TABLE `plt_wkf_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plt_wkf_back`
--

DROP TABLE IF EXISTS `plt_wkf_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plt_wkf_back` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `PROCESSDEFINITION_ID` varchar(100) NOT NULL COMMENT 'æµç¨‹æ¨¡å‹ID',
  `PROCESSINSTANCE_ID` varchar(100) NOT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `ACTIVITY_ID_FROM` varchar(100) NOT NULL COMMENT 'é€€å›æ—¶çš„æµç¨‹èŠ‚ç‚¹ID',
  `ACTIVITY_NAME_FROM` varchar(200) DEFAULT NULL COMMENT 'é€€å›æ—¶çš„æµç¨‹èŠ‚ç‚¹åç§°',
  `ACTIVITY_ID_TO` varchar(100) NOT NULL COMMENT 'é€€å›åˆ°çš„æµç¨‹èŠ‚ç‚¹ID',
  `ACTIVITY_NAME_TO` varchar(200) DEFAULT NULL COMMENT 'é€€å›åˆ°çš„æµç¨‹èŠ‚ç‚¹åç§°',
  `OPERATOR` varchar(100) NOT NULL COMMENT 'æ“ä½œï¼šBACKï¼ˆé€€å›ï¼‰ CANCEL (æ’¤é”€) ',
  `IN_USE` char(1) DEFAULT 'Y' COMMENT 'æ˜¯å¦æœ‰æ•ˆï¼ŒY æœ‰æ•ˆï¼Œ N æ— æ•ˆ',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æµç¨‹å›é€€æ“ä½œæ—¥å¿—è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `PROCESSDEFINITION_KEY` varchar(100) DEFAULT '' COMMENT 'æµç¨‹å®šä¹‰å”¯ä¸€æ ‡è¯†ç¬¦',
  `PROCESSDEFINITION_NAME` varchar(200) DEFAULT '' COMMENT 'æµç¨‹å®šä¹‰åç§°',
  `ACTIVITY_ID` varchar(100) DEFAULT '' COMMENT 'èŠ‚ç‚¹ID',
  `ACTIVITY_NAME` varchar(200) DEFAULT '' COMMENT 'èŠ‚ç‚¹åç§°',
  `ACTIVITY_TYPE` varchar(50) DEFAULT '' COMMENT 'èŠ‚ç‚¹ç±»å‹',
  `FORM_URL` varchar(100) DEFAULT '' COMMENT 'ä¸šåŠ¡è¡¨å•URL',
  `IS_MULTI_TASK` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦ä¸ºå¤šå®ä¾‹ä»»åŠ¡',
  `IS_SEQUENTIAL` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦é¡ºåºæ‰§è¡Œå¤šå®ä¾‹ä»»åŠ¡',
  `MUL_INS_COMPLET_CONDITION` varchar(20) DEFAULT '' COMMENT 'å¤šå®ä¾‹ä»»åŠ¡å®Œæˆæ¡ä»¶',
  `TASK_LISTENER` varchar(500) DEFAULT NULL COMMENT 'äº‹ä»¶ç›‘å¬å™¨,JSONæ ¼å¼',
  `VARIABLE_EXPRESSION` varchar(500) DEFAULT NULL COMMENT 'å˜é‡è¡¨è¾¾å¼ï¼ŒJSONæ ¼å¼',
  `CREATED_DT` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `STATUS` int(11) DEFAULT '1',
  `VERSION` int(11) DEFAULT '0' COMMENT 'å¹¶å‘ç‰ˆæœ¬æ§åˆ¶',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ’åºç ',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å·¥ä½œæµæµç¨‹èŠ‚ç‚¹è®¾ç½®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plt_wkf_node`
--

LOCK TABLES `plt_wkf_node` WRITE;
/*!40000 ALTER TABLE `plt_wkf_node` DISABLE KEYS */;
INSERT INTO `plt_wkf_node` VALUES ('1d34004b-10d8-4c31-a516-26ee75ca65b2','processDemo','æµç¨‹æµ‹è¯•','five','ç¬¬äº”æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('37b5fb5c-420d-48b3-b968-f9314dc0ad7a','processEric','æµ‹è¯•æµç¨‹11111','one','ç¬¬ä¸€æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('629e1abd-daad-4d89-b083-9e7416f79861','process','processName','one','ç¬¬ä¸€æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('7beafd74-f9d5-4efd-be21-3a4811c92c64','processDemo','æµç¨‹æµ‹è¯•','four','ç¬¬å››æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('9a404605-43f4-4570-8523-098e999986e0','process','processName','three','ç¬¬ä¸‰æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('acbe4871-35a9-4ced-8e24-4be29d640336','processDemo','æµç¨‹æµ‹è¯•','three','ç¬¬ä¸‰æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('b3717ef0-1387-45af-aedd-a0e84d8d8224','processEric','æµ‹è¯•æµç¨‹11111','two','ç¬¬äºŒæ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('b47d133c-80da-4008-9deb-d89a936e1eaa','process','processName','four','ç¬¬å››æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('c3992f1c-89d3-4c4c-a44e-9640367ed690','process','processName','two','ç¬¬äºŒæ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('eea4101f-2fba-436f-b645-3e20031aca09','processDemo','æµç¨‹æµ‹è¯•','one','ç¬¬ä¸€æ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0),('f9367c6a-0fd0-4e8a-bb32-d307caae716a','processDemo','æµç¨‹æµ‹è¯•','two','ç¬¬äºŒæ­¥','userTask','',0,0,NULL,NULL,NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `plt_wkf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_core_datasource`
--

DROP TABLE IF EXISTS `tbl_core_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_core_datasource` (
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `DS_KEY` varchar(100) NOT NULL COMMENT 'æ•°æ®æºæ ‡è¯†å',
  `DB_TYPE` varchar(50) DEFAULT '' COMMENT 'æ•°æ®åº“ç±»å‹',
  `DB_NAME` varchar(50) DEFAULT '' COMMENT 'æ•°æ®åº“åç§°',
  `DRIVER_CLASS` varchar(100) DEFAULT '' COMMENT 'æ•°æ®åº“é©±åŠ¨ç±»',
  `JDBC_URL` varchar(100) DEFAULT '' COMMENT 'æ•°æ®åº“è¿æ¥åœ°å€',
  `JDBC_USER` varchar(50) DEFAULT '' COMMENT 'æ•°æ®åº“ç”¨æˆ·å',
  `JDBC_PASSWORD` varchar(50) DEFAULT '' COMMENT 'æ•°æ®åº“å¯†ç ',
  `INIT_POOL_SIZE` int(11) DEFAULT NULL COMMENT 'æ•°æ®åº“è¿æ¥æ± åˆå§‹å€¼',
  `MIN_POOL_SIZE` int(11) DEFAULT NULL COMMENT 'æ•°æ®åº“è¿æ¥æ± æœ€å°å€¼',
  `MAX_POOL_SIZE` int(11) DEFAULT NULL COMMENT 'æ•°æ®åº“è¿æ¥æ± æœ€å¤§å€¼',
  `STATUS` int(11) DEFAULT '1' COMMENT 'çŠ¶æ€: 1 å¯ç”¨;  0 ç¦ç”¨; é»˜è®¤ 1',
  `TAB_INDEX` int(11) DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `IDX_DSKEY` (`DS_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®æºè®¾ç½®è¡¨';
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
  `DB_ID` varchar(50) NOT NULL COMMENT 'ä¸»é”®',
  `TITLE` varchar(200) NOT NULL COMMENT 'æ ‡é¢˜',
  `SENDER` varchar(100) NOT NULL COMMENT 'å‘é€è€…',
  `RECEIVER` varchar(1000) NOT NULL COMMENT 'æ¥æ”¶è€…',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT 'å†…å®¹',
  `SEND_TIME` datetime DEFAULT NULL COMMENT 'å‘é€æ—¶é—´',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `STATUS` int(11) DEFAULT '0' COMMENT 'å‘é€çŠ¶æ€ã€‚1ï¼šå·²å‘é€ï¼›0ï¼šæœªå‘é€',
  PRIMARY KEY (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç³»ç»Ÿä¿¡æ¯è¡¨';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å˜é‡ç±»å‹è¡¨';
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

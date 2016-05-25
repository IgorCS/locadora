/*
SQLyog Ultimate v8.71 
MySQL - 5.6.27-log : Database - locadora
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`locadora` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `locadora`;

/*Table structure for table `acessorio` */

DROP TABLE IF EXISTS `acessorio`;

CREATE TABLE `acessorio` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `acessorio` */

insert  into `acessorio`(`codigo`,`descricao`) values (1,'AIR BAG');

/*Table structure for table `aluguel` */

DROP TABLE IF EXISTS `aluguel`;

CREATE TABLE `aluguel` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataDevolucao` datetime DEFAULT NULL,
  `dataEntrega` datetime DEFAULT NULL,
  `dataPedido` date DEFAULT NULL,
  `valorTotal` decimal(19,2) DEFAULT NULL,
  `codigo_apolice_seguro` bigint(20) DEFAULT NULL,
  `codigo_carro` bigint(20) DEFAULT NULL,
  `codigo_motorista` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_q8mog1g15tj6hm075vvtayjm3` (`codigo_apolice_seguro`),
  KEY `FK_7tfqjpwf3qufolosmv6i6xt3v` (`codigo_carro`),
  KEY `FK_qbeeb3y1mascjv4xcthko6cjt` (`codigo_motorista`),
  CONSTRAINT `FK_7tfqjpwf3qufolosmv6i6xt3v` FOREIGN KEY (`codigo_carro`) REFERENCES `carro` (`codigo`),
  CONSTRAINT `FK_q8mog1g15tj6hm075vvtayjm3` FOREIGN KEY (`codigo_apolice_seguro`) REFERENCES `apolice_seguro` (`codigo`),
  CONSTRAINT `FK_qbeeb3y1mascjv4xcthko6cjt` FOREIGN KEY (`codigo_motorista`) REFERENCES `motorista` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `aluguel` */

/*Table structure for table `apolice_seguro` */

DROP TABLE IF EXISTS `apolice_seguro`;

CREATE TABLE `apolice_seguro` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `protecaoCausasNaturais` tinyint(1) DEFAULT NULL,
  `protecaoRoubo` tinyint(1) DEFAULT NULL,
  `protecaoTerceiro` tinyint(1) DEFAULT NULL,
  `valorFranquia` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `apolice_seguro` */

/*Table structure for table `carro` */

DROP TABLE IF EXISTS `carro`;

CREATE TABLE `carro` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `chassi` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `dataModificacao` datetime DEFAULT NULL,
  `foto` longblob,
  `placa` varchar(255) DEFAULT NULL,
  `valorDiaria` decimal(19,2) DEFAULT NULL,
  `codigo_modelo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_f8lqr70qkd0l54r8qy7h7mmd6` (`codigo_modelo`),
  CONSTRAINT `FK_f8lqr70qkd0l54r8qy7h7mmd6` FOREIGN KEY (`codigo_modelo`) REFERENCES `modelocarro` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `carro` */

insert  into `carro`(`codigo`,`chassi`,`cor`,`dataCriacao`,`dataModificacao`,`foto`,`placa`,`valorDiaria`,`codigo_modelo`) values (1,NULL,'VERMELHO','2016-02-26 12:02:12','2016-02-26 12:02:12','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z%!1!%)+/..383.7(-.+\n\n\n\r\Z-& %-0.+--+0/-----------/-/---+--/----------------/+--ÿÀ\0\0º\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0L\0		\0\0\0\0!1AQ\"aq‘2±BR¡ÁÑğ#Sbr‚’¢Òá3“²CDƒÂñ$%4Tcs£ÃâÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\05\0	\0\0\0\0\0\01!AQ2aq‘¡±Ñá\"BRÁğ#3’ñ4ÿÚ\0\0\0?\0÷\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0@\0 \0€\0^\0@\"©ˆE÷G‰EÑe	<‘^¦×Ã/½ˆ¤<j ûdkG™¢ÃÕyEø2éoÅáÿ\0Î§üÑ¯dÿ\0‹_ğ—ƒ\Z:Mÿ\0Îaÿ\0Ï¥üÑ¯dÿ\0‰_ğ—ƒ%§·0­îâhŸ\n´ÏÛ\ZñæUáë,àün–%İuoá&èÍÂK4K$¨@\0 \0€\0@\0 \0€\0@£µèPÿ\0ª©à	í\Z™YN1Í›ÑÃU«Ğ‹~&-nšR×«¥Q»È	ş¢&NºàwÇDÔûš^e\n7©Ãß½Hÿ\0öJíÙºÑã\"/ïË^År“ Ì-sÈÄøv]hš|ÉK›ÕoºFÙ“ş•–ÔéêPÈÕ€$æ)b2·ºı,£ÎJ«r’Ñ¶¶åçîr;[ÚÖ ’( ¦¼\Z©ÎŞ6QõÈÚIäl° ¯Qş‘Ìc}£ãŞù±¬*ySıòmQó#i€§øúû˜˜’U©ïb+Ôñzñ1±“Ì‡¤ğĞè§Ü­ìUùA?ìªŸÙW¦aø¿\":Pû´ªA,¨Øç©¥Tä×ÀÀ•şƒşø–Ù#¤¥×ãğ9V¿Ğó6H…¤eÉÿ\0Ûà¶¯æ‰ev™Ô´Óü<şã}ò±ûdl:Í›?OÒ¬M\nb1­¸r§önTùÆÊk&Oú®êòOÓyì>Ì:~ØâpõìjªæJ« ª³¶°q¿Múè-4§)e#ƒ‡¢–Öƒ¼x®_¿Ñ&§œ\0@\0 \0€\0@\0 \r©P(,Ä\0,I°\0o$ğJM»#ÊzcíG´Ø|.FŒÀå·ë9÷<kõfMÊYnG¡QÃï©õKñà»_ÃÊv§H±u¯Y•‹XŠd­Û½ıöµ¤ğ’©EÔÒç¹=UÉnù$Ãì¦qr*Ö<Mê9>Ct½’9eVréI¾óSfôV»{˜:âÛ˜-ZgÖãÔC·±©(äíŞ/hVS”±«Iª\nY*ÍbÁ:‘šúÜ	JQµÑê`´…UR4æõ“ioÍ_¯Üê0ìmnò·Ğ1_NCé’İ¼å¶¾ÌjÌÕKş¢Ûx_t^úo®YUŒ]š0­ƒ¯^›”eª­¹[{å¿ÌVÙı¥v[ë¯kO=~¹èd|d¤äî÷NÏöiŒtZ‰M™]C#*Ñ\0†å‰ã*AZ·Eİn¯^  ğd¶àXñ¤‹ƒC`t%±mù\'©”­V¥@”¯Ä/fî{”x‘\0Ôéo³ŠX%¤ımJ¡ÉO`#*‹èE÷“ºÍl¬>6›Ö\\ô– .®s)FâTèl\rüVH¶ãßÿ\0»83şíHÿ\0ÃCöÈ±]TE[¡Û=ıìÿ\0¬I°1v¿³<©4)uU-Ù±sLL¥‡xİßÜóª›‘ÍJ¥ ¦ãU`lwñVàÏÃbják)VÉR‘ÍI†ë7qR.û¤¿©R©©+µuÅs_ÙuãĞ¾–SÇR¾‰YGå©ò;³/5ø_Âñ	ßsÍâ°»$§xK\'ú}hèæ‡@\0 \0€\0@\0 Å=¤ôÙ±U„r(#e¯Q7ÕpÃ¦ycîµ-­ØtëlU—K‹åÕÛÏ–\\Éğ;\nËÀTÚé¯\\‰ÿ\0f¦EÖ›½–˜+ÅË0$ğ\0÷™c’÷Üy6ËBÎÕ	,×µÎòÍ«1ïÔz™%¡=›ìŞ§†Ö5I¨|=Ôşö¥Yœ˜ïhÛcä¸\Z†ÕjZÄ=K‚Ã½T;~Ì –óÇ6=zŒÊjTwJ\"ÔÃ»0@\n¢äØnş•yY[™íè|6µGU­ÑËµÿ\0y£¦¦Öïe:óĞë9gÒÍjÁ™œ`K\rü=7Ìu\\™ÖëÆŒşÜsÕ,­ \'2ø6¿Q¸ò¥\'x#át…5Dµr{×ÍÑê½é\'ıØÔK~R“µ%:\\RaŸ7u®ê;ÂÉ–ãˆãúE‹\raÅîl8S[¨øß¹ß	aØr’I7vFĞv£SÌJXÕ¢¤’éÍ—]§ÖéÎÒ›¶©ŞšTú\'#|Wíõ„B=£ÙÆÖùN“v§z/ÇT¶[öw•(|äƒ¦\'¸~< ¨‚İßÃ\0òî™QÉ©ÉÂ8İÅ@\'ÕL£$ÀÛ˜º–e÷ÓTïWîï‚9½•¶jáª¦\"“ÊEø‚7j8ï±î2*ÇïY£ÓÀW[ğõ7ÆYu?Ÿ[uŸDôgnÓÆPZÉ¿uEú-k‘á¨ ò\"^œÔÕÎ|^Xzš.š5¥ÎP€\0@\0 \0€æ¾×ºbh¨ÙØwµzÊMgZ4w?M·ZR¯~ãX=E¯Ç‡¿w¾Ã+ÙoDÔ*ã*-”áP÷µ>{»îyIffw·­¯¦ÒÄUà.”ïÿ\0Ê|¤\"\"pŠ4ÙÈP¹±ĞZûÎšIeÏ§(RTUEUTr\n, •2<ëÚÃ\Zˆr‚E¥OMİe`ÎAäB­õ^ÛÙ¥*r©5-ìápô‚\0œµcÍãá8g\'\'sî°ØxÑ„iÇ†}oûôZÂÔÔÑô™3Z½TÆ*‘Ÿ¯\\wÚcïc¦½8jk¿ï›|˜Ø¶]\n×VĞß^Òù{ş³»Úm>\'ÊéxBQŒáö»>ıë÷âZØ¸óM™AÒ¢å> Ü}£Ît´xBâ®X±7¸î¥¾²	¸t¹Ğwé\"ä»?jÓ£UjŸ)9_´ ¯˜$I°*.ÕV¤Ô‚;ŞÖ*¬lA½ôò,.ktg¥XÌ:‰B˜¡V-T È@ •À\\Üoİ\ZFáqØi›AÜ•6›ûmá`¶“`z_C}¢S¬\r<c¥\ZŠ.*ÉN İnÑì¾»¸ënPU£§[s\rW•zn½R)epF`Õ	¿\"=d4Š;^ˆßU?xJØç\'µÅ1Yº¶VGí}ê|ïäDº.™µìç¥m‚Åv&‹Ùj\\ß³ÁüTßëg3ÿ\0jWáıè{ĞoCQô–O®Ş’õ>ŠV\rÁÔ¸‰Ôx-XX\0 \0€\0@+¤Ÿâ=[«,¥³ªSgK†¦­©,\'-¯q}\r¡´Š¹$s˜¿jT¨;SÄQÈ~OòŠL•:Ä©pÅiö‘9ÊxZ.^Y%€Ç¾\'[ˆ%«®{oíq<²¨Â2•İÏ¥0U¢äW(Ê¤e*-¢•ù¶%LO=¦cşQµ1\ZİUÖ‚øS\ZßµÖ9dh²+&  ˜‘`5:k¸C%\'\'e¼ê6GM¶ª0*õ*¯®½ƒûOfô2’œªÄTèÁ÷îõ,m©Z¹g¬@£ÕÒùT°ä]‚…@Ä`57å©S[r>‹GèØáo9o—§a^	ˆ×Kê~é‘êEîŞ3Oª½Ù®´ÖÚ± A{Ÿ	h™VšQ·¹v³7…©¸ƒ—MÚFãn\"Úœei^•Y-ëvì³Mdû82L3ö´½Á#Q­¬F›÷€<æÑ¨“LókájT„ãlÓ¶õÚºóV ¡†¨ö4éÔp}Òˆì<siÚå›>bz³èÅø~ò70Øiÿ\0wQúOL×ú¥HÑ˜‰f­Ú×êäX¾ˆbë6w©MtµĞNÒ»hò7ˆ«ÆKÏØj{=o‰·‚ğeëõGC>3òù\'Ï©U¼\0evï‘²ĞÔ¸Éù{Sèoj­âËö,®ŞF«Da×?‚æ¢8U*½¸öÈõµ£m2ëEaViø¿rOîî|ÃçR§óJígÌÕhÜ2û<ß¸aá7üoüÒ6’æh´~ğB†üĞıçûãi>dÿ\0†ül\\7Ğş7şhÚÏ˜z7\nşÅæTÆìŠ(½b™wÄéÄÜî³©)+3L6\n†zĞVï»»ĞM¨R	P–ÏEjPskT9¦ß”kË‘®õÏ˜ÒnSQdß_~gi6<ğ€\0@\0 Ç°ıÚ»7TR¤Ø¼ZPdt)æb×ÊìmlmpÖàÈjå%Wíkõ˜†I¥•˜&{ç(YšÄ_-³µFİš× 	{)Óİ5f`à1‚ÜY³‚49­`o~ÚYšS¡:›¢“ªïùZÌ·7;L§€¹Ü<ŒÆUy#Ò£¢.ÿ\0Ü—‡÷è×£±°êK2gbIbæ÷$Ü’7qå2u¦ø½-†‡Û~İÿ\0Eúlª, (ä\0	“wÌô!ÁZ*İ‚š²‘5k›r×îüx@Í“SÆ‘áß™ô±ùœÖo¥>9Pç}ü$Ï+”¥yíwR÷~–;]ƒ¥Ø¦W=G\nÆ£XªfPáréÀ¯©ås0ŒSI«Üò±ÚR»œ¡NVKw[ Ú-*Tê\r%¦úuuRá.wfŞ,t,yÍ§E5¸æÂéjšÚıKÍu¢‡GñÖ¥Õ1íRg¦Fë7UòR£ÊesÜŒVô²OË5äÑ~¶ĞE÷™G‰¨”ªíÚCç OÀH-b¥N‘Óá˜ù¾	±]úEÉ™€@û}¸ õ?tXöF×V§ˆë*\ZLˆ¯I‘UˆPß•`âálomc¾oE+³ÉÒõ%FÙ;ßõû#Û8ÕZT*Ğ®jŠmİ)`Œ 6P of[c“‰¹‘Z)4[D×”á%,•­æc«Wé}Cî˜Øõn7ûJ§Óú‡İ\'X–†4›ç¬RÖËØÍ›}÷n¶²RE\'Rq¶¬oŞ•¼E¯Š[\\VÎyuet×[“áÃŒ8®bZıQ·z~‡[ìÿ\0mµA„Ã‹gÃÕ*wP¹È@ù !+åëÕ	¦¬|¶+	8Ôr¶çw»‡·Qí“cÎ\0 \0€\0@8_i] jj0´™Åê!w6>C¾aZvÜ_EáTå´–K.ßƒÂvÎ\r\Z°k]˜‚Ä›è€€™Fm+¥\\-9U×k±y°^İ›k§ô2šÌêØS|¨àé-Ÿ166³¼Xê,9È»-\Zp\\KO´|áñøH³4ÚEq\";Q7ën:F«´R¹±OP¤±;®lF¼\0_‰’éµ™”1tæíwØı‡&0òŞyş8ZCFÑ‘5,Eˆ,...9\"A{•±4.”\\h4Ğo÷Oqò&EÚŞbéÁ¤ëw/ÇÜÙŞô?¤²*Öª©€¤9¬E\\¨1ì°\0nÓKßYÕF²jÌğt–Œ©\nt÷§âI´q”ºï”V¬‚šêÁj6\"š½–ó5u\"–gOZR¶«]§RÚuZ¥ZlÕÔ{h/Qœ<„å{÷ŸM†¼oÁ/Ú^I°[[ªS–š\'ßqšÂÇ@§N7ò“j¢+áöÒZÒi.p6×6…!f;:‹jÅ®7ïç\ZİD,4¸Ô“ÜÖ|üJøİ¤õm›(Ë{\ZÚüO!¦á!É³J4cJú­ïæU5d\\oYà•™Heb¬5VRCÌ¨„ìRqŒÖ¬•Ğúø§sš¥Fvİ™Ø±°Ü.Nènù‘N¦­eÔ3<\Z\\3@¸g‚n8<‚niôWòl]<GĞe\'–[öôç—0ó’«LÂ­V…óYuğ¿yôà7ÔNóã€\0@\0 ì\0$›©\'pŒçş—íáˆ¯R²Ë7c[öF‹õ8g-i\\û%\rŸ†¯Š,Ù€ğ¿İ%#9U“JQÈÕÏ–‘¸¿ÖÖöEEI÷‰6İ~şÒK|Œ©Smım¾ÒÒÓ—:ÔRÀµ –•¬Bñc©âyË>F1›‘uF’Œê[•‡Zã©¾·EÉV•2{H;ÈºŸ–×ó“s\'F7vnô#Ú{-hf±ı!oôı²S3•æÙ—GAÇ¾ıÚzK3:KUu’ç•6¸™ \\/áxÀ¸°H@@(M‹	DÍšúè2Û…ûÃjÂ1›–[¼Ë”ösëï°h~¼¥i3èN„cºì¥îz°úÔû\rõ©Ôİâ™ñØÚ{<Dã×ä÷£r\\å\0 \0€Ÿ×)³qn»Å\n€y‹}²³è³l?ü±í>dÃW9lO	ÏR®ô{Ú?*éÆyçİğ6Ò‡e‡ º±&ixSü|d•EÔ Ê«1@\Z$‚ti—ğNumÇİû †fãöQ¦ÿ\0¢Û‰àyyË\\ËSêíõ+TÂÛqbÎ“à4PnQr6r0­ÊF²-²õÀ·(Ö,¨È‘v{r‘¬YPd‹³\ZF±e‡d«²Ìk—XaN¼Àx›F³”#Ò~b*Ğú`ş¯káyÈNŸfÿ\0BTdù´ÜşÆ_õÚAtãöÅ¾ëzØµJWÑP¨;Îöò¶ƒÆğMßnış^æ—H1ôÂ\nK–à²ÚÊ\0´¹ËcĞ}‹bóàª\'æë°_To‰i×Aı\'Ìéˆ¥ˆºâ—±ècÊ\0 \0€ŸR-³q€oê*‘û*OÙ\"JêÆ”§©5.GÌ”é€\0ÔŸ/‡)WMÂÕÙUŒ¼{8œ‡ÕqH%0Kƒ!»! ›…o¯ -sã¨HCY~7èEjæòı°lFS¿Ï”¼è«n8ğÚVjV«—>EáRâsd}’’¹%Xúu$“«Å‰¹«GUpH;œjGˆã üŞåZu…ÈÍõÃÌ\rFKƒñWó¿­À£ÍÇŒƒMgÎ>Üagüååÿ\0îEº†³ü£áò4ÕçˆAàï2lùæ¿?ÿ\0£œqÈ±#U‘µäü½ˆkb(yê7›éq%&Œç*Rék>÷îELá¯u IıQñ¹–´ßrº˜*nú±¿[_²UÅ÷pÙ|l?åv2|ÈzO\rœWgÀÚ›a‡æ“ÅÇÚÒËùKNRY?î%§QÍ–µ0F×ò!oõË,;9§§ øIø{‹V•F÷ª“ã™¾&_aÖsKM>óø)â])É°ìéõ;ÌÍizÏ~ª·¹ìÁj^†\'ÿ\0qªI4re4¬µ§Ôz”Øò‚\0@\0 ‹ö½ŒdÙÎ‰ïVztGxfÌÃÍP8šâpéeÃ„¦i¦aŒ¨Ê‚´•Á75Æà¶Š*0¤Å’ä!\"Ä€HÔp?tä’´š>›RU(ÆK•Ÿqc*t)Hxx±}pÏ\Zã^¤X¬ª]Xz>şàÄı£ÒtQ[JNõTy/R³ÒfÜ	š`í™ˆÔÓ ‚»¯ËúNjĞâ}‰Å6¶Rá—gÇ¡uÚbzí–“c7 ë96#]–°4óŞì@]Ní<I:nï–7,lF:wK{ä‰…*Gu[ø6o‚Kª=g´ÃNÚß §Ïê?Í-°\\Ìe¦*ğŠó÷BŒ\r?Ò>Ÿt•F&RÒ˜‡•—w½Ì¼eR®V |ç,oä“²#)cñïô^‡OÑ^6*ˆ¬@3#U°*{Á;ˆ;øËjG‘“ÄÖyÍø²Ş;fapõ:šÕŠÔ²¶Pµ\rƒ°U\' °¹2Æ-·™¯C£¸f`j;€Á®nF›ï¨#Æ%ÃlÌb«©WJnBêW|2¸êÓuÒû¯»Xo´Ş†-%£_.„µ&=öÌ¿€yî’ªÛp\'Òßõõ€mæ€díUÍQ9-Ù¥dí¼Ş”u–ªÍ¿ïSÚ}‚Ò¶ÜëıÚjæ™ÑÉšWuX®Q_³ÓæÇ˜\0@\0 /¶\Zdàè·ÅĞfîµø°€q5°qV’Ù‹©ÊÃò£)Q˜[[­´¾šx@9°e\\‚‰¤Ét\nÀvÔj¬ [B	\"×˜VØÑUìİ&í}ë·‰—S\nÃzŸÇ§=ÏvÏ‘§ø:|d‘ôˆh÷EÆ¢\ZhEÈt‘\nûÎ;Áş:©tOšÒ?ı¸½…ÀÕd.ˆì««2‚@çé48J{A.u÷“Ş·Çê‘%ucZ5]*Šk+jˆ¸œY_¬¤”£“Ş2ĞVÃJÉ*â>‚_¬§ôÔâ¿7¦îš<m!\rJ‘¨;c°íö}’Ô²±ËIÍIqF¸i¡Ä  0ÿ\0ÙÒ£I±4+ºSVêëR.Ê µ:€<Òõ€uïØ´ë> ÖÃ5VËr\nT`Vö+”7ıB”zA°©¨EGªù§ˆ| °|¨Õ½ÕÌ €\r‡@!>Ò6zÔğ*Å0é«33C’.ÌÄ÷±<`ïL½¡®6ÉÍ¦«†5s°+}Ê\rA#*ä—XĞ«,¢ü\Z®.ñrE÷¾UÕ‰Ó\rˆ—ÛnÖDq|—ÔıÒºà˜h‰¾”’óöImöğo9”ê9¦GÒ¢õ³g½{Á\Z{9X‹\Zµ*T×ˆ¸P|A:(¯¤ğôœ¯‰—U—‘ÛÍ\0€\0@\0çúy²Î\'ˆ ¢ìS=?×¦C¨%@ó€y.(â”–.ôiÕV9‚0Î	UárË~â9À9~‘bjå¥J·ø”ó†70Íd}7”›w÷À0p;_i«‡ÌÁUjŒÂìÙF¾ğßÀÊJœ_ª–6½.Œ·uï=Gntk·4±+ú¬>Ñ„ÉĞäÏN–™YT‡·ÉËTÙ _#ú„<¿Òe(ÉfJ\"…_øå¿–^EVÂ‘ÈøöO¨û¥76’ëşşàdãè•¨\r´uúÔŸ±‡¤ê¢÷Xùí/IÆ¤gÍz?“Ğ«áŠahRkÑëJo\nÔŞ©¿\"ÅlZly)¶èRZïÔ¸zOqu.aï¨æ_v–\"‚r3R;Ğéú§vùÍZ6w>‡EWÖ¦é¿·.ÆOecÓÖ¼X«˜ÜúƒÄ‚%“kz1­U¬‹tÚ–lâÊÇŞŞ/ÇQb&Êªâ&z2YFjİÌ˜â“éâû£l¹Z.|d¼ı†jş/÷HÛuZ+œü¾Fÿ\0h[P=clùZ.dü?ôcí<½¬#£(ñoÇàoÊªÌ|‡İ*êK™´t}Æıì2Ôo¤|I®o™Ñ5”€åÁ9áêe‘Ñ\Z\rd¬+a2ûî©â@øÚ¾H™jÃ¥$»Èšµ¾°6ß–çáye	¾ÅácEİ¿ĞvB£Šjä±½®ÂûüJJìµn\Z¬Ô ÷¾¦t]èúâ±t°¥Â‡$±Şr ,Ù{ì-}ÚùD åØW¥‡‹IŞ\\½Ï£p´š-4U*¸v¥cäå\'&äód·‚¡x\0/\0BĞ—€Dõà±8ën€xwKvm|6&¥l\"¸§T—e@[#r2ëÙ¹$r½¸«P’Î¯˜ês+\\fğ\nØ ÊáÂµÆ«¡ß¸@4XïV©¿XÔö¥a¡!Çé‹ÿ\0õÊJœ_®:½.Œ»òJ¸Ä©k«+uÔÜA×B4\'„¤ijÊé ±u\'<ÓYXôºUiç9Hë;\nà“ª‚m`t½™¬Fı	±æ®ŞØK‡ …Y˜Š‹˜±àPƒamaìV8{C»qñç+8ë+8Jû\Zª|8ö\Zc}Aûgµ¯Ù©+¢Õ€íó­åıcX«¡ÖX^‹?Óşë\ZÄl2dè‘âÍè#YŒy‹[£´iÿ\0‰W/qeø^JÖ–HÎ¬èRéÊİÿ\0¡´önéûßÒ_e3é,$r»î÷±£†Ø¸SÄyÜı²Û	qfRÓWF¾ß&Æ£˜^-è|o%P\\Y”´ÔşØ%ıÜh7EpÍîTtò¦Şz¬¶Â&2Ó8—•—w»g¶º!µÑSUk\'Í4úºmûHÖ·‘ieJyiL³›ôô8í·ÆĞuLWZŒÃ2†bn·\"âÄâÖ—QKÍ*Õ%Ò“}ìÌÄÒ:MÔxé&v°©NÉr=â-à·¹õ#ĞÀ.`»= ,u×ëï´†®Z3”rv=+Ø^ŸÕ¢¹\'\\õ*ú¨I%O|\0PĞ¼o\0	€0˜l`êÀ(×¥xn#^+fÂ‹ŒØj~hô€`ãv!\0ÂÅì‚8@2ë`H€T|9IÃbQÅ2¨KÔE¨ÆÙW³Õ©·“»ºÊ{ =\'Ø&ŸY‹V•2Ó¨¹®ÉQÖâ¤#k{‚’Å€lÛÈÀ,l=¬)\0µAeé×A¥¸0«G[z=Œ•ØGgQ^<ñètôz]…÷Ëa3Òz[\nø¿Jı8 =Õ\'Êß\'c37¥pİ~VÒéµGi.Nll[Èn3HQ·HàÄéYOé¢­Öóø9ÃŠ$–bI;É7\'ÄÍÏ!¶İÙ*b»àim`èm·`\Zxn”0Ş`\Z¸~™¼À2úg´(ãh˜\n´ÉjDñ¿¼„ò6`@8•£(k}!¬bÆçúx\0³InBrÄ\0\0¹7;€ä“`è/f;äX^ØµjÄ=a¿-…’ÿ\0Doï-\0í’´ex \0¦\0Ó\0a2À!t€W©JV®F¶ŸˆÁ@2±[0LnÅî€`âöI 6%rp•ij”J,½bµ‡ˆ= úH*Q§ˆ¤âôêbEL;_SŸ¬©T[’¸_óŒ¬Úúóä| 8Ïú²Z\0–€\0\0p&\0àLEà‘ ÉØó€ Ùdñ0x}„Oõ@:®ŒlæÃ¾t÷¹•ù.< —²ö‹3HC†«xúFe 0‘\0i€1’Ò€@ô`ªaàëa 1.èV/fß„ƒé6¦\Zªâ)ö~kòî¿qİä şÙÚõq«@²€, i{û\r{ UÛ§®øAì|?â`¹0Ìë@À0Æ\"áO(‹‚< &\0ò€X§³”Õ-Ç„ı\r‚Ç„S\rÑ¶ú0\rœFO(æ£öá\0ÛÂì° \ZtpÖ€\\Jp	•`\0û@Ğ\"\0„@Ğ•€4¤NQ€DØx„€T«³ï\0ÌÚJªQÔw‚ FÒöV¤–¡U“ôXfG|·³B_7†/@j.ñ\0‘z\Zã„Uè“}©ÑFú0ú(ßFj—DÏ(Ê=< èô<r€_¡Ñ5 èôiê;\0¹Kf(á\0²˜!Ê:áÄU£\0xHÂÀÖ€,\0€€% 	hhZ\0™`V\0ÒšP4`\r4 	òa\0iÂPÛg©á\0aÙkÊ\0ßì´å\0_ìÅå\0Q³—”Ã\09@0c”ã q\0p£\0p¥\0p§\0PË\0pXÚ\0Z\0°€\0\0@@\0@\0H\0 \0€\0@\0@\0@ÀÀÀ\0X\0 ÿÙ','ODD-0021','500.00',1),(2,NULL,'CINZA','2016-02-26 15:28:56','2016-02-26 15:28:56','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0	\Z!\Z\"$\"$ÿÂ\0\0³\0Õ\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0Ù@\0\0\0à\0xJ\0xÅW©Ş mšJ:?RÆ*½Ç3Ş9®8ş^L<b«Ñ>ù¬¦ÕzŸ1pñqó1u[&¦xÅÅñú½³<y%®Ñ*~GEÇÌÚ»óÚU“S2Úh\\<`²Ï\\»Ìö•dÔÌ¶·?vyE®Í$c–[µ¤g´«&¦e° Gáv»Ôùóİ–íií*É©™l§Hø]®õ>|÷e»ZF{J²jf[iÒ~k½OŸ=ÙnÖ‘Ò¬š™–ÀZt…ÚïSçÏv[µ¤g´«&¦e° Gáv»Ôùóİ–íií*É©™l§Hø]®õ>|÷e»ZF{J²jf[iÒ~k½OŸ=ÙnÖ‘Ò¬š™–ÀZtÁŠØl=FQeŸ“˜9ÍLË`-:A\rJô…—Ñh”àìĞÌ¶Ó¤G@Cz¬³£²Û§b\"¸;-3C-€²ÎCz¬¶Oh>{²Ù|c;-3@Ëk6“eì´Í\0Íê€\0´\\f€\0\0\0\0\0\0\0ÿÄ\0)\0\0\0\0\0\0\0\0 435!0P`ÿÚ\0\0ÿ\0Hç5´İÄ·‘­äky\ZŞF·‘­äky\ZŞF·‘­äky\ZŞF·‘§)ı.s[IŒS—÷Y®Ò^DÅÈ˜¹\"bäL\\‰‹‘1r&.DÅ—	^,f\'½¬¤„ÕVµ­ssšÚLbœ¿ºÉ#¥•‘ª‹şD\rsëKõ¥úÒıi~´¿ZNÓmh‰²6É	ª­kZÒxë&Ns[IŒS—÷Y$sĞãM=f·2+ü¨<6.¦s[IKRÊ¤&ªµ­j5ºyV¦1Xg9­¤¥§9Î¬‘QëlÅ±Ô)ô¡åHàTdïŠ\rä‹y\"ŞH·r©eRUZÖµ\Zİ<¨a ãX »8jïeıxn>lë#ŠpÂ@>\ZÅÙÃW{ ØÙ%AŞGl\\-±p¶ÅÂÛÖ‹|a(<6ëxeÃÂÛl\\-³à.µƒb‚ìá«½•»ÌoŸ­Pxl]LëX1Ö(.Î\Z»Ù[¼Áöğ¹úÕ†ÅÔÀ.µƒb‚ìá«½•»ÌoŸ­Pxl]LëX1Ö(.Î\Z»Ù[¼Áöğ¹úÕ†ÅÔÀ.µƒb‚ìá«½•»ÌoŸ­Pxl]LëX1Ö(.Î\Z»Ù[¼Áöğ¹úÕ†ÅÔÀ.µƒb‚ìá«½•»ÌoŸ­Pxl]LëX1Ö(.Î\Z»Ù[¼Áöğ¸Òµ·íˆCş€ÅÄ<|“W$ÕÉ7à.°$ĞuÉ5rM\\“W$Õ|‘æ!`™“á«½•»ÌoæRšÔIjIõ?›º×/˜!–gk”¬ìc^÷>£	9jïenóÛR”Ö¢KûRL÷¨£|®Ô¶!-ˆKbØ„¶!|Ö³AÉâÛÙI¨Õgc\Z÷¹õIÈC[ ‹]ì­ŞaëøÎIjIõo•ÂÚ”Q²&æZÛ5bl¥/{ŸQ„œ„5º³ÕŞÈI‘Übå‡\\°ë–rÃ®XuË¹a×,:å‡\\°ë–à.²IÈC[ ‹úu@ÄL~ÄÕ±5lM[VÄÕ±5lM[VÄÕ±5lM[VÄÕ±5[@)ğn‚/øÿÄ\0;\0\n\0\0\0\0\0\0 14r\"s‘±Á!#23Qa‚“¢0R£ÑáAqƒP`’ÿÚ\0\0?ÿ\0„›Œ•V9Xåc•V9Xåc•V9Xåc•V9ig•7.oiVç”ğ\"ÈOé®ö…×{Bë½¡uŞĞºïh]w´.»Ú]í®ö…›\råÇ¹¡R)V´-#% $¦y~DÜd¹½¥[V‘ZGÁ|O‰,î[ùY²2è~Õ÷í~Õ÷í~Õ÷í~Õ÷í~Õ÷í~Õ÷í~ÔİN—úÿ\0kJ;¢7jÍhk\Z´”Ï*Á™=•æã%Íí*Üò´ŠæÙÉÛü(ñâè‚ˆ— ™„\'cà*ÍÆJPÇ‰YÑ´”Ï*›ù¦÷Û±QÛ;K;:fÛjÍÆJPÇ‰SqšÒs•®YÙ¹ıÎR\r`¹Gl›Ë\rÛ²3E­¤¬j±ªÆ«\Z³¢=h	)U7óMï·b›7}FÜ”_?Ú°õ#yù,ÂÃU©ÒphmªllİõjQ|üjÃÔåñ1%\r®‡È\\å*íïwå]½îü«·½ß•v÷»ò£ÄeNl7¦{23F%\"{ƒ¥Ò!]½îü«·½ß•v÷»ó‘ª7‡\Z´_?Ú°õ#yG\nƒŒo«IÔ»vFa	Øø\n­Q¼8Õ¢ùø&Õ‡©Ê8Tc}ZN¥Û²3NÇÀUjáÆ­ÏÁ6¬=HŞQÂ ãêÒu.İ‘˜Bv>«To5h¾~	µaêFòßV“©vìŒÂ±ğZ£xq«EóğM«R7”p¨8Æú´K·df€ªÕÃZ/Ÿ‚mXz‘¼£…AÆ7Õ¤ê]»#0„ì|V¨ŞjÑ|üjÃÔå*1¾­\'RíÙ„\'cà*µFğãV‹çà›V¤o(áPqõi 	“	Û•Ş/ş\nk_9ÎYŒ¥C¶} ¯p¶…{…´+Ü-£#Sç°ó»J½ÂÚîĞ¯p¶…{…´(?ü|ÉÏ3–Vv&¹Ğb4v–Õ‡©Ê8Tc}I3H­\'O¸.ÀŸˆÖj‡ã–P˜\\³©/Îî,È,ş¤‘š›&ıFÊõ#yG\nƒŒoÉ&i¤é÷Øl6—äHw”+¤s£úa\\èş˜W:?¦ÎéŒQ~4q%)g6jn¢Ñ‡úÂĞ¡ÑÚ;L0³ °KúZFjll›õßÎ»¾Í•aêFò\rİIÓî°,Øm.=È:ï(Y°Ú\Z;¾CTY\'.U£¤{JÒ3Scdß¨Ø¦şuİöl¯R7•œéÊ_Âêâ“ıĞ‹°.„]t\"ì¡`]»èEØB.ÀºvĞ‹°.„]t\"ì’ll›õßÎ»¾ÍŸ%…,Ağ€›XOòUÎ‘é•s¤ze\\é™W:G¦UÎ‘é•s¤ze\\é™W:G¦UÎ‘é•s¤ze\\é™W:G¦UÎ‘é•s¤ze5¦¡ãS:îû6Ğ?ÿÄ\0*\0\0\0\0\0\0\0\0Q±ğ !1a¡ÁÑAñ0q‘áP`ÿÚ\0\0?!ÿ\0·C4DHw6^œr½8åzqÊôã•éÇ+ÓW§¯N9^œr½8åzqÊôã•éÇ)Ñø?n†h\0H(§\0˜¤ÿ\0¥K…RáT¸U.K…RáT¸U.K…ûp—S’ßx~§\0P«šDâœ(Ÿ·C4\0O$S€DûìİƒØ1(&@‚ì/|V^®ÿ\0aºÜDDCN†jöÚ›LQW4‰Å8Q*!9€]m·C4\0O$S€Dûìšf.bw”ÿ\0åï7úDH’I\'U2S²6èf±éPWØ£UÍ\"qN\0”J»Á£Ë#\rÜ»Ûº›‘²Û¡šÇ¥A>éfŠààá—¾®0ÀÑ\0&\Z¢‰°Æ,úS Šb	›ÆAzsÊôç•éÏ(˜Îl¯±F(«šDâœ(•vƒG–ZáãÇ]›‘ùÓ ´i›3s(HË8‡7¾Â×ÿ\0,ìÜ mÄa;pqŒ	û³$’Hçn±G~”È\'Ì œØçfI$›™·Û7#h­0¨pY¢ÇÒ™©Ù&æmöÍÈÚ«L*h±ô¦AjvI¹›}³r6êÓ\n‡š,})Z’nfßlÜ z´Â¡Áf‹Jd§d›™·Û7#h­0¨pY¢ÇÒ™©Ù&æmöÍÈÚ«L*h±ô¦AjvI¹›}³r6êÓ\n‡š,})Z’nfßlÜ z´Â¡ÁdÍ€Àó{¢—XP@#ÈÑœ¸ø´,Ï<ós+´™„?vgyş´—»Áw u z´Â¡ÁÔ$°”üÎÉñ{aø,*dmMÌª:ºª1lÙì›4ß¼a,\00f€©¦ş¼Y«L*$°”üÎÉñ{aø, SO`_ sŸÜ?Pg3(Ÿ$*OeIì©=•\'·I¹•‘‡LÇU¤y\'êwà…€ÃÂp4Â?×…vƒG—´V˜E	‰Cõ>!ïl Ÿå„\niìôsû‡êö‚new2RíŠ|‹‘¸\nšaëÂ»Á£Ëü\0ÊBó.9Ä&ƒ›eZn«MÕiº­7U¦ê´İV›ªÓuZn«MÕi¿I¹šaëÂ»Á£Ëü ¶H|•\'²¤öTÊ“ÙR{*OeIì©=•\'²¤öTÊ“ÙR{*OdÎQÜ™·˜Ş®Ã0hòÿ\0ğÿÚ\0\0\0\0ÿ\0ÿ\0ÿ\0ÿ\0óÿ\0ïø€;ügáş\'òÏ\0ãmïû×½{y÷>ñïçŞ=üûÇ¿Ÿx÷óïş}ãßÏ¼û÷?8p”\">ü×ÿ\0¯ü\0ÿ\0ÿ\0ÿ\0ÿ\0ÿ\0ÿ\0ÿ\0ÿ\0ÿÄ\0\'\0\0\0\0\0\0\0!\01AQa qğ0@‘ÁP`ñÿÚ\0\0?ÿ\0„d/ÊİLµ¬\"`6ÏæxñãÇ<xñãÇŒL±g‰¿+u0vÖ°œšÀ»ã/ÉdrnfÁWNQí@(-?ßÅ,²Ë,²Ë,yêÎ		Z„¥´N{GöCãL:¾Æİäß‰cÃ÷ñŒ–v’¿?¿+u0vÖ°œšÀ»ã/ÉdrnfÁWNKU”††øùŞò{	›´|m¯8•‰š£CòÎO^^føõªªª²çmLÚÖò#Ë4føŒ&#W¼¨‰Y{É¿Ç‡\Z9ïã,í%~rÏ[’)[Íu>¶Bü­ÔÁÛZÂrkì?Œ¿&‘É¹š<O]9-VR\Zãç{ÃÀŞæW$ŒÇ„FÑ$Zlák¢UíÏªéêXÈ_•º˜;kYó)½ŸÃ/ólt.]è:½\ZÉ¿Ç‡\Z9ïã,í%~rsËVÊ£°ÚŒ“‚@\\+#€ŠJ =G2ån¦ÚÖ|ÊAïgğËüÆJü­\\ÁÑzÉJå!¾#Î÷Ÿtÿ\0XTêR¥”„ëL–É‚$€PC\0H’ÿ\0ªéˆ\"\nË0ğz<xDJ@mŒ1±Ğ¹w êôk&üKhç¿Œd³´•ùÈyÏ-[*Ãj2NCByÎm1R„›ŸÑ“€}WOZƒ­‡,¡\rv”ß9\r	ç9´ÄQJnœx2	—)p@‰$´úH ‚7Ï…H!cS_ãêºf‚¢ø€‚6¯wûDAÅ\'\0P°¯Õtıµ‡œBÂ¿UÓöÖRp\nıWOÛXqIÀ,+õ]?maÅ\'\0P°¯Õtıµ‡œBÂ¿UÓöÖRp\nıWOÙXqIÀ,•D€\r¹÷õŠ5Lş6dºcIƒ{R€RtR½M¶Ùİ Ÿj;ô¶ÛmûP#†¢¦Q=9¸ñJZˆ…„ØŒŞU·\'ß<ñª{ÉQ5—\r{à\\¹¿ek’öí§ÛÆ}WoÄp.Ş ŠT’¥Kq’¦Ylº­ª£W’¢øX`GoWŞI0jt{\Z5Òw›LM„£ãÖBÂl	F\0ï*Û“oxÕ=ä¨šË†½ğF®\\ß²µÉ{vÓíã#¯›HJè%-£>\'—ìÇó\'¸ÁDğ‡ÉÅ\nùU}w.\\¸wÏHşô10LtaÁ®†GØ$ìÖÄÈñÅNwÆJ‹á`e½_y$Á©ÑìhÖCJyŞm16Œ;Œ‡ŒğÁ²¬i6±$zÀ(\0DIÔÉQ5—\r{à\\¹¿ek’öí§ÛÆG_6 •ĞJ[F|O/ÙæOqˆëæ„°»Xmü\'.\rQ4aW1xsŒ:îÚ®2IƒS£ØÑ¬†”ó¼Úbl%wáƒeXÒmbHü\0‘® ”˜S§œ©Bç!­,÷óùÚµjÕ«V­Zµjt4§æÓa(Ã¸ÈxÏ*Æ“kGá\"ÕRaò~{—.\\¹råË—.\\¹q\rC$(JcÙ19áƒeXÒmbHÿ\0 ÿÙ','OIL-0027','1000.00',4);

/*Table structure for table `carro_acessorio` */

DROP TABLE IF EXISTS `carro_acessorio`;

CREATE TABLE `carro_acessorio` (
  `codigo_carro` bigint(20) NOT NULL,
  `codigo_acessorio` bigint(20) NOT NULL,
  KEY `FK_dd1hc1axf8n7r5krgcda8i3a7` (`codigo_acessorio`),
  KEY `FK_pirutmmcekvihmnfjdoetlcuu` (`codigo_carro`),
  CONSTRAINT `FK_dd1hc1axf8n7r5krgcda8i3a7` FOREIGN KEY (`codigo_acessorio`) REFERENCES `acessorio` (`codigo`),
  CONSTRAINT `FK_pirutmmcekvihmnfjdoetlcuu` FOREIGN KEY (`codigo_carro`) REFERENCES `carro` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `carro_acessorio` */

insert  into `carro_acessorio`(`codigo_carro`,`codigo_acessorio`) values (1,1),(2,1);

/*Table structure for table `fabricante` */

DROP TABLE IF EXISTS `fabricante`;

CREATE TABLE `fabricante` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `fabricante` */

insert  into `fabricante`(`codigo`,`nome`) values (1,'FIAT'),(2,'VOLKSWAGEN');

/*Table structure for table `funcionario` */

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `matricula` varchar(255) DEFAULT NULL,
  `codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_i0ix46mgqa5nyykpg41wvp8jw` (`codigo`),
  CONSTRAINT `FK_i0ix46mgqa5nyykpg41wvp8jw` FOREIGN KEY (`codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `funcionario` */

/*Table structure for table `modelocarro` */

DROP TABLE IF EXISTS `modelocarro`;

CREATE TABLE `modelocarro` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `codigo_fabricante` bigint(20) DEFAULT NULL,
  `tipo_combustivel` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_27s43k64pb8b3smfvt4ixs6q7` (`codigo_fabricante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `modelocarro` */

insert  into `modelocarro`(`codigo`,`categoria`,`descricao`,`codigo_fabricante`,`tipo_combustivel`) values (1,'SEDAN_COMPACTO','PÃLIO',1,'ALCOOL'),(2,'SEDAN_MEDIO','SIENA',1,'FLEX'),(4,'ESPORTIVO','GOL',2,'FLEX');

/*Table structure for table `motorista` */

DROP TABLE IF EXISTS `motorista`;

CREATE TABLE `motorista` (
  `numeroCNH` varchar(255) DEFAULT NULL,
  `codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_qixyrk70x7tiq4qggy5tm4ku7` (`codigo`),
  CONSTRAINT `FK_qixyrk70x7tiq4qggy5tm4ku7` FOREIGN KEY (`codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `motorista` */

/*Table structure for table `pessoa` */

DROP TABLE IF EXISTS `pessoa`;

CREATE TABLE `pessoa` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pessoa` */

/*Table structure for table `tab_carro` */

DROP TABLE IF EXISTS `tab_carro`;

CREATE TABLE `tab_carro` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `chassi` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `dataModificacao` datetime DEFAULT NULL,
  `foto` longblob,
  `cidade` varchar(255) DEFAULT NULL,
  `renavan` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `valorDiaria` decimal(19,2) DEFAULT NULL,
  `codigo_modelo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_jwu3s12ol33rxb1marmhc4x88` (`codigo_modelo`),
  CONSTRAINT `FK_jwu3s12ol33rxb1marmhc4x88` FOREIGN KEY (`codigo_modelo`) REFERENCES `modelocarro` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tab_carro` */

/*Table structure for table `tab_veiculo` */

DROP TABLE IF EXISTS `tab_veiculo`;

CREATE TABLE `tab_veiculo` (
  `cidade` varchar(255) NOT NULL,
  `placa` varchar(255) NOT NULL,
  `anoFabricacao` int(11) DEFAULT NULL,
  `anoModelo` int(11) DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`cidade`,`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tab_veiculo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

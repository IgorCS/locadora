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

insert  into `carro`(`codigo`,`chassi`,`cor`,`dataCriacao`,`dataModificacao`,`foto`,`placa`,`valorDiaria`,`codigo_modelo`) values (1,NULL,'VERMELHO','2016-02-26 12:02:12','2016-02-26 12:02:12','����\0JFIF\0\0\0\0\0\0��\0�\0	( \Z%!1!%)+/..383.7(-.+\n\n\n\r\Z-& %-0.+--+0/-----------/-/---+--/----------------/+--��\0\0�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0L\0		\0\0\0\0!1AQ\"aq��2�BR����#Sbr�����3��CD���$%4Tcs�����\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\05\0	\0\0\0\0\0\01!AQ2aq������\"BR��#3��4��\0\0\0?\0�\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0@\0 \0�\0^\0@\"��E��G�E�e	<�^���/���<j �dkG����yE�2�o���\0Χ�ѯd�\0�_�\Z:M��\0�a�\0ϥ�ѯd�\0�_�%��0���h�\n���\Z��U��,��n�%�uo�&���K4K$�@\0 \0�\0@\0 \0�\0@���P�\0���	�\Z�YN1͛��U�Ћ~�&-n�R׫�Q��	��&N��w�D���^e\n�7��߽H�\0�J�ٺ��\"/��^�r���-s���v]h�|�K���o�Fٓ������P���$�)b2���,��J�r�Ѷ����r;[�� �( ��\Z���6Q���I�l� �Q���c}������*yS��mQ�#i���������U��b+��z��1��̇����ܭ�U�A?쪟ٍ�W�a��\":�P���A,��穥T������������#�����9V���6H��e��\0�����ev�Դ��<��}��dl:���?OҬM\nb1��r��nT���k&O�����O�y�>�:~��p��j��J������q�M��-4�)e#����փ�x�_��&��\0@\0 \0�\0@\0 \r�P(,�\0,I�\0o$�JM�#�zc�G��|.F����9�<k�fM�YnG�Q���K��_��v�H�u�Y��X�d�۽������E���=U�n�$��qr*�<M�9>Ct��9eVr�I��Sf�V�{�:�ۘ-Zg���C���(���/hVS���I�\nY*�b�:����	�JQ���`��UR4���io�_���0�mn���1_NC�ݼ嶾�j��K���x_t^�o�YU�]�0���^��e���[{忁�V���v[�kO=~��d|d�����N��i�tZ�M�]C#*�\0���*AZ�E�n�^� �d���X�񤋃C`t%�m�\'���V�@���/f�{�x�\0��o��X%��mJ��O`#*��E����l�>6��\\���.�s)F�T�l\r�VH����\0�83��H�\0�C�ȱ]TE[��=���\0�I�1v��<�4)uU-ٱsL�L���x������J� ��U`lw�V���bj�k)V�R��I��7qR.����R��+�u�s_�u��о�S�R��YG��;�/5�_��	�s�ⰻ$�xK\'�}h��@\0 \0�\0@\0 �=��ٱU�r(#e�Q7�pæyc�-��t�lU�K����ϖ\\��;\n���T��\\��\0f�E֛���+��0$�\0��c���y6�B��	,׵��ͫ1��z�%��=��ާ��5I�|=����Y���h�c�\Z���jZ��=K�ýT;~� ���6=z��jTwJ\"�û0@\n���n��yY[���|6�GU��˵�\0y�����e:���9g��j���`K\r�=7�u\\���ƌ��s�,��\'2�6�Q��\'x#�t�5D�r{�����\'���K~R��%:\\Ra�7u��;�ɖ���E�\ra��l8S[���߹�	a�r�I7vF�v�S�JXբ���͗]��������ޚT�\'#|W���B=�����N�v�z/�T�[�w�(|䃦\'�~<������\0��Qɍ���8��@\'�L�$�ۘ��e��T�W����9���j᪦\"��E��7j8��2*��Y���W[��7�Yu?�[u�D�gn��PZɿuE�-k�� �\"^����|^Xz��.�5��P�\0@\0 \0��׺bh���w�z�MgZ4w?M�Z�R�~�X=E�Ǉ�w��+�oD�*�*-��P��>{��yIffw������U�.���\0�|�\"\"p��4ٍ�P���Z�ΚIeϧ(RTUEUTr\n,��2<���\Z�r�E�OM�e`�A�B��^�٥*r�5-��p�\0��c͏��8g\'\'s��xфiǆ}o��Z��ԏ���3Z�T�*����\\w�c�c��8jk��|�ض]\n��V��^��{����m>\'��xBQ����>����Zظ�M�AҢ�> �}��t�xB�X�7�����	��t��w�\"�?jӣUj�)9�_� ��$I�*.�V�Ԃ;��*�lA���,.ktg�X�:�B��V-T �@ ��\\�o�\ZF�q�i�A܏�6��m�`��`z_C}�S�\r<c�\Z�.*�N��n�쾻��nPU��[s\rW�zn�R)epF`�	�\"=d4�;^��U?xJ؍�\'��1Y��VG��}�|��D�.����m��v&��j\\߳��T��g3�\0jW���{�oCQ��O�ޒ�>�V\r�����x-XX\0 \0�\0@+���=[�,���SgK����,\'-�q}\r����$s��jT�;S�Q�~O�L�:ĩp�i��9�xZ.^Y�%�Ǿ\'[�%���{o�q<���2��ϥ0U��W(ʤe*-����%LO�=�c�Q�1\Z�Uւ�S\Zߵ�9dh�+&  ��`5:k�C%\'\'e��6GM��0*�*�����Of�2������T�����,m�Z�g�@����T��]��@�`57�S[r>�G���o9o��a^�	��K�~��E��3O��ٮ��ڱ �A{�	h�V�Q��v�7�����MڐF�n\"��ei^�Y-�v�Md�82�L3����#Q��F���<�Ѩ�L�k�jT��lӶ�ں�V ����4��p}҈�<si���>bz����~�70�i�\0wQ�O�L���Hј�f�����X��b�6w�Mt���Nһh�7����K��j{=o�����e���GC>3��\'ϩU�\0ev�Ը��{S�oj����,��F�Da�?���8U*�������m2�EaVi��rO��|��R��J�g��h�2�<߸a�7�o��6��h�~�B��������i>d�\0���l\\7��7�h�Ϙz7\n���T��(�b�w�������)+3L6\n�z�V�����M�R�	P��EjPskT9�ߔkˑ���Ϙ�nSQd�_~gi6<��\0@\0 ǰ�ڻ7TR�ؼZ�Pdt)�b���mlmp���j�%�W�k���I���&{�(Y��_-��Fݚ� 	{�)��5f`�1��Y��49�`o~�Y�S�:��������Z̷7;L����<��Uy#ң�.�\0ܗ���ף���K2gbIb��$ܒ7q�2u����-���~��\0E�l�,�(�\0	�w��!�Z*݂���5k�r���x@͓SƑ��������o��>9P�}�$�+��y�wR�~�;]���ئW=G\nƣX�fP�r�����s0�SI����R���NVKw[ �-*T�\r%��uuR�.wf�,t,yͧE5����j����K�u��G�֥�1�Rg�F�7U�R��es܌V��O�5��~��E��G������C� O�H-b�N�����	�]�E���@�}� �?tX�F�V���*\ZL��I�U�Pߕ`��lomc�oE+����%F�;���#�8�ZT*Юj��mݐ)`��6P�of[�c����Z)4[Dה�%,���c��W�}C���n7�J�����\'X��4��R���͛}�n���RE\'Rq��oޕ�E��[\\V�yuet�[��Ì8�b�Z��Q�z~�[��\0m�A�Ëg��*wP��@��!+���	��|�+	8�r��w���Q�c�\0 \0�\0@8_i] jj0�����!w6>C�aZv܏_E�T崖K.߃�v�\r\Z�k]��ě����Fm+�\\-9U�k�y�^ݛk��2����S|���-�166��X�,9Ȼ-\Zp\\KO��|���H�4�Eq\";Q7�n:F��R��OP��;�lF�\0_��鵙�1t��w���&0��y�8ZCFё5,E�,...9�\"A{��4.��\\h4�o�Oq�&E��b�����w/������?��*֪���9�E\\�1�\0n�K�Y�F�j��t���\n�t���I�q���V�����j6\"�����5u\"�g�OZR��]��R�uZ�Z�l��{h/Q��<��{��M��o�/�^I�[[�S��\'�q���@�N7�j�+���Z�i.p6�6�!f;:�jŮ7��\Z�D,4�ԓ��|�J�ݤ�m�(�{\Z��O!��!ɳJ4cJ����U5d\\oY���Heb�5VRC����Rq�֬�����s��Fvݙر��.N�n��N��e�3<\Z\\3@�g�n8<�ni�W�l]<G�e\'�[���0󒞫L­V��Yu�y��7�N���\0@\0 �\0$��\'p�����ሯR���7c[�F��8g-i\\�%\r�����,ـ��%#9U�JQ��ϖ������EEI��6�~��K|��Sm�m�����:�R������B��c��y�>F1���uF���[���Z㩾�E�V�2{H;Ⱥ����s\'F7vn�#�{-hf��!o���S3��ٗGAǾ��zK3:KUu��6���\\/�x���H@@(M�	D͚��2ۅ���j�1��[�˔�s��h~��i3�N�c����z�����\r���������{<D�����r\\�\0 \0���)�qn��\n�y�}���l?���>d�W9lO	�R���{�?*��y���6҇e� ��&i�xS�|d�E� ��1@\Z�$�ti��Num�����f��Q��\0�ۉ�yy�\\�S���+T��q�bΓ�4PnQr6r0��F�-�����(�,�ȑv{r��YPd��\ZF�e�d���k�XaN��x�F��#�~b*��`��k�y�N��f�\0BTd�����_��At��ž�zصJ�W�P�;�����M�n��^�H1��\nK�����\0���c�}�b��\'��_To�i�A�\'�鈥��◱�c�\0 \0��R-�q�o�*��*O�\"J�Ɣ��5.G̔�\0ԟ/�)WM���U��{8����qH%0K�!�!���o� -s�HCY�~7�Ej����lFS�ϔ��n8��VjV��>E�R�sd}���%X�u$��ŉ��G��UpH;�jG�� ����Zu�������\rFK��W�����ǌ�Mg�>�ag����\0�E�������4��A��2l��?�\0��q��#U�������kb(y�7��q%&��*R�k>��EL�u�I�Q񹖴�r��*n���[_�U��p�|l?�v2|�zO\r�Wg�ڛa��������KNRY?�%�Q͖�0F��!o��,;9�� �I�{�V�F���㙾&_a�sKM>��)�])��ɰ���;��iz�~�����j^�\'�\0q�I4re4����z���\0@\0 ����d�Ή�VztGxf���P�8��p�eÄ�i�a�������75���*0�Œ�!\"ĀH�p?t䒴�>�RU(�K��qc*t)Hxx�}p�\Z�^�X��]Xz>������tQ[�JN�Ty/R��f�	��`홈�� �����Nj��}��6�R�gǡu�bz퐖�c7 �96#]��4���@]N�<I:n7,�lF:wK{䉅*Gu[�6o�K�=g��Nڞ� ���?�-�\\�e�*����B�\r?�>�t�F&RҘ���w�̼eR�V� |�,o����#)c���^�O�^�6*��@3#U�*{�;�;��jG����y����;fap�:�ՊԲ�P�\r��U\' ��2�-���C��f`�j;���nF��#�%�l�b��WJnB�W|2���u����Xo�ކ-%�_.��&=�̿�y����p\'�����m�d�U�Q9-٥d�ޔu��Ϳ�S�}�Ҷ����j��ɝ�WuX�Q_���ǘ\0@\0 /�\Zd����f�����q5�qV�ً����)Q�[[����x@9��e\\����t\n�v�j��[B	\"טV���U��&�}뷉�S\n�z�Ǎ�=�vϑ��:|d��h�EƢ\ZhE�t�\n��;��:�tO��?������d.�쫫2�@��48J{A.u��޷��%ucZ5]*�k�+j���Y_������2�V�J�*�>�_����⿁7��<m!\rJ��;c���}�Բ�ˎI�IqF�i����0�\0�ңI�4+�SV��R.ʠ��:�<���u�ش�> ��5V�r\nT`V�+�7�B�zA���EG����|��|�ս�̠�\r�@!>�6z��*�0�33C�.����<`�L���6������5s�+}�\rA#*�XЫ,��\Z�.��rE��UՉ�\r���n�Dq|���Ҏ����h������Im��o9��9�GҢ��g�{�\Z{9X�\Z�*T׈�P|A:(��������U����\0�\0@\0��y��\'����S=?צC�%@�y.(┖.�i�V9�0�	U�r�~�9�9~�bj�J����70�d}7��w��0p;_i����Uj����F�����J�_��6�.��u�=Gntk�4�+��>������N��YT�����T� _#��<��e(�f�J�\"�_�忖^EV���O���76�����d�蕨\r�u�ԟ�����X��/IƤg�z?�ЫដahRk��Jo\n�ީ�\"�lZly)��RZ�ԸzOqu.a��_v�\"��r3R;����v��Z6w>�EW֦鿷.�O�ec���X�������%�kz1�U���tږl�����/�Qb&ʪ�&z2YFj�̘�����l�Z.|d���j�/�H�uZ+���F�\0h[P=cl�Z.d�?�c�<����#�(�o��oʪ�|��*�K��t}���2�o�|I�o��5����9��e��\Z\rd�+a2���@���H�jå$�Ț���6ߖ��ye	���c�Eݿ�vB��j䱽����JJ�n\Z�� ���t]���t��$��r�,�{�-}��D ��W����I�\\�ϣp��-4U*�v�c��\'&��d���x\0/\0B���D���8�n�xwKvm|6&�l\"��T�e@[#r2�ٹ$r����P�ί��s+\\�f�\n� ��µƫ�߸@4X�V��X���a�!���\0���J�_��:�.����J�ĩk�+u��A�B4\'��ij��� �u\'<�YX��Ui�9H�;\n����m`t���F�	�����K���Y������P�ama��V8{C�q��+8�+8J�\Z�|8�\Zc}A�g���٩+�������cX���X^�?���\Z�l2d����#Y��y�[��i�\0�W/qe�^J֖Hά�R����\0���n����_e3��,$r������ظS�y����	qfR�WF��&���^-�|o%P\\Y�����%��h7Ep��Tt��z���&2�8���w�g��!�яSUk\'�4��m�Hַ�ieJ�yiL����8���uLWZ��2�bn�\"�č�֗QK��*�%ғ}����:M�x��&v��N�r=�-෹�#��.`�=�,u׎�ﴆ�Z3�rv=+�^�Վ���\'\\�*��I%O|\0P��o\0	�0�l`��(ץxn#^+f����j~h�`�v!\0���8@2�`H�T|9I�bQ�2�K�E���W�թ�����{�=\'�&�Y�V�2Ө���Q��#k{��ŀl���,l=�)\0�Ae��A���0�G[z=���GgQ^<��t�z]���a3�z[\n��J�8�=�\'��\'c37�p�~V��Gi.Nll[�n3HQ�H���YO颭���9Ê$�bI;�7\'���!���*b��im`�m�`\Zxn�0�`\Z�~���2�g�(�h��\n��jD񿼄�6`@8��(k}!�b���x\0�InBr�\0\0�7;��`�/f;�X^صj�=a�-����\0Do�-\0풴ex��\0�\0�\0a2�!t�W�JV�F����@2�[0Ln��`��I 6%rp�ij�J�,�b���= �H*Q������bEL;_S���T[��_�������|�8���Z\0��\0\0p&\0�LE������ �d�0x}�O�@:��l�þt����.<������3HC��x�Fe �0�\0i�1�Ҁ@�`�a��a 1.�V/f߄��6�\Z��)�~k��q�� ����q�@��,�i{�\r{�U����A�|?�`�0��@�0�\"�O(��<�&\0�X����-�Ǆ�\r�ǄS\rѶ�0\r�FO(����\0��� \Ztpր\\Jp	�`\0�@�\"\0�@���4��NQ�D�x��T���\0��J�Q�w� F��V���U��XfG|��B�_7��/@j.�\0�z\Z�U�}��F�0�(�Fj�D�(�=<���<r�_��5 ��i�;\0�Kf(�\0��!�:��U�\0xH��ր,\0��%�	hhZ\0�`V\0Ґ�P4`\r4 	�a\0i�P�g��\0a�k�\0���\0_���\0Q����\09@0c�� q\0p�\0p�\0p�\0P��\0pX�\0Z\0��\0�\0@@\0@\0H\0 \0�\0@\0@\0@���\0X\0 ��','ODD-0021','500.00',1),(2,NULL,'CINZA','2016-02-26 15:28:56','2016-02-26 15:28:56','����\0JFIF\0\0H\0H\0\0��\0C\0	\Z!\Z\"$\"$��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�@\0\0\0��\0xJ\0x�W�ޠm�J:?R�*��3�9�8�^�L<b��>����z�1p�q�1u[&�x������<y%��*~GE��ڻ��U�S2�h\\<`��\\����d�̶�?vyE��$c�[��g��&�e�� G�v����ݖ�i�*ɩ�l�H�]��>|�e�ZF{J�jf[i�~k�O�=�n֑�Ҭ����Zt����S��v[��g��&�e�� G�v����ݖ�i�*ɩ�l�H�]��>|�e�ZF{J�jf[i�~k�O�=�n֑�Ҭ����Zt����l=FQe���9�L�`-:A\rJ􅗎�h����̶ӤG@Cz����ۧb\"�;-3C-���Cz��Oh>{��|c;-3@�k6��e쐴�\0��\0�\\f�\0\0\0\0\0\0\0��\0)\0\0\0\0\0\0\0\0 435!0P`��\0\0�\0H�5��ķ���ky\Z�F����ky\Z�F����ky\Z�F����)�.s[I�S��Y��^D�Ș�\"b�L\\���1r&.D��	^,f\'�����V��ss��Lb����#�������D\r�s�K�����i~��ZNӍmh��6���	��kZ�x�&Ns[I�S��Y$s��M=f�2+��<6.�s[IKRʤ&���j5�yV�1Xg9����9ά�Q�l���)���H�Td�\r�y\"�H�r�eRUZֵ\Z�<�a �X��8j�e�xn>l�#�p�@>\Z���W{ ��%A�Gl\\-�p����֋|a(<6�xe���l\\-��.��b��᫽���o��Pxl]L�X1�(.�\Z��[����������.��b��᫽���o��Pxl]L�X1�(.�\Z��[����������.��b��᫽���o��Pxl]L�X1�(.�\Z��[����������.��b��᫽���o��Pxl]L�X1�(.�\Z��[����ҵ��C����<|�W$��7�.�$�u�5rM\\�W$�|��!`��᫽���o�R��IjI��?���/�!�gk����c^�>�	9j�en��R�֢K�RL���|�Զ!-�Kb؄�!|ֳA����I��gc\Z���I�C[��]��a���IjI��o��ڔQ�&�Z�5bl�/{�Q���5�����I��b�\\��rîXu��a�,:�\\���.�I�C[���u@�L~�ձ5lM[V�ձ5lM[V�ձ5lM[V�ձ5[@)��n�/���\0;\0\n\0\0\0\0\0\0 14r\"s���!#23Qa����0R���Aq�P`���\0\0?�\0�����V9X�c��V9X�c��V9X�c��V9ig�7.oiV��\"�O�����{B뽡u�к�h]w�.��]�����\r�ǹ�R)V�-#%�$�y~D�d���[�V�ZG�|O�,�[�Y�2�~���~���~���~���~���~���~��N���\0kJ;�7j�hk\Z���*��=���%��*�������(����� ��\'c�*��JPǉY����*����۱Q�;K;:f�j��JPǉSq��s��Yٹ��R\r`�Gl��\r۲3E���j��ƫ\Z��=h	)�U7�M�b�7}Fܔ_?ڰ�#y�,��U��phm�ll��jQ|�j�ԍ��1%\r���\\�*��w�]������ߕv����eNl7�{23F%\"{���!]������ߕv���7�\Z�_?ڰ�#yG\n��o�IԻvFa	��\n�Q�8բ��&Շ��8Tc}ZN�۲3N��Uj��ƭ��6�=H�Q ���u.ݑ�Bv>�To5h�~	�a�F��V��v����Z�xq�E��M�R7�p�8����K�df�����ÍZ/��mXz����A�7դ�]�#0��|V��j�|�j�ԍ�*1��\'R���\'c�*�F��V����V�o(�Pq��i 	�	ە�/�\nk_9�Y��C�} �p��{��+�-�#S���J����Яp��{��(?�|��3�Vv&��b4v�Շ��8Tc}I3H�\'O�.����j��P�\\��/��,�,�����&�Fʐ�#yG\n��o�&i����l6��Hw�+�s��a\\���W:?�Ώ錍Q~4q%)g6jn�ч��С��;L0� �K��ZFjll���λ�͕a�F�\rݎI���,�m.=�:��(Y��\Z;�CTY\'.U��{J�3Scdߨئ�u��l�R7����_����Ћ�.�]�t\"��`]��E�B.��vЋ�.�]�t\"��ll���λ�͟%��,A���XO�UΑ�s�ze\\��W:G�UΑ�s�ze\\��W:G�UΑ�s�ze\\��W:G�UΑ�s�ze5���S:��6�?��\0*\0\0\0\0\0\0\0\0Q�� !1a���A��0q��P`��\0\0?!�\0�C4DHw6^�r�8�zq�����+ӎW��N9^�r�8�zq�����)��?n�h\0�H(�\0���\0�K�R�T�U.K�R�T�U.K��p��S��x~�\0P��D�(���C4\0O$S�D��݃�1(&@��/|V^��\0a��DDCN�j��ڛ�LQW4��8Q*!9�]m�C4\0O$S�D��f.bw��\0���7�DH�I\'U2S�6�f��PWأU�\"qN\0�J����#\rܻ�ۺ���ۡ�ǥA>�f���ᗾ�0���\0&\Z�����,�S �b	��Azs�����(��l��F(��D�(�v�G�Z���]����� �i�3s(H�8�7����\0,�܍�m��a;pq�	��$�H�n�G~��\'̠���fI$����7#h�0�pY��ҙ��&�m�����L*h���AjvI��}�r6���\n��,})�Z��nf�l܍�z�¡�f�Jd�d����7#h�0�pY��ҙ��&�m�����L*h���AjvI��}�r6���\n��,})�Z��nf�l܍�z�¡�d̀��{��XP@#�ќ���,�<�s+����?vg�y�����w u�z�¡�Ԑ$������{a�,*dmM̪�:��1l��4߼a,\00f�����Y�L*�$������{a�, SO`_�s��?Pg3(�$*OeI�=�\'�I����L�U�y\'�w�����p4�?ׅv�G��V�E	�C�>!�l ��\ni��s�����new2R�|���\n�a�»����\0�B�.9�&���eZn�M�i��7U���V���uZn�M�i�I���a�»���� �H|�\'���T�ʓ�R{*OeI�=�\'���T�ʓ�R{*Od�Qܙ��ޮ�0h��\0���\0\0\0\0�\0�\0�\0�\0��\0���;�g��\'��\0�m��׽{y��>����=��ǿ�x����}��ϼ���?8p�\">���\0��\0�\0�\0�\0�\0�\0�\0�\0�\0��\0\'\0\0\0\0\0\0\0!\01AQa q��0@��P`���\0\0?�\0�d/��L��\"`6��x��Ǐ<x��ǐ��L��g���+u0vְ������/Ɂdrnf��WNQ�@(-?��,��,��,y��		Z���N{G�C��L:�����߉cÍ��v��?���+u0vְ������/Ɂdrnf��WNKU�������{	��|m�8����C��O^^f�������mL���#�4�f��&#W����Y{ɿǇ\Z9��,�%~r�[�)[�u>�B�����Z�rk�?��&�ɹ�<O]9-VR\Z��{����W$���F�$Zl�k�U�Ϫ��X�_���;kY�)���/�lt.]�:�\ZɿǇ\Z9��,�%~rs�Vʣ�ڌ��@\\+#��J =G2�n���|�A�g����J��\\��z�J�!�#���t�\0XT�R����L�ɂ$�PC\0H��\0��\"\n�0�z<xDJ@�m�1�йw���k&�Kh翌d�����y�-[*��j2NCBy�m1R���ѓ�}WOZ���,�\rv��9\r	�9��QJn�x2	�)p@�$��H �7υH!cS_��f�����6�w�DA�\'\0P���t����B¿U���Rp\n�WO�XqI�,+�]?ma�\'\0P���t����B¿U���Rp\n�WO�XqI�,�D�\r����5L�6d�cI�{R�RtR�M��� �j�;���m�P#���Q=9��J�Z������U�\'�<�{�Q5�\r{��\\��ek�����}Wo�p.ޠ�T��Kq��Yl����W���X`GoW�I0jt{\Z5�Ҟw�LM����B�l	F\0�*ۓ�o�x�=䨚ˆ��F�\\߲��{v���#��HJ�%-�>\'����\'��D����\n�U}w.\\�w�H��10Lta���G�$������Nw�J��`e��_y$����h�CJy�m16�;�������i6�$z�(\0DIԁ�Q5�\r{��\\��ek�����G_6 ���J[F|O/ُ�Oq��愰�Xm�\'.\rQ4aW1xs�:�ڮ2I�S��Ѭ����bl%w�eX�mbH�\0�� ��S���B�!�,���ڵjիV�Z�jt4����a(ø�x�*ƓkG�\"�Ra�~{�.\\�r�˗.\\�q\rC$(Jc��19�eX�mbH�\0���','OIL-0027','1000.00',4);

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

insert  into `modelocarro`(`codigo`,`categoria`,`descricao`,`codigo_fabricante`,`tipo_combustivel`) values (1,'SEDAN_COMPACTO','PÁLIO',1,'ALCOOL'),(2,'SEDAN_MEDIO','SIENA',1,'FLEX'),(4,'ESPORTIVO','GOL',2,'FLEX');

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

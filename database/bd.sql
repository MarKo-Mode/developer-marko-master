-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.4.19-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных marko
CREATE DATABASE IF NOT EXISTS `marko` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `marko`;

-- Дамп структуры для таблица marko.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `socialclub` text NOT NULL,
  `login` varchar(155) NOT NULL,
  `hwid` varchar(155) NOT NULL,
  `redbucks` varchar(155) NOT NULL,
  `ip` varchar(155) NOT NULL,
  `character1` varchar(155) NOT NULL,
  `character2` varchar(155) NOT NULL,
  `character3` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `password` varchar(155) NOT NULL,
  `viplvl` varchar(155) NOT NULL,
  `vipdate` datetime NOT NULL,
  `promocodes` varchar(155) NOT NULL,
  `present` tinyint(1) NOT NULL DEFAULT 0,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.adminaccess
CREATE TABLE IF NOT EXISTS `adminaccess` (
  `minrank` int(11) NOT NULL,
  `command` varchar(155) NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.advertised
CREATE TABLE IF NOT EXISTS `advertised` (
  `ID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `Author` varchar(40) NOT NULL,
  `AuthorSIM` int(11) NOT NULL,
  `AD` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Editor` varchar(40) DEFAULT NULL,
  `EditedAD` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Opened` datetime NOT NULL,
  `Closed` datetime DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.alcoclubs
CREATE TABLE IF NOT EXISTS `alcoclubs` (
  `id` int(155) NOT NULL,
  `alco1` int(155) NOT NULL,
  `alco2` int(155) NOT NULL,
  `alco3` int(155) NOT NULL,
  `pricemod` varchar(155) NOT NULL,
  `mats` int(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.banned
CREATE TABLE IF NOT EXISTS `banned` (
  `uuid` int(155) NOT NULL,
  `name` text NOT NULL,
  `account` text NOT NULL,
  `time` varchar(155) NOT NULL,
  `until` varchar(155) NOT NULL,
  `ishard` bigint(155) NOT NULL,
  `ip` varchar(155) NOT NULL,
  `socialclub` text NOT NULL,
  `hwid` varchar(155) NOT NULL,
  `reason` text NOT NULL,
  `byadmin` text NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(255) NOT NULL,
  `owner` text NOT NULL,
  `sellprice` text NOT NULL,
  `type` text NOT NULL,
  `products` text NOT NULL,
  `enterpoint` text NOT NULL,
  `unloadpoint` text NOT NULL,
  `money` text NOT NULL,
  `mafia` text NOT NULL,
  `orders` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `uuid` bigint(255) NOT NULL,
  `adminlvl` int(255) NOT NULL,
  `money` int(255) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `fraction` int(255) NOT NULL,
  `fractionlvl` int(255) NOT NULL,
  `warns` int(255) NOT NULL,
  `biz` text NOT NULL,
  `hotel` int(255) NOT NULL,
  `hotelleft` int(255) NOT NULL,
  `sim` int(255) NOT NULL,
  `PetName` text DEFAULT NULL,
  `eat` int(255) NOT NULL,
  `water` int(255) NOT NULL,
  `demorgan` int(255) NOT NULL,
  `arrest` int(255) NOT NULL,
  `unwarn` datetime NOT NULL,
  `unmute` int(255) NOT NULL,
  `bank` int(255) NOT NULL,
  `wanted` text DEFAULT NULL,
  `lvl` int(255) NOT NULL,
  `exp` int(255) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `health` int(255) NOT NULL,
  `armor` int(255) NOT NULL,
  `licenses` text NOT NULL,
  `lastveh` text NOT NULL,
  `onduty` tinyint(1) NOT NULL,
  `lasthour` int(255) NOT NULL,
  `contacts` text NOT NULL,
  `achiev` text NOT NULL,
  `createdate` datetime NOT NULL,
  `pos` text NOT NULL,
  `work` int(255) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.customization
CREATE TABLE IF NOT EXISTS `customization` (
  `uuid` bigint(255) NOT NULL,
  `gender` text NOT NULL,
  `parents` text NOT NULL,
  `features` text NOT NULL,
  `appearance` text NOT NULL,
  `hair` text NOT NULL,
  `clothes` text NOT NULL,
  `accessory` text NOT NULL,
  `tattoos` text NOT NULL,
  `eyebrowc` text NOT NULL,
  `beardc` text NOT NULL,
  `eyec` text NOT NULL,
  `blushc` text NOT NULL,
  `lipstickc` text NOT NULL,
  `chesthairc` text NOT NULL,
  `iscreated` tinyint(1) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.eventcfg
CREATE TABLE IF NOT EXISTS `eventcfg` (
  `RewardLimit` int(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.e_candidates
CREATE TABLE IF NOT EXISTS `e_candidates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Votes` text NOT NULL,
  `Election` text NOT NULL,
  `Name` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.e_points
CREATE TABLE IF NOT EXISTS `e_points` (
  `Election` int(155) NOT NULL AUTO_INCREMENT,
  `X` varchar(11) NOT NULL,
  `Y` varchar(11) NOT NULL,
  `Z` varchar(11) NOT NULL,
  `Dimension` int(11) NOT NULL,
  `Opened` text NOT NULL,
  PRIMARY KEY (`Election`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.e_voters
CREATE TABLE IF NOT EXISTS `e_voters` (
  `Election` int(155) NOT NULL,
  `Login` text NOT NULL,
  `TimeVoted` text NOT NULL,
  `VotedFor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.fractionaccess
CREATE TABLE IF NOT EXISTS `fractionaccess` (
  `idkey` int(155) NOT NULL AUTO_INCREMENT,
  `fraction` int(155) NOT NULL,
  `commands` text NOT NULL,
  `weapons` text NOT NULL,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.fractionranks
CREATE TABLE IF NOT EXISTS `fractionranks` (
  `idkey` int(155) NOT NULL AUTO_INCREMENT,
  `fraction` int(155) NOT NULL,
  `rank` int(155) NOT NULL,
  `payday` int(155) NOT NULL,
  `name` text NOT NULL,
  `clothesm` text NOT NULL,
  `clothesf` text NOT NULL,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.fractions
CREATE TABLE IF NOT EXISTS `fractions` (
  `id` int(155) NOT NULL,
  `drugs` int(155) NOT NULL,
  `money` int(155) NOT NULL,
  `mats` int(155) NOT NULL,
  `medkits` int(155) NOT NULL,
  `lastserial` text NOT NULL,
  `weapons` text NOT NULL,
  `isopen` tinyint(1) NOT NULL,
  `fuellimit` int(155) NOT NULL,
  `fuelleft` int(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.fractionvehicles
CREATE TABLE IF NOT EXISTS `fractionvehicles` (
  `fraction` int(155) NOT NULL,
  `number` text NOT NULL,
  `components` text NOT NULL,
  `model` text NOT NULL,
  `position` text NOT NULL,
  `rotation` text NOT NULL,
  `rank` int(155) NOT NULL,
  `colorprim` int(11) NOT NULL,
  `colorsec` int(11) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.furniture
CREATE TABLE IF NOT EXISTS `furniture` (
  `uuid` varchar(155) NOT NULL,
  `furniture` text NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.gangspoints
CREATE TABLE IF NOT EXISTS `gangspoints` (
  `id` int(155) NOT NULL,
  `gangid` int(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.garages
CREATE TABLE IF NOT EXISTS `garages` (
  `id` int(155) NOT NULL,
  `type` int(155) NOT NULL,
  `position` text NOT NULL,
  `rotation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(155) NOT NULL,
  `owner` text NOT NULL,
  `type` varchar(11) NOT NULL,
  `position` text NOT NULL,
  `price` text NOT NULL,
  `locked` tinyint(155) NOT NULL,
  `garage` text NOT NULL,
  `bank` text NOT NULL,
  `roommates` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `items` text NOT NULL,
  `uuid` int(255) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_admins
CREATE TABLE IF NOT EXISTS `logs_admins` (
  `time` datetime NOT NULL,
  `admin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `player` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_arrest
CREATE TABLE IF NOT EXISTS `logs_arrest` (
  `time` datetime NOT NULL,
  `player` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stars` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pnick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tnick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_ban
CREATE TABLE IF NOT EXISTS `logs_ban` (
  `time` datetime NOT NULL,
  `admin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `player` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `until` datetime NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ishard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_conn
CREATE TABLE IF NOT EXISTS `logs_conn` (
  `uuid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `in` datetime NOT NULL,
  `out` datetime DEFAULT NULL,
  `sclub` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hwid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_delete
CREATE TABLE IF NOT EXISTS `logs_delete` (
  `time` datetime NOT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_events
CREATE TABLE IF NOT EXISTS `logs_events` (
  `AdminStarted` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `EventName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `MembersLimit` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Started` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_id
CREATE TABLE IF NOT EXISTS `logs_id` (
  `in` datetime NOT NULL,
  `out` datetime DEFAULT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_items
CREATE TABLE IF NOT EXISTS `logs_items` (
  `time` datetime NOT NULL,
  `from` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_money
CREATE TABLE IF NOT EXISTS `logs_money` (
  `time` datetime NOT NULL,
  `from` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_name
CREATE TABLE IF NOT EXISTS `logs_name` (
  `time` datetime NOT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `old` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `new` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_stock
CREATE TABLE IF NOT EXISTS `logs_stock` (
  `time` datetime NOT NULL,
  `frac` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `in` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_ticket
CREATE TABLE IF NOT EXISTS `logs_ticket` (
  `time` datetime NOT NULL,
  `player` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sum` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pnick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tnick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.logs_vote
CREATE TABLE IF NOT EXISTS `logs_vote` (
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  `election` text DEFAULT NULL,
  `login` text DEFAULT NULL,
  `votefor` text DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`idkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.main
CREATE TABLE IF NOT EXISTS `main` (
  `Fraction` int(11) NOT NULL DEFAULT 0,
  `Rank` double NOT NULL DEFAULT 0,
  `FPosX` double NOT NULL DEFAULT 0,
  `FPosY` double NOT NULL DEFAULT 0,
  `FPosZ` double NOT NULL DEFAULT 0,
  `FPosDim` double NOT NULL DEFAULT 0,
  `TPosX` double NOT NULL DEFAULT 0,
  `TPosY` double NOT NULL DEFAULT 0,
  `TPosZ` double NOT NULL DEFAULT 0,
  `TPosDim` double NOT NULL DEFAULT 0,
  `Revers` int(11) NOT NULL DEFAULT 0,
  `ForVeh` int(11) NOT NULL DEFAULT 0,
  `Interact` int(11) NOT NULL DEFAULT 0,
  `SID` int(155) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.money
CREATE TABLE IF NOT EXISTS `money` (
  `id` varchar(155) NOT NULL,
  `holder` varchar(155) NOT NULL,
  `balance` varchar(155) NOT NULL,
  `type` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.nicknames
CREATE TABLE IF NOT EXISTS `nicknames` (
  `srv` varchar(155) NOT NULL,
  `name` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.othervehicles
CREATE TABLE IF NOT EXISTS `othervehicles` (
  `type` varchar(155) NOT NULL,
  `number` text NOT NULL,
  `model` text NOT NULL,
  `position` text NOT NULL,
  `rotation` text NOT NULL,
  `color1` int(155) NOT NULL,
  `color2` int(155) NOT NULL,
  `price` int(155) NOT NULL,
  `idkey` int(155) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.promocodes
CREATE TABLE IF NOT EXISTS `promocodes` (
  `name` text NOT NULL,
  `type` int(155) NOT NULL,
  `count` int(155) NOT NULL,
  `owner` int(155) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `Author` text NOT NULL,
  `Question` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Respondent` text DEFAULT NULL,
  `Response` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Opened` datetime NOT NULL,
  `Closed` datetime DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.rodings
CREATE TABLE IF NOT EXISTS `rodings` (
  `id` int(11) NOT NULL,
  `radius` varchar(255) DEFAULT NULL,
  `pos` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.safes
CREATE TABLE IF NOT EXISTS `safes` (
  `minamount` int(155) NOT NULL,
  `maxamount` int(155) NOT NULL,
  `pos` text NOT NULL,
  `address` text NOT NULL,
  `rotation` int(11) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `holder` varchar(155) NOT NULL,
  `model` varchar(155) NOT NULL,
  `health` int(11) NOT NULL,
  `fuel` int(11) NOT NULL,
  `components` text NOT NULL,
  `items` text NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `rotation` varchar(255) DEFAULT NULL,
  `keynum` int(11) DEFAULT NULL,
  `dirt` float DEFAULT NULL,
  `price` int(11) NOT NULL,
  `idkey` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(155) NOT NULL,
  PRIMARY KEY (`idkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.weapons
CREATE TABLE IF NOT EXISTS `weapons` (
  `id` varchar(155) NOT NULL,
  `lastserial` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица marko.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialclub` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Экспортируемые данные не выделены.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

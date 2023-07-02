# Updating SQL from 32 to 33 -Furior
# Add separation of admins by server
CREATE TABLE `admin_wl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Administrator',
  `level` int(2) NOT NULL DEFAULT '0',
  `flags` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ckey` (`ckey`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

# Updating SQL from 29 to 30 -AffectedArc07
# Add new viewrange toggle
ALTER TABLE `player`
	ADD COLUMN `viewrange` VARCHAR(5) NOT NULL DEFAULT '19x15' AFTER `keybindings`;

CREATE TABLE IF NOT EXISTS `cot_attach` (
    `att_id` int(11) NOT NULL AUTO_INCREMENT,
    `att_userid` int(11) NOT NULL,
	`att_extension` varchar(255) collate utf8_unicode_ci,
	`att_category` varchar(255) collate utf8_unicode_ci,
    `att_code` varchar(255) collate utf8_unicode_ci,
    `att_x` varchar(255) collate utf8_unicode_ci,
    `att_item` int(11) NOT NULL,
	`att_filepath` varchar(255) collate utf8_unicode_ci,
	`att_filename` varchar(255) collate utf8_unicode_ci,
	`att_fileext` varchar(255) collate utf8_unicode_ci,
	`att_fileorigname` varchar(255) collate utf8_unicode_ci,
	`att_thumbpath` varchar(255) collate utf8_unicode_ci,
    `att_filesize` int(11) NOT NULL,
	`att_desc` varchar(255) NOT NULL,
	`att_order` int(11) NOT NULL,
	`att_type` varchar(255) NOT NULL,
    PRIMARY KEY (`att_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

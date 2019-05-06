
USE `essentialmode`;


CREATE TABLE IF NOT EXISTS `interiors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key id',
  `enter` text NOT NULL COMMENT 'enter coords',
  `exit` text NOT NULL COMMENT 'destination coords',
  `iname` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `interiors` (`id`, `enter`, `exit`, `iname`) VALUES
(1, '{-772.954,312.134,85.6981,130}', '{-781.833,326.111,176.804,240}', 'Appartement'),
(2, '{-428.778,1111.61,327.689,130}', '{136.172,-761.371,242.152,260}', 'Gouvernement');


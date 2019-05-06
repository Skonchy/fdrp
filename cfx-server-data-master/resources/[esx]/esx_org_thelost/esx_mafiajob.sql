INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_mafia','Mob',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_mafia','Mob',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_mafia', 'Mob', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('mafia', 'Mob', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('mafia', 0, 'soldato', 'Soldato', 1500, '{}', '{}'),
('mafia', 1, 'capo', 'Capo', 1800, '{}', '{}'),
('mafia', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
('mafia', 3, 'boss', 'Don', 2700, '{}', '{}');

CREATE TABLE `fine_types_mafia` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_mafia` (label, amount, category) VALUES 
	('Racket',3000,0),
	('Racket',5000,0),
	('Racket',10000,1),
	('Racket',20000,1),
	('Racket',50000,2),
	('Racket',150000,3),
	('Racket',350000,3)
;
INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_kingsmen','Kingsmen',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_kingsmen','Kingsmen',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_kingsmen', 'Kingsmen', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('kingsmen', 'Kingsmen', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('kingsmen', 0, 'soldato', 'Soldato', 1500, '{}', '{}'),
('kingsmen', 1, 'capo', 'Capo', 1800, '{}', '{}'),
('kingsmen', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
('kingsmen', 3, 'boss', 'Don', 2700, '{}', '{}');


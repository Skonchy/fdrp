USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_disco','Nightlife',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('disco','Nightlife')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('disco',0,'barman','Waitstaff',20,'{}','{}'),
  ('disco',1,'videur','Bartender',30,'{}','{}'),
  ('disco',2,'dj','DJ',40,'{}','{}'),
  ('disco',3,'gerant','Manager',50,'{}','{}'),
  ('disco',4,'boss','Owner',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
	('menthe', 'Bowl of mints'),
	('pommedeterre', 'French Fries'),
	('raisin', 'Raisins'),
	('steackhache', 'Steak Bites'),
	('feuilledecoca', 'Hot Cocoa'),
	('thefroid', 'Ice Tea'),
	('orange', 'Orange Slices'),
	('cerealesmaltees', 'Trail Mix'),
	('sirop', 'Soda'),
	('cacao', 'Espresso'),
	('eaugazifie', 'Sparkling Water'),
	('agrume', 'Citrus Soda'),
	('cafeine', 'Iced Coffee'),
	('mojito', 'Mojito'),
	('vodka', 'Vodka'),
	('champagne', 'Champagne'),
	('hamburger', 'Corndog'),
	('coca', 'Zapp Soda'),
	('icetea', 'Sweet Tea'),
	('orangina', 'Lemon Drop'),
	('wisky', 'Wisky'),
	('diabolo', 'Diablo'),
	('chocolatchaud', 'Creme de Cocao'),
	('perrier', 'Perrier'),
	('schweppes', 'Schweppes'),
	('cafe', 'Coffee')
;
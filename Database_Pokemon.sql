-- __/\\\\\\\\\\\__/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_____/\\\\\_________/\\\\\\\\\_________/\\\\\\\________/\\\\\\\________/\\\\\\\________/\\\\\\\\\\________________/\\\\\\\\\_______/\\\\\\\\\_____        
--  _\/////\\\///__\/\\\\\\___\/\\\_\/\\\///////////____/\\\///\\\_____/\\\///////\\\_____/\\\/////\\\____/\\\/////\\\____/\\\/////\\\____/\\\///////\\\_____________/\\\\\\\\\\\\\___/\\\///////\\\___       
--   _____\/\\\_____\/\\\/\\\__\/\\\_\/\\\_____________/\\\/__\///\\\__\///______\//\\\___/\\\____\//\\\__/\\\____\//\\\__/\\\____\//\\\__\///______/\\\_____________/\\\/////////\\\_\///______\//\\\__      
--    _____\/\\\_____\/\\\//\\\_\/\\\_\/\\\\\\\\\\\____/\\\______\//\\\___________/\\\/___\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\_________/\\\//_____________\/\\\_______\/\\\___________/\\\/___     
--     _____\/\\\_____\/\\\\//\\\\/\\\_\/\\\///////____\/\\\_______\/\\\________/\\\//_____\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\________\////\\\____________\/\\\\\\\\\\\\\\\________/\\\//_____    
--      _____\/\\\_____\/\\\_\//\\\/\\\_\/\\\___________\//\\\______/\\\______/\\\//________\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\___________\//\\\___________\/\\\/////////\\\_____/\\\//________   
--       _____\/\\\_____\/\\\__\//\\\\\\_\/\\\____________\///\\\__/\\\______/\\\/___________\//\\\____/\\\__\//\\\____/\\\__\//\\\____/\\\___/\\\______/\\\____________\/\\\_______\/\\\___/\\\/___________  
--        __/\\\\\\\\\\\_\/\\\___\//\\\\\_\/\\\______________\///\\\\\/______/\\\\\\\\\\\\\\\__\///\\\\\\\/____\///\\\\\\\/____\///\\\\\\\/___\///\\\\\\\\\/_____________\/\\\_______\/\\\__/\\\\\\\\\\\\\\\_ 
--         _\///////////__\///_____\/////__\///_________________\/////_______\///////////////_____\///////________\///////________\///////_______\/////////_______________\///________\///__\///////////////__

-- Your Name: Cheng Ze Lam
-- Your Student Number: 1166497
-- By submitting, you declare that this work was completed entirely by yourself.

-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q1

SELECT COUNT(Species.title) AS speciesCount
FROM Species
WHERE Species.description LIKE  '%this%';

-- END Q1
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q2

SELECT player.username, SUM(pho.power) AS totalPhonemonPower
FROM Phonemon AS pho INNER JOIN Player ON pho.player = Player.id
WHERE player.username = 'Cook' OR player.username = 'Hughes'
GROUP BY player.username;

-- END Q2
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q3

SELECT Team.title, COUNT(player.team) AS numberOfPlayers
FROM Team INNER JOIN Player ON Team.id = Player.team
GROUP BY Team.title
ORDER BY COUNT(player.team) DESC;

-- END Q3
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q4

SELECT id AS idSpecies, title
FROM Species
WHERE type1 = (SELECT id FROM Type WHERE title = 'Grass') OR
type2 = (SELECT id FROM Type WHERE title = 'Grass');

-- END Q4
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q5

SELECT Player.id AS idPlayer, Player.username
FROM Player LEFT OUTER JOIN Purchase ON Player.id = Purchase.player
WHERE Player.id not in 
(SELECT player FROM Purchase WHERE item IN (SELECT id FROM Food))
OR item IS NULL
GROUP BY Player.id;

-- END Q5
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q6

SELECT player.level, SUM(Purchase.quantity * Item.price) AS totalAmountSpentByAllPlayersAtLevel
FROM Purchase 
INNER JOIN Player ON Purchase.player = Player.id
INNER JOIN Item ON Purchase.item = Item.id
GROUP BY player.level
ORDER BY SUM(Purchase.quantity * Item.price) DESC;

-- END Q6
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q7

SELECT item.id as item, item.title, COUNT(item.id) AS numTimesPurchased
FROM Purchase 
INNER JOIN Item ON Purchase.item = Item.id
GROUP BY item.id
HAVING COUNT(item.id) = (
SELECT COUNT(item.id) 
FROM Purchase INNER JOIN Item ON Purchase.item = Item.id 
GROUP BY Purchase.item 
ORDER BY COUNT(Item.id) DESC LIMIT 1);

-- END Q7
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q8

SELECT player.id AS playerID, player.username, COUNT(DISTINCT Food.id) AS numberDistinctFoodItemsPurchased
FROM Purchase 
INNER JOIN Player ON Purchase.player = Player.id
INNER JOIN  Food ON Purchase.item = Food.id
GROUP BY player.id
HAVING COUNT(DISTINCT Food.id) = (SELECT COUNT(food.id) FROM food);

-- END Q8
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q9

SELECT COUNT(distanceX) AS numberOfPhonemonPairs, distance.distanceX 
FROM Phonemon AS Pho1 
INNER JOIN Phonemon AS Pho2 ON Pho1.id < Pho2.id 
INNER JOIN(  
SELECT phon1.id AS Pho1ID, phon2.id AS Pho2ID, ROUND(SQRT(POWER(phon1.latitude-phon2.latitude, 2) + POWER(phon1.longitude-phon2.longitude, 2))*100, 2) AS distanceX 
FROM Phonemon AS phon1 INNER JOIN Phonemon AS phon2 ON phon1.id < phon2.id ) 
AS distance ON Pho1.id = distance.Pho1ID AND Pho2.id = distance.Pho2ID 
GROUP BY distanceX;

-- END Q9
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- BEGIN Q10

SELECT Player.username, type.title
FROM type 
INNER JOIN species ON type.id = species.type1 OR type.id = species.type2
INNER JOIN Phonemon AS pho ON pho.species=species.id
INNER JOIN Player on player.id = pho.player
INNER JOIN(
# this table output type title and frequency of species of each type
SELECT type.title AS typeTitle, COUNT(type.title) AS countType
FROM type 
INNER JOIN species ON type.id = species.type1 OR type.id = species.type2
GROUP BY type.title)
AS freq ON freq.typeTitle = type.title
GROUP BY type.title, player.username, freq.countType
HAVING COUNT(DISTINCT species.id) = freq.countType;

-- END Q10
-- ____________________________________________________________________________________________________________________________________________________________________________________________________________
-- END OF ASSIGNMENT Do not write below this line
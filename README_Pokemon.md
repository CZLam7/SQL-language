# Database Project 2: Pokemon
- Application of sql knowledge, such as join, filtering results, multiple conditions, sorting, functions and formatting output
- Questions in the project:
  - 1. How many species have a description which contains the word “this”? Your query should return results of the form: (speciesCount). 
  - 2. Player ‘Cook’ is about to battle player ‘Hughes’. For both players, show the player's username and the total summed power of all the Phonemons they own. Your query should return results of the form: (username, totalPhonemonPower). 
  - 3. How many players does each team have? List the team names with their player counts, in descending order. Return results as: (title, numberOfPlayers). 
  - 4. Which species have a type of "grass"? Return results as: (idSpecies, title)
  - 5. List the players who never purchased any food item. Your query should return results of the form: (idPlayer, username). 
  - 6. Each player is at a particular level in the game. What is the total amount that has been spent on purchases by all players of a given level? Your query should return results of the form: (level, totalAmountSpentByAllPlayersAtLevel) in the descending order of the amount spent.
  - 7. Which item was purchased the most? In case of a tie, find all such items. Your query should return results of the form: (item, title, numTimesPurchased).
  - 8. Find the number of (distinct) food items available, and any players who have purchased all types of food items at least once. Your query should return results of the form: (playerID, username, numberDistinctFoodItemsPurchased).
  - 9. We'll refer to the Euclidean distance, rounded to 2 decimal places, between the closest two Phonemon as 'X'. We wish to count the number of Phonemon PAIRS which are at distance (to 2 decimals places) X from each other. Return as 
(numberOfPhonemonPairs, distanceX). HINT1: use the ROUND() function. HINT2: Ensure you are not double counting the pairs: eg phonemon1 and phonemon2 are distance 0.11 from each other. If this is the minimum distance and no other phonemon are also at distance 0.11 from another phonemon, 
then the return value should be (1, 0.11), since there is a single PAIR which are at distance 0.11 from each other.
  - 10. Some players are really into a certain type of Phonemon... List the usernames of players that have captured at least one of every species of a given type, and the title of that type. Return a separate row for each type that a player has caught all species of. Your query should 
return results of the form: (username, title). An example: if there are 3 Phonemon species with a type of 'bug', and player 'Greg' has caught at least 1 Phonemon of each of these species, then Greg will appear in the list as (Greg, bug). If additionally, Greg had caught one of every species 
with type 'fairy', then a second row of the output would be (Greg, fairy). 

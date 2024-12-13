/******************************************************************************************
Title: SELECT WHERE

Query_Type: read

Details:
Let's say that a user logs into the Cat App and wants to update some information on thier cat.
By logging in, the frontend and API are now aware of which user is in the app. This information
can be be used by the API to gather just their data using a WHERE clause and then send it back
to the front end of the application.
******************************************************************************************/

-- Show the cats that live in the SaintG household. 
SELECT *
FROM ClientCat
WHERE CatHousehold = 'SaintG';

-- Let's trim that down a little.
SELECT CatNM
	  ,CatSex
	  ,CatAge
	  ,CatBreed
FROM ClientCat
WHERE CatHousehold = 'SaintG';

-- For apps using this database, just pulling a household by name only may cause the wrong
-- data to be returned. We would want to use a unique ID for the desired data so it can be 
-- assured that the correct rows are returned. Let's do that with the Id '8c263069-6c19-4c2e-99db-0287327a24af'.
-- Notice that the OwnerID in the WHERE clause doesn't need to be in the returned columns.
SELECT CatNM
	  ,CatSex
	  ,CatAge
	  ,CatBreed
FROM ClientCat
WHERE OwnerID = '8c263069-6c19-4c2e-99db-0287327a24af';

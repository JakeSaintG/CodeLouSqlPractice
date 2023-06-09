-- ===========================================================================================
-- ==========================================ORDER BY=========================================
-- ===========================================================================================

-- ORDER BY CatAge from highest to lowest (descending)
SELECT * 
FROM Client.ClientCat
ORDER BY CatAge DESC;

-- ORDER BY CatAge from highest to lowest (ascending), then ORDER BY LastModifiedDTS since Milo and Ghost are the same ages.
	-- (Milo's LastModifiedDTS should be hard coded to '2023-05-23' while the rest use the GETDATE() function)
-- Without the LastModifiedDTS, the order should be ...Ghost, Milo... etc.
-- With the LastModifiedDTS, the order should be ...Milo, Ghost... 
SELECT CatAge,
	   CatNM,
	   LastModifiedDTS
FROM Client.ClientCat
ORDER BY CatAge, LastModifiedDTS ASC;

-- ===========================================================================================
-- ==========================================GROUP BY=========================================
-- ===========================================================================================

-- For the purpose of the contact list, GROUP BY CatOwner
SELECT CatNM,
	   CatOwner
FROM Client.ClientCat
GROUP BY CatOwner, CatNM;

-- Actually...GROUPing  BY CatHouseHold and then by CatOwner may be more helpful.
SELECT CatNM,
	   CatHousehold,
	   CatOwner
FROM Client.ClientCat
GROUP BY CatHousehold, CatOwner, CatNM;

-- Now add in the contact info from the CatOwner table! 
-- You may notice a and b. "a" is an Alias for the ClientCat table and "b" is for CatOwner.
-- Sometimes, columns end up having the same name and alias' end up required. Ex: if "a.CatOwner = b.CatOwner"
SELECT a.CatNM,
	   a.CatHousehold,
	   a.CatOwner,
	   b.OwnerEmail,
	   b.OwnerPhone
FROM Client.ClientCat a
JOIN Client.CatOwner b on a.CatOwner = b.OwnerNM -- JOIN before ORDER or GROUP
GROUP BY a.CatHousehold, a.CatOwner, a.CatNM, b.OwnerEmail, b.OwnerPhone;

-- ===========================================================================================
-- ==========================================Between==========================================
-- ===========================================================================================

-- We want to target a newsletter at "senior" cats. Show me the cats between ages 10 and 30
SELECT a.CatAge,
	   a.CatNM,
	   a.CatHousehold,
	   a.CatOwner,
	   b.OwnerEmail,
	   b.OwnerPhone
FROM Client.ClientCat a
JOIN Client.CatOwner b on a.CatOwner = b.OwnerNM -- JOIN before ORDER or GROUP
WHERE CatAge BETWEEN 10 AND 30 
GROUP BY a.CatHousehold, a.CatOwner, a.CatAge, a.CatNM, b.OwnerEmail, b.OwnerPhone;

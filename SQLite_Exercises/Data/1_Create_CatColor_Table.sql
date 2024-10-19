/******************************************************************************************
    Don't focus too much on the details here yet. We'll run these commands, get the data in
    place, and then talk about the details in the Exercises. Feel free to come back here and
    see what's going on after you've gone through the Exercises!

    The cat color table is not currently used in the exercise scripts but it is an easy place
    to start. It can also serve as an example of a table that can be used as validation data.
    Using this table, you could prevent a user from adding a "green" cat with API code.
******************************************************************************************/

CREATE TABLE CatColor (
    ColorNM TEXT NOT NULL
);

INSERT INTO CatColor (
	ColorNM
) 
VALUES
    ('black'),
    ('white'),
    ('gray'),
    ('orange'),
    ('cream'),
    ('orange');

SELECT * FROM CatColor;
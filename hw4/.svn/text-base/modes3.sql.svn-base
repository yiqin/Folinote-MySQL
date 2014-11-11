SELECT 'SQL data modification' as '';


SELECT 'Delete users' as '';
DELETE FROM User
WHERE name = 'Skywalker';

DELETE FROM User
WHERE name = 'Superman';

SELECT 'Add users' as '';
INSERT INTO User(name)
VALUES('Skywalker');

INSERT INTO User(name, language)
VALUES('Superman', 'English');

SELECT 'After deleting and adding users' as '';
SELECT *
FROM User;

SELECT 'Remove all users with invalid email' as '';
DELETE FROM User
WHERE email IS NULL;

SELECT *
FROM User;

SELECT 'Remove user boilermaker and animal from table' as '';
DELETE FROM User
WHERE name = 'boilermaker'
AND name = 'animal';

INSERT INTO Tweet(tweetTime, writerName, content)
VALUES(NOW(), 'boilermaker', 'MySQL');
INSERT INTO Tweet(tweetTime, writerName, content)
VALUES(NOW(), 'animal', 'at the zoo');

SELECT *
FROM Tweet;


SELECT 'This operation is to create users automatically if they send a tweet.' as 'Subquery';
INSERT IGNORE INTO User(name)
(SELECT DISTINCT writerName
FROM Tweet
);

SELECT 'boilermaker and animal are stored into table now' as 'Subquery';
SELECT *
FROM User
WHERE name = 'boilermaker'
or name = 'animal';

SELECT 'A simple operation - add a tweet.' as '';
INSERT INTO Tweet(tweetTime, writerName, content)
VALUES(NOW(), 'user1', 'tweet is good');


SELECT 'Make currentTrend smaller and measurable.' as '';

DELETE FROM Hashtag
WHERE label = 'Chicago';

INSERT INTO Hashtag(label, currentTrend)
VALUES('Chicago', 1000);

UPDATE Hashtag
Set currentTrend = 1
WHERE label = 'Ann';

UPDATE Hashtag
Set currentTrend = 3
WHERE label = 'Chicago Music';

UPDATE Hashtag
Set currentTrend = 9
WHERE label = 'Chicago2';

SELECT 'Before updating' as '';
SELECT *
FROM Hashtag;

UPDATE Hashtag
SET currentTrend = 100
WHERE currentTrend > 100;

SELECT 'After updating, all currentTrend is less than 100' as '';
SELECT *
FROM Hashtag;


DROP TABLE PotentialFollowed;
CREATE TABLE PotentialFollowed(
    name VARCHAR(30) PRIMARY KEY
);

INSERT INTO PotentialFollowed(name)
(SELECT DISTINCT name
FROM User
WHERE name = ANY (SELECT userName
       	          FROM Favorite
                  WHERE writerName = 'user2'));
SELECT *
FROM PotentialFollowed;


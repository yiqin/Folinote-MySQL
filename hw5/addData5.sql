/*NOTE: this file to update database.*/

SELECT *
FROM User;

SELECT *
FROM Tweet;

SELECT *
FROM Favorite;

SELECT *
FROM At;


INSERT INTO At(userName, tweetTime, writerName)
VALUES('user1',NOW(),'user2');

INSERT INTO At(userName, tweetTime, writerName)
VALUES('user5',NOW(),'user2');

INSERT INTO At(userName, tweetTime, writerName)
VALUES('user6',NOW(),'user2');

INSERT INTO At(userName, tweetTime, writerName)
VALUES('user4',NOW(),'user1');


INSERT INTO User(name)
VALUES('user11');


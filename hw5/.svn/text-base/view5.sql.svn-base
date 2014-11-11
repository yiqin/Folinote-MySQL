/*I created three views, and ten queries.*/

/*1*/
CREATE VIEW COUNTUser AS
SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName;

SELECT AVG(COUNTTweets)
FROM COUNTUser;

SELECT COUNTUser.writerName, COUNTUser.COUNTTweets
FROM COUNTUser
WHERE COUNTUser.COUNTTweets > 
(SELECT COUNT(writerName) As COUNTTweets
FROM Tweet
WHERE writerName = 'user2');


/*2*/
CREATE VIEW PopularTweets AS
SELECT Tweet.writerName,Tweet.tweetTime,Tweet.content
FROM Tweet
NATURAL JOIN Favorite;

SELECT *
FROM PopularTweets;
WHERE tweetTime > '2014-10-25 15:31:06';


/*3*/
CREATE VIEW PopularUser AS
SELECT userNameFollowed, COUNT(userNameFollow) AS COUNTUserNameFollow
FROM Follow
GROUP BY userNameFollowed;

SELECT *
FROM PopularUser
WHERE userNameFollowed = 'user2'
OR userNameFollowed = 'user1';

SELECT AVG(COUNTUserNameFollow)
FROM PopularUser;

/*Find super active users (send more than four tweets) who also have at least one follower. We call this kind of users super active and popular users.*/
SELECT writerName
FROM Tweet
JOIN PopularUser
ON Tweet.writerName = PopularUser.userNameFollowed
GROUP BY writerName
HAVING COUNT(*) > 4;

SELECT PopularUser.userNameFollowed, t.tweetTime As postTime, t.content As tweetContent
FROM PopularUser LEFT OUTER JOIN Tweet t
ON PopularUser.userNameFollowed = t.writerName;


SELECT PopularUser.userNameFollowed
FROM PopularUser JOIN PopularTweets
ON PopularUser.userNameFollowed = PopularTweets.writerName;



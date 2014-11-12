/*1*/
/*Find all pairs of users that followered by at least one user in common*/
SELECT DISTINCT F_1.username_leader AS user1, 
F_2.username_leader AS user2
FROM Follow F_1 JOIN Follow F_2
USING (username_follower)
WHERE F_1.username_leader != F_2.username_leader;

/*2*/
/*Find the tweets favorated by at least one user.*/
SELECT Tweet.tweetID,Tweet.writerName,Tweet.content
FROM Tweet
NATURAL JOIN Favorite;

/*3*/
/*List all users and their tweets, if known.*/
SELECT u.name AS user, t.tweetID As tweetID, t.content As tweetContent
FROM User u LEFT OUTER JOIN Tweet t
ON u.name = t.writerName
WHERE t.tweetID IS NULL;

/*4*/
/*Find super active users (send more than four tweets) who also have at least one follower. We call this kind of users super active and popular users.*/
SELECT writerName
FROM Tweet
JOIN (SELECT username_leader, COUNT(username_follower) AS COUNTUsername_follower
FROM Follow
GROUP BY username_leader) popularUser
ON Tweet.writerName = popularUser.username_leader
GROUP BY writerName
HAVING COUNT(*) > 4;

/*5*/
/*Find users who send more tweets than the number of tweets sent by user1*/
SELECT COUNTUser.writerName, COUNTUser.COUNTTweets
FROM (SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName) AS COUNTUser
WHERE COUNTUser.COUNTTweets > 
(SELECT COUNT(writerName)
FROM Tweet
WHERE writerName = 'user1');

/*6*/
/*Find the tweets favorated by at least two user.*/
SELECT Tweet.writerName, Tweet.tweetID, Tweet.content, COUNTFavoriteTweet.favoriteNumber
FROM Tweet JOIN (SELECT tweetID AS favorateTweetID, COUNT(TweetID) AS favoriteNumber
FROM Favorite
GROUP BY(TweetID)
HAVING (COUNT(TweetID))>1
) AS COUNTFavoriteTweet
ON Tweet.tweetID = COUNTFavoriteTweet.favorateTweetID;

/*7*/
/*Find the user (name) who tweet most.*/
SELECT tweetID, writerName AS name, content, COUNT(writerName) AS tweetNumber
FROM Tweet
GROUP BY(writerName);
 

/*
HAVING (COUNTWriterName.tweetNumber) = MAX(COUNTWriterName.tweetNumber);
*/


SELECT Tweet.content
FROM Tweet
WHERE writerName = 'user1';


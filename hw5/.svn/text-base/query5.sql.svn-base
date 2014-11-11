/*NOTE: the file addData5.sql to update database. I forgot to commit the hw3, so my create file is in hw4 folder. Also, I maybe update the database by coding in command terminal. (Honestly I don't remember.) I'm sure all my query is not empty. Let me know if there is any empty query or any questions. Thanks.
*/

/*1*/
/*Find the tweets favorited by at least one user.*/
SELECT Tweet.writerName,Tweet.tweetTime,Tweet.content
FROM Tweet JOIN Favorite
ON Tweet.tweetTime = Favorite.tweetTime;


/*2*/
/*Find pairs of Follow and Followed.*/
SELECT A.*
FROM Follow A JOIN Follow B
ON A.userNameFollow = B.userNameFollowed
WHERE A.userNameFollowed = B.userNameFollow;


/*3*/
/*Find pairs of tweet writers favorited by the same user.*/
SELECT DISTINCT A.writerName, B.writerName, userName
FROM Favorite A JOIN Favorite B
USING(userName)
WHERE A.writerName != B.writerName;


/*4*/
/*Find the tweets favorated by at least one user.*/
SELECT Tweet.writerName,Tweet.tweetTime,Tweet.content
FROM Tweet
NATURAL JOIN Favorite;

/*The following methond is from hw4. These two queries should show the same results.*/
SELECT 'Find the tweets favorited by at least one user' as '';
SELECT Tweet.writerName,Tweet.tweetTime,Tweet.content
FROM Tweet, Favorite
WHERE Tweet.tweetTime = Favorite.tweetTime
AND Tweet.writerName = Favorite.writerName;


/*5*/
/*List all users and their tweets, if known.*/
SELECT u.name AS user, t.tweetTime As postTime, t.content As tweetContent
FROM User u LEFT OUTER JOIN Tweet t
ON u.name = t.writerName;

/*If we use RIGHT OUTER JOIN*/
/*It becomes: List all tweets and their writer, if known.*/
SELECT u.name AS user, t.tweetTime As postTime, t.content As tweetContent
FROM User u RIGHT OUTER JOIN Tweet t
ON u.name = t.writerName;


/*6*/
/*List all users without a tweet.*/
SELECT u.name AS user, t.tweetTime As postTime, t.content As tweetContent
FROM User u LEFT OUTER JOIN Tweet t
ON u.name = t.writerName
WHERE t.tweetTime IS NULL;


/*7*/
/*Find super active users (send more than four tweets) who also have at least one follower. We call this kind of users super active and popular users.*/

/*Super active users are animal, boilermaker, user1, user2, user3, and user4*/
SELECT 'Super active users (send more than ten tweets):' as '';
SELECT writerName
FROM Tweet
GROUP BY writerName
HAVING COUNT(*) > 4;

/*Popular users are user1, user2, user4 and user5.*/
SELECT userNameFollowed, COUNT(userNameFollow)
FROM Follow
GROUP BY userNameFollowed;

/*super active and popular users*/
SELECT writerName
FROM Tweet
JOIN (SELECT userNameFollowed, COUNT(userNameFollow) AS COUNTUserNameFollow
FROM Follow
GROUP BY userNameFollowed) popularUser
ON Tweet.writerName = popularUser.userNameFollowed
GROUP BY writerName
HAVING COUNT(*) > 4;


/*8*/
/*Find users who send more tweets than the number of tweets sent by user2*/
/*Count tweets for every users.*/
SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName;

SELECT COUNTUser.writerName, COUNTUser.COUNTTweets
FROM (SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName) AS COUNTUser
WHERE COUNTUser.COUNTTweets > 
(SELECT COUNT(writerName) As COUNTTweets
FROM Tweet
WHERE writerName = 'user2');

/*Another solution*/
/*This is better.*/
SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName
HAVING COUNT(writerName) > 
(SELECT COUNT(writerName) As COUNTTweets
FROM Tweet
WHERE writerName = 'user2');


/*9*/
/*Find the average tweets sent by the users who have sent at least one tweet.*/
SELECT AVG(COUNTTweets)
FROM (SELECT writerName, COUNT(writerName) As COUNTTweets
FROM Tweet
GROUP BY writerName) AS COUNTUser;


/*10*/
/*List all super active and popular users and their tweets, if known.*/
SELECT superAndPopularUser.name AS user, t.tweetTime As postTime, t.content As tweetContent
FROM (SELECT writerName AS name
FROM Tweet
JOIN (SELECT userNameFollowed, COUNT(userNameFollow) AS COUNTUserNameFollow
FROM Follow
GROUP BY userNameFollowed) popularUser
ON Tweet.writerName = popularUser.userNameFollowed
GROUP BY writerName
HAVING COUNT(*) > 4) AS superAndPopularUser
LEFT OUTER JOIN Tweet t
ON superAndPopularUser.name = t.writerName;









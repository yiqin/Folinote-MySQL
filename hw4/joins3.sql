SELECT *
FROM Tweet
WHERE tweetTime > '2014-10-25 15:31:06'
AND writerName = ANY (SELECT userNameFollowed
		      FROM Follow	  
		      WHERE userNameFollow = 'user2');


SELECT *
FROM Follow;

SELECT 'Find all pairs of follow and followed.' as '';
SELECT A.userNameFollow, A.userNameFollowed
FROM Follow A, Follow B
WHERE A.userNameFollow = B.userNameFollowed
AND A.userNameFollowed = B.userNameFollow;



SELECT 'Find all related users for user2 including ones at by user2, favorited by user2 and followed by user2' as '';

SELECT *
FROM User
WHERE name = ANY (SELECT userName
       	          FROM Favorite
                  WHERE writerName = 'user2')
UNION
SELECT *
FROM User
WHERE name = ANY (SELECT userName
		  FROM At
		  WHERE writerName = 'user2')
UNION
SELECT *
FROM User
WHERE name = ANY (SELECT userNameFollowed
		  FROM Follow
		  WHERE userNameFollow = 'user2');


SELECT 'Find repeated tweets' as '';
SELECT *
FROM Tweet b
WHERE EXISTS
(SELECT *
FROM Tweet
WHERE content = b.content
AND writerName != b.writerName);


SELECT 'Find the tweets favorited by at least one user' as '';
SELECT Tweet.writerName,Tweet.tweetTime,Tweet.content
FROM Tweet, Favorite
WHERE Tweet.tweetTime = Favorite.tweetTime
AND Tweet.writerName = Favorite.writerName;


SELECT 'Find all tweets send by the users who have at least one followed user' as '';
SELECT *
FROM Tweet a
WHERE EXISTS
(SELECT *
FROM Follow
WHERE a.writerName = userNameFollowed);




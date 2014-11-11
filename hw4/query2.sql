SELECT *
FROM Tweet
Where writerName = 'user1' OR writerName = 'user2';

SELECT *
FROM User
Where name = 'user4' OR name = 'user5';

SELECT *
FROM Hashtag
Where currentTrend > 200;

SELECT userNameFollow
FROM Follow
Where userNameFollowed = 'user2';

SELECT *
FROM Favorite
Where tweetTime > '2014-10-23 15:31:06' AND userName = 'user1';

SELECT *
FROM At
Where tweetTime = '2014-10-23 15:31:06' AND userName = 'user2';

SHOW TABLES;

LOAD DATA LOCAL INFILE 'data/users.txt'
REPLACE INTO TABLE User
FIELDS TERMINATED BY '	'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, timezone, language, email);

LOAD DATA LOCAL INFILE 'data/tweets.txt'
REPLACE INTO TABLE Tweet
FIELDS TERMINATED BY '	'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tweetID, writerName, content);

LOAD DATA LOCAL INFILE 'data/follows.txt'
REPLACE INTO TABLE Follow
FIELDS TERMINATED BY '	'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(username_leader, username_follower);

LOAD DATA LOCAL INFILE 'data/favorites.txt'
REPLACE INTO TABLE Favorite
FIELDS TERMINATED BY '	'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(userName, tweetID);


LOAD DATA LOCAL INFILE 'data/hashtags.txt'
REPLACE INTO TABLE Hashtag
FIELDS TERMINATED BY ', '
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(label, currentTrend);

LOAD DATA LOCAL INFILE 'data/ats.txt'
REPLACE INTO TABLE At
FIELDS TERMINATED BY ', '
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(userName, tweetTime, writerName);



-- SQLite
SELECT DISTINCT writer 
FROM tweets, follows, includes  
WHERE tweets.writer = follows.flwee
AND tweets.writer = includes.member;

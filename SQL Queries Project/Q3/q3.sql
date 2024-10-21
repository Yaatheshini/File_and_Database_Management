-- SQLite
SELECT DISTINCT t1.writer
FROM tweets t1, tweets t2, tweets t3, follows
WHERE t1.writer = t2.writer 
AND t2.writer = t3.writer
AND lower(t1.text) like '%edmonton%'
AND lower(t2.text) like '%edmonton%' 
AND lower(t3.text) like '%edmonton%'
AND t1.text <> t2.text 
AND t2.text <> t3.text
AND t1.text <> t3.text
EXCEPT 
SELECT DISTINCT tweets.writer
FROM tweets, follows
WHERE tweets.writer = follows.flwee;

-- SQLite
SELECT DISTINCT u.usr, u.name
FROM users u, tweets t1, tweets t2
WHERE u.usr = t1.writer
AND t1.writer = t2.writer
AND t1.text <> t2.text

AND NOT EXISTS
(SELECT flwee FROM follows WHERE flwer IN
(SELECT DISTINCT flwer 
FROM follows, users 
WHERE users.usr = follows.flwer 
AND lower(users.name) LIKE 'john doe') 

AND NOT EXISTS 
(SELECT DISTINCT f.flwer
FROM follows f
WHERE f.flwer = u.usr AND f.flwee = follows.flwee));

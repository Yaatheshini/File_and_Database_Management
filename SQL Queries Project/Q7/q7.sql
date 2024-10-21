-- SQLite

SELECT t1.lname

FROM (SELECT lname
FROM includes
GROUP BY (lname)
HAVING COUNT(member) > 6) AS t1, 

(SELECT f.flwer
FROM follows f, users u
WHERE f.flwee = u.usr
AND lower(u.name) = 'john doe') AS t2,

includes i

WHERE i.lname = t1.lname
AND i.member = t2.flwer
GROUP BY t1.lname

HAVING COUNT(DISTINCT i.member) >= 0.5 * (SELECT COUNT(i.member)
FROM includes i2
WHERE i2.lname = t1.lname);

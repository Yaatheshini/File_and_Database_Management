-- SQLite
SELECT DISTINCT f1.flwer
FROM follows f1, follows f2, users u
WHERE f2.flwer = u.usr
AND lower(u.name) like 'john doe'
AND (julianday('now') - julianday(f2.start_date)) < 90
AND f2.flwee = f1.flwee
AND (julianday('now') - julianday(f1.start_date)) >= 90;

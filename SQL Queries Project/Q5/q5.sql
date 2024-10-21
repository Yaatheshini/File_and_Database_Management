-- SQLite
SELECT DISTINCT t.writer, t.text, t.tdate
FROM tweets t, retweets r1, retweets r2, retweets r3, follows f1, follows f2, follows f3
WHERE t.writer = r1.writer
AND t.tdate = r1.tdate AND t.tdate = r2.tdate AND t.tdate = r3.tdate
AND f1.flwee = t.writer AND f2.flwee = t.writer AND f3.flwee = t.writer
AND f1.flwer <> f2.flwer 
AND f2.flwer <> f3.flwer
AND f1.flwer <> f3.flwer
AND f1.flwer = r1.usr
AND f2.flwer = r2.usr
AND f3.flwer = r3.usr; 

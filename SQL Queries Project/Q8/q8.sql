-- SQLite

SELECT strftime('%m', t.tdate) AS 'Month',
SUM(CASE WHEN t.replyto_w IS NULL AND t.replyto_d IS NULL THEN 1 ELSE 0 END) AS 'Total Tweets',
SUM(CASE WHEN t.replyto_w IS NOT NULL OR t.replyto_d IS NOT NULL THEN 1 ELSE 0 END) AS 'Total Replies',
(SELECT COUNT(*) FROM retweets r WHERE strftime('%Y-%m', r.rdate) = strftime('%Y-%m', t.tdate)) AS 'Total Retweets',
SUM(CASE WHEN t.replyto_w IS NULL AND t.replyto_d IS NULL THEN 1 ELSE 0 END) +
SUM(CASE WHEN t.replyto_w IS NOT NULL OR t.replyto_d IS NOT NULL THEN 1 ELSE 0 END) +
(SELECT COUNT(*) FROM retweets r WHERE strftime('%Y-%m', r.rdate) = strftime('%Y-%m', t.tdate)) AS 'Sum of Tweets, Replies, and Retweets'

FROM tweets t
    
WHERE strftime('%Y', t.tdate) = '2023'
    
GROUP BY strftime('%Y-%m', t.tdate);

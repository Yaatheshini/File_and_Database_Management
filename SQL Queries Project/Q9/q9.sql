-- SQLite

CREATE VIEW tStat AS
SELECT DISTINCT t.writer, t.tdate, t.text,
(SELECT COUNT(*) FROM tweets WHERE replyto_w = t.writer AND replyto_d = t.tdate) AS rep_cnt,
(SELECT COUNT(*) FROM retweets WHERE writer = t.writer AND tdate = t.tdate) AS ret_cnt,
IFNULL ((SELECT MAX(m1.count1) 
FROM (SELECT *,COUNT(term) as count1
FROM mentions 
GROUP BY (term)) AS m1, mentions m2
WHERE m1.term = m2.term
AND m2.writer = t.writer 
AND m2.tdate = t.tdate),0) AS sim_cnt 

FROM tweets t

ORDER BY t.writer ASC;

SELECT * from tStat;

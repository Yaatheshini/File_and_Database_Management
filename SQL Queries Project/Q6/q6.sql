-- SQLite

SELECT writer, tdate, text

FROM (SELECT t.writer, t.tdate, t.text, 
RANK() OVER(
ORDER BY count DESC) AS rank

FROM (SELECT t.writer, t.tdate, t.text, COUNT(r.writer) AS count
FROM tweets t, retweets r
WHERE t.writer = r.writer
AND t.tdate = r.tdate
GROUP BY t.writer, t.tdate, t.text
ORDER BY COUNT(r.writer) DESC) AS t) AS t

WHERE rank <= 3;

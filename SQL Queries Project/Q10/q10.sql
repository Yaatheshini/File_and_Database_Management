-- SQLite

WITH follower_rank AS (SELECT flwee, 
RANK () OVER (ORDER BY COUNT(*) DESC) rank
FROM follows 
GROUP BY flwee),
retweet_rank AS (SELECT writer, 
RANK () OVER (ORDER BY AVG(ret_cnt) DESC) rank
FROM tStat 
GROUP BY writer)

SELECT usr, CASE 
WHEN usr IN (SELECT flwee FROM follower_rank WHERE rank <= 2) THEN 'top in followers'
WHEN usr IN (SELECT writer FROM retweet_rank WHERE rank = 1) THEN 'top in retweets'
END AS 'top in retweets'

FROM users

WHERE usr IN (SELECT flwee FROM follower_rank WHERE rank <= 2)
OR usr IN (SELECT writer FROM retweet_rank WHERE rank = 1);

SELECT score, thumbsUpCount, content
FROM reviews
WHERE theme = 'Bugs and technical issues'
  AND score <= 2
ORDER BY thumbsUpCount DESC
LIMIT 30;

SELECT COUNT(*) AS total_bug_negatives,
       SUM(content LIKE '%update%') AS mention_update,
       SUM(content LIKE '%progress%' OR content LIKE '%lost%' OR content LIKE '%reset%') AS mention_progress_loss
FROM reviews
WHERE theme = 'Bugs and technical issues' AND score <= 2;

SELECT COUNT(*) AS total_bug_negatives,
       SUM(content LIKE '%progress%' OR content LIKE '%lost%' OR content LIKE '%reset%'
        OR content LIKE '%streak%' OR content LIKE '%xp%' OR content LIKE '%points%'
        OR content LIKE '%gems%' OR content LIKE '%diamond%' OR content LIKE '%credit%'
        OR content LIKE '%track%' OR content LIKE '%wiped%' OR content LIKE '%deleted%') AS broad_progress_loss,
       SUM(content LIKE '%update%'
        AND (content LIKE '%progress%' OR content LIKE '%lost%' OR content LIKE '%reset%'
        OR content LIKE '%streak%' OR content LIKE '%xp%')) AS update_and_progress
FROM reviews
WHERE theme = 'Bugs and technical issues' AND score <= 2;

SELECT score, LENGTH(content) AS len, content
FROM reviews
WHERE theme = 'Bugs and technical issues' AND score <= 2
  AND content LIKE '%update%'
  AND (content LIKE '%progress%' OR content LIKE '%streak%' OR content LIKE '%lost%')
ORDER BY len
LIMIT 15;

SELECT score, LENGTH(content) AS len, content
FROM reviews
WHERE theme = 'Bugs and technical issues' AND score <= 2
  AND content LIKE '%update%'
ORDER BY len
LIMIT 22;

SELECT COUNT(*) AS total_bug_negatives,
       SUM(content LIKE '%server%' OR content LIKE '%offline%' OR content LIKE '%connect%'
        OR content LIKE '%sign in%' OR content LIKE '%log in%' OR content LIKE '%login%') AS connection_or_login
FROM reviews
WHERE theme = 'Bugs and technical issues' AND score <= 2;
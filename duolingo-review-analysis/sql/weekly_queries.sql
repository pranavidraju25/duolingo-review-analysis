SELECT date(at, 'weekday 0', '-6 days') AS week_start,
       COUNT(*) AS n_reviews,
       SUM(is_negative) AS n_negative
FROM r
GROUP BY week_start
ORDER BY week_start;

WITH weekly AS (
  SELECT date(at, 'weekday 0', '-6 days') AS week_start,
         theme_group,
         COUNT(*) AS n_negative
  FROM r
  WHERE is_negative = 1
  GROUP BY week_start, theme_group
),
totals AS (
  SELECT week_start, SUM(n_negative) AS week_total
  FROM weekly
  GROUP BY week_start
)
SELECT w.week_start,
       w.theme_group,
       w.n_negative,
       t.week_total,
       ROUND(100.0 * w.n_negative / t.week_total, 1) AS pct_of_week_negative
FROM weekly w
JOIN totals t ON w.week_start = t.week_start
ORDER BY w.week_start, w.n_negative DESC;


SELECT theme_group,
       COUNT(*) AS n_reviews,
       ROUND(AVG(score), 2) AS avg_rating,
       ROUND(AVG(score) - (SELECT AVG(score) FROM r), 2) AS gap_vs_overall,
       ROUND(COUNT(*) * ((SELECT AVG(score) FROM r) - AVG(score)), 1) AS rating_drag
FROM r
GROUP BY theme_group
ORDER BY rating_drag DESC;

SELECT theme_group,
       COUNT(*) AS n_reviews,
       SUM(is_negative) AS n_negative,
       ROUND(100.0 * SUM(is_negative) / (SELECT SUM(is_negative) FROM r), 1) AS pct_of_negative,
       ROUND(100.0 * SUM(is_negative) / COUNT(*), 0) AS negative_rate,
       ROUND(AVG(score), 2) AS avg_rating
FROM r
WHERE theme_group NOT IN ('Other', 'Learning effectiveness and ease')
GROUP BY theme_group
HAVING COUNT(*) >= 50
ORDER BY n_negative DESC;
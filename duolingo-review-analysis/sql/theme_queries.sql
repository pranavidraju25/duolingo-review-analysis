select * from reviews

SELECT theme, COUNT(*) AS n
FROM reviews
GROUP BY theme
ORDER BY n DESC;

SELECT COUNT(*) AS n_reviews, MIN(at) AS first_review, MAX(at) AS last_review
FROM reviews;

CREATE VIEW r AS
SELECT id, at, score, content, sentiment,
       CASE WHEN theme IN ('Pricing and paywall', 'Billing and cancellation')
            THEN 'Pricing and billing' ELSE theme END AS theme_group,
       CASE WHEN score <= 2 THEN 1 ELSE 0 END AS is_negative
FROM reviews;

SELECT theme,
       COUNT(*) AS n_negative,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM reviews WHERE score = 1), 1) AS pct_of_negative
FROM reviews
WHERE score = 1
GROUP BY theme
ORDER BY n_negative DESC;

SELECT theme_group,
       COUNT(*) AS n_reviews,
       ROUND(AVG(score), 2) AS avg_rating
FROM r
GROUP BY theme_group
ORDER BY avg_rating;

SELECT theme_group,
       COUNT(*) AS n_reviews,
       SUM(is_negative) AS n_negative,
       ROUND(100.0 * SUM(is_negative) / (SELECT SUM(is_negative) FROM r), 1) AS pct_of_negative,
       ROUND(AVG(score), 2) AS avg_rating
FROM r
GROUP BY theme_group
ORDER BY n_negative DESC;

SELECT theme_group,
       COUNT(*) AS n_reviews,
       SUM(is_negative) AS n_negative,
       ROUND(100.0 * SUM(is_negative) / (SELECT SUM(is_negative) FROM r), 1) AS pct_of_negative,
       ROUND(100.0 * SUM(is_negative) / COUNT(*), 1) AS negative_rate,
       ROUND(AVG(score), 2) AS avg_rating
FROM r
GROUP BY theme_group
ORDER BY n_negative DESC;
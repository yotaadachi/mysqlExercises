USE day_4_9_db;

SELECT DATABASE();

SELECT * FROM users;

SELECT
 *,
 CASE birth_place
 WHEN "日本" THEN "日本人"
 WHEN "Iraq" THEN "イラク人"
 ELSE "外国人"
 END AS "国籍"
FROM
 users
WHERE
 age >= 30;
 
SELECT * FROM prefectures;

SELECT
 name,
 CASE
  WHEN name IN("香川県", "愛媛県", "徳島県", "高知県") THEN "四国"
  WHEN name IN("兵庫県", "大阪府", "京都府", "滋賀県", "奈良県", "三重県", "和歌山県") THEN "近畿"
  ELSE "その他"
  END AS "地域名"
FROM
 prefectures;

-- 計算
SELECT
 name,
 birth_day,
 CASE
  WHEN DATE_FORMAT(birth_day, "%Y") % 4 = 0 AND 
  DATE_FORMAT(birth_day, "%Y") % 100 <> 0 THEN "うるう年"
  ELSE "うるう年ではない"
END AS "うるう年か"
FROM users;

SELECT 
 *,
 CASE
  WHEN student_id % 3 = 0 THEN test_score_1
  WHEN student_id % 3 = 1 THEN test_score_2
  WHEN student_id % 3 = 2 THEN test_score_3
 END AS score
FROM tests_score;
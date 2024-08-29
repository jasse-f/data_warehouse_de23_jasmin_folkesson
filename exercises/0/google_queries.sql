-- Go into marketplace under data products in snowsight. Search and get the following dataset Google Keywords search dataset - discover all searches on Google.
USE ROLE ACCOUNTADMIN;


SHOW DATABASES;

USE DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW SCHEMAS;

SHOW VIEWS;

SHOW TABLES IN SCHEMA DATAFEEDS;
SHOW TABLES IN SCHEMA INFORMATION_SCHEMA;

USE SCHEMA DATAFEEDS;

DESC TABLE Google_Keywords;


SELECT * FROM GOOGLE_KEYWORDS LIMIT 3;

-- Now create a worksheet on your local repository and start querying this data through snowsql.

--   a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.

--   b) Find out the columns and its data types in the table GOOGLE_KEYWORDS.

-- We will now do some exploratory data analysis (EDA) of this dataset.


--   c) Find out number of rows in the dataset.

SELECT COUNT(*) FROM google_keywords;


--   d) When is the first search and when is the latest search in the dataset?

SELECT * FROM GOOGLE_KEYWORDS ORDER BY DATE LIMIT 1;
SELECT * FROM GOOGLE_KEYWORDS ORDER BY DATE DESC LIMIT 1;

SELECT DISTINCT DATE FROM GOOGLE_KEYWORDS;

--   e) Which are the 10 most popular keywords?

SELECT KEYWORD, Count(*) AS Occurences
FROM GOOGLE_KEYWORDS
GROUP BY KEYWORD
ORDER BY Occurences DESC
LIMIT 10;

--   f) How many unique keywords are there?
SELECT COUNT(DISTINCT KEYWORD)
FROM GOOGLE_KEYWORDS;


--   g) Check what type of platforms are used and how many users per platform
SELECT PLATFORM, SUM(CALIBRATED_USERS) AS AmountOfUsers
FROM GOOGLE_KEYWORDS
GROUP BY PLATFORM;



--   h) Let's dive into what swedish people are searching. Go into worldbanks country codes to find out the country code for Sweden. Find the 20 most popular keywords and the number of searches of that keyword.
SELECT KEYWORD , SUM(CALIBRATED_CLICKS) AS AmountOfSearches
FROM GOOGLE_KEYWORDS
WHERE COUNTRY = 752
GROUP BY KEYWORD
ORDER BY AmountOfSearches DESC
LIMIT 20;


--   i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify. For now it's okay to list the country codes, later we'll join this with the actual country to get more useful information to the stakeholders.

SELECT COUNTRY, SUM(CALIBRATED_CLICKS) AmountOfSearches
FROM GOOGLE_KEYWORDS
WHERE KEYWORD = 'spotify'
GROUP BY COUNTRY
ORDER BY AmountOfSearches DESC
LIMIT 10;



--   j) Feel free to do additional explorations of this dataset.


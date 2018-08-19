-- Observe the result of running this SQL command to show the name, continent and population of all countries

SELECT name, continent, population FROM world;

-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million. 
-- HELP:How to calculate per capita GDP per capita GDP is the GDP divided by the population GDP/population

select name, gdp/population from world where population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. 
-- Divide the population by 1000000 to get population in millions.

select name, population/1000000 from world where continent='Asia'

-- Show the name and population for France, Germany, Italy

select name, population from world where name in ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'

select name from world where name like '%United%'

-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.

select name, population, area from world where area > 3000000 or population > 250000000

-- Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.

select name, population, area from world where (area > 3000000 AND population < 250000000) OR (area < 3000000 AND population > 250000000)

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
-- Use the ROUND function to show the values to two decimal places.
-- For South America show population in millions and GDP in billions both to 2 decimal places. Millions and billions
-- Divide by 1000000 (6 zeros) for millions. Divide by 1000000000 (9 zeros) for billions

select name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) from world  where continent='South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). 
-- Round this value to the nearest 1000. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

select name, ROUND(gdp/population,-3) from world where gdp >=1000000000000

-- Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters.
-- Show the name and capital where the name and the capital have the same number of characters.
-- You can use the LENGTH function to find the number of characters in a string

SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital)

-- The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character. You can use <> as the NOT EQUALS operator.

SELECT name, capital FROM world  WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

-- Find the country that has all the vowels and no spaces in its name.

SELECT name
FROM world
WHERE (name LIKE '%A%' AND 
     name LIKE '%E%' AND 
     name LIKE '%I%' AND 
     name LIKE '%O%' AND 
     name LIKE '%U%') 
AND name NOT LIKE '% %'

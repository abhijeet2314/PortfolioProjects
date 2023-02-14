
SELECT *
FROM portfolioproject1.dbo.coviddeaths_11dec$
ORDER BY 3,4


/*
SELECT *
FROM portfolioproject1.dbo.covidvaccinations_11dec$
ORDER BY 3,4
*/





--  looking at total cases vs total deaths
-- shows likelihood of dying if you get covid in India

SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 1) AS Death_Percentage
FROM PortfolioProject1..coviddeaths_11dec$
where location like 'India'
ORDER BY 1,2





-- looking at total cases vs population
SELECT location, date, total_cases, population, ROUND((total_cases/population)*100, 1) AS Percentage_Population_Infected
FROM PortfolioProject1..coviddeaths_11dec$
where location like 'India'
ORDER BY Percentage_of_total_cases_compared_to_population DESC



-- calculate highest infection rates compared to population
SELECT location, population, MAX(total_cases) AS highest_infection_count, ROUND(MAX(total_cases/population)*100, 1) AS Percentage_Population_Infected
FROM PortfolioProject1..coviddeaths_11dec$

group by location, population
ORDER BY Percentage_Population_Infected DESC





-- showing countries with highest death count per population
SELECT location, MAX(cast(total_deaths AS int)) AS Total_death_count
FROM PortfolioProject1..coviddeaths_11dec$
where continent IS NOT NULL
group by location
ORDER BY Total_death_count DESC




-- let's find total deaths by location 
SELECT location, MAX(cast(total_deaths AS int)) AS Total_death_count
FROM PortfolioProject1..coviddeaths_11dec$
where continent IS NULL
group by location
ORDER BY Total_death_count DESC





--showing continents with highest death count per  population

SELECT continent, MAX(cast(total_deaths AS int)) AS Total_death_count
FROM PortfolioProject1..coviddeaths_11dec$
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Total_death_count DESC



-- GLOBAL NUMBERS

SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_death, SUM(cast(new_deaths AS int))/SUM(new_cases)*100 AS Death_Percentage
FROM PortfolioProject1..coviddeaths_11dec$
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2






SELECT *
FROM continents_death_count

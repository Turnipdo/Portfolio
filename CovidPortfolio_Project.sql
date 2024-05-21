SELECT location, Date_Record, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM Portfolio_Project..CovidDeaths
WHERE location like '%taiwan'
ORDER BY 1,2

-- Looking at Total Cases vs Popoulation
-- Shows what percentage of popoulation get COVID
SELECT location, Date_Record, total_cases,total_deaths, (total_cases/population)*100 as PercentPopulationInfected
FROM Portfolio_Project..CovidDeaths
WHERE location = 'Taiwan'
ORDER BY 1,2


-- What country has the highest infection rate
SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM Portfolio_Project..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- Show countries with highest death count per population
SELECT location, MAX(total_deaths) as HighestDeathCount
FROM Portfolio_Project..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY HighestDeathCount DESC

-- Breakdown by continent
SELECT location, MAX(total_deaths) as HighestDeathCount
FROM Portfolio_Project..CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY HighestDeathCount DESC

-- Global Numbers
SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM Portfolio_Project..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

-- Looking at Total Population vs Vaccinations
WITH PopvsVacc AS(
SELECT dea.continent, dea.location, dea.Date_Record, dea.population, vac.new_vaccinations, 
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.Date_Record) as RollingSumVacc
FROM Portfolio_Project..CovidDeaths dea
JOIN Portfolio_Project..CovidVaccination vac ON dea.location = vac.location AND dea.Date_Record = vac.Date_Record
WHERE dea.continent IS NOT NULL
)

SELECT *, (RollingSumVacc/population)*100
FROM PopvsVacc

-- Creating view to store data for later visualization
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.Date_Record, dea.population, vac.new_vaccinations, 
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.Date_Record) as RollingSumVacc
FROM Portfolio_Project..CovidDeaths dea
JOIN Portfolio_Project..CovidVaccination vac ON dea.location = vac.location AND dea.Date_Record = vac.Date_Record
WHERE dea.continent IS NOT NULL
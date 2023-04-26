SELECT *
FROM BellaBeats.dbo.SleepDay

SELECT *
FROM BellaBeats.dbo.weight


-- DISTINCT ID's PER TABLE ACTIVITY, SLEEP, WEIGHT. 
SELECT
COUNT(DISTINCT BellaBeats.dbo.DailyActivity.Id) AS Participants_Activity,
COUNT(DISTINCT BellaBeats.dbo.SleepDay.Id) AS Participants_Sleep,
COUNT(DISTINCT BellaBeats.dbo.weight.Id) AS Participants_Weight
FROM BellaBeats.dbo.DailyActivity, BellaBeats.dbo.SleepDay, BellaBeats.dbo.weight


-- AVERAGES FOR STEPS, SEDENTARY TIME, LIGHTLY AVERAGE, FAIRLY ACTIVE AND VERY ACTIVE MINUTES FOR ALL THE PARTICIPANTS.

SELECT
AVG(BellaBeats.dbo.DailyActivity.TotalSteps) AS Steps_Average,
AVG(BellaBeats.dbo.DailyActivity.SedentaryMinutes) AS Sedentary_Average,
AVG(BellaBeats.dbo.DailyActivity.LightlyActiveMinutes) AS LightlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.FairlyActiveMinutes) AS FairlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.VeryActiveMinutes) AS VeryActive_Average,
AVG(BellaBeats.dbo.SleepDay.TotalMinutesAsleep) AS Sleep_Average
FROM BellaBeats.dbo.DailyActivity, BellaBeats.dbo.SleepDay


-- NUMBER OF PEOPLE WHO DID'T COUNT THEIR STEPS

SELECT COUNT(TotalSteps) AS ZeroSteps
FROM BellaBeats.dbo.DailyActivity
WHERE TotalSteps = 0


-- AVERAGE STEPS, SEDENTARY MINUTES, LIGHTLY ACTIVE MINUTES, FAIRLY ACTIVE MINUTES, VERY ACTIVE MINUTES FOR EACH PARTICIPANT WITH A TOTAL STEPS COUNT
SELECT
AVG(BellaBeats.dbo.DailyActivity.TotalSteps) AS Steps_Average,
AVG(BellaBeats.dbo.DailyActivity.SedentaryMinutes) AS Sedentary_Average,
AVG(BellaBeats.dbo.DailyActivity.LightlyActiveMinutes) AS LightlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.FairlyActiveMinutes) AS FairlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.VeryActiveMinutes) AS VeryActive_Average,
AVG(BellaBeats.dbo.SleepDay.TotalMinutesAsleep) AS Sleep_Average
FROM BellaBeats.dbo.DailyActivity, BellaBeats.dbo.SleepDay
WHERE TotalSteps <> 0


-- MOST/LEASST ACTIVE DAYS ON AVERAGE BY ACTIVITY DATE (AVERAGE STEPS BY ACTIVITY DATE)

SELECT
ActivityDate,
AVG(BellaBeats.dbo.DailyActivity.TotalSteps) AS Steps_Average,
AVG(BellaBeats.dbo.DailyActivity.SedentaryMinutes) AS Sedentary_Average,
AVG(BellaBeats.dbo.DailyActivity.LightlyActiveMinutes) AS LightlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.FairlyActiveMinutes) AS FairlyActive_Average,
AVG(BellaBeats.dbo.DailyActivity.VeryActiveMinutes) AS VeryActive_Average
FROM BellaBeats.dbo.DailyActivity
WHERE TotalSteps <> 0
GROUP BY ActivityDate
ORDER BY Steps_Average


-- AVERAGE STEPS BY ACTIVITY HOUR

SELECT *
FROM BellaBeats.dbo.hourlySteps

SELECT ActivityHour, AVG(StepTotal) AS Steps
FROM BellaBeats.dbo.hourlySteps
GROUP BY ActivityHour
ORDER BY Steps DESC


-- GROUP THEM INTO SEDENTARY LIFESTYLES

SELECT Id, 
Avg(TotalSteps) AS Steps_Average, 
AVG(Calories) AS Calories_Average,
AVG(TotalDistance) as Average_distance
FROM BellaBeats.dbo.DailyActivity
GROUP BY Id
ORDER BY Steps_Average DESC


-- AVERAGE SLEEP

SELECT Id, AVG(TotalMinutesAsleep) as DailySleep_Average
FROM BellaBeats.dbo.SleepDay 
GROUP BY Id


-- AVERAGE SLEEP PER DAY
SELECT DATENAME(WEEKDAY, SleepDay) as Weekday, AVG(TotalMinutesAsleep) as Daily_Sleep
FROM BellaBeats.dbo.SleepDay 
GROUP BY DATENAME(WEEKDAY, SleepDay)


-- AVERAGE STEPS PER DAY
SELECT DATENAME(WEEKDAY, ActivityDate) as Weekday,
AVG(TotalSteps) as Daily_Steps
FROM BellaBeats.dbo.DailyActivity
GROUP BY DATENAME(WEEKDAY, ActivityDate)

SELECT Id, AVG(TotalDistance) as Average_distance
FROM BellaBeats.dbo.DailyActivity
GROUP BY Id

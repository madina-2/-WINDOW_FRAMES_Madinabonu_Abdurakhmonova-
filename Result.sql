
SELECT
    WeekNumber,
    DayOfWeek,
    SUM(Amount) AS WeeklySales,
    SUM(SUM(Amount)) OVER (ORDER BY WeekNumber) AS CUM_SUM,
    AVG(Amount) OVER (PARTITION BY WeekNumber ORDER BY DayOfWeek ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS CENTERED_3_DAY_AVG
FROM
    Sales
WHERE
    (WeekNumber = 49 AND DayOfWeek IN ('Monday', 'Tuesday')) OR
    (WeekNumber = 50 AND DayOfWeek IN ('Thursday', 'Friday', 'Saturday', 'Sunday')) OR
    (WeekNumber = 51 AND DayOfWeek IN ('Thursday', 'Friday', 'Saturday', 'Sunday'))
GROUP BY
    WeekNumber, DayOfWeek, Amount
ORDER BY
    WeekNumber, DayOfWeek;





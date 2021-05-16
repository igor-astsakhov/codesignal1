CREATE PROCEDURE alarmClocks()
BEGIN

    WITH RECURSIVE cte ( alarm_date ) AS 
    (
        SELECT input_date FROM userInput
        UNION ALL 
        SELECT DATE_ADD( alarm_date, INTERVAL 1 WEEK )
        FROM cte 
        WHERE YEAR( DATE_ADD( alarm_date, INTERVAL 1 WEEK ) ) < YEAR( alarm_date ) + 1
    )
    SELECT alarm_date FROM cte;

END

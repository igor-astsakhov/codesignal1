CREATE PROCEDURE soccerGameSeries()
BEGIN
   
	/* Write your SQL here. Terminate each statement with a semicolon. */
    select IF( f>s, 1,
        IF( s=f, 
            IF( g1-g2 > 0, 1, 
                IF( g1=g2,
                    IF( a1>a2,1,
                        IF(a1=a2,0,2)
                    ), 2
                )
            ), 
        2 )
    ) winner
    from( 
    SELECT 
    SUM(IF(first_team_score>second_team_score, 1,0)) f,
    SUM(IF(first_team_score<second_team_score, 1,0)) s,
    SUM(first_team_score) g1,
    SUM(second_team_score) g2,
    SUM(IF(match_host=2,first_team_score,0)) a1,
    SUM(IF(match_host=1,second_team_score,0)) a2
    from scores
    ) t 
    ;
END

PROGRAM StringSorted(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3, Ch4, Ch5, Ch6, Ch7, Staple, Semicolon: CHAR;  
BEGIN
  Ch1 := ' ';  {Инициализация}
  Ch2 := ' ';
  Ch3 := ' ';
  Ch4 := ' ';
  Ch5 := ' ';
  Ch6 := ' ';
  Ch7 := ' ';
  Staple := 'N';
  Semicolon := 'N';
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      Ch1 := Ch2; {Сдвиг окна}
      Ch2 := Ch3;                  
      Ch3 := Ch4;
      Ch4 := Ch5;
      READ(Ch5);
      Semicolon := 'N';
      IF (Ch5 = '(') OR (Ch6 = '(') {Проверка на скобочки}
      THEN
        Staple := 'Y';      
      IF Ch5 = ')'
      THEN
        Staple := 'N';              
      IF Staple = 'N'                    
      THEN
        BEGIN
          WHILE (Ch5 = ' ') AND (NOT EOLN(INPUT)) 
          DO
            BEGIN
              READ(Ch5);
              IF Ch4 = ';'
              THEN
                Semicolon := 'Y';
              IF Ch5 = '('
              THEN
                Staple := 'Y'  
            END;                   
          IF Ch5 = 'B'
          THEN
            BEGIN
              Ch4 := Ch5;
              READ(Ch5);
              IF Ch5 = 'E'
              THEN
                BEGIN
                  Ch3 := Ch4;
                  Ch4 := Ch5;
                  READ(Ch5);
                  IF Ch5 = 'G'
                  THEN
                    BEGIN
                      Ch2 := Ch3;
                      Ch3 := Ch4;
                      Ch4 := Ch5;
                      READ(Ch5);
                      IF Ch5 = 'I'
                      THEN
                        BEGIN
                          Ch1 := Ch2;
                          Ch2 := Ch3;
                          Ch3 := Ch4;
                          Ch4 := Ch5;
                          READ(Ch5);
                          IF Ch5 = 'N'
                          THEN
                            BEGIN
                              WRITELN(Ch1, Ch2, Ch3, Ch4, Ch5);
                              WRITE('  ');
                              Ch1 := Ch2; {Сдвиг окна}
                              Ch2 := Ch3;                  
                              Ch3 := Ch4;
                              Ch4 := Ch5;
                              READ(Ch5);
                              WHILE Ch5 = ' '
                              DO
                                READ(Ch5)
                            END
                        END
                    END
                END  
            END;
          IF Ch5 = ';' 
          THEN
            BEGIN
              Semicolon := 'Y';
              WRITE(Ch5);                                
              WHILE (Ch5 = ';') AND (NOT EOLN(INPUT))
              DO
                BEGIN
                  READ(Ch5);
                  WHILE (Ch5 = ' ') AND (NOT EOLN(INPUT))
                  DO
                    READ(Ch5);
                  IF Ch5 = ';'
                  THEN
                    WRITE(Ch5)
                END;
              WRITELN; 
              WHILE (Ch5 = ' ') AND (NOT EOLN(INPUT))
              DO
                READ(Ch5); 
              IF Ch5 <> 'E'
              THEN
                WRITE('  ')                              
            END;
          IF Ch5 = 'E' {Проверка на END}
          THEN
            BEGIN
              Ch6 := Ch5;
              READ(Ch5);
              WHILE Ch5 = ' '
              DO
                READ(Ch5);
              IF Ch5 = 'N'
              THEN
                BEGIN
                  Ch7 := Ch6;
                  Ch6 := Ch5;
                  READ(Ch5);
                  IF Ch5 = 'D'
                  THEN
                    BEGIN
                      IF Semicolon = 'N'
                      THEN
                        WRITELN;
                      WRITE(Ch7, Ch6, Ch5)
                    END
                  ELSE
                    WRITE(Ch7, Ch6, Ch5)
                END  
              ELSE
                BEGIN
                  IF Ch5 = '('
                  THEN
                    Staple := 'Y';
                  IF Ch5 = ' '
                  THEN
                    WRITE(Ch6);
                  IF Ch5 = ';'
                  THEN
                    BEGIN
                      Semicolon := 'Y';
                      WRITELN(Ch6, Ch5);
                      WRITE('  ')
                    END  
                  ELSE
                    WRITE(Ch6, Ch5)  
                END  
            END
          ELSE
            IF Ch5 <> ';'
            THEN     
              WRITE(Ch5)                                                                                              
        END
      ELSE {Для открытой скобочки}
        BEGIN
          WHILE Ch5 = ' '
          DO
            BEGIN
              READ(Ch5);
              IF Ch5 = ')'
              THEN
                Staple := 'N'
            END;               
          IF Ch5 = ','
          THEN
            WRITE(Ch5, ' ')
          ELSE
            WRITE(Ch5)
        END      
    END
END.      

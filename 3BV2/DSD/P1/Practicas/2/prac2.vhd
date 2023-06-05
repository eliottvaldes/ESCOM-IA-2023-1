-- ARCHITECTURE DECLARATION FOR THE COMPONENT
ARCHITECTURE A_P2 OF P2 IS
BEGIN
PROCESS (CLK, CLR, PRE, SEL, SR, JK, T, D)
BEGIN
IF (CLR = '0') THEN
    Q <= "01";

ELSIF (CLK'EVENT AND CLK = '1') THEN
    IF (PRE = '1') THEN
        Q(1) <= '1';
        Q(0) <= '0';

    -- DECLARATION OF MUX 4-1
    ELSE
        CASE SEL IS
            WHEN "00" =>
                -- DESCRIBE THE CHARACTERISTIC EQUATION OF FLIP FLOP SR
                -- DESCRIBE AS A VECTOR
                -- DESCRIBE THE OUTPUT OF THE FLIP FLOP
                Q(1) <= (SR(1) AND (NOT Q(0))) OR (SR(0) AND Q(0));
                Q(0) <= (NOT SR(1) AND (NOT Q(0))) OR (SR(0) AND (NOT Q(1)));


            WHEN "01" =>
                -- DESCRIBE THE CHARACTERISTIC EQUATION OF FLIP FLOP JK
                Q(1) <= JK(1) AND (NOT Q(0)) OR (NOT JK(0)) AND Q(0);
                Q(0) <= NOT (JK(1) AND (NOT Q(0)) OR (NOT JK(0)) AND Q(0));


            WHEN "10" =>
                -- DESCRIBE THE CHARACTERISTIC EQUATION OF FLIP FLOP T
                Q(1) <= T AND (NOT Q(0)) OR (NOT T) AND Q(0);
                Q(0) <= NOT (T AND (NOT Q(0)) OR (NOT T) AND Q(0));


            WHEN OTHERS =>
                -- DESCRIBE THE CHARACTERISTIC EQUATION OF FLIP FLOP D
                -- new
                Q(1) <= D;
                Q(0) <= NOT D;


        END CASE;
    END IF;
END IF;
END PROCESS;
END A_P2;
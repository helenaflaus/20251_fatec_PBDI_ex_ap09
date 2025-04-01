--Nota. Para cada exercício, produza duas soluções: uma que utilize apenas IF e suas
--variações e outra que use apenas CASE e suas variações.
--Nota. Para cada exercício, gere valores aleatórios conforme a necessidade. Use a função
--do Bloco de Código 1.1.

--1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
--IF
DO $$
DECLARE
    n1 INT;
BEGIN
    n1 := valor_aleatorio_entre(1,30);
    IF n1 % 3 = 0 AND n1 % 5 <> 0 THEN
        RAISE NOTICE '% é múltiplo de 3', n1::INT;
    ELSIF n1 % 5 = 0 AND  n1 % 3 <> 0 THEN
        RAISE NOTICE '% é múltiplo de 5', n1::INT;
    ELSIF n1 % 5 = 0 AND n1 % 3 = 0 THEN
        RAISE NOTICE '% é múltiplo de 3 e de 5', n1::INT;
    ELSE
        RAISE NOTICE '% não é múltiplo de 3 nem de 5', n1::INT;
    END IF;
END
$$;

--CASE
DO $$
DECLARE
    n1 INT;
BEGIN
    n1 := valor_aleatorio_entre(1,30);
    CASE
        WHEN n1 % 3 = 0 AND n1 % 5 <> 0 THEN
            RAISE NOTICE '% é múltiplo de 3', n1::INT;
        WHEN n1 % 5 = 0 AND  n1 % 3 <> 0 THEN
            RAISE NOTICE '% é múltiplo de 5', n1::INT;
        WHEN n1 % 5 = 0 AND n1 % 3 = 0 THEN
            RAISE NOTICE '% é múltiplo de 3 e de 5', n1::INT;
        ELSE
            RAISE NOTICE '% não é múltiplo de 3 nem de 5', n1::INT;
    END CASE;
END
$$;

--1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.
--IF
DO $$
DECLARE
    n1 INT;
BEGIN
    n1 := valor_aleatorio_entre(1,30);
    IF n1 % 3 = 0 THEN
        RAISE NOTICE '% é múltiplo de 3 ', n1::INT;
    ELSE
        RAISE NOTICE '% não é múltiplo de 3 ', n1::INT;
    END IF;
END
$$;

--CASE
DO $$
DECLARE
    n1 INT;
BEGIN
    n1 := valor_aleatorio_entre(1,30);
    CASE
        WHEN n1 % 3 = 0 THEN
            RAISE NOTICE '% é múltiplo de 3 ', n1::INT;
        ELSE
            RAISE NOTICE '% não é múltiplo de 3 ', n1::INT;
    END CASE;
END
$$;

--1.1 Bloco de Código 1.1.
CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;
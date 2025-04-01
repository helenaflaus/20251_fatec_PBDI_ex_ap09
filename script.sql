--Nota. Para cada exercício, produza duas soluções: uma que utilize apenas IF e suas
--variações e outra que use apenas CASE e suas variações.
--Nota. Para cada exercício, gere valores aleatórios conforme a necessidade. Use a função
--do Bloco de Código 1.1.

--1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. 
--Faça um programa que, dado o valor do produto, calcula o valor de venda.
--IF
DO $$
DECLARE
    prod INT := valor_aleatorio_entre(1,30);  
    lucro NUMERIC (10, 2);
    venda NUMERIC (10, 2);
BEGIN
    IF prod < 20 THEN
        lucro := prod * 0.45;
        venda := lucro + prod;
    ELSE
        lucro := prod * 0.30;
        venda := lucro + prod;
    END IF;
    RAISE NOTICE 'Produto: R$ %, lucro: R$ %, valor de venda = R$ %', prod, lucro, venda;
END
$$;

--CASE
DO $$
DECLARE
    prod INT := valor_aleatorio_entre(1,30);  
    lucro NUMERIC (10, 2);
    venda NUMERIC (10, 2);
BEGIN
    CASE
        WHEN prod < 20 THEN
            lucro := prod * 0.45;
            venda := lucro + prod;
        ELSE
            lucro := prod * 0.30;
            venda := lucro + prod;
    END CASE;
    RAISE NOTICE 'Produto: R$ %, lucro: R$ %, valor de venda = R$ %', prod, lucro, venda;
END
$$;
--CASE
DO $$
DECLARE
    prod INT := valor_aleatorio_entre(1,30);  
    lucro NUMERIC (10, 2);
    venda NUMERIC (10, 2);
BEGIN
    lucro := CASE  
        WHEN prod < 20 THEN prod * 0.45  
        ELSE prod * 0.30  
    END;  
    venda := lucro + prod; 
    RAISE NOTICE 'Produto: R$ %, lucro: R$ %, valor de venda = R$ %', prod, lucro, venda;
END
$$;


--1.3 Faça um programa que opera de acordo com o seguinte menu.
--Opções:
--1 - Soma
--2 - Subtração
--3 - Multiplicação
--4 - Divisão
--Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
--op1 op op2 = res
--Exemplo:
--2 + 3 = 5
--IF
DO $$
DECLARE
    op1 INT := valor_aleatorio_entre(1,30);  
    op2 INT := valor_aleatorio_entre(1,30);   
    opcao INT := 4; -- (1: soma, 2: subtração, 3: multiplicação, 4: divisão)
    resultado NUMERIC (10, 2);
    operador TEXT;
BEGIN
    IF opcao = 1 THEN
        resultado := op1 + op2;
        operador := '+';
    ELSIF opcao = 2 THEN
        resultado := op1 - op2;
        operador := '-';
    ELSIF opcao = 3 THEN
        resultado := op1 * op2;
        operador := '*';
    ELSIF opcao = 4 THEN
        IF op2 = 0 THEN
            RAISE NOTICE 'Erro: divisão por zero não é permitida';
            RETURN;
        END IF;
        resultado := op1 / op2 ::FLOAT;
        operador := '/';
    ELSE
        RAISE NOTICE 'Opção inválida';
        RETURN;
    END IF;
    RAISE NOTICE '% % % = %', op1, operador, op2, resultado;
END
$$;

--CASE
DO $$
DECLARE
    op1 INT := valor_aleatorio_entre(1,30);  
    op2 INT := valor_aleatorio_entre(1,30);   
    opcao INT := 3; -- (1: soma, 2: subtração, 3: multiplicação, 4: divisão)
    resultado NUMERIC (10, 2);
    operador TEXT;
BEGIN
    CASE 
        WHEN opcao = 1 THEN
            resultado := op1 + op2;
            operador := '+';
        WHEN opcao = 2 THEN
            resultado := op1 - op2;
            operador := '-';
        WHEN opcao = 3 THEN
            resultado := op1 * op2;
            operador := '*';
        WHEN opcao = 4 THEN
            IF op2 = 0 THEN
                RAISE NOTICE 'Erro: divisão por zero não é permitida';
                RETURN;
            END IF;
            resultado := op1 / op2 ::FLOAT;
            operador := '/';
        ELSE
            RAISE NOTICE 'Opção inválida';
            RETURN;
    END CASE;
    RAISE NOTICE '% % % = %', op1, operador, op2, resultado;
END
$$;


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
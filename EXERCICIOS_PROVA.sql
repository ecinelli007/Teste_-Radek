/*5.Considere o seguinte problema
São fornecidas duas tabelas: Alunos e Notas.
Alunos contém três colunas: ID, Nome e Valor.
Coluna  | Tipo
ID           | Inteiro
Nome    | String
Valor      | Inteiro
Notas possui os seguintes dados:

 Nota   | Valor_Min | Valor_Max
1          | 0                 |  9
2          | 10               | 19
3          | 20               | 29
4          | 30               | 39
5          | 40               | 49
6          | 50               | 59
7          | 60               | 69
8          | 70               | 79
9          | 80               | 89
10        | 90               | 100       */

CREATE TABLE ALUNOS (ID_ALUNO NUMBER,
                     NOME     VARCHAR2(50),
                     VALOR    NUMBER);
CREATE TABLE NOTAS  (NOTA      NUMBER,
                     NOTA_MIN  NUMBER,
                     NOTA_MAX  NUMBER);
BEGIN
INSERT INTO NOTAS VALUES (1, 0  ,9 );
INSERT INTO NOTAS VALUES (2, 10 ,19);
INSERT INTO NOTAS VALUES (3, 20 ,29 );
INSERT INTO NOTAS VALUES (4, 30 ,39 );
INSERT INTO NOTAS VALUES (5, 40 ,49 );
INSERT INTO NOTAS VALUES (6, 50 ,59 );
INSERT INTO NOTAS VALUES (7, 60 ,69 );
INSERT INTO NOTAS VALUES (8, 70 ,79 );
INSERT INTO NOTAS VALUES (9, 80 ,89 );
INSERT INTO NOTAS VALUES (10,90 ,100);
END;
COMMIT;

SELECT * FROM NOTAS; 
-- RESOLVENDO O PROBLEMA | REGRAS
-- Não APARECER os Nomes dos alunos que receberam uma nota inferior a 8.
-- deve estar em ordem decrescente por nota
-- deve estar em ordem ALFABETICA POR NOME para alunos com notas iguais entre
-- 8 e 9
-- se a nota for inferior a 8, use "NULL" como nome 
-- e liste-os por notas em ordem decrescente
-- aluno com a mesma nota (1-7), ordene esses alunos por suas notas 
-- em ordem crescente;
Maria (10)
Marcela (9)
Julia (9)
Andreia (8)
INSERT INTO ALUNOS VALUES(1 , 'JULIA'     ,81);
INSERT INTO ALUNOS VALUES(2 , 'CAROL'     ,68 );
INSERT INTO ALUNOS VALUES(3 , 'MARIA'     ,99 );
INSERT INTO ALUNOS VALUES(4 , 'ANDREIA'   ,78 );
INSERT INTO ALUNOS VALUES(5 , 'JAQUELINE' ,63 );
INSERT INTO ALUNOS VALUES(6 , 'MARCELA'   ,88 );

SELECT * FROM ALUNOS;
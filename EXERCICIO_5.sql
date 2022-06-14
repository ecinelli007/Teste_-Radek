-- relatório contem três colunas:  Nome, Nota e Valor. 
-- Não mostrar nome com nota inferior a 8. 

-- Regra de ordenação: ordem decrescente por nota.
-- ou seja, as notas mais altas são inseridas primeiro. 

-- Alunos com notas entre (8-10) atribuído a eles, 
-- ordenar por nomes em ordem alfabética. 

-- se a nota for inferior a 8, use "NULL" como nome e 
-- liste-os por notas em ordem decrescente. 
-- alunos com a mesma nota (1-7), ordene 
-- por suas notas em ordem crescente.




-- RESOLVENDO QUESTÃO 5 
SELECT a.id_aluno,
  CASE WHEN A.VALOR <=69 THEN null 
       ELSE A.NOME 
   END AS NOME,
  CASE WHEN A.VALOR = 0  OR A.VALOR <=9  THEN 1
       WHEN A.VALOR = 10 OR A.VALOR <=19 THEN 2
       WHEN A.VALOR = 20 OR A.VALOR <=29 THEN 3
       WHEN A.VALOR = 30 OR A.VALOR <=39 THEN 4
       WHEN A.VALOR = 40 OR A.VALOR <=49 THEN 5
       WHEN A.VALOR = 50 OR A.VALOR <=59 THEN 6
       WHEN A.VALOR = 60 OR A.VALOR <=69 THEN 7
       WHEN A.VALOR = 70 OR A.VALOR <=79 THEN 8
       WHEN A.VALOR = 80 OR A.VALOR <=89 THEN 9
       WHEN A.VALOR = 90 OR A.VALOR <=100 THEN 10
   END AS NOTA_FINAL
  FROM ALUNOS A
 ORDER BY NOTA_FINAL DESC, A.NOME ASC;

DECLARE
vNome  varchar2(50);
vNota  number;
vValor number;
BEGIN
 FOR CR_ALUNOS IN ( SELECT * FROM ALUNOS) LOOP
   
     IF CR_ALUNOS.VALOR = 0 OR CR_ALUNOS.VALOR <=9 THEN
        vNota := 1;
     ELSIF CR_ALUNOS.VALOR = 10 OR CR_ALUNOS.VALOR <=19 THEN
             vNota := 2;
     ELSIF CR_ALUNOS.VALOR = 20 OR CR_ALUNOS.VALOR <=29 THEN
             vNota := 3;
     ELSIF CR_ALUNOS.VALOR = 30 OR CR_ALUNOS.VALOR <=39 THEN
             vNota := 4;
     ELSIF CR_ALUNOS.VALOR = 40 OR CR_ALUNOS.VALOR <=49 THEN
             vNota := 5;
     ELSIF CR_ALUNOS.VALOR = 50 OR CR_ALUNOS.VALOR <=59 THEN
             vNota := 6;
     ELSIF CR_ALUNOS.VALOR = 60 OR CR_ALUNOS.VALOR <=69 THEN
             vNota := 7;
     ELSIF CR_ALUNOS.VALOR = 70 OR CR_ALUNOS.VALOR <=79 THEN
             vNota := 8;
     ELSIF CR_ALUNOS.VALOR = 80 OR CR_ALUNOS.VALOR <=89 THEN
             vNota := 9;
     ELSIF CR_ALUNOS.VALOR = 90 OR CR_ALUNOS.VALOR <=100 THEN
             vNota := 10;
     END IF;
     
     DBMS_OUTPUT.PUT_LINE('ALUNO(A): ' ||CR_ALUNOS.nome || ' - PONTUAÇÃO: ' || CR_ALUNOS.VALOR || ' - NOTA FINAL: '|| vNOTA);
     
     BEGIN
      
     INSERT INTO ALUNOS_TEMP 
          VALUES(CR_ALUNOS.ID_ALUNO,
                 CR_ALUNOS.NOME,
                 CR_ALUNOS.VALOR,
                 vNOTA);
                 COMMIT;                 
     END;

 END LOOP;

END;
-- QUANDO QUERO CONCATENAR INFORMAÇÃO UTILIZA-SE "||"
-- EXEMPLO: SELECT 'Cod. Aluno: ' || id_aluno as ID_ALUNO FROM ALUNOS;
/*SELECT T.*,
       CASE WHEN T.NOTA_FINAL IN (1,2,3,4,5,6,7) THEN NULL
                         ELSE 10
       END AS NOME
  FROM ALUNOS_TEMP T;*/

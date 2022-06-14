CREATE OR REPLACE FUNCTION FNC_INSERE_TAREFAS (pNOME   VARCHAR2,
                                               pAREA   VARCHAR2)
RETURN VARCHAR
IS

 vTRATA_ERRO     NUMBER;
 vID_EQUIP_RESP  NUMBER;
 vSTATUS         NUMBER;
 vRETORNO        NUMBER;
/******* MOTIVO DA CRIAÇÃO DA FUNCTION ********/
-- VALIDAÇÕES DAS REGRAS DO EXERCICIO 11
-- TB_CADASTRO_EQUIPE: armazena todas as equipes
-- TB_TAREFAS: armazena o cabeçalho de uma tarefa.
-- TB_LOG_PROCESSO: possuirá o log do processo
-- Resolução da questão 12.
-- 01. Criar function de insert na TB_TAREFAS
--     parâmetros: nome, área da tarefa (entrada)
-- 02. oid: Preencher com sequence - SEQUENCE CRIADA
BEGIN
BEGIN
SELECT e.oid-- E.* 
      ,0 vRETORNO
  INTO vID_EQUIP_RESP, vRETORNO
  FROM TB_CADASTRO_EQUIPE E
 WHERE e.nome_b1||'/'||e.nome_b2||'/'||e.nome_b3 = pAREA;
 EXCEPTION
  WHEN NO_DATA_FOUND THEN
       vTRATA_ERRO    := 0;
       vID_EQUIP_RESP :=0;
       vRETORNO := -1;
END;

SELECT E.STATUS-- E.* 
  INTO vSTATUS
  FROM TB_CADASTRO_EQUIPE E
 WHERE E.OID = vID_EQUIP_RESP;

 IF vSTATUS = 0 THEN
    vID_EQUIP_RESP := 0;
    vRETORNO := -2;
 END IF;
 
 /* HABILITADO SAIDA DBMS PARA TESTE DURANTE DESENV.
 DBMS_OUTPUT.put_line('COD. EQUIP RESP:' ||vID_EQUIP_RESP || CHR(10)||
                      'ERRO: '|| vTRATA_ERRO || CHR(10) ||
                      'RETORNO: ' || vRETORNO
                      ); */

INSERT INTO TB_TAREFAS(OID,
                       NOME,
                       DATA_CRIACAO,
                       AREA,
                       EQUIPE_RESPONSAVEL
                       )
                VALUES(SEQ_OID_TAREFAS.NEXTVAL,
                       pNOME,
                       TO_CHAR(SYSDATE,'DD/MM/YYYY'),
                       pAREA,
                       vID_EQUIP_RESP 
                       ); 
COMMIT;

RETURN vRETORNO;
END;



DECLARE
pNOME    VARCHAR2(50) := 'ATIVIDADE 1';
pAREA    VARCHAR2(50):= 'MT_11606/13TRF/E08115';
                         -- INATIVO: 'MT_07019/13TRF/E08796'
                         --   ATIVO: 'MT_11606/13TRF/E08115'
vTRATA_ERRO NUMBER;
vID_EQUIP_RESP  NUMBER;
vSTATUS NUMBER;
vRETORNO NUMBER;

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
 
 DBMS_OUTPUT.put_line('COD. EQUIP RESP:' ||vID_EQUIP_RESP || CHR(10)||
                      'ERRO: '|| vTRATA_ERRO || CHR(10) ||
                      'RETORNO: ' || vRETORNO
                      );

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
END;

-- select * from TB_TAREFAS;  
CREATE TABLE TB_CADASTRO_EQUIPE (
                                OID NUMBER PRIMARY KEY,
                                NOME VARCHAR2 (30),
                                NOME_B1 VARCHAR2 (30),
                                NOME_B2 VARCHAR2 (30),
                                NOME_B3 VARCHAR2 (30),
                                STATUS NUMBER (1));
                                
                                
INSERT INTO TB_CADASTRO_EQUIPE VALUES ('1','ALPHA1','MT_07019','13TRF','E08796',0);
INSERT INTO TB_CADASTRO_EQUIPE VALUES ('2','BETA2','MT_11606','13TRF','E08115',1);
INSERT INTO TB_CADASTRO_EQUIPE VALUES ('3','BETA1','MT_07901','13TRF','E09516',1);


CREATE TABLE TB_TAREFAS (
                                OID NUMBER PRIMARY KEY,
                                NOME VARCHAR2 (30),
                                DATA_CRIACAO NUMBER (30),
                                ÁREA VARCHAR2 (30),
                                EQUIPE_RESPONSAVEL NUMBER (1),
                                CONSTRAINT FK_TB_TAREFAS_CADASTRO FOREIGN KEY (EQUIPE_RESPONSAVEL) REFERENCES TB_CADASTRO_EQUIPE (OID));
                                                                

CREATE TABLE TB_LOG_PROCESSO (
                                OID NUMBER PRIMARY KEY,
                                DATA NUMBER (10),
                                CODIGO NUMBER,
                                DESCRICAO VARCHAR2 (30));
.


                                

                               

                                
                            



CREATE TABLE TB_CARRO (Codigo NUMBER(10), Nome VARCHAR2(50),
Marca VARCHAR2(20), Tipo CHAR(20), Ano_fab NUMBER (4),
PRIMARY KEY (codigo));

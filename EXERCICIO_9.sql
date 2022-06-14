-- EXERCICIO 9
--9.Considere as seguintes tabelas:

create table tcall(
                oid number primary key,
                tipo number,
                subtipo number,
                data_criacao date
);

create table om_record(
                oid number primary key,
                tipo number,
                subtipo number,
                natureza number,
                data_criacao date
);

create table om_record_natureza(
                oid number primary key,
                tipo number,
                subtipo number,
                natureza number
);

-- CRIANDO A SEQUENCE
CREATE SEQUENCE SEQ_OM_RECORD
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

SELECT SEQ_OM_RECORD.CURRVAL ID_OM_RECORD FROM  DUAL;
SELECT * FROM tcall;
SELECT * FROM om_record;
SELECT * FROM om_record_natureza;

insert into om_record_natureza values (1, 1, 1, 2);
insert into om_record_natureza values (2, 1, 2, 4);
insert into om_record_natureza values (3, 2, 1, 6);


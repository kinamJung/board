select user_id as id, user_role from TB_USER t where user_id = 'admin' and password = 'admin';

insert INTO TB_USER VALUES(USER_SEQ.nextval, 'admin', 'admin', SYSDATE, 1);

CREATE TABLE TB_USER
(
   USER_ID     VARCHAR2 (20),
   PASSWORD    VARCHAR2 (20),
   JOINDATE    DATE,
   USER_ROLE   NUMBER (10, 2),
   NAME        VARCHAR2 (50),
   NO          NUMBER (10, 2)
);

CREATE SEQUENCE USER_SEQ START WITH 20
                         INCREMENT BY 1
                         MAXVALUE 9999999999999999999999999999
                         MINVALUE 0
                         NOORDER
                         NOCYCLE
                         CACHE 20;

ALTER TABLE TB_USER
ADD ( CONSTRAINT user_id_pk PRIMARY KEY ( USER_ID ) );


commit;
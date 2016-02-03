select user_id as id, user_role from TB_USER t where user_id = 'admin' and password = 'admin';

insert INTO TB_USER VALUES(USER_SEQ.nextval, 'admin', 'admin', SYSDATE, 1);



commit;
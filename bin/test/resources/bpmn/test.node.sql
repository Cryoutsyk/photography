INSERT INTO TBL_CORE_ACT_NODE (DB_ID,PROCESSDEFINITION_KEY,PROCESSDEFINITION_NAME,ACTIVITY_ID,ACTIVITY_NAME,ACTIVITY_TYPE,FORM_URL,IS_MULTI_TASK,IS_SEQUENTIAL,MUL_INS_COMPLET_CONDITION,TASK_LISTENER,VARIABLE_EXPRESSION) 
SELECT '12910C6F7566483DB8D9816495476D70','process','测试流程','one','第一步','userTask',NULL,0,0,NULL,NULL,NULL FROM dual
union all SELECT '08045EC00BEE4276939F76BAAEE57C7A','process','测试流程','two','第二步','userTask',NULL,0,0,NULL,NULL,NULL FROM dual
union all SELECT '8AD2F71D1A4C4D0BA6FD24CF7CBAA1A7','process','测试流程','three','第三步','userTask',NULL,0,0,NULL,NULL,NULL FROM dual
union all SELECT 'FB4CD3896920401C8E2B3C0C372446E3','process','测试流程','four','第四步','userTask',NULL,0,0,NULL,NULL,NULL FROM dual




INSERT INTO TBL_CORE_ACT_ASSIGNEES (DB_ID,NODE_DB_ID,ASSIGNEE_DB_ID,ASSIGNEE_ID,ASSIGNEE_NAME,ASSIGNEE_TYPE,STATUS)  
SELECT '485728DA65C446DE809CC788F92EA98B','12910C6F7566483DB8D9816495476D70','b7ffe59f-d9df-4573-97df-17937e2764d9','test222','测试用户2','user',1 FROM dual
UNION ALL SELECT '6706F5E73DAF4423838225250E54ACDE','08045EC00BEE4276939F76BAAEE57C7A','c9cd196c-85de-479b-8c6a-57c7a55c10c4','test33','测试用户3','user',1 FROM dual
UNION ALL SELECT 'F4C893C01B2D4FD9BA59C1D4531CE942','8AD2F71D1A4C4D0BA6FD24CF7CBAA1A7','db4d9de6-8fbc-4414-b96d-7bae0a5ead93','rr','测试角色12','role',1 FROM dual
UNION ALL SELECT 'D1C4FA97D1E948D69ECF46FA813F6B46','FB4CD3896920401C8E2B3C0C372446E3','1314e9a7-2577-4a3b-a633-f1564be63d31','fushen','复审用户','role',1 FROM dual


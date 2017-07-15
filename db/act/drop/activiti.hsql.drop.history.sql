drop table if exists ACT_HI_PROCINST cascade;
drop table if exists ACT_HI_ACTINST cascade;
drop table if exists ACT_HI_VARINST cascade;
drop table if exists ACT_HI_TASKINST cascade;
drop table if exists ACT_HI_DETAIL cascade;
drop table if exists ACT_HI_COMMENT cascade;
drop table if exists ACT_HI_ATTACHMENT cascade;
drop table if exists ACT_HI_IDENTITYLINK cascade;

drop index if exists ACT_IDX_HI_PRO_INST_END;
drop index if exists ACT_IDX_HI_PRO_I_BUSKEY;
drop index if exists ACT_IDX_HI_ACT_INST_START;
drop index if exists ACT_IDX_HI_ACT_INST_END;
drop index if exists ACT_IDX_HI_DETAIL_PROC_INST;
drop index if exists ACT_IDX_HI_DETAIL_ACT_INST;
drop index if exists ACT_IDX_HI_DETAIL_TIME;
drop index if exists ACT_IDX_HI_DETAIL_NAME;
drop index if exists ACT_IDX_HI_DETAIL_TASK_ID;
drop index if exists ACT_IDX_HI_PROCVAR_PROC_INST;
drop index if exists ACT_IDX_HI_PROCVAR_NAME_TYPE;
drop index if exists ACT_IDX_HI_ACT_INST_PROCINST;
drop index if exists ACT_IDX_HI_IDENT_LNK_USER;
drop index if exists ACT_IDX_HI_IDENT_LNK_TASK;
drop index if exists ACT_IDX_HI_IDENT_LNK_PROCINST;

create unique index accountIdx on USER(ACCOUNT);
alter table LOST_PASSWORD               add foreign key (USER_ID) references USER(ID) ON DELETE CASCADE;
alter table PENDING_EMAIL_CONFIRMATIONS add foreign key (USER_ID) references USER(ID) ON DELETE CASCADE;
create unique index typeIdx on ROBOT(NAME);
commit;

alter table PROGRAM add foreign key (OWNER_ID)  references USER(ID) ON DELETE CASCADE;
alter table PROGRAM add foreign key (ROBOT_ID)  references ROBOT(ID);
alter table PROGRAM add foreign key (AUTHOR_ID) references USER(ID) ON DELETE CASCADE;
commit;

create unique index progNameOwnerRobotIdx on PROGRAM(NAME, OWNER_ID, ROBOT_ID, AUTHOR_ID);
commit;

alter table USER_PROGRAM      add foreign key (USER_ID)    references USER(ID) ON DELETE CASCADE;
alter table USER_PROGRAM      add foreign key (PROGRAM_ID) references PROGRAM(ID) ON DELETE CASCADE;
alter table USER_PROGRAM_LIKE add foreign key (USER_ID)    references USER(ID) ON DELETE CASCADE;
alter table USER_PROGRAM_LIKE add foreign key (PROGRAM_ID) references PROGRAM(ID) ON DELETE CASCADE;

create unique index userProgramLikeIdx on USER_PROGRAM_LIKE(USER_ID, PROGRAM_ID);
commit;

alter table TOOLBOX add foreign key (OWNER_ID) references USER(ID) ON DELETE CASCADE;
alter table TOOLBOX add foreign key (ROBOT_ID) references ROBOT(ID);
create unique index toolNameOwnerIdx on TOOLBOX(NAME, OWNER_ID, ROBOT_ID);
commit;

alter table CONFIGURATION add foreign key (OWNER_ID) references USER(ID) ON DELETE CASCADE;
alter table CONFIGURATION add foreign key (ROBOT_ID) references ROBOT(ID);
commit;

alter table USER                        alter column ID generated by default as identity (start with 1);
alter table LOST_PASSWORD               alter column ID generated by default as identity (start with 1);
alter table PENDING_EMAIL_CONFIRMATIONS alter column ID generated by default as identity (start with 1);
alter table ROBOT                       alter column ID generated by default as identity (start with 42);
alter table PROGRAM                     alter column ID generated by default as identity (start with 42);
alter table USER_PROGRAM                alter column ID generated by default as identity (start with 42);
alter table USER_PROGRAM_LIKE           alter column ID generated by default as identity (start with 42);
alter table TOOLBOX                     alter column ID generated by default as identity (start with 42);
alter table CONFIGURATION               alter column ID generated by default as identity (start with 42);
commit;

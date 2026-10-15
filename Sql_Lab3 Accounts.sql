SELECT * FROM bank.accounts;

alter table accounts add constraint pk primary key (Account_Id);
alter table accounts add column Branch_iD int;
alter table accounts add constraint fkkk foreign key (Branch_Id) references branches (Branch_Id);

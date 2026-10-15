SELECT * FROM bank.transaction;

alter table transaction add column Account_Id int ;
alter table transaction add constraint f_k foreign key (Account_Id) references accounts(Account_Id);
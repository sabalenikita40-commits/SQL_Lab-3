SELECT * FROM bank.loans;

alter table loans add column customer_id int;
alter table loans add constraint fkk foreign key (customer_id) references customer (Customer_ID);

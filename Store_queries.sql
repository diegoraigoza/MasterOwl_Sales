insert into StoreItems values('001', '30.03');
insert into StoreItems values('002', '35.20');
insert into StoreItems values('003', '1.50');
insert into StoreItems values('004', '178.55');
insert into StoreItems values('005', '109.66');
insert into StoreItems values('006', '23.97');


	-- @ /home/draigoza/Desktop/MasterOwl_Sales/Store_queries.sql;

insert into ComicBook values('001', '100','enders game', to_date('19990601','YYYYMMDD'), '4');
insert into ComicBook values('002', '101','the bible', to_date('19820101','YYYYMMDD'), '34');
insert into ComicBook values('003', '102','investing 101',to_date('19990313','YYYYMMDD'), '54');
insert into ComicBook values('004', '103','bob the builder', to_date('19990101','YYYYMMDD'), '104');

insert into Tshirt values('005', 'large');
insert into Tshirt values('006', 'medium');

insert into Customer1 values('401', 'Bob Din', 'bob@yoyo.com', 'SJ', 'regular', to_date('20190101','YYYYMMDD'));
insert into Customer1 values('402', 'Nick Kniveton', 'hubby@yoyo.com', 'Napa', 'gold', to_date('20190102','YYYYMMDD'));
insert into Customer1 values('403', 'Jane Lane', 'jane@yoyo.com', 'SF', 'regular', to_date('20190103','YYYYMMDD'));

insert into ItemOrder values('201', '001', '401', '1', NULL, to_date('20190102','YYYYMMDD'), '10.00', '120.00');
insert into ItemOrder values('202', '002', '401', '1', to_date('20190606','YYYYMMDD'), to_date('20190120','YYYYMMDD'), '10.00', '150.00');
insert into ItemOrder values('203', '003', '402', '1', to_date('20190203','YYYYMMDD'), to_date('20190201','YYYYMMDD'), '0.00', '178.00');
insert into ItemOrder values('204', '004', '402', '1', to_date('20190313','YYYYMMDD'), to_date('20190312','YYYYMMDD'), '0.00', '123.45');
insert into ItemOrder values('205', '005', '403', '1', to_date('20190419','YYYYMMDD'), to_date('20190416','YYYYMMDD'), '10.00', '157.00');
insert into ItemOrder values('206', '006', '403', '1', to_date('20190512','YYYYMMDD'), to_date('20190511','YYYYMMDD'), '10.00', '245.00');



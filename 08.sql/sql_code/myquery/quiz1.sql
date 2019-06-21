
/* 주어진 데이터 */

CREATE TABLE PERF
(
	CUST_ID CHAR(5) PRIMARY KEY NOT NULL,
	CUST_NM CHAR(10) NOT NULL,
	CUST_BIRTH DATE,
	VISIT_CNT DECIMAL(15,0),
	SALES_AMT DECIMAL(15,0),
	SALES_CNT DECIMAL(15,0)
);

INSERT INTO PERF VALUES ('56456', '모형건', '1982-01-24', 123, 3700000, 24);
INSERT INTO PERF VALUES ('65412', '이상훈', '1984-05-10', 23, 467200, 14);
INSERT INTO PERF VALUES ('23472', '이상희', '1978-02-27', 117, 2237065, 23);
INSERT INTO PERF VALUES ('27896', '모영길', '1982-05-11', 37, 123721, 2);
INSERT INTO PERF VALUES ('35478', '강주혁', '1983-09-10', 86, 830000, 30);
INSERT INTO PERF VALUES ('78693', '이선우', '1977-07-07', 103, 1789023, 7);

/* solution */

SELECT * FROM PERF ORDER BY SALES_AMT DESC;

SELECT CUST_BIRTH, VISIT_CNT FROM PERF;

SELECT CUST_NM FROM PERF order by visit_cnt desc limit 1;
select cust_nm from perf where visit_cnt = (select max(visit_cnt) from perf);
select cust_nm from perf where cust_birth < '1980';

select avg(visit_cnt), avg(sales_amt), avg(sales_cnt) from perf;

select cust_nm, avg(SALES_AMT)/VISIT_CNT as 방문당평균구매금액
	from perf order by 방문당평균구매금액 desc limit 1;
    
select distinct position from emp;
select distinct position, grade from emp;
select distinct manager_id from emp;
select count(distinct manager_id) from emp;

select coalesce(ovrs_amt, 0) from card_tran_201311
 where party_nm = '임하영';

select party_nm from card_tran_201311 where inst_amt is not null;
 
select party_nm, pif_amt*0.1 as cash_bag from card_tran_2013 order by cash_back desc;
 
 



/* 문제풀이 */


SELECT * FROM PERF ORDER BY SALES_AMT DESC;

SELECT CUST_BIRTH, VISIT_CNT FROM PERF;

 


## sysbench on Docker

Sysbench 1.0.6 on Docker environment

## Example Usage

#### Requirement 

Create a Mysql database application(GoodRain Cloud) before you use sysbench:

```bash
CREATE SCHEMA sbtest;
# just test localhost or other cloud services
GRANT ALL PRIVILEGES ON sbtest.* to sbtest@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
```

#### Docker
Run docker images: 
```bash
docker run -dit --name sysbench sysbench
docker exec -it sysbench bash
```
Prepare/Run  the sysbench database:
```bash
sysbench \
--db-driver=mysql \
--oltp-table-size=100000 \
--oltp-tables-count=24 \
--threads=4 \
--time=240 \
--max-requests=0 \
--mysql-host=<mysql host> \
--mysql-port=<mysql port> \
--mysql-user=sbtest \
--mysql-password=<password> \
/usr/share/sysbench/tests/include/oltp_legacy/parallel_prepare.lua \
run

sysbench \
--db-driver=mysql \
--report-interval=2 \
--mysql-table-engine=innodb \
--oltp-table-size=100000 \
--oltp-tables-count=24 \
--oltp-test-mode=complex \
--threads=4 \
--time=240 \
--mysql-host=<mysql host> \
--mysql-port=<port> \
--mysql-user=sbtest \
--mysql-password=<password> \
/usr/share/sysbench/tests/include/oltp_legacy/oltp.lua \
run
or 

sysbench \
--test=/usr/share/sysbench/tests/include/oltp_legacy/oltp.lua \
--db-driver=mysql \
--mysql-host=<mysql host> --mysql-port=<mysql port> \ 
--mysql-user=<mysql user> --mysql-password=<passwd> \
--mysql-db=sbtest \
--oltp-tables-count=10 --oltp-table-size=500000 --report-interval=10
--oltp-dist-type=uniform --rand-init=on --max-requests=0 --oltp-test-mode=nontrx
--oltp-nontrx-mode=select --oltp-read-only=on --oltp-skip-trx=on --time=120
--threads=12 [prepare|run|cleanup]
```





## 文档地址：https://github.com/alibaba/DataX/blob/master/userGuid.md

### Datax国内下载地址：https://datax-opensource.oss-cn-hangzhou.aliyuncs.com/datax.tar.gz


## JOB任务目录
/opt/datax/job

## 创建任务目录
mkdir -p /opt/datax/job

## 创建同步文件
touch /opt/datax/job/sync_data.sh
touch /opt/datax/job/sqlserver-starrocks.json
touch /opt/datax/job/clickhouse-starrocks.json


chmod +x /opt/datax/job/sync_data.sh

## 运行脚本
bash sync_data.sh ckfile.csv clickhouse-starrocks.json
bash sync_data.sh mssqlfile.csv sqlserver-starrocks.json

#!/bin/bash

. /etc/profile

csv_file="$1"
json_config="$2"

# 打印传入的参数
echo "CSV file: $csv_file"
echo "JSON config file: $json_config"

if [ -z "$csv_file" ] || [ -z "$json_config" ]; then
  echo "Usage: $0 <path_to_csv_file> <path_to_json_config>"
  exit 1
fi

# 跳过CSV文件的第一行（标题行）
awk -F',' 'NR>1 {print $1, $2, $3, $4}' "$csv_file" | while read -r r_dbname r_table w_dbname w_table
do
    echo "Read line: r_dbname=$r_dbname, r_table=$r_table, w_dbname=$w_dbname, w_table=$w_table"
    echo "Executing DataX with parameters: -Dr_dbname=$r_dbname -Dr_table=$r_table -Dw_dbname=$w_dbname -Dw_table=$w_table"
    python /opt/datax/datax/bin/datax.py "$json_config" -p "-Dr_dbname=$r_dbname -Dr_table=$r_table -Dw_dbname=$w_dbname -Dw_table=$w_table"
done

echo "Script execution completed."
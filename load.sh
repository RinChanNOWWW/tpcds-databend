#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. "$CURDIR"/env.sh

# Create Database
echo "CREATE DATABASE IF NOT EXISTS ${DATABASE}" | mysql -h127.0.0.1 -P3307 -uroot -s

tables=(
    call_center   
    catalog_returns  
    customer_address  
    customer_demographics  
    household_demographics  
    inventory  
    promotion  
    ship_mode  
    store_returns  
    time_dim   
    web_page     
    web_sales
    catalog_page  
    catalog_sales    
    customer          
    date_dim               
    income_band             
    item       
    reason     
    store      
    store_sales    
    warehouse  
    web_returns  
    web_site
)

# Clear Data
for t in ${tables[@]}
do
    echo "DROP TABLE IF EXISTS $t ALL" | $MYSQL_CLIENT_CONNECT
done

# Create Tables;
cat ./tpcds.sql | $MYSQL_CLIENT_CONNECT

# Load Data
for t in ${tables[@]}
do
    echo "$t"
    insert_sql="insert into $DATABASE.$t file_format = (type = CSV skip_header = 0 field_delimiter = '|' record_delimiter = '\n')"
    curl -s -u root: -XPUT "http://localhost:8000/v1/streaming_load" -H "insert_sql: ${insert_sql}" -F 'upload=@"'${CURDIR}'/data/'$t'.csv"' > /dev/null 2>&1
done



#!/usr/bin/env bash
export DATABASE=tpcds
export MYSQL_CLIENT_CONNECT="mysql -h127.0.0.1 -P3307 -uroot ${DATABASE} -s"
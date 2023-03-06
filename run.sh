#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. "$CURDIR"/env.sh

QUERY_DIR="queries"

for i in {1..99}
do
    sql="query_$i.sql"

    echo "Run $sql start."
    cat "$QUERY_DIR"/"$sql" | $MYSQL_CLIENT_CONNECT
    echo "Run $sql done."
done
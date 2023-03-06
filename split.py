#!/usr/bin/env python3
from pathlib import Path

output_dir = "queries"
default_generated_query = "query_0.sql"

Path(output_dir).mkdir(parents=True, exist_ok=True)
f = open(default_generated_query)
content = f.readlines()

query_num = 1
output = []

for line in content:
    if line.startswith(f'-- start query {query_num}'):
        continue
    if line.startswith(f'-- end query {query_num}'):
        with open(f'{output_dir}/query_{query_num}.sql', 'w') as f:
            f.writelines(output)
        output.clear()
        query_num += 1
        continue
    output.append(line)
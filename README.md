# TPC-DS for Databend

## Data and queries generation

- Follow the steps in https://github.com/gregrahn/tpcds-kit
- Put the data into `./data`.

## Load data into Databend

Run the script `load.sh`.

```shell
chmod +x load.sh
./load.sh
```

## Run query SQLs

Run the script `run.sh`.

```shell
chmod +x run.sh
./run.sh
```

## Others

`split.py` is used to split the `query_0.sql` generated by `tpcds-kit` into 99 files (there are 99 queries in TPC-DS).
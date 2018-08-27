# PostgreSQL on Docker Cheat Sheet

## Tags
Supported tags

`10-beta4`, `10`

`10-beta4-alpine`, `10-alpine`

`9.6.5`, `9.6`, `9`, `latest`

`9.6.5-alpine`, `9.6-alpine`, `9-alpine`, `alpine`

`9.5.9`, `9.5`

`9.5.9-alpine`, `9.5-alpine`

`9.4.14`, `9.4`

`9.4.14-alpine`, `9.4-alpine`

`9.3.19`, `9.3`

`9.3.19-alpine`, `9.3-alpine`

`9.2.23`, `9.2`

`9.2.23-alpine`, `9.2-alpine`


## Quickstart

```sh
docker run --name some-postgres \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-d postgres
```

This image includes `EXPOSE 5432` (the postgres port), so standard container linking will make it automatically available to the linked containers. The default postgres user and database are created in the entrypoint with initdb.

## Environment Variables

### `POSTGRES_PASSWORD`
This environment variable is recommended for you to use the PostgreSQL image. This environment variable sets the superuser password for PostgreSQL. The default superuser is defined by the `POSTGRES_USER` environment variable. In the above example, it is being set to "mysecretpassword".

Note: The PostgreSQL image sets up `trust` authentication locally so you may notice a password is not required when connecting from `localhost` (inside the same container). However, a password will be required if connecting from a different host/container.

### `POSTGRES_USER`
This optional environment variable is used in conjunction with `POSTGRES_PASSWORD` to set a user and its password. This variable will create the specified user with superuser power and a database with the same name. If it is not specified, then the default user of `postgres` will be used.

### `PGDATA`
This optional environment variable can be used to define another location - like a subdirectory - for the database files. The default is `/var/lib/postgresql/data`, but if the data volume you're using is a `fs` mountpoint (like with GCE persistent disks), Postgres `initdb` recommends a subdirectory (for example `/var/lib/postgresql/data/pgdata` ) be created to contain the data.


### `POSTGRES_DB`
This optional environment variable can be used to define a different name for the default database that is created when the image is first started. If it is not specified, then the value of `POSTGRES_USER` will be used.

### `POSTGRES_INITDB_ARGS`
This optional environment variable can be used to send arguments to postgres `initdb`. The value is a space separated string of arguments as postgres initdb would expect them. This is useful for adding functionality like data page checksums: `-e POSTGRES_INITDB_ARGS="--data-checksums"`.

### `POSTGRES_INITDB_XLOGDIR`
This optional environment variable can be used to define another location for the Postgres transaction log. By default the transaction log is stored in a subdirectory of the main Postgres data folder (`PGDATA`). Sometimes it can be desireable to store the transaction log in a different directory which may be backed by storage with different performance or reliability characteristics.
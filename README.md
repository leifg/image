# README

ProgImage is an image processing service:

Unlike other image storage services that have a web front-end and target end-users, ProgImage is designed as a specialised image storage and processing engine to be used by other applications, and will (only) provide high-performance programmatic access via its API.

## Setup

To locally run the service, start the dependencies in docker via:

```shell
docker-compose up
```

The only external requirement currently is Postgres. It will remap the default postgres port (5432) to 5433 to avoid collition with locally run postgres installations.


## Attributions

Test Image by [Casey Horner](https://unsplash.com/@mischievous_penguins) on [Unsplash](https://unsplash.com/photos/mLPjQs-YK5g)

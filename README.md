# README

ProgImage is an image processing service:

Unlike other image storage services that have a web front-end and target end-users, ProgImage is designed as a specialised image storage and processing engine to be used by other applications, and will (only) provide high-performance programmatic access via its API.

## Setup

To locally run the service, start the dependencies in Docker via:

```shell
docker-compose up
```

The only external requirement currently is Postgres. It will remap the default postgres port (5432) to 5433 to avoid collition with locally run postgres installations.

After the database is started you can create and migrate via

```shell
bundle exec rails db:create
bundle exec rails db:migrate
```

and finally start the server:

```shell
bundle exec rails server
```

## Usage

### Storing Images

to store an image, create a multipart/upload request to the endpoint: `/images`. The binary data of the image need to be added under the key `image`.

curl example:

```shell
curl -X POST \
  http://localhost:3000/images \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -F image=@image.jpg
```

The result will look like this:

```json
{
  "id": 1,
  "filename": "image.jpg",
  "content_type": "image/jpeg",
  "filesize": 3633674
}
```

### Fetching Images

To fetch an image, send a get request to `/images/<image_id>`.

## Attributions

Test Image by [Casey Horner](https://unsplash.com/@mischievous_penguins) on [Unsplash](https://unsplash.com/photos/mLPjQs-YK5g)

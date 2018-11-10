# About this image

This image is a one time container for running rails apps
(`docker run --rm ...`).

It is based on the official `ruby:latest` image.

Some packages added for rails apps:

- stable nodejs: required by rails5
- mecab and their dics: additional package example

## How to run rails5 apps

- NOTE: mount to `/usr/local/bundle` for `bundle install`.

```sh
$ rails new railsapp  # An example rails app built on your host os
...
```

For setup for running the rails app on docker as:

```sh
$ mkdir -p bundle/
$ docker run -it --rm -w /usr/src/app -v $(pwd)/railsapp:/usr/src/app \
    -v $(pwd)/bundle:/usr/local/bundle bellbind/docker-for-rails bundle install
...
```

To run `rails s` as:

```sh
$ docker run -it --rm -p 3000:3000 -w /usr/src/app -v $(pwd)/railsapp:/usr/src/app \
    -v $(pwd)/bundle:/usr/local/bundle:ro bellbind/docker-for-rails bundle exec rails s
```

- NOTE: Installed commands in `bundle/bin/` should be execued 
  via `bundle exec`: e.g. `bundle exec rails tmp:clear`

## NOTE: docker build

```sh
$ docker build -t bellbind/docker-for-rails ./
```

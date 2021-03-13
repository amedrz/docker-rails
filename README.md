## Build the project

you can generate a Rails 5.2 skeleton app using:

```bash
docker-compose run --no-deps web rails new . --force --database=postgresql
```

First, Compose builds the image for the web service using the Dockerfile. The
--no-deps tells Compose not to start linked services. Then it runs rails new
inside a new container, using that image. Once it’s done, you should have
generated a fresh app.

Now that you've got a new Gemfile, you need to build the image again.
(This, and changes to the Gemfile or the Dockerfile, should be the only
times you’ll need to rebuild.)

```bash
docker-compose build
```

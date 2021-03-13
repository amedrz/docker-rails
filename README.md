A Docker image with Rails 5.2 and Postgres 11.

```
git clone git@github.com:amedrz/docker-rails-5-2.git my-rails-5-2-app
```

## Build the project

you can generate a Rails 5.2 skeleton app using:

```bash
docker-compose run --no-deps web rails new . --force --database=postgresql
```

First, Compose builds the image for the web service using the Dockerfile. The
`--no-deps` tells Compose not to start linked services. Then it runs rails new
inside a new container, using that image. Once it’s done, you should have
generated a fresh app.

Now that you've got a new Gemfile, you need to build the image again.
(This, and changes to the Gemfile or the Dockerfile, should be the only
times you’ll need to rebuild.)

```bash
docker-compose build
```

### Connect the database

Replace the contents of `config/database.yml` with:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV['DATABASE_HOST'] %>
  username: <%= ENV['POSTGRES_USER'] %>
  pool: 5

development:
  <<: *default
  database: <%= "#{ENV['POSTGRES_DB']}_dev" %>

test:
  <<: *default
  database: <%= "#{ENV['POSTGRES_DB']}_test" %>
```

You can now boot the app with:

```bash
docker-compose up --no-start
```

Open the container in VSCode (Remote-Containers extension). Open a terminal window and run:

```bash
rails db:create
```

```bash
bundle exec rails s -p 3000 -b '0.0.0.0'
```

## Optional steps

Install rubocop

```ruby
group :development do
  # ...
  gem 'rubocop', '~> 1.0'
end
```

Run bundle install:

```
bundle
```

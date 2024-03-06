### A Docker project with Rails 7 and Postgres 11

```
git clone git@github.com:amedrz/docker-rails.git my-rails-app
```

Open the project in VSCode

```bash
cd my-rails-app
code .
```

Using the [Dev Containers extension](https://code.visualstudio.com/docs/devcontainers/containers), choose _Repoen in Container_.

Once it's running from the container, finish the setup from within.

Replace content from `config/database.yml`

```erb
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

Create the database

```bash
rails db:create
```

And run the server

```bash
rails s -p 3000 -b '0.0.0.0'
```

## Cleanup

You may want to reset `git` for a clean history and new target repository
```bash
rm -rf .git
rm init.sql
git init .
```

## How to upgrade this repo

From time to time you may want to upgrade either Ruby or Rails versions. To do so, remove all files but:

- `Gemfile`
- `Dockerfile`
- `docker-compose.yml`
- `init.sql`
- `.devcontainer`

Overwrite the current `Gemfile` with the desired new versions and using the [Dev Containers extension](https://code.visualstudio.com/docs/devcontainers/containers), _Repoen in Container_. Here's an example:

```
source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7'
```

Once in the container, run `rails new` or whatever command you need in order to generate a new app skeleton. Commit changes.



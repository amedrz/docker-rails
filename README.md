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

Once it's running from the container, finish the setup from a local terminal

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
git init .
```

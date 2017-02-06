## Elixir sandbox (Udemy elixir/phoenix bootcamp)

**You must have `Docker` and `docker-compose` installed**

Docker uses environment variables (for Discuss app), you should create an `.env` file with your own - use `.env.sample` for help.

After that, run `docker-compose up -d`, and then log into it's bash: `docker-compose run app bash`
In docker bash you can type `iex` for interactive elixir console, or `iex -S mix` to compile sample code and run the console with that code available in it.


### Cards
Simple console app to get familiar with basic Elixir features. Run `iex -S mix` in `cards` folder to play with.


### Identicon

Simple console app to generate identicons based on given string. To use go to `identicon` folder, run iex (`iex -S mix`) and then create new PNG files by running ```Identicon.main("your string")```

Files will be saved in current folder, enjoy :)


### Discuss

Phoenix Framework app. Starts automatically with docker-compose, and is accessible at `http://localhost:4000`

At `http://localhost:5050` you can find pgadmin - convenient PostgreSQL database management web browser tool.
Default database username and password for Phoenix app is `discuss/discuss`, port is default `5432` and database name is `discuss_dev`.

If you want to expose pure PostgreSQL server port to your localhost (e.g. for IDE use), just add proper `port` configuration in `docker-compose.yml` file. You can find more info about it on official Docker page.

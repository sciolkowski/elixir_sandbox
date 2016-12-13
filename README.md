## Elixir sandbox (Udemy elixir/phoenix bootcamp)

**You must have `Docker` and `docker-compose` installed**

After that, run `docker-compose up -d`, and then log into it's bash: `docker-compose run elixir bash`
In docker bash you can type `iex` for interactive elixir console, or `iex -S mix` to compile sample code and run the console with that code available in it.


### Cards
Simple console app to get familiar with basic Elixir features. Run `iex -S mix` in `cards` folder to play with.


### Identicon

Simple console app to generate identicons based on given string. To use go to `identicon` folder, run iex (`iex -S mix`) and then create new PNG files by running ```Identicon.main("your string")```

Files will be saved in current folder, enjoy :)


### Discuss

Phoenix Framework app. Starts automatically with docker-compose, and is accessible at `http://localhost:4000`

# Dockerex

Elixir library wrapper for Docker. The library uses the Docker Engine
API (a RESTful API accessed by HTTP). The Docker Engine API version
used by the library is specified in file `lib/dockerex.ex`. To see the
highest version of the API your Docker daemon and client support, use
the command `docker version`.

## Configuration

By default, the URL used by the library is
`http://127.0.0.1:2375/`. You can change it in the config file of your
client:

```
config :dockerex, url: System.get_env("DOCKER_URL")
```

## Compilation and tests

```
mix deps.get
mix compile
mix test
```

## Documentation

Maybe not all the Docker Engine API
https://docs.docker.com/engine/api/v1.43/ is implemented in the
library. To see the documention run `mix docs` and then visit
`doc/index.html`.

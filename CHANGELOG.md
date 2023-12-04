# Deliverit Changelog

## Legend

- `[+]` Added for new features
- `[-]` Removed for now removed features
- `[C]` Changed for changes in existing functionality
- `[F]` Fixed for any bug fixes
- `[O]` Obsolete for soon-to-be removed features
- `[T]` Technical change that doesn't affect the API (eg. refactoring, tooling, etc.)

## Next release

- Asynchronous logs:
  - `Dockerex.Containers.logs(id, params \\ %{stdout: true}, pid \\ nil)`
    Get stdout and stderr logs from a container. If pid is a pid/0
    then the output is streamed to the process.
- [+] Initial release. Functions implemented:
  - Dockerex.Images
    - `build(params, image \\ nil, registry_config \\ %{})` Build an image from a tar archive with a Dockerfile in it.
    - `create(params, image \\ nil)` Create an image by either pulling it from a registry or importing it.
    - `get(id)` Return low-level information about an image.
    - `list(options \\ nil)`
    - `prune(params \\ nil)`
    - `remove(id, params \\ nil)` Remove an image, along with any untagged parent images that were referenced by that image.
  - Dockerex.Containers
    - `create(name \\ nil, params)` Create a container.
    - `get(id)` Return low-level information about a container.
    - `get_archive(id, params)` Get a tar archive of a resource in the filesystem of container id.
    - `kill(id, signal \\ nil)` Send a POSIX signal to a container, defaulting to killing to the container.
    - `list(options \\ nil)`
    - `logs(id, params \\ %{stdout: true})` Get stdout and stderr logs from a container.
    - `prune(params \\ nil)`
    - `put_archive(id, body, params)` Upload a tar archive to be extracted to a path in the filesystem of container id.
    - `remove(id, params \\ nil)` Remove a container.
    - `start(id, params \\ nil)` Start a container.
    - `stop(id, params \\ nil)` Stop a container.
    - `wait(id, condition \\ nil)` Block until a container stops, then returns the exit code.

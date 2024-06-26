defmodule Dockerex.Images.Types do
  @moduledoc """
  Module with the request and responses types when interfacing the image related API.

  Using the module makes all types available.
  """
  defmacro __using__(_) do
    quote do
      alias Dockerex.Images.Types.ListParams
      alias Dockerex.Images.Types.ImageAbstract
      alias Dockerex.Images.Types.Image
      alias Dockerex.Images.Types.CreateParams
      alias Dockerex.Images.Types.BuildParams
      alias Dockerex.Images.Types.BuildError
      alias Dockerex.Images.Types.PruneParams
      alias Dockerex.Images.Types.PruneResponse
      alias Dockerex.Images.Types.RemoveParams
      alias Dockerex.Images.Types.RemoveResponse
    end
  end

  # ===================================================== #
  # Basic types (Required for Dockerex.Images types)  #
  # ===================================================== #

  defmodule Labels do
    @type t :: %{Dockerex.Key.t() => String.t()}
  end

  defmodule Volumes do
    @type t :: %{String.t() => map()}
  end

  defmodule Config do
    @type t :: %{
            AttachStderr: boolean(),
            AttachStdin: boolean(),
            AttachStdout: boolean(),
            Cmd: nil | [String.t()],
            Domainname: String.t(),
            Entrypoint: nil | [String.t()],
            Env: [String.t()],
            Hostname: String.t(),
            Image: String.t(),
            Labels: nil | Labels.t(),
            OnBuild: nil | [String.t()],
            OpenStdin: boolean(),
            StdinOnce: boolean(),
            Tty: boolean(),
            User: String.t(),
            Volumes: nil | [Volumes.t()],
            WorkingDir: String.t()
          }
  end

  defmodule ContainerConfig do
    @type t :: %{
            AttachStderr: boolean(),
            AttachStdin: boolean(),
            AttachStdout: boolean(),
            Cmd: [String.t()] | nil,
            Domainname: String.t(),
            Entrypoint: [String.t()] | nil,
            Env: [String.t()],
            Hostname: String.t(),
            Image: String.t(),
            Labels: nil | Labels.t(),
            OnBuild: nil | [String.t()],
            OpenStdin: boolean(),
            StdinOnce: boolean(),
            Tty: boolean(),
            User: String.t(),
            Volumes: nil | Volumes.t(),
            WorkingDir: String.t()
          }
  end

  # ========================== #
  # Types for Dockerex.Images  #
  # ========================== #

  defmodule ImageAbstract do
    @type t :: %{
            Id: String.t(),
            ParentId: String.t(),
            RepoTags: [String.t()],
            RepoDigests: [String.t()],
            Created: integer(),
            Size: integer(),
            VirtualSize: integer(),
            SharedSize: integer(),
            Labels: Labels.t(),
            Containers: integer()
          }
  end

  defmodule Image do
    @type t :: %{
            Architecture: String.t(),
            Author: String.t(),
            Comment: String.t(),
            Config: Config.t(),
            Container: String.t(),
            ContainerConfig: ContainerConfig.t(),
            Created: String.t(),
            DockerVersion: String.t(),
            GraphDriver: %{Data: nil | %{Dockerex.Key.t() => String.t()}, Name: String.t()},
            Id: String.t(),
            Metadata: %{LastTagTime: String.t()},
            Os: String.t(),
            Parent: String.t(),
            RepoDigests: [String.t()],
            RepoTags: [String.t()],
            RootFS: %{
              Layers: [String.t()],
              Type: String.t(),
              BaseLayer: String.t()
            },
            Size: integer(),
            VirtualSize: integer()
          }
  end

  defmodule ListParamsFilters do
    @type t :: %{
            before: [String.t()],
            dangling: [boolean()],
            label: [String.t()],
            reference: [String.t()],
            since: [String.t()]
          }
  end

  defmodule ListParams do
    @type t :: %{all: boolean(), filters: ListParamsFilters.t(), digests: boolean()} | nil
  end

  defmodule CreateParams do
    @type t :: %{
            required(:fromImage) => String.t(),
            optional(:fromSrc) => String.t(),
            optional(:repo) => String.t(),
            optional(:tag) => String.t(),
            optional(:platform) => String.t()
          }
  end

  defmodule BuildParams do
    @type t :: %{
            optional(:dockerfile) => String.t(),
            optional(:t) => String.t(),
            optional(:extrahosts) => String.t(),
            optional(:remote) => String.t(),
            optional(:q) => boolean(),
            optional(:nocache) => boolean(),
            optional(:cachefrom) => [String.t()],
            optional(:pull) => String.t(),
            optional(:rm) => boolean(),
            optional(:forcerm) => boolean(),
            optional(:memory) => integer(),
            optional(:memswap) => integer(),
            optional(:cpushares) => integer(),
            optional(:cpusetcpus) => String.t(),
            optional(:cpuperiod) => integer(),
            optional(:cpuquota) => integer(),
            optional(:buildargs) => %{atom() => any()},
            optional(:shmsize) => integer(),
            optional(:squash) => boolean(),
            optional(:labels) => Labels.t(),
            optional(:networkmode) => String.t(),
            optional(:platform) => String.t()
          }
  end

  defmodule BuildError do
    @type t :: %{
            error: String.t(),
            errorDetail: %{
              code: 1,
              message: String.t()
            }
          }
  end

  defmodule PruneParamsFilter do
    @type t :: %{until: [integer()], label: [String.t()], dangling: [boolean()]}
  end

  defmodule PruneParams do
    @type t :: %{filters: PruneParamsFilter.t()}
  end

  defmodule PruneResponse do
    @type t :: %{
            ContainersDeleted:
              [
                %{
                  Untagged: String.t(),
                  Deleted: String.t()
                }
              ]
              | nil,
            SpaceReclaimed: integer()
          }
  end

  defmodule RemoveParams do
    @type t ::
            %{
              optional(:force) => boolean(),
              optional(:noprune) => boolean()
            }
            | nil
  end

  defmodule RemoveResponse do
    @type t :: [%{Untagged: String.t()} | %{Deleted: String.t()}]
  end
end

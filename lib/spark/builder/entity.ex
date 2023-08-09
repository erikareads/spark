defmodule Spark.Builder.Entity do
  @moduledoc false
  alias Spark.Builder.Field

  @opaque t :: %__MODULE__{name: atom(), target: module}
  defstruct [:name, :target]

  @spec new(name :: atom()) :: t()
  def new(name) do
    %__MODULE__{name: name}
  end

  @spec target(entity :: t(), target :: module) :: t()
  def target(entity, target) do
    %__MODULE__{entity | target: target}
  end

  @spec subentity(entity :: t(), subentity :: t()) :: t()
  def subentity(_entity, _subentity), do: :ok

  @spec field(entity :: t(), field :: Field.t()) :: t()
  def field(_entity, _field), do: :ok
end

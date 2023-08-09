defmodule Spark.Builder.Type do
  @moduledoc false
  alias __MODULE__

  @opaque t :: Type.Any.t() | Type.KeywordList.t() | Type.Map.t()

  defmodule Any do
    @opaque t :: %__MODULE__{}
    defstruct []
  end

  defmodule KeywordList do
    @opaque t :: %__MODULE__{value_type: Type.t()}
    defstruct [:value_type]
  end

  defmodule Map do
    @opaque t :: %__MODULE__{key_type: Type.t(), value_type: Type.t()}
    defstruct [:key_type, :value_type]
  end

  @spec any() :: t()
  def any, do: %Type.Any{}

  @spec keyword_list(value_type :: t()) :: t()
  def keyword_list(value_type) do
    %Type.KeywordList{value_type: value_type}
  end

  @spec map() :: t()
  def map do
    %Type.Map{key_type: any(), value_type: any()}
  end

  @spec map(key_type :: t(), value_type :: t()) :: t()
  def map(key_type, value_type) do
    %Type.Map{key_type: key_type, value_type: value_type}
  end
end

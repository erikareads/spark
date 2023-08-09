defmodule Spark.Builder.Type do
  @moduledoc false
  alias __MODULE__

  @opaque t ::
            Type.Any.t()
            | Type.KeywordList.t()
            | Type.Map.t()
            | Type.Atom.t()
            | Type.String.t()
            | Type.Boolean.t()
            | Type.Integer.t()

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

  defmodule Atom do
    @opaque t :: %__MODULE__{}
    defstruct []
  end

  defmodule String do
    @opaque t :: %__MODULE__{}
    defstruct []
  end

  defmodule Boolean do
    @opaque t :: %__MODULE__{}
    defstruct []
  end

  defmodule Integer do
    @opaque t :: %__MODULE__{kind: :integer | :positive_integer | :non_negative_integer}
    defstruct [:kind]
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

  @spec atom() :: t()
  def atom, do: %Type.Atom{}

  @spec string() :: t()
  def string, do: %Type.String{}

  @spec boolean() :: t()
  def boolean, do: %Type.Boolean{}

  @spec integer() :: t()
  def integer, do: %Type.Integer{kind: :integer}

  @spec positive_integer() :: t()
  def positive_integer, do: %Type.Integer{kind: :positive_integer}

  @spec non_negative_integer() :: t()
  def non_negative_integer, do: %Type.Integer{kind: :non_negative_integer}
end

defmodule Spark.Builder.Field do
  @moduledoc false
  alias Spark.Builder.Type

  @opaque t :: %__MODULE__{name: atom(), type: Type.t()}
  defstruct [:name, :type]
end

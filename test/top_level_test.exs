defmodule Spark.TopLevelTest do
  use ExUnit.Case

  alias Spark.Test.TopLevel.Info

  test "top level DSL entities are available" do
    defmodule Simple do
      use Spark.Test.TopLevel

      foo(10)
      step(:foo)
    end

    assert [%Spark.Test.Step{name: :foo, steps: []}] = Info.steps(Simple)
    assert {:ok, 10} = Info.steps_foo(Simple)
  end
end
defmodule Spark.Dsl.Section do
  @moduledoc """
  Declares a DSL section.

  A dsl section allows you to organize related configurations. All extensions
  configure sections, they cannot add DSL builders to the top level. This
  keeps things organized, and concerns separated.

  A section may have nested sections, which will be configured the same as other sections.
  Getting the options/entities of a section is done by providing a path, so you would
  use the nested path to retrieve that configuration. See `Spark.Dsl.Extension.get_entities/2`
  and `Spark.Dsl.Extension.get_opt/4`.

  A section may have entities, which are constructors that produce instances of structs.
  For more on entities, see `Spark.Dsl.Entity`.

  A section may also have a `schema`, which is a `NimbleOptions` schema. Spark will produce
  builders for those options, so that they may be configured. They are retrieved with
  `Spark.Dsl.Extension.get_opt/4`.

  To create a section that is available at the top level (i.e not  nested inside of its own name), use
  `top_level?: true`. Remember, however, that this has no effect on sections nested inside of other sections.

  For a full example, see `Spark.Dsl.Extension`.
  """
  defstruct [
    :name,
    imports: [],
    schema: [],
    describe: "",
    snippet: "",
    links: nil,
    examples: [],
    modules: [],
    top_level?: false,
    no_depend_modules: [],
    auto_set_fields: [],
    deprecations: [],
    entities: [],
    sections: [],
    docs: "",
    patchable?: false
  ]

  alias Spark.{
    Dsl.Entity,
    Dsl.Section,
    OptionsHelpers
  }

  @type name :: atom()

  @type imports :: [module]

  @type describe :: String.t()

  @type snippet :: String.t()

  @type top_level?() :: boolean()

  @type links :: nil | Keyword.t([String.t()])

  @type examples() :: [String.t()]

  @type modules :: [atom]

  @type no_depend_modules() :: [atom]

  @type auto_set_fields() :: Keyword.t(any)

  @type entities :: [Entity.t()]

  @type sections :: [Section.t()]

  @typedoc """
  Internal field. Not set by user.
  """
  @type docs :: String.t()

  @type patchable? :: boolean()

  @type t :: %Section{
          name: name(),
          imports: imports(),
          schema: OptionsHelpers.schema(),
          describe: describe(),
          snippet: snippet(),
          top_level?: top_level?(),
          links: links(),
          examples: examples(),
          modules: modules(),
          no_depend_modules: no_depend_modules(),
          auto_set_fields: auto_set_fields(),
          entities: entities(),
          sections: sections(),
          docs: docs(),
          patchable?: patchable?()
        }
end

defmodule Broth.Message.User.GetRelationship do

  # TO BE DEPRECATED IN FAVOR OF SOMETHING ELSE.  ONCE PRELOADS HAVE BEEN
  # FULLY OPTIMIZED, IT SHOULD BE POSSIBLE TO GLEAN THIS INFORMATION OFF
  # OF PRELOAD INFORMATION.

  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :userId, :binary_id #required.
  end

  import Ecto.Changeset
  alias Kousa.Utils.UUID

  def changeset(changeset, data) do
    changeset
    |> cast(data, [:userId])
    |> validate_required([:userId])
    |> UUID.normalize(:userId)
  end

  defmodule Reply do
    use Ecto.Schema

    @primary_key false
    embedded_schema do
      embeds_one(:relationship, Broth.Message.Types.Relationship)
    end
  end
end

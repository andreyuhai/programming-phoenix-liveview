defmodule Pento.Repo.Migrations.AddUsernameToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :username, :string, size: 40
    end
  end
end

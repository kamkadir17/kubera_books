defmodule Kubera.BNRFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kubera.BNR` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        logo: "some logo",
        name: "some name",
        owner_id: "some owner_id",
        slug: "some slug",
        unique_hash: "some unique_hash"
      })
      |> Kubera.BNR.create_company()

    company
  end
end

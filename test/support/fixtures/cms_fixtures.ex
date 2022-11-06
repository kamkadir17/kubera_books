defmodule Kubera.CMSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kubera.CMS` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Kubera.CMS.create_page()

    page
  end
end

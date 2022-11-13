defmodule Kubera.BNRTest do
  use Kubera.DataCase

  alias Kubera.BNR

  describe "companies" do
    alias Kubera.BNR.Company

    import Kubera.BNRFixtures

    @invalid_attrs %{logo: nil, name: nil, owner_id: nil, slug: nil, unique_hash: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert BNR.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert BNR.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{logo: "some logo", name: "some name", owner_id: "some owner_id", slug: "some slug", unique_hash: "some unique_hash"}

      assert {:ok, %Company{} = company} = BNR.create_company(valid_attrs)
      assert company.logo == "some logo"
      assert company.name == "some name"
      assert company.owner_id == "some owner_id"
      assert company.slug == "some slug"
      assert company.unique_hash == "some unique_hash"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BNR.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{logo: "some updated logo", name: "some updated name", owner_id: "some updated owner_id", slug: "some updated slug", unique_hash: "some updated unique_hash"}

      assert {:ok, %Company{} = company} = BNR.update_company(company, update_attrs)
      assert company.logo == "some updated logo"
      assert company.name == "some updated name"
      assert company.owner_id == "some updated owner_id"
      assert company.slug == "some updated slug"
      assert company.unique_hash == "some updated unique_hash"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = BNR.update_company(company, @invalid_attrs)
      assert company == BNR.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = BNR.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> BNR.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = BNR.change_company(company)
    end
  end
end

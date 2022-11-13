defmodule Kubera.PROFILESTest do
  use Kubera.DataCase

  alias Kubera.PROFILES

  describe "users" do
    alias Kubera.PROFILES.User

    import Kubera.PROFILESFixtures

    @invalid_attrs %{name: nil, email: nil, phone: nil, password: nil, role: nil, remember_token: nil, facebook_id: nil, google_id: nil, github_id: nil, contact_name: nil, company_name: nil, website: nil, enable_portal: nil, currency_id: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert PROFILES.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert PROFILES.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", email: "some email", phone: "some phone", password: "some password", role: "some role", remember_token: "some remember_token", facebook_id: "some facebook_id", google_id: "some google_id", github_id: "some github_id", contact_name: "some contact_name", company_name: "some company_name", website: "some website", enable_portal: "some enable_portal", currency_id: "some currency_id"}

      assert {:ok, %User{} = user} = PROFILES.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
      assert user.phone == "some phone"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.remember_token == "some remember_token"
      assert user.facebook_id == "some facebook_id"
      assert user.google_id == "some google_id"
      assert user.github_id == "some github_id"
      assert user.contact_name == "some contact_name"
      assert user.company_name == "some company_name"
      assert user.website == "some website"
      assert user.enable_portal == "some enable_portal"
      assert user.currency_id == "some currency_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PROFILES.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some name", email: "some email", phone: "some phone", password: "some password", role: "some role", remember_token: "some remember_token", facebook_id: "some facebook_id", google_id: "some google_id", github_id: "some github_id", contact_name: "some contact_name", company_name: "some company_name", website: "some website", enable_portal: "some enable_portal", currency_id: "some currency_id"}

      assert {:ok, %User{} = user} = PROFILES.update_user(user, update_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
      assert user.phone == "some phone"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.remember_token == "some remember_token"
      assert user.facebook_id == "some facebook_id"
      assert user.google_id == "some google_id"
      assert user.github_id == "some github_id"
      assert user.contact_name == "some contact_name"
      assert user.company_name == "some company_name"
      assert user.website == "some website"
      assert user.enable_portal == "some enable_portal"
      assert user.currency_id == "some currency_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = PROFILES.update_user(user, @invalid_attrs)
      assert user == PROFILES.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = PROFILES.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> PROFILES.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = PROFILES.change_user(user)
    end
  end
end

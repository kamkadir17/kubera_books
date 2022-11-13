defmodule KuberaWeb.CompanyLiveTest do
  use KuberaWeb.ConnCase

  import Phoenix.LiveViewTest
  import Kubera.BNRFixtures

  @create_attrs %{logo: "some logo", name: "some name", owner_id: "some owner_id", slug: "some slug", unique_hash: "some unique_hash"}
  @update_attrs %{logo: "some updated logo", name: "some updated name", owner_id: "some updated owner_id", slug: "some updated slug", unique_hash: "some updated unique_hash"}
  @invalid_attrs %{logo: nil, name: nil, owner_id: nil, slug: nil, unique_hash: nil}

  defp create_company(_) do
    company = company_fixture()
    %{company: company}
  end

  describe "Index" do
    setup [:create_company]

    test "lists all companies", %{conn: conn, company: company} do
      {:ok, _index_live, html} = live(conn, Routes.company_index_path(conn, :index))

      assert html =~ "Listing Companies"
      assert html =~ company.logo
    end

    test "saves new company", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.company_index_path(conn, :index))

      assert index_live |> element("a", "New Company") |> render_click() =~
               "New Company"

      assert_patch(index_live, Routes.company_index_path(conn, :new))

      assert index_live
             |> form("#company-form", company: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#company-form", company: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_index_path(conn, :index))

      assert html =~ "Company created successfully"
      assert html =~ "some logo"
    end

    test "updates company in listing", %{conn: conn, company: company} do
      {:ok, index_live, _html} = live(conn, Routes.company_index_path(conn, :index))

      assert index_live |> element("#company-#{company.id} a", "Edit") |> render_click() =~
               "Edit Company"

      assert_patch(index_live, Routes.company_index_path(conn, :edit, company))

      assert index_live
             |> form("#company-form", company: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#company-form", company: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_index_path(conn, :index))

      assert html =~ "Company updated successfully"
      assert html =~ "some updated logo"
    end

    test "deletes company in listing", %{conn: conn, company: company} do
      {:ok, index_live, _html} = live(conn, Routes.company_index_path(conn, :index))

      assert index_live |> element("#company-#{company.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#company-#{company.id}")
    end
  end

  describe "Show" do
    setup [:create_company]

    test "displays company", %{conn: conn, company: company} do
      {:ok, _show_live, html} = live(conn, Routes.company_show_path(conn, :show, company))

      assert html =~ "Show Company"
      assert html =~ company.logo
    end

    test "updates company within modal", %{conn: conn, company: company} do
      {:ok, show_live, _html} = live(conn, Routes.company_show_path(conn, :show, company))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Company"

      assert_patch(show_live, Routes.company_show_path(conn, :edit, company))

      assert show_live
             |> form("#company-form", company: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#company-form", company: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_show_path(conn, :show, company))

      assert html =~ "Company updated successfully"
      assert html =~ "some updated logo"
    end
  end
end

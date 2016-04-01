defmodule ForEctoUpgrade.EntryController do
  use ForEctoUpgrade.Web, :controller
  alias ForEctoUpgrade.Entry

  def index(conn, _params) do
    entries = Entry |> Entry.valid |> Entry.preload_all |> Repo.slave.all
    render(conn, "index.html", entries: entries)
  end

  def show(conn, %{"id" => id}) do
    entry = Entry |> Entry.valid |> Entry.preload_all |> Repo.slave.get!(id)
    render(conn, "show.html", entry: entry)
  end
end

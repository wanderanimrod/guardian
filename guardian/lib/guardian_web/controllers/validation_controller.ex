defmodule GuardianWeb.ValidationController do
  use GuardianWeb, :controller

  require Logger
  def post(conn, _) do
    conn
    |> put_status(200)
    |> json(%{status: "ok"})
  end

  def health(conn, _) do
    conn 
    |> put_status(200) 
    |> json(%{status: "The guardian is on guard 😸"})
  end
end
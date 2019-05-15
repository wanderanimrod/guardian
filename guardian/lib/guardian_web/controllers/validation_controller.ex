defmodule GuardianWeb.ValidationController do
  use GuardianWeb, :controller

  require Logger

  def health(conn, _) do
    conn 
    |> put_status(200) 
    |> json(%{status: "The guardian is on guard 😸"})
  end

  def post(conn, _payload) do
    conn
    |> put_status(200)
    |> json(%{status: "ok"})
  end
end
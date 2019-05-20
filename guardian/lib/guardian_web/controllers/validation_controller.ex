defmodule GuardianWeb.ValidationController do
  use GuardianWeb, :controller

  require Logger
  def post(conn, params) do
    conn
    |> put_status(200)
    |> json(disallow_all(params))
  end

  def health(conn, _) do
    conn 
    |> put_status(200) 
    |> json(%{status: "The guardian is on guard 😸"})
  end

  defp disallow_all(admission_review_request) do
    admission_denied = %{
      allowed: false,
      status: %{
        status: "Failure",
        message: "This cluster is closed for business. No deployments allowed."
      }
    }
    Map.put(admission_review_request, :response, admission_denied)
  end
end
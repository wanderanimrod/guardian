defmodule GuardianWeb.ValidationController do
  use GuardianWeb, :controller

  def post(conn, k8s_admission_request) do
    conn
    |> put_status(200)
    |> json(allowed?(k8s_admission_request))
  end

  def health(conn, _) do
    conn 
    |> put_status(200) 
    |> json(%{status: "The guardian is on guard 😸"})
  end

  defp allowed?(admission_request) do
    case admission_request do
      %{"request" => %{"object" => %{"metadata" => %{"labels" => %{"app" => "guardian"}}}}} -> Map.put(admission_request, :response, %{allowed: true})
      _ -> deny_admission(admission_request)
    end
  end

  defp deny_admission(admission_review_request) do
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
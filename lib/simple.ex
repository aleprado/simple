defmodule Simple do
  use Ace.HTTP.Service, cleartext: true

  def handle_request(%{method: :GET, path: []},_state) do
    response(:ok)
    |> set_header("content-type", "text/plain")
    |> set_body("body to assert")
  end

  def handle_request(%{method: :GET, path: ["path", path]}, _state) do
    response(:ok)
    |> set_header("content-type", "text/plain")
    |> set_body("body to assert + #{path}")
  end

  def handle_request(_request, _state) do
    response(:not_found)
    |> set_header("content-type", "text/plain")
    |> set_body("bad request")
  end

  def url() do
    "http://localhost:8080"
  end

end

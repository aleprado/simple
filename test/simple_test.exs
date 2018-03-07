defmodule Simpletest do
  use ExUnit.Case
  alias Simple

  test "verify response code" do
    response = HTTPoison.get!(Simple.url())
    assert (%{status_code: 200} = response)
  end

  test "verify body" do
    response = HTTPoison.get!(Simple.url())
    assert (%{body: "body to assert", status_code: 200} = response)
  end

  test "verify body + path" do
    path = "test"
    response = HTTPoison.get!("#{Simple.url()}/path/#{path}")
    assert (%{body: "body to assert + test", status_code: 200} = response)
  end

end
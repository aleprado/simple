defmodule WhiteBreadContext do
  use WhiteBread.Context

  given_ ~r/^A simple service to test, response code (?<code>[0-9]+)$/, fn state, %{code: code} ->
    response = HTTPoison.get!(Simple.url())
    %{status_code: resp_code} = response
    assert resp_code == code |> String.to_integer
    {:ok, state}
  end

  given_ ~r/^A simple service to test, respose body should be (?<body>.+)$/, fn state, %{body: body} ->
    response = HTTPoison.get!(Simple.url())
    %{body: resp_body} = response
    assert resp_body == body
    {:ok, state}
  end

  given_ ~r/^A simple service to test$/, fn state ->
    {:ok, state}
  end

  then_ ~r/^I give a path (?<path>.+)$/, fn state, %{path: path} ->
    {:ok, state |> Map.put(:path, path)}
  end

  given_ ~r/^respose body should be (?<body>.+)$/, fn state, %{body: body} ->
    url = "#{Simple.url()}" <> "#{state |> Map.get(:path)}"
    response = HTTPoison.get!(url)
    %{body: resp_body} = response
    assert resp_body == body
    {:ok, state}
  end



end

defmodule Servy.Parser do
  @moduledoc "Parser."

  @doc """
    Parses the request.
  """
  def parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first()
      |> String.split(" ")

    %{
      method: method,
      path: path,
      resp_body: "",
      status: nil
    }
  end
end

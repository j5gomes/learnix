defmodule Servy.Plugins do
  @moduledoc "Plugins."
  alias Servy.Conv

  @doc """
    Logs 404 requests
  """
  def track(%Conv{status: 404, path: path} = conv) do
    IO.puts("Warning #{path} is on the loose!")
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/significa"} = conv) do
    %{conv | path: "torrinha"}
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv), do: IO.inspect(conv)
end

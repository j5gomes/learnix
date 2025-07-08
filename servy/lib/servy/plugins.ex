defmodule Servy.Plugins do
  @moduledoc "Plugins."

  @doc """
    Logs 404 requests
  """
  def track(%{status: 404, path: path} = conv) do
    IO.puts("Warning #{path} is on the loose!")
    conv
  end

  def track(conv), do: conv

  def rewrite_path(%{path: "/significa"} = conv) do
    %{conv | path: "torrinha"}
  end

  def rewrite_path(conv), do: conv

  def log(conv), do: IO.inspect(conv)
end

defmodule Servy.BearController do
  alias Servy.Bear
  alias Servy.WildThings

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    items =
      WildThings.list_bears()
      |> Enum.filter(&Bear.grizzly?/1)
      |> Enum.sort(&Bear.order_asc_by_name/2)
      |> Enum.map(&bear_item/1)
      |> Enum.join()

    %{conv | status: 200, resp_body: "<ul>#{items}</ul>"}
  end

  def show(conv, %{"id" => id}) do
    bear = WildThings.get_bear(id)
    %{conv | status: 200, resp_body: "<h1>#{bear.id}: #{bear.name}</h1>"}
  end

  def create(conv, %{"name" => name, "role" => role}) do
    %{
      conv
      | status: 201,
        resp_body: "Created a #{role} bear named #{name}!"
    }
  end
end

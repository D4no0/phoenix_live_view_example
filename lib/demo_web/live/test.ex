defmodule DemoWeb.TestLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(DemoWeb.TestView, "index.html", assigns)
  end

  def mount(assigns, session, socket) do
    {:ok, socket |> assign(:text_value, "")}
  end

  def handle_event("update", %{"filter" => %{"text_input" => text_input}}, socket) do
    IO.inspect text_input
    {:noreply, assign(socket, :text_input, text_input)}
  end

  def handle_event("reset", _params, socket) do
    IO.puts "reset"
    {:noreply, assign(socket, :text_input, "")}
  end
end

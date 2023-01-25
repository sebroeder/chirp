defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"post-#{@post.id}"} class="flex gap-4 rounded border p-4 mt-2 text-sm">
      <div class="flex-none">
        <img src="https://placekitten.com/160/160" alt="avatar" class="h-20 w-20 rounded" />
      </div>
      <div class="flex flex-col grow">
        <p class="font-semibold">@<%= @post.username %></p>
        <p class="pb-2"><%= @post.body %></p>
        <div class="mt-auto flex justify-between text-xs font-semibold">
          <span>
            <Heroicons.heart class="inline-block h-4 w-4 stroke-2" />
            <%= @post.likes_count %>
          </span>
          <span>
            <Heroicons.arrow_path_rounded_square class="inline-block h-4 w-4 stroke-2" />
            <%= @post.reposts_count %>
          </span>
          <span>
            <.link patch={~p"/posts/#{@post}/edit"}>
              <Heroicons.pencil_square class="inline-block h-4 w-4 stroke-2 hover:text-brand" />
            </.link>
            <.link phx-click={JS.push("delete", value: %{id: @post.id})} data-confirm="Are you sure?">
              <Heroicons.trash class="ml-2 inline-block h-4 w-4 stroke-2 hover:text-brand" />
            </.link>
          </span>
        </div>
      </div>
    </div>
    """
  end
end

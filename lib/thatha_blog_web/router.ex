defmodule ThathaBlogWeb.Router do
  use ThathaBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ThathaBlogWeb do
    pipe_through :api

    post "/login", UsersController, :sign_in

    # user routers
    post "/user", UsersController, :create
    get "/user", UsersController, :list
    get "user/:id", UsersController, :index
    delete "user/me", UsersController, :delete

    # post routers
    post "/post", PostsController, :create
    get "/post", PostsController, :list
    get "/post/id", PostsController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ThathaBlogWeb.Telemetry
    end
  end
end

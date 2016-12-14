defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  # With alias we do not have to type whole Discuss.Topic everytime, only Topic.
  alias Discuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)

    render conn, "index.html", topics: topics
  end

  def new(conn, _params) do
    # The `conn` struct is a total focal point of how Phoenix works.
    # It comes with request, and then is passed from function to function
    # until it's ready to be returned to the user as a response (somewhat :)
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic} = params) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
      end
  end

end

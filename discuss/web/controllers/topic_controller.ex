defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  # With alias we do not have to type whole Discuss.Topic everytime, only Topic.
  alias Discuss.Topic

  plug Discuss.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

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
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic was successfully created.")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
      end
  end

  def edit(conn, %{"id" => topic_id} = params) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"id" => topic_id, "topic" => topic} = params) do
    # old_topic = Repo.get(Topic, topic_id)
    # changeset = Topic.changeset(old_topic, topic)
    # code above can be refactored easly to:
    changeset = Topic
     |> Repo.get(topic_id)
     |> Topic.changeset(topic)
    # if we do not need old_topic data anywhere

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic \"#{topic["title"]}\" updated.")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: topic
    end
  end

  def delete(conn, %{"id" => topic_id} = params) do
    Repo.get!(Topic, topic_id) |> Repo.delete!
    conn
    |> put_flash(:info, "Topic deleted")
    |> redirect(to: topic_path(conn, :index))
  end

end

module Types
  class PostType < Types::BaseObject
    field :id, Integer, null: false
    field :userId, Integer, null: false
    field :title, String, null: false
    field :body, String, null: true
    field :published, Boolean, null: true
    field :createdAtMs, Integer, null: false
    field :updatedAtMs, Integer, null: false

    field :user, Types::UserGraphType, null: false
  end
end

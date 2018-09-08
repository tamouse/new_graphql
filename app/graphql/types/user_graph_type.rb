module Types
  class UserGraphType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: false
    field :username, String, null: true
    field :preferred_name, String, null: true
    field :preferred_pronouns, String, null: true
    field :admin, Boolean, null: false
    field :created_at_ms, Integer, null: false
    field :updated_at_ms, Integer, null: false

    field :posts, Types::PostType.connection_type, null: false
  end
end

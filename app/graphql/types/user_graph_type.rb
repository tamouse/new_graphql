module Types
  class UserGraphType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: false
    field :username, String, null: true
    field :preferred_name, String, null: true
    field :preferred_pronouns, String, null: true
    field :admin, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at_ms, Integer, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at_ms, Integer, null: false
  end
end

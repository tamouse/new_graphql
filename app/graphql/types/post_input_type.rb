module Types
  class PostInputType < Types::BaseObject
    field :id, Integer, null: true
    field :title, String, null: false
    field :body, String, null: true
  end
end

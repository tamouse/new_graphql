module Types
  class UserGraphType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: false
    field :username, String, null: true
    field :preferred_name, String, null: true
    field :preferred_pronouns, String, null: true
    field :admin, Boolean, null: false
    field :createdAt, Integer, null: false
    field :updatedAt, Integer, null: false

    field :posts, [Types::PostType], null: false do
      argument :per, Integer, required: false, default_value: 30
      argument :page, Integer, required: false, default_value: 1
    end
    def posts(page:, per:)
      object.posts.page(page).per(per)
    end

    field :total_posts, Integer, null: true, description: 'Total number of posts for user'
    def total_posts
      object.posts.count
    end
  end
end

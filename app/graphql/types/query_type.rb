module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserGraphType, null: true,
      description: "The user logged in, eventually"
    def user
      User.first
    end

    field :public_posts, [Types::PostType], null: true, description: "Public Posts"
    def public_posts
      Post.where(published: true)
    end
  end
end

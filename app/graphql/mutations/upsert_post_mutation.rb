module Mutations
  class UpsertPostMutation < BaseMutation
    argument :id, Integer, required: false
    argument :title, String, required: false
    argument :body, String, required: false

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(id: nil, title: nil, body: nil)
      unless context[:current_user]
        raise GraphQL::ExecutionError, "User not allowed to perform this action"
      end

      if id.present?
        # Update existing post
        post = context[:current_user].posts.find(id)
        post.title = title if title.present?
        post.body = body if body.present?
      else
        # Create new post
        post = context[:current_user].posts.build(title: title, body: body)
      end

      if post.save
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end

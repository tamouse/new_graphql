module Mutations
  class PublishPostMutation < BaseMutation
    field :post, Types::PostType, null: false
    field :errors, [String], null: true

    argument :id, Integer, required: true

    def resolve(id:)
      unless context[:current_user].present?
        raise GraphQL::ExecutionError, "User is not permitted to perform this operation"
      end

      post = context[:current_user].posts.find_by(id: id)
      if post.present?
        if post.publish!
          {
            post: post,
            errors: []
          }
        else
          {
            post: post,
            errors: post.errors.full_messages
          }
        end
      else
        {
          post: nil,
          errors: [
            "Post not found"
          ]
        }
      end
    end
  end
end

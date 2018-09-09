module Mutations
  class DeletePostMutation < BaseMutation
    argument :id, Integer, required: true
    field :errors, [String], null: false

    def resolve(id: nil)
      unless context[:current_user]
        raise GraphQL::ExecuteError, "User unable to peform operation"
      end

      if id.present?
        post = context[:current_user].posts.find_by(:id)
        if post.present?
          if post.destroy
            {
              errors: []
            }
          else
            {
              errors: post.errors.full_messages
            }
          end
        else
          {
            errors: [
              "Post not found"
            ]
          }
        end
      else
        {
          errors: [
            "Post not found"
          ]
        }
      end
    end

  end
end

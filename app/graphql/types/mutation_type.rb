module Types
  class MutationType < Types::BaseObject
    field :publishPost, mutation: Mutations::PublishPostMutation
    field :upsertPost, mutation: Mutations::UpsertPostMutation
    field :deletePost, mutation: Mutations::DeletePostMutation
  end
end

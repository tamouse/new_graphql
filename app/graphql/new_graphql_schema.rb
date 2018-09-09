class NewGraphqlSchema < GraphQL::Schema

  DEFAULT_PER_PAGE = 30

  mutation(Types::MutationType)
  query(Types::QueryType)
end

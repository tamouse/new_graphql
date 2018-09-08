class NewGraphqlSchema < GraphQL::Schema
  default_max_page_size 30
  mutation(Types::MutationType)
  query(Types::QueryType)
end

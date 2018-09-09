## PaginationObjectType - GraphQL Object class to handle pagination of resources
#
# What I want to be able to do here is expose a pageinfo object that would include the following info:
# - total number of records for the resource
# - total number of pages of per-page records
# - next / previous pages of per-page records
#
# The difficulty I'm having is that I can't determine how to let the user submit the `page` and `per` argumnts only once, but use them for the other fields as well.
# Somehow figuring out the scope based on `page` and `per` first then using it in `total_pages`, `next_page`, `prev_page` doesn't quite fit into this world.
module Types
  class PaginationObjectType < BaseObject
    field :total_records, Integer, null: true, description: "Total number of records"
    field :total_pages, Integer, null: true, description: "Total number of pages (based on per page count)" do
      argument :page, Integer, required: false, default_value: 1
      argument :per, Integer, required: false, default_value: NewGraphqlSchema::DEFAULT_PER_PAGE
    end
    field :next_page, Integer, null: true, description: "Next page in set" do
      argument :page, Integer, required: false, default_value: 1
      argument :per, Integer, required: false, default_value: NewGraphqlSchema::DEFAULT_PER_PAGE
    end
    field :previous_page, Integer, null: true, description: "Previous page in set" do
      argument :page, Integer, required: false, default_value: 1
      argument :per, Integer, required: false, default_value: NewGraphqlSchema::DEFAULT_PER_PAGE
    end
  end
end

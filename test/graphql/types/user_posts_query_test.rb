require "test_helper"
require "support/graphql_fragments"
require "new_graphql_schema"

class UserPostsQueryTest < Minitest::Test

  def setup
    @user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 100, user: @user)
    @posts = @user.posts.order(updated_at: :desc)

    @query = <<-'QUERY'
query UserPosts($userId: Int!, $per: Int, $page: Int) {
  user(id: $userId) {
    id
    totalPosts
    posts(per: $per , page: $page) {
      id
      title
      user {
        id
        username
        preferredName
      }
    }
  }
}
QUERY
    @context = {
      current_user: @user,
      params: {}
    }

    @variables = {
      userId: @user.id,
      per: 22,
      page: 2
    }

    @results = NewGraphqlSchema.execute(@query, variables: @variables, context: @context, operation_name: "UserPosts" )

  end

  def teardown

  end

  def test_data_returned_for_successful_query
    assert @results.dig('data'), @results.inspect
  end

  def test_proper_user_used_for_root
    assert_equal @user.id, @results.dig('data', 'user', 'id'), @results.dig('data', 'user').inspect
  end

  def test_total_posts_is_accurate
    assert_equal 100, @results.dig('data', 'user', 'totalPosts'), @results.inspect
  end

  def test_correct_number_of_posts_provided_for_this_page
    assert_equal 22, @results.dig('data', 'user', 'posts').count
  end

  def test_results_start_with_correct_post
    assert_equal @posts[22].id, @results.dig('data', 'user', 'posts', 0, 'id')
  end
end

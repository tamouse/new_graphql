module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserGraphType, null: true, description: "The user logged in, eventually" do
      argument :id, Integer, required: true
    end
    def user(id:)
      User.find_by(id: id)
    end

    field :public_posts, [Types::PostType], null: true, description: "Public Posts" do
      argument :id, Integer, required: false, description: "Single post id", default_value: nil
      argument :ids, String, required: false, description: "Multiple post ids, comma separated", default_value: nil
      argument :search, String, required: false, description: "Search query for title and body", default_value: nil
      argument :since, String, required: false, description: "Return posts updated since date ", default_value: nil
      argument :page, Integer, required: false, default_value: 1, description: "Page number of posts, default 1"
      argument :per, Integer, required: false, default_value: 30, description: "Posts per page, default 30"
    end

    def public_posts(
          id:,
          ids:,
          search:,
          since:,
          page:,
          per:
        )
      Rails.logger.debug ":public_posts(id:, ids:, search:, since:, page:, per:) #{id}, #{ids}, #{search}, #{since}, #{page}, #{per}"

      posts = Post.joins(:user).includes(:user).where(published: true).order(updated_at: :desc)

      if (id.present?)
        posts = posts.where(id: id)
      elsif (ids.present?)
        posts = posts.where(id: ids.split(/ *, */))
      elsif (search.present?)
        posts = posts.where("title LIKE ?", "%#{search}%")
      elsif (since.present?)
        begin
          since_time = Time.parse(since)
          posts = posts.where("posts.updated_at > ?", since_time)
        rescue => e
          Rails.logger.error "Error parsing time since: #{since}"
        end
      end

      posts.page(page).per(per)
    end
  end
end

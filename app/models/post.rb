class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of :title

  def publish!
    self.update(published: true)
  end

end

class Post < ApplicationRecord
  belongs_to :user

  validates_presence_of :title

  scope :published, -> { where(published: true ) }
  scope :drafts, -> { where(published: false ) }

  def publish!
    self.update(published: true)
  end

end

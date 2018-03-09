class Article < ActiveRecord::Base
  belongs_to :user

  scope :published, -> { where.not(published_at: nil) }
  scope :drafts, -> { where(published_at: nil) }
end
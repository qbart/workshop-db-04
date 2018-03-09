class User < ActiveRecord::Base
  has_many :articles

  has_many :published_articles
  has_many :drafts
end
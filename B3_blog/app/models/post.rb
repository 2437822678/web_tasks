class Post < ActiveRecord::Base
  serialize :tags
  has_many :comments
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 5}

end

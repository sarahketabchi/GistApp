class User < ActiveRecord::Base
  attr_accessible :user_name

  validates :user_name, :uniqueness => true

  has_many :gists
end

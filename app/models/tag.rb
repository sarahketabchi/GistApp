class Tag < ActiveRecord::Base
  attr_accessible :topic

  has_many :taggings
  has_many :gists, :through => :taggings
end

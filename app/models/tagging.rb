class Tagging < ActiveRecord::Base
  attr_accessible :gist_id, :tag_id

  validates :gist_id, :presence => true
  validates :tag_id, :presence => true

  belongs_to :tag
  belongs_to :gist
end

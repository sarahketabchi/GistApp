class Gist < ActiveRecord::Base
  attr_accessible :title, :user_id, :files_attributes, :tag_ids

  validates :title, :presence => true
  belongs_to :user
  has_many :files, :class_name => "GistFile", :inverse_of => :gist

  has_many :favorites
  has_many :taggings
  has_many :tags, :through => :taggings

  accepts_nested_attributes_for :files

end

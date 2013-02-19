class Gist < ActiveRecord::Base
  attr_accessible :title, :user_id, :files_attributes

  validates :title, :presence => true
  belongs_to :user
  has_many :files, :class_name => "GistFile", :inverse_of => :gist

  has_many :favorites

  accepts_nested_attributes_for :files

end

class Gist < ActiveRecord::Base
  attr_accessible :title, :user_id

  belongs_to :user
  has_many :files, :class_name => "GistFile", :inverse_of => :gist
end

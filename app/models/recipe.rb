class Recipe < ApplicationRecord
  belongs_to :user

  # attr_accessor :title, :instructions, :user_id

  validates_presence_of :title
  validates_length_of :instructions, :minimum => 50
end

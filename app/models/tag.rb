class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags
  has_many :activities, through: :activity_tags
  has_many :activity_tags
end

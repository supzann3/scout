class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :itineraries
  has_many :activities, through: :itineraries
  has_many :user_tags
  has_many :tags, through: :user_tags
end

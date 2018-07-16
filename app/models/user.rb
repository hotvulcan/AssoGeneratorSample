class User < ApplicationRecord
  has_many :user_school
  has_many :schools, :through => :user_school
  belongs_to :house
  has_many :doc
  has_one :avatar
  
end

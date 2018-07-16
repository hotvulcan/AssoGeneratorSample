class School < ApplicationRecord
  has_many :user_school
  has_many :users, :through => :user_school
end

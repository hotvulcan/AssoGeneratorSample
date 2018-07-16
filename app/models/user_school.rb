class UserSchool < ApplicationRecord
  belongs_to :User
  belongs_to :School
end

class Member < ApplicationRecord
  has_many :headings
  has_many :friends
end

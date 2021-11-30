class Book < ApplicationRecord
  validates :author, presence: :true
end

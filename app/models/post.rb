class Post < ApplicationRecord
  include ::PostsHelper
  validates :author,  presence: :true

  def tester
    p "*"*100
    p helper3
  end
end

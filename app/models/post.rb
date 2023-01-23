class Post < ApplicationRecord
  include Moderable
  moderate :body

  validates :body, presence: true
end

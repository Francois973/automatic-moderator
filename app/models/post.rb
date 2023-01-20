class Post < ApplicationRecord
  include Moderable

  validates :body, presence: true
  validates :is_accepted, presence: true
end

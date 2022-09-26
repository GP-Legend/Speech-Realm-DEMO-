class Comment < ApplicationRecord
  belongs_to :topic

  validates :body, presence: true, length: {minimum: 1}

  has_rich_text :body
end

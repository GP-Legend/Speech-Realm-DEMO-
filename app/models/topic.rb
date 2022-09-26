class Topic < ApplicationRecord
  
  has_many :comments, dependent: :destroy

  validates_presence_of :title, length: { minimum: 1}
  validates_presence_of :body, length: { minimum: 1 }
  validates_presence_of :username

  has_rich_text :body
end

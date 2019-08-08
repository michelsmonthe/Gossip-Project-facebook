class Comment < ApplicationRecord
  validates :content,
    presence: true,
    length: { minimum: 5 }

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end

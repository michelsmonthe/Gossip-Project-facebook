class Gossip < ApplicationRecord
  
validates :title,
    presence: true,
    length: { in: 3..30 }
  validates :content,
    presence: true,
    length: { minimum: 5 }

  has_many :join_table_gossips_tags
  has_many :tags, through: :join_table_gossips_tags
  has_many :comments, as: :commentable
  belongs_to :user
end

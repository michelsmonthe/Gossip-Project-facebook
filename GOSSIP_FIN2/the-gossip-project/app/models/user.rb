class User < ApplicationRecord
	
  
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age,
    presence: true,
    numericality: { only_integer: true }
  validates :city, presence: true
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :password, presence: true, length: { minimum: 8 }
  
  belongs_to :city
  has_secure_password
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sent_messages, foreign_key: 'from_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'to_id', class_name: 'PrivateMessage'
end


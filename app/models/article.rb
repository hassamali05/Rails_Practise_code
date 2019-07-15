class Article < ApplicationRecord
	belongs_to :user
	validates :name, presence: true, length: {minimum: 3, maximum: 20}
	validates :authors, presence: true, length: {minimum: 3, maximum: 20}
	validates :description, presence: true, length: {minimum: 3, maximum: 100}	
	validates :user_id, presence: true
end
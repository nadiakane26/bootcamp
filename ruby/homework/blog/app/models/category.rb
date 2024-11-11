class Category < ApplicationRecord
    has_many :articles
    belongs_to :user 
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end

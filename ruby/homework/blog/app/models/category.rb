class Category < ApplicationRecord
    has_many :articles, dependent: :destroy
    belongs_to :user 
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end

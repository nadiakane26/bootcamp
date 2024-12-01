class Category < ApplicationRecord
has_many :articles

   validates :name, presence: true, uniqueness: true
   has_one_attached :image

   validates :image,  presence: true
end

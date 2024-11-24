class Author < ApplicationRecord
    has_many :articles

    has_one_attached :image

    validates :name, presence: true
  validates :bio, presence: true
end

class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :category, optional: true

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  
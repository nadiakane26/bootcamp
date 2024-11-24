class Article < ApplicationRecord

    belongs_to :category, optional: false
    has_many :comments, dependent: :destroy
    belongs_to :author
    belongs_to :user
    
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :author, presence: true
  end
  
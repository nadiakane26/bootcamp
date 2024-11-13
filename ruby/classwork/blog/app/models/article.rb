class Article < ApplicationRecord
    include Visible
  
    belongs_to :category, optional: false
    has_many :comments, dependent: :destroy
    
    validates :status, inclusion: { in: ['public', 'private', 'archived'] }
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  
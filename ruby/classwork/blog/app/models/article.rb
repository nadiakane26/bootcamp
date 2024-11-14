class Article < ApplicationRecord
    include Visible
  
    belongs_to :category, optional: false
    has_many :comments, dependent: :destroy
    belongs_to :author
    
    validates :status, inclusion: { in: ['public', 'private', 'archived'] }
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :author, presence: true
  end
  
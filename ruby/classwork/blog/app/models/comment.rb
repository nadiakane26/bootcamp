class Comment < ApplicationRecord

  belongs_to :article
  has_many :likes, dependent: :destroy
  
  validates :commenter, presence: true
  validates :body, presence: true
end

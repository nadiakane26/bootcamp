class Comment < ApplicationRecord

  # acts_as_votable
  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true
end

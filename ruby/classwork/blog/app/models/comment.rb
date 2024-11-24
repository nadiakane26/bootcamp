class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  
  validates :status, inclusion: { in: ['Public', 'Private', 'Archived'] }
  validates :commenter, presence: true
  validates :body, presence: true
end

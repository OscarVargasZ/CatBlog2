class Article < ApplicationRecord
  include AASM

  aasm do
  end
    has_many :comments, dependent: :destroy
    belongs_to :user
end

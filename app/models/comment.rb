class Comment < ApplicationRecord
  include AASM
    state :active, initial: true
    # state :accepted
    state :inactive

    event :inactive do
      transitions from: :active, to: :inactive
    end

    event :activate do
      transitions from: :activate, to: :active
    end
  aasm do
  end
  belongs_to :article
  has_many :requests, dependent: :destroy
  belongs_to :user
end

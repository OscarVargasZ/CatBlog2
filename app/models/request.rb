class Request < ApplicationRecord
  include AASM
  aasm do
    state :pending_approval, initial: true  
    state :approved
    state :rejected

    event :get_approval do
      transitions from: :active, to: :pending_approval
      transitions from: :rejected, to: :pending_approval
    end

    event :approve do
      transitions from: :rejected, to: :approved
      transitions from: :pending_approval, to: :approved
    end

    event :reject do
      transitions from: :active, to: :rejected
      transitions from: :approved, to: :rejected
      transitions from: :pending_approval, to: :rejected
    end
  end
  belongs_to :user, optional: true
  belongs_to :article, optional: true
  belongs_to :comment, optional: true
end

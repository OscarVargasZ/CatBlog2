class Request < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :article, optional: true
  belongs_to :comment, optional: true

  include AASM
  aasm do
    state :pending_approval, initial: true  
    state :approved
    state :rejected

    event :get_approval do
      transitions from: [:approved , :rejected], to: :pending_approval
    
    end


    event :approve do
      transitions from: [:pending_approval , :rejected], to: :approved

    end

    event :reject do
      transitions from: [:approved,:pending_approval], to: :rejected
    end
  end
end

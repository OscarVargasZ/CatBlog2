class Comment < ApplicationRecord
  include AASM
  aasm do
    state :active, initial: true
    # state :accepted
    state :inactive

    event :inactived do
      transitions from: :active, to: :inactive
    end

    event :activate do
      transitions from: :inactive, to: :active
    end
  end


  belongs_to :article
  has_many :requests, dependent: :destroy
  belongs_to :user
end

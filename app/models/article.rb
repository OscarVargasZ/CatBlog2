class Article < ApplicationRecord
  include AASM
#
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  belongs_to :user
#
#aasm
  aasm do
    state :active
    # state :accepted
    state :inactive, initial: true

    event :inactived do
      transitions from: :active, to: :inactive
    end

    event :activate do
      transitions from: :inactive, to: :active
    end
  end
#
end

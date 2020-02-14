class Request < ApplicationRecord
  include AASM

  aasm do
  end
  belongs_to :user
  belongs_to :article
  belongs_to :comment
end

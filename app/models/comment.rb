class Comment < ApplicationRecord
  include AASM

  aasm do
  end
  belongs_to :article
  belongs_to :user
end

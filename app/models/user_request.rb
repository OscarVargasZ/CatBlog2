class UserRequest < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :requests, dependent: :destroy
end

class User < ApplicationRecord
  include AASM
  aasm do
    state :active, initial: true
    # state :accepted
    state :pending_approval
    state :approved
    state :rejected

    event :get_approval do
      transitions from: :active, to: :pending_approval
      transitions from: :rejected, to: :pending_approval
    end

    event :approve, success: [:notify_approval, :generate_vacancies, :create_internship_course] do
      transitions from: :active, to: :approved
      transitions from: :pending_approval, to: :approved
    end

    event :reject, success: [:notify_rejection] do
      transitions from: :active, to: :rejected
      transitions from: :approved, to: :rejected
      transitions from: :pending_approval, to: :rejected
    end

    event :activate do
      transitions from: :rejected, to: :active
      transitions from: :approved, to: :active
      transitions from: :pending_approval, to: :active
    end
  end
  rolify :before_add => :before_add_method
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :requests, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def before_add_method(role)
  # do something before it gets added
  end
end

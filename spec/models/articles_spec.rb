require 'rails_helper'

RSpec.describe Article, type: :model do
    context '' do
        it {should have_many(:comments)}
    end
end

require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'RelationShips' do
    it {should belong_to(:resource).optional(true)}
  end
end


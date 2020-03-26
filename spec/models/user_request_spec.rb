
require 'rails_helper'

RSpec.describe UserRequest, type: :model do
    context 'RelationShips' do
        it {should belong_to(:user)}
        it {should belong_to(:request)}
    #    it {should have_many(:requests)}
    end
end
require 'rails_helper'

RSpec.describe Comment, type: :model do
    context 'RelationShips' do
        it {should have_many(:requests)}
        it {should belong_to(:user)}
        it {should belong_to(:article)}
    end
    context 'request status change' do
        let(:comment) { FactoryBot.build(:comment) }
        it {expect(comment).to transition_from(:inactive).to(:active).on_event(:activate)}
        it {expect(comment).to transition_from(:active).to(:inactive).on_event(:inactived)}
    end
end
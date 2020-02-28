require 'rails_helper'

RSpec.describe Request, type: :model do
  context 'RelationShips' do
    it {should have_many(:comments)}
    it {should have_many(:requests)}
    it {should belong_to(:user)}
  end
  context 'request status change' do
      let(:article) { FactoryBot.build(:article) }
      it {expect(article).to transition_from(:inactive).to(:active).on_event(:activate)}
      it {expect(article).to transition_from(:active).to(:inactive).on_event(:inactived)} 
  end
end

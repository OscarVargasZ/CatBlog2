require 'rails_helper'

RSpec.describe User, type: :model do
    context 'RelationShips' do
        it {should have_many(:comments)}
        it {should have_many(:articles)}
        it {should have_many(:requests)}
    end
    context 'request status change' do
        let(:user) { FactoryBot.build(:user) }
        it {expect(user).to transition_from(:active).to(:pending_approval).on_event(:get_approval)}
        it {expect(user).to transition_from(:rejected).to(:pending_approval).on_event(:get_approval)}

        it {expect(user).to transition_from(:active).to(:approved).on_event(:approve)}
        it {expect(user).to transition_from(:pending_approval).to(:approved).on_event(:approve)}

        it {expect(user).to transition_from(:active).to(:rejected).on_event(:reject)}
        it {expect(user).to transition_from(:approved   ).to(:rejected).on_event(:reject)}
        it {expect(user).to transition_from(:pending_approval).to(:rejected).on_event(:reject)}


        it {expect(user).to transition_from(:pending_approval).to(:active).on_event(:activate)}
        it {expect(user).to transition_from(:rejected).to(:active).on_event(:activate)}
        it {expect(user).to transition_from(:approved).to(:active).on_event(:activate)}
    end
end
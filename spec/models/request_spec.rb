require 'rails_helper'

RSpec.describe Request, type: :model do
    context 'RelationShips' do
        it {should belong_to(:comment).optional(true)}
        it {should belong_to(:user).optional(true)}
        it {should belong_to(:article).optional(true)}
    end
    context 'request status change' do
        let(:request) { FactoryBot.build(:request) }

        it {expect(request).to transition_from(:approved).to(:pending_approval).on_event(:get_approval)}
        it {expect(request).to transition_from(:rejected).to(:pending_approval).on_event(:get_approval)}


        it {expect(request).to transition_from(:rejected).to(:approved).on_event(:approve)}
        it {expect(request).to transition_from(:pending_approval).to(:approved).on_event(:approve)}
        

        it {expect(request).to transition_from(:approved).to(:rejected).on_event(:reject)}
        it {expect(request).to transition_from(:pending_approval).to(:rejected).on_event(:reject)}
    end
end
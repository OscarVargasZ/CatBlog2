require 'rails_helper'

RSpec.describe Article, type: :model do
    context '' do
        let(:article) { FactoryBot.build(:article) }
        it {
            expect(article).to_not be nil
        }
          
    end
end

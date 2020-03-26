RSpec.describe CommentPolicy, type: :policy do
  let(:user) { User.new }
  subject { described_class.new(user, article) }

  let(:article) { Article.create }

  context 'not user' do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'normal user' do
    let(:user) { User.create(administrator: true) }
    it { is_expected.to permit_actions([:show, :destroy]) }
  end

  context 'being an administrator' do
    let(:user) { User.create(administrator: true) }
    it { is_expected.to permit_actions([:show, :destroy]) }
  end
end

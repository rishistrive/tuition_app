require 'rails_helper'

RSpec.describe Teacher, type: :model do
  subject { described_class.new }

  describe 'associations' do
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:comments).dependent(:destroy).with_foreign_key(:user_id) }
  end
end

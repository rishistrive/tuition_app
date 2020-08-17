require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { described_class.new }

  describe 'associations' do
    it { is_expected.to have_many(:course_join_requests).conditions(approve: true) }
    it { is_expected.to have_many(:students).through(:course_join_requests) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to(:teacher) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_datetime) }
    it { is_expected.to validate_presence_of(:end_datetime) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe '.scope' do
    before do
      @upcoming = create_list(:course, 3, :upcoming)
      @ended = create_list(:course, 3, :ended)
      @running = create_list(:course, 3, :running)
    end

    it '.upcoming' do
      expect(described_class.upcoming.ids).to eq(@upcoming.map(&:id))
    end

    it '.ended' do
      expect(described_class.ended.ids).to eq(@ended.map(&:id))
    end

    it '.running' do
      expect(described_class.running.ids).to eq(@running.map(&:id))
    end
  end
end

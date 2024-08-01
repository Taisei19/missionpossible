require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe 'validations' do
    it 'goalなしでは登録できない' do
      mission = Mission.new(goal: nil, mission1: 'Test Mission 1', mission2: 'Test Mission 2', mission3: 'Test Mission 3')
      expect(mission).not_to be_valid
      expect(mission.errors[:goal]).to include("can't be blank")
    end

    it 'mission1なしでは登録できない' do
      mission = Mission.new(goal: 'Test Goal', mission1: nil, mission2: 'Test Mission 2', mission3: 'Test Mission 3')
      expect(mission).not_to be_valid
      expect(mission.errors[:mission1]).to include("can't be blank")
    end

    it 'mission2なしでは登録できない' do
      mission = Mission.new(goal: 'Test Goal', mission1: 'Test Mission 1', mission2: nil, mission3: 'Test Mission 3')
      expect(mission).not_to be_valid
      expect(mission.errors[:mission2]).to include("can't be blank")
    end

    it 'mission3なしでは登録できない' do
      mission = Mission.new(goal: 'Test Goal', mission1: 'Test Mission 1', mission2: 'Test Mission 2', mission3: nil)
      expect(mission).not_to be_valid
      expect(mission.errors[:mission3]).to include("can't be blank")
    end
  end
end
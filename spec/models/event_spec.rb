require 'rails_helper'

describe Event, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:category) }
  it { should belong_to(:category) }
end

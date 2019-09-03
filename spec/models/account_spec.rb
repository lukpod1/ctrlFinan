require 'rails_helper'

RSpec.describe Account, type: :model do
  # Association test
  # ensure Account model belongs to a single User record.
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns balance and name are present before saving
  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:name) }
end

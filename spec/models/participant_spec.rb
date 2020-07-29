require 'rails_helper'

RSpec.describe Participant, type: :model do
  # Validation test
  # ensure column email is present before saving
  it { should validate_presence_of(:email) }
end
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should fail with empty name' do
  	user = User.new

  	expect(user.invalid?).to eq true
  end
end

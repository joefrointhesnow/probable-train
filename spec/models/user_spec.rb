require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    user = User.new(email: 'test@test.com', password: 'testtest')
    expect(user).to be_valid
  end
  
  it "is not valid without an email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a password" do
    user= User.new(password: nil)
    expect(user).to_not be_valid
  end
  it "sets compensation above compensation limit" do
    user = User.new
    user.set_compensation(600)
    expect(user.compensation).to eq(500)
  end
  
  it "sets acceptable compensation" do
    user = User.new
    user.set_compensation(300)
    expect(user.compensation).to eq(300)
  end
end



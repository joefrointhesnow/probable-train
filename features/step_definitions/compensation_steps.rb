Given("I am setting compensation to {int}") do  |input|
  @user = User.new
  @user.set_compensation(input.to_i)
end

Then("compensation should be {int}") do |target_value|
  expect(@user.compensation).to eq(target_value.to_i)
end



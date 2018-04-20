require 'rails_helper'

RSpec.describe User, :type => :model do
    describe 'cashing out' do
            
        it "sends the email" do
            email = email.sent(email: 'test@test.com')
            expect(page).to have_text("Email has been sent!")
        end
        
        it "does not send the email" do
            email = email.sent(email: 'test@test.com')
            expect(email). to_not be_sent
        end 
        
        it "generates a confirmation number" do
            confirm = User.new(number: '1234567')
            expect(confirm). to be_valid
        end
        
        it "does not generate a confirmation number" do
            confirm = User.new(number: '1234567')
            expect(confirm).to_not be_valid
        end
    end 
end 

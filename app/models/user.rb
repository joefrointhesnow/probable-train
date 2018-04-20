#this is the user model
#it enforces the compensation limit and handles certain elements of devise
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  attr_reader :compensation
  def set_compensation(new_compensation)
    compensation_limit = 500
    if new_compensation > compensation_limit
      @compensation = compensation_limit
    else
      @compensation = new_compensation
    end
  end


end

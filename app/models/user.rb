class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name,:captcha, :captcha_key
  apply_simple_captcha
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
end

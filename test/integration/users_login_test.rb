require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  # test 'login with invalid information' do
  #   get login_path
  #   assert_template 'sessions/new'
  #   post login_path, session: { email: "", password: "" }
  #   assert_template 'sessions/new'
  #   assert_not flash.empty?
  #   get root_path
  #   assert flash.empty?
  # end 

end

# to use : bundle exec rake test TEST=test/integration/users_login_test.rb
# replace flash with flash.now - disappears, wont' persist to next page 
#  like this:       flash.now[:danger] = 'Invalid email/password combination'

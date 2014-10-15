require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'contact me' do
    email = UserMailer.contact_me_email(contacts(:contact)).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal [users(:jimbo).email], email.from
    assert_equal ['reedness3000@gmail.com'], email.to
    assert_equal 'Contact request', email.subject
  end
end

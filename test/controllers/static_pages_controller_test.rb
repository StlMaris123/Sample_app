require 'test_helper'
class StaticPagesControllerTest < ActionController::TestCase
def setup
	@base_title = "Ruby on Rails Tutorial Sample App"
end



  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end
test "should get contact" do
	get :contact
	assert_response :success
	assert_select "title", "Contact | #{@base_title}"
	assert_select "p", "Its lunch time!"
end
test "should get resume" do
  get :resume
  assert_response  :success
  assert_select "h3", "Academic Qualification"
  assert_select "title", "Resume | #{@base_title}"
  assert_select "td", "Maseno University- Maseno Kenya"
  assert_select "h4", "Community engagement."
  assert_select "td", "year"
  assert_select "li", "Java"
end
end
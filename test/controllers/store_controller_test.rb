require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'MyString'
    assert_select '.price', /[\u20B9][ ][0-9]+\.[0-9]{2}/
  end

end

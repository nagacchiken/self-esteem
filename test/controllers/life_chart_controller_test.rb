require 'test_helper'

class LifeChartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get life_chart_index_url
    assert_response :success
  end

end

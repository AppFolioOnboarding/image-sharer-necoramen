require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def successfully_visit_homepage
    get root_path
    assert_response :ok
  end
end

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

  test 'display all images on homepage' do
    url1 = 'https://google.com'
    url2 = 'https://appfolio.com'
    Image.create!(url: url1)
    Image.create!(url: url2)
    get root_path
    assert_response :ok
    assert_select('img[src=?]', url1)
    assert_select('img[src=?]', url2)
  end
end

require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  valid_url = 'https://robbreport.com/wp-content/uploads/2019/05/sbsailingcenter_sbinnview_photobyblakebronstad.jpg.jpg?w=1000'
  invalid_url = valid_url[6..valid_url.length]

  test 'visit /image/new' do
    get new_image_path
    assert_response :ok
    assert_select('h1', 'Submit a new link')
  end

  test 'display an image' do
    image = Image.create!(url: valid_url)
    get image_path(image)
    assert_response :ok
    assert_select('h1', "Showing image #{image.id}")
    assert_select('img[src=?]', valid_url)
  end

  test 'create an image with valid url' do
    post '/images', params: { image: { url: valid_url } }
    assert_response :redirect
    follow_redirect!
    assert_response :ok
    assert_select('img[src=?]', valid_url)
  end

  test 'create an image with invalid url' do
    post '/images', params: { image: { url: invalid_url } }
    assert_response :ok
    assert_select('.image-error-message', 'Url is not a valid URL')
  end
end

require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  valid_url = 'https://robbreport.com/wp-content/uploads/2019/05/sbsailingcenter_sbinnview_photobyblakebronstad.jpg.jpg?w=1000'
  invalid_url = valid_url[6..valid_url.length]
  tag1 = 'abc'
  tag2 = 'def'
  tag3 = 'ghi'

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

  test 'display an image with tags' do
    image = Image.create!(url: valid_url, tag_list: [tag1, tag2, tag3])
    assert_equal(image.id.nil?, false)
    get image_path(image)
    assert_response :ok
    assert_select('h1', "Showing image #{image.id}")
    assert_select('img[src=?]', valid_url)
    assert_select('span', "\##{tag1}")
    assert_select('span', "\##{tag2}")
    assert_select('span', "\##{tag3}")
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
    assert_select('div', 'Url is not a valid URL')
  end

  test 'submit an image with tags' do
    post '/images', params: { image: { url: valid_url, tag_list: "#{tag1},#{tag2}  ,  #{tag3}" } }
    assert_response :redirect
    follow_redirect!
    assert_select('img[src=?]', valid_url)
  end

  test 'visit index path of images' do
    get images_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select('h1', 'Home')
  end
end

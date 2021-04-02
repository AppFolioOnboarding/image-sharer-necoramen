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
    assert_not(image.id.nil?)
    get image_path(image)
    assert_response :ok
    assert_select('h1', "Showing image #{image.id}")
    assert_select('img[src=?]', valid_url)
    [tag1, tag2, tag3].each do |tag|
      assert_select('.image-tag[href=?]', images_path(tag: tag), { text: "\##{tag}" })
    end
  end

  test 'show images by tag' do
    url1 = "#{valid_url}1"
    url2 = "#{valid_url}2"
    url3 = "#{valid_url}3"
    Image.create!(url: url1, tag_list: [tag1, tag2])
    Image.create!(url: url2, tag_list: [tag2, tag3])
    Image.create!(url: url3, tag_list: [tag3, tag1])

    get images_path(tag: tag1)
    assert_response :ok
    assert_select('img[src=?]', url1)
    assert_select('img[src=?]', url3)
    assert_select('img[src=?]', url2, count: 0)
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

  test 'submit an image with tags' do
    post '/images', params: { image: { url: valid_url, tag_list: "#{tag1},#{tag2}  ,  #{tag3}" } }
    assert_response :redirect
    follow_redirect!
    assert_select('img[src=?]', valid_url)
  end

  test 'visit index path of images' do
    url1 = 'https://google.com'
    url2 = 'https://appfolio.com'
    Image.create!(url: url1)
    Image.create!(url: url2)
    get images_path
    assert_response :ok
    assert_select('img[src=?]', url1)
    assert_select('img[src=?]', url2)
  end

  test 'delete an existing image' do
    image = Image.create!(url: valid_url, tag_list: [tag1, tag2])
    get image_path(image)
    assert_response :ok

    delete image_path(image)
    assert_redirected_to images_path
  end
end

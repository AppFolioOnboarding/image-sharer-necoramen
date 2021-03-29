require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'successfully saves an image' do
    image = Image.new
    image.url = 'https://google.com'
    assert_difference('Image.count', 1) do
      image.save!
    end
  end

  test 'tries to save an image with invalid url' do
    image = Image.new
    image.url = 'google.com'
    assert_not_predicate(image, :valid?)
  end

  test 'save an image with tags' do
    image = Image.new
    image.url = 'https://google.com'
    image.tag_list.add('tag0', 'tag1')
    assert_difference 'Image.count', 1 do
      image.save!
    end
    id = image.id
    assert_equal(id.nil?, false)
    image = Image.find(id)
    assert_equal(image.tags.length, 2)
    assert_equal(image.tags[0].name, 'tag0')
    assert_equal(image.tags[1].name, 'tag1')
  end
end

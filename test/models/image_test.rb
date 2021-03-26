require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "successfully saves an image" do
    image = Image.new
    image.url = 'https://google.com'
    assert_difference('Image.count', 1) do
      image.save!
    end
  end

  test 'tries to save an image with invalid url' do
    image = Image.new
    image.url = 'google.com'
    refute_predicate(image, :valid?)
  end
end

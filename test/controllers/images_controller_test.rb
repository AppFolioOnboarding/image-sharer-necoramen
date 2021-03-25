require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'get the new page' do
    get new_image_path
    assert_response :ok
  end

  test 'submit blank link' do
    assert_raise ActiveRecord::RecordInvalid do
      Image.create!(url: '')
    end
  end

  test 'submit valid link' do
    img = Image.create!(url: 'https://ssl.gstatic.com/calendar/images/dynamiclogo_2020q4/calendar_25_2x.png#')
    get image_path(img.id)
    assert_response :ok
  end

  test 'visit homepage' do
    get root_path
    assert_response :ok
  end

  test 'visit /images' do
    get images_path
    # should redirect to root_path
    assert_response :redirect
  end
end

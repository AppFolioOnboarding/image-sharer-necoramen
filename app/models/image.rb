class Image < ApplicationRecord
  validate :url_link_to_valid_image

  private

  def url_link_to_valid_image
    if !url.present?
      errors.add(:url, 'cannot be empty')
    elsif !obj_is_valid_image?(url)
      errors.add(:url, 'is not valid')
    end
  end

  def obj_is_valid_image?(url)
    url.present? && url.length > 4
    # TODO: check if url points to an image
  end
end

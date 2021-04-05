class Image < ApplicationRecord
  validates :url, url: { message: 'must be a valid URL' }
  acts_as_taggable_on :tags
end

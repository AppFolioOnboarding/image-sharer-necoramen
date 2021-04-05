module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '.image-card-list', item_locator: '.image-card', contains: ImageCard do
        def view!
          node.find('.image-link').click
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? { |image| image.url == url && (tags.nil? || image.tags.sort == tags.sort) }
      end

      def clear_tag_filter!
        node.click_on('All images')
        window.change_to(IndexPage)
      end
    end
  end
end

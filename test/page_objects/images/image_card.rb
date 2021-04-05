module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('.image-tag').map(&:text).map { |t| t[1...t.length] }
      end

      def click_tag!(tag_name)
        node.all('.image-tag').find { |tag| tag.text == "##{tag_name}" }.click
        window.change_to(IndexPage)
      end
    end
  end
end

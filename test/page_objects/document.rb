module PageObjects
  class Document < AePageObjects::Document
    def flash_message(message_type)
      node.find(".js-flash-#{message_type}").text
    end
  end
end

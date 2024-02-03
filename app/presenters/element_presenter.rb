class ElementPresenter
    attr_reader :element
  
    def initialize(element)
        @element = element
    end
  
    def error_messages
        return unless element.errors.any?
    
        "<div id='error_explanation'>
            <h2>Error:</h2>
            <ul>
            #{error_messages_list}
            </ul>
        </div>".html_safe
    end

    def new_or_edit
        element.new_record? ? I18n.t('button.create') : I18n.t('button.update')
    end
  
    private
  
    def error_messages_list
        element.errors.full_messages.map { |message| "<li>#{message}</li>" }.join("\n")
    end

  end
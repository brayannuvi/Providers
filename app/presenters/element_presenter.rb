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

    def new_or_edit_button
        element.new_record? ? I18n.t('button.create') : I18n.t('button.update')
    end
  
    def new_or_edit_form
        return unless element.new_record? 
        "<%= form.fields_for :accounts do |accout_form| %>
        <div>
            <%= accout_form.label :bank_id %>
            <%= accout_form.collection_select :bank_id, Bank.all, :id, :name %>
            <div>
            </div>
            <%= accout_form.label :bank_account_number %>
            <%= accout_form.text_field :bank_account_number %>
            </div>
        <% end %>".html_safe
    end

    private
  
    def error_messages_list
        element.errors.full_messages.map { |message| "<li>#{message}</li>" }.join("\n")
    end

  end
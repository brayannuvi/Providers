# app/presenters/bank_presenter.rb
class BankPresenter
    attr_reader :bank
  
    def initialize(bank)
        @bank = bank
    end
  
    def error_messages
        return unless bank.errors.any?
    
        "<div id='error_explanation'>
            <h2>Error:</h2>
            <ul>
            #{error_messages_list}
            </ul>
        </div>".html_safe
    end

    def new_or_edit
        bank.new_record? ? I18n.t('activerecord.attributes.bank.create_bank') : I18n.t('activerecord.attributes.bank.update_bank')
    end
  
    private
  
    def error_messages_list
        bank.errors.full_messages.map { |message| "<li>#{message}</li>" }.join("\n")
    end

  end
class BanksController < ApplicationController
    def index
        @banks = Bank.paginate(page: params[:page], per_page: 10)
    end
    
    def show
        @bank = Bank.find(params[:id])
    end
    
    def new
        @bank = Bank.new
    end

    def create
        @bank = Bank.create(bank_params)

        if @bank.save
            flash[:notice] = "#{@bank.name}#{t('activerecord.attributes.bank.create.success_message')}"
            redirect_to new_bank_path, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @bank = Bank.find(params[:id])
    end

    def update
        @bank = Bank.find(params[:id])

        if @bank.update(bank_params)
            flash[:notice] = "#{@bank.name}#{t('activerecord.attributes.bank.update.success_message')}"
            redirect_to edit_bank_path(@bank.id), status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bank = Bank.find(params[:id])
        @bank.destroy
        redirect_to banks_path, status: :see_other
    end

    private

    def bank_params
        params.require(:bank).permit(:name)
    end

end

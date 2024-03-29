class SuppliersController < ApplicationController
    def index
        @suppliers = Supplier.empty_fields_checked.joins(:accounts).merge(Account.empty_fields_checked).order(id: :asc).paginate(page: params[:page], per_page: 10)
    end
    
    def show
        @supplier = supplier.find(params[:id])
    end
    
    def new
        @supplier = Supplier.new
        @supplier.accounts.build
        @header = t('headers.new')
    end

    def create
        @supplier = Supplier.new(supplier_params)

        if @supplier.save
            flash[:notice] = "#{@supplier.name}#{t('activerecord.attributes.supplier.create.success_message')}"
            redirect_to new_supplier_path, status: :see_other
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @supplier = Supplier.find(params[:id])
        @header = t('headers.edit')
    end

    def update
        @supplier = Supplier.find(params[:id])

        if @supplier.update(supplier_params)
            flash[:notice] = "#{@supplier.name}#{t('activerecord.attributes.supplier.update.success_message')}"
            redirect_to edit_supplier_path(@supplier.id), status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @supplier = Supplier.find(params[:id])

        begin
            @supplier.destroy
            flash[:notice] = "#{@supplier.name}#{t('activerecord.attributes.supplier.destroy.success_message')}"
        rescue ActiveRecord::InvalidForeignKey
            flash[:notice] = t('errors.delete_supplier');
        end
        redirect_to suppliers_path, status: :see_other
    end

    private

    def supplier_params
        params.require(:supplier).permit(:name, :nit, :contact_person_name, :contact_person_number, accounts_attributes: [:id, :bank_account_number, :_destroy, :bank_id])
    end

end

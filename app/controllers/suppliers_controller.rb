class SuppliersController < ApplicationController
    def index
        @suppliers = Supplier.paginate(page: params[:page], per_page: 10)
    end
    
    def show
        @supplier = supplier.find(params[:id])
    end
    
    def new
        @supplier = Supplier.new
        @supplier.accounts.build
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
        @supplier.destroy
        redirect_to suppliers_path, status: :see_other
    end

    private

    def supplier_params
        params.require(:supplier).permit(:name, :nit, :contact_person_name, :contact_person_number, accounts_attributes: [:bank_account_number, :_destroy, :bank_id])
    end

end
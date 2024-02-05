class PagesController < ApplicationController
  def dashboard
    @suppliers_amount = Supplier.all.size
    @banks_amount = Bank.all.size
  end
end

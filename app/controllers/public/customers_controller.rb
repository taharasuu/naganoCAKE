class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to public_customer_path
  end

  def confirm
   
  end

  def withdrow
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
    end

end

module Clients
  class SuscriptorsController < ApplicationController
    layout 'clients/application'
    
    def create
      @suscriptor = SuscriptorCustomer.new(params_suscriptor)
      if @suscriptor.save
        flash[:success] = t('.success')
        redirect_to clients_root_path
      else
        flash[:alert] = @suscriptor.errors.full_messages.join(' - ')
        redirect_to clients_root_path
      end
    end

    def params_suscriptor
      params.require(:suscriptor_customer).permit(:email)
    end
  end
end

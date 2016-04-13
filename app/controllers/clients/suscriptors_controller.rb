module Clients
  class SuscriptorsController < ApplicationController
    layout 'clients/application'

    def create
      @suscriptor = SuscriptorCustomer.new(params_suscriptor)
      if @suscriptor.save
        flash[:success] = t('.success')
      else
        flash[:alert] = @suscriptor.errors.full_messages.join(' - ')
      end
      redirect_to clients_root_path
    end

    def params_suscriptor
      params.require(:suscriptor_customer).permit(:email)
    end
  end
end

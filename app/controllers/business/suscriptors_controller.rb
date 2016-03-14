module Business
  class SuscriptorsController < ApplicationController
    def create
      @suscriptor = Suscriptor.new(params_suscriptor)
      if @suscriptor.save
        flash[:success] = t('.success')
        redirect_to business_root_path
      else
        flash[:alert] = @suscriptor.errors.full_messages.join(' - ')
        redirect_to business_root_path
      end
    end

    def params_suscriptor
      params.require(:suscriptor).permit(:email)
    end
  end
end

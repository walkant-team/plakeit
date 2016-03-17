module Business
  class SuscriptorsController < ApplicationController
    layout 'business/application'

    def new
      @suscriptor = SuscriptorBusiness.new
    end

    def create
      @suscriptor = SuscriptorBusiness.new(params_suscriptor)
      if @suscriptor.save
        flash[:success] = t('.success')
        redirect_to business_root_path
      else
        render :new
      end
    end

    def params_suscriptor
      params.require(:suscriptor_business).permit(:email, :fullname, :name_business, :phone)
    end
  end
end

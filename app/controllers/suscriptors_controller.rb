class SuscriptorsController < ApplicationController
  def create
    @suscriptor = Suscriptor.new(params_suscriptor)
    if @suscriptor.save
      flash[:success] = 'Se ha suscrito correctamente'
      redirect_to root_path
    else
      flash[:alert] = 'Ingrese su correo por favor.'
      redirect_to root_path
    end
  end

  def params_suscriptor
    params.require(:suscriptor).permit(:email)
  end
end

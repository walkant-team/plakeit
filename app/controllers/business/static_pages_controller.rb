module Business
  class StaticPagesController < ApplicationController
    layout 'business/application'

    def index
      @suscriptor = Suscriptor.new
    end
  end
end

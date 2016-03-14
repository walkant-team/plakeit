class StaticPagesController < ApplicationController
  def index
    @suscriptor = Suscriptor.new
  end
end

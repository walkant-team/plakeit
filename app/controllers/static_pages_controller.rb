class StaticPagesController < ApplicationController
  def index
    @suscriptor = SuscriptorCustomer.new
  end
end

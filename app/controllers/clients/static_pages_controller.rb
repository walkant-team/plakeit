module Clients
  class StaticPagesController < ApplicationController
    layout 'clients/application'
    def index
      @suscriptor = SuscriptorCustomer.new
    end
  end
end

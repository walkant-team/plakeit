class ScrappersController < ApplicationController
  before_action :set_scrapper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /scrappers
  # GET /scrappers.json
  def index
    @events = Event.all
  end

  # GET /scrappers/1
  # GET /scrappers/1.json
  def show
  end

  # GET /scrappers/new
  def new
    @event = Event.new
  end

  # GET /scrappers/1/edit
  def edit
  end

  # POST /scrappers
  # POST /scrappers.json
  def create
    @event = Event.new(scrapper_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Scrapper was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrappers/1
  # PATCH/PUT /scrappers/1.json
  def update
    respond_to do |format|
      if @event.update(scrapper_params)
        format.html { redirect_to @event, notice: 'Scrapper was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrappers/1
  # DELETE /scrappers/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to scrappers_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapper
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapper_params
      params.fetch(:scrapper, {})
    end

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == 'admin' && password == 'Scr4pp3r5'
      end
    end
end

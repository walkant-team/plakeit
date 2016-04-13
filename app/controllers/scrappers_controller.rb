class ScrappersController < ApplicationController
  before_action :authenticate
  before_action :set_scrapper, only: [:show, :edit, :update, :destroy]

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
    @event = PublicEvent.new
  end

  # GET /scrappers/1/edit
  def edit
  end

  # POST /scrappers
  # POST /scrappers.json
  def create
    @event = PublicEvent.new(scrapper_params)
    @event.manual = false
    respond_to do |format|
      if @event.save
        format.html { redirect_to scrappers_path, notice: 'Scrapper was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /scrappers/1
  # PATCH/PUT /scrappers/1.json
  def update
    respond_to do |format|
      if @event.update(scrapper_params)
        format.html { redirect_to scrappers_path, notice: 'Scrapper was successfully updated.' }
      else
        format.html { render :edit }
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
    params.fetch(:public_event, {}).permit(:title, :start_at, :end_at, :address, :location,
                                           :latitude, :longitude, :description, :image,
                                           :remote_image_url, :category_id)
  end

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'Scr4pp3r5'
    end
  end
end

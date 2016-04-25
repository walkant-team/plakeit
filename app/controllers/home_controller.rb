class HomeController < ApplicationController
  def index
    events = PublicEvent.actives.search(params[:search])
    category = Category.find_by(name: params[:category]) if params[:category]
    @public_events = events.not_weekly.by_category(category).page(params[:page]).per(9)
    @weekly_events = events.weekly.by_category(category)
  end
end

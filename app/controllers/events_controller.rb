class EventsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: [:create, :batch_update]

  # GET - events_url
  def index
    @events = current_user.events.this_month
  end

  # POST - events_url
  def create

  end

  # POST - batch_update_events_url
  def batch_update
    #called for all db actions
    text = params["text"]
    start_date = params["start_date"]
    end_date = params["end_date"]
    details = params["details"]

    @mode = params["!nativeeditor_status"]
    @id = params["id"]
    @tid = @id

    case @mode
      when "inserted"
        n_rec = current_user.events.new
        n_rec.name = text
        n_rec.start = start_date
        n_rec.end = end_date
        n_rec.details = details
        n_rec.save!

        @tid = n_rec.id
      when "deleted"
        n_rec = current_user.events.find(@id)
          n_rec.destroy
      when "updated"
        n_rec = current_user.events.find(@id)
        n_rec.name = text
        n_rec.start = start_date
        n_rec.end = end_date
        n_rec.save!
    end
  end
end

class HomeController < ApplicationController
  before_filter :authenticate_user!

  # GET -
  def show

  end
end

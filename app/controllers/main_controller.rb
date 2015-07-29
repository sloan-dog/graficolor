class MainController < ApplicationController

  def index
    @paints = Paint.all
  end

end

class PaintsController < ApplicationController
include gon

gon.your_int = @your_int
  def index
    @paints = Paint.all
    gon.paints = @paints
  end

  def new
    @paint = Paint.new
  end

  def create
    @paint = Paint.create paint_params
  end

  def paint_params
    params.require(:paint).permit(:name,:component1,:brand_id, :id)
  end

end


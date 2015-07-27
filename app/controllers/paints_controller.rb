class PaintsController < ApplicationController
  def index
    @paints = Paint.all
  end

  def new
    @paint = Paint.new
  end

  def create
    @paint = Paint.create paint_params
  end

  def paint_params
    params.require(:paint).permit(:name,:component1,:brand_id)
  end

end


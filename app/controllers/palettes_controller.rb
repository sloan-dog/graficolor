class PalettesController < ApplicationController
  def new
    @palette = Palette.new
  end

  def create
    @palette.create palette_params
  end

  def show
  end

  def destroy
  end

  def index

  end

  def palette_params

  end

end

class PalettesController < ApplicationController


  def new
    @palette = Palette.new
    @paints = Paint.all
  end

  def create
    @palette = @current_user.palettes.create(palette_params)
    if @palette.save
      redirect_to palettes_path
    else
      render :new
    end
  end

  def index
    @palettes = current_user.palettes.all
    # binding.pry
  end


  def show
  end

  def destroy
  end

  private

  def palette_params
    params.require(:palette).permit(:name, :description, :paintchoices)
  end

end

class PalettesController < ApplicationController


  def new
    @palette = Palette.new
    @paints = Paint.all
  end

  def create
    # below I pass in a string sent from client side and seperate it into an array

    pc = params[:palette][:paintchoices].split(",").map { |p| p.to_i }
    @palette = @current_user.palettes.create(palette_params)
    pc.each do |p|
      @palette.paints << Paint.find_by_id(p)
    end
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

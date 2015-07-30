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

  def edit
    @palette = current_user.palettes.find(params[:id])
    @paints  = Paint.all
  end

  def update
    @palette = current_user.palettes.update(params[:id], palette_params)
    redirect_to root_path
  end


  def show
  end

  def destroy
    @palette = current_user.palettes.find(params[:id]).destroy
    redirect_to palettes_path
  end

  private

  def palette_params
    params.require(:palette).permit(:name, :description, :paintchoices, :id)
  end

end

class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
    # render('new')
  end

  def create
    # byebug
    @sea = Sea.new(sea_params)
    if @sea.save
      redirect_to(seas_path)
    else
      render('new')
    end
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])

    if @sea.update_attributes(sea_params)
      redirect_to(sea_path(@sea))
    else
      render('edit')
    end
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
    redirect_to(seas_path)
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
